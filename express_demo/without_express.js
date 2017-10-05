var http = require('http');

// event emitter (listens for an event)
var server = http.createServer();

server.on('request', function(request, response) {

  console.log('Got a request!', request.url);
  // in terminal type $ node without_express.js


  // in browser of local host, we get the response.end message
  if (request.url === '/example') {
    response.writeHead(200, { 'Content-Type': 'text/plain'});
    response.end("Here is a response for /example");
  } else if (request.url === '/') {
    response.writeHead(200, { 'Content-Type': 'text/plain'})
    response.end('<h1>Here is a response to /</h1>');
  }

  // send a response back or browser will run constinuously
  response.end('Here is a response');
})

// listen for an event (port number, function to run when something happens at this port)
server.listen(1337, function() {
  console.log('Listening on port 1337..') // listening constinuously
})
