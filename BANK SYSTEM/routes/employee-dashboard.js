const express = require("express");
const router = express.Router();

const auth = require("./employeeAuth");

router.get("/", auth.authUser, function (req, res) {
    res.render("employee-dashboard/employee-dashboard", { user: res.user });
});

router.get("/savings-account", auth.authUser, function (req, res) {
    res.render("employee-dashboard/employee-dashboard-savingE", { Amount1: 1000000, user: res.user });
});

router.get("/current-account", auth.authUser, function (req, res) {
    res.render("employee-dashboard/employee-dashboard-currentE", { user: res.user });
});

router.get("/fixedDeposit", auth.authUser, function (req, res) {
    res.render("employee-dashboard/employee-dashboard-FDE", { user: res.user });
});

router.get("/openLoans", auth.authUser, function (req, res) {
    res.render("employee-dashboard/employee-dashboard-openLoanE", { user: res.user });
});

router.get("/reqLoans", auth.authUser, function (req, res) {
    res.render("employee-dashboard/employee-dashboard-reqLoanE", { user: res.user });
});

router.get("/logout", function (req, res) {
    res.clearCookie("jwt");
    return res.redirect("/employee-login");
});

/* The below code is regarding the manager */

router.get("/manager", auth.authUser, function (req, res) {
    res.render("manager-dashboard/manager");
});

router.get("/workingEmployees", auth.authUser, function (req, res) {
    res.render("manager-dashboard/workingEmployees");
});

router.get("/addemployees", auth.authUser, function (req, res) {
    res.render("manager-dashboard/addemployees");
});

router.get("/bankwise_transections", auth.authUser, function (req, res) {
    res.render("manager-dashboard/bankwise_transections");
});

router.get("/late_loan_installment", auth.authUser, function (req, res) {
    res.render("manager-dashboard/late_loan_installment");
});

router.get("/loan_request", auth.authUser, function (req, res) {
    res.render("manager-dashboard/loan_request");
});

router.get("/manager_Setting", auth.authUser, function (req, res) {
    res.render("manager-dashboard/manager_Setting");
});

module.exports = router;




// const express = require("express");
// const router = express.Router();

// const auth = require("./employeeAuth");

// router.get("/",auth.authUser,function(req,res){ // This needs to be modified only for authorized access
//     res.render("employee-dashboard/employee-dashboard",{user: res.user}); // Just a thought, you can render login page here and make them access it through there.
// });

// router.get("/savings-account",auth.authUser,function(req,res){
//     res.render("employee-dashboard/employee-dashboard-savingE",{Amount1:1000000, user: res.user});
// });

// router.get("/current-account",auth.authUser,function(req,res){
//     res.render("employee-dashboard/employee-dashboard-currentE",{user: res.user});
// });

// router.get("/fixedDeposit",auth.authUser,function(req,res){
//     res.render("employee-dashboard/employee-dashboard-FDE",{user: res.user});
// });

// router.get("/openLoans",auth.authUser,function(req,res){
//     res.render("employee-dashboard/employee-dashboard-openLoanE",{user: res.user});
// });

// router.get("/reqLoans",auth.authUser,function(req,res){
//     res.render("employee-dashboard/employee-dashboard-reqLoanE",{user: res.user});
// });

// router.get("/logout",function(req,res){
//     res.clearCookie("jwt");
//     return res.redirect("/employee-login");
// });

// /* The below code is regarding the manager */

// router.get("/manager",auth.authUser,function(req,res){
//     res.render("manager-dashboard/manager");
// });

// router.get("/workingEmployees",auth.authUser,function(req,res){
//     res.render("manager-dashboard/workingEmployees");

// router.get("/addemployees",auth.authUser,function(req,res){
//     res.render("manager-dashboard/addemployees");
// });

// router.get("/bankwise_transections",auth.authUser,function(req,res){
//     res.render("manager-dashboard/bankwise_transections");
// });

// router.get("/late_loan_installment",auth.authUser,function(req,res){
//     res.render("manager-dashboard/late_loan_installment");
// });

// router.get("/loan_request",auth.authUser,function(req,res){
//     res.render("manager-dashboard/loan_request");
// });

// router.get("/manager_Setting",auth.authUser,function(req,res){
//     res.render("manager-dashboard/manager_Setting");
// });


// module.exports = router;