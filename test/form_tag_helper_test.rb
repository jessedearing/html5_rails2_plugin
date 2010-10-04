require File.expand_path('../test_helper', __FILE__)

Html5Helpers::FormTagHelper.install

describe Html5Helpers::FormTagHelper do

  attr_accessor :subject, :helper

  before do
    self.helper = Class.new do
      include ::ActionView::Helpers::TagHelper
      include ::ActionView::Helpers::FormTagHelper
      include ::Html5Helpers::FormTagHelper
    end.new
  end

  describe '#search_field_tag' do
    before do
      self.subject = helper.search_field_tag(:query, 'why', :required => true)
    end
    it_must_create_an_input_of_type 'search'
    it_must_create_an_input_with_name 'query'
    it_must_set_the_value_to 'why'
    it_must_set_the_required_flag
  end

  describe '#telephone_field_tag' do
    before do
      self.subject = helper.telephone_field_tag(:fax, '1234567890')
    end
    it_must_create_an_input_of_type 'tel'
    it_must_create_an_input_with_name 'fax'
    it_must_set_the_value_to '1234567890'
    it_must_not_set_the_required_flag
  end

  describe '#url_field_tag' do
    before do
      self.subject = helper.url_field_tag(:home_page, 'http://example.org', :required => true)
    end
    it_must_create_an_input_of_type 'url'
    it_must_create_an_input_with_name 'home_page'
    it_must_set_the_value_to 'http://example.org'
    it_must_set_the_required_flag
  end

  describe '#email_field_tag' do
    before do
      self.subject = helper.email_field_tag(:email, 'me@example.com')
    end
    it_must_create_an_input_of_type 'email'
    it_must_create_an_input_with_name 'email'
    it_must_set_the_value_to 'me@example.com'
    it_must_not_set_the_required_flag
  end

  describe '#number_field_tag' do
    before do
      self.subject = helper.number_field_tag(:quantity, 14)
    end
    it_must_create_an_input_of_type 'number'
    it_must_create_an_input_with_name 'quantity'
    it_must_set_the_value_to '14'
  end

  describe '#range_field_tag' do
    before do
      self.subject = helper.range_field_tag(:likelihood, 50, :within => 0..100)
    end
    it_must_create_an_input_of_type 'range'
    it_must_create_an_input_with_name 'likelihood'
    it_must_set_the_value_to '50'
    it_must_set_the_min_to '0'
    it_must_set_the_max_to '100'
  end

end

