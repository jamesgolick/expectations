require File.dirname(__FILE__) + "/../test_helper"

Expectations do
  expect :failure do
    Expectations::Expectation.new(1) { 2 }.execute.status
  end
  
  expect :fulfilled do
    Expectations::Expectation.new(1) { 1 }.execute.status
  end
  
  expect :error do
    Expectations::Expectation.new(1) { raise }.execute.status
  end
  
  expect __LINE__ + 1 do
    Expectations::Expectation.new(1) { 2 }.execute.line
  end

  expect __LINE__ + 1 do
    Expectations::Expectation.new(1) { raise }.execute.line
  end

  # expect "file" do
  #   Expectations::Expectation.new(1) { 2 }.execute.file
  # end
  # 
  # expect "file" do
  #   Expectations::Expectation.new(1) { raise }.execute.file
  # end

end