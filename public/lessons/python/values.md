    topic name: "values"
    topic name: "numbers"
    topic name: "strings"
    topic name: "booleans"
    topic name: "operators"
    topic name: "return-values"
    link name: "An Informal Introduction to Python", href: "https://docs.python.org/3/tutorial/introduction.html"

# Values

A VALUE is a location in computer memory that stores DATA.

There are many kinds of values, including String, Number, List, Date, ... 

(The different kinds of values are called TYPES. Soon you will create your own types but for now, we will use the built-in ones.)

# Numbers

A **number** is what it sounds like -- any integer or decimal.

```python3
10
-12
3.14
```

(Technically, integers and decimals are different types, but Python will convert them back and forth for you.)

# Strings

A **string** is an object that's a collection of characters, like a word or a sentence.

```python3
'apple'
'banana'
'Cherry Pie'
```

# Booleans

A **boolean** is a value that is either `True` or `False`.

(It's named after *[George Boole](https://en.wikipedia.org/wiki/George_Boole)*, 
a 19th-century mathematician who invented [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).)

```python
>>> 2 < 5
True
>>> 2 == 5
False
```

# Operators

Values can be combined or manipulated using **operators**, like...
 
 * PLUS (`+`)
 * TIMES (`*`)
 * POWER (`**`)
 * DOT (`.`)

An operator *sends a message* to the value

  * e.g. `1 + 2` sends the number `1` the message `please add 2 to yourself`.

Dot is a special operator that *sends arbitrary messages*; we will learn more about her later.

# Expression Evaluation

A snippet of code is called an *expression*.

Whenever Python encounters an expression, it tries to *evaluate* it, which means to convert it into a *value*.

A simple expression (like a plain number or a string) evaluates to just that value.

A more complicated expression with operators keeps applying those operators until it gets down to a single value. 

> You can think of evaluation as *asking and answering* a question.

```python
2 + 2    # Question: What is 2 + 2?
4        # Answer: 4

# Q: What is the all-caps version of the string 'apple'?
'apple'.upper()  
# A: the string 'APPLE'
'APPLE'
```

We say that an expression **evaluates to** a value, as in
"2 plus 2 *evaluates to* 4". You can also say "the value of 2 + 2 is 4" or "the return value of 2 + 2 is 4".

# Return Values

Sometimes the return value is the same as the original value.

```python
4 * 1    # return value: 4
```

Sometimes the return value is a different value.

```python
2 + 3    # return value: 5
```

Sometimes the return value is a different value *and* a different type.

```python
'banana'.islower()  # return value: True
```

# Expressions vs. Statements

Python (like most languages derived from C) makes a distinction between *expressions* and *statements*.

*expression* means "code that can be evaluated" or "code that has a value", e.g.:

    1 + 1

*statement* means "code that does something", e.g.:

    print(1 + 1)
    
Every expression is also a statement, but not every statement is an expression. 

# Statement Values

Some statements have values, so `python3` (in interactive mode) will *evaluate* them and *print* those values...

```python3
>>> 1 + 1
2
```

...but *some statements have no value* (even though they contain expressions that *do* have value):

```python3
>>> x = 10 * 2
>>> x
20
```

a `print` statement *has no value*, but it does print the value of its argument... but with slightly different formatting than the `python3` interpreter:

```python
>>> name = 'Alice'
>>> name
'Alice'
>>> print(name)
Alice

>>> type(print('hello'))
hello
<class 'NoneType'>
``` 
