class Expectations::SuiteResults
  attr_accessor :fulfilled, :failure, :error, :result, :out
  
  def initialize(out)
    self.out, self.result, self.fulfilled, self.failure, self.error = out, true, 0, 0, 0
    out.print "Expectations "
  end
  
  def <<(expectation_result)
    out.print expectation_result.char
    self.send("#{expectation_result.status}=".to_sym, self.send(expectation_result.status)+1)
    self.result &&= expectation_result.fulfilled?
    self
  end
  
  def print_results
    if result
      out.puts "\n\nSuccess: #{fulfilled} fulfilled"
    else
      out.puts "\n\nFailure: #{failure} failed, #{error} errors, #{fulfilled} fulfilled"
    end
  end
end