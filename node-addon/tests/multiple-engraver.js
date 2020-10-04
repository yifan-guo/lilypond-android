
const fs = require("fs");
const lilypond = require("../output/lilypond");



const engraveFile = async filename => {
	const content = fs.readFileSync(filename);
	const result = await lilypond.test(content);

	console.log("result:", result);
};

const main = async () => {
	await engraveFile("./tests/assets/simple.ly");
	await engraveFile("./tests/assets/little-star.ly");

	console.log("Done.");
};


main();
