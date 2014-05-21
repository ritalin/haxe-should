package should;

typedef EvalResult = {

}

interface Matcher<T> {
	function evaluate(actual: T, negate: Bool): EvalResult;
}
