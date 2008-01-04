module Expectations::Results
  def initialize(file, line)
    self.line, self.file = line, file
  end
  
  def fulfilled?
    self.is_a?(Expectations::Results::Fulfilled)
  end
  
  def self.included(klass)
    klass.extend ClassMethods
  end
  
  module ClassMethods
    def char(arg)
      define_method :char do
        arg
      end
    end
  end
end

module Expectations::Results
  module StateBasedFailure
    include Expectations::Results
    char "F"
    def message 
      result = "expected: <#{expected.inspect}> got: <#{actual.inspect}>"
      result += "\nstring details: #{expected.diff(actual)}" if expected.is_a?(String) && actual.is_a?(String)
    end
  end
end

module Expectations::Results
  module BehaviorFailure
    attr_accessor :message
    include Expectations::Results
    char "F"
  end
end

module Expectations::Results
  module Fulfilled
    include Expectations::Results
    char "."
  end
end

module Expectations::Results
  module BehaviorBasedError
    attr_accessor :exception, :message
    include Expectations::Results
    char "E"
  end
end

module Expectations::Results
  module StateBasedError
    attr_accessor :exception, :message
    include Expectations::Results
    char "E"
  end
end