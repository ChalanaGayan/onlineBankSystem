const mysql = require("mysql2");
const dotenv = require("dotenv");
const auth = require("../routes/employeeAuth");

dotenv.config();

const con = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PWD,
    database: process.env.MYSQL_DATABASE
});

con.connect((err)=>{
    if(err) console.log(err);
})

// Try implementing password hashing
const checkPWD = (stored,userInput)=>{
    if (stored==userInput)
        return true
    else
        return false
};


exports.checkUser = (req,res)=>{
    let username = req.body.username;
    let password = req.body.password;
    con.query(`SELECT * FROM user_details WHERE User_Name=?`,[username],(err,result)=>{
        if (result[0]){
            if (checkPWD(result[0].Password,password)){
                const token = auth.getToken(username); // This is where we create the access token at login
                res.cookie("jwt",token,{
                    //maxAge: 600000,
                    httpOnly: true
                })

                // Check whether its a manager or an employee
                con.query(`call get_Position(?)`,[username],(err,result)=>{
                    const position = result[0][0].Position;
                    console.log(position);
                    if (position=="Manager"){res.redirect("employee-dashboard/manager");}
                    else {res.redirect("employee-dashboard");}
                    
                })

            } else{
                res.render("employee-login",{message: "Invalid Username or Password"});
            }
        } else{
            res.render("employee-login",{message: "Invalid Username or Password"});
        }
    });
}

exports.createSavings = (req,res,callback)=>{
    const content = req.body;

    let fname = content.fname;
    let lname = content.lname;
    let birthdate = content.birthDate;
    let NIC = content.NIC;
    let address = content.address;
    let branchID = parseInt(content.branchID);
    let accountType = parseInt(content.accountType);

    con.query(`call employee_open_saving_account(?,?,?,?,?,?,?)`,[fname,lname,birthdate,NIC,address,branchID,accountType],(err,result)=>{
        if(err){
            console.log(err);
            callback(res,"error")
        } else{
            callback(res,"success"); 
        }
    });
    
}

exports.createCurrent = (req,res,callback)=>{
    const content = req.body;

    let fname = content.fname;
    let lname = content.lname;
    let birthdate = content.birthDate;
    let NIC = content.NIC;
    let address = content.address;
    let branchID = parseInt(content.branchID);

    con.query(`call employee_open_current_account(?,?,?,?,?,?)`,[fname,lname,birthdate,NIC,address,branchID],(err,result)=>{
        if(err){
            console.log(err);
            callback(res,"error")
        } else{
            callback(res,"success"); 
        }
    });
    
}

exports.createFD = (req,res,callback)=>{
    const content = req.body;
    console.log(req.body);
    let NIC = content.NIC;
    let savingAccountNo = content.accountNumber;
    let fdAmount = parseInt(content.accountAmount);
    let fdPlan = parseInt(content.fdType);

    con.query(`call employee_open_fd(?,?,?,?)`,[NIC,savingAccountNo,fdAmount,fdPlan],(err,result)=>{
        if(err){
            console.log(err);
            callback(res,"error")
        } else{
            callback(res,"success"); 
        }
    });
    
}

exports.openLoan = (req,res,callback)=>{
    const content = req.body;
    console.log(req.body);

    let fname = content.fname;
    let lname = content.lname;
    let birthdate = content.birthDate;
    let NIC = content.NIC;
    let address = content.address;
    let loanAmount = parseInt(content.loanAmount);
    let duration = parseInt(content.duration);
    let comments = content.comments;

    con.query(`call employee_loan_application(?,?,?,?,?,?,?,?)`,[fname,lname,birthdate,NIC,address,loanAmount,duration,comments],(err,result)=>{
        if(err){
            console.log(err);
            callback(res,"error")
        } else{
            callback(res,"success"); 
        }
    });
    
}

exports.getTransactions = (callback)=>{
    con.query(`call show_bankwise_transactions_report()`,(err,result)=>{
        const transactions = result[0];
        callback(transactions);
    });   
}

exports.getLateLoans = (username,callback)=>{
    con.query(`call manager_display_late_loans(?)`,[username],(err,result)=>{
        const loans = result[0];
        callback(loans);
    });   
}


