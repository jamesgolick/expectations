class Expectations::Suite
  
  def execute(out=STDOUT)
    suite_result = Expectations::SuiteResults.new(out)
    expectations.each do |expectation|
      suite_result << expectation.execute
    end
    suite_result.print_results
    suite_result.result
  end
  
  def expectations
    @expectations ||= []
  end
  
  def expect(expected, &block)
    self.expectations << Expectations::Expectation.new(expected, &block)
  end
end