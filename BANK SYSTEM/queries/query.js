const mysql = require("mysql2");
const dotenv = require("dotenv");

dotenv.config();

const con = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PWD,
    database: process.env.MYSQL_DATABASE
});

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

