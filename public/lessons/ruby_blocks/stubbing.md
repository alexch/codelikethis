# Stubbing

* sometimes a test needs to trick the code
  * to test all cases
  * for speed
  * for clarity

* to **stub** a method is to replace that method with a block **during testing**

# Stubbing a Mock Clock

* normally, `Time.now` returns the current time
* in this test, we want to *trick the code* into thinking it's a different time

        midnight = Time.parse("12:00 am")
        Time.stub(:now) { midnight }

* the `stub` method temporarily replaces a method ("now") with a block ("{ midnight }")
* Before stubbing, `Time.now` returns the actual current time        
* After stubbing, `Time.now` returns the **fake** time (midnight)

# Stubbing a Time Machine

* since our test has access to the fake time, we can change it at will
* so we can pretend an hour passed in just an instant

        fake_time = Time.parse("12:00 pm")
        Time.stub(:now) { fake_time }
        do_something
        fake_time += 3600  # number of seconds in an hour
        do_something_else

* during `do_something` the code thinks it's noon, but during do_something_else the code thinks it's one o'clock

# Test Doubles

* stubs are a form of *test doubles*, aka *mock objects*
* others include mocks, fakes, spies, saboteurs...

> Never mock values, sometimes mock entities, but mock services freely. - [J.B. Rainsberger](http://legacy.thecodewhisperer.com/post/1121713303/when-is-it-safe-to-introduce-test-doubles)

* see also <http://www.confreaks.com/videos/659-rubyconf2011-why-you-don-t-get-mock-objects>

