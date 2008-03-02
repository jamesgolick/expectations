class Expectations::NegativeStateBasedRecorder < Expectations::StateBasedRecorder
  
  def to
    @message_parts << "to"
    self
  end
  
  def verify
    not method_stack.inject(subject) { |result, element| result.send element.first, *element.last }
  end
  
end