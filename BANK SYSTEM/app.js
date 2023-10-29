const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const hbs = require("hbs");
const cookieParser = require("cookie-parser");

app.use(bodyParser.urlencoded({extended:true}));
app.use(cookieParser());


//Setup template engine
app.set('view engine', 'html');
app.engine('html', require('hbs').__express);

const port = 3001; // A reminder to change this to environment variables before deploying

// Setup static files folder
app.use(express.static("public"));

// Link to routes
app.use("/",require("./routes/pages"));
app.use("/",require("./routes/modify"));
app.use("/customer-dashboard/",require("./routes/customer-dashboard"));
app.use("/employee-dashboard/",require("./routes/employee-dashboard"));













app.listen(port,()=>{
    console.log("Server Running");
});