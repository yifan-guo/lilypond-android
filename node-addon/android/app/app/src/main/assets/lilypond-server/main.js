
const http = require("http");
const lilypond = require("./lilypond");



const http_server = http.createServer( async (request, response) => {
	const ly_code = "\\relative c' {c1}";
	// TODO: extract ly code from request

	let svg = null;
	let log = null;

	const error = await lilypond.engrave(ly_code, {
		log (message) {
			log = message;
			console.log("lilypond log:", message);
		},
		onSVG (filename, content) {
			svg = content;
		},
	});
	console.log("Engrave result:", error);

	if (!error) {
		response.writeHead(200, {
			"Content-Type": "image/svg+xml",
		});

		response.end(svg);
	}
	else {
		response.writeHead(401, {
			"Content-Type": "text/plain",
		});

		response.end(log);
	}
});

http_server.listen(3000, "0.0.0.0", () => {
	console.log("Lilypond server is online: http://localhost:3000");
});
