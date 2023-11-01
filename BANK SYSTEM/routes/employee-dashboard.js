const express = require("express");
const router = express.Router();

const auth = require("./employeeAuth");
const authManager = require("./managerAuth");

const query = require("../queries/employeeQuery");

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

router.get("/manager", authManager.authUser, function (req, res) {
    res.render("manager-dashboard/manager",{ user: res.user });
});

router.get("/workingEmployees", authManager.authUser, function (req, res) {
    res.render("manager-dashboard/workingEmployees",{ user: res.user });
});

router.get("/addemployees", authManager.authUser, function (req, res) {
    res.render("manager-dashboard/addemployees",{ user: res.user });
});

router.get("/bankwise_transections", authManager.authUser, function (req, res) {
    query.getTransactions((transactions)=>{
        res.render("manager-dashboard/bankwise_transections",{ user: res.user, transactions:transactions});
    });  
});

router.get("/late_loan_installment", authManager.authUser, function (req, res) {
    query.getLateLoans(res.user,(loans)=>{
        res.render("manager-dashboard/late_loan_installment",{ user: res.user, loans: loans});
    }); 
    
});

router.get("/loan_request", authManager.authUser, function (req, res) {
    res.render("manager-dashboard/loan_request",{ user: res.user });
});

router.get("/manager_Setting", authManager.authUser, function (req, res) {
    res.render("manager-dashboard/manager_Setting",{ user: res.user });
});

module.exports = router;