var mysql = require('mysql');
var pool = mysql.createPool({
    connectionLimit : 10,
    host            : 'localhost',
    user            : 'root',
    password        : 'password',
    database        : 'baseball'
});
module.exports.pool = pool;