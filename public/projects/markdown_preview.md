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

```
git clone git@github.com:BurlingtonCodeAcademy/markdown_preview.git
cd markdown_preview
npm install -y
npx cypress open  # opens runner window, click on test to run or click "Run All Tests"
```

When you change your source code, remember to **stop and restart** your node server.

## User Stories

<!--box-->
- elements exist on page
<!--/box-->

<!--box-->
- click button -> render = just copy
<!--/box-->

<!--box-->
- click button ->  render = markdown
<!--/box-->

<!--box-->
- render on keypress, not button
<!--/box-->

<!--box-->
- security (injection protection)
<!--/box-->

<!--box-->
- colorized source
<!--/box-->

## More Information

<http://docs.cypress.io/guides/getting-started>
