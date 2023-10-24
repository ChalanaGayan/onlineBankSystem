const express = require("express");
const router = express.Router();

const query = require("../queries/query")

// Login Details comes here
router.post("/customer-dashboard",async (req,res)=>{
    await query.checkUser(req,res);
});

router.post("/register-user",async (req,res)=>{
    await query.addUser(req,res);
});

router.post("/customer-dashboard/loans",async (req,res)=>{
    console.log(req.body);
    res.send("Recieved");
});

module.exports = router;