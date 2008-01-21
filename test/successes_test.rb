require File.dirname(__FILE__) + "/test_helper"

Expectations do
  
  # State based expectation where a value equals another value
  expect 2 do
    1 + 1
  end
  
  # State based expectation where an exception is expected. Simply expect the Class of the intended exception
  expect NoMethodError do
    Object.no_method
  end
  
  # Behavior based test using a traditional mock
  expect mock.to_receive(:dial).with("2125551212").times(2) do |phone|
    phone.dial("2125551212")
    phone.dial("2125551212")
  end

  # Behavior based test on a concrete mock
  expect Object.to_receive(:deal) do
    Object.deal
  end
  
  # State based test utilizing a stub
  expect 2 do
    stub(:two => 2).two
  end
  
  # State based test utilizing a concrete mock
  expect 2 do
    Object.expects(:bar).returns 2
    Object.bar
  end
  
  # Behavior based test utilizing a stub and a concrete mock
  expect 1 do
    Object.expects(:give_me_three).with(3).returns 1
    Object.give_me_three(stub(:three=>3).three)
  end
  
  # State based test matching a Regexp
  expect /a string/ do
    "a string"
  end
  
  # State based test checking if actual is in the expected Range
  expect 1..5 do
    3
  end
  
  # State based test to determine if the object is an instance of the module
  expect Enumerable do
    []
  end

  # State based test to determine if the object is an instance of the class
  expect String do
    "a string"
  end
  
  # State based test to determine if the modules are the same
  expect Enumerable do
    Enumerable
  end
  
  # State based test to determine if the classes are the same
  expect String do
    String
  end
  
end