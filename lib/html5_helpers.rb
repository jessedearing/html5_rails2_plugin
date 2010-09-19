require 'html5_helpers/form_helper'
require 'html5_helpers/form_tag_helper'

ActionView::Helpers::FormTagHelper.append_features Html5Helpers::FormTagHelper

class ::ActionView::Base
  include Html5Helpers::FormHelper
  cattr_accessor :default_form_builder
  self.default_form_builder = Html5Helpers::FormBuilder
end