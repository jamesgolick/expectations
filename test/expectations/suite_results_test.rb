require File.dirname(__FILE__) + "/../test_helper"

Expectations do
  expect 1 do
    results = Expectations::SuiteResults.new(Silent)
    results << Object.new.extend(Expectations::Results::Fulfilled)
    results.fulfilled.size
  end

  expect 0 do
    results = Expectations::SuiteResults.new(Silent)
    results << Object.new.extend(Expectations::Results::Fulfilled)
    results.errors.size
  end
  
  expect false do
    results = Expectations::SuiteResults.new(Silent)
    results << Object.new.extend(Expectations::Results::StateBasedFailure)
    results << Object.new.extend(Expectations::Results::Fulfilled)
    results.succeeded?
  end

  expect false do
    results = Expectations::SuiteResults.new(Silent)
    results << Object.new.extend(Expectations::Results::BehaviorBasedFailure)
    results << Object.new.extend(Expectations::Results::Fulfilled)
    results.succeeded?
  end
  
  expect true do
    results = Expectations::SuiteResults.new(Silent)
    results << Object.new.extend(Expectations::Results::Fulfilled)
    results << Object.new.extend(Expectations::Results::Fulfilled)
    results.succeeded?
  end
  
end