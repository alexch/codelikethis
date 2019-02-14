require "track"

class Track < Thing
  Cs = Track.new(
    name: "cs",
    display_name: "Just Enough Computer Science",
    description: "As the old joke goes, the difference between theory and practice is that in theory, there is no difference. Computer Science is the academic field covering the theory of how computers work; this course covers some very practical theories, and how to apply them to your own code."
  ) do

    link href: "https://en.wikipedia.org/wiki/Computer_science"
    link href: "http://medium.com/basecs"
    link href: "http://teachyourselfcs.com"
    link href: "https://www.edx.org/course/cs50s-introduction-computer-science-harvardx-cs50x"
    link name: "Crash Course Computer Science",
         href: "https://www.youtube.com/playlist?list=PLME-KWdxI8dcaHSzzRsNuOLXtM2Ep_C7a"
    lesson name: "unicode"

    lesson name: "turing_complete",
           description: "Alan Turing proved that once a programming language reaches a certain level of expressiveness, it is functionally interchangeable with all other such programming languages. What implications does this have for our choice (or lack of choice) between programming languages?"


    lesson name: "state_machines" do
      link href: "https://www.smashingmagazine.com/2018/01/rise-state-machines/"
      link href: "https://en.wikipedia.org/wiki/Finite-state_machine"
      link href: "https://blog.markshead.com/869/state-machines-computer-science/"
    end

    lesson name: "sorting"
    lesson name: "big_o" do
      link href: "https://www.theguardian.com/info/developer-blog/2015/jan/27/why-learn-about-algorithms"
    end

    lesson name: "parsing_and_grammars"

    lesson name: "oo",
           display_name: "Object-Oriented Design"

    lesson name: "multitasking-and-multithreading"
    lesson name: "dependency-injection"
    lesson name: "recursion", description: "Recursion and Re-Entry"

    lesson name: "abstraction_and_abstractions" do
      link href: "http://www.princeton.edu/~achaney/tmve/wiki100k/docs/Abstraction_(computer_science).html"
    end

    lesson name: "dependencies" # explicit v implicit; global vs injected; language and framework *are* dependencies; don't test the library, test the connection; gems and npm and maven and...?

  end
end

# https://twitter.com/joeerl/status/951357931559284736
