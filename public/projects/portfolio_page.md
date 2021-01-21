# Portfolio Page

## Background

A "Personal Portfolio" is a web site that showcases your personal work. It can serve as a resume that people can interact with to see examples of the work in question.

We will be building it in React, and hosting it on Heroku!

## Info


**Your Portfolio should have:**

  * Your full name
  * Your Github username, with a link to your GitHub Repos page e.g. <https://github.com/BurlingtonCodeAcademy>
  * Your public social media accounts, with links, e.g. <https://twitter.com/btvcodeacademy>
  * Your LinkedIn account <https://www.linkedin.com/school/burlington-code-academy/>
  * Your current home city and state. **Don't** list your street address or zip code.
  * How to contact you. e.g. email, phone, Skype id.
    * Consider what information you want to be available when anyone Googles your name.


**It should also:**

Be available for the world to see!!!

The proper scripts for deployment have been provided on the root level of your repo.

`"heroku-postbuild": "cd client && npm install --only=dev && npm install && npm run build"` 

Whenever you `push` your repository to heroku with `git push heroku master`, this script will update and compile your code for you. Nice!
You will still need to set up your server so your React application will know how to serve your files properly, though.


How, you ask?
<details>
<summary>Hint 1</summary>

When designing a single page application with `React Router`, issues usually revolve around the conflict in routing approaches between `React Router` and your server (`express`). This needs to be addressed! 

Solution:
Create a "catch-all" route in your `express` server that *always* serves your `index.html` file.  


</details>

<details>
<summary>Hint 2</summary>

Don't forget to statically serve your `/build` folder in your `express` server as well!

[more about it here](https://create-react-app.dev/docs/deployment/)

</details>


## Goals

* Understand and use the following:
  * Whitespace using margin and padding
  * Typography improvements
  * Text spacing
  * Color and contrast
  * Using images

# Stories

While the specific style choices and functionality are ultimately up to you, the following stories are required. 

<!--BOX-->

## Home Page
Should have:
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

* Build a page (or component) that includes basic details about your history as a person such as:
  * What interestes you
  * Where you grew up
  * Why you got into programming

<!--/BOX-->

<!--BOX-->

## Projects Page

* A list of all the repos on your personal github account
  * You can generate this using the [GitHub Rest API](https://developer.github.com/v3/repos/)
* Link to the completed or in progress project repositories for this bootcamp.
  * Use links to your github repositories and/or links to your deployed projects, possibly with cover screenshots.
  * Make sure the links are up to date! 
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
This should exist, and better yet *persist* across all other pages of your site.  

* Build a "Nav Bar" using a consistent UI on each page, with links to the various other pages of your portfolio.
* Style the navbar using Flexbox or another [CSS navbar technique](/lessons/responsive_layout/navigation) so that it can be seen on various screen sizes.


##### Example Navigation Elements

* Navigation https://www.w3schools.com/css/css_navbar.asp
* Drop Downs https://www.w3schools.com/css/css_dropdowns.asp
* Icon Navigation https://www.w3schools.com/howto/howto_css_icon_bar.asp
* Hamburger Menu Icon https://www.w3schools.com/howto/howto_css_menu_icon.asp
* Responsive Top Navigaiton https://www.w3schools.com/howto/howto_js_topnav_responsive.asp

<!--/BOX-->

<!--BOX-->

## Page Footer

* Add a consistent, and better yet *persistent*, footer to your portfolio page which should include:
  * Contact Info
  * CopyWrite Info
  * Social Media Links
  * Basic links to other pages

##### Footer Examples

* Sticky Footer Example https://css-tricks.com/couple-takes-sticky-footer/
* Basic Sticky Example https://www.w3schools.com/howto/howto_css_fixed_footer.asp

<!--/BOX-->

# Icebox

* make the page fully mobile responsive
* animate elements of your page
* create a sitemap for your site
* host your site live on the internet