# Acceptance Testing

Where does Acceptance Testing fit in with other forms of automated tests?

* Unit Tests - low level, interact directly with code
* Integration Tests - higher level, to test the entire system (or a few parts) working together
* End-to-end (E2E) Tests - high level, test UI *and* logic *and* database *and* API calls 
* Smoke Tests - very small suite of tests, quick to run, to prove system isn't completely broken
* Stress Tests - simulate real-world behavior under load

---

* Acceptance Tests - verify that the system is meeting its ultimate goals for functionality / performance / usability / profit
  * often, acceptance tests are E2E
  * often, smoke tests are a subset of acceptance tests

# Why test?

the point of all automated testing is feedback

> If a test fails in the woods, does anyone hear it fail?

Can you think of some examples of when acceptance tests might be useful?

# Acceptance Tests

* should be *automated* (or at least *automatable*)
  * (if a particular test can't be automated then it should be specified in enough detail that a human can do it reliably)
* are "executable specifications" of the system
* correspond with product goals and requirements
* are linked to user stories (feature specifications) but not necessarily one-to-one
    * One story can have many acceptance tests -- whatever it takes to ensure the feature works

# Acceptance Criteria Templates

* There are two popular human-readable "mad libs" templates for acceptance criteria
  * As a \___, I want to \___ So that \___.
  * Given \___, when \___ then \___.
* Once you've written requirements in "given - when - then" form, translating them into code is more straightforward

# Acceptance Tests in Extreme Programming

* Acceptance tests are created from user stories. 
* During an iteration the user stories selected during the iteration planning meeting will be translated into acceptance tests.
* The customer specifies rules and scenarios that will become true once a user story has been correctly implemented. 
* In *continuous integration*, all acceptance tests are run as often as possible, at least once before and once after a *merge to master* and before a *release*
* A user story is not considered complete until it has passed its acceptance tests, and work should not proceed to a new story until the first story passes.
* The name acceptance tests was changed from "functional tests" to make it more clear that they are customer- and user-driven.

<http://www.extremeprogramming.org/rules/functionaltests.html>

# Who owns the tests?

Acceptance Tests are *"owned"* and often *created* by the customer / product manager, not by the developers

**but** if the developer breaks an acceptance test, it must be their responsibility for fixing it -- **not** a separate QA team

> "The developers are the people who will make changes that will break tests. Therefore, they have to be the people who are responsible for making the tests pass when that happens." - [Dave Farley](https://youtu.be/SBhgteA2szg?t=556)  

**but also!** product owners are responsible for verifying the correctness of the acceptance tests. 

> If a product owner protests that they are "not technical" and can't write or maintain tests, then the developers must support them in translating between human language and code.

# Black Box Testing

In theory, Acceptance Tests assume the system is a "black box" -- we can't see inside.

  * deal with input and output, not implementation

Compared to Unit Tests, Acceptance Tests are usually...

  * slower to set up and to execute
  * harder to mock and stub behaviors
  * harder to precisely specify what you're testing

    * in a black box web test, if a search fails, was it the search button, the network connection, the search itself, or the results display that failed?

(In practice, the black box is translucent -- tests often rely on some knowledge or manipulation of internals -- but opacity is a good goal.)

# Is Acceptance Testing the same as Web Testing?

* not all UI testing is acceptance testing

* not all acceptance tests go through the UI

* you *can* write acceptance tests without the UI
  * if your app exposes a "service layer" or API
  * with developer help, customer can get access to deeper units and write acceptance tests against them

* you *can* write isolated unit tests for UI components 
  * e.g. Jest/React 

* you *can* write end-to-end tests that are not acceptance tests

# Testing Pyramid

Base: lots of unit tests (fast and cheap)

Middle: fewer service and integration tests

Apex: small number of UI acceptance tests (slow and expensive)

![test pyramid](https://martinfowler.com/bliki/images/testPyramid/test-pyramid.png) 
<https://martinfowler.com/bliki/TestPyramid.html>

> **BEWARE** of testing core code (aka "business rules" or "domain logic") through the UI; better to isolate your logic in a domain layer and unit test the heck out of it

# Domain-Specific Language

vs. General Purpose Language

* tries to capture the essence of the business domain
* tries to reduce technical jargon and increase business jargon
* depends on willingness to have many deep conversations between customer(s) and coder(s)
* best when it's also a [Ubiquitous Language](https://martinfowler.com/bliki/UbiquitousLanguage.html) to reduce cognitive friction between layers

  * e.g. if your "students" are stored in a "classmates" table, that's a mismatch -- pick one term and use it in the database, code, UI, docs, marketing, etc.


# Cucumber

Tries to be a general-purpose DSL :-)

Here's what the *actual source code* of a Cucmber test looks like:

```
Feature: Is it Friday yet?
  Everybody wants to know when it's Friday

  Scenario: Sunday isn't Friday
    Given today is Sunday
    When I ask whether it's Friday yet
    Then I should be told "Nope"
```

Programmers have to write hooks for phrases like `When("^I ask whether it's Friday yet$")` but once those are coded, the QA or product team can write more tests.

When Cucumber works it's amazingly great, but most teams find it slows them down.

# Web Testing Frameworks

[Selenium](https://www.seleniumhq.org/)

  * runs inside a browser
  * communicates with tests using network protocol
  * inconsistent behavior between different browsers
  * written before NodeJS and ES6 and HTML5; has many bugs and weird limitations

[Cypress](http://cypress.io)

  * runs its own browser using Electron, and its own server using NodeJS
  * has more low-level control of browser features
  * allows mocking and stubbing DOM APIs
  * saves page snapshots during test run
    * as screenshots & videos for later viewing
    * as DOM copies for later debugging (!!)

see more at the [Cypress Lesson](/lessons/javascript/cypress)
  
# Cypress

* [Cypress](http://cypress.io) is a web browser automation library that's built for automated testing
* it manipulates and queries the DOM in a controlled browser instance
* when a cypress command fails, the test fails immediately
* more detailed assertions are written in [Mocha](https://docs.cypress.io/guides/references/bundled-tools.html#Mocha) + [Chai](https://www.chaijs.com/api/bdd/)
  * (very similar to Jasmine and Jest -- but [not identical](https://medium.com/@NicholasBoll/using-jest-matchers-in-cypress-5e8e7281f5dd) )

see more at the [Cypress Lesson](/lessons/javascript/cypress)

# Good Ideas

What makes a good acceptance test?

* focus on "what" (goal) not "how" (implementation)
* each test should be isolated from other tests
    * allows running a single test a time
    * allows running many tests in parallel
    * shows more precisely what failed
* use common *domain language* wherever possible
* test both "happy path" and "rainy day" scenarios
* always write a failing acceptance test when a bug is reported

# Bad Ideas

* Click-and-Record
* Temporally Dependent Tests
* Overspecified fixture data

# Bad Idea: Click-and-Record

* tedious to create
* brittle -- will break if e.g. the name of a button changes
* always running behind the code, trying to catch up

# Bad Idea: Temporally Dependent Tests

* e.g.
    * Test A: "sign **up** as John Doe"
    * Test B: "sign **in** as John Doe" (using the account we created in Test A)
    * B is *temporally dependent* on A
* tempting but flawed - not isolated
* failures cascade, causing noise and imprecision in output
* difficult to focus on a single failing test
  
> **BUT** some tests might be okay with sharing setup or startup; be open to that especially if your system takes a long time to start or to populate with data, or if you're doing manual testing, which is inherently slow

# Bad Idea: Overspecified Test Data

Bad: too much data obscures the test's meaning

```js
createAccount('John Doe', 42, 40, '12 Main St.', 'Dallas', 'TX', ...)
deposit(10)
expect(account.balance).toBe(50);
```

> ...is that "age 42, balance $40" or "age 40, balance $42" ?

Better: hide all details except the ones relevant to the test 

```
createAccountWith({balance: 40}) 
deposit(10)
expect(account.balance).toBe(50);
```

# Good Idea: Fixture Data

* in hardware testing, a *fixture* is a pre-made *testing device* that you plug your device into that helps you test it

  * called a fixture because it's in a *fixed state* 
  * used as a baseline for running a series of tests

* in software testing, a *fixture* is a pre-made set of *test data* that you run your tests *with* 

  * often comprises a particular named scenario
  * usually initialized in `beforeEach` or `beforeAll` hook
  * fixed environment ensures that results are repeatable
  * usually used in systems with many *interdependent* objects
    * an exam needs a student, which needs an address, which needs a ... 
    * when it's impossible for a test to create just a single record, you need a way to create a bunch of records at once

# Bad Idea: Too Much Fixture Data
  
  * too much reliance on fixtures is a *bad idea* 
  * state must be *reset* between tests which can be time-consuming
  * innocent changes in unrelated objects can make your tests fail
  * if your objects are too interdependent then you should refactor until they're less so
    * (same advice applies in unit testing with mock objects)  
