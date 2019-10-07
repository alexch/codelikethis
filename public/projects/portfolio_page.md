# Portfolio Page

## Background

A "Personal Portfolio" is a web site that showcases your personal work. It can serve as a resume that people can interact with to see examples of the work in question.

We will use [GitHub Pages](http://pages.github.com) to build and host your portfolio site.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/2MsN8gpT6jY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Steps

1. Visit <https://pages.github.com/> and follow the steps there to create a "Hello World" site living at <https://yourgithubusername.github.io> .

2. Edit the HTML file to include the following information:
  * Your full name
  * Your Github username, with a link to your GitHub Repos page e.g. <https://github.com/BurlingtonCodeAcademy>
  * Your public social media accounts, with links, e.g. <https://twitter.com/btvcodeacademy>
  * Your LinkedIn account <https://www.linkedin.com/school/burlington-code-academy/>
  * Your current home city and state. **Don't** list your street address or zip code.
  * How to contact you. e.g. email, phone, Skype id.
    * Consider what information you want to be available when anyone Googles your name.

3. Deploy the changes and demo it to another student in the class.

## Goals

* Understand and use the following:
  * Whitespace using margin and padding
  * Typography improvements
  * Text spacing
  * Color and contrast
  * Using images

# Stories

<!--BOX-->

## Home Page

Build an index.html that includes at least the following.

* A profile image of you.
* A short description of who you are, for example:

> A passionate web developer looking to make a difference in Vermont.

* Links to the following sub-pages, which do not need to exist yet.
  * About Me
  * Projects or Portfolio
  * Hobbies and Interests
  * Work History
  * Contact Me Form

<!--/BOX-->

<!--BOX-->

## About Me Page

* Build a page that includes basic details about your history as a person such as:
  * What interestes you
  * Where you grew up
  * Why you got into programming

<!--/BOX-->

<!--BOX-->

## Projects Page

* Link to the completed or in progress project repositories for this bootcamp.
  * Use links to your github repositories and/or links to your deployed projects, possibly with cover screenshots.
  * We will later deploy your projects to Heroku or Github pages. Make sure to update the link to a live example of your work if possible.
* Add cover screenshots for each project.
  * Optionally add a separate page for each with a description of the objectives, your approach to solving the project, and anything else that you learned.
  * Optionally record a video showing your walkthrough of the project program or application in use.

<!--/BOX-->


<!--BOX-->

## Hobbies and Interests Page

* Hobbies
  * Do you play any instruments or play in a band?
  * Are you on an intramural sports team like soccor, ultimate frisbee or softball?
  * Are you passionate about an outdoor sport such as skiing, rock climbing, mountain biking, kayaking or something else?
  * Do you volunteer at a local animal shelter, food shelf, or school board?

<!--/BOX-->


<!--BOX-->

## Work History

* Create a web version of your resume with basic formatting, don't stress too much about the layout. Make sure to include the following.
  * Your career goal(s).
  * Prior employers going back ten years.
  * Personal skills and experience.
    * e.g. HTML / CSS / JavaScript / Web Development / Git / Command Line

* Link to a downloadable version of your resume such as a PDF.

```html
<a href="/assets/myResume.pdf" download>
  <img src="/images/my-resume-cover.jpg" alt="My Personal Resume Screenshot">
</a>
```

##### Download File Example

* [Use the download attribute when linking to a downloadable file](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/Creating_hyperlinks#Use_the_download_attribute_when_linking_to_a_download)

<!--/BOX-->


<!--BOX-->

## Navigation Bar

* Build a "Nav Bar" using a consistent UI on each page, with links to the various other pages of your portfolio.
* Style the navbar using Flexbox or another [CSS navbar technique](/lessons/responsive_layout/navigation) to that it can be seen on various screen sizes.

##### Example Navigation Elements

* Navigation https://www.w3schools.com/css/css_navbar.asp
* Drop Downs https://www.w3schools.com/css/css_dropdowns.asp
* Icon Navigation https://www.w3schools.com/howto/howto_css_icon_bar.asp
* Hamburger Menu Icon https://www.w3schools.com/howto/howto_css_menu_icon.asp
* Responsive Top Navigaiton https://www.w3schools.com/howto/howto_js_topnav_responsive.asp

<!--/BOX-->

<!--BOX-->

## Page Footer

* Add a consistent footer to your portfolio page which should include:
  * Contact Info
  * CopyWrite Info
  * Social Media Links
  * Basic links to other pages

##### Footer Examples

* Sticky Footer Example https://css-tricks.com/couple-takes-sticky-footer/
* Basic Sticky Example https://www.w3schools.com/howto/howto_css_fixed_footer.asp

<!--/BOX-->

<!--BOX-->

### Portfolio Sitemap.xml

* Create a [sitemap.txt file](https://en.wikipedia.org/wiki/Sitemaps) for Search Engines to use.
* **Automatic generation**: Use the [Node Sitemap Generatore](https://www.npmjs.com/package/sitemap-generator-cli) to build an XML file which contains all your pages files.
  * `npx sitemap-generator-cli yourusername.github.io`
* **Manual generation**: Use the  http://www.advancedhtml.co.uk/robots-sitemaps.htm#sitemaps for instructions
* OPTIONAL: submit your site to Google https://www.google.com/webmasters/tools/home?hl=en and (in a day or two) wait to see your sitemap reflected in the Google search results
  * (the easiest way to verify it is "Alternative Methods - HTML tag")

<!--/BOX-->
