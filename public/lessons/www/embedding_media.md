# Embedding

"embedding" means including other documents inside your web page

"other documents" can include: 

  * media files
    * images, sound, video
  * other HTML (pages or snippets)
  * advertisements
  * JavaScript-enabled apps
    * interactive maps
    * graphs and charts
    * search box e.g. [Google custom search](https://cse.google.com/)

"embedding" is sometimes also called "including" or "transcluding"

# Embedding Images

`<img>` is the original embed

# Embedding IFrames

`<iframe>` means "inline frame"

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe

```
<iframe height='300' width='400' src='example.com'></iframe>
```

<iframe height='300' width='400' src='http://example.com'></iframe>

**Beware** the "same origin policy":

```
Refused to display 'http://www.burlingtoncodeacademy.com/' in a frame because it set 'X-Frame-Options' to 'sameorigin'.
```

**Beware** giving foreign JavaScript access to your page contents and user-input data
  
  * the `sandbox` attribute limits what the loaded page can do

# Embedding HTML snippets

You can use iframes to load the same HTML onto several pages on your site.

This is often used for login boxes.

> Warning: iframes can take longer to load than the rest of the page, so don't overuse them

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
    src="https://www.openstreetmap.org/export/embed.html?bbox=-0.004017949104309083%2C51.47612752641776%2C0.00030577182769775396%2C51.478569861898606&layer=mapnik">
</iframe>

```
<iframe id="inlineFrameExample"
    title="Inline Frame Example"
    width="300"
    height="200"
    src="https://www.openstreetmap.org/export/embed.html?bbox=-0.004017949104309083%2C51.47612752641776%2C0.00030577182769775396%2C51.478569861898606&layer=mapnik">
</iframe>
```

[TODO: make this Burlington]

# Scripting Maps

It is possible to use JavaScript to interact with an embedded map.

### to change the map's location

todo

### to respond to changes in the map's location

todo

