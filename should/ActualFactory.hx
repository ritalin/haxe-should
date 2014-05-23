package should;

class ActualFactory {
	private var comment: String;

	private inline function new(comment: String) {
		this.comment = comment;
	}

	public static inline function its(comment: String) {
		return new ActualFactory(comment);
	}

	public function val<T>(actual: T) {
		return ShouldRunner.valueEvaluationRunSpec(this.comment, actual);
	}

	public function call(closure: Void -> Void) {
		return ShouldRunner.callEvaluationRunSpec(this.comment, closure);
	}
}
