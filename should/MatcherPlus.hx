package should;

import should.Matcher;

abstract MatcherPlus<T>(Matcher<T>) to Matcher<T> {
	@:op(A && B)
	public static function combinWithAnd<U>(lhs: MatcherPlus<U>, rhs: MatcherPlus<U>): MatcherPlus<U> {
		return new CoreAndMatcher(lhs, rhs);
	}

	@:op(A || B)
	public static function combinWithOr<U>(lhs: MatcherPlus<U>, rhs: MatcherPlus<U>): MatcherPlus<U> {
		return new CoreOrMatcher(lhs, rhs);
	}

	private inline function new(matcher: Matcher<T>) {
		this = matcher;
	}

	@:from
	public static inline function _<U>(matcher: Matcher<U>) {
		return new MatcherPlus<U>(matcher);
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
