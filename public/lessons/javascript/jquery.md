# jQuery Tour

This is not meant to be a comprehensive jQuery guide, or even a tutorial, but a tour through some of its core concepts and fun and useful functions.

For more info and some great tutorials, see the [jQuery site](http://jquery.com/), especially

  * [jQuery API reference](http://api.jquery.com/)
  * [jQuery Docs](http://docs.jquery.com/Main_Page)
  * [How jQuery Works](http://docs.jquery.com/How_jQuery_Works)
  * [jQuery Tutorials](http://docs.jquery.com/Tutorials)
  * [jQuery Tutorials for Designers](http://webdesignerwall.com/tutorials/jquery-tutorials-for-designers)

# Core concept: $

* all of jQuery lives inside a single global function
* that function is named `jQuery`

        @@@ javascript
        jQuery('#foo').hide();

* it's also named dollar sign

        @@@ javascript
        $('#foo').hide();

* it's a function, but it's also an object, with properties and methods of its own

        @@@ javascript
        $.now(); // returns the current time in msec

# Core concept: Selectors

* the parameter to the `$` function is a Selector
* a Selector is a string that matches 0 or more HTML elements
* Selector syntax is CSS, with some extensions
  * `$('a.nav[href=/home]')` - selects all A elements whose class is 'nav' and whose href attribute is '/home'
* References:
  * [Selectors Doc](http://api.jquery.com/category/selectors/) for more details
  * [Interactive jQuery selector tester](http://www.woods.iki.fi/interactive-jquery-tester.html)

# Core concept: Collections

* when you call the $ function you always get back a **jQuery Collection**
  * even if only one element matched
  * or none
  * the docs call it a [jQuery Object](http://api.jquery.com/Types/#jQuery)
* a Collection has a length property
  * but it's not an Array
* every Collection has a gajillion methods on it
  * actually they're on its prototype
  * these are all documented at <http://api.jquery.com/>
* most of these methods return `this`, i.e. a pointer to the original collection
  * allows method chaining
  * some methods change the matched set
  * some methods return values, not collections, e.g. `attr` and `html`
* gotcha: some of the methods only act on the first item in the collection
  * `$('a').attr('href')` -- returns the `href` attribute of the **first** matching element
  * you can use `each` to execute a function on all items
  * or `eq` to reduce the set to a single item
  * `$('a').eq(2).attr('href')` -- returns the `href` attribute of the **third** matching element
  * `$('a').last().attr('href')` -- returns the `href` attribute of the **last** matching element
  * see also [Filtering](http://api.jquery.com/category/traversing/filtering/) doc
* gotcha: if you have an error in your selector, jQuery will **not** warn you
  * it will just return an empty collection


# Loading jQuery

  * <http://docs.jquery.com/Downloading_jQuery>

          <script type="text/javascript"
           src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js" />

  * [3 reasons why you should let Google host jQuery for you](http://encosia.com/2008/12/10/3-reasons-why-you-should-let-google-host-jquery-for-you/)
    1. Decreased Latency
    2. Increased parallelism
    3. Better caching

# Animation

* jQuery has some fun methods to animate CSS attributes
* <http://api.jquery.com/animate>

        @@@ javascript

        $("#logo").animate({
            backgroundColor: "#aa0000"
        }, 1000 );

  * You choose the attribute(s) and their final value, plus the duration of the entire effect
  * jQuery calculates and interpolates the details
* jQuery UI has lots more
  * <http://jqueryui.com/>, not <http://jquery.com/>

# Testing Animation

  * Use a "Mock Clock"
    * replace `setTimeout` with a different function during tests
    * this function keeps track of what would be called when
    * then "ticks" forward when asked
    * you can simulate speeding up and slowing down time
  * In Jasmine:

        @@@ javascript
        beforeEach(function() {
            jasmine.Clock.useMock();
        });
        //... call the code that calls setTimeout
        jasmine.Clock.tick(500); // advance 500 msec

    * see thread [How to test timers?](http://groups.google.com/group/jasmine-js/browse_thread/thread/f987956c624840d1/73b3ff5391244b19)

# Events

# Hooking Up

* jQuery's `bind` method

        @@@ javascript
        $('#hi').bind('click', function() {
            alert("hi");
        });

* jQuery's convenience method for standard event types

        @@@ javascript
        $('#hi').click(function() {
            alert("hi");
        });

    * gotcha: if you call `click()` with no parameters, it *triggers* a click

# `return false`

* if the event listener returns false, all further processing stops
* usually used to stop a form from actually submitting after a handled `submit` event

# more about jQuery event binding

    @@@ javascript
    var f = function(event) {....}

* convenience methods for standard event types

        @@@ javascript

        $('#hi').click(f);
        $('#hi').change(f);

* using `bind` directly

        @@@ javascript

        $('#hi').bind('click', f);
        $('#ho').bind('change', f);

* `bind` can hook many events at once

        @@@ javascript

        $('#hi').bind('click change', f);

* or you can use chaining for the same effect

        @@@ javascript

        $('#hi').bind('click', f)
                .bind('change', f);

# bind vs. bind

In the [prototype JS framework](http://www.prototypejs.org) the function `bind` is used to stash and restore `this`. It's actually on Function.prototype, so you can do stuff like this:

    @@@ javascript

    var x = {name: 'Ulysses'};
    x.getName = function() { return this.name; }
    var boundGetName = x.getName.bind(x);
    boundGetName();  // -> 'Ulysses'

This is useful for passing callbacks that still refer to their own objects, rather than whatever random thing `this` is set to at the time they're called.

Maybe jQuery's `bind` method should have been called `listen` or `handle`, since it's event specific. Oh well.

jQuery's version of prototypejs's `bind` method is called `proxy`, which is kind of a poor name since it doesn't really implement the Proxy Pattern, or help you to do so.

# Ready, Fire, Aim

jQuery has a special event that is fired when the page is "ready", i.e. the DOM hierarchy has been fully constructed.

    @@@ javascript

    $(document).ready(function() {
        // set up your page
    });

It's best to put setup code in a "ready" handler rather than directly inside a `<script>` tag since the document might not be ready yet.

This can be abbreviated, but this might be unclear:

    @@@ javascript

    $(function() {
        // set up your page
    });

"In cases where code relies on loaded assets (for example, if the dimensions of an image are required), the code should be placed in a handler for the load event instead." - <http://api.jquery.com/ready/>

