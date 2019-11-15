var http = require('http');
var url = require('url');
var htmlFilter = require("./htmlFilter");
var requestDown=require("./requestDown");
var down=require('./download')

var route = {
    '/': "/",
    'email': '/email'
};

var RouteValid = function (reqPath) {
    for (var key in route) {
        if (route[key] == reqPath) {
            return true;
        }
    }
    return false;
};
/**
 * 照样输出json格式的数据
 * @param query
 * @param res
 */
var writeOut = function (query, res) {
    res.write(JSON.stringify(query));
    res.end();
 }
 down.download();
 //var email=requestDown.POST();
 //requestDown.Download("https://zh.emailfake.com/flitify.com/lossmaking")
// http.createServer(function (req, res) {
//     if (!RouteValid(url.parse(req.url).pathname)) {
//         res.writeHead(404, {'Content-Type': 'text/plain;charset=utf-8'});
//         res.write("{'errcode':404,'errmsg':'404 页面不见啦'}");
//         res.end();
//     }else{
//         var query = url.parse(req.url, true).query;
//         var email=htmlFilter.ReadList(query.address,query.domain);
//         if(email)
//         {
//             var resmodel={
//                 code: '201',
//                 vilaCode: ''
//             }
//             writeOut(resmodel, res);
//         }
//         else{
//             var resmodel={
//                 code: '200',
//                 vilaCode: email
//             }
//             writeOut(resmodel, res);
//         }
//     }
// }).listen(8888);

// // 终端打印如下信息
// console.log('Server running at http://127.0.0.1:8888/');