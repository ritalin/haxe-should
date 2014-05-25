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
		this.runFailTest(
			function() { its('bool value').val(false).should(beTrue); return 'bool value'; }
		);
	}
	
	@Test
	public function testShouldBeNull():Void {
		this.runFailTest(
			function() { its('int value').val(100).should(beNull); return 'int value'; }
		);
		this.runFailTest(
			function() { its('float value').val(123.4).should(beNull);return 'float value'; }
		);
		this.runFailTest(
			function() { its('bool value').val(false).should(beNull); return 'bool value'; }
		);
		this.runFailTest(
			function() { its('structure value').val({ key: 12345 }).should(beNull); return 'structure value'; }
		);
	}	

	@Test
	public function testShouldBeEqual():Void {
		this.runFailTest(
			function() { its('int value').val(100).should(beEqualTo(123)); return 'int value'; }
		);
		this.runFailTest(
			function() { its('float value').val(123.4).should(beEqualTo(123)); return 'float value'; }
		);
		this.runFailTest(
			function() { its('bool value').val(false).should(beEqualTo(true)); return 'bool value'; }
		);
		this.runFailTest(
			function() { its('structure value').val({ key: 12345 }).should(beEqualTo({ key: 1234 })); return 'structure value'; }
		);
	}
}