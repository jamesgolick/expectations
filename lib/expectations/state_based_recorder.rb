class Expectations::StateBasedRecorder
  attr_reader :subject
  def initialize(subject)
    @subject = subject
    @message_parts = []
  end
  
  def have
    @message_parts << "have"
    self
  end
  
  def be
    @message_parts << "be"
    self
  end
  
  def message
    @message_parts.join(" ")
  end
  
  def method_stack
    @method_stack ||= []
  end
  
  def method_missing(sym, *args)
    @message_parts << "#{sym}"
    args.each { |arg| @message_parts << arg.inspect }
    method_stack << [sym, args]
    self
  end
  
end