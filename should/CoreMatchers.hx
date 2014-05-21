package should;

import should.Matcher;
import should.MatcherPlus;

class CoreMatchers  {
	public static inline function beTrue(): MatcherPlus<Bool> {
		return new CoreTrueMatcher();
	}

	public static inline function beNull(): MatcherPlus<Dynamic> {
		return new CoreNullMatcher();
	}

	public static inline function beEqualTo<T>(expected: T): MatcherPlus<T> {
		return new CoreEqualToMatcher<T>(expected);
	}

	public static inline function not<T>(matcher: MatcherPlus<T>): MatcherPlus<T> {
		return new CoreNotToMatcher<T>(matcher);
	}
}

private class CoreTrueMatcher implements Matcher<Bool> {
	public function new() {}

	public function evaluate(actual: Bool, negate: Bool): should.EvalResult {
		return {};
	}
}

private class CoreNullMatcher implements Matcher<Dynamic> {
	public function new() {}

	public function evaluate(actual: Dynamic, negate: Bool): should.EvalResult {
		return {};
	}
}

private class CoreEqualToMatcher<T> implements Matcher<T> {
	public function new(expected: T) {

	}

	public function evaluate(actual: T, negate: Bool): should.EvalResult {
		return {};
	}
}

private class CoreNotToMatcher<T> implements Matcher<T> {
	public function new(matcher: Matcher<T>) {

	}

	public function evaluate(actual: T, negate: Bool): should.EvalResult {
		return {};
	}
}


