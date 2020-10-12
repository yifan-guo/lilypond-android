
const http = require("http");
//var fc = require('./function-call');



const http_server = http.createServer( async (request, response) => {
	response.end("hello.");
});

http_server.listen(3000, "0.0.0.0", () => {
	console.log("Lilypond server is online: http://localhost:3000");
});
