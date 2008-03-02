class Expectations::PositiveStateBasedRecorder < Expectations::StateBasedRecorder

  def verify
    method_stack.inject(subject) { |result, element| result.send element.first, *element.last }
  end

end