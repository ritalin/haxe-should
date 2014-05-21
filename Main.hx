package ;

import should.ActualFactory.*;
import should.CoreMatchers.*;

class Main {
	static function main() {
		its('hogeee-1').val(true).should( beTrue() );
		its('hogeee-2').val(null).should( beNull() );
		its('hogeee-3').val(100).should( beEqualTo(100) );
		its('hogeee-4').val({ a: 100, b: 'qwerty' }).should( not( beNull() ));

		its('hogeee-5').val(123).should( not( beEqualTo(200) ) && not ( beEqualTo(100) ));
		its('hogeee-6').val(123).should( beEqualTo(200) || beEqualTo(123) );
	}
}