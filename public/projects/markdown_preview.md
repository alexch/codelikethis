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

* Native DOM (or jQuery or React) for user events
* HTML forms and layout
* a Markdown rendering library
  * https://github.com/chjj/marked
* Cypress
  * https://cypress.io

## Setup

* Clone the repo: (do this once)

        git clone git@github.com:BurlingtonCodeAcademy/markdown_preview.git
        
* Install dependencies: (do this once)
        
        cd markdown_preview
        npm install -y

* Launch the app locally:

        npm start
        
    * you can now visit <http://localhost:8080/> to see your app running on your own computer!

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

> Hint: You can use the `marked` library to convert markdown source into styled HTML. You can load it like this: `<script src='marked.js'>` since we added `marked.js` to the repository already. Alternately, you can use a CDN -- check the [Usage section of Marked's GitHub repo](https://github.com/markedjs/marked) for instructions.

<!--/BOX-->

<!--BOX-->
## Auto-Render

**Given** the user types into the *source* text field

**And** one second has elapsed since the user's last keypress

**Then** the *render* button should activate automatically

**And** the text is rendered as styled HTML into the *preview* area

<!--/BOX-->

<!--BOX-->
## Pretty Page

Make the app look pretty.

<!--/BOX-->

<!--BOX-->
## Pretty Preview

Make the *formatted text* in the *preview* area look pretty. 

Maybe make different elements different colors, or improve margins and padding, or whatever you like.

<!--/BOX-->

<!--BOX-->

## Refactoring

This isn't a user story, but an invitation for you to clean your code and experiment with new techniques.

Ideas:

  * if you used  `<button onclick=...>` or  `element.onclick=...` you may want to try using `element.addEventListener('click', ...)` instead -- [here's an example](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener#Example)
  * if you used an inline `<script>` you may want to try using an external `<script src=...>` instead

<!--/BOX-->

## More Information

* info on the Cypress test suite 
  * <http://docs.cypress.io/guides> 
  * <http://docs.cypress.io/api> 
* how to write event listeners and attach them to DOM elements
  * <https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onclick>
  * <https://developer.mozilla.org/en-US/docs/Web/Guide/Events/Event_handlers>
  * <https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener>
  * <https://developer.mozilla.org/en-US/docs/Web/Events/click>
* the Markdown language
  * <https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf>
* the Marked JavaScript library
  * <https://marked.js.org/>
