
# Class Variables vs. Class Instance Variables

* Class Variables are accessed with `@@`
* Class Instance Variables are accessed with `@` from inside a class method

* Class Variables are available only via the class
* Class Instance Variables are available from the class *or any of its subclasses*

* rule of thumb: Class Instance Variables are cleaner, but Class Variables are easier to use

<http://stackoverflow.com/questions/7072269/should-i-use-class-variables-or-class-instance-variables-for-class-static-variabl/7079235#7079235>

# Class Methods

* a Class Method is an instance method of the eigenclass

![eigenclass method lookup](eigenclass_method_lookup.gif)

# Defining Class Methods

There are at least four idioms for defining Class Methods (i.e. switching contexts to the eigenclass of the class object and then defining a method there).

Number 2 is most common.

```ruby
class Foo

  # 1. pass the target to def
  def Foo.a
  end

  # 2. pass the target to def, relying on the fact that self
  # happens to be the class object right now
  def self.b
  end

  # switch from class scope to singleton class scope
  class << self

    # 3. define a plain accessor in singleton class scope
    def c
    end

    # 4. use a macro to define an accessor
    attr_reader :d
  end
end
```

(There are probably half a dozen more ways to do this, once you factor in class_eval and define_method and the like, but that should satisfy you for now. :-))

# Class Instance Variable Scope

Remember: class methods access class instance variables.

```ruby
class Foo
  @a, @b, @c, @d = 1, 2, 3, 4

  # 1. pass the target to def
  def Foo.a
    @a
  end

  # 2. pass the target to def, relying on the fact that self
  # happens to be the class object right now
  def self.b
    @b
  end

  # switch from class scope to singleton class scope
  class << self

    # 3. define a plain accessor in singleton class scope
    def c
      @c
    end

    # 4. use a macro to define an accessor
    attr_reader :d
  end

end

p [Foo.a, Foo.b, Foo.c, Foo.d]
#=> [1, 2, 3, 4]
```

<http://stackoverflow.com/a/7577602/190135>

# Class Instance Variable Gotcha

Remember: class instance variables are only available via the class they're defined on.


If you try to call any of those methods from (or via) a subclass, the methods will execute, but the @ variables will all be nil, since self will be the subclass's class object, not the parent class' class object.

    class Bar < Foo
    end

    p [Bar.a, Bar.b, Bar.c, Bar.d]
    #=> [nil, nil, nil, nil]

