var express = require('express');
var router = express.Router();

router.post('/', function(req, res, next) {
  var request = require('request');
  var signals = require('../../irkit-data/.irkit.json');
  console.log(signals);
  var signal = signals.IR['ceilingぽ'];
  var options = {
    url: 'http://192.168.0.3/messages',
    multipart: [{ body: JSON.stringify(signal) }],
  };
  request.post(options, (e, r, body) => {
    res.json(body);
  });
});

module.exports = router;
