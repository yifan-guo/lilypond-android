
const fs = require("fs")
const lilypond = require("../output/lilypond");



const main = async () => {
	const error = await lilypond.engrave("$#", {
		log (message) {
			console.log("log:", message);
		},
	});

	console.log("result:", error);
};


main();
