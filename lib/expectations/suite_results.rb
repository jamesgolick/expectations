class Expectations::SuiteResults
  attr_accessor :fulfilled, :failed, :result, :out
  
  def initialize(out)
    self.out, self.result, self.fulfilled, self.failed = out, true, 0, 0
    out.print "Expectations "
  end
  
  def <<(expectation_result)
    out.print expectation_result.char
    self.fulfilled += 1 if expectation_result.passed?
    self.failed += 1 unless expectation_result.passed?
    self.result &&= expectation_result.passed?
    self
  end
  
  def print_results
    if result
      out.puts "\n\nSuccess: #{fulfilled} fulfilled"
    else
      out.puts "\n\nFailure: #{failed} failed, #{fulfilled} fulfilled"
    end
  end
end