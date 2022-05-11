const mysql = require('mysql');

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'groupomania'
});

con.connect(function(err) { 
    if (err) { console.log("Connexion à la DB echouée. " + err); }
    console.log("Connexion à la DB réussie !");
});

module.exports = con;