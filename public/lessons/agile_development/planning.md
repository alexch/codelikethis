# Project Phases

* Scoping => SOW

* Discovery
  * Research
  * Prototyping 

* Inception
  * Story Mapping => Backlog

* Release Planning
* Development
* Maintenance

# Recurring Meetings

*  Daily Standup
*  Weekly Iteration Planning (IPM)
*  Acceptance (can be weekly, semi-weekly, ad hoc, or any combination)
*  Retrospectives (weekly, bi-weekly, or monthly)
*  Demos (often coincide with Acceptance, but not always)
*  User Testing sessions
* Others?

# Stories

* A story:
  * provides business value
  * is discrete
  * is testable
  * is estimatable
  * is prioritizable
  * can be implemented within 1 iteration
* Usually one story per feature, bug, or chore

# Story Body Template

```
AS A ____
I WANT TO ____
SO THAT ___
```


# Estimation and Prioritization

* Estimation and Prioritization go hand in hand
  * You shouldn’t prioritize until there’s an estimate, but you shouldn’t estimate until you know it’s near the top of the (unestimated) pile
  * Sometimes unexpectedly high or low estimates will change the priority
* Estimation is a technical task, prioritization is a customer task
  * (except with chores)
  * (and sometimes bugs)
* Prioritize as "A-B-C" at first
  * high-med-low or must-have/nice-to-have/meh
* Write detailed stories for A's first, then B's, then C's

# How to Prioritize?

It’s up to the customer, BUT here are some guidelines:

* by business value (higher value first)
* by risk (higher risk first)
* by effort (easy wins first)
* by simplicity (technical merit first, e.g. code quality or UI consistency or system stability)
* by cost (but weigh dev hours against cash expenses or profit/loss/ROI)
* randomly!

# How to Estimate?

Each team needs to choose its "story point" scale, but in general...

* 1 point = 1 pair-day or less
* 2 points = a few pair-days
* 3 points = a lot; try to split into several stories
* 0 points = **actually** a few minutes, like changing button text

# Acceptance Meetings

* customer is presented with stories that have become "done" since the last acceptance meeting
* problem stories can be Rejections, or become new Bugs or Features, or be deprioritized
* be careful not to hastily prioritize or estimate new or split stories (including bugs) —
  * put them in the Icebox or Inbox for later examination and get back to accepting the rest of the Done stories
* Acceptance doesn’t need to include the whole team, but if the right people aren’t in the room, invite them or wait until the next meeting
  * face-to-face is always better than high-latency channels like email or Tracker

# Acceptance Meetings: Coders Welcome!

* shy or impatient coders may want to skip Acceptance meetings since they feel like project management, but it's very important to have coders in the room for...
     * explaining technical details
     * demoing features
     * watching the customer attempt to use their features
     * understanding why a story was rejected
     * understanding steps to reproduce bugs
     * splitting stories along appropriate lines
     * estimating new stories
     * maintaining continuity, esp. with coders who aren't there right now

# Planning Meetings: Coders Welcome!

* shy or impatient coders may want to skip Planning meetings
* PMs will try to groom the backlog before a planning meeting
* but coders are still needed during the meeting, for...
  * understanding user/customer requirements
  * explaining technical details
  * splitting stories along appropriate lines
  * estimating new stories
  * maintaining continuity, esp. with coders who aren't there right now
  * thinking of chores

# Retrospectives

* the more frequent they are, the shorter they can be
* good/bad/weird is a common game, but doesn’t need to be the only one
* see Agile Retros book for a good structure and lots of games
* or just use the Happy/Sad/Confused Game
