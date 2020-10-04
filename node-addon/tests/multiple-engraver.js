
const fs = require("fs");
const lilypond = require("../output/lilypond");



const engraveFile = async filename => {
	const code = fs.readFileSync(filename);
	const result = await lilypond.engrave(code, {
		log (messages) {
			console.log(`log[${filename}]:`, messages);
		}
	});

	console.log("result:", result);
};

const main = async () => {
	await engraveFile("./tests/assets/simple.ly");
	await engraveFile("./tests/assets/little-star.ly");

	console.log("Done.");
};


main();
