module Expectations::NegativeStateBasedRecorder
  
  def verify
    not method_stack.inject(subject) { |result, element| result.send element.first, *element.last }
  end
  
  def message
    "expected #{subject} not to #{@message_parts.join(" ")}"
  end
  
end