# Planning in XP

![planning loops](planning_loops.svg)

(from <https://en.wikipedia.org/wiki/Extreme_programming>)

# Project Phases

* Scoping => SOW

* Discovery
  * Research
  * Prototyping 

* Inception
  * Story Mapping => Backlog
  * Bridge between discovery and development 

* Development
  * Release Planning
  * Short iterations
  * Regular process adjustment through Retrospectives

* Production
  * Bugs start rolling in

* Maintenance
  * If/when feature development slows down

This is not waterfall! These phases often overlap and recur.


# Recurring Meetings

* Standup (daily)
* Planning Meeting (at least once per iteration, up to several a week)
* Acceptance (can be weekly, semi-weekly, ad hoc, or any combination)
* Demo (often coincide with Acceptance, but not always)
* Retrospective (weekly, bi-weekly, or monthly)
* User Testing sessions
* Others?

# Stories

* A story:
  * provides business value (*)
  * is readable by a non-coder
  * is independent
  * is testable
  * is estimatable
  * is prioritizable
  * can be implemented within 1 iteration
  
* (*) chores and spikes do not directly provide business value, but improve knowledge or reduce debt or increase simplicty
  
# Story Types

* Usually one story per feature, bug, spike, or chore

# Story Independence

* Stories are *independent*
  * Pretend that dependencies between stories do not exist
* If a dependency does exist, you can say that Story B will cost more points if implemented before Story A
* No dependencies makes planning **much** easier, 
* and helps focus attention on business value, not technical problems

# Acceptance Criteria

* Each story should have a list of conditions by which we know when it's done
  * A story is called a story because it has a beginning, a middle, and an end
* If well-written, Acceptance Criteria can turn into Acceptance Tests

# Story Body Template

Story *titles* should be brief; story *bodies* should follow this pattern:

```
AS A ____
I WANT TO ____
SO THAT ___
```

# Backlog

A backlog is a list of stories

that have been **written**, 

**estimated**, 

and **prioritized** 

in **linear** order

# Planning Meeting

* A planning meeting is focused on the upcoming work
* In a planning meeting, you
  * introduce, estimate, and prioritize new stories
  * re-prioritize, split, or delete any stories
  * (re-estimate old stories only if new information has come to light -- and never re-estimate stories that are already in progress)
  * look over upcoming stories, check if any need more research or design
* Often combined with Acceptance
 
# Estimation and Prioritization

* Estimation is a technical task, prioritization is a customer task
  * (except with chores)
  * (and sometimes bugs)

> The customer gets to say **what**; the coders get to say **how long**

* Estimation and Prioritization go hand in hand
  * You shouldn’t prioritize until there’s an estimate, but you shouldn’t estimate until you know it’s near the top of the (unestimated) pile
  * Sometimes unexpectedly high or low estimates will change the priority

# Estimation

* Estimate the *relative effort* of stories
* Points are *arbitrary* but *consistent*
* Choose a point scale that works for your team
  * 1-2-3 and 1-2-3-5-8 are popular
* High estimates should make you consider *splitting* the story

# Easy as 1-2-3

In general...

* 1 point = 1 pair-day or less
* 2 points = a few pair-days
* 3 points = maybe a whole week; try to split into several stories
* 0 points = **actually** a few minutes, like changing button text

> A point is not a *promise* of *time*, but is an *estimate* of *effort*
 
Points can also be awarded for *complexity* or *risk* or *mystery*

# Prioritization

* Prioritize as "A-B-C" at first
  * high-med-low or must-have/nice-to-have/meh
* Write detailed stories for A's first, then B's, then C's
* Then try for *linear* prioritization
  * You all know exactly which story is next
  * And which stories may need more design or research

# How to Prioritize?

It’s up to the customer, BUT here are some guidelines:

* by business value (higher value first)
* by risk (higher risk first)
* by effort (easy wins first)
* by simplicity (technical merit first, e.g. code quality or UI consistency or system stability)
* by theme (a bunch of similar features together)
* by cost (but weigh dev hours against cash expenses or profit/loss/ROI)
* randomly!

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
* Great book: "Agile Retrospectives"  by Derby and Larsen
