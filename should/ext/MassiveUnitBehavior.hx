package should.ext;

import massive.munit.Assert;
import should.Behavior;

class MassiveUnitBehavior {
	public static function apply() {
		Behavior.registerFailed(
			function (message: String) {
				Assert.fail(message);
			}
		);
	}
}