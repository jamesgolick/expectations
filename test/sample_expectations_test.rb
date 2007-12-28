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
  
end