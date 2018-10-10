# Acceptance Testing

Where does Acceptance Testing fit in with other tests?

* Unit Tests - low level, interact directly with code
* Integration Tests - higher level, to test the entire system working together
* Acceptance Tests - to verify system is meeting ultimate goals
* Smoke Tests - very small suite of tests, quick to run, to prove system isn't completely broken
* Stress Tests - simulates real-world behavior under load 
 
the point of all automated testing is feedback

> if a test fails in the woods, does anyone hear it?

# Acceptance Tests

should be *automated* (or at least *automatable*) 

correspond with product goals 

should be "executable specifications" of the system

# Who owns the tests?

Acceptance Tests are "*owned*" and often *created* by the customer / product manager, not by the developers

**but** if the developer breaks an acceptance test, it must be their responsibility for fixing it -- **not** a separate QA team

> "The developers are the people who will make changes that will break tests. Therefore, they have to be the people who are responsible for making the tests pass when that happens." - Dave Farley  https://youtu.be/SBhgteA2szg?t=556


# Black Box Testing

Assumes the system is a "black box" -- we can't see inside

  * deals with input and output, not implementation
  * harder to mock and stub behaviors
  * harder to precisely specify what you're testing
    * in a black box web test, if "search" fails, was it the button, the search itself, or the results display that failed?
  * often harder to set up and tear down databases to test a specific scenario for a single test

# Is Acceptance Testing the same as Web Testing?

not all web testing is acceptance testing
    
not all acceptance tests are web tests

* with developer help, customer can get access to deeper units and write tests against them

# Testing Pyramid

Base: lots of unit tests

Middle: fewer integration tests

Apex: small number of UI acceptance tests

https://martinfowler.com/bliki/TestPyramid.html


# Acceptance Tests in Extreme Programming

from http://www.extremeprogramming.org/rules/functionaltests.html

> Acceptance tests are created from user stories. During an iteration the user stories selected during the iteration planning meeting will be translated into acceptance tests. The customer specifies scenarios to test when a user story has been correctly implemented. A story can have one or many acceptance tests -- whatever it takes to ensure the functionality works.

> Acceptance tests are black box system tests. Each acceptance test represents some expected result from the system. Customers are responsible for verifying the correctness of the acceptance tests and reviewing test scores to decide which failed tests are of highest priority. Acceptance tests are also used as regression tests prior to a production release. 

> A user story is not considered complete until it has passed its acceptance tests. This means that new acceptance tests must be created each iteration or the development team will report zero progress. 

> Quality assurance (QA) is an essential part of the XP process. On some projects QA is done by a separate group, while on others QA will be an integrated  into  the  development  team itself. In either case XP requires development to have much closer relationship with QA.
 
> Acceptance tests should be automated so they can be run often. The acceptance test score is published to the team. It is the team's responsibility to schedule time each iteration to fix any failed tests. 
 
> The name acceptance tests was changed from functional tests. This better reflects the intent, which is to guarantee that a customers requirements have been met and the system is acceptable. XP Rules!

# Domain-Specific Language

vs. General Purpose Language

# Cucumber


# Web Testing Frameworks

Selenium
  * runs inside a browser
  * communicates with tests using network protocol
  * inconsistent behavior between different browsers

Cypress
  * runs its own browser using Electron
  * has more low-level control of browser features, so it's possible to mock and stub DOM APIs
  
# Cypress

not actually a testing framework!

it's an automation library that supports testing
 
but it doesn't do its own assertions! it just manipulates and query the DOM

actual tests are written in Mocha / Chai / Jasmine / Jest

# Good Ideas

What makes a good acceptance test?

* focus on "what" (goal) not "how" (implementation)
* each test should be isolated from other tests
    * allows running a single test a time
    * allows running many tests in parallel
    * shows more precisely what failed
* use common *domain langauge* wherever possible
* test both "happy path" and "rainy day" scenarios
* always write a failing acceptance test when a bug is reported

    
# Bad Ideas

* Click-and-Record
* Temporally Dependent Tests
* 

## Bad Idea: Click-and-Record

* tedious to create
* brittle -- will break if e.g. the name of a button changes
* always running behind the code

## Bad Idea: Temporally Dependent Tests

* e.g.
    * Test A: "sign up as John Doe"
    * Test B: "sign in as John Doe"
    * B is *temporally dependent* on A
* tempting but flawed - not isolated
* failures cascade, causing noise and imprecision in output
  
> **BUT** some tests might be okay with sharing setup or startup; be open to that especially if your system takes a long time to start or to populate with data

# Bad Idea: Blindly Importing Production Data

Using production data can be useful for getting tests up and running quickly, but it is not a replacement for *thoughtful* tests

Bad:

```
createAccount(name: 'John Doe', age: 42, balance: 40, city: 'Dallas', ...)
deposit(10)
expect(account.balance).toBe(50);
```

Better:

```
let account = createAccount(balance: 40)
deposit(10)
expect(account.balance).toBe(50);
```

# Good Idea: Refactor code that's hard to test


 