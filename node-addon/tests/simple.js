
const lilypond = require("../output/lilypond");

const main = async () => {
	const error = await lilypond.engrave("\\relative {c'1}", {
		onSVG (filename, content) {
			console.log("svg file:", filename, content);
		},
	});

	console.log("result:", error);
};


main();
