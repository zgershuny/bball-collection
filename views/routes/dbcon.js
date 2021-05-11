var mysql = require('mysql');
// var pool = mysql.createPool({
//     connectionLimit : 10,
//     host            : 'localhost',
//     user            : 'root',
//     password        : 'password',
//     database        : 'baseball'
// });

//connection setup
// https://stackoverflow.com/questions/49529231/transaction-management-in-nodejs-with-mysql
var connection = mysql.createConnection(
    {
        host            : 'localhost',
        user            : 'root',
        password        : 'password',
        database        : 'baseball',
        multipleStatements: true,
    }
);

// module.exports.pool = pool;
module.exports.connection = connection;