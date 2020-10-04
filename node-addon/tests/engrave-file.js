
const fs = require("fs")
const lilypond = require("../output/lilypond");



const main = async (filename) => {
	const code = fs.readFileSync(filename);
	const error = await lilypond.engrave(code, {
		onSVG (filename, content) {
			console.log("SVG received:", filename);
			fs.promises.writeFile(filename, content);
		},
		onMIDI (filename, data) {
			console.log("MIDI received:", filename);

			fs.promises.writeFile(filename, Buffer.from(data));
		},
	});

	console.log("Done:", error);
};


main(process.argv[2]);
