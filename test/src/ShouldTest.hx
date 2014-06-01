package;

import should.ActualFactory.*;
import should.CoreMatchers.*;

import massive.munit.Assert;

import haxe.CallStack;

/**
* Auto generated ExampleTest for MassiveUnit. 
* This is an example test class can be used as a template for writing normal and async tests 
* Refer to munit command line tool for more information (haxelib run munit)
*/
class ShouldTest {
	public function new() { }
	
	@BeforeClass
	public function beforeClass():Void { }
	
	@AfterClass
	public function afterClass():Void { }
	
	@Before
	public function setup():Void { }
	
	@After
	public function tearDown():Void { }
	
	private function runFailTest(test: Void -> String) {
		var result =		
			try {
				test();
			}
			catch (ex: Dynamic) {
				'';
			}
		;
		
		if (result != '') {
			Assert.fail('test must be failed (test: ${result}).');
		}
	}

	@Test
	public function testShouldBeTrue():Void {
		its('bool value[success]').val(true).should(beTrue);

		this.runFailTest(
			function() { its('bool value[failed]').val(false).should(beTrue); return 'bool value'; }
		);
	}
	
	@Test
	public function testShouldBeNull():Void {
		its('structure value[success]').val(null).should(beNull);

		this.runFailTest(
			function() { its('int value[failed]').val(100).should(beNull); return 'int value[failed]'; }
		);
		this.runFailTest(
			function() { its('float value[failed]').val(123.4).should(beNull); return 'float value[failed]'; }
		);
		this.runFailTest(
			function() { its('bool value[failed]').val(false).should(beNull); return 'bool value[failed]'; }
		);
		this.runFailTest(
			function() { its('structure value[failed]').val({ key: 12345 }).should(beNull); return 'structure value[failed]'; }
		);
	}	

	@Test
	public function testShouldBeEqual():Void {
		its('int value[success]').val(100).should(beEqualTo(100));

		this.runFailTest(
			function() { its('int value[failed]').val(100).should(beEqualTo(123)); return 'int value[failed]'; }
		);

		its('float value[success]').val(123.4).should(beEqualTo(123.4));

		this.runFailTest(
			function() { its('float value[failed]').val(123.4).should(beEqualTo(123)); return 'float value[failed]'; }
		);

		its('bool value[success]').val(false).should(beEqualTo(false));

		this.runFailTest(
			function() { its('bool value[failed]').val(false).should(beEqualTo(true)); return 'bool value[failed]'; }
		);

		its('structure value[success]').val({ key: 12345 }).should(beEqualTo({ key: 12345 }));

		this.runFailTest(
			function() { its('structure value[failed]').val({ key: 12345 }).should(beEqualTo({ key: 1234 })); return 'structure value[failed]'; }
		);
	}

	@Test
	public function testShouldNot() {
		its('int value[success]').val(100).should( not( beEqualTo(123) ));

		this.runFailTest(
			function() { its('int value[failed]').val(100).should( not( beEqualTo(100) )); return 'int value[failed]'; }
		);
	}

	@Test
	public function testShouldOr() {
		its('float value[success]').val(123.4).should(beEqualTo(123) || beEqualTo(123.4));

		this.runFailTest(
			function() { its('float value[failed]').val(123.4).should(beEqualTo(123) || beEqualTo(123.5)); return 'float value[failed]'; }
		);
	}

	@Test
	public function testShouldAnd() {
		var target = { key1: 12345, key2: 'qwerty' };

		its('structure value[success]').val(target).should( not( beNull ) && beEqualTo({ key1: 12345, key2: 'qwerty' }));

		this.runFailTest(
			function() { 
				its('structure value[failed]').val({ key: 1234 }).should(beEqualTo({ key1: 12345, key2: 'abcdef' })); 
				return 'structure value[failed]'; 
			}
		);
	}

	private function raiseException(error: Dynamic) {
		throw error;
	}

	@Test
	public function testSuccessForShouldThrow() {
		its('throw string').call(
			function () {
				raiseException('exception captured.');
			}
		)
		.should(beThrown('exception captured.'));

		its('throw int').call(
			function () {
				raiseException(1024);
			}
		)
		.should(beThrown(1024));

		var errObj = { message: 'object thrown.' }

		its('throw object').call(
			function () {
				raiseException(errObj);
			}
		)
		.should(beThrown(errObj));
	}

	@Test
	public function testFailedForShouldThrow() {
		this.runFailTest(
			function() { 
				its('throw string 1').call(
					function () {
						raiseException('another exception.');
					}
				)
				.should(beThrown('exception captured.'));

				return 'throw string 1';
			}
		);

		this.runFailTest(
			function() { 
				its('throw string 2').call(
					function () {
						raiseException('string thrown');
					}
				)
				.should(beThrown(1024));

				return 'throw string 2';
			}
		);
	}
}