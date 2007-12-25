require File.dirname(__FILE__) + "/../test_helper"

Expectations do

  expect "." do
    Object.new.extend(Expectations::Results::Fulfilled).char
  end

  expect "F" do
    Object.new.extend(Expectations::Results::StateBasedFailure).char
  end

  expect "F" do
    Object.new.extend(Expectations::Results::BehaviorFailure).char
  end

  expect "E" do
    Object.new.extend(Expectations::Results::Error).char
  end

  expect true do
    Object.new.extend(Expectations::Results::Fulfilled).fulfilled?
  end

  expect false do
    Object.new.extend(Expectations::Results::StateBasedFailure).fulfilled?
  end

  expect false do
    Object.new.extend(Expectations::Results::BehaviorFailure).fulfilled?
  end

  expect false do
    Object.new.extend(Expectations::Results::Error).fulfilled?
  end

end