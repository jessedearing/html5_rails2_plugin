module Html5Helpers
  module TemporalValues

    protected

    def as_html5_datetime(value)
      if value.respond_to?(:utc)
        value = value.utc
      end
      strftime_or_default value, '%Y-%m-%dT%H:%M:%SZ'
    end

    def as_html5_date(value)
      strftime_or_default value, '%Y-%m-%d'
    end

    def as_html5_time(value)
      strftime_or_default value, '%H:%M:%S'
    end

    def as_html5_month(value)
      strftime_or_default value, '%Y-%m'
    end

    def as_html5_week(value)
      strftime_or_default value, '%Y-W%W'
    end

    def as_html5_datetime_local(value)
      if value.respond_to?(:local)
        value = value.local
      end
      strftime_or_default value, '%Y-%m-%dT%H:%M:%S'
    end

    def strftime_or_default(value, pattern)
      if value.respond_to?(:strftime)
        value = value.strftime(pattern)
      else
        value.to_s
      end
    end

  end
end
