# Shortly

URL Shorteners are oddly popular. In addition to the big shorteners (`tinyurl.com` and `bit.ly`), there are now many other branded shorteners, including `wp.me` and `youtu.be` and `goo.gl` and `nyti.ms` and `pep.si` and `t.co` and...

There are [many problems with URL shorteners](https://en.wikipedia.org/wiki/URL_shortening##Shortcomings), from scalability to latency to linkrot to fraud. In this project we will replicate this technology -- for educational purposes only.

## Tech

* cloud hosting e.g. Heroku
* server-side code, e.g. NodeJS
* server-side storage, e.g. Mongo 

## Stories

<!--box-->

#### Canned Links

**Given** seed data mapping names to URLs in the following format,

    @@@json
    {
        "btvca": "http://www.burlingtoncodeacademy.com/",
        "iccrm": "http://www.benjerry.com/"
    }

**When** a web browser requests the URL path `/icecream`

**Then** the server should return a [301 Redirect](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes##3xx_Redirection) response to `http://www.benjerry.com/`

<!--/box-->
<!--box-->

#### Case Insensitivity

**Given** the above seed data

**When** a web browser requests the URL path `/IceCream`

**Then** the server should return a [301 Redirect](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes##3xx_Redirection) response to `http://www.benjerry.com/`

<!--/box-->
<!--box-->

#### Error Handling

**Given** that there is no path named `bogus`

**When** a web browser requests the path `/bogus`

**Then** the server should return a [404 Not Found](https://en.wikipedia.org/wiki/HTTP_404) response

<!--/box-->
<!--box-->

#### Add Link

**When** a user visits the landing page

**Then** they should see a form with the following items:
1. a text field named `link`
2. a button titled "Shorten"

**When** they enter `http://www.gardeners.com` in the `link` field and click "Shorten"

**Then** they see a new URL, of the form:

    @@@html
    <a id="shortlink" href="http://myapp.herokuapp.com/xyzzy">
      http://myapp.herokuapp.com/xyzzy
    </a>

where `xyzzy` is a pseudorandom 5-character alphanumeric string

**When** a web browser requests the URL `http://myapp.herokuapp.com/xyzzy` 

**Then** the server should return a [301 Redirect](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes##3xx_Redirection) response to `http://www.gardeners.com`

<!--/box-->
<!--box-->

#### Reuse Link

**Given** the above setup of a link to `http://www.gardeners.com`

**When** they enter `http://www.gardeners.com` again

**Then** they see the *same* short name (`xyzzy` in the example)

<!--/box-->

## TODO: more stories

## TODO: cypress tests

