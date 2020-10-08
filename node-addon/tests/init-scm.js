
const fs = require("fs")
const lilypond = require("../output/lilypond");



process.env.LILYPOND_INIT_SVG_WOFF = "#f";


const main = async (filename) => {
	const code = fs.readFileSync(filename);
	const error = await lilypond.engrave(code, {
		onSVG (filename, content) {
			console.log("SVG received:", filename);
			fs.promises.writeFile(filename, content);
		},
	});

	console.log("Done:", error);
};


main(process.argv[2]);
