# The Factory Family

Here's one of my favorite rants: The [Gang Of Four](http://www.amazon.com/gp/product/0201633612/) didn't do a very good job at laying out the "Creational Patterns". Their timing was all wrong: they jumped the gun and started with Abstract Factory. This reminds me of the following Steve Martin routine (paraphrased):

> I was never good at dating. My timing was all wrong. I'd meet a girl in a bar and say, "Hi, was it good for you too?"

So here's my take, in proper order, on the progression of patterns for creating an object.

(based on <http://purpletech.com/blog/index.php?itemid=15> which had Java code examples)

# 1. Constructor

    Foo.new(bar)

It should go without saying that the simplest and most straightforward way to create an object is to use its constructor. (Unfortunately, it often does not, and architects are too eager to open their UML modeling tools and forget how to spell n - e - w ...)
However, sometimes constructors are too limiting. Maybe there is some initialization that must happen before the object is constructed, or immediately after. Maybe you have lots of constructors with similar or identical parameter lists and you need a series of named methods to distinguish them. In that case, the next step is...

# 2. Factory Method

    create_foo(bar)
    create_foo_for_some_reason(bar)
    create_foo_for_some_other_reason(baz)

This is good when the caller has some logic around the object creation, either before or after. You may also want to override the Factory Method in a subclass, allowing polymorphic creation. See this article by Gopalan Suresh Raj for a thorough, if long-winded, discussion.

# 3. Static Factory Method

    Foo.create(bar)
    Foo.from_baz(baz)
    Foo.on_alternate_tuesdays(bar, baz)

If a factory method (#2) is generic enough, it often makes sense to put it as a static method on the object class. Usually if you do this you'll also want to make the constructor private, to force all callers to go through the factory method(s). This ensures consistent access to the object, allows you to apply the Complete Creation principle, and makes your code more readable, since the name of the factory method should describe the scenario (at least more than a bare "new" does).
This also allows your private constructor to become simpler. A factory method can take care of initialization stuff, and the constructor can take in already set-up objects and stick them in instance variables.

However, I am growing somewhat reluctant to use globals (which include statics / class methods) of any kind. It seems to violate Separation of Concerns to put the code for *creating* an object in the same place as the code for *being* that object.

# 4. Factory Object

    FooFactory.new.create(bar)

Allows separation of concerns, and consistency between instances of the same class without relying on nasty static variables. Use this if constructing the factory itself is cheap.

Note that many OO languages, in moving the factory into a separate class you give up the power to access private members of the created class. This may mean you have to refactor the target object to expose a public (or package- or friend-accessible) method to do initialization.

It's a simple step from here to #6, a Dependency-Injected Singleton factory.

# 5. Static Singleton Factory Object

  FooFactory.instance.create(bar)

Using a singleton gives you a common entry point for creating objects across your application. That means you can do tricks like caching, instance pooling, referential integrity checking and maintenance, etc.

Static singletons like this are easy to use since you can always just reach out and find one. But this is not ideal cause you need static registry and teardown semantics, and it's hard (OK, annoying) to swap out instances at runtime, for instance for tests, without compromising your ability to do multithreading. Dependency Injection 0wnz0rrz statics of all types (including this one) (see below).

# 6. Injected Singleton Factory Object

  @foo_factory.create(bar)

I might get in trouble for calling this a Singleton. The basic idea behind Dependency Injection that when you want something -- any service, like a factory, a repository, a search server, an asynchronous message scheduler -- you just ask yourself for it. You have it already, since in your constructor your client passed it in to you, and you stashed it away in an instance variable.

In the above example, note that I'm calling some instance variable named foo_factory. This implies that that foo_factory was injected into the current object. It makes it really easy to test, since the test will merely pass in a test-only version of a foo factory (say, a mock or fake).

This allows the oxymoronic "multiple singletons" pattern: at any given point there's only one of the things in scope, but there can be many in the same application or VM; in fact, many different instances can be active at the same time. This is great for testability and flexibility.

# 7. Abstract Factory

Abstract Factories are aware of the whole hierarchy of possible subclasses of the target object and return the right one for the given use at runtime. A better name might be "polymorphic factory."

It's a pretty heavyweight pattern and a long way from "new". You may never use it. I never have.

