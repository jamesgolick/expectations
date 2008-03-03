module Expectations::PositiveStateBasedRecorder

  def verify
    method_stack.inject(subject) { |result, element| result.send element.first, *element.last }
  end
  
  def __negate__
    extend Expectations::NegativeStateBasedRecorder
  end
  
  def message
    "expected #{subject} to #{@message_parts.join(" ")}"
  end

end