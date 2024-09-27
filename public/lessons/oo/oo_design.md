# Object-Oriented Design

Topics:

* the Linguistic Metaphor
* the Law of Demeter
* Feature Envy and the Single Responsibility Principle
* CRC Diagrams

# The Linguistic Metaphor

One way to think about objects: 

Objects are *things* that can be *described* and can *do* things, or...

  * Objects are nouns
    * (things)
  * Methods are verbs
    * (actions, behaviors, or imperative messages ("Sit! Good dog."))
  * Attributes are adjectives
    * (a property that describes a particular thing)
  * Classes are categories
    * (a noun that describes a *type* of thing, not a thing itself)

# The Law of Demeter

the [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter) (aka the Principle of Least Knowledge) is not really a law, but a rule of thumb for designing object-oriented programs. 

> "Only talk to your friends."

# The Law of Demeter Explained

Explanation [in plain English](http://wiki.c2.com/?LawOfDemeter):

* Your method can call other methods in its class directly (via `this`)
* Your method can call methods on its own fields directly, but not on the fields' fields
* When your method takes parameters, your method can call methods on those parameters directly.
* When your method creates local objects, that method can call methods on the local objects.

but most everything else is disallowed, especially

* sharing state using globals
* "walking down" a nested object hierarchy
  * though "method chaining" is fine, as long as the object returned is the original object, or a known friend of the caller

# a LoD example

If you see code like this:

```js
let maxAge = course.students.reduce(
    (maxAge, student) => Math.max(maxAge, student.age)
  , 0);
if (maxAge < 18) {
```

then redesign your program so you can do this instead:

`if (course.hasOnlyMinorStudents()) {`

# LoD example continued

...which implies an object-oriented design like this:

```js
class Course {
  constructor() {
    this.students = [];
  }
  hasOnlyMinorStudents() {
    return this.maxStudentAge() < 18;
  }
  maxStudentAge() {
    return this.students.reduce((maxAge, student) => 
            Math.max(maxAge, student.age), 0);
  }
```

* the complexity of students and age
   * i.e. the fact that there is an array of students,
   * and each student has an "age" property that represents "years old",
   * and 18 is the age of majority in the USA
* is *hidden* (or *encapsulated*) behind the simpler "course" interface

# Dots In A Row

don't confuse *method chaining* (often good) with *feature envy* (usually bad)

## Method Chaining

With method chaining, you are usually calling the same object -- or at least the same *type* of object -- again and again, so the number of collaborators is limited:

```javascript
string.split(' ').map((s)=>s.toUpperCase()).join(' ')
```

## Feature Envy

With feature envy (a LoD violation), you are traversing a graph of collaborators until you find the one with the data or method you want: 

```javascript
course.students[0].phone.sendText('hi')
```

| style | dots | collaborators |
|---|---|---|
| method chaining | 4 | **2** (String, Array) |
| feature envy | 3 | **5** (Course, Array, Student, Phone, String)

# The Single Responsibility Principle

Each object should have limited, clearly defined responsibilities.

> Do one thing, and do it well.

This makes it easier to know *where* in the code to look when you want to add a feature or fix a bug.

It helps to *increase cohesion* and *reduce coupling*... If there are two objects with related (but separate) responsibilities, you can change the implementation of one without affecting the other. 

Objects can communicate through the same stable *interface* without regard for the *implementation*.

# Shallow Hierarchies

OO systems rely on pointers, so it's there's a risk of confusing designs, including:

  * deep hierarchies
  * parallel hierarchies
  * cycles

It's best if dependencies are *one-way* and hierarchies are *shallow*.

# CRC Diagrams

CRC = Classes, Reponsibilities, Collaborators

![example CRC for Chat House](/images/crc-chat.jpg)

For each class (object type) in your system, make a box (or an index card). In this box, write the **Class name**, a list of its **Responsibilities**, and draw arrows to its **Collaborators**.

This is a useful technique that has fallen out of favor because lots of people overused it.

Don't overspecify, and don't fall in love with your design; as soon as you start to write code, your design will change. A diagram is a model of your system -- not the system itself! -- and remember:

> "All models are wrong, but some are useful" - George E. P. Box (1919 – 2013)

