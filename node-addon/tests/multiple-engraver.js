
const lilypond = require("../output/lilypond");

const main = async () => {
	const result1 = await lilypond.test("./tests/assets/simple.ly");
	const result2 = await lilypond.test("./tests/assets/little-star.ly");

	console.log("results:", /*result1,*/ result2);
};


main();
