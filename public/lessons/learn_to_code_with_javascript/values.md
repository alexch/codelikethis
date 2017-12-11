# Values

A VALUE is a location in computer memory that stores DATA.

There are many kinds of values, including String, Number, Array, Date, ... 

(The different kinds of values are called TYPES. Soon you will create your own types but for now, we will use the built-in ones.)

# Numbers

A NUMBER is what it sounds like.

    10
    -12
    3.14

# Strings

A STRING is an object that's a collection of characters, like a word or a sentence.

    "apple"
    "banana"
    "Cherry Pie"

# Messages and Operators

All values respond to MESSAGES. 

You send messages using OPERATORS, like PLUS (`+`) and TIMES (`*`) and DOT (`.`)

(Dot is a special operator; we will learn more about her later.)
    
# Return Values

Every time an object receives a message, it returns a response.

The response is also called the VALUE or the RETURN VALUE.

You can think of it as the answer to a question. 

    2 + 2    // Question: What is 2 + 2?
    4        // Answer: 4

    // Q: What is the all-caps version of the string "apple"?
    "apple".toUpperCase()  
    // A: the string "APPLE"
    "APPLE"

# Return Values (cont.)

Sometimes the return value is the same as the original value.

    4 * 1    // return value: 4
    
Sometimes the return value is a different value.

    2 + 3    // return value: 5
    
Sometimes the return value is a different value *and* a different type.

    "banana".length  // return value: 6

Sometimes the return value is a magic value.

    (5).shape      // return value: undefined
    5 / 0          // return value: Infinity
    "cookie" * 10  // return value: NaN


