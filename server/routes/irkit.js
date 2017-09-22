var express = require('express');
var router = express.Router();

var request = require('request');
require('dotenv').config({ path: __dirname + '/../../.env' });
var signals = require('../../.irkit.json');

router.post('/', function(req, res, next) {
  var signal = signals.IR[req.body.key];
  var options = {
    url: `https://api.getirkit.com/1/messages`,
    form: {
      deviceid: process.env.DEVICE_ID,
      clientkey: process.env.CLIENT_KEY,
      message: JSON.stringify(signal),
    },
  };
  console.log(options)
  request.post(options, (e, r, body) => {
    res.json(body);
  });
});

module.exports = router;
