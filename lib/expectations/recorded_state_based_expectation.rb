module Expectations::RecordedStateBasedExpectation
  def execute
    begin
      mocha_setup
      instance_exec expected.subject, &block
      if expected.verify
        self.extend(Expectations::Results::Fulfilled)
      else
        self.extend(Expectations::Results::StateBasedFailure)
        self.message = "expected #{expected.subject} to #{expected.message}"
      end
    rescue Exception => ex
      self.extend(Expectations::Results::Error)
      self.exception = ex
    ensure
      mocha_teardown
    end
    self
  end

end