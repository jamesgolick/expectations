class Expectations::Expectation

  attr_accessor :expected, :block, :file, :line, :actual
  
  def initialize(expected, &block)
    self.expected, self.block = expected, block
    self.file, self.line = eval "[__FILE__, __LINE__]", block.binding
    if expected.is_a?(Expectations::MockRecorder)
      extend(Expectations::BehaviorBasedExpectation)
    else
      extend(Expectations::StateBasedExpectation)
    end
  end
  
end