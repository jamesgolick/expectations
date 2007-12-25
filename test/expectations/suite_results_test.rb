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
  
  expect true do
    results = Expectations::SuiteResults.new(Silent)
    results << Object.new.extend(Expectations::Results::Fulfilled)
    results.result
  end

  expect false do
    results = Expectations::SuiteResults.new(Silent)
    results << Object.new.extend(Expectations::Results::Failure)
    results.result
  end
end