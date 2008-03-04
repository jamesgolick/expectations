module Expectations::DelegateRecorder
  def delegate!(meth)
    @subject_mock = Mocha::Mock.new
    @meth = meth
    @subject_mock.expects(meth)
  end
  
  def to(receiver)
    @receiver = receiver
    self
  end
  
  def mock
    subject.stubs(@receiver).returns(@subject_mock)
    subject
  end
  
  def verify(actual)
    @subject_mock.verify
  end
end