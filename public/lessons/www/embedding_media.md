    topic name: "embedding"
    topic name: "html-elements"
    topic name: "iframes"
    topic name: "hacking"

# Embedding Media

[Embedding](/lessons/www/embedding-media) is the process of including *media* from other sources into your web sites.

"other documents" can include: 

  * media files
    * images, sound, video
  * other HTML (pages or snippets)
  * advertisements
  * maps, graphs, charts
  * search box e.g. [Google custom search](https://cse.google.com/)

"embedding" is sometimes also called "including" or "transcluding"

# Interactive Embedding

Sometimes you can use JavaScript to interact with the embedded file or app as if it were another User Interface element on your page!

For instance, you could programmatically pause and play an embedded audio clip, say, playing "hoorah!" when the user wins a game of Tic-Tac-Toe.

Or, if the user moves their location on an embedded Google Map, your app could be notified and find the city name and look up restaurants in that area on [Yelp's API](https://www.yelp.com/developers/documentation/v3).

> This lesson focuses on *static* embedding: 
> displaying media and allowing the user to interact with it directly.
> The [Interactive Embedding](/lessons/client-side-coding/embedding) lesson focuses on *interactive* embedding: 
> using JavaScript to pass messages between your page's 
> scripts and the embedded media.

# Embedding Images

`<img src=''>` is the original embed

[MDN: img](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img)

# Where does the media come from?

* Usually images are served from the same web server as HTML.
* Some web sites host images or other media for free or a small cost
  * *images*: flickr.com, imgur.com, 500px.com, etc.
  * *video*: YouTube.com, Vimeo.com, Wistia.com, etc.
  * *audio*: SoundCloud.com, etc.
* a [CDN](https://en.wikipedia.org/wiki/Content_delivery_network#Notable_content_delivery_service_providers) hosts all sorts of media for you for $$$
  * Amazon AWS / CloudFront, CloudFlare, Akamai...

# Embedding IFrames

`<iframe>` means "inline frame"

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe

```html
<iframe height='300' width='400' src='example.com'></iframe>
```

<iframe height='300' width='400' src='http://example.com'></iframe>

# Malware Vectors

**Beware** the "[same origin policy](https://www.w3.org/Security/wiki/Same_Origin_Policy)":

```
Refused to display 'http://www.burlingtoncodeacademy.com/' in a frame because it set 'X-Frame-Options' to 'sameorigin'.
```

  * some web servers (e.g. Wordpress) set these headers *on* by default
  * other web servers (e.g. Apache) set these headers *off* by default

**Beware** giving foreign JavaScript access to your page contents and user-input data
  
  * the `sandbox` attribute limits what the loaded page can do

# Embedding HTML snippets

You can use iframes to load the same HTML onto several pages on your site.

This is often used for login boxes.

> Warning: iframes can take longer to load than the rest of the page, and can eat up CPU and RAM, so don't overuse them

# Embedding Flash

<div style="border: 1px solid black; background: #FDFDFD; margin: auto; text-align: center">
Adobe Flash <br>
R.I.P. <br>
1996 - 2015 
</div>

"In July 2017, Adobe announced that it would declare Flash to be [end-of-life](https://en.wikipedia.org/wiki/Adobe_Flash#End_of_life) in 2020, and will cease support, distribution, and security updates to Flash Player." 

# Embedding Video

HTML5 defines a standard `<video>` tag

  * Use the `<video>` tag when you are hosting your own video media file (on your web server or a CDN)

  * video hosting sites like YouTube have their own rules and sample code which you should find and copy into your HTML file

> **Tip**: you can use automatically start playing the video when the page loads; to be polite you should also mute the volume, like this: `<video muted=true autoplay=true src='/videos/yelling-man.mp4'>`

* https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video
* https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Video_and_audio_content

# Embedding Audio

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/audio

# Embedding Maps

<iframe id="inlineFrameExample"
    title="Inline Frame Example"
    width="300"
    height="200"
    src="https://www.openstreetmap.org/export/embed.html?bbox=-73.2130900,44.4749000,-73.2102500,44.4772200&layer=mapnik">
</iframe>

```html
<iframe id="inlineFrameExample"
    title="Inline Frame Example"
    width="300"
    height="200"
    src="https://www.openstreetmap.org/export/embed.html?bbox=-73.2130900,44.4749000,-73.2102500,44.4772200&layer=mapnik">
</iframe>
```

OpenStreetMaps defines a "bounding box" as a four-tuple: min Longitude, min Latitude, max Longitude, max Latitude. 

You can find the bounding box for a given map on https://www.openstreetmap.org/ by clicking the **Export** button.

# Scripting Maps

It is possible to use JavaScript to interact with an embedded map. See [the client-side coding lesson on embedding](/lessons/client-side-coding/embedding)
