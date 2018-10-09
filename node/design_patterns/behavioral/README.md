## Behavioral

### Chain of Responsibility
Intent:
Avoid coupling the sender of a request to its receiver by giving more than one object a change to handle the request. Chain the receiving objects and pass the request along the chain.

start - Prototype and Problem Statement
final - Implementation of CoR, checkout the chaining logic in find function.

### Command
Intent:
Encapsulate a request as an object, thereby letting you parameterize with different requests, queue or log requests, and support undoable operations.

start - Prototype and Problem Statement
second - Creation of commands and execution flow.
final - Enhancements to the commands.

### Iterator
Intent:
Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.

start - Prototype and Problem Statement
final - Iterator implementation, check [...] while reversing the list for retrieving last element.

### Observer
Intent:
Define a one to many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.

start - Prototype and Problem Statement
final - Lol... Look again and again.


### Strategy
Intent:
Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.