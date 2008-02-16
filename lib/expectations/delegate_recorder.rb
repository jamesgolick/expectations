class Expectations::DelegateRecorder
  attr_reader :klass, :subject, :meth
  def initialize(klass, meth)
    @klass, @subject_mock, @meth = klass, Mocha::Mock.new, meth
    @subject_mock.expects(meth).returns(:the_subjects_response)
  end
  
  def to(subject)
    @subject = subject
    self
  end
  
  def mock
    @klass.stubs(@subject).returns(@subject_mock)
    @klass
  end
  
  def verify(actual)
    @subject_mock.verify
    actual == :the_subjects_response
  end
end