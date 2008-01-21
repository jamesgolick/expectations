module Expectations::BehaviorBasedExpectation
  def execute
    begin
      mocha_setup
      instance_exec expected.mock, &block
      expected.verify
      self.extend(Expectations::Results::Fulfilled)
    rescue Mocha::ExpectationError => ex
      self.extend(Expectations::Results::BehaviorBasedFailure)
      self.message = ex.message
    rescue Exception => ex
      self.extend(Expectations::Results::Error)
      self.exception = ex
    ensure
      mocha_teardown
    end
    self
  end
  
end