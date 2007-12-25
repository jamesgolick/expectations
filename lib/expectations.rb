module Expectations
end

def Expectations(&block)
  Expectations::SuiteRunner.instance.suite_eval &block
end

require 'rubygems'
require 'mocha'
require 'mocha/standalone'
require 'singleton'
require 'benchmark'
require File.expand_path(File.dirname(__FILE__) + '/expectations/object')
require File.expand_path(File.dirname(__FILE__) + '/expectations/mocha')
require File.expand_path(File.dirname(__FILE__) + '/expectations/suite')
require File.expand_path(File.dirname(__FILE__) + '/expectations/suite_runner')
require File.expand_path(File.dirname(__FILE__) + '/expectations/suite_results')
require File.expand_path(File.dirname(__FILE__) + '/expectations/expectation')
require File.expand_path(File.dirname(__FILE__) + '/expectations/results')