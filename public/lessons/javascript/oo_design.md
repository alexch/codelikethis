# Object-Oriented Design

Topics:

* the Linguistic Metaphor (for now, see [these slides]())
* the Law of Demeter

# The Law of Demeter

the [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter) (aka the Principle of Least Knowledge) is not really a law, but a rule of thumb for designing object-oriented programs. 

> "Only talk to your friends."

Explanation [in plain English](http://wiki.c2.com/?LawOfDemeter):

* Your method can call other methods in its class directly (via `this`)
* Your method can call methods on its own fields directly, but not on the fields' fields
* When your method takes parameters, your method can call methods on those parameters directly.
* When your method creates local objects, that method can call methods on the local objects.

but most everything else is disallowed, especially

* sharing state using globals
* "walking down" a nested object hierarchy
  * though "method chaining" can be fine, as long as the object returned is the original object, or a known friend of the caller


# a LoD example

Instead of this:

`if (course.students.reduce((maxAge, student) => Math.max(maxAge, student.age), 0) <= 18) {`

design your program to do this instead:

`if (course.hasOnlyMinorStudents()) {`

which implies a design like this:

```
class Course {
  constructor() {
    this.students = [];
  }
  hasOnlyMinorStudents() {
    return this.maxStudentAge() <= 18;
  }
  maxStudentAge() {
    return this.students.reduce((maxAge, student) => 
            Math.max(maxAge, student.age), 0);
  }
```

* the complexity of students and age
   * (e.g. the fact that there is an array of students, and each student has an "age" property that represents "years old") 
* is *hidden* (or *encapsulated*) behind the simpler "course" interface

