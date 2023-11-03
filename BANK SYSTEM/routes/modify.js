const express = require("express");
const router = express.Router();

const customerQuery = require("../queries/customerQuery")
const employeeQuery = require("../queries/employeeQuery")

// Login Details comes here
router.post("/customer-login",async (req,res)=>{
    await customerQuery.checkUser(req,res);
});

router.post("/employee-login",async (req,res)=>{
    await employeeQuery.checkUser(req,res);
});

router.post("/register-user",async (req,res)=>{
    await query.addUser(req,res);
});

router.post("/customer-dashboard/loans",async (req,res)=>{
    let NIC = req.body.NIC;
    let Account_No = parseInt(req.body.Account_No);
    let Amount = parseFloat(req.body.Amount);
    let Duration = parseInt(req.body.Duration);
    let loanType = req.body.loanType;

    customerQuery.addLoan(res,NIC,Account_No,Amount,Duration,loanType,(res,message)=>{
        res.render("customer-dashboard/customer-dashboard-loans",{user:res.user, message:message});
    });
});

router.post("/customer-dashboard/transactions", (req,res)=>{
    customerQuery.doTransaction(req,res,(res,message)=>{
        //const accounts = JSON.parse(req.get("accounts"));
        res.render("customer-dashboard/customer-dashboard-transactions",{user: res.user,message: message});
    });
});

router.post("/employee-dashboard/savings-account", (req,res)=>{
    employeeQuery.createSavings(req,res,(res,message)=>{
        res.render("employee-dashboard/employee-dashboard-savingE",{user: res.user,message: message});
    });
});

router.post("/employee-dashboard/current-account", (req,res)=>{
    employeeQuery.createCurrent(req,res,(res,message)=>{
        res.render("employee-dashboard/employee-dashboard-currentE",{user: res.user,message: message});
    });
});

router.post("/employee-dashboard/fixedDeposit", (req,res)=>{
    employeeQuery.createFD(req,res,(res,message)=>{
        res.render("employee-dashboard/employee-dashboard-FDE",{user: res.user,message: message});
    });
});

router.post("/employee-dashboard/openLoans", (req,res)=>{
    employeeQuery.openLoan(req,res,(res,message)=>{
        res.render("employee-dashboard/employee-dashboard-openLoanE",{user: res.user,message: message});
    });
});

/* Below code is regarding the manager dashboard */

router.post("/employee-dashboard/loan_request", (req,res)=>{
    employeeQuery.approveLoan(req,res,(res,message)=>{
        res.render("manager-dashboard/loan_request",{user: res.user,message: message});
    });
});

router.post("/employee-dashboard/addemployees",async (req,res)=>{
    employeeQuery.addEmployee(req,(message)=>{
        res.render("manager-dashboard/addemployees",{user:res.user, message:message});
    });
});



module.exports = router;