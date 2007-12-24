module Expectations::Results
  def fulfilled?
    self.is_a?(Expectations::Results::Fulfilled)
  end
  
  def status
    self.class.name.split(/::/).last.downcase.to_sym
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
  class Failure
    include Expectations::Results
    char "F"
  end
end

module Expectations::Results
  class Fulfilled
    include Expectations::Results
    char "."
  end
end

module Expectations::Results
  class Error
    include Expectations::Results
    char "E"
  end
end