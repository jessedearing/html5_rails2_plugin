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
    
    # Returns an input tag of type "datetime". The value should respond to :strftime or be a String
    # of the format '%Y-%m-%dT%H:%M:%SZ' in order to conform to the HTML5 specification.
    def datetime_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag('datetime', options)
    end

    # Returns an input tag of type "date". The value should respond to :strftime or be a String
    # of the format '%Y-%m-%d' in order to conform to the HTML5 specification.
    def date_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag('date', options)
    end

    # Returns an input tag of type "month". The value should respond to :strftime or be a String
    # of the format '%Y-%m' in order to conform to the HTML5 specification.
    def month_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag('month', options)
    end

    # Returns an input tag of type "week". The value should respond to :strftime or be a String
    # of the format '%Y-W%W' in order to conform to the HTML5 specification.
    def week_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag('week', options)
    end

    # Returns an input tag of type "time". The value should respond to :strftime or be a String
    # of the format '%H:%M:%S' in order to conform to the HTML5 specification.
    def time_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag('time', options)
    end

    # Returns an input tag of type "datetime-local". The value should respond to :strftime or be a String
    # of the format '%Y-%m-%dT%H:%M:%S' in order to conform to the HTML5 specification.
    def datetime_local_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag('datetime-local', options)
    end

    # Returns an input tag of type "color".
    def color_field(object_name, method, options = {})
      options = options.stringify_keys
      InstanceTag.new(object_name, method, self, options.delete('object')).to_input_field_tag("color", options)
    end
  end

  class InstanceTag < ::ActionView::Helpers::InstanceTag
    include Html5Helpers::RangeOptionParsing
    include Html5Helpers::TemporalValues

    def to_input_field_tag(type, options = {})
      options['value'] ||= temporalize_value(type) unless type == 'file'
      super(type, parse_range_options(options))
    end

    protected

    def temporalize_value(type)
      value = value_before_type_cast(object)
      case type
      when 'datetime'
        value = as_html5_datetime(value)
      when 'date'
        value = as_html5_date(value)
      when 'month'
        value = as_html5_month(value)
      when 'week'
        value = as_html5_week(value)
      when 'time'
        value = as_html5_time(value)
      when 'datetime-local'
        value = as_html5_datetime_local(value)
      end
      value
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