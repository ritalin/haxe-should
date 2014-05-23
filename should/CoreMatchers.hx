package should;

import should.Matcher;
import should.MatcherPlus;

class CoreMatchers  {
	public static var beTrue(get, null): MatcherPlus<Bool>;
	public static var beNull(get, null): MatcherPlus<Dynamic>;

	public static inline function beEqualTo<T>(expected: T): MatcherPlus<T> {
		return new CoreEqualToMatcher<T>(expected);
	}

	public static inline function not<T>(matcher: MatcherPlus<T>): MatcherPlus<T> {
		return new CoreNotToMatcher<T>(matcher);
	}

	private static var _beTrue: MatcherPlus<Bool> = new CoreTrueMatcher();
	private static var _beNull: MatcherPlus<Dynamic> = new CoreNullMatcher();

	private static inline function get_beTrue() { return _beTrue; }
	private static inline function get_beNull() { return _beNull; }
}

private class CoreTrueMatcher implements Matcher<Bool> {
	public function new() {}

	public function evaluate(comment: String, actual: Bool, negate: Bool): should.EvalResult {
		return EvalResult.Failed('Not Implemented');
	}
}

private class CoreNullMatcher implements Matcher<Dynamic> {
	public function new() {}

	public function evaluate(comment: String, actual: Dynamic, negate: Bool): should.EvalResult {
		return EvalResult.Failed('Not Implemented');
	}
}

private class CoreEqualToMatcher<T> implements Matcher<T> {
	public function new(expected: T) {

	}

	public function evaluate(comment: String, actual: T, negate: Bool): should.EvalResult {
		return EvalResult.Failed('Not Implemented');
	}
}

private class CoreNotToMatcher<T> implements Matcher<T> {
	public function new(matcher: Matcher<T>) {

	}

	public function evaluate(comment: String, actual: T, negate: Bool): should.EvalResult {
		return EvalResult.Failed('Not Implemented');
	}
}


