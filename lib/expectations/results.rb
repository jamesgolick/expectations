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
  module Failure
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
  module Error
    attr_accessor :exception
    include Expectations::Results
    char "E"
  end
end