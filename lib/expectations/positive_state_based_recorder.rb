module Expectations::PositiveStateBasedRecorder

  def verify
    method_stack.inject(subject) { |result, element| result.send element.first, *element.last }
  end
    
  def message
    "expected #{subject} #{@message_parts.join(" ")}"
  end

end