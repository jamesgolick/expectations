class Expectations::Expectation
  include Mocha::Standalone
  attr_accessor :expected, :block, :file, :line, :actual
  
  def initialize(expected, &block)
    self.expected, self.block = expected, block
    self.file, self.line = eval "[__FILE__, __LINE__]", block.binding
    case
      when expected.is_a?(Expectations::DelegateRecorder) then extend(Expectations::DelegateExpectation)
      when expected.is_a?(Expectations::PositiveStateBasedRecorder) then extend(Expectations::RecordedExpectation)
      when expected.is_a?(Expectations::MockRecorder) then extend(Expectations::BehaviorBasedExpectation)
      else extend(Expectations::StateBasedExpectation)
    end
  end
  
end