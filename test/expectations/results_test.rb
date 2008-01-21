require File.dirname(__FILE__) + "/../test_helper"

Expectations do

  expect "." do
    Object.new.extend(Expectations::Results::Fulfilled).char
  end

  expect "F" do
    Object.new.extend(Expectations::Results::StateBasedFailure).char
  end

  expect "F" do
    Object.new.extend(Expectations::Results::BehaviorBasedFailure).char
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
    Object.new.extend(Expectations::Results::BehaviorBasedFailure).fulfilled?
  end

  expect false do
    Object.new.extend(Expectations::Results::Error).fulfilled?
  end

  expect false do
    Object.new.extend(Expectations::Results::Fulfilled).error?
  end

  expect false do
    Object.new.extend(Expectations::Results::StateBasedFailure).error?
  end

  expect false do
    Object.new.extend(Expectations::Results::BehaviorBasedFailure).error?
  end

  expect true do
    Object.new.extend(Expectations::Results::Error).error?
  end

  expect false do
    Object.new.extend(Expectations::Results::Fulfilled).failure?
  end

  expect true do
    Object.new.extend(Expectations::Results::StateBasedFailure).failure?
  end

  expect true do
    Object.new.extend(Expectations::Results::BehaviorBasedFailure).failure?
  end

  expect false do
    Object.new.extend(Expectations::Results::Error).failure?
  end

end