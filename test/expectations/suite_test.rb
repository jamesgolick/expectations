require File.dirname(__FILE__) + "/../test_helper"

Expectations do
  expect 1 do
    suite = Expectations::Suite.new
    suite.expect(1) { 1 }
    suite.expectations.size
  end

  expect true do
    suite = Expectations::Suite.new
    suite.execute(Silent)
  end
  
  expect false do
    suite = Expectations::Suite.new
    suite.expect(1) { 2 }
    suite.execute(Silent)
  end
end