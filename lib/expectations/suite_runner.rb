class Expectations::SuiteRunner
  include Singleton
  attr_accessor :suite
  
  def initialize
    self.suite = Expectations::Suite.new
    at_exit do
      exit 1 unless suite.execute
    end
  end
  
  def suite_eval(&block)
    self.suite.instance_eval &block
  end
end
