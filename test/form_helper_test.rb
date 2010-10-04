require File.expand_path('../test_helper', __FILE__)

Html5Helpers::FormTagHelper.install

describe Html5Helpers::FormHelper do

  attr_accessor :subject, :helper, :post

  before do
    self.helper = Class.new do
      include ::Html5Helpers::FormHelper
    end.new
    self.post = Post.new({
      :text => 'some text',
      :author_email => 'sally@example.org',
      :short_url => 'http://link.ly/12bc',
      :summary_length => '30',
      :publish_date => Date.new(2004, 6, 15),
      :background_color => '#93f1dc'
    })
  end

  describe '#search_field' do
    before do
      self.subject = helper.search_field(:post, :text, :required => true, :object => post)
    end
    it_must_create_an_input_of_type 'search'
    it_must_create_an_input_with_id 'post_text'
    it_must_create_an_input_with_name 'post[text]'
    it_must_set_the_value_to 'some text'
    it_must_set_the_required_flag
  end

  describe '#email_field' do
    before do
      self.subject = helper.email_field(:post, :author_email, :object => post)
    end
    it_must_create_an_input_of_type 'email'
    it_must_create_an_input_with_id 'post_author_email'
    it_must_create_an_input_with_name 'post[author_email]'
    it_must_set_the_value_to 'sally@example.org'
  end

  describe '#url_field' do
    before do
      self.subject = helper.url_field(:post, :short_url, :object => post)
    end
    it_must_create_an_input_of_type 'url'
    it_must_create_an_input_with_id 'post_short_url'
    it_must_create_an_input_with_name 'post[short_url]'
    it_must_set_the_value_to 'http://link.ly/12bc'
  end

  describe '#number_field' do
    before do
      self.subject = helper.number_field(:post, :summary_length, :object => post, :within => 0..100)
    end
    it_must_create_an_input_of_type 'number'
    it_must_create_an_input_with_id 'post_summary_length'
    it_must_create_an_input_with_name 'post[summary_length]'
    it_must_set_the_value_to '30'
    it_must_set_the_min_to '0'
    it_must_set_the_max_to '100'
  end

  describe '#range_field' do
    before do
      self.subject = helper.range_field(:post, :summary_length, :object => post, :within => 0..100)
    end
    it_must_create_an_input_of_type 'range'
    it_must_create_an_input_with_id 'post_summary_length'
    it_must_create_an_input_with_name 'post[summary_length]'
    it_must_set_the_value_to '30'
    it_must_set_the_min_to '0'
    it_must_set_the_max_to '100'
  end

  describe '#date_field' do
    before do
      self.subject = helper.date_field(:post, :publish_date, :object => post)
    end
    it_must_create_an_input_of_type 'date'
    it_must_create_an_input_with_id 'post_publish_date'
    it_must_create_an_input_with_name 'post[publish_date]'
    it_must_set_the_value_to '2004-06-15'
  end

  describe '#month_field' do
    before do
      self.subject = helper.month_field(:post, :publish_date, :object => post)
    end
    it_must_create_an_input_of_type 'month'
    it_must_create_an_input_with_id 'post_publish_date'
    it_must_create_an_input_with_name 'post[publish_date]'
    it_must_set_the_value_to '2004-06'
  end

  describe '#week_field' do
    before do
      self.subject = helper.week_field(:post, :publish_date, :object => post)
    end
    it_must_create_an_input_of_type 'week'
    it_must_create_an_input_with_id 'post_publish_date'
    it_must_create_an_input_with_name 'post[publish_date]'
    it_must_set_the_value_to '2004-W24'
  end

  describe '#color_field' do
    before do
      self.subject = helper.color_field(:post, :background_color, :object => post)
    end
    it_must_create_an_input_of_type 'color'
    it_must_create_an_input_with_id 'post_background_color'
    it_must_create_an_input_with_name 'post[background_color]'
    it_must_set_the_value_to '#93f1dc'
  end

end
