require File.dirname(__FILE__) + "/test_helper"

Expectations do
  
  # State based expectation where a value equals another value
  expect 2 do
    3
  end
  
  # State based expectation where an exception is expected. Simply expect the Class of the intended exception
  expect ArgumentError do
    Object.no_method
  end
  
  # Behavior based test using a traditional mock
  expect mock.to_receive(:dial).with("2125551212").times(2) do |phone|
    phone.dial("2125551212")
    phone.dial("2125551212") # !> `&' interpreted as argument prefix
    phone.dial("2125551212")
  end

  # Behavior based test using a traditional mock
  expect mock.to_receive(:dial).with("2125551212").times(2) do |phone|
    phone.dial("2125551212")
  end

  # Behavior based test on a concrete mock
  expect Object.to_receive(:deal) do
    Object.no_deal
  end
  
  # Behavior based test on a concrete mock
  expect Object.to_receive(:deal) do
  end
  
  # State based test utilizing a stub
  expect 2 do
    stub(:two => 2).twos
  end
  
  # State based test utilizing a concrete mock
  expect 2 do
    Object.expects(:bar).returns 2
    Object.barter
  end
  
  # Behavior based test utilizing a stub and a concrete mock
  expect 1 do
    Object.expects(:give_me_three).with(3).returns 1
    Object.give_me_three(stub(:three=>3).threes)
  end
  
end