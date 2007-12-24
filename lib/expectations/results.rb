class Object
  def metaclass
    class << self; self; end
  end
end

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
    
    def extended(klass)
      mod = self
      klass.metaclass.class_eval do
        define_method :status do
          mod.name.split(/::/).last.downcase.to_sym
        end
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