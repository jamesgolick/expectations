module Expectations::StateBasedExpectation
  def execute
    begin
      self.actual = block.call
      return self.extend(Expectations::Results::Fulfilled) if expected == actual
    rescue Exception => ex
      return self.extend(Expectations::Results::Fulfilled) if expected == ex.class
      self.extend(Expectations::Results::StateBasedError)
      self.exception = ex 
      self.message = "expected: <#{expected.inspect}> got: <#{ex.class.inspect}>" if expected.is_a?(Class) && expected < StandardError
      return self
    end
    self.extend(Expectations::Results::StateBasedFailure)
  end
end