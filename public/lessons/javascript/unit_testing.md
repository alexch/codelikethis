# Testing your Code

Testing is an important part of writting good code. It provides several benefits

* lets us refactor at will without worrying about breaking everything beyond repair.

* helps us think through our code structure

* allows us to make sure reality matches our expectations

* lets others have confidence that our code works as it should

# Unit Testing

Unit testing is the most granular form of testing, and is done on individual functions or classes.

When unit testing the programmer gives a value to the function or class, and tells it what the expected output should be.  If the actual output matches the expected output then the test passes.

# Integration Testing

Integration Testing is the middle level of testing, and tests multible units that interact with one another, providing them a given input and expected outputs to see all outputs as well as any unexpected side effects

# Acceptance testing

Acceptance tests, or End to End tests are the most abstract form of testing and simulate a user interacting with the program as a whole.  Unlike Unit testung ad Integration testing these tests ignore the internal structure of the application, and only test the user-facing interface.

# Testing Frameworks & Libraries

As with all things JavaSCript everyone has their own opinion on how to write tests, and many programmers have made frameworks to codify their perfered method.  In this lesson we will be focusing on unit testing using Mocha and Chai

# Chai

Chai is a very customizable assertion library for JavaScript that allows you to write tests in your preferred format, and is compatible with all modern browsers.

Chai can be installed through npm `npm install chai`

There are three common ways of making assertions in JavaScript

* `should`
* `expect`
* `assert`

Chai also has many, many plugins for integrating with other JS frameworks. You can find a complete list [here](https://www.chaijs.com/plugins/)

# Should

To use `should` syntax with chai you will first need to initialize it by calling `chai.should()` before you start writing your tests. `should` assertions are BDD style which means that you can chain natural language getters to construct your assertions

```js
const chai = require('chai') //import the 'chai' object
chai.should(); // initializes chai's 'should' syntax for writing tests

foo.should.be.a('string'); // variable 'foo' should be of the type 'string'

foo.should.equal('bar'); // the variable 'foo' should equal the string 'bar'

foo.should.have.lengthOf(3); // variable 'foo' should have a 'length' property equal to 3

tea.should.have.property('flavors') // 'tea' is an object that should have a property called 'falvors'
  .with.lengthOf(3); //'flavors' is some sort of object with a length property of 3
```

# Expect

To use the `expect` syntax with chai you will need to create a new variable that equals chai's `.expect` method. Like `should` `expect` is also in the BDD style and makes use of chained natural language getters. 

```js
const chai = require('chai') // import the 'chai' object
const expect = chai.expect; // makes the 'expect' method on the 'chai' object a global function

expect(foo).to.be.a('string'); // variable 'foo' should be of the type 'string'

expect(foo).to.equal('bar'); // the variable 'foo' should equal the string 'bar'

expect(foo).to.have.lengthOf(3); // variable 'foo' should have a 'length' property equal to 3

expect(tea).to.have.property('flavors') // 'tea' is an object that should have a property called 'falvors'
  .with.lengthOf(3);  //'flavors' is some sort of object with a length property of 3
```

# Assert

Unlike `expect` and `should` `assert` is not in the BDD style and instead follows the `assert` syntax which is bundled with Node.js. It also extends the functionality of assert by providing several more tests and being browser compatible.

```js
const chai = require('chai')
const require = chai.require

assert.typeOf(foo, 'string');  // variable 'foo' should be of the type 'string'

assert.typeOf(foo, 'string', 'foo is a string');  // variable 'foo' should be of the type 'string', and prints the optional message when the test passes

assert.equal(foo, 'bar', 'foo equal `bar`'); // the variable 'foo' should equal the string 'bar'

assert.lengthOf(foo, 3, 'foo`s value has a length of 3'); // variable 'foo' should have a 'length' property equal to 3

assert.lengthOf(tea.flavors, 3, 'tea has 3 types of flavor'); // object 'tea' has a property 'flavors' that has a length of 3
```

>In all instances `assert` allows you to pass an optional message as the third argument to the method

# Mocha

Mocha is an asynchronous JavaScript testing framework that works in both Node.js and the browser.  Mocha tests run from top to bottom, and since they're asynchronous it is easy to track exactly which test you're on, and what you're testing.

Mocha allows you to use any assertion library you want for writing its tests.  This means we can use `chai` right inside of `mocha` to use whatever method of writing assertions we want

You can install mocha globally using `npm install --global mocha` then write your tests using the mocha framework. Don't forget to add a test script in your package.json `"test": "mocha"`

# The Mocha Lifecycle

Mocha supports several lifecycle hooks for setting up code before running the tests, and cleaning up after them.  It doesn't matter where in your codeblock you put the lifecycle callabcks as they will run when their lifecycle event is hit rather than at the location where they are defined.

* `before(function(){...})`  run this block of code prior to **all** the tests in this block.
* `after(function(){...})`  run this block of code after **all** the tests in this block.
* `beforeEach(function(){...})` run this block of code prior to **every** test in this block.
* `afterEach(function(){...})` run this block of code after **every** test in this block.

# Testing Asynchronous code with Mocha

* callbacks
* promises
* async/await

# Callbacks in Mocha

Mocha handels async code using callback functions. Usually this callback is named `done`, and if `done`
is called without errors then the test passes

```js
describe('User', function() {
  describe('#save()', function() {
    it('should save without error', function(done) {
      var user = new User('Luna');
      user.save(function(err) {
        if (err) {
          done(err)
        } else { done() };
      });
    });
  });
});
```

# Mocha Promises

As well as callback functions mocha also supports promises! This can be quite useful if your api returns promises or uses promise chaining rather than callback functions.

```js
beforeEach(function() {
  return db.clear().then(function() {
    return db.save([tobi, loki, jane]);
  });
});

describe('#find()', function() {
  it('respond with matching records', function() {
    return db.find({type: 'User'}).should.eventually.have.length(3);
  });
});
```

> Note: Do **not** use **both** promises and callbacks or Mocha will throw an error

# Async/Await with Mocha

You can write asynchronous tests in mocha using async/await in any environment that supports async/await.

```js
beforeEach(async function() {
  await db.clear();
  await db.save([tobi, loki, jane]);
});

describe('#find()', function() {
  it('responds with matching records', async function() {
    const users = await db.find({type: 'User'});
    users.should.have.length(3);
  });
});
```

# Danger: Arrow Functions

Do to arrow functions binding `this` to context they can cause issues with testing.  It is recomended you don't use them when writing your tests.

# Inclusive Tests

# Exclusive Tests

# Pending Tests

# Dynamically Generating Tests