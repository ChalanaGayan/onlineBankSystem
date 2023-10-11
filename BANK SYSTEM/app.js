const express = require("express");
const app = express();
const port = 3000; // A reminder to change this to environment variables before deploying

app.use(express.static("public"));

app.get("/",(req,res)=>{
    res.sendFile(__dirname+"/main-page.html");
});

















app.listen(port,()=>{
    console.log("Server Running");
});