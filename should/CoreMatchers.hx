package should;

import haxe.EnumTools;

import should.Matcher;
import should.MatcherPlus;

class CoreMatchers  {
	public static var beTrue(get, null): MatcherPlus<Bool>;
	public static var beNull(get, null): MatcherPlus<Dynamic>;

	public static inline function beEqualTo<T>(expected: T): MatcherPlus<T> {
		return new CoreEqualToMatcher<T>(expected);
	}

	public static inline function not<T>(matcher: MatcherPlus<T>): MatcherPlus<T> {
		return new CoreNotMatcher<T>(matcher);
	}

	private static var _beTrue: MatcherPlus<Bool> = new CoreTrueMatcher();
	private static var _beNull: MatcherPlus<Dynamic> = new CoreNullMatcher();

	private static inline function get_beTrue() { return _beTrue; }
	private static inline function get_beNull() { return _beNull; }
}

private class CoreTrueMatcher implements Matcher<Bool> {
	public function new() {}

	public function evaluate(comment: String, actual: Bool, negate: Bool): should.EvalResult {
		return 
			if (actual || negate) {
				EvalResult.Pass;
			}
			else {
				var n = negate ? '' : 'not ';
				EvalResult.Failed('The actual value (${comment}) was ${n}true.');
			}
		;
	}
}

private class CoreNullMatcher implements Matcher<Dynamic> {
	public function new() {}

	public function evaluate(comment: String, actual: Dynamic, negate: Bool): should.EvalResult {
		return 
			if ((actual == null) || negate) {
				EvalResult.Pass;
			}
			else {
				var a = ResultFormatter.format(actual);
				var n = negate ? '' : 'not ';
				EvalResult.Failed('The actual value (${comment}) was ${n}nil.\n\t-actual: ${a}');
			}
		;
	}
}

private class CoreEqualToMatcher<T> implements Matcher<T> {
	private var expected: T;

	public function new(expected: T) {
		this.expected = expected;
	}

	public function evaluate(comment: String, actual: T, negate: Bool): should.EvalResult {
		var result = 
			switch (Type.typeof(this.expected)) {
			case TEnum(_): Type.enumEq(expected, actual);
			case TObject: '${actual}' == '${this.expected}';
			default: expected == actual;
			}
		;		

		return 
			if (result) {
				EvalResult.Pass;
			}
			else {
				var a = ResultFormatter.format(actual);
				var e = ResultFormatter.format(this.expected);
				var n = negate ? '' : 'not ';

				EvalResult.Failed(
					'The actual value (${comment}) was ${n}equal to a expected value.\n\t-actual: ${a}\n\t-expected: ${e}'
				);
			}
		;
	}
}

private class CoreNotMatcher<T> implements Matcher<T> {
	private var matcher: Matcher<T>;

	public function new(matcher: Matcher<T>) {
		this.matcher = matcher;
	}

	public function evaluate(comment: String, actual: T, negate: Bool): should.EvalResult {
		return this.matcher.evaluate(comment, actual, (! negate));
	}
}

private class ResultFormatter {
	public static function format(value: Dynamic): String {
		return
			switch (Type.typeof(value)) {
			case TNull: 'null';
			case TFunction: 'function';
			case TUnknown: 'unknown';
			case TInt | TFloat | TBool | TObject: '${value}';
			case TClass(c): Type.getClassName(c);
			case TEnum(e): '${EnumTools.getName(e)}.${EnumValueTools.getName(value)}';
			}	
		;	
	}
}
