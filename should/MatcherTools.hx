package should;

import should.Matcher;

abstract MatcherTools<T>(Matcher<T>) to Matcher<T> {
	@:op(A && B)
	public static function combinWithAnd<U>(lhs: Matcher<U>, rhs: MatcherTools<U>): Matcher<U> {
		return new CoreAndMatcher(lhs, rhs);
	}

	@:op(A || B)
	public static function combinWithOr<U>(lhs: Matcher<U>, rhs: MatcherTools<U>): Matcher<U> {
		return new CoreOrMatcher(lhs, rhs);
	}

	private inline function new(matcher: Matcher<T>) {
		this = matcher;
	}

	@:from
	public static inline function _<U>(matcher: Matcher<U>) {
		return new MatcherTools<U>(matcher);
	}
}

private class CoreAndMatcher<T> implements Matcher<T> {
	public function new(lhs: Matcher<T>, rhs: Matcher<T>) {

	}

	public function evaluate(actual: T, negate: Bool): should.EvalResult {
		return {};
	}
}

private class CoreOrMatcher<T> implements Matcher<T> {
	public function new(lhs: Matcher<T>, rhs: Matcher<T>) {

	}

	public function evaluate(actual: T, negate: Bool): should.EvalResult {
		return {};
	}
}
