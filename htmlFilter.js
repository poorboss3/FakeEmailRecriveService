const cheerio = require('cheerio')
var requestDown=require('./requestDown')

function ReadList (address,domain) {
    //var _url="https://zh.emailfake.com/"+domain+"/"+address;
    var data={
        usr: address,
        dmn: domain
    }
    requestDown.POST('',data,function(data){
        var $ = cheerio.load(data, {decodeEntites: false});
        var emailLinks=[];
        $('#email-table a').each(function(idx,element){
            var $element = $(element);
            emailLinks.push($element.href);
        })
        console.log(emailLinks);
        if(emailLinks.length>0)
        {
            return readCode(emailLinks[0]);
        }
        else{
            return "";
        }
    })
}
var readCode=function(url){
    requestDown.GET(url,function(data){
        var $ = cheerio.load(data, {decodeEntites: false});
        var code=[];
        $("#verificationMsg p[class='otp']").each(function(idx,element){
            var $element = $(element);
            code.push($element.text().trim());
        })
        if(code.length>0)
            return code[0];
        else
            return "";
    })
}

exports.ReadList = ReadList;