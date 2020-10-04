
const lilypond = require("../output/lilypond");

const main = async () => {
	const result = await lilypond.engrave("\\relative {c'1}");
	console.log("result:", result);
};


main();
