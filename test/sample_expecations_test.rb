require File.dirname(__FILE__) + "/test_helper"

Expectations do
  expect 2 do
    1 + 1
  end
  
  expect NoMethodError do
    Object.no_method
  end

end