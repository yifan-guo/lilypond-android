
const lilypond = require("../output/lilypond");

//console.log("test:", lilypond.test(), lilypond.test(), lilypond.test());
const main = async () => {
	const result = await lilypond.test("\\relative {c'1}");
	console.log("result:", result);
};


main();
