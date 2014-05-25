package should.ext;

import massive.munit.Assert;
import should.Behavior;

class MUnitBehavior {
	public static function apply() {
		Behavior.registerFailed(
			function (message: String) {
				Assert.fail(message);
			}
		);
	}
}