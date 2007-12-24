require File.dirname(__FILE__) + "/../test_helper"

Expectations do

  expect "." do
    Expectations::Results::Success.new.char
  end

  expect "F" do
    Expectations::Results::Failure.new.char
  end

  expect "E" do
    Expectations::Results::Error.new.char
  end

  expect true do
    Expectations::Results::Success.new.passed?
  end

  expect false do
    Expectations::Results::Failure.new.passed?
  end

  expect false do
    Expectations::Results::Error.new.passed?
  end

end