# Markdown Preview

Input some markdown source on the left and see it rendered on the right.

## Wireframes

```
 Markdown Preview!

 Source                        Preview
 _____________                 _____________
| # Hello     |  [>Render>]   | Hello       |
|             |               |             |
|_____________|               |_____________|
```

## Tech

* Native DOM for user events
  * (or jQuery or React if you prefer)
* HTML forms and CSS layout & styling
* a Markdown rendering library
  * We recommend [Marked](https://github.com/chjj/marked)
* Cypress Tests
  * Visit [cypress.io](https://cypress.io) for docs
  * Visit [our lesson on Cypress](/lessons/javascript/cypress) for a tutorial overview

## Setup

* Clone the repo: (do this once only -- and use the Github Classroom URL instead if one is provided)

        git clone git@github.com:BurlingtonCodeAcademy/markdown_preview.git

* Install dependencies: (do this once)

        cd markdown_preview
        npm install -y

* Launch the app locally:

        npm start

    * you can now visit <http://localhost:8080/> to see your app running on your own computer!
    * (in this project, `npm start` launches a *static file server* so everything under the project directory is now a live website running on your own machine!)

* Launch the Cypress Runner window:
  * open a *different terminal window* and `cd` to your project dir
  * run `npx cypress open` <br><br>

* Run the Cypress tests:
 * in the Cypress Runner window, click the "Run All Tests" button, or click on a single test to run it alone


## Backlog (required user stories)

We have provided Cypress tests that run through the first few features. Please make sure to keep running the tests, to ensure later changes don't break earlier features.

<!--BOX-->
## Page Elements

**Given** a running app

**Then** the following elements should exist on the page:

* *headline*: an `H1` element containing the text `Markdown Preview`
* *source*: a `textarea` element with the id `source`
* *preview*: a `div` element with the id `preview`
* *render*: a `button` element  with the id `render`

<!--/BOX-->

<!--BOX-->
## Render Text

**Given** the user has entered text in the *source* text field

**When** the user clicks *render* button

**Then** the text is copied into the *preview* area

<!--/BOX-->

<!--BOX-->
## Render Markdown

**Given** the user has entered *markdown format* text in the *source* text field

**When** the user clicks *render* button

**Then** the text is rendered as styled HTML into the *preview* area

> Hint: You can use the `marked` library to convert markdown source into styled HTML. You can load it like this: `<script src='node_modules/marked/lib/marked.js'>` since we added `marked.js` to the repository already. Alternately, you can use a CDN -- check the [Usage section of Marked's GitHub repo](https://github.com/markedjs/marked) for instructions.

<!--/BOX-->

<!--BOX-->
## Automatically Render Markdown

**Given** the user types into the *source* text field

**And** at least one second has elapsed since the user's last keypress

**Then** the *render* button should activate automatically

**And** the text is rendered as styled HTML into the *preview* area

> Hint: the "at least one second" feature will need to keep track of [elapsed time](/lessons/javascript/timing) somehow...

<!--/BOX-->

<!--BOX-->
## Pretty Page

Make the app look pretty.

(Remember not to change any of the CSS `id`s used by the Cypress tests!)

<!--/BOX-->

<!--BOX-->
## Pretty Preview

Make the *formatted text* in the *preview* area look pretty.

Maybe make different elements different colors, or improve margins and padding, or whatever you like.

<!--/BOX-->

<!--BOX-->

## Refactoring

This isn't a user story, but an invitation for you to clean your code and experiment with new techniques.

### Refactoring Ideas:

  * If you used  `<button onclick=...>` or  `element.onclick=...` you may want to try using `element.addEventListener('click', ...)` instead -- [here's an example](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener#Example)
  * If you used an inline `<script>` you may want to try using an external `<script src=...>` instead

> Don't be afraid to experiment! If you're using git you can easily revert back to the most recent committed version by using `git checkout .` (that's a single dot after "checkout", meaning "check out this entire directory)"

<!--/BOX-->

<!--BOX-->

## Bold Button

**Given** the user has selected some text in the *source* panel

**When** the user clicks the "Bold" button

**Then** the selected text is surrounded with double asterisks

**And** the preview text is displayed in boldface

---

**Given** the user has selected some text in the *source* panel that begins with double asterisks

**When** the user clicks the "Bold" button

**Then** the selected text is replaced without double asterisks

**And** the preview text is displayed in normal

> **Hint**: the [TextArea Element](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTextAreaElement) has [many properties](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTextAreaElement#Properties) -- including `value` (to return the user's text) and `selectionStart` and `selectionEnd` (to show which text the user has selected). It also has a method [`setRangeText`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement/setRangeText) which replaces the current selection's text with a string you specify.

<!--/BOX-->


<!--BOX-->

## Italic Button

**Given** the user has selected some text in the *source* panel

**When** the user clicks the "Italic" button

**Then** the selected text is surrounded with double asterisks

**And** the preview text is displayed in italics

---

**Given** the user has selected some text in the *source* panel that begins with double asterisks

**When** the user clicks the "Italic" button

**Then** the selected text is replaced without double asterisks

**And** the preview text is displayed in normal

<!--/BOX-->

## More Information

* Here's a functioning version of this app (written by [@tanabe](https://twitter.com/tanabe)):
  * <http://markdownlivepreview.com>
* info on the Cypress test suite
  * <http://docs.cypress.io/guides>
  * <http://docs.cypress.io/api>
* how to write event listeners and attach them to DOM elements
  * <https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onclick>
  * <https://developer.mozilla.org/en-US/docs/Web/Guide/Events/Event_handlers>
  * <https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener>
  * <https://developer.mozilla.org/en-US/docs/Web/Events/click>
* a Markdown language "cheatsheet":
  * <https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf>
* the Marked JavaScript library
  * <https://marked.js.org/>
