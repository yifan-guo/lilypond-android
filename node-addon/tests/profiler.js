
const fs = require("fs")
const lilypond = require("../output/lilypond");



const engrave = code => lilypond.engrave(code, {
	onSVG (filename) {
		console.log("SVG received:", filename);
	},
	onMIDI (filename) {
		console.log("MIDI received:", filename);
	},
});


const main = async (filename, times = 3) => {
	times = Number(times);

	console.log("[profiler] begin.");

	const code = fs.readFileSync(filename);
	const t00 = Date.now();
	let t0 = t00;

	for (let i = 0; i < times; ++i) {
		await engrave(code);

		const t1 = Date.now();
		console.log(`[profiler] engrave.${i + 1}`, t1 - t0);

		t0 = t1;
	}

	const total = Date.now() - t00;
	console.log("[profiler] summary:", total, total / times);
};


main(...process.argv.slice(2));
