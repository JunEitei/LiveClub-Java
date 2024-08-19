// db.getSiblingDB() 相当于 use admin;
db.getSiblingDB('admin')
    .createUser({
        user: 'root',
        pwd: 'root',
        roles: ['readWrite']
    });