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

# Cypress Runner UI

launches with `cypress open`

![cypress runner](https://docs.cypress.io/img/guides/gui-diagram.163d2572.png)

Cypress is also runnable "headless" with `cypress run`

# Waiting

1. you use assertions to tell Cypress what the desired state of your application should be
2. Cypress will automatically wait for your application to reach this state before moving on

# Simple Example

```
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

1. Visit the page at /posts/new.
1. Find the \<input> with class post-title.
1. Type “My First Post” into it.
1. Find the \<input> with class post-body.
1. Type “Hello, world!” into it.
1. Find the element containing the text Submit.
1. Click it.
1. Grab the browser URL, ensure it includes /posts/my-first-post.
1. Find the h1 tag, ensure it contains the text “My First Post”.

from <https://docs.cypress.io/guides/core-concepts/introduction-to-cypress.html#Cypress-Is-Simple>

# visit

`cy.visit('/cart')` attempts to load the path `/cart` from the local server

waits for the page to fire its `load` event (which happens *just after* the page is fully loaded)

if you specify `baseUrl` in your `cypress.json` file it will go a little quicker

# get

* `cy.get` is similar to jQuery's core `$` finder

* accepts a CSS selector
* *waits for it to match and if it's eventually found*,
* returns a *cypress wrapper* (aka *Chainer*) for the matching element(s) that accepts further commands (including asserts)

```
cy.get('input[name="firstName"]')
  .should('have.value', 'Homer')
```

# built-in assertions

*every* Cypress command has a built-in assertion related to its purpose

the command keeps checking many times a second, waiting for the assertion to become true

For instance:
* `cy.visit()` expects the page to send text/html content with a 200 status code.
* `cy.request()` expects the remote server to exist and provide a response.
* `cy.contains()` expects the element with content to eventually exist in the DOM.
* `cy.get()` expects the element to eventually exist in the DOM.
* `.find() `also expects the element to eventually exist in the DOM.
* `.type() `expects the element to eventually be in a typeable state.
* `.click() `expects the element to eventually be in an actionable state.

<https://docs.cypress.io/guides/core-concepts/introduction-to-cypress.html#Default-Assertions>

# should

Cypress uses *Chai* assertions (which are slightly different from *Jest* assertions).

Using `should` on a chainer, you specify the Chai assertion *as a string*; `should` will call that assertion repeatedly *on the target element* until it becomes true.

```
cy.get('input[name="firstName"]')
  .should('have.value', 'Homer')
```

Here’s a list of commonly used Cypress assertions, with sample code: https://docs.cypress.io/guides/references/assertions.html#Common-Assertions

# nothing happens immediately

Cypress commands don’t do anything at the moment they are invoked, but rather enqueue themselves to be run later...

... **after** the entire test function has *already finished executing*!

at the time `cy.get` returns a wrapper, a wrapper, and at the time it is returned, *nothing has happened yet*, so you can't simply store the result in a variable or print it

This is *by design*. Commands are enqueued and managed by Cypress to reduce timing issues and general test flakiness.

# then

`then` turns a wrapper into a value for further use inside a callback (which only gets called later on, after the promise resolves)

```
cy.get('div#preview').then((el) => {
  assert.include(el.text().toLowerCase(), 'hello');
});
```

# timeout

Most commands expire after 4 seconds. This "timeout" causes the command and test to fail.

Some commands have longer default timeouts -- e.g. `visit`'s is 60 seconds, to account for long page load and app startup times.

Any timeout can be overridden with an option, e.g.:

# some commands for interacting with the DOM

* `.clear()` - Clear the value of an input or textarea.
* `.check()` - Check checkbox(es) or radio(s).
* `.uncheck()` - Uncheck checkbox(es).
* `.select()` - Select an <option> within a <select>.
* `.blur()` - Make a focused DOM element blur.
* `.focus()` - Focus on a DOM element.

see <https://docs.cypress.io/guides/core-concepts/interacting-with-elements.html> for more info -- there are many details here

# project structure

* all cypress files are under `./cypress` most tests go under `./cypress/integration` -- see <https://docs.cypress.io/guides/core-concepts/writing-and-organizing-tests.html#Folder-Structure>
* inside a test file you use familiar Jasmine functions:
    * `describe` (aka `context`)
    * `it` (aka `specify`)
    * `expect` or `should` or `assert.` according to taste
    * `beforeEach` (or `before` if you must)

```  
@@@javascript  
    describe('Unit test our math functions', function() {
      context('math', function() {
        it('can add numbers', function() {
          expect(add(1, 2)).to.eq(3)
        })
      })
     })
```

# only

If you want to temporarily enable or disable tests, you can use `only` or `skip`, e.g. 

when these tests are run, all will be skipped except this one:
```
it.only('returns "fizz" when number is multiple of 3', function () {
```

# debug

Sometimes an error message is not enough, and you need to pause and inspect the DOM, or other application state.

If you want to debug an action...

Use `debugger` or `.debug()` just BEFORE the action:

```
// break on a debugger before the click command
cy.get('button').debug().click()
```

```
// break on a debugger before the get command
debugger
cy.get('button').click()
```

# LAB: Tic Tac Test

* on GitHub, find a [Tic Tac Toe](/projects/tictactoe_www) app that was written by *someone else* and copy its git URL
* locally clone that repo, e.g.

```
git clone git@github.com:BurlingtonCodeAcademy/tic-tac-toe-jon-and-bob.git
```

* enter that directory and install *Cypress* and *Node-Static*:

```
cd tic-tac-toe-jon-and-bob
npm install cypress
npm install node-static
```

* create a directory named `cypress` and a subdirectory named `integration`

```
mkdir -p cypress/integration
```

* inside `cypress/integration` create a file named `ticTacToe.spec.js` and put this code inside it:

```
describe('Cypress', function () {
  it('successfully visits the home page', function () {
    cy.visit('/');
  });
});
```

* in one console window, run a static web server:

```
npx static .
```

* in a *different* console window, run Cypress:

```
npx cypress open
```

* switch to the Cypress runner window and run the tests
* High five!
* Now go back to the [Tic Tac Toe](/projects/tictactoe_www#stories) project and read the stories in the backlog. For each story, write one or more acceptance tests.
* If you find any bugs in your classmate's code, let them know! They will definitely thank you for helping improve quality :-)
