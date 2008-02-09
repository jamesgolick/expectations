require File.dirname(__FILE__) + "/../test_helper"

Expectations do
  expect Expectations::Results::StateBasedFailure do
    Expectations::Expectation.new(1) { 2 }.execute
  end
  
  expect Expectations::Results::Fulfilled do
    Expectations::Expectation.new(1) { 1 }.execute
  end
  
  expect Expectations::Results::Error do
    Expectations::Expectation.new(1) { raise }.execute
  end
  
  expect "undefined method `no_method' for Object:Class" do
    Expectations::Expectation.new(ArgumentError) { Object.no_method }.execute.exception.to_s
  end
  
  expect Expectations::Results::Fulfilled do
    Expectations::Expectation.new(NoMethodError) { Object.no_method }.execute
  end
  
  expect nil do
    Expectations::Expectation.new(String) { Object.no_method }.execute.actual
  end
  
  expect __LINE__ + 1 do
    Expectations::Expectation.new(1) { 2 }.execute.line
  end

  expect __LINE__ + 1 do
    Expectations::Expectation.new(1) { raise }.execute.line
  end

  expect __FILE__ do
    Expectations::Expectation.new(1) { 2 }.execute.file
  end
  
  expect __FILE__ do
    Expectations::Expectation.new(1) { raise }.execute.file
  end

end