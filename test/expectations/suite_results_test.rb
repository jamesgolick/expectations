require File.dirname(__FILE__) + "/../test_helper"

Expectations do
  expect 1 do
    results = Expectations::SuiteResults.new(Silent)
    results << Expectations::Results::Fulfilled.new
    results.fulfilled
  end

  expect 0 do
    results = Expectations::SuiteResults.new(Silent)
    results << Expectations::Results::Fulfilled.new
    results.error
  end
  
  expect true do
    results = Expectations::SuiteResults.new(Silent)
    results << Expectations::Results::Fulfilled.new
    results.result
  end

  expect false do
    results = Expectations::SuiteResults.new(Silent)
    results << Expectations::Results::Failure.new
    results.result
  end
end