package should;

import should.Matcher;

abstract MatcherPlus<T>(Matcher<T>) to Matcher<T> {
	@:op(A && B)
	public static function combinWithAnd<U, V>(lhs: MatcherPlus<U>, rhs: MatcherPlus<V>): MatcherPlus<Dynamic> {
		return new CoreAndMatcher(lhs, rhs);
	}

	@:op(A || B)
	public static function combinWithOr<U, V>(lhs: MatcherPlus<U>, rhs: MatcherPlus<V>): MatcherPlus<Dynamic> {
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

private class CoreAndMatcher<U, V> implements Matcher<Dynamic> {
	private var lhs: Matcher<U>;
	private var rhs: Matcher<V>;

	public function new(lhs: Matcher<U>, rhs: Matcher<V>) {
		this.lhs = lhs;
		this.rhs = rhs;
	}

	public function evaluate(comment: String, actual: Dynamic, negate: Bool): EvalResult {
		return
			switch (lhs.evaluate(comment, actual, negate)) {
			case result = Failed(_): result;
			case Pass: rhs.evaluate(comment, actual, negate);
			}
		;
	}
}

private class CoreOrMatcher<U, V> implements Matcher<Dynamic> {
	private var lhs: Matcher<U>;
	private var rhs: Matcher<V>;
	
	public function new(lhs: Matcher<U>, rhs: Matcher<V>) {
		this.lhs = lhs;
		this.rhs = rhs;
	}

	public function evaluate(comment: String, actual: Dynamic, negate: Bool): should.EvalResult {
		return
			switch (lhs.evaluate(comment, actual, negate)) {
			case result = Pass: result;
			case Failed(_): rhs.evaluate(comment, actual, negate);
			}
		;
	}
}
