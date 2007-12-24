class Expectations::SuiteResults
  attr_accessor :fulfilled, :failure, :error, :result, :out
  
  def initialize(out)
    self.out, self.result, self.fulfilled, self.failure, self.error = out, true, [], [], []
    out.print "Expectations "
  end
  
  def <<(expectation_result)
    out.print expectation_result.char
    self.send(expectation_result.status) << expectation_result
    self.result &&= expectation_result.fulfilled?
    self
  end
  
  def print_results
    if result
      out.puts "\n\nSuccess: #{fulfilled.size} fulfilled"
    else
      out.puts "\n\nFailure: #{failure.size} failed, #{error.size} errors, #{fulfilled.size} fulfilled"
      out.puts "\nErrors:" if error.any?
      error.each do |err|
        out.puts "In #{err.file}:#{err.line}"
        out.puts "  error: <#{err.exception.message}>"
        out.puts "  expected: <#{err.expected.inspect}> got: <#{err.actual.inspect}>"
      end
      out.puts "\nFailures:" if failure.any?
      failure.each do |fail|
        out.puts "In #{fail.file}:#{fail.line}"
        out.puts "  expected: <#{fail.expected.inspect}> got: <#{fail.actual.inspect}>"
      end
    end
  end
end