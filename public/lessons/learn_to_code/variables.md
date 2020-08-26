# Variables

A VARIABLE is a NAME for an object. You give an object a name using the ASSIGNMENT operator (it looks like an equal sign).

    color = "blue"
    fruit = "berry"

Anywhere you can use an object, you can use a variable instead.

    color + fruit
    fruit.upcase

# The Warehouse Metaphor

Think of memory as a giant warehouse.

![Warehouse from Raiders of the Lost Ark](/images/warehouse.jpg)

Like this warehouse from the movie Raiders of the Lost Ark, 
computer memory is vast and filled with boxes of various sizes.

# The Warehouse Metaphor Explained

If memory is a giant warehouse...

...and *objects* are **boxes** in that warehouse

...then a *value* is the **contents** of a box

...and a *variable* is a **label** you stick on the outside of the box

# Variables are documentation

Which is clearer, this:

    60 * 60 * 24

or this:

    seconds_per_minute = 60
    minutes_per_hour = 60
    hours_per_day = 24
    seconds_per_day = seconds_per_minute * minutes_per_hour * hours_per_day

?

# Lab: Play In IRB

Let's spend a few minutes just playing around in IRB. Some things to try:

* write a poem
* YELL THE POEM
* calculate 2 + 2 and more complicated things
* assign your best friend to a variable
* reverse your best friend's name
* get a new best friend and reverse their name too

# The Pointer Metaphor

    snack = "Apple"

![snack-apple](/images/snack-apple.svg)

Think of a variable as **pointing** to an object.

# Changing Variables

You can assign and reassign variables at will.

    color = "blue"
    fruit = "berry"
    color + fruit
    
    color = "black"
    color + fruit
    
Changing a variable (using ASSIGNMENT) just changes the name of an object. It does *not* change the data inside the object.

This is analogous to a label being removed from one box and placed on a different box.

# Many pointers can point to the same thing

    fruit = "Apple"
    snack = fruit

![snack-fruit](/images/snack-fruit.svg)

After this both `snack` and `fruit`...

  * are *pointing* to the same *object*
  * have the same *value*

This is analogous to two labels being placed on the same box.

# Return values are new

most messages return *new* values

    fruit = "banana"
    snack = fruit.upcase

![fruit-banana-snack-banana](/images/fruit-banana-snack-banana.svg)

`"banana"` and `"BANANA"` are two *different objects* in memory

# Changing Values

Most messages do not change the data inside the object.

    color.upcase
    color

But some messages do change the data!
    
    color.upcase!
    color

This can be dangerous so sometimes those messages end with a BANG (exclamation point).

# Variables summary

* variables are names for objects
* you can change which object a variable points to
* you can have many names for the same object
* sometimes values can change inside an object but the names (variables) stay the same

