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
    console.log(req.body);
    res.send("Recieved");
});

module.exports = router;