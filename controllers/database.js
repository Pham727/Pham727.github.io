var mysql = require('mysql2/promise');
    var pool = mysql.createPool({
        host: 'localhost',
        user: 'root',
        database: 'myfarm_store',
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0
    });
module.exports.DocBang=async function(query){
    var DSBang= await pool.query(query);
    Bang=DSBang[0];
    return Bang;
}