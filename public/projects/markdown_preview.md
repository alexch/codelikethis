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
* markdown library e.g.
  * https://github.com/chjj/marked
* Cypress

## Setup

* To clone the repo and install dependencies: (do this once)

        git clone git@github.com:BurlingtonCodeAcademy/markdown_preview.git
        cd markdown_preview
        npm install -y

* To launch the app locally:

        npm start

* To launch the Cypress Runner window:
  * open a *different terminal window* and `cd` to your project dir
  * run `npx cypress open` <br><br>

* To run the Cypress tests:
 * in the Cypress Runner window, click the "Run All Tests" button, or click on a single test to run it alone


## User Stories

<!--box-->
**Given** a running app

**Then** the following elements should exist on the page:

* *headline*: an `H1` element containing the text `Markdown Preview`
* *source*: a `textarea` element with the id `source`
* *preview*: a `div` element with the id `preview`
* *render*: a `button` element  with the id `render`

<!--/box-->

<!--box-->
**Given** the user has entered text in the *source* text field

**When** the user clicks *render* button

**Then** the text is copied into the *preview* area

<!--/box-->

<!--box-->
**Given** the user has entered *markdown format* text in the *source* text field

**When** the user clicks *render* button

**Then** the text is rendered as styled HTML into the *preview* area

> Hint: use the `marked` library to convert markdown source into styled HTML

<!--/box-->

<!--box-->

**Given** the user types into the *source* text field

**And** one second has elapsed since the user's last keypress

**Then** the *render* button should activate automatically

**And** the text is rendered as styled HTML into the *preview* area

<!--/box-->

<!--box-->

Make the app look pretty.

<!--/box-->

<!--box-->

Make the *formatted text* in the *preview* area look pretty. 

Maybe make different elements different colors, or colored, or indented, or whatever you like.

<!--/box-->

## More Information

<http://docs.cypress.io/guides/getting-started>
