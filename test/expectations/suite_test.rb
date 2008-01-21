require File.dirname(__FILE__) + "/../test_helper"

Expectations do

  expect true do
    suite = Expectations::Suite.new
    suite.execute(Silent).succeeded?
  end
  
  expect true do
    suite = Expectations::Suite.new
    suite.expect(1) { 2 }
    suite.do_not_run
    suite.execute(Silent).succeeded?
  end
  
  expect false do
    suite = Expectations::Suite.new
    suite.expect(1) { 2 }
    suite.execute(Silent).succeeded?
  end
  
  expect Expectations::MockRecorder do
    Expectations::Suite.new.mock
  end
  
  expect Mocha::Mock do
    Expectations::Suite.new.mock.target
  end
  
  expect 3 do
    suite = Expectations::Suite.new
    suite.expect(1) { 2 }
    suite.expect(1) { 2 }
    suite.expect(1) { 2 }
    suite.expectations_for(nil).size
  end
  
  expect 1 do
    suite = Expectations::Suite.new
    suite.expect(1) { 2 }
    suite.expect(1) { 2 }
    suite.expectations_for(__LINE__ - 1).size
  end
  
  expect :expected do
    suite = Expectations::Suite.new
    suite.expect(1) { 2 }
    suite.expect(:expected) { 2 }
    suite.expectations_for(__LINE__ - 1).first.expected
  end
  
end