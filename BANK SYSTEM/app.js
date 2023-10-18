const express = require("express");
const bodyParser = require("body-parser");
const app = express();
app.use(express.static("public"));
app.use(bodyParser.urlencoded({extended:true}));
const port = 3000; // A reminder to change this to environment variables before deploying
app.use(express.static("public"));






app.get("/",(req,res)=>{
    res.sendFile(__dirname+"/main-page.html");
});

// ---------------------------------------------------------------------------
// database connection


const mysql = require('mysql');


const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'Chalana1234',
  database: 'bank_system'
});

app.get('/branches', (req, res) => {
  try {
    pool.getConnection((err, connection) => {
      if (err) throw err;

      connection.query('select * from branches;', (error, results) => {
        connection.release(); // Release the connection back to the pool

        if (error) throw error;
        res.json(results);
        res.write("Branches: " + results + "\n");
      });
    });
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});


  
// -----------------------------------------------------------------------

app.get("/customer-login",function(req,res){
    res.sendFile(__dirname+"/public/customer_login/customer-login.html");
});

app.get("/employee-login",function(req,res){
    res.sendFile(__dirname+"/public/employee_login/employee-login.html");
});

app.post("/employee-login", function(req, res) {
    

    const username = req.body.username; 
    const password = req.body.password;
    
    res.write("username: " + username + "\n");
    res.write("password: " + password + "\n");
    res.send();

    


});

app.listen(port,()=>{
        console.log("Server Running");
});