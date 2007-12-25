require File.dirname(__FILE__) + "/../test_helper"

Expectations do
  expect true do
    Expectations::Expectation.new(1) { 2 }.execute.is_a?(Expectations::Results::Failure)
  end
  
  expect true do
    Expectations::Expectation.new(1) { 1 }.execute.is_a?(Expectations::Results::Fulfilled)
  end
  
  expect true do
    Expectations::Expectation.new(1) { raise }.execute.is_a?(Expectations::Results::Error)
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