package should;

class ActualFactory {
	private var comment: String;

	private inline function new(comment: String) {
		this.comment = comment;
	}

	public static inline function its(comment: String) {
		return new ActualFactory(comment);
	}

	public function val<T>(actual: T): ShouldRunner<T> {
		return new ShouldRunner<T>(this.comment, actual);
	}

	public function call(closure: Void -> Void): ShouldRunner<Void -> Void> {
		return new ShouldRunner<Void -> Void>(this.comment, closure);
	}
}
