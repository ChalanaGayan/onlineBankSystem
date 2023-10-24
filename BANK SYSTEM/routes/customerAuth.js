const jwt = require("jsonwebtoken");

require("dotenv").config();

// Middleware function to authenticate a user using jwt token
exports.authUser = (req,res,next)=>{
    if (req.cookies.jwt){ // <= Remember it's req.cookies
        try{
        const verify = jwt.verify(req.cookies.jwt, process.env.ACCESS_TOKEN_SECRET);
        res.user = verify.username;
        } catch (err){
            if(err instanceof jwt.JsonWebTokenError){
                return res.redirect("/customer-login");
            } else{
                res.sendStatus(404);
            }
        } 
        next();
    } else{
        res.clearCookie("jwt");
        return res.redirect("/customer-login");
    }
    
}

exports.getToken = (username)=>{
    const token = jwt.sign({username: username},process.env.ACCESS_TOKEN_SECRET,{expiresIn: "1h"});
    return token;
}

module.exports;