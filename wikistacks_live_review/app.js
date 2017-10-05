// template to get server running
var express = require('express');
var app = express();

// sync with db
var db = require('./models')

db.sync({force: process.env.FORCE_DB});
.then(() =>
  app.listen(3000, () => console.log('listening on port 3000'));
});

/*
npm install
npm init -y
git init
npm install express
*/

app.get('/wiki', (req, res, next) => {
  res.send('no pages')
});

