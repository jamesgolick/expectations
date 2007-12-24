require File.dirname(__FILE__) + "/../test_helper"

Expectations do

  expect "." do
    Expectations::Results::Fulfilled.new.char
  end

  expect "F" do
    Expectations::Results::Failure.new.char
  end

  expect "E" do
    Expectations::Results::Error.new.char
  end

  expect true do
    Expectations::Results::Fulfilled.new.fulfilled?
  end

  expect false do
    Expectations::Results::Failure.new.fulfilled?
  end

  expect false do
    Expectations::Results::Error.new.fulfilled?
  end

  expect :fulfilled do
    Expectations::Results::Fulfilled.new.status
  end

  expect :failure do
    Expectations::Results::Failure.new.status
  end

end