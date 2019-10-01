# Types of Media

* Images
* Video
* Audio

# Image Types

There are many different types of images, however we are going to focus on the three most common types of images you'll find around the web

### jpeg/jpg

Your most basic image type. These images tend to have very small file sizes, but they also don't have quite as many features as other image types.

These are pixel based images so they won't scale very well beyond their original size. They also don't support transparency, and so will block anything behind them in a rectangle with the dimensions of the image.

JPGs and JPEGs are the same type of image, however when embedding them in your page you will need to make sure you are using the correct file extension otherwise your site won't be able to locate the image

### png

PNGs, like JPGs, are a pixel based image type, and as such do not scale well beyond their original size. However, unlike JPGs, PNGs suppport transparency, and as such can appear to be irregular shapes.

Despite how they appeare they are still rectangular and as such will prevent you from interacting with elements that are behind them even though you can see through them.

### svg

SVG stands for **standard vector graphic** and unlike other types of images they are not made out of pixels.  They are instead collections of instructoins that tell the computer how to draw a specific shape.

Since they are not blocks of pixels SVGs can be scaled up indefinately with no detrinmental effects on quality. They also are **exactly** the shape they appear to be and as such will only block what they appear to cover.

# Video

Video is a popular part of many web apps, and can provide a hook to draw people into your age. There are several ways to get video (or video-like) content into your page.

* embedding the video directly
* embedding the video using an iFrame
* creating an animation using JavaScript and the `<canvas>` element

You can also animate SVGs by applying transformations to them that are triggered under certain ocnditions

# Embedded Video

Video can be a great way to present information, or draw people into your site. There are two ways to embed a video file directly into your site both have benefits aand drawbacks.

### Directly

By embedding a video directly into your site you can always make sure that your video is available. This is great for very small video files, but when working with larger video files it can slow your page's load time to a crawl, or even crash your site.

### iFrame

A better way to embed a (relatively) large video file would be to use an `<iframe>` element.  iframes open a window in your page to another site.  This means that you can host your video on adedicated video platform (like YouTube) and then just reference that location in your iframe.  This will prevent a video from slowing down your page's loading however the video may not be available immediately when the page loads.  You will also need to make sure that you have the proper permissions to access your chosen vide hosting platform, and if the url path to that video changes it will break your iframe.

# Animation with Canvas

You can animate elements within a `<canvas>` element using JavaScript.  Canvas elements work by continuously redrawing their contents as directed by your JavaScript.  Most animations make heavy use of the `setTimeout`, `setInterval` and `requestAnimationFrame` functions. There are also canvas specific methods (such as `requestAnimationFrame()`) that can be used to control animations.

Since your animations are completely controlled by JavaScript it is suprisingly easy to make your animations interactive.

There is a good tutorial for working with animations on [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_animations)

# Animating SVGs

Animating SVGs is done primarily through updates to the css that tells your browser how to draw the svg.  There are some JavaScript libraries you can use to simplify this process such as [Snap SVG](http://snapsvg.io/)

# Audio

You can include audio in your site using an `<audio>` element with a `src` attribute that points to the location of your audio files. Or by using JavaScript to create a new `Audio` object `let myAudio = new Audio('filename.mp3')` and setting it to play on some event. You can also open a window to a dedicated audio hosting platform like [soundcloud](https://soundcloud.com/) using an `<iframe>` element to speed up page load.