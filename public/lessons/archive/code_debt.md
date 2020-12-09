# Code Debt

* "Code Debt" (aka "Technical Debt") is when a program becomes harder and harder to change over time
* It happens to all code and all programmers
* If you do not correct it, your project and life will suffer
* Be ruthless about removing Code Debt

# Make it Work

* Start writing a new feature without worrying about duplication or beauty
* Focus on just the logic of the new code
* Commit to Git early and often to track your changes

# Simple Debugging

* `console.log("some value to log")`
* `console.log({someVariableToLog})`
* `console.error('Some message when things go wrong')`

# Make it Clean

* Fix functions that depend on or produce global variables
* Fix functions or lines which duplicate behavior
* Separate functions that do many things into more functions
* Read "Refactoring" by Martin Fowler
