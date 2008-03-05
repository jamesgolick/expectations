class Expectations::Expectation
  include Mocha::Standalone
  attr_accessor :expected, :block, :file, :line, :actual
  
  def initialize(expected, &block)
    self.expected, self.block = expected, block
    self.file, self.line = eval "[__FILE__, __LINE__]", block.binding
    case
      when expected.is_a?(Expectations::Recorder) then extend(Expectations::RecordedExpectation)
      else extend(Expectations::StateBasedExpectation)
    end
  end
  
end