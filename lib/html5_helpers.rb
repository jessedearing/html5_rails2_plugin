module Html5Helpers
  autoload :FormHelper,         'html5_helpers/form_helper'
  autoload :FormTagHelper,      'html5_helpers/form_tag_helper'
  autoload :RangeOptionParsing, 'html5_helpers/range_option_parsing'
  autoload :TemporalValues,     'html5_helpers/temporal_values'

  def self.install
    ActionView::Helpers::FormTagHelper.append_features Html5Helpers::FormTagHelper
    Html5Helpers::FormTagHelper.install
    ::ActionView::Base.class_eval do
      include Html5Helpers::FormHelper
      cattr_accessor :default_form_builder
      self.default_form_builder = Html5Helpers::FormBuilder
    end
  end
end
