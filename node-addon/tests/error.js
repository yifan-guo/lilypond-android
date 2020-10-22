
const fs = require("fs")
const lilypond = require("../output/lilypond");



const test = async () => {
	const error = await lilypond.engrave("$#", {
		log (message) {
			console.log("log:", message);
		},
	});

	console.log("result:", error);
};


const main = async () => {
	await test();

	await test();
};


main();
