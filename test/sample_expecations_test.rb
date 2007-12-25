require File.dirname(__FILE__) + "/test_helper"

Expectations do
  
  expect 2 do
    1 + 1
  end
  
  expect NoMethodError do
    Object.no_method
  end
  
  expect mock.to_receive(:redial) do |phone|
    phone.redial(10)
  end
  
  expect mock.to_receive(:dial).with("2125551212") do |phone|
    phone.dial("2125551212")
  end
  
  expect mock.to_receive(:dial).times(2) do |phone|
    phone.dial
    phone.dial
  end
  
  expect Object.to_receive(:foo).with(1).times(2) do
    Object.foo(1)
    Object.foo(1)
  end
  
  expect Object.new.to_receive(:foo).with(2) do |bar|
    bar.foo(2)
  end
  
end