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
    * Other page withn the site, using relative `href="/somePage.html"`

```html
<a href="#about-me">About Me</a>
```

# Anchor Links Examples

[Internal Navigation Example](/lessons/responsive_layout/navigation-anchors-internal.html)

[External Navigation Example](/lessons/responsive_layout/navigation-anchors-external-0.html)

# More about anchors

* links vs buttons -- look and feel differences
* `:visited` pseudoselector -- links look a little different after you've visited them
* directory navigation with relative paths
