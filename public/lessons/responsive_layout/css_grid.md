# CSS Grid

- CSS Grid is an advanced 2-Dimensional layout system
- Can layout entire websites or small components of websites
- Describes fixed and flexible track areas
- Allows for precise item placement within areas
- Provides for alignment of items
- Supports separate and overlapping items

# Grid Layout Codepen

<p data-height="450" data-theme-id="light" data-slug-hash="zmpdqb" data-default-tab="css,result" data-user="Dangeranger" data-pen-title="CSS Grid Layout - Template Areas" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/zmpdqb/">CSS Grid Layout - Template Areas</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

# Basic Grid Example

```html

<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: 200px 200px 200px;
}
```

# Basic Grid Codepen

<p data-height="407" data-theme-id="light" data-slug-hash="ZqvJbM" data-default-tab="css,result" data-user="Dangeranger" data-pen-title="Basic Grid Example" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/ZqvJbM/">Basic Grid Example</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>


# Let's play a game!

Let's practice some more grid setup! [Grid Garden](https://cssgridgarden.com/) Is a fantastic game by the same people who brought you Flexbox Froggy that lets you practice using grid properties. Go there now, and see if you can complete all 28 levels!
