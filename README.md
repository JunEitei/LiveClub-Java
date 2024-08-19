
# 古典的なマイクロサービスアーキテクチャ

## SpringBoot 2.7.18 ベース

| コンポーネントタイプ  | コンポーネント名 | 説明                                      | 依存関係                   | デプロイ方法        |
|----------------------|------------------|-------------------------------------------|---------------------------|-------------------|
| 登録・設定センター    | Nacos            | サービスの登録と発見のセンター            | -                         | Docker Compose    |
| ゲートウェイマイクロサービス | Gateway         | リクエストのルーティングと負荷分散を処理   | Nacos、MySQL、Redis        | Docker Compose    |
| 認証マイクロサービス  | Auth             | ユーザー認証と認可を処理                   | Nacos、MySQL、Redis        | Docker Compose    |
| システムマイクロサービス | System          | システムレベルのサービスとインターフェースを提供 | Nacos、MySQL、Redis        | Docker Compose    |
| ビジネスマイクロサービス | Club            | 特定のビジネスロジックとサービスを提供   | Nacos、MongoDB             | Docker Compose    |
| データベース         | MySQL            | 構造化データを保存するリレーショナルデータベース | -                         | Docker Compose    |
| データベース         | MongoDB          | 非構造化データを保存する非リレーショナルデータベース | -                         | Docker Compose    |
| データベース         | Redis            | キャッシュおよび高速データアクセスのためのインメモリデータベース | -                         | Docker Compose    |
| ファイルストレージ   | MinIO            | 分散ファイルストレージシステム              | -                         | Docker Compose    |

## `docker-compose.yml`

```ruby
services:
  liveclub-nacos:
    container_name: liveclub-nacos
    image: nacos/nacos-server:v2.3.1-slim

    build:
      context: ./nacos
    environment:
      - MODE=standalone
    volumes:
      - ./nacos/logs/:/home/nacos/logs
      - ./nacos/conf/application.properties:/home/nacos/conf/application.properties
    ports:
      - "8848:8848"
      - "9848:9848"
      - "9849:9849"
    depends_on:
      - liveclub-mysql
    restart: always
  liveclub-mongo:
    container_name: liveclub-mongo
    image: mongo
    environment:
      - MONGO_INITDB_ROOT_USERNAME=root
      - MONGO_INITDB_ROOT_PASSWORD=root
    volumes:
      - ./mongo/init-mongo.js:/docker-entrypoint-initdb.d/init-mongo.js:ro
    ports:
      - "27017-27019:27017-27019"
    restart: always
  liveclub-mysql:
    container_name: liveclub-mysql
    image: mysql:5.7.8
    build:
      context: ./mysql
    ports:
      - "3306:3306"
    volumes:
      - ./mysql/conf:/etc/mysql/conf.d
      - ./mysql/logs:/logs
      - ./mysql/data:/var/lib/mysql
    command: [
          'mysqld',
          '--innodb-buffer-pool-size=80M',
          '--character-set-server=utf8mb4',
          '--collation-server=utf8mb4_unicode_ci',
          '--default-time-zone=+8:00',
          '--lower-case-table-names=1'
        ]
    environment:
      MYSQL_DATABASE: 'liveclub'
      MYSQL_ROOT_PASSWORD: root
    restart: always
  liveclub-redis:
    container_name: liveclub-redis
    image: redis
    build:
      context: ./redis
    ports:
      - "6379:6379"
    volumes:
      - ./redis/conf/redis.conf:/home/liveclub/redis/redis.conf
      - ./redis/data:/data
    command: redis-server /home/liveclub/redis/redis.conf
    restart: always
  liveclub-minio:
    container_name: liveclub-minio
    image: minio/minio
    ports:
      - "9000:9000"
      - "9001:9001"
    command: server /data --console-address ":9001"
    environment:
      MINIO_ROOT_USER: admin
      MINIO_ROOT_PASSWORD: 11111111
    volumes:
      - ./minio/data:/data:z
      - ./minio/config:/root/.minio
    restart: always
  liveclub-nginx:
    container_name: liveclub-nginx
    image: nginx
    build:
      context: ./nginx
    ports:
      - "80:80"
    volumes:
      - ./nginx/html/dist:/home/liveclub/projects/liveclub-ui
      - ./nginx/conf/nginx.conf:/etc/nginx/nginx.conf
      - ./nginx/logs:/var/log/nginx
      - ./nginx/conf.d:/etc/nginx/conf.d
    depends_on:
      - liveclub-gateway
    restart: always
  liveclub-gateway:
    container_name: liveclub-gateway
    build:
      context: ./liveclub/gateway
      dockerfile: dockerfile
    ports:
      - "8080:8080"
    environment:
      WAIT_HOSTS: liveclub-nacos:8848, liveclub-mysql:3306, liveclub-redis:6379
    depends_on:
      - liveclub-redis
      - liveclub-nacos
      - liveclub-mysql
    restart: always
  liveclub-auth:
    container_name: liveclub-auth
    build:
      context: liveclub/auth
      dockerfile: dockerfile
    ports:
      - "9200:9200"
    environment:
      WAIT_HOSTS: liveclub-nacos:8848, liveclub-mysql:3306, liveclub-redis:6379
    depends_on:
      - liveclub-redis
      - liveclub-nacos
      - liveclub-mysql
    restart: always
  liveclub-system:
    container_name: liveclub-system
    build:
      context: ./liveclub/modules/system
      dockerfile: dockerfile
    ports:
      - "9201:9201"
    environment:
      WAIT_HOSTS: liveclub-nacos:8848, liveclub-mysql:3306, liveclub-redis:6379
    depends_on:
      - liveclub-redis
      - liveclub-mysql
      - liveclub-nacos
  liveclub-club:
    container_name: liveclub-club
    build:
      context: liveclub/modules/club
      dockerfile: dockerfile
    ports:
      - "9300:9300"
    environment:
      WAIT_HOSTS: liveclub-nacos:8848, liveclub-mongo:27017
    depends_on:
      - liveclub-mongo
      - liveclub-nacos
    restart: always
networks:
  liveclub:
    driver: bridge
```
