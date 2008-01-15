require File.dirname(__FILE__) + "/test_helper"

Expectations do
  
  # State based expectation where a value equals another value # !> `&' interpreted as argument prefix
  expect 2 do # !> `&' interpreted as argument prefix
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
# >> Expectations FE..EFEEE
# >> Finished in 0.00240 seconds
# >> 
# >> Failure: 2 failed, 5 errors, 2 fulfilled
# >> 
# >> --Errors--
# >>  -:11:in `expect'
# >> file <->
# >> line <11>
# >> error <undefined method `no_method' for Object:Class>
# >> trace 
# >>   -:12
# >>   -:3
# >> expected: <ArgumentError> got: <NoMethodError>
# >> 
# >>  -:28:in `expect'
# >> file <->
# >> line <28>
# >> error <undefined method `no_deal' for Object:Class>
# >> trace 
# >>   -:29:in `__instance_exec0'
# >>   -:3
# >> 
# >>  -:37:in `expect'
# >> file <->
# >> line <37>
# >> error <#<Mock:0x66e57c>.twos() - expected calls: 0, actual calls: 1>
# >> trace 
# >>   -:38
# >>   -:3
# >> 
# >>  -:42:in `expect'
# >> file <->
# >> line <42>
# >> error <undefined method `barter' for Object:Class>
# >> trace 
# >>   -:44
# >>   -:3
# >> 
# >>  -:48:in `expect'
# >> file <->
# >> line <48>
# >> error <#<Mock:0x66caec>.threes() - expected calls: 0, actual calls: 1>
# >> trace 
# >>   -:50
# >>   -:3
# >> 
# >> 
# >> --Failures--
# >>  -:6:in `expect'
# >> file <->
# >> line <6>
# >> expected: <2> got: <3>
# >> 
# >>  -:33:in `expect'
# >> file <->
# >> line <33>
# >> #<Mock:0x66f120>.deal(any_parameters) - expected calls: 1, actual calls: 0
# >> 
