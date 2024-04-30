const mysql = require('mysql');

// adatbázishoz kapcsolódás
const connection = mysql.createConnection({
    host: '192.168.255.103',
    user: 'u101_IEPXorHRqS',
    password: '4GOM!JB2cmmfuE!e.gLqN@HQ',
    database: 's101_db'
});

connection.connect((err) => {
    if (err) {
        console.log(`Hiba az adatbázis kapcsolódásakor: ${err}`);
        return;
    }

    console.log('Sikeres adatbázis kapcsolat!');
});

module.exports = connection;