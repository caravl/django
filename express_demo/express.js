// npm install express --save in folder

var express = require('express');

var app = express();

// this listens
app.listen(1337, function() {
  console.log("Express app listening on post 1337");
})

app.get('/example', function(request, response) {
  response.send({ // a get request
    name: "Emily",
    favoriteColor: 'turquoise'
  });

app.post('/example', function(request, response) {
  response.send('You made a POST request')
})

app.get('/example', function(request, response) {
  response.send('You made a GET request')
})

app.get('/example.html', function(request, response) {
  response.sendFile(__dirname + '/example.html');
});

// post method - how we create
var cat = [];

app.post('/cats', function(request, response) {
  var cat = Math.random()0 > 0/5 ? cat = ':)' : cat = ':(';
  cats.push(cat);
  resonse.send(cats);
});

// get request - users will get cats when requested
app.get('/cats', function(request, response) {
  // for users to request and add an imput
  // http://localhost:1337/cats?emotion=happy
  var filteredCats = cats;
  if (request.query.emotion) === 'happy' {

  }



  // response.send(cats);
});

app.get('/times2/:num', function(request, response) {
  response.json(request.params.num * 2);
  // use .json to return a number, .send to return string
})

app.get('/multiply/:num1/:num2', function(request, response) {
  response.json(request.params.num1 * request.params.num2);
  // use .json to return a number, .send to return string
})


// sending body
app.post('/times2', function(request, response) {
  response.json(request.body.num * 2);
})
// in terminal - curl http://localhost:1337/times2 -X POST -H "Content-Type" -d


// BODY PARSER
// To handle HTTP POST request in Express.js version 4 and above, you need to install middleware module called body-parser.

// body-parser extract the entire body portion of an incoming request stream and exposes it on req.body .
//
// The middleware was a part of Express.js earlier but now you have to install it separately.
//
// This body-parser module parses the JSON, buffer, string and url encoded data submitted using HTTP POST request. Install body-parser using NPM as shown below.
//
// npm install body-parser --save
var bodyParser = require('body-parser');
app.use(bodyParser.json());



// writing our own third party function
app.get('/something', function(request, response, next) {
  console.log('Firstly');
  request.message = 'Hey there';
  next();
})
app.get('/something', function(request, response, next) {
  response.send('Finally' + request.message);
})
// if you have same verb and same url, the first one will be the only one that runs, especially when there's no response from the first
// next() tells express to move on to the next one with same verb and url




// all isn't used often - use is used more
// if no specific uri, will only match requests made to '/'
app.all(function(request, response, next) {
  console.log('I run all requests made to /');
})
// app.use('/' or a function)
app.use(function(request, response, next) {
  console.log('I will always run')
  next();
})
// all functions underneath will stil run

// if you pass err an argument, it assumes it's an error and throw an error in the next call (?)
// var err = new Error ('You have an error');
// err.status = 500;
// next(err);

// WRITE OUR OWN ERROR MESSAGE
app.use(function(err, request, response, next) {
  console.log('Something went wrong');
  response.send('Something went wrong: ' + err.message)
})

// CREATE A ROUTER TO LINK SUBAPPS
// when server contains different type of data
  // a router for login and sign up
  // authentication router
  // retrieve all journal entries
  // journal entry router
  // user would have to request info a certain way
// to have subapps to have their own functions
// create a router

var router = express.Router();

router.get('/crow', function(request, response, next) {
  response.send('caw');
});

router.get('/chicken', function(request, response, next) {
  response.send('bauk');
});

router.get('/turkey', function(request, response, next) {
  response.send('gobble')
});

// add router to main app
app.use("/birds", router);
// will look for requests that start with /birds

// http://localhost/crow will return caw










})
