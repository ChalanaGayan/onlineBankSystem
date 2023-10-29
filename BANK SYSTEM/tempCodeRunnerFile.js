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

const port = 3000; // A reminder to change this to environment variables before deploying

// Setup static files folder
app.use(express.static("public"));

const auth = require("./routes/auth");

// Link to routes
app.use("/",require("./routes/pages"));
app.use("/",require("./routes/modify"));
app.use("/customer-dashboard/",auth.authUser,require("./routes/dashboard"));















app.listen(port,()=>{
    console.log("Server Running");
});