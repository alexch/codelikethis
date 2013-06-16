# Loops

Computers are like robots. They are good at doing things over and over and over and over again.

A LOOP is when we ask a program to do something many times.

# times

The simplest loop in Ruby is called `times`, and it's a message you can send to a number.

Try this in IRB:

    3.times do
      puts "Hip! Hip! Hooray!"
    end

Let's unpack this:

* `3.times do` means what it sounds like: "do this three times"
* `end` means this is the end of what I want you to do
* and of course, `puts` means "show this on the terminal"

**Note well!** The lines between `do` and `end` are INDENTED. Indentation is very important to you and other humans. It lets our eyes follow the patterns and helps us quickly see what parts of the program go with each other.

# while true

If you want something to keep going forever, use a special loop called `while true`. 

    while true
      puts "Hello"
    end

To stop it, hold down the CONTROL key and press the C key.

# LAB: Infinite Hello

Let's change `hello.rb` so that it keeps saying hello over and over again.

    while true
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

We will now change your `food.rb` program so that if the user types "return" -- meaning the string is empty -- then the program exits.

Please try this yourself! But it's kind of tricky, so on the next slide I'll show you a solution (or two).

# Exiting a Loop: The Cheap Way

    while true
      puts "What is your name?"
      name = gets.strip
      if name == ""
        exit
      end
      puts "Hello, " + name + "!"
    end

The magic word `exit` means "stop the entire program". It's kind of rude, and more than a little bit dangerous.

# Exiting a Loop: The Better Way

    while true
      puts "What is your name?"
      name = gets.strip
      if name == ""
        break
      end
      puts "Hello, " + name + "!"
    end

The magic word `break` means "stop the current loop". It's less dangerous -- but still kind of weird, since it's not always clear which loop you mean.

# Exiting a Loop: The Right Way

    reading = true
    while reading
      puts "What is your name?"
      name = gets.strip
      if name == ""
        reading = false
      else
        puts "Hello, " + name + "!"
      end
    end

Here we introduce a LOOP VARIABLE to tell whether we still want to keep reading or not.

The `while` statement keeps checking this variable every time through the loop; if it is `true` then it loops, but if it's `false` then it stops looping and goes on to the rest of the program.

# LAB: Good Food, Bad Food

* Change `food.rb` so that it doesn't love every food.
* If it's a food you like (let's say, pizza), make it print "Yum! I love pizza."
* If it's a food you like (let's say, cabbage), make it print "Yuck! I hate cabbage."

