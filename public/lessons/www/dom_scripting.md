# DOM Scripting

"Scripting" is a term used when you're writing programs that don't do much *on their own*; instead scripts usually use other, more advanced programs, or are embedded within them.

"DOM Scripting" is using JavaScript to manipulate the DOM (page elements and contents) inside a web page, either during page load, or in response to user events, like clicking a button or selecting text.

# `document`

In a DOM script, the current page is always available via the *global variable* named `document`.

In addition to providing many useful *functions*, it also provides some *properties*:

`document.URL` - the URL of the current page, in the form of a string. 

`document.location` - the URL of the current page, in the form of a Location object. 

`document.location = 'http://example.com'` - causes the browser to visit that web page.

`document.title = 'the joy of cooking'` - changes the *title* of the document, which appears inside windows and tabs. Some apps use this to display, e.g., a count of unread messages, which the user can then see without switching tabs.

<https://developer.mozilla.org/en-US/docs/Web/API/Document>

# Finding an Element by ID

If an element has an `id` attribute, you can get a *pointer* to that element with a single line of code:

    var element = document.getElementById(id);

Once you have a pointer to that element, you can manipulate it further. You can also log it to the console for further inspection using:

    console.log(element)

<https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementById>

# Finding an Element by CSS Selector

`var element = document.querySelector('h2.preview > p')` - returns the first Element within the document that matches the specified selector

<https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector>


# Using an Element

Once you find an element (using `getElementById` or any other way), you can start using it.

    @@@ js
    var header = document.getElementById('header')
    var text = header.textContent

There is also a property called `innerText` but it's confusing and implemented differently in different browsers.

<https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent>

# Nodes vs Elements

In the DOM, the term "node" means *almost any* item that you can find in the document tree.

An element is a particular type of node, and it's the most common, but beware, these are also nodes...

* Document, Element, Text, Comment, CDATASection, ProcessingInstruction, DocumentFragment, DocumentType, Notation, Entity, EntityReference

...and all of them have their own properties that are *not* part of the basic Node set.

When you're hunting for a function or property, sometimes it's on Node, and sometimes it's on Element. Make sure to check *both* of these documentation pages:

  * <https://developer.mozilla.org/en-US/docs/Web/API/Node>
  * <https://developer.mozilla.org/en-US/docs/Web/API/Element>

Also, this sense of "node" is **completely different** from the "node" in NodeJS. :-(

# Finding many elements

In addition to getting a *single* element by its `id` or a CSS selector, you can also ask the document to give *all* elements that match a certain criterion.

`var elements = document.getElementsByClassName('profile-picture')` - by *CSS Class* name

`var elements = document.getElementsByTagName('h2')` - by *Element* name

`var elements = document.querySelectorAll('h2.preview > p')` - by *CSS Selector* expression

These return *collection* objects, so you must write more code to get the actual element objects, or to check the collection's length.

# Events

In JavaScript, *event handlers* are *callback functions*.

The classic example of an event handler is "onclick", i.e. "please call this function when the user clicks this button".

To attach an event handler,

1. Find the element, e.g. 

        @@@ js
        var button = document.getElementById('magic');
2. Attach the callback, like this:

        @@@ js
        button.addEventListener('click', 
          ()=>{alert('Abracadabra!')}
        );

> NOTE: using the "fat arrow" for event handlers is a **very good idea** since fat arrows will restore the `this` variable to point to the same object as when the listener was added.

<https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener>

# Events by Reference

If you have already defined an event handler function, you can attach it by reference, like this:

    @@@ js
    button.addEventListener('click', sayMagicWord)

> NOTE: if you attach a listener by reference, pass the *name* of the function only! Do not immediately *invoke* the function, like this:

    @@@ js
    button.addEventListener('click', sayMagicWord())  // BAD CODE, DO NOT USE

This calls sayMagicWord when the listener is *attached* and tries to attach the *return value* of `sayMagicWord` (which will likely be `undefined`).


