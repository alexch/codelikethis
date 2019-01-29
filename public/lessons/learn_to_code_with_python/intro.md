    video youtube_id: '-jRREn6ifEQ'
    topic name: "text-editor"
    link name: 'How to Design Programs (preface)',
         href: "https://htdp.org/2018-01-06/Book/part_preface.html"

<!-- todo: merge with other learn_to_code_with_X intros, using new IF TRACK directive -->

# Intro

You may have never programmed before. Now you will.

# What is code?

In general, code is something that stands for something else.

In computers, code is a series of instructions that tell a computer what to do.

# What is coding?

* coding (aka programming or software development) is a *creative, human* activity
* *coding* does not mean "cracking the code" or "deciphering" -- it's not a mystery or a secret, it's a language
* the words (and numerals and punctuation) we write are translated into long strings of ones and zeros

# What is coding NOT?

* coding is **not** mathematical
  * some logic (if / then / and / or / etc.)
  * mostly just counting ("do this 10 times")
* coding is **not** solitary
  * most coding happens in a team
  * all professional coding happens with clients / users / designers / managers etc.
  * pair programming is awesome
* coding is **not** about finding the right answer
  * there's always more than one way to do it
  * every solution has tradeoffs
  * there is always a better way, and never a perfect way
  * often the hardest part of coding is *defining* the problem, not solving it

> "The only perfect program is an empty file." - Alex

# What is coding?

* coding is fun!
* coding is frustrating!
* coding is creative!
* coding is communication
  * between you and a computer
  * between you and other coders
  * between you and future you

# A Program Is Like A Recipe

* a recipe is a collection of *ingredients* and *instructions*

![Grandma's Cookie Recipe](../images/cookie-recipe.gif)

* a program is a collection of *data* and *code*

> When you are writing code, you are not baking cookies, you are writing a recipe for how to make cookies.

(recipe from popcornpottery.com)

# Languages

* every program is written in a LANGUAGE
  * like Java or Python or C or Fortran
  * even HTML and CSS and SQL are languages
  * every computer language has a silly name
* computer languages are very **specific** compared to natural languages
* different languages are useful in different areas, but there is a lot of overlap
* today we will learn the Python programming language

# Errors Are Awesome

* Don't be afraid of errors
* Your computer is trying to help you fix your program
  * It's just *really* bad at communicating

> If your code is a two-year-old child, then an error is a temper tantrum.

(It can take effort to figure out the underlying reason why they're upset and fix it.)

* It's not all gibberish
* Try to read it -- really try! -- and pull out the pearls from the pig slop

# What will we learn?

In this class, you will learn about:

*  The command line and why we use it
*  Strings, Arrays, Variables, Objects, Loops, Files
*  How to run your code interactively or from a file
*  How to make a very simple website run on your own computer

Follow along online! Put a browser pointed at this site on one side of your screen, and Terminal on the other.

# What if I know some of this already?

* Pair up
* Help your partner, help your neighbor
* Docendo discimus ("By Teaching We Learn")
* Promote yourself to TA

> The best way to learn is to teach. <br>- [Latin proverb](https://en.wikipedia.org/wiki/Docendo_discimus)

# What if I know other programming languages, but not Python?

There is one very important difference between Python and most other C-style languages:
 
> **Whitespace matters** in Python

Indenting a line is like an opening curly brace, and un-indenting a line is like a closing curly brace.
Å
```python
def main():
     print("we are inside main")
     print("we are still in main")
print("we are outside")
main()
```

This can be very difficult to get used to, and it makes some basic tasks like cut-and-paste behave differently.

# Technical requirements

See the [Installfest](/projects/installfest_python) project for more instructions. 
