# RPN Calculator

"RPN" stands for "Reverse Polish Notation". (See [the wikipedia entry](http://en.wikipedia.org/wiki/Reverse_Polish_notation) for more information on this colorful term.) Briefly, in an RPN world, instead of using normal "infix" notation, e.g.

    2 + 2
    
you use "postfix" notation, e.g.

    2 2 +

While this may seem bizarre, there are some advantages to doing things this way. For one, you never need to use parentheses, since there is never any ambiguity as to what order to perform operations in. The rule is, you always go from the back, or the left side.

    1 + 2 * 3 =>
    (1 + 2) * 3 or
    1 + (2 * 3)

    1 2 + 3 * => (1 + 2) * 3
    1 2 3 * + => 1 + (2 * 3)

Another advantage is that you can represent any mathematical formula using a simple and elegant data structure, called a [stack](http://en.wikipedia.org/wiki/Stack_(data_structure)).

# Spec

Start with this definition in `calculator.js`:

```
var Calculator = function() {
    var stack = [];
    return {
        value: function() {
        },
        push: function(value) {
        },
        plus: function() {
        }
    }
}
module.exports = Calculator;
```

and use this Jasmine spec (in `calculator.spec.js`) to start:

```
let Calculator = require('./calculator.js');
describe("Calculator", function() {

    var calculator;

    beforeEach(function() {
      calculator = new Calculator();
    });

    it("starts empty", function() {
        expect(calculator.value()).toEqual(null);
    });

    it("can have a value 'pushed' onto it", function() {
        calculator.push(2);
        expect(calculator.value()).toEqual(2);
    });

    it("adds two numbers", function() {
        calculator.push(2);
        calculator.push(3);
        calculator.plus();
    expect(calculator.value()).toEqual(5);
    });

    it("adds three numbers", function() {
        calculator.push(2);
        calculator.push(3);
        calculator.push(4);
        calculator.plus();
        expect(calculator.value()).toEqual(7);
        calculator.plus();
        expect(calculator.value()).toEqual(9);
    });

    it("adds and subtracts", function() {
        calculator.push(2);
        calculator.push(3);
        calculator.push(4);
        calculator.minus();
        expect(calculator.value()).toEqual(-1);
        calculator.plus();
        expect(calculator.value()).toEqual(1);
    });

    it("multiplies and divides", function() {
        calculator.push(2);
        calculator.push(3);
        calculator.push(4);
        calculator.divide();
        expect(calculator.value()).toEqual(0.75);
        calculator.times();
        expect(calculator.value()).toEqual(1.5);
    });

    it("fails informatively when there's not enough values stashed away", function() {
        expect(function() {
            calculator.plus();
        }).toThrow("calculator is empty");

        expect(function() {
            calculator.minus();
        }).toThrow("calculator is empty");

        expect(function() {
            calculator.times();
        }).toThrow("calculator is empty");

        expect(function() {
            calculator.divide();
        }).toThrow("calculator is empty");
    });
});
```

# Backlog

<!--box-->

## REPL

Write a *read-eval-print-loop* that accepts input from the command line and feeds the input into your calculator, like this:

```
> 2 2 +
4
```

<--/box-->


<!--box-->

## Pow

Write *tests and code* for a "power of" operator

<!--/box-->

