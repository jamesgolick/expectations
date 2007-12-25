class Expectations::Suite
  include Mocha::Standalone

  def initialize
    mocha_setup
  end
  
  def execute(out=STDOUT)
    suite_result = Expectations::SuiteResults.new(out)
    benchmark = Benchmark.measure do
      expectations.each do |expectation|
        suite_result << expectation.execute
      end
    end
    suite_result.print_results(benchmark)
    suite_result.result
  end

  def expectations
    @expectations ||= []
  end
  
  def expect(expected, &block)
    self.expectations << Expectations::Expectation.new(expected, &block)
  end
end