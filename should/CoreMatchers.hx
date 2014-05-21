package should;

import should.Matcher;

class CoreMatchers  {
	public static inline function beTrue(): Matcher<Bool> {
		return new CoreTrueMatcher();
	}

	public static inline function beNull(): Matcher<Dynamic> {
		return new CoreNullMatcher();
	}

	public static inline function beEqualTo<T>(expected: T): Matcher<T> {
		return new CoreEqualToMatcher<T>(expected);
	}

	public static inline function not<T>(matcher: Matcher<T>): Matcher<T> {
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


