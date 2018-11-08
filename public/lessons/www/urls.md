# URLs

* **U**niform
* **R**esource
* **L**ocator

# URL Diagram

![complex url](complex_url.png) (via [DoePud](https://doepud.co.uk/blog/anatomy-of-a-url))

# URL Breakdown

`protocol://host:port/path?query#fragment`

* some parts are optional

# Protocol

* `http` - the basics
* `https` - "S" means "Secure"
* `file` - local filesystem

many others...

# Host

in `http://www.example.com`

the host is `www.example.com`

the host is a *domain name* 

the browser will use that name to locate the host server, using DNS (*domain name service*) to translate from text to an *IP address*, then use *TCP/IP* to connect to that host and begin an *HTTP* session

# Port

in `http://localhost:8080`

8080 is a *port number*

it identifies the *HTTP service* running on the server

the default port for HTTP is 80 (but developers often run servers on other ports, especially on their local machine)

# Path

in `http://musical-notes.com/bands/heart`

the path is `/bands/heart`

the path helps the *service* locate the specific *resource* that the client wants

(this is the "R" in "URL")

the final part of the path ("heart") is called the *slug* and is used for search engine optimization (SEO)

# Queries

in `http://musical-notes.com/bands/search?heart`

the path is `/bands/search`

the query is `?heart`

> this was the original way to do searches on the Web, but was soon enhanced...

# Query Parameters

Query Parameters use the same URL slot as normal queries, but use a particular format to encode multiple parameters into a single string

*inside* the query string, URLs use *delimiters* are `&` to separate parameters, and `=` to separate individual parameter names from values

in `http://musical-notes.com/bands/search?category=folk&date=1977`

the *query* is `?category=folk&date=1977`

the *query parameters* are

|name|value|
|---|---|
|category|`folk`|
|date|`1977`|

# Percent Encoding

any funky characters in a URL are "escaped" (encoded) as hexadecimal using [percent-encoding](https://en.wikipedia.org/wiki/Percent-encoding)

"funky" includes...

* space (which turns into `+` or `%20`)
* plus signs (`%2B`) and percent signs (`%25`)
* some other punctuation marks
* non-ASCII Unicode characters

e.g. `http://example.com/引き割り.html`
becomes `http://example.com/%E5%BC%95%E3%81%8D%E5%89%B2%E3%82%8A.html`

# Query Parameter Encoding

Combining query parameter encoding and percent-encoding can lead to some confusing URLs. For instance...

in `http://musical-notes.com/bands/search?category=80%27s+Rock+Bands&page=2`

the query is `?category=80%27s+Rock+Bands&page=2`

* the first parameter is `category=80%27s+Rock+Bands`
* the `%27` means "apostrophe"
* the `+` means "space"

so the decoded query parameters are

|name|value|
|---|---|
|category|`80's Rock Bands`|
|page|`2`|

>...it's confusing but it makes sense if you break it down 

# fragment

in the URL `http://example.com/users/alex#profile`

`#profile` called the *fragment* or *anchor* 

the fragment is a hint to the *browser* and is **not** sent to the server with the rest of the URL

in normal pages, it asks the browser to scroll to a location *inside* the document, after the page has loaded

in Single-Page Apps (SPAs) it is used to determine which pseudo-page to display

