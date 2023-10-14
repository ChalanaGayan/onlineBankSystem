const express = require("express");
const bodyParser = require("body-parser");
const app = express();
app.use(bodyParser.urlencoded({extended:true}));

const port = 3000; // A reminder to change this to environment variables before deploying

app.use(express.static("public"));

app.get("/",(req,res)=>{
    res.sendFile(__dirname+"/main-page.html");
});




app.get("/customer-login",function(req,res){
    res.sendFile(__dirname+"/bank services/login/customerlogininform.html");
});














app.listen(port,()=>{
    console.log("Server Running");
});