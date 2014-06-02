haxe-should
===========

haxe-should can be introduced constraint-based assertion to unit test framework.
haxe-should uses [Abstract Type](http://haxe.org/manual/types-abstract.html). 
Therefore, it can be vailable in Haxe 3 or later.

Currently, only [MUnit](https://github.com/massiveinteractive/MassiveUnit) is supported.

Install
--------

Zip archive of this tool is [downloading](https://github.com/ritalin/haxe-should/archive/master.zip), 

or clone from git. 

```
git clone https://github.com/ritalin/haxe-should.git
```

then add to classpass of a target project.

In hxml file, for example,

```
 -cp /path/to/haxe-should
```

preliminary preparation
------------------------

Before this feature is used, 
a "failed behavior" must be registered in a entry point function of test environment (usually, main routine).

For munit, calling static function: *should.ext.MUnitBehavior.apply()* is lead to register this behaviot.

Usage
--------

In test method, perform assertion. For example equality assertion of value...

```
// recommend static importing for a easy-to-use.
import should.ActualFactory.*;
import should.CoreMatchers.*;

...

var n = 100;
its('numeric value test').val(n).should( beEqualTo(100) );
```

Assertion cosists of three part.

* First part(its) describes comment for test performing.
* Second part(val / call) passes a actual value (or actual call).
* Finally, third part(should) specifies expect value macher in should call.

Features
==========

Expect value machers
---------------------

Currently, it's available following machers.

For the actual value...

### should.CoreMatchers.beNull

Describes later, sorry.

### should.CoreMatchers.beTrue

Describes later, sorry.

### should.CoreMatchers.beEqualTo(expected: Dynamic)

Describes later, sorry.

For thenactual call...

### should.CoreMatchers.beThrown(exceptType: Dynamic)

Describes later, sorry.

And, for negative maching...

### should.CoreMatchers.not(macher: IMatcher<T>)

Describes later, sorry.

Additionally, using operator *&&* (and) or *||* (or) allow to specify mixed machings.

For exampe.

```
its('true or null').val(false).should(beTrue || beNull); // this test will fail.
```

Note that mix macher operator may be influence by priorities of operators. 

Customize
==========

Use other test framework
-------------------------

Making custom fail behavior, it registers exception thrown on test failing.

See *should/ext/MUnitBehavior.hx* for details.

custom matcher
-----------------

All matchers is implemented in *should.Matcher<T>* interface (should/Matcher.hx).

*should.Matcher<T>* has one method, *evaluate(actual: T, expected: T, negate: boolean): EvaluateResult*.

first argument and second argument in this method, actual value (or call) and expected value is passed, respectively.
And negative flag is passed to third argument. if use not matcher, true will be passed.

And mix macher operator is implemented in *Abstract Type*.
Therefore customized matcher instance must be wrapped *haxe.MatcherPlus<T>*.

See *should/CoreMatchers.hx* for details.



