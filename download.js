var http = require('follow-redirects').http;

var options = {
  "method": "POST",
  "hostname": "zh.emailfake.com",
  "port": null,
  "path": "/check_adres_validation3.php",
  "headers": {
    "content-type": "application/json",
    "cache-control": "no-cache",
    "postman-token": "fbc7a25f-7903-f3ea-9524-c41767371381"
  }
};

var req = http.request(options, function (res) {
  var chunks = [];

  res.on("data", function (chunk) {
    chunks.push(chunk);
  });

  res.on("end", function () {
    var body = Buffer.concat(chunks);
    console.log(body.toString());
  });
});

req.write(JSON.stringify({ usr: 'lossmaking', dmn: 'flitify.com' }));
req.end();