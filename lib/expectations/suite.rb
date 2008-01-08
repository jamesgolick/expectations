class Expectations::Suite

  def mock
    Expectations::MockRecorder.new(self)
  end
  
  def execute(out=STDOUT)
    suite_result = Expectations::SuiteResults.new(out)
    benchmark = Benchmark.measure do
      ENV["LINE"].nil? ? run_all(suite_result) : run_one(suite_result)
    end
    suite_result.print_results(benchmark)
    suite_result.result
  end
  
  def run_all(suite_result)
    expectations.each do |expectation|
      suite_result << expectation.execute
    end
  end
  
  def run_one(suite_result)
    one = expectations.inject do |result, expectation|
      expectation.line > ENV["LINE"].to_i ? result : expectation
    end
    suite_result << one.execute
  end

  def expectations
    @expectations ||= []
  end
  
  def expect(expected, &block)
    self.expectations << Expectations::Expectation.new(expected, &block)
  end
end