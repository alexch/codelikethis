# Lab: Create a Dropdown Menu

In this lab you should create a simple dropdown menu which should behave as follows:

- When the dropdown's title is clicked the dropdown should be displayed
- Clicking on any entry in the dropdown should close the dropdown
- Bonus Challenge: What other events could you use to trigger the dropdown? 

# Dropdown Solution

<details>
<summary>Hint</summary>
<div>
It is much easier to target elements in JavaScript if you give them an ID or class name in your HTML e.g.

```html
<div id="drop-title">
    Drop Down Menu
  </div>
  <ul id="drop-content" style="display: none;">
    <li class="drop-item">Item 1</li>
    <li class="drop-item">Item 2</li>
    <li class="drop-item">Item 3</li>
    <li class="drop-item">Item 4</li>
  </ul>
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

  ```html
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>

  <body>
    <div id="drop-title">
      Drop Down Menu
    </div>
    <ul id="drop-content" style="display: none;">
      <li class="drop-item">Item 1</li>
      <li class="drop-item">Item 2</li>
      <li class="drop-item">Item 3</li>
      <li class="drop-item">Item 4</li>
    </ul>

    <script>
      let title = document.getElementById('drop-container')
      let list = document.getElementById('drop-content')
      let items = document.getElementsByClassName('drop-item')

      title.addEventListener('click', function(event) {
        list.style.display = 'block
      })

      for(let item of items) {
        item.addEventListener('click', function(event) {
          list.style.display = 'none'
        })
      }

    </script>
  </body>
  </html>
  ```

</div>
</details>

# Lab: Change the Color

In this lab you will set up an event listener to change the background color of a div when that div is clicked.

 - If the div is not purple, change the background color to purple
 - Otherwise change it to yellow
 - Feel free to use any color combination of your choice
 - Bonus Challenge: What other properties can you change on the element?

# Change the Color Solution

<details>
<summary>Hint</summary>
<div>

  When an event listener calls a callback function it passes the event as an argument to that function. The event is an object with some useful properties such as the `target`. `event.target` is whatever HTML element triggered the event, so to get the background color of that element you can say `event.target.style.backgroundColor`.

</div>
</details>

<details>
<summary>Solution</summary>
<div>

  ```html
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>

  <body>
    <div id="colorful">
      Change my Background!
    </div>

    <script>
      let colorful = document.getElementById('colorful')

      function changeColor(event) {
        if(event.target.style.backgroundColor === "purple") {
          console.log(event.target)
          event.target.style.backgroundColor = 'yellow'
        } else {
          console.log(event.target)
          event.target.style.backgroundColor  = 'purple'
        }
      }

      colorful.addEventListener('click', changeColor)

    </script>
  </body>
  </html>
  ```

</div>
</details>

# Lab: Say Hello

In this lab you will set up an input form where you can enter a name, and the page will display text greeting that name.

  - Set up a form with a text input, and submit button
  - When a user inputs their name and hits submit the page displays a personalized greeting for that name
  -  Format the name so that it's always capitalized
  - Bonus Challenge: Can you get it to say hello to some names, and tell others to go away?


# Say Hello Solution

<details>
<summary>Hint 1</summary>
<div>

Text inputs have a `value` property which is equal to the text that's currently in the input area. This value comes into JavaScript as a string, and all standard string methods work on it.

</div>
</details>

<details>
<summary>Hint 2</summary>
<div>

When working with forms part of the default `submit` action is to refresh the page, which means you loose any DOM manipulation you might have applied. You can prevent default behaviours from taking place by calling `event.preventDefault()`

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title
</head>

<body>
  <form id='name'>
    <input id="name-input" type='text' />
    <input type='submit' />
  </form>

  <h1 id='display'></h1>

  <script>


    let nameForm = document.getElementById('name')
    let nameInput = document.getElementById('name-input')
    let display = document.getElementById('display')

    nameForm.addEventListener('submit', function(event) {
      event.preventDefault()
      let name = nameInput.value
      let formattedName = name[0].toUpperCase() + name.toLowerCase().slice(1)
      display.textContent = "Hello, " + formattedName + "!"
    })
    
  </script>
</body>
</html>
  ```

</div>
</details>

# Lab: Creating, and Modifying a List

In this lab you will create a user interface to programatically generate a list based on user input.

  - Create a form that will accept user input
  - When the form is submitted use the input value to generate a new list item
  - Bonus Challenge: Can you make it remove an item when the user clicks on it?


# Creating, and Modifying a List Solution

<details>
<summary>Hint</summary>
<div>

The `document` object can be used for more than just DOM Queries. It can also be used to create HTML elements through the `document.createElement` method, which takes the element type (e.g. 'li', 'div', 'p', etc.) as an argument when it is called. You can insert these elements into your document by targeting an element with a DOM query, and calling the `appendChild` method on it passing the element you just created as an argument

```js
let target = document.getElementById('parent-node')
let childElement = document.createElement('li')

target.appendChild(childElement)
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

  ```html
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>

  <body>
    <form id='items'>
      <input id="item-input" type='text' />
      <input type='submit' />
    </form>

    <ul id='display'></ul>

    <script>


      let itemForm = document.getElementById('items')
      let itemInput = document.getElementById('item-input')
      let display = document.getElementById('display')

      itemForm.addEventListener('submit', function(event) {
        event.preventDefault()
        let item = document.createElement('li')
        item.textContent = itemInput.value

        display.appendChild(item)
        
      })

    </script>
  </body>
  </html>
  ```

</div>
</details>