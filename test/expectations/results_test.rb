require File.dirname(__FILE__) + "/../test_helper"

Expectations do

  expect "." do
    Object.new.extend(Expectations::Results::Fulfilled).char
  end

  expect "F" do
    Object.new.extend(Expectations::Results::Failure).char
  end

  expect "E" do
    Object.new.extend(Expectations::Results::Error).char
  end

  expect true do
    Object.new.extend(Expectations::Results::Fulfilled).fulfilled?
  end

  expect false do
    Object.new.extend(Expectations::Results::Failure).fulfilled?
  end

  expect false do
    Object.new.extend(Expectations::Results::Error).fulfilled?
  end

  expect :fulfilled do
    Object.new.extend(Expectations::Results::Fulfilled).status
  end

  expect :failure do
    Object.new.extend(Expectations::Results::Failure).status
  end

end