const express = require("express");
const router = express.Router();

const auth = require("./customerAuth");

router.get("/",auth.authUser,function(req,res){ // This needs to be modified only for authorized access
    res.render("customer-dashboard",{user: res.user}); // Just a thought, you can render login page here and make them access it through there.
});

router.get("/savings-account",auth.authUser,function(req,res){
    res.render("customer-dashboard-saving",{Amount1:1000000, user: res.user});
});

router.get("/current-account",auth.authUser,function(req,res){
    res.render("customer-dashboard-current",{user: res.user});
});

router.get("/transactions",auth.authUser,function(req,res){
    res.render("customer-dashboard-transactions",{user: res.user});
});

router.get("/loans",auth.authUser,function(req,res){
    res.render("customer-dashboard-loans",{user: res.user});
});

router.get("/loan-application",auth.authUser,function(req,res){
    res.render("loan-application",{user: res.user});
});

router.get("/fixed-deposit",auth.authUser,function(req,res){
    res.render("customer-dashboard-fixed-deposit",{user: res.user});
});

router.get("/logout",function(req,res){
    res.clearCookie("jwt");
    return res.redirect("/customer-login");
});

module.exports = router;