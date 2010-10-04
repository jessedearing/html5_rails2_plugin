require 'action_view/helpers/form_helper'

module Html5Helpers
  module FormHelper
    # Returns a text_field of type "search".
    def search_field(object_name, method, options = {})
      options = options.stringify_keys

      if options["autosave"]
        if options["autosave"] == true
          options["autosave"] = request.host.split(".").reverse.join(".")
        end
        options["results"] ||= 10
      end

      if options["onsearch"]
        options["incremental"] = true unless options.has_key?("incremental")
      end

      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag("search", options)
    end

    # Returns a text_field of type "tel".
    def telephone_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag("tel", options)
    end
    alias phone_field telephone_field

    # Returns a text_field of type "url".
    def url_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag("url", options)
    end

    # Returns a text_field of type "email".
    def email_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag("email", options)
    end

    # Returns an input tag of type "number".
    #
    # ==== Options
    # * Accepts same options as number_field_tag
    def number_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag("number", options)
    end

    # Returns an input tag of type "range".
    #
    # ==== Options
    # * Accepts same options as range_field_tag
    def range_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag("range", options)
    end
  end

  class InstanceTag < ::ActionView::Helpers::InstanceTag
    include Html5Helpers::RangeOptionParsing
    def to_input_field_tag(type, options = {})
      super(type, parse_range_options(options))
    end
  end

  class FormBuilder < ::ActionView::Helpers::FormBuilder
    #this was based on the ::ActionView::Helpers::FormBuilder class in the Rails code
    FormHelper.instance_methods.each do |selector|
      src, line = <<-end_src, __LINE__ + 1
        def #{selector}(method, options = {})  # def text_field(method, options = {})
          @template.send(                      #   @template.send(
            #{selector.inspect},               #     "text_field",
            @object_name,                      #     @object_name,
            method,                            #     method,
            objectify_options(options))        #     objectify_options(options))
        end                                    # end
      end_src
      class_eval src, __FILE__, line
    end
    
    # Adds the methods to the field_helpers which is part of the "magic" that helps render the tag
    # This was the key I was missing that was handled in the Rails code
    self.field_helpers << FormHelper.instance_methods
  end
end