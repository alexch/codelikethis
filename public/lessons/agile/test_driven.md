# Test Driven Development

The basic principle of TDD is that you write your tests first, and then you write code to make that test past.  You never write code you haven't already written a test for.

# Part I: Basic Techniques

# Red, Green, Refactor

* First, write a test and watch it fail
  * Make sure it's failing for the right reason!
* Next, write just enough code to make it pass
  * Enjoy the green!
* Finally, look at your code (and your test!) and see if you can clean it up
  * change names
  * remove duplication
  * extract methods

# Make it green, then make it clean

![Make it green](/images/make-it-green.png)

# Addicted to green

* You get a little rush every time a new test passes
* Steady, incremental feeling of progress
* Don't write code all day without knowing if it works

# Blueprint for a Single Test

* GIVEN (set up preconditions)
* WHEN (call production code)
* THEN (check the results)

# Assert

* The heart of a unit test
* An assertion is a *claim* about the code
  * Failed assertion -> code is incorrect
  * Passing assertion -> code is correct

* Example:

        Set set = new MySet();
        set.add("ice cream");
        assertTrue(set.contains("ice cream"));

* In RSpec, "assert" is called "should" or "expect"
* In Jasmine/Jest, "assert" is called "expect...to"

# One Step At A Time

* Don't be over-ambitious
* Each test -- especially each new test -- should add one brick to the wall of knowledge
* Pick tests (features) in order of growth

# The Null Test

* A great first test to write
* Input and output are trivial
* Helps you develop skeleton
* Helps you think about interface

# Test List

* Before you begin, make a TODO list
* Write down a bunch of operations
* For each operation, list the null test and some others
* Also put down refactorings that come to mind
* Why not write all the tests in code first?
  * Could box you in
  * Interferes with red-green-refactor

# Fake it till you make it

* It's okay to hardcode answers for the first few tests
* After a while, your tests will force your code to be more correct
* If you refactor, you will almost always come up with a more elegant solution than a big switch statement

# Assert First

* When you get stuck on a test, try starting with the assertion(s) and then work your way backwards to the setup
* Start with the assert

        assertTrue(set.contains("cake"));

* Then add the code above it

        Set set = new MySet();
        set.add("cake");

* Helps focus on goal

# Fake It 'Til You Make It

* Start with hardcoded results and wait until later tests to force them to become real

# Obvious Implementation

* aka Don't be stupid
* If you really, really, honestly know the "right" way to implement it, then write it that way
* But keep track of how many times your "obvious implementation" was broken or untested
  * Edge cases, off-by-one errors, null handling... all deserve tests and often the Obvious Implementation is not covered

# Interlude: The Blank Page

* Let's test-drive a utility class

# Part II: Testing Philosophy

# Automated Testing Layers

* Unit
* Integration
* Acceptance
* QA
* UI
* Performance
* Monitoring

# A Good Test Is...

* Automated
* Isolated
* Repeatable
* Fast
* Easy to write and maintain
* Focused
* Easy to read
* Robust (opposite: Brittle)

# Tests are "Executable Specifications"

* Someone should be able to understand your class by reading the tests

>   "Any fool can write code that a computer
>     can understand. Good programmers write
>     code that humans can understand."
>   – Martin Fowler

# Why do you test?

# Why do you test?

* Design
* Prevent bugs
* Regress bugs ("bug repellant")
* Discover bugs
* Localize defects
* Understand design
* Document (or specify) design
* Improve design
* Support refactorings
* Enable experimentation and change

# When do you test?

* Before checkin
* After update
* Before deploy
* While coding
* In the background

# When do you test?

* All the time

# Why test first?

* Gets tests written
* Easier than retrofitting tests onto an existing system
* Guarantees 100% test coverage
  * Note: not the same as 100% functional coverage, or a guarantee that your code does what it's supposed to

# Why test first? (cont.)

* Reduces scope of production code
  * less scope -> less work
* Encourages better design
  * usable interfaces (since the tests are a working client)
  * more useful methods and fewer useless ones
  * Implementation matches design
* Guarantees testability

# Can't I write tests later?

* In practice, you never have time after the code is written
* but under TDD, you always have the time before
  * Go figure :-)

# How can you write tests for code that doesn't exist?

Some tricks to get started:

* Think of tests as examples or specs. Think of a thing the program should do, then write a test for *just that one thing*.
* Test the null case -- what should happen when you call the function or construct the object with no parameters?
* Write functioning code inside the test suite, then extract that code to a function or class, then move that function (or class) into the production codebase

> "If you can't write a test, then you don't know what the code should do. And what business do you have writing code in the first place when you can't say what it's supposed to do?"
> - Rob Mee

# Spike to Learn

If you don't know what test to write, then start with a spike.

A "spike" is an experiment, a proof of concept, a playground. 

Code until you feel confident that you understand the general shape of the solution.

Then put your spike aside and *write it again* test-first.

# Unit Testing Is Hard...

* It forces you to really understand the requirements
* It forces you to really understand the code
* It forces you to really understand the tests
* It forces you to create code that is truly reusable and modular and testable
  * "put your money where your mouth is"
* These forces drive you to keep your code and your tests simple and easy to understand

## ...but it makes your life easier

# Test-Driving Is Slower At First

* Need to spend time on infrastructure, fixtures, getting comfortable with TDD
* Business case for TDD: sustainable velocity
  * for feature velocity, stabilty > early oomph
* Famous Graph

# TDD vs TDD

* Test-Driven Development
  * Good old-fashioned coding, now with tests!
  * Much of the design is already specified before you start
* Test-Driven Design
  * Free your mind and the code will follow
  * Refactor at will, listen to what the tests are telling you

Quite a lot of overlap, but worth keeping difference in mind

# Test for "essential complexity"

* Not too big, not too small
* Same concept as high coherence, low coupling

# Tests Are An Extension of Code

* Every time you write code, you write tests that exercise it
* That means that if you change the code, and the tests break, you must either
  * Change the tests to match the new spec
  * Change the code to meet the old spec
* Do not remove the failing tests
  * Unless they no longer apply to the new code's design or API
  * Do not work around the failing tests
* Test code is not "wasted" or "extra" -- tests are first-class citizens

# Meszaros' Principles of Test Automation

* Write the tests first
* Design for testability
* Use the front door first
* Communicate intent
* Don't modify the SUT
* Keep tests independent
* Isolate the SUT
* Minimize test overlap
* Minimize untestable code
* Keep test logic out of production code
* Verify one condition per test
* Test separate concerns separately
* Ensure commensurate effort and responsibility


# Part III: Advanced Techniques

# What to test?

* Simple Rule

> Test everything that could possibly break

* Depends on definitions of "everything" and "possibly" (and "break")
* Corollary: don't test things that couldn't possibly break
  * e.g. Getters and Setters
  * Unless you think they could fail!
  * Better safe than sorry; test what you don't trust

# How much to test?

* Personal judgement, skill, experience
* Usually, you start by testing too little, then you let a bug through
* Then you start testing a lot more, then you gradually test less and less, until you let a bug through
* Then you start testing too much again :-)
* Eventually you reach homeostasis

# Triangulate To Abstraction

* aka "Fake it till you make it"
* Make the code abstract only when you have two or more examples

Step one:

```javascript
function testSum() {
  assertEquals(4, plus(3,1));
}
plus(x, y) {
  return 4;
}
```

Step two:

```javascript
function testSum() {
  assertEquals(4, plus(3,1));
  assertEquals(5, plus(3,2));
}
function plus(x, y) {
  return x + y;
}
```

# Full Range Testing

##  Positive Tests
* exercise normal conditions ("sunny day scenarios")
* E.g. Verify that after adding an element to a set, that element exists in the set

## Negative Tests

* Exercise failure conditions ("rainy day scenarios")
* E.g. verify that trying to remove an element from an empty set throws an exception

## Boundary Conditions

* Exercise the limits of the system ("cloudy day")
* E.g. adding the maximum number of elements to a set
* E.g. test 0, -1, maximum, max+1

# Descriptive Test Naming

* instead of `SetTest.testEmpty`
* how about `SetTest.testShouldHaveSizeZeroWhenEmpty`
* or `EmptySetTest.testHasSizeZero`

nested "describe" blocks can help too...(see later slide)

# Should Statements

* Assertion messages can be confusing
  * (double negatives are not uncomplicated)

* Example: `assertTrue("set is empty", set.isEmpty());`
  * Does `FAILURE: set is empty` mean 
    * "the set **must** be empty, and it's not" or 
    * "the set **is** empty, and that's a problem"
    * ?

* Solution: should statements
  * `assertTrue("set should be empty", set.isEmpty())`

*   or even better:
  * `assertTrue("a newly-created set should be empty", set.isEmpty())`

# Nested Describe Blocks

```javascript
describe('Set', ()=> {
  let set;
  describe('when first created', ()=> {
    beforeEach(()=> {
      set = new Set();
    });

    it('should exist', ()=>{
      expect(set).toBeTruthy();
    })
  
    it('should be empty', ()=> {
      expect(set.size()).toBe(0);
    });
  });
});
```

---

Output:

```
  Set
    when first created
      ✓ should exist
      ✓ should be empty
```

# Test-Only Methods

* Philosophy: a test is a valid client of an object
* Therefore don't be ashamed of adding a method to an object for the sake of making a test easier to write
* Used -> Useful
* Tests are examples of use


# Refactoring Test Code

* Do spend time refactoring your tests
* It'll pay off later, when writing new tests or extending/debugging old ones
* Refactor for readability, not necessarily for removing all duplication
  * Different priorities than for production code
  * MOIST not DRY

# Refactoring Test Code - How?

* Extract methods
* Shorter lines
* Break up long tests (scenario tests) into several short tests (feature tests)
* RSpec
  * use magic keywords like `let` and `subject` and `context`
  * see [EggsOnBread's RSpec best practices and tips](http://eggsonbread.com/2010/03/28/my-rspec-best-practices-and-tips/)

# Evident Data

Increase test readability by clarifying your input and output values

    assertEquals(86400, new Day().getSeconds())

vs.

    assertEquals(60 * 60 * 24, new Day().getSeconds())

vs.

    secondsPerMinute = 60
    minutesPerHour = 60
    hoursPerDay = 24
    assertEquals(secondsPerMinute * minutesPerHour * hoursPerDay,
      new Day().getSeconds())

# Matrix Tests

* Problem: several axes of variability, combinatorial explosion
* Solution: Loop through a matrix of data in your test, call a "check" function on each row
* In dynamic languages like Ruby and JavaScript you can loop *outside* a function definition, producing one actual test per iteration

```ruby
%w(a e i o u).each do |letter|
  it "#{letter} is a vowel" do
    assertTrue(letter.vowel?)
  end
end
```

# Characterization Tests
*  aka "Golden Data Tests"
*  Grab the complete output of a routine, put it into the test
*  Not amenable to test-driven development
*  Effective for large or risky refactorings
*  Quite brittle, so often thrown away after the refactoring is done

# How to Test Exceptions?

```java
public void testUnknownCountry() {
  try {
    currencyConverter.getRate("Snozistan");
    fail("Should have thrown an exception for unknown country");
  } catch (UnknownCountryException e) {
    // ok
  }
}
```

The empty `catch` block is fine here, since here an exception is a success, not a failure to be handled.

Jasmine has a built-in way to test exceptions:

```javascript
expect( function(){ parser.parse(bogus); } )
    .toThrow(new Error("Parsing is not possible"));
```

# Characterization Tests

*  aka "Golden Data Tests"
*  Grab the complete output of a routine, put it into the test
*  Not amenable to test-driven development
*  Effective for large or risky refactorings
*  Quite brittle; often thrown away after the refactoring is done

# Pair Programming

* A pair's job is to keep you focused
  * "Wait, let's write a test first."
  * "Wait, let's refactor first."
  * "Wait, let's discuss this."
  * "Can I drive?"

# Ping-Pong Pairing

* One pair writes a test
* The other pair makes it pass and writes the next test
* Repeat
* Good way to get out of a rut, or cure a keyboard hog

# Regression Test

> "Regression tests are tests that you would have written originally." - Kent Beck

* When a bug is reported, the first step is to write a (failing) test that reproduces the bug
* Fix the bug by writing code until the test passes
* Verify the bug in the running application
* Check in the bugfix test and code
* Now it's always run – instant regression test!
* If your regression test is high-level (e.g. Selenium), you probably want a failing unit test too

# Do Over

Often the best thing to do is throw away your work and start again

# Leave One For Tomorrow

* At the end of the day, write a failing test and leave it there for tomorrow
* Based on writer's trick: start a sentence and leave it unfinished

# The Need For Speed

* Tests are only valuable if they're run all the time
* If they're slow, people will not want to run them all the time
* So keep them fast!
* Difficult quest, but worth it

* Don't get stuck in molasses!
  * Refactor your code to be easier to write fast tests on
  * Replace slow tests with (one or more) fast tests that cover the same area

* Corey Haines has some great tips for keeping Rails tests fast

# Continuous Integration

* Any time all the tests are green, you can check in
* Run all the tests all the time
* Don't check in until all tests pass
* If you broke "someone else's" tests, you are responsible for fixing "their" code
* Remember, they are in the room, so go get them if you need help

# Retrofitting

Q: What to do when you have an existing untested codebase?

A: Start small!

* Write one test, make it pass, check it in
* Write tests for all new code
* Write tests for all new bugs
* Write tests before attempting refactoring

* Usually easier to write characterization tests (UI/integration/Selenium)
  * But don't fall into the slow test trap

# Fixtures and Factories

* A natural progression of refactoring your test data
  * literals
  * constants
  * local variables
  * instance variables (defined in setup / before blocks)
  * creation methods
  * external fixture files
    * (used by Rails by default)
  * parameterized creation methods or objects
    * ("factories" or "object mothers")

# Test Doubles (Mock Objects)

A Test Double replaces the "real" instance of an object used by the production code with something suitable for the currently running test, but with the same interface.

* Stubs
* Mocks
* Fakes
* Spies
* Saboteurs
* Shunts

Test Doubles in general are often called Mock Objects, but there's also a specific technical type of double called a Mock.

# Test Doubles

*  Stubs
  * Hard-coded values
*  Mocks
  *   Pre-programmed with expectations
  *   Fail-fast
  *   Test Doubles in general are often called Mock Objects, so be careful about terminology
*  Fakes
  *   Can store values across calls, but don't really do what the live object would do
  *   E.g. in-memory database

# Test Doubles (cont.)
*  Spies
  *   Remember what methods were called with what values
  *   Tests can inspect these lists after code returns
*  Saboteurs
  *  Blow up in ways that would be difficult to make happen for real
  *   To test what would happen when, e.g., the database goes away, or the disk is full
* Shunts
  *   The test itself declares methods or classes implementing the above, and passes in a pointer to itself

# Mock Clock

A very useful test double

In ruby:

```ruby
@fake_time = Time.now
Time.stub(:now) { @fake_time }
```

In Jasmine (built in, see [the docs](https://jasmine.github.io/2.0/introduction.html#section-Mocking_the_JavaScript_Timeout_Functions) for more details):

```javascript
  it("causes a timeout to be called synchronously", function() {
    let timerCallback = jasmine.createSpy("timerCallback");

    setTimeout(function() {
      timerCallback();
    }, 100);

    expect(timerCallback).not.toHaveBeenCalled();

    jasmine.clock().tick(101);

    expect(timerCallback).toHaveBeenCalled();
  });
```

# Complete Construction

* a way of designing your objects to be more isolated and more testable
  * (a form of Dependency Injection aka Inversion of Control)

* Pass in dependencies to the constructor
  * (or, if necessary, to setters)
* An object under test will receive references to all external services
* Allows tests to inject Test Doubles at will
* Forces objects to be isolated

# BDD (specs)

* Changes the language of tests to emphasize that they're specifications or examples
* Replaces "assert" with "should"

# Outside-in vs. Inside-out

* Matter of preference
* Both are useful at times

# Inside-out

* Start with domain objects
* Next layer of tests

# Outside-in

* Start with customer story or user interface
* Makes you think like a user
* Tests capture these requirements
* Lower layers implemented with

# Outside-in design, inside-out development

* Write a bunch of UI-level tests
* Leave them there while you test-drive inside-out
