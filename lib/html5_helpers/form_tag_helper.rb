module Html5Helpers
  module FormTagHelper

    def self.install
      ActionView::Helpers::TagHelper::BOOLEAN_ATTRIBUTES.merge(['required', :required])
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
      if range = options.delete("in") || options.delete("within")
        options.update("min" => range.min, "max" => range.max)
      end
      text_field_tag(name, value, options)
    end

    # Creates a range form element.
    #
    # ==== Options
    # * Accepts the same options as number_field_tag.
    def range_field_tag(name, value = nil, options = {})
      number_field_tag(name, value, options.stringify_keys.update("type" => "range"))
    end
  end
end