package should;

class Behavior {
	private static var callback: String -> Void;

	public static function registerFailed(c: String -> Void) {
		callback = c;
	}

	public static function fail(message: String) {
		callback(message);
	}
}