# a model for use in forms helpers and form builders

class Post
  attr_reader :id, :title, :text, :short_url, :summary_length, :publish_date, :background_color

  def initialize(options = {})
    @id, @title, @text, @short_url, @summary_length, @publish_date, @background_color = options[:id], options[:title], options[:text], options[:short_url], options[:summary_length], options[:publish_date], options[:background_color]
  end

  def id_before_type_cast
    @id
  end

  def save; @id = 1; end

  def new_record?; @id.nil? end

  def to_param; @id; end

  def name
    @id.nil? ? "new #{self.class.name.downcase}" : "#{self.class.name.downcase} ##{@id}"
  end

  def errors
    Class.new{
      def on(field); "can't be empty" if field == "title"; end
      def empty?() false end
      def count() 1 end
      def full_messages() [ "Title can't be empty" ] end
    }.new
  end
end
