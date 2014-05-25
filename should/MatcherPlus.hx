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
	private var lhs: Matcher<T>;
	private var rhs: Matcher<T>;

	public function new(lhs: Matcher<T>, rhs: Matcher<T>) {
		this.lhs = lhs;
		this.rhs = rhs;
	}

	public function evaluate(comment: String, actual: T, negate: Bool): EvalResult {
		return
			switch (lhs.evaluate(comment, actual, negate)) {
			case result = Failed(_): result;
			case Pass: rhs.evaluate(comment, actual, negate);
			}
		;
	}
}

private class CoreOrMatcher<T> implements Matcher<T> {
	private var lhs: Matcher<T>;
	private var rhs: Matcher<T>;
	
	public function new(lhs: Matcher<T>, rhs: Matcher<T>) {
		this.lhs = lhs;
		this.rhs = rhs;
	}

	public function evaluate(comment: String, actual: T, negate: Bool): should.EvalResult {
		return
			switch (lhs.evaluate(comment, actual, negate)) {
			case result = Pass: result;
			case Failed(_): rhs.evaluate(comment, actual, negate);
			}
		;
	}
}
