# Planning in XP

![planning loops](/images/planning_loops.svg)

(from <https://en.wikipedia.org/wiki/Extreme_programming>)

# Project Phases

* Scoping => SOW (Statement/Scope of Work)

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
  
# Stories vs Features

Usually a given *feature* has one or more *stories*.

There are other types of stories and tasks...

* bug
* spike
* chore
* research

# Story Lifecycle

![tracker story lifecycle](/images/tracker-workflow.png)

(this diagram is from Pivotal Tracker but the workflow applies to most Agile processes and tools)

# Story Independence

* Stories are *independent*
  * Pretend that dependencies between stories do not exist
* If a dependency does exist, you can say that Story B will cost more points if implemented before Story A
* No dependencies makes planning **much** easier, 
* and helps focus attention on business value, not technical problems

# Story Body Template

Story *titles* should be brief;
story *bodies* should follow this pattern:

```
AS A ____      [role]
I WANT TO ____ [action]
SO THAT ____   [motivation]
```

*Notes:*
 * If you write "As a user" you're probably doing it wrong -- use a more specific role name instead
 * "I want to" should be an action, not just a desire

# Acceptance Criteria

* Each story should have a list of conditions by which we know when it's done
  * A story is called a story because it has a beginning, a middle, and an end
* If well-written, Acceptance Criteria can turn into Acceptance Tests

# Acceptance Criteria Template

```
GIVEN ____ [precondition]
WHEN ____  [action]
THEN ____  [postcondition/assertion]
```

# Sample Story

**Title**: Sign Out

**Body**: As a logged-in user at home, I want to sign out of the application, so that my other family members can't use my account

**Acceptance Criteria**:

```
Given I am signed in as a normal (non-admin) user
When I look at the nav bar
Then I see the "Sign Out" button

Given I am signed in as a normal user
When I click on the "Sign Out" button
Then I am returned to the home page

Given I am signed in as a normal user
When I click on the "Sign Out" button
Then I cannot view the "Edit Profile" page

Given I am not signed in
When I look at the nav bar
Then I do not see the "Sign Out" button
```

# Backlog

A backlog is a list of stories

that have been 

☑ **written**, 

☑ **estimated**, 

☑ and **prioritized** 

☑ in **linear** order

# Backlog checklist

When writing stories, it is very tempting to skip one of these steps

e.g. : 

* estimating a story based on its title alone
* prioritizing into rough clusters but not into a precise linear list
* a customer setting an estimate or a coder setting a priority

so *please* try to treat the previous slide as a checklist, and push back if someone wants to skip a step, or do it out of order, or impatiently do several steps at once

# Planning Meeting

* A planning meeting is focused on the upcoming work
* In a planning meeting, you
  * introduce, estimate, and prioritize new stories
  * re-prioritize, split, or delete any stories
  * (re-estimate old stories only if new information has come to light -- and never re-estimate stories that are already in progress)
  * look over upcoming stories, check if any need more research or design
* Often combined with Acceptance (but not always)
* Often called "Backlog Grooming"
 
# Estimation and Prioritization

* Estimation is a technical task, prioritization is a customer task
  * (except with chores)
  * (and sometimes bugs)

> The customer gets to say **how soon**; the coders get to say **how hard**

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
* by external deadline (e.g. a conference, or a marketing season)
* randomly! (any decision is better than indecision)

# Acceptance Meetings

* customer is presented with stories that have become "done" since the last acceptance meeting
* problem stories can be *Rejections*, or become new *Bugs* or *Features*, or be deprioritized
* be careful not to hastily prioritize or estimate new or split stories (including bugs) —
  * put them in the Icebox or Inbox for later examination and get back to accepting the rest of the Done stories
* Acceptance doesn’t need to include the whole team, but if the right people aren’t in the room, invite them or wait until the next meeting
  * face-to-face is always better than high-latency channels like email or Tracker

Flowchart:

```
        ____________fix________       
       v                       \   /-> new feature
in-progress -> done -> accept/reject? 
                          |        \-> new bug
                          v
                          Done
```

# Acceptance Meetings: Coders Welcome!

* shy or impatient coders may want to skip Acceptance meetings since they feel like project management, but it's very important to have coders in the room for...
     * explaining technical details
     * demoing features
     * watching the customer attempt to use their features
     * understanding why a story was rejected
     * understanding steps to reproduce bugs
     * maintaining continuity, esp. with coders who aren't there right now

# Planning Meetings: Coders Welcome!

* shy or impatient coders may want to skip Planning meetings
* PMs will try to groom the backlog before a planning meeting
* but coders are still needed **during** the meeting, for...
  * understanding user/customer requirements
  * explaining technical details to the customer and to each other
  * thinking through technical steps and complications with a story's implementation
  * splitting stories along technically appropriate lines
  * estimating new stories
  * maintaining continuity, esp. with coders who aren't there right now
  * thinking of related chores and external blockers

# The Veil of Ignorance

> The goal is for **any** coder to be able to work on **any** story (with help, if needed, from the right pair partner).

# Retrospectives

* the more frequent they are, the shorter they can be

* Standard Burlington Code Academy Retro format: 

  1. 5 minutes: intro and "take temperature"
  2. 10 minutes to brainstorm Happy/Sad/Confused (aka Good/Bad/Weird) topics
  3. 10 minutes to examine, cluster & vote on clustered topics
  4. 10 minutes each to discuss top two topics
  5. 5 minutes for wrapup and "appreciations"

* Good/bad/weird is a common game, but doesn’t need to be the only one
  * [Agile Retrospectives](https://smile.amazon.com/Agile-Retrospectives-Making-Teams-Great/dp/0977616649) by Derby and Larsen for a good structure and lots of games

# Agile Planning Tools

* Pivotal Tracker
* Trello
* sprint.ly
* Jira (if configured well!)
* etc.

# Project Planning with Pivotal Tracker

* BACKLOG is ORDERED by the customer
  * order by value, or risk, or learning
* a feature story delivers VALUE to the customer
* feature stories are ESTIMATED and TESTED by the developers
* features are ACCEPTED by the customer

# Project Planning with Pivotal Tracker (2)

* tasks live inside a story and do not deliver value on their own
* stories can be SPLIT at any time as needed
* chores and bugs are POINTLESS (unestimated) and do not deliver value
    * they pay off debt or increase knowledge
* dependencies between stories are IGNORED
  * but can be captured as LINKS to other stories

# Project Planning with Pivotal Tracker (3)

* velocity is MEASURED by counting only the stories accepted in an iteration
* iterations are BOUNDED by date and velocity
  * not by scope or deadlines
* velocity is an APPROXIMATION (prediction) of work per iteration
* releases are GOALS not deadlines
    * they can have a target date, but they might move past it and go red

# Project Planning with Pivotal Tracker (4)

* ICEBOX is fluid and chaotic - unordered, unestimated, for possibilities or “cold storage”
* an EPIC comprises MANY STORIES
    * feature sets or themes, not releases
* labels are free text TAGS
    * can be used to layer other workflows on top
