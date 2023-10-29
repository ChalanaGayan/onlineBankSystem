const express = require("express");
const router = express.Router();

const auth = require("./customerAuth");
const query = require("../queries/customerQuery");

router.get("/",auth.authUser,function(req,res){ // This needs to be modified only for authorized access
    res.render("customer-dashboard",{user: res.user}); // Just a thought, you can render login page here and make them access it through there.
});

// So note that con.query is an asynchronous function. So to make sure to wait til it returns, we use a callback function
router.get("/savings-account",auth.authUser, function(req,res){
    query.getSavings(res.user,(err, savings1,savings2,savings3,savings4)=>{
        res.render("customer-dashboard-saving",{ user: res.user, savings1: savings1,savings2: savings2,savings3: savings3,savings4: savings4});
    });
    
});

router.get("/current-account",auth.authUser,function(req,res){
    query.getCurrent(res.user,(err, current1,current2,current3,current4)=>{
        res.render("customer-dashboard-current",{ user: res.user, current1: current1,current2: current2,current3: current3,current4: current4});
    });
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