package should;

class ShouldRunner {
	public static function valueEvaluationRunSpec<T>(comment: String, actualValue: T) {
		return new ValueEvaluateRunSpec<T>(comment, actualValue);
	}

	public static function callEvaluationRunSpec<T>(comment: String, closure: Void -> Void) {
		return new CallEvaluateRunSpec(comment, closure);
	}
}

private class ValueEvaluateRunSpec<T> {
	private var comment: String;
	private var actualValue: T;

	public function new(comment: String, actualValue: T) {
		this.comment = comment;
		this.actualValue = actualValue;
	}

	public function should(matcher: Matcher<T>): Void {
		var result = matcher.evaluate(this.comment, this.actualValue, false);

		switch (result) {
		case Failed(message): Behavior.fail(message);
		default:
		}
	}
}

private class CallEvaluateRunSpec {
	private var comment: String;
	private var closure: Void -> Void;

	public function new(comment: String, closure: Void -> Void) {
		this.comment = comment;
		this.closure = closure;
	}

	public function should(matcher: Matcher<Dynamic>): Void {
		var result = 
			try {
				this.closure();

				matcher.evaluate(this.comment, null, false);
			}
			catch (ex: Dynamic) {
				matcher.evaluate(this.comment, ex, false);
			}
		;

		switch (result) {
		case Failed(message): Behavior.fail(message);
		default:
		}
	}
}