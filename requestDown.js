var request = require("request");

function GET(url, callback) {
    var options = {
        method: 'GET',
        url: url,
        headers: {
            'postman-token': 'a1037d04-add1-a45f-b3bd-76500b041bb9',
            'cache-control': 'no-cache'
        }
    };
    request(options, function (error, response, body) {
        if (error) throw new Error(error);
        console.log(url);
        console.log(body);
        callback(body);
    });
}

function POST(url, data) {
    var options = {
        method: 'POST',
        url: 'https://zh.emailfake.com/check_adres_validation3.php',
        headers: {
            'cache-control': 'no-cache',
            'content-type': 'application/json',
            'referer': 'https://zh.emailfake.com/flitify.com/lossmaking',
            'user-agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36'
        },
        body: {
            usr: 'lossmaking',
            dmn: 'flitify.com'
        },
        json: true
    };
    request(options, function (error, response, body) {
        if (error) throw new Error(error);
        console.log(response);
        console.log(body);
    })
}

exports.GET = GET;
exports.POST = POST;