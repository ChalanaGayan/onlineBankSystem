const mysql = require("mysql2");
const dotenv = require("dotenv");

dotenv.config();

// ------------------------------------
// chalana's database connection settings
// ------------------------------
const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Chalana1234',
    database: 'bank_system',
    port: 3306
  });

// ------------------------------

// const con = mysql.createConnection({
//     host: process.env.MYSQL_HOST,
//     user: process.env.MYSQL_USER,
//     password: process.env.MYSQL_PWD,
//     database: process.env.MYSQL_DATABASE
// });

con.connect((err)=>{
    console.log(err);
})

exports.checkUser = (req,res)=>{
    let username = req.body.username;
    con.query(`SELECT * FROM customer WHERE username=?`,[username],(err,result)=>{
        if (result){
            res.render("customer-login",{message: "Username already in use"});
        } else{
            console.log("Okay");
        }
    });
}

