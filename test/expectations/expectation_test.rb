require File.dirname(__FILE__) + "/../test_helper"

Expectations do
  expect Expectations::Results::Failure do
    Expectations::Expectation.new(1) { 2 }.execute.class
  end
  expect Expectations::Results::Fulfilled do
    Expectations::Expectation.new(1) { 1 }.execute.class
  end
  expect Expectations::Results::Error do
    Expectations::Expectation.new(1) { raise }.execute.class
  end
end