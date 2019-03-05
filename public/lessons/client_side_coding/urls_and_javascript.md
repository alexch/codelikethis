# URLs and Client-Side JavaScript

This brief lesson builds on the [URLs](/lessons/www/urls) lesson, discussing how to read and use the current page's URL (the contents of the address bar) from inside your *client-side* JavaScript apps.

# reading Query Parameters

`document.location.search` returns the URL's query string (everything after the `?`) as a single string

yes, "**search**" is the wrong name for this field `:-(`, but "search" and "query" are pretty synonymous, so it's not so bad

unfortunately, you need to parse the string into parameters, decoding `?x=1&y=2` into the object `{x: 1, y: 2}`

fortunately, there is a standard JS API object to help you, named [URLSearchParams](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams)

```js
let params = new URLSearchParams(document.location.search);
let name = params.get('name');
```

# reading the anchor fragment

`document.location.hash` returns the URL's *fragment* (everything after the `#`) as a string

yes, "**hash**" is *really* the wrong name for this field, but it is now standard `:-(`

Normal web pages use the anchor to *scroll* to an element with a matching `id` or `name` attribute

Single-Page Apps use the anchor to *redraw* the page and call it "routing"

