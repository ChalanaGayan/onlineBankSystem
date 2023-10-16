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

app.get("/customer-login",function(req,res){
    res.sendFile(__dirname+"/bank services/login/customerlogininform.html");
});

app.post("/employee-login", function(req, res) {
    const username = req.body.username;
    const password = req.body.password;

    // Here you can query your database to check if the username and password match
    // Assuming you have a database connection and a table named "employees"
    // You can use a library like "mysql" to connect to your database
    // Here's an example of how you can check if the username and password match
    const query = "SELECT * FROM employees WHERE username = ? AND password = ?";
    db.query(query, [username, password], function(err, result) {
        if (err) {
            console.log(err);
            res.status(500).send("Internal Server Error");
        } else if (result.length === 0) {
            // If the username and password don't match, redirect to the login page with an error message
            res.redirect("/employee-login?error=1");
        } else {
            // If the username and password match, redirect to the main page
            res.redirect("/");
        }
    });
});

app.listen(port,()=>{
        console.log("Server Running");
});