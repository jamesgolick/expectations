class Expectations::Suite
  
  def mock
    Expectations::MockRecorder.new(Mocha::Mock.new)
  end
  
  def execute(out=STDOUT)
    return true if @do_not_run
    suite_result = Expectations::SuiteResults.new(out)
    benchmark = Benchmark.measure { ENV["LINE"].nil? ? run_all(suite_result) : run_one(suite_result) }
    suite_result.print_results(benchmark)
    suite_result.write_junit_xml(ENV["JUnitXmlPath"]) unless ENV["JUnitXmlPath"].nil?
    yield suite_result if block_given?
    suite_result.succeeded?
  end
  
  def run_all(suite_result)
    expectations.each { |expectation| suite_result << expectation.execute }
  end
  
  def run_one(suite_result)
    one = expectations.inject { |result, expectation| expectation.line > ENV["LINE"].to_i ? result : expectation }
    suite_result << one.execute
  end

  def expectations
    @expectations ||= []
  end
  
  def expect(expected, &block)
    self.expectations << Expectations::Expectation.new(expected, &block)
  end
  
  def do_not_run
    @do_not_run = true
  end
end