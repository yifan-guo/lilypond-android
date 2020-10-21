
const http = require("http");
const path = require("path");
const fs = require("fs");
const lilypond = require("./lilypond");



let PWD = process.cwd();


const handleHome = async (req, res) => {
	res.writeHead(200, {
		"Content-Type": "text/html",
	});

	const html = await fs.promises.readFile(path.resolve(PWD, "./home.html"));
	res.end(html);
};


const handleEngrave = async (req, res) => {
	const ly_code = await new Promise(resolve => req.on("data", chunk => resolve(chunk.toString())));

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
		res.writeHead(200, {
			"Content-Type": "image/svg+xml",
		});

		res.end(svg);
	}
	else {
		res.writeHead(401, {
			"Content-Type": "text/plain",
		});

		res.end(log);
	}
};


const http_server = http.createServer( async (request, response) => {
	switch (request.method) {
	case "GET":
		handleHome (request, response);

		break;
	case "POST":
		handleEngrave (request, response);

		break;
	}
});

http_server.listen(3000, "0.0.0.0", () => {
	console.log("Lilypond server is online: http://localhost:3000");

	PWD = path.resolve(process.argv[1], "..");
	//console.log("PWD:", PWD);

	// set environment variables for native libraries
	process.env.LILYPOND_PATH = path.join(PWD, "bin/lilypond");
	process.env.GUILE_LOAD_PATH = path.join(PWD, "share/guile/1.8")
	process.env.FONTCONFIG_PATH = path.join(PWD, "share/fonts")
});
