# Object-Oriented Design

There are quite a few object oriented programming languages out there, and while they don't have the same syntax they all share a common set of design principles which they must adhere to.

JavaScript is not one of these languages, but it does borrow a few things from them so we can use some principles of object oriented design to help make our code more organized, more efficient, and easier to maintain.

Since JS is not a purely object oriented these principles are less like rules and more like guidelines.

While design principles are useful tools don't let them get in they way of making your program work.


# Principles of OO Design

Object oriented languages are built on several core principles which we can apply to our JavaScript code

- encapsulation of data and behavior
- pointers
- privacy of data

# Encapsulation

"Encapsulation of data and behavior" is really just a fancy way of saying "object"

BUT there are some guidelines we want to keep in mind when creating objects if we're trying to follow OO design principles

# The Single Responsibility Principle

Each object should have limited, clearly defined responsibilities.

> Do one thing, and do it well.

This makes it easier to know *where* in the code to look when you want to add a feature or fix a bug.

It helps to *increase cohesion* and *reduce coupling*... If there are two objects with related (but separate) responsibilities, you can change the implementation of one without affecting the other. 

Objects can communicate through the same stable *interface* without regard for the *implementation*.

# Shallow Hierarchies

OO systems rely on pointers, so there's a risk of confusing designs, including:

  * deep hierarchies
  * parallel hierarchies
  * cycles

It's best if dependencies are *one-way* and hierarchies are *shallow*.

This means you should try to limit *nesting* and *inheritance* as much as possible, and your objects shouldn't rely on any outside data. They can send and receive messages but shouldn't care where the messages are coming from, or going to.

# Classes, Hierarchy, and Inheritance

Classes are a key component of OO Design in JavaScript. They allow you to create many objects with shared behavior, but different data. You can even generate child classes with the `extends` keyword to create children with additional, separate behaviors.

When setting up child classes keep in mind that a child should be able to do anything its parent can do, and then some.

Beware of generating too many children from a single class, or too many generations of children. The computer will understand it just fine, but it will quickly become confusing for our squishy, meat brains.

# When in Doubt Draw It Out

If you're having trouble figuring out what data should go where draw a diagram outline what needs to be set up, and what operations need which data
