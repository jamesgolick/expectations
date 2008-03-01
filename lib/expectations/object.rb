class Object
  def to_receive(method)
    Expectations::MockRecorder.new(self, method)
  end
  
  def to_delegate(method)
    Expectations::DelegateRecorder.new(self, method)
  end
  
  def to
    Expectations::PositiveStateBasedRecorder.new(self)
  end
  
  def not
    Expectations::NegativeStateBasedRecorder.new(self)
  end
  
  def expectations_equal_to(other)
    self == other
  end

  unless defined? instance_exec # 1.9
    module InstanceExecMethods #:nodoc:
    end
    include InstanceExecMethods

    # Evaluate the block with the given arguments within the context of
    # this object, so self is set to the method receiver.
    #
    # From Mauricio's http://eigenclass.org/hiki/bounded+space+instance_exec
    def instance_exec(*args, &block)
      begin
        old_critical, Thread.critical = Thread.critical, true
        n = 0
        n += 1 while respond_to?(method_name = "__instance_exec#{n}")
        InstanceExecMethods.module_eval { define_method(method_name, &block) }
      ensure
        Thread.critical = old_critical
      end

      begin
        send(method_name, *args)
      ensure
        InstanceExecMethods.module_eval { remove_method(method_name) } rescue nil
      end
    end
  end
end
