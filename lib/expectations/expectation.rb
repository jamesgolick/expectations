class Expectations::Expectation
  attr_accessor :expected, :block
  def initialize(expected, &block)
    self.expected, self.block = expected, block
  end
  
  def execute
    begin
      return Expectations::Results::Success.new if expected == block.call
    rescue
      return Expectations::Results::Error.new
    end
    Expectations::Results::Failure.new
  end
end