module Expectations::Results
  module ClassMethods
    def char(arg)
      define_method :char do
        arg
      end
    end

    def passed?(arg)
      define_method :passed? do
        arg
      end
    end
  end
end

module Expectations::Results
  class Failure
    extend Expectations::Results::ClassMethods
    char "F"
    passed? false
  end
end

module Expectations::Results
  class Success
    extend Expectations::Results::ClassMethods
    char "."
    passed? true
  end
end

module Expectations::Results
  class Error
    extend Expectations::Results::ClassMethods
    char "E"
    passed? false
  end
end