module Mocha
  class Mock
    attr_reader :expectations
    alias to_receive expects
  end
  class ExpectationList
    attr_reader :expectations
  end
end