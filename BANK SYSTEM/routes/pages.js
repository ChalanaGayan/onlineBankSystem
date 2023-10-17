const express = require("express");
const router = express.Router();

const query = require("../queries/query")

router.get("/",(req,res)=>{
    res.render("main-page");
});

router.get("/customer-login",function(req,res){
    res.render("customer-login");
});

router.get("/employee-login",function(req,res){
    res.render("customer-login");
});

router.get("/savings",function(req,res){
    res.render("saving");
});

router.get("/forget-password",function(req,res){
    res.render("forget-password");
});

router.post("/customer-login",function(req,res){
    query.checkUser(req,res);
});


module.exports = router;