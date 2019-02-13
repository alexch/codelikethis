# Pomodoro

The [Pomodoro Technique](https://en.wikipedia.org/wiki/Pomodoro_Technique) is a [useful way](https://lifehacker.com/productivity-101-a-primer-to-the-pomodoro-technique-1598992730) to [focus on a problem](https://francescocirillo.com/pages/pomodoro-technique) for [a little while... but not too long](https://en.wikipedia.org/wiki/Timeboxing) that encourages regular breaks and can [change your perception of time itself](https://hackernoon.com/change-how-you-perceive-time-618282a1a9ec). 

Build a single-page app that counts down from 25 minutes and makes an audible and/or visual alert when the time elapses.

Template repo with Cypress acceptance tests here: <https://github.com/BurlingtonCodeAcademy/pomodoro> . They use the [Cypress Mock Clock](https://docs.cypress.io/guides/guides/stubs-spies-and-clocks.html#Clock) to control time during test runs.

## Wireframes

```
           🍅
         25:00   
[Start] [Pause] [Reset]
```

After implementing the basic features, feel free to implement your own ideas of layout and style using CSS.

## Considerations

* the buttons should be *enabled* and *disabled* based on the system's state; e.g. if the timer is not running, the Pause button should be disabled
* JavaScript timing events are not guaranteed to be precise. That means that even if you ask for a callback once a second, you might actually get a callback after 1.1 seconds... or even later if your app is running in the background, or if there are [other sources of lag](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setTimeout#Late_timeouts). That means that you cannot simply decrement a "seconds" variable once per callback if you want accurate wall-clock time synchronization.
* seconds should be 0-padded e.g. `1:03` not `1:3`

## Tech

* JavaScript [timing events](https://www.w3schools.com/js/js_timing.asp) like [setInterval](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setInterval) and [setTimeout](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setTimeout)
* HTML5 [Audio](https://developer.mozilla.org/en-US/docs/Web/API/HTMLAudioElement)
* [Date.now()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/now) function
* Cypress Mock Clock:  
  * Guide: https://docs.cypress.io/guides/guides/stubs-spies-and-clocks.html#Clock
  * API doc: https://docs.cypress.io/api/commands/clock.html
  
## Backlog

> Please implement these user stories in order. There are Cypress acceptance tests for most of them in the repo. Feel free to add your own unit tests and/or acceptance tests too!

<!--BOX-->

### Countdown

**Given** a set duration of 25 minutes

**When** the user clicks the Start button

**Then** the timer should begin counting down once per second, following the sequence: `24:59`, `24:58`, `24:57`, ... `24:00`, `23:59`, ... and so on

**And** the Start button should be *disabled*

<!--/BOX-->
<!--BOX-->

### Zero!

**Given** that the timer is counting down 

**When** it reaches `0:00`

**Then** the timer should stop counting down

**And** the Start button should be *disabled*

**And** the Pause button should be *disabled*

<!--/BOX-->
<!--BOX-->

### Reset

**When** the user clicks Reset

**Then** the timer should reset to 25 min 00 sec

**And** the countdown should stop (if was in progress)

**And** the Start button should be **enabled**

<!--/BOX-->
<!--BOX-->

### Ding!

**Given** that the timer is counting down 

**When** it reaches `0:00`

**Then** it should [play a sound](https://stackoverflow.com/a/18628124/190135)

<!--/BOX-->
<!--BOX-->

### Pause

**Given** that the timer is counting down 

**When** the user clicks the Pause button

**Then** the countdown should stop

**And** the Pause button should be *disabled*

**And** the Start button should be **enabled**

<!--/BOX-->
<!--BOX-->

### Flash!

**Given** that the timer is counting down 

**When** it reaches `0:00`

**Then** it should visibly flash the screen (be creative)

**And** the timer should stop counting down

**When** the user clicks Reset

**Then** the flashing should stop

<!--/BOX-->

## Icebox

> optional features; implement these -- or think of your own! -- when you're done with the backlog.

* change duration to 2 different set values (10 min and 2 min)
* change duration to arbitrary value (user input)
* display the remaining time in the title of the tab (or browser window) so users can check it at a glance
* look at <https://tomato-timer.com/> for inspiration
* use [Notifications](https://developer.mozilla.org/en-US/docs/Web/API/Notifications_API)
* keyboard shortcuts


