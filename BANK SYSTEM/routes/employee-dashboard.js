const express = require("express");
const router = express.Router();

const auth = require("./employeeAuth");

router.get("/",auth.authUser,function(req,res){ // This needs to be modified only for authorized access
    res.render("employee-dashboard",{user: res.user}); // Just a thought, you can render login page here and make them access it through there.
});

router.get("/savings-account",auth.authUser,function(req,res){
    res.render("employee-dashboard-savingE",{Amount1:1000000, user: res.user});
});

router.get("/current-account",auth.authUser,function(req,res){
    res.render("employee-dashboard-currentE",{user: res.user});
});

router.get("/fixedDeposit",auth.authUser,function(req,res){
    res.render("employee-dashboard-FDE",{user: res.user});
});

router.get("/openLoans",auth.authUser,function(req,res){
    res.render("employee-dashboard-openLoanE",{user: res.user});
});

router.get("/reqLoans",auth.authUser,function(req,res){
    res.render("employee-dashboard-reqLoanE",{user: res.user});
});

// router.get("/fixed-deposit",auth.authUser,function(req,res){
//     res.render("customer-dashboard-fixed-deposit",{user: res.user});
// });

router.get("/logout",function(req,res){
    res.clearCookie("jwt");
    return res.redirect("/employee-login");
});

/* The below code is regarding the manager */

router.get("/manager",function(req,res){
    res.send("Manager");
});

module.exports = router;