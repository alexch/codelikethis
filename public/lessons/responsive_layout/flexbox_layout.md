# Introduction to Flexbox

 The Flexbox Module (commonly referred to as flexbox) may be one of the single most useful tools for website layout using CSS. It helps to solve many issues and fill gaps that have existed since the dawn of CSS. 
 
 Flexbox helps accomplish the following:

 * Horizontal or vertical alignment of elements
 * Arrangement (order) of elements 
 * Space distribution between elements

# Notes to Remember

 * Flexbox is one-dimensional. It can arrange items either in a row, or a column.
 * Flexbox can be extremely useful for laying out elements such as navigation bars, headers, image galleries, etc.
 * Flexbox *fixes* CSS layout madness by placing the responsibility for layout with the *container*, and not asking *each item* to be responsible for laying *itself* out

# The Flex Container

 Flexbox works by applying CSS properties to both the container, and the children inside the container. 

 * First: add the CSS property `display:flex;` to the container of the items you intend to arrange. 
 * Remember, flexbox is one dimensional. `display:flex` arranges your items in a row. This can be changed with `flex-direction: column`

## Example
 ```css
@@@css
 #container {
  display: flex;
  flex-direction: column;
}
 ```

![Illustration of Flex Container](https://cdn-images-1.medium.com/max/1600/1*4yKnG2-vuPF5XA-BmXADLQ.gif "Flex Container")

# Reversing the Order

* Until now, re-arranging items with pure CSS was not possible.
* With Flexbox, you can reverse the order of your row or column with a single directive!
* On the flex container, use 
  * `flex-direction: column-reverse;` 
  * or `flex-direction: row-reverse`

## Example
```css
@@@css
#container {
  display: flex;
  flex-direction: column-reverse;
}
```

![Illustration of Flex Reverse](https://cdn-images-1.medium.com/max/1000/1*PBr_ncouIehALaEOWmSbpQ.gif "Flex Reverse")

# Justify Content

Justifying your content, both horizontally and vertically, used to be a very large pain in the neck. 

Not anymore! Flexbox makes this easy, with one simple line of CSS. There are 5 different values for the CSS property `justify-content`:

1. Flex-start
2. Flex-end
3. Center
4. Space-between
5. Space-around

## Example For Centering Content
```css
@@@css
#container {
  display: flex;
  justify-content: center;
}
```

* `Justify content` is applied to the flex container as well. It works along the main axis of the flex container, and does the following:

![Justifying content with Flexbox](https://cdn-images-1.medium.com/max/1000/1*2-6Tw8jqWrMKOfIugKyuDA.gif "Justify Content with Flexbox")

# Align Items

`align-items` is also applied to the flex container. This is similar to justify content, but works along the cross-axis. If your items are arranged in a row, this would act on the vertical axis. 

* Align items allow you to fill the container vertically, or align it along the baseline of the flex container (bottom edge). Before Flexbox, this was very difficult to do. 
* The five values for `align-items` are:

  1. flex-start
  2. flex-end
  3. center
  4. stretch
  5. baseline

## Example
```css
@@@css
#container {
  display: flex;
  align-items: stretch;
}
```

* Note that if you use `align-items: stretch`, any height values for the children inside the flex container will override this functionality. 

![Flexbox Align Items Property](https://cdn-images-1.medium.com/max/1000/1*htfdNmRIIFu_veRaFOj5qA.gif "Aligning items with Flexbox")

# Flex Direction

* As we covered earlier, your flex items can be arranged either in a row, or a column. This is done with either `flex-direction:column` and `flex-direction:row`

## Example
```css
@@@css
#container {
  display: flex;
  flex-direction: row;
}
```

![Flexbox Direction Property](https://cdn-images-1.medium.com/max/1000/1*htfdNmRIIFu_veRaFOj5qA.gif "Flex direction with Flexbox")

# Controlling Individual Flex Items

* You can also apply specific flexbox properties to individual flex items, not just the flex container. There are a number of fairly advanced properties, but we will cover the most useful ones here.

# Order

* This is a fairly simple property that accepts integer values for ordering items.

Want to switch the first two navigation items on your website? First the container must have the property `display: flex;`. 

Then give the first item `order: 2`, and the second item `order: 1`. 

(Note that the default value is `0`, so all items will need to be given an order number.)

## Example 
```css
@@@css
.firstItem {
  display: flex;
  order: 1;
}

.secondItem {
  display: flex;
  order: 2;
}
```

> This is groundbreaking. Never before were we able to rearrange the order of elements on a website with pure CSS.

# Align Self 

* You can also align individual items, rather than all flex items at once. This property accepts the same values as `align-items`, and achieves the same results, but for individual items:

  1. flex-start
  2. flex-end
  3. center
  4. stretch
  5. baseline

## Example 
```css
@@@css
.navigationBarItem0 {
  display: flex;
  align-self: flex-start;
}
```

![Flexbox Align Self Property](https://cdn-images-1.medium.com/max/1000/1*HIADl1oL6pxXb2dMh_pXSQ.gif "Self aligning with Flexbox")
# Flexigrid

[flex-form](./flex-form.html)
