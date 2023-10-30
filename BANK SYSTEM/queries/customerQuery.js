const mysql2 = require("mysql2");
const dotenv = require("dotenv");
const auth = require("../routes/customerAuth");

dotenv.config();

const con = mysql2.createConnection({
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

// temp_user table is used until we connect user authorization properly
// User authorization
exports.checkUser = (req,res)=>{
    let username = req.body.username;
    let password = req.body.password;
    con.query(`SELECT * FROM temp_user WHERE username=?`,[username],(err,result)=>{
        if (result[0]){
            if (checkPWD(result[0].password,password)){
                const token = auth.getToken(username); // This is where we create the access token at login
                res.cookie("jwt",token,{
                    //maxAge: 600000,
                    httpOnly: true
                })
                res.redirect("customer-dashboard");
            } else{
                res.render("customer-login",{message: "Invalid Username or Password"});
            }
        } else{
            res.render("customer-login",{message: "Invalid Username or Password"});
        }
    });
}

// Get customer Savings accounts' details
exports.getSavings = (username,callback)=>{
    con.query(`call customer_display_saving_accounts(?)`,[username],(err,result)=>{
        console.log(result);
        if(result)
            callback(null,result[0][0],result[0][1],result[0][2],result[0][3]);
        else
            callback(null);
    });
}

// Get customer Current accounts' details
exports.getCurrent = (username,callback)=>{
    con.query(`call customer_display_current_accounts(?)`,[username],(err,result)=>{
        console.log(result);
        if(result)
            callback(null,result[0][0],result[0][1],result[0][2],result[0][3]);
        else 
            callback(null);
    });
}


exports.getAllAccounts = (username,callback)=>{
    con.query(`call customer_display_all_accounts(?)`,[username],(err,result)=>{
        console.log(result);
        if(result)
            callback(null,result[0]);
        else 
            callback(null);
    });
}


/*Below code are related to doing a transaction*/

// Check remaining amount of from account
const checkAmount = (res,amount,fromAccount,toAccount,maincallback)=>{
    con.query(`SELECT from_acc_amount_check(?,?)`,[amount,fromAccount],(err,result)=>{
        if (result[0]['from_acc_amount_check('+amount+','+fromAccount+')']){
            con.query(`CALL customer_money_transaction(?,?,?)`,[fromAccount,toAccount,amount],(err,result)=>{
                if(err){   
                    maincallback(res,"fail");
                } else{
                    maincallback(res,"success");
                }
            }); 
        } else{
            maincallback(res,"invalidAmount");
        }
    });
}


//Check the validity of toAccount
const checkToAccount = (res,fromAccount,toAccount,amount,amountCheck,maincallback)=>{
    con.query(`SELECT check_to_account_valid(?);`,[toAccount],(err,result)=>{
        if(result[0]['check_to_account_valid('+toAccount+')']){
            amountCheck(res,amount,fromAccount,toAccount,maincallback)
        } else{
            maincallback(res,"invalid");
        }
    })
}

exports.doTransaction = (req,res,maincallback)=>{
    const fromAccount = parseInt(req.body.fromAccount);
    const toAccount = parseInt(req.body.toAccount);
    const amount = parseFloat(req.body.amount);

    checkToAccount(res,fromAccount,toAccount,amount,checkAmount,maincallback);

}

/* End of transactions code */

