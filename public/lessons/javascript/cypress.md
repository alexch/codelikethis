# End-to-End Testing with Cypress

"Cypress can test anything that runs in a browser."

main site: <http://cypress.io>

guides: <https://docs.cypress.io/guides>

API doc: <https://docs.cypress.io/api>

# Cypress Features

* *consistency* and *speed* via Electron and NodeJS architecture
* *waiting* built in to every command and assertion
* *spies, stubs, and clocks* for fine-grained control of external systems and dependent objects
* *network stubs* with `cy.route()` for canned scenarios involving server failures or edge cases
* *screenshots* for each failure; *videos* of entire test run (optionally)
* tests are paused immediately on failure, for *debugging* live app state with DevTools
* tests are written in *modern JavaScript* using a Jasmine/Jest-like interface and Mocha assertions

# Cypress Anti-Features

Cypress is *not* an after-the-fact click-and-record QA automation tool for so-called "non-technical" testers.

 * tests are written in *modern JavaScript* so your testers need to understand callbacks, method chaining, jQuery, Mocha and Chai, and fat arrows, as well as CSS selectors and DOM lifecycle events

 * tests use an *enqueued linear control flow* so some familiar techniques like `if..then` and `let` variables don't work as expected
   * fortunately the docs are **amazing** and cover these scenarios very well

 * tests use CSS selectors to find page elements, so your app needs to be written with sensible `id`s and `class`es and `data-*` values in its DOM

> "Yes, this may require server side updates, but you have to make an untestable app testable if you want to test it!" - [Cypress Conditional Testing Guide](https://docs.cypress.io/guides/core-concepts/conditional-testing.html)

# Cypress Runner UI

launches with `cypress open`

![cypress runner](https://docs.cypress.io/img/guides/gui-diagram.163d2572.png)

Cypress is also runnable "headless" with `cypress run`

# Waiting

1. you use assertions to tell Cypress what the desired state of your application should be
2. Cypress will automatically wait for your application to reach this state before moving on

# Simple Example

```js
describe('Post Resource', function() {
  it('Creating a New Post', function() {
    cy.visit('/posts/new')     // 1.

    cy.get('input.post-title') // 2.
      .type('My First Post')   // 3.

    cy.get('input.post-body')  // 4.
      .type('Hello, world!')   // 5.

    cy.contains('Submit')      // 6.
      .click()                 // 7.

    cy.url()                   // 8.
      .should('include', '/posts/my-first-post')

    cy.get('h1')               // 9.
      .should('contain', 'My First Post')
  })
})
```

1. Visit the page at `/posts/new`.
1. Find the \<input> with class `post-title`.
1. Type "My First Post" into it.
1. Find the \<input> with class `post-body`.
1. Type "Hello, world!" into it.
1. Find the element containing the text "Submit".
1. Click it.
1. Grab the browser URL & ensure it includes `/posts/my-first-post`.
1. Find the `h1` tag & ensure it contains the text "My First Post".

from <https://docs.cypress.io/guides/core-concepts/introduction-to-cypress.html#Cypress-Is-Simple>

# visit

```js
cy.visit('/cart')
```

* attempts to load the path `/cart` from the local server

* waits up to 60 seconds for the page to fire its `load` event (which happens *just after* the page is fully loaded)

* if you specify `baseUrl` in your `cypress.json` file it will go a little quicker, e.g.:

```json
{
    "baseUrl": "http://localhost:5000/"
}
```

# get

```js
cy.get('#someId')
```

* takes a *CSS selector*
* *waits up to 10 seconds* for the selector to match an element on the page
* and *if a match is eventually found*,
* returns a *cypress wrapper* (aka *Chainer*) for the matching element(s)
* that accepts further commands (like `type` and `submit` below)

```js
cy.get('form#login input[name="username"]')
  .type('HomerSimpson1989')
cy.get('form#login')
  .submit()
```

> Note: cypress Chainers are quite similar to jQuery wrapper objects. Both are
DOM element collection wrappers that support method chaining.

# some commands for interacting with the DOM

* `.type()` - enter text into an input element or textarea
* `.clear()` - Clear the value of an input or textarea
* `.check()` - Check checkbox(es) or radio button(s)
* `.uncheck()` - Uncheck checkbox(es)
* `.select()` - Select an \<option> within a \<select>
* `.focus()` - Focus on a DOM element
* `.blur()` - Make a DOM element lose focus

see <https://docs.cypress.io/guides/core-concepts/interacting-with-elements.html> for more info -- there are many details here

# contains

* `cy.get(selector).contains('some text')`
  * checks each individual element that `cy.get` matched
  * succeeds if *any* contain the given text
  * fails if the given text is not found after 10 seconds
  * returns a "chainer" for all matching elements, so you can do further assertions or refinements

e.g.:

```js
cy.get('h2')
  .contains('New York')
```

* `cy.contains(` without a preceding `get` checks the *entire page* for the given text

# built-in assertions

every Cypress command has a built-in assertion related to its purpose

the command keeps checking many times a second, waiting for the assertion to become true

For instance:

* `cy.visit()` expects the page to send `text/html` content with a 200 status code.
* `cy.contains()` expects the element with content to eventually exist in the DOM.
* `cy.get()` expects the element to eventually exist in the DOM.
* `.find() `also expects the element to eventually exist in the DOM.
* `.type() `expects the element to eventually be in a typeable state.
* `.click() `expects the element to eventually be in a clickable state.

<https://docs.cypress.io/guides/core-concepts/introduction-to-cypress.html#Default-Assertions>

# should

Sometimes the built-in assertions are enough, but often you need to test the page's contents in other ways.

Cypress's [`should`](https://docs.cypress.io/api/commands/should.html) method lets you use *Chai assertions* on the element(s) matched by `get`.

> Note: Chai assertions are slightly different from *Jest assertions*, so beware of small syntax differences.

Using `should` on a chainer, you specify the Chai assertion *as a string*; `should` will execute that assertion repeatedly *on the target element* until it becomes true.

```js
cy.get('input[name="firstName"]')
  .should('have.value', 'Homer')
```

Here’s a list of commonly used Cypress assertions, with sample code: <https://docs.cypress.io/guides/references/assertions.html#Common-Assertions>

> **Note:** it is weird that some methods are called normally, and some are called by *passing a string* as a parameter to `should`. This is due to a technical detail about how Cypress delegates to Chai, and hopefully isn't too confusing. When in doubt, look at working code examples and follow their lead.

# nothing happens immediately

Cypress commands don’t do anything at the moment they are invoked, but rather enqueue themselves to be run later...

... **after** the entire test function has *already finished executing*!

`cy.get` returns a wrapper object called a "chainer", and at the time it is returned, *nothing in the web page has happened yet*, so you can't simply store the result in a variable or print it

(For that level of control you must [pass callbacks into](https://docs.cypress.io/api/commands/should.html#Function) other methods like `should` and `each` and `and` and `then`.)

This may seem overcomplicated, but it is *by design*. Commands are enqueued and managed by Cypress to reduce timing issues and general test flakiness.

# timeout

Most commands expire after 4 seconds. This "timeout" causes the command and test to fail.

Some commands have longer default timeouts -- e.g. `visit`'s is 60 seconds, to account for long page load and app startup times.

Any timeout can be overridden temporarily with an option, e.g.:

```js
// 10 seconds
cy.get('.mobile-nav', { timeout: 10000 })
  .should('be.visible')
```

# then

* `then` lets you access matching elements in a callback

```js
cy.get('div#preview').then((element) => {
  assert.include(element.text().toLowerCase(), 'hello');
});
```

* **Warning:** the `element` parameter is a *jQuery object* that wraps the native DOM element(s)

# multiple matches

* if `cy.get()` matches more than one element, things get weird
    * `.contains(` checks each individual element and succeeds if *any* contain the text
    * `should('have.text'` checks the *full combined text* of *all* matched elements
    * `.then(` hands you a jQuery collection with more than one item in it

For example, given this HTML:

```html
<h2>New York</h2>
<h2>Los Angeles</h2>
```

| cypress code | result |
|---|---|
|`cy.get('h2')` | |
|`.contains('New York')` | OK: ![one success](/images/cypress-ny.png) |
|`.contains('York')` | OK: ![one success](/images/cypress-york.png) |
|`.should('have.text', 'New York')` | Failure: ![YorkLos](/images/cypress-yorklos.png) |
|`.then((element) => {` <br>&nbsp;&nbsp; `expect(element.text()).to.equal('New York')` <br> `});` | Failure: ![YorkLos](/images/cypress-yorklos-then.png) |

# checking multiple matching elements with `each`

Fortunately, there is `each`

* `.each(` runs your callback on *all* matching elements, one at a time

* this lets you write custom code to check (or "massage") each element separately, to assert that *all* (not just *any*) elements obey your assertion

| cypress code | result |
|---|---|
|`cy.get('h2')` | |
| &nbsp;&nbsp;`.each((element) => {` <br>&nbsp;&nbsp;&nbsp;&nbsp; ` element.text()` <br>&nbsp;&nbsp;&nbsp;&nbsp; `.should.equal('New York');` <br> ` });` | One failure, one OK: ![one success, one failure](/images/cypress-ny-la.png) |

# project structure

* all cypress files are under `./cypress`
* most tests go under `./cypress/integration`
* inside a test file you use familiar Jasmine functions:
    * `describe` (aka `context`)
    * `it` (aka `specify`)
    * `expect` or `should` or `assert.` according to taste
    * `beforeEach` (or `before` if you must)

```js
describe('Unit test our math functions', function() {
  context('math', function() {
    it('can add numbers', function() {
      expect(add(1, 2)).to.eq(3)
    })
  })
})
```

see <https://docs.cypress.io/guides/core-concepts/writing-and-organizing-tests.html#Folder-Structure>

# only

If you want to temporarily enable or disable tests, you can use `only` or `skip`, e.g.

when these tests are run, all will be skipped except this one:

```js
it.only('returns "fizz" when number is multiple of 3', function () {})_
```

`skip` is the inverse of `only`, temporarily removing a single test case from the running suite so it doesn't clutter your logs.

```js
it.skip('does something interesting that is not coded yet', function () {})
```

> Remember to delete your `skip`s and `only`s before making a commit!

# debug

Sometimes an error message is not enough, and you need to pause and inspect the DOM, or other application state.

Cypress saves *DOM snapshots* for every command, so normally all you need to do is click the line in the log panel, then inspect the window visually or with Chrome DevTools.

If you want more fine-grained breakpoints...

Use `debugger` or `.debug()` just BEFORE the action:

```js
// break on a debugger before the click command
cy.get('button').debug().click()
```

```js
// break on a debugger before the get command debugger
cy.get('button').click()
```

> Remember to delete your `debug`s before making a commit!

# LAB: Tic Tac Test (part 1)

* on GitHub, find a [Tic Tac Toe](/projects/tic_tac_toe_www) app that was written by *someone else* and copy its git URL
* locally clone that repo, e.g.

```sh
git clone git@github.com:BurlingtonCodeAcademy/tic-tac-toe-jon-and-bob.git
```

* enter that directory and install *Cypress* and *Node-Static*:

```sh
cd tic-tac-toe-jon-and-bob
npm install cypress
npm install node-static
```

* inside the project root directory, create a file named `cypress.json` and put this code inside it:

```json
{
    "baseUrl": "http://localhost:5000/"
}

```

* create a directory named `cypress` and a subdirectory named `integration`

```sh
mkdir -p cypress/integration
```

* inside `cypress/integration` create a file named `ticTacToe.spec.js` and put this code inside it:

```js
describe('Cypress', function () {
  it('successfully visits the home page', function () {
    cy.visit('/');
  });
});
```

# LAB: Tic Tac Test (part 2)

* in one console window, run a static web server:

```sh
npx node-static .
```

* in a *different* console window, run Cypress:

```sh
npx cypress open
```

* switch to the Cypress runner window and run the tests
* High five!
* Now go back to the [Tic Tac Toe](/projects/tic-tac-toe-www#stories) project and read the stories in the backlog. For each story, write one or more acceptance tests.
* If you find any bugs in your classmate's code, let them know! They will definitely thank you for helping assure the quality of their code :-)

# Even More Cypress Stuff

* code editor integration
* alias
* stubs
* fixtures
* routes
* well-written documentation

# code editor integration

At the top of your Cypress test file, if you include the following line...

    /// <reference types="cypress" />

...then your text editor will become aware of the types and interfaces of the Cypress library, and enable code completion and inline help.

<!-- todo: screenshot -->

This trick works in Visual Studio Code (and probably other editors too)

# alias

[alias](https://docs.cypress.io/guides/core-concepts/variables-and-aliases.html) a selection with `as` for later use (since local variables are awkward to use in an async world)

```js
cy.get('table').find('tr').as('rows');
cy.get('@rows').first().click();
```

# stubs

[stubs and spies, mocks and clocks](https://docs.cypress.io/guides/guides/stubs-spies-and-clocks.html#Capabilities) for when you want to deceive your app

```js
cy.clock()
cy.get('#timer').contains('00:00.00')
cy.get('#start').click()
cy.tick(10 * 60 * 1000)
cy.get('#timer').contains('10:00.00')
```

# fixtures and routes

* [JSON fixtures](https://docs.cypress.io/api/commands/fixture.html) for canned data

* [routes](https://docs.cypress.io/guides/guides/network-requests.html) for stubbing network requests

```js
cy.server()           // enable response stubbing
cy.route({
  method: 'GET',      // Route all GET requests
  url: '/users/*',    // that have a URL that matches '/users/*'
  response: []        // and force the response to be: []
})
```

* fixtures and routes go together like peanut butter and jelly

```js
cy.fixture('activities.json').as('activitiesJSON')
cy.route('GET', 'activities/*', '@activitiesJSON')
```

# docs

Great docs! Including a [Recipies cheatsheet](https://docs.cypress.io/examples/examples/recipes.html) and clearly written [guides](https://docs.cypress.io/guides/overview/why-cypress.html#In-a-nutshell)
