module Html5Helpers
  module FormTagHelper

    include Html5Helpers::RangeOptionParsing

    def self.install
      ActionView::Helpers::TagHelper::BOOLEAN_ATTRIBUTES.merge(['required', :required, 'autofocus', :autofocus])
    end

    # Creates a text field of type "search".
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def search_field_tag(name, value = nil, options = {})
      text_field_tag(name, value, options.stringify_keys.update("type" => "search"))
    end

    # Creates a text field of type "tel".
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def telephone_field_tag(name, value = nil, options = {})
      text_field_tag(name, value, options.stringify_keys.update("type" => "tel"))
    end
    alias phone_field_tag telephone_field_tag

    # Creates a text field of type "url".
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def url_field_tag(name, value = nil, options = {})
      text_field_tag(name, value, options.stringify_keys.update("type" => "url"))
    end

    # Creates a text field of type "email".
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def email_field_tag(name, value = nil, options = {})
      text_field_tag(name, value, options.stringify_keys.update("type" => "email"))
    end

    # Creates a number field.
    #
    # ==== Options
    # * <tt>:min</tt> - The minimum acceptable value.
    # * <tt>:max</tt> - The maximum acceptable value.
    # * <tt>:in</tt> - A range specifying the <tt>:min</tt> and
    #   <tt>:max</tt> values.
    # * <tt>:step</tt> - The acceptable value granularity.
    # * Otherwise accepts the same options as text_field_tag.
    #
    # ==== Examples
    #   number_field_tag 'quantity', nil, :in => 1...10
    #   => <input id="quantity" name="quantity" min="1" max="9" />
    def number_field_tag(name, value = nil, options = {})
      options = options.stringify_keys
      options["type"] ||= "number"
      text_field_tag(name, value, parse_range_options(options))
    end

    # Creates a range form element.
    #
    # ==== Options
    # * Accepts the same options as number_field_tag.
    def range_field_tag(name, value = nil, options = {})
      number_field_tag(name, value, options.stringify_keys.update("type" => "range"))
    end

    # Creates a datetime form element. Value should respond to :strftime or be a String
    # of the format '%Y-%m-%dT%H:%M:%SZ' in order to conform to the HTML5 specification.
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def datetime_field_tag(name, value = nil, options = {})
      if value.respond_to?(:strftime)
        value = value.strftime('%Y-%m-%dT%H:%M:%SZ')
      end
      text_field_tag(name, value, options.stringify_keys.update('type' => 'datetime'))
    end

    # Creates a date form element. Value should respond to :strftime or be a String
    # of the format '%Y-%m-%d' in order to conform to the HTML5 specification.
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def date_field_tag(name, value = nil, options = {})
      if value.respond_to?(:strftime)
        value = value.strftime('%Y-%m-%d')
      end
      text_field_tag(name, value, options.stringify_keys.update('type' => 'date'))
    end

    # Creates a month form element. Value should respond to :strftime or be a String
    # of the format '%Y-%m' in order to conform to the HTML5 specification.
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def month_field_tag(name, value = nil, options = {})
      if value.respond_to?(:strftime)
        value = value.strftime('%Y-%m')
      end
      text_field_tag(name, value, options.stringify_keys.update('type' => 'month'))
    end

    # Creates a week form element. Value should respond to :strftime or be a String
    # of the format '%Y-W%W' in order to conform to the HTML5 specification.
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def week_field_tag(name, value = nil, options = {})
      if value.respond_to?(:strftime)
        value = value.strftime('%Y-W%W')
      end
      text_field_tag(name, value, options.stringify_keys.update('type' => 'week'))
    end

    # Creates a time form element. Value should respond to :strftime or be a String
    # of the format '%H:%M:%S' in order to conform to the HTML5 specification.
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def time_field_tag(name, value = nil, options = {})
      if value.respond_to?(:strftime)
        value = value.strftime('%H:%M:%S')
      end
        text_field_tag(name, value, options.stringify_keys.update('type' => 'time'))
    end

    # Creates a datetime-local form element. Value should respond to :strftime or be a String
    # of the format '%Y-%m-%dT%H:%M:%S' in order to conform to the HTML5 specification.
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def datetime_local_field_tag(name, value = nil, options = {})
      if value.respond_to?(:local)
        value = value.local
      end
      if value.respond_to?(:strftime)
        value = value.strftime('%Y-%m-%dT%H:%M:%S')
      end
      text_field_tag(name, value, options.stringify_keys.update('type' => 'datetime-local'))
    end

    # Creates a text field of type "color".
    #
    # ==== Options
    # * Accepts the same options as text_field_tag.
    def color_field_tag(name, value = nil, options = {})
      text_field_tag(name, value, options.stringify_keys.update("type" => "color"))
    end
  end
end