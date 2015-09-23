# What is an Inception?

* an exploratory workshop…
* where the whole team…
* defines the goals and themes for a project…
* and produces an initial backlog…
* to kickstart an iterative process

# On Planning

> “Plans are useless, but planning is essential”

.

> “No plan survives contact with the enemy”

# Inception Goals

* define the project’s goals, anti-goals, risks
* write elevator pitch and/or mission statement
* define user Personas, Roles and Activities
* produce an initial story backlog
* produce a rough project timeline
* establish initial recurring schedule for team meetings
* sketch technical architecture (but avoid Big Design Up Front)
* introduce the team to each other

# Optional Inception Goals

* build paper prototype
* write team charter
* determine need for more discovery

# Inception Anti-Goals

* working software
* set anything in stone
  * it's an iterative process; everything may change
* set rigid requirements and deadlines
  * we will know more later
* others?

# Inception Schedule

* can be one day, two days, or a full week
* needs a facilitator
* invite as much of the whole team as possible

# Sample Inception Schedule

![sample schedule](http://payload.cargocollective.com/1/3/120632/1725392/dev_inception_1day_860.jpg)

from [Pivotal Labs](http://cargocollective.com/pivotallabs/No-7-Dev-Inception)

# Project Goals

*  keep all goals SMART (specific, measurable, achievable, relevant & time-bound)

*  business goals
*  product goals
*  engagement goals

# Team goals

* workday experience and pacing
* exploring technology vs. exercising skills
* using new or old processes (e.g. remote pairing)

# Project Non-Goals

* aka "The Not List"
*  things we explicitly do not want to accomplish in the project
*  useful when there’s a priority decision to be made
  *  e.g. if a non-goal is “support mobile” then we can ignore Mobile Safari bugs

# Project Risks

*	Business risks
  * Does the market want this?  
  * Will an emerging technology disrupt this product? 
  * Can the client support success?
*	Technical risks
  * Are there 3rd party integrations?  
  * Are there unknown technologies/libraries to learn?
  * Does the product rely on platforms that are changing, e.g. Android or Apple Watch?
*	Schedule risks
  * Must we satisfy other parties, e.g. developers on another team?  
  * Is there a near term, immovable milestone like a festival launch?
*	Budget risks
  * Will we run out of money before beta? Before launch? Before handoff?

Based off <http://pivotallabs.com/agile-inception_knowing-what-to-build-and-where-to-start/>

# Team Risks

How do we want to work?

* Part-time (vs. dedicated) team?
* Remote (vs. co-located) team?
* Customer unavailable?
* Deployment environment hassles
* Customer :: Project Manager :: Developer :: Designer :: QA Tester :: Support ratios

# Elevator Pitch

*  mad-libs game

![elevator pitch](elevator-pitch.png)

(from <https://agilewarrior.wordpress.com/2010/11/06/the-agile-inception-deck/>)

# Mission Statement Game

* everyone writes one
* highlight important words
* sit on it
* collaborate to write and reach consensus on a final statement
  * hopefully without a lot of “and” clauses

# Personas

*  traditionally: personas map to types of users
*  can also include developers, clients, admins, customer support reps, QA testers, apps, spammers…
*  one persona per card/sheet

# Persona Activities

*  for each persona, ask what they can do (and can’t)
*  one activity per card
*  diagram relationships among personae and activities

# Story Mapping

*  very time-consuming
*  take plenty of breaks! facilitator, don’t rush!
*  goal is to get broad and deep, clustering rather than prioritizing
*  looking for themes, not details
*  but still, try to break down stories into smaller stories

# Epics

*  An Epic is a series of Stories
*  For instance the epic “User Accounts” could include “Sign up, Sign in, Change password, Edit profile, Upload avatar”
  *  (not necessarily in that order, of course)
*  Put epics across the top row, stories in columns underneath their epic

# Advice for Facilitators

  (for Story Mapping but really for any planning or retro game)

*  Stay impartial
*  Try to ask questions, not make statements
*  After asking a question, count to ten! someone else will fill the silence
*  Ask clarifying questions, even if you know the answer
*  If the conversation veers, steer it back to the original topic (or ask for consensus to change topics)
  * Use a Parking Lot list for items to deal with immediately after the meeting
  * (I prefer the title IOU)
*  If the conversation ebbs, ask if anyone sees a pattern… or has a suggestion… or if it’s time for a break

# Story Mapping Order

1. Write Story Titles
2. Organize Stories into Epics
3. Prioritize Stories under Epics
4. Write Stories
5. Estimate Stories
6. Prioritize Stories into a Backlog (across Epics)

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

* prioritize by business value (higher value first)
* prioritize by risk (higher risk first)
* prioritize by effort (easy wins first)
* prioritize by simplicity (technical merit first, e.g. code quality or UI consistency or system stability)
* prioritize by cost (but weigh dev hours against cash expenses)

# Iteration Zero

* sometimes inceptions reveal that a project is not yet ready to build
* the first iteration can be used for continuing the discovery phase of a project
* the team can use the first iteration (sprint) for...
  * building a prototype
  * "spiking" proof of concept on architectural or usability unknowns
  * setting up technical infrastructure (build, deployment, environments)
* these experiments should be bounded and scoped just like "real" features

# Recurring Meetings

Inceptions are a great place to establish the regular rhythm of the project, as punctuated by recurring meetings.

*  Daily Standup
*  Weekly Iteration Planning (IPM)
*  Acceptance (can be weekly, semi-weekly, ad hoc, or any combination)
*  Retrospectives (weekly, bi-weekly, or monthly)
*  Demos (often coincide with Acceptance, but not always)
*  User Testing sessions
* Others?

# Acceptance Meetings

* customer is presented with stories that have become "done" since the last acceptance meeting
* problem stories can be Rejections, or become new Bugs or Features, or be deprioritized
* be careful not to hastily prioritize or estimate new or split stories (including bugs) —
  * put them in the Icebox or Inbox for later examination and get back to accepting the rest of the Done stories
* Acceptance doesn’t need to include the whole team, but if the right people aren’t in the room, invite them or wait until the next meeting
  * face-to-face is always better than high-latency channels like email or Tracker

# Acceptance Meetings: Coders Welcome

* shy or impatient coders may want to skip Acceptance meetings since they feel like project management, but it's very important to have coders in the room for...
     * explaining technical details
     * demoing
     * watching the customer attempt to use their features
     * understanding why a story was rejected
     * understanding steps to reproduce bugs
     * splitting stories along appropriate lines
     * estimating new stories
     * maintaining continuity, esp. with coders who aren't there right now

# Planning Meetings

* shy or impatient coders may want to skip Planning meetings
* good PMs will groom the backlog before a planning meeting
* but coders are still needed during the meeting proper, for...
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

# References

* http://blog.pivotal.io/pivotal-labs/labs/agile-inception_knowing-what-to-build-and-where-to-start
* http://agilecoffee.com/using-an-inception-to-kick-off-a-project/
* http://cargocollective.com/pivotallabs/No-7-Dev-Inception
* https://agilewarrior.wordpress.com/2010/11/06/the-agile-inception-deck/
