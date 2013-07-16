# Arrays

* An ARRAY is a CONTAINER
  * an object that contains other objects

# What makes an array an array

* You can put any objects inside it
* In any order
* Duplicates are fine


# Creating an array

    ["apple", "banana", "cherry"]

# Array Indexes

* You can retrieve items in an array by their INDEX
* An index is a number from 0 to infinity
  * actually to the size of the array

IRB Exercise:

    fruits = ["apple", "banana", "cherry"]
    fruits[1]

Did you get the result you expected?

Why or why not?

# Zero

When counting, 

humans start at one, 

but **computers start at zero**.

So the first item in an array is number zero, not number one.

# Array Methods

    fruits.last
    fruits.first
    fruits.reverse
    fruits.shuffle

# Turning an array into a string

    fruits.to_s
    fruits.join
    fruits.join(" and ")

# Looping through an array

    fruits.each do |fruit|
      puts fruit
    end

* `each` is like `while` for arrays
* `fruits.each do` means "for each item inside this array, do this"
* `|fruit|` means "put the current item into a variable named `fruit`"
* `puts fruit` means "print out the value of this variable"
* `end` means "we're done with the loop now" :-)

