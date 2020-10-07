
const fs = require("fs")
const path = require("path")
const lilypond = require("../output/lilypond");



const main = async () => {
	const code = fs.readFileSync("./tests/assets/include-test.ly");
	const error = await lilypond.engrave(code, {
		includeFolders: [
			path.resolve(process.env.PWD, "./tests/assets/inc"),
		],
		onSVG (_, content) {
			fs.promises.writeFile("./include-test.svg", content)
				.then(() => console.log("include-test.svg wrote."));
		},
	});

	console.log("result:", error);
};


main();
