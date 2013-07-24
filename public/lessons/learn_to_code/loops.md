# Loops

Computers are like robots. They are good at doing things over and over and over and over again.

A LOOP is when we ask a program to do something many times.

# loop

If you want something to keep going forever, use a special loop called `loop`. 

    loop do
      puts "Hello"
    end

To stop it, hold down the CONTROL key and press the C key.

**Note well!** The lines between `do` and `end` are INDENTED. Indentation is very important to you and other humans. It lets our eyes follow the patterns and helps us quickly see what parts of the program go with each other.

# One Infinite Loop

![One Infinite Loop](one-infinite-loop.jpg)

*Fun Fact:* The address of Apple HQ is

    1 Infinite Loop
    Cupertino, CA 95014

*Image from the Wikimedia Commons, licensed under the Creative Commons Attribution-Share Alike 3.0 Unported license. Attribution: Joe Ravi*

# LAB: Infinite Hello

Let's change `hello.rb` so that it keeps saying hello over and over again.

    loop do
      puts "What is your name?"
      name = gets.strip
      puts "Hello, " + name + "!"
    end

# LAB: Infinite Food

Write a program called `food.rb` that

1. asks the user for a food -- say, "pizza"
2. prints "Yum, I love pizza!"
3. asks again, and prints again, forever and ever

# Exiting a Loop

Next, we will change your `food.rb` program so that if the user types "return" -- meaning the string is empty -- then the program exits.

Please try this yourself! But it's kind of tricky, so on the next slide I'll show you a solution (or two).

# Exiting a Loop: The Cheap Way

The magic word `exit` means "stop the entire program right now".

    loop do
      puts "What is your name?"
      name = gets.strip
      exit if name.empty?
      puts "Hello, " + name + "!"
    end

It's kind of rude, and more than a little bit dangerous.

# Exiting a Loop: The Better Way

The magic word `break` stops a loop immediately.

    loop do
      puts "What is your name?"
      name = gets.strip
      break if name.empty?
      puts "Hello, " + name + "!"
    end

The magic word `break` means "stop the current loop". It's less dangerous -- but still kind of weird, since it's not always clear which loop you mean.

# LAB: Exiting a Loop

Change your `food.rb` program so that if the user types "return" -- meaning the string is empty -- then the program exits.

# LAB: Good Food, Bad Food

* Change `food.rb` so that it doesn't love every food.
* If it's a food you like (let's say, pizza), make it print "Yum! I love pizza."
* If it's a food you like (let's say, cabbage), make it print "Yuck! I hate cabbage."

# times

Usually you don't want to loop forever.

Another loop in Ruby is called `times`, and it's a message you can send to a number.

Try this in IRB:

    3.times do
      puts "Hip! Hip! Hooray!"
    end

Let's unpack this:

* `3.times do` means what it sounds like: "do this three times"
* `end` means this is the end of what I want you to do
* and of course, `puts` means "show this on the terminal"

# Counting in a loop

Remember this poem?

    1 potato 
    2 potato
    3 potato
    4
    5 potato
    6 potato
    7 potato
    More

We're going to examine a few different ways to code this.

# `times` with a counter

Try this:

    4.times do |x|
      puts x.to_s + " potato"
    end

`|x|` means "inside the loop, `x` is the current value of the counter"

Whoops! What's wrong?

# `times` with a counter -- fixed

    4.times do |count|
      puts (count+1).to_s + " potato"
    end

# `loop` with a counter

    count = 1
    loop do
      puts count.to_s + " potato"
      count = count + 1
    end

Whoops! Hit Control-C and join me on the next slide...

# `loop` with a counter -- fixed

    count = 1
    loop do
      puts count.to_s + " potato"
      count = count + 1
      break if count > 4
    end

# `while`

The magic word `while` combines `loop` and `break`.

    count = 1
    while count <= 4
      puts count.to_s + " potato"
      count = count + 1
    end

The `while` statement keeps checking every time through the loop; if it is `true` then it loops, but if it's `false` then it stops looping and goes on to the rest of the program.

This is fairly complicated, so let's stop here and make sure to understand everything that's happening in this little program.

# `while` breakdown

    count = 1

creates a *variable* named `count` and sets its value to `1`. 
    
    while count <= 4

starts a loop and immediately compares `count` to `4`. 

`1` is less than `4`, so the expression is `true`, so we continue with the loop.

      puts count.to_s + " potato"

prints the current value of count (and the word "potato").

      count = count + 1

*increments* the `count` variable... it was `1`, so now it's `2`

    end

goes *back to the `while`* and checks again

Eventually, `count` becomes `5`, and the `while` expression is `false`, and so we stop looping and go on.

# LAB: One Potato

Write a program called `potato.rb` that prints the entire potato poem, accurately.

