package should;

class ShouldRunner<T> {
	private var comment: String;
	private var actualVal: T;

	public function new(comment: String, val: T) {
		this.comment = comment;
		this.actualVal = val;
	}

	public function should(constraint: Matcher<T>): Void {

	}
}