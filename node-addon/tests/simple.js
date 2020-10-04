
const fs = require("fs")
const lilypond = require("../output/lilypond");



const main = async () => {
	const error = await lilypond.engrave("\\relative {c'1}", {
		onSVG (filename, content) {
			console.log("svg file received:", filename);
			fs.promises.writeFile("./simple.svg", content)
				.then(() => console.log("simple.svg wrote."));
		},
	});

	console.log("result:", error);
};


main();
