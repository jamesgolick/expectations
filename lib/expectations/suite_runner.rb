class Expectations::SuiteRunner
  include Singleton
  attr_accessor :suite, :runnable
  
  def initialize
    self.suite = Expectations::Suite.new
    self.runnable = false
    at_exit do
      exit 1 unless runnable && suite.execute
    end
  end
  
  def do_not_run
    self.runnable = false
  end
  
  def suite_eval(&block)
    self.suite.instance_eval &block
  end
end
