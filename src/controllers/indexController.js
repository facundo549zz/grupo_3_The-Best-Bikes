const path = require('path')


module.exports = {
    index:function(req,res){
        res.render('index',{
            title: "Home",
            css: "index.css",
        })
    },
}