module Expectations
end

def Expectations(&block)
  begin
    Expectations::SuiteRunner.instance.suite_eval &block
  rescue
    Expectations::SuiteRunner.instance.do_not_run
  end
end

require 'rubygems'
require 'mocha'
require 'mocha/standalone'
require 'singleton'
require 'benchmark'
require 'erb'
require 'fileutils'
require File.expand_path(File.dirname(__FILE__) + '/expectations/object')
require File.expand_path(File.dirname(__FILE__) + '/expectations/regexp')
require File.expand_path(File.dirname(__FILE__) + '/expectations/range')
require File.expand_path(File.dirname(__FILE__) + '/expectations/module')
require File.expand_path(File.dirname(__FILE__) + '/expectations/string')
require File.expand_path(File.dirname(__FILE__) + '/expectations/mocha')
require File.expand_path(File.dirname(__FILE__) + '/expectations/suite')
require File.expand_path(File.dirname(__FILE__) + '/expectations/suite_runner')
require File.expand_path(File.dirname(__FILE__) + '/expectations/suite_results')
require File.expand_path(File.dirname(__FILE__) + '/expectations/expectation')
require File.expand_path(File.dirname(__FILE__) + '/expectations/behavior_based_expectation')
require File.expand_path(File.dirname(__FILE__) + '/expectations/state_based_expectation')
require File.expand_path(File.dirname(__FILE__) + '/expectations/mock_recorder')
require File.expand_path(File.dirname(__FILE__) + '/expectations/results')