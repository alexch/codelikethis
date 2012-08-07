!SLIDE subsection
# Hash

Ref. WGR Chapter 9, Section 9.3, Hashes

# Hash

* also known as...
  * Map
  * Associative Array
  * Dictionary
  * Name/Value Pair Store
  * Key/Value Pair Store

# Setting and Getting Hash Values

    @@@ ruby
    states = Hash.new
    states["MA"] = "Massachusetts"
    states["CA"] = "California"
    states["NY"] = "New York"

    states["MA"].reverse #=> "sttesuhcassaM"

# Hash literals

a Hash can be defined *literally* (inline) with braces e.g.

    @@@ ruby
    states = { "MA" => "Massachusetts",
               "CA" => "California",
               "NY" => "New York"
             }

    states["MA"] #=> "Massachusetts"

# Remember, strings are not symbols!

    @@@ruby
    states = {:MA => "Massachusets"}
    states["MA"] #=> nil
    states[:MA]  #=> "Massachusets"

# Hash literals with Symbol Keys

Ruby 1.8 or 1.9:

    {:foo => "bar", :baz => "baf"}

Ruby 1.9 only:

    {foo: "bar", baz: "baf"}

# hash parameters plus hash literals => named parameters

These are all equivalent:

    @@@ruby
    User.new({:name => "Alex", :email => "alex@stinky.com"})
    User.new(:name => "Alex", :email => "alex@stinky.com")
    User.new :name => "Alex", :email => "alex@stinky.com"
    User.new name: "Alex", email: "alex@stinky.com"
    User.new name:"Alex", email:"alex@stinky.com"
    User.new email:"alex@stinky.com", name:"Alex"

...so using a hash literal *almost* looks like named parameters.

(Ruby 2.0 will support proper named parameters, using the same calling syntax.)

# Hash methods

* each, each_pair
* keys, values
* has_key?, has_value?
* merge, merge!
* delete, delete_if

# Hash arguments

braces are optional...

...**if** the hash is the final argument

(except for a default block)

# `merge` to combine two hashes

Here's a handy trick:

    class Hash
      alias_method :<<, :merge!
      alias_method :+, :merge
    end

    {foo: 1} << {bar: 2}
    => {:foo=>1, :bar=>2}   # destructive

    {foo: 1} + {bar: 2}
    => {:foo=>1, :bar=>2}   # creative


