require 'rubygems'
require 'bundler'
Bundler.setup

require 'minitest/spec'
require 'minitest/mock'
require 'action_controller/assertions/selector_assertions'
require 'action_controller/vendor/html-scanner' # for HTML::Document
require 'active_support'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/form_tag_helper'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'form_test_macros'
require 'html5_helpers'
require 'post'

class MiniTest::Unit::TestCase

  include ::ActionController::Assertions::SelectorAssertions
  extend FormTestMacros

  def assert_select_in(html, *args, &block)
    assert_select(*args.unshift(::HTML::Document.new(html).root), &block)
  end

end

MiniTest::Unit.autorun
