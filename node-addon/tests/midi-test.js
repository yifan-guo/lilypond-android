
const fs = require("fs")
const lilypond = require("../output/lilypond");



const main = async () => {
	const code = fs.readFileSync("./tests/assets/midi-test.ly");

	const error = await lilypond.engrave(code, {
		onMIDI (filename, data) {
			console.log("MIDI file received:", filename);

			fs.promises.writeFile("./test.midi", Buffer.from(data))
				.then(() => console.log("test.midi wrote."));
		},
	});

	console.log("result:", error);
};


main();
