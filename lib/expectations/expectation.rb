class Expectations::Expectation
  include Mocha::Standalone

  attr_accessor :expected, :block, :file, :line, :actual
  def initialize(expected, &block)
    self.expected, self.block = expected, block
    self.file, self.line = eval "[__FILE__, __LINE__]", block.binding
  end
  
  def execute
    expected.is_a?(Mocha::Expectation) ? behavior_based_execute : state_based_execute
  end
  
  def behavior_based_execute
    begin
      mock = expected.instance_variable_get(:@mock)
      mock.expectations.expectations.clear
      mock.add_expectation(expected)
      mocha_setup
      instance_exec mock, &block
      mock.verify
      self.extend(Expectations::Results::Fulfilled)
    rescue Mocha::ExpectationError => ex
      self.extend(Expectations::Results::BehaviorFailure)
      self.message = ex.message
    rescue Exception => ex
      self.extend(Expectations::Results::BehaviorBasedError)
      self.exception = ex
    ensure
      mocha_teardown
    end
    self
  end
    
  def state_based_execute
    begin
      self.actual = block.call
      return self.extend(Expectations::Results::Fulfilled) if expected == actual
    rescue Exception => ex
      return self.extend(Expectations::Results::Fulfilled) if expected == ex.class
      self.extend(Expectations::Results::StateBasedError)
      self.exception = ex 
      self.actual = ex.class if expected.is_a?(Class) && expected < StandardError
      return self
    end
    self.extend(Expectations::Results::StateBasedFailure)
  end
end