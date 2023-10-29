const mysql2 = require("mysql2"); // Use mysql2 instead of mysql
const dotenv = require("dotenv");
const auth = require("../routes/auth");

const connection = mysql2.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Chalana1234',
    database: 'bank_system'
  });

connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL database');
});
// Try implementing password hashing
const checkPWD = (stored,userInput)=>{
    if (stored==userInput)
        return true
    else
        return false
};


exports.checkUser = (req,res)=>{
    let username = req.body.username;
    let password = req.body.password;
    con.query(`SELECT * FROM customer WHERE username=?`,[username],(err,result)=>{
        if (result){
            if (checkPWD(result[0].pwd,password)){
                const token = auth.getToken(username); // This is where we create the access token at login
                res.cookie("jwt",token,{
                    //maxAge: 600000,
                    httpOnly: true
                })
                res.redirect("customer-dashboard");
            } else{
                res.render("customer-login",{message: "Invalid Username or Password"});
            }
        } else{
            res.render("customer-login",{message: "Invalid Username or Password"});
        }
    });
}

exports.addUser = (req,res)=>{
    
}

