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

router.get("/current_accounts",function(req,res){
    res.render("current_accounts");
});

router.get("/loan",function(req,res){
    res.render("loan");
});

router.get("/term_deposits",function(req,res){
    res.render("/term_deposits");
});

router.post("/customer-login",function(req,res){
    query.checkUser(req,res);
});


module.exports = router;