module Html5Helpers
  # Handles parsing of :min, :max, :in, and :within options
  # on number and range inputs.
  module RangeOptionParsing
    protected

    # Parses range options.
    # @param [Hash] options the extra HTML parameters passed to a field or field_tag method
    # @return [Hash] a copy of the hash with :in and/or :within parsed into :min and :max
    def parse_range_options(options)
      options = options.stringify_keys
      if range = options.delete("in") || options.delete("within")
        options.merge!({ "min" => range.min, "max" => range.max })
      end
      options
    end
  end
end
