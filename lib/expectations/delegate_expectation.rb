module Expectations::DelegateExpectation
  def execute
    begin
      mocha_setup
      actual = instance_exec expected.mock, &block
      if expected.verify(actual)
        self.extend(Expectations::Results::Fulfilled)
      else
        self.extend(Expectations::Results::StateBasedFailure)
        self.message = "Delegation may have occurred; however, the return value could not be verified. Did you specify something after the delegation method?"
      end
    rescue Mocha::ExpectationError => ex
      self.extend(Expectations::Results::BehaviorBasedFailure)
      self.message = "Expected #{expected.klass} to delegate #{expected.meth} to #{expected.subject}; however, #{expected.subject}.#{expected.meth} was never called"
    rescue Exception => ex
      self.extend(Expectations::Results::Error)
      self.exception = ex
    ensure
      mocha_teardown
    end
    self
  end

end