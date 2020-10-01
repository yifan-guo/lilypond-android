
const lilypond = require("../output/lilypond");

//console.log("test:", lilypond.test(), lilypond.test(), lilypond.test());
const main = async () => {
	const result = await lilypond.test("./tests/assets/simple.ly");
	console.log("result:", result);
};


main();
