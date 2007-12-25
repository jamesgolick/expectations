class Expectations::Expectation
  attr_accessor :expected, :block, :file, :line, :actual
  def initialize(expected, &block)
    self.expected, self.block = expected, block
    self.file, self.line = eval "[__FILE__, __LINE__]", block.binding
  end
  
  def execute
    begin
      self.actual = block.call
      return self.extend(Expectations::Results::Fulfilled) if expected == actual
    rescue Exception => ex
      return self.extend(Expectations::Results::Fulfilled) if expected == ex.class
      self.extend(Expectations::Results::Error)
      self.exception, self.actual = ex, ex.class
      return self
    end
    self.extend(Expectations::Results::Failure)
  end
end