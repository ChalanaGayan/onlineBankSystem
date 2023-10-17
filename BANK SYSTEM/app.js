const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const hbs = require("hbs");
app.use(bodyParser.urlencoded({extended:true}));

//Setup template engine
app.set('view engine', 'html');
app.engine('html', require('hbs').__express);

const port = 3000; // A reminder to change this to environment variables before deploying

// Setup static files folder
app.use(express.static("public"));

// Link to routes
app.use("/",require("./routes/pages"));













app.listen(port,()=>{
    console.log("Server Running");
});