class Expectations::SuiteResults
  attr_accessor :result, :out, :expectations
  
  def initialize(out)
    self.out, self.result, self.expectations = out, true, []
    out.print "Expectations "
  end
  
  def <<(expectation_result)
    out.print expectation_result.char
    self.expectations << expectation_result
    self.result &&= expectation_result.fulfilled?
    self
  end
  
  def fulfilled
    expectations.select { |expectation| expectation.is_a?(Expectations::Results::Fulfilled) }
  end
  
  def errors
    expectations.select { |expectation| expectation.is_a?(Expectations::Results::Error) }
  end
  
  def failures
    expectations.select do |expectation|
      expectation.is_a?(Expectations::Results::StateBasedFailure) || expectation.is_a?(Expectations::Results::BehaviorFailure)
    end
  end
  
  def print_results(benchmark)
    benchmark_seconds = benchmark.real.to_s.split(".").first
    benchmark_subseconds = benchmark.real.to_s.split(".").last[0..5]
    out.puts "\nFinished in #{benchmark_seconds}.#{benchmark_subseconds} seconds"
    if result
      out.puts "\nSuccess: #{fulfilled.size} fulfilled"
    else
      out.puts "\nFailure: #{failures.size} failed, #{errors.size} errors, #{fulfilled.size} fulfilled"
      out.puts "\nErrors:" if errors.any?
      errors.each do |error|
        out.puts " #{error.file}:#{error.line}:in `expect'"
        out.puts " line <#{error.line}>"
        out.puts " error <#{error.exception.message.gsub(/:/,";")}>"
        out.puts " expected <#{error.expected.inspect}> got <#{error.actual.inspect}>"
      end
      out.puts "\nFailures:" if failures.any?
      failures.each do |failure|
        out.puts " #{failure.file}:#{failure.line}:in `expect'"
        out.puts " line <#{failure.line}>"
        out.puts " #{failure.message}"
      end
    end
  end
end