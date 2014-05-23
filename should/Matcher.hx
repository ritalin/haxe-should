package should;

import haxe.ds.Option;

enum EvalResult {
	Pass;
	Failed(message: String);
}

interface Matcher<T> {
	function evaluate(comment: String, actual: T, negate: Bool): EvalResult;
}
