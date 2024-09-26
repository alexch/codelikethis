# Anchors

* Anchor tags have two opposite purposes
  1. `<a href=''>` - to link *out* to another location 
  2. `<a name=''>`- to *name* a location inside a page that can be linked *into*

* *inner anchors* are also defined by `id` in modern browsers
* when linking to an *inner anchor*, use the # character to distinguish *files* from *inner anchors*)

```html
<a href='#stuff'>here is my stuff</a>
<a href='#things'>here are my things</a>
...
<a name='stuff'>
<h2>My Stuff</h2>
...
<h2 id='things'>My Things</h2>
```

# Anchor links

* Anchor tags create links to a linkable location
    * Within the same page, using an `#someId` selector
    * Other page within the site, using relative `href="/somePage.html"`
    * External webpages, using a full URL `href="https://www.example.com"`

```html
<a href="#about-me">About Me</a>
```

# Lab: Navigation

Anchor tags are probably the most useful element to use when setting up site navigation. Let's make a page with some basic navigation capabilities.

* `cd` into the `example-html` directory we set up in the "Hello, HTML!" lab
* You should currently have a document named `index.html` which has a header, and at least three seperate sections
* in html-example create another HTML document named `about.html`, and put an h1 element with the text "About Page" (or something similar) in it
* **And** an anchor tag that links back to the home page (index.html)
* If you are building this off of your 'Hello, HTML!' lab your `index.html` will already have several sections set up
  * Otherwise, in the index.html file set up several sections with placeholder text
  * You can easily generate placeholder text through [lorem ipsum generators](https://loremipsum.io/ultimate-list-of-lorem-ipsum-generators/)
  * The basic idea is to have a page that needs to scroll to have different sections in view. So don't be stingy with the text!

* In your `index.html` document create a nav section that links to at least two internal sections, the about page, and at least one external site of your choice. 
