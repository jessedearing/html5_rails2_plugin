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

  describe '#datetime_field_tag' do
    before do
      self.subject = helper.datetime_field_tag(:updated_at, Time.utc('2010', '09', '17', '04', '30', '27'))
    end
    it_must_create_an_input_of_type 'datetime'
    it_must_create_an_input_with_name 'updated_at'
    it_must_set_the_value_to '2010-09-17T04:30:27Z'
  end

  describe '#date_field_tag' do
    before do
      self.subject = helper.date_field_tag(:birthday, Date.parse('2009-01-12'))
    end
    it_must_create_an_input_of_type 'date'
    it_must_create_an_input_with_name 'birthday'
    it_must_set_the_value_to '2009-01-12'
  end

  describe '#month_field_tag' do
    before do
      self.subject = helper.month_field_tag(:expiry_month, Date.parse('2009-01-12'))
    end
    it_must_create_an_input_of_type 'month'
    it_must_create_an_input_with_name 'expiry_month'
    it_must_set_the_value_to '2009-01'
  end

  describe '#week_field_tag' do
    before do
      self.subject = helper.week_field_tag(:week, Date.parse('2009-01-12'))
    end
    it_must_create_an_input_of_type 'week'
    it_must_create_an_input_with_name 'week'
    it_must_set_the_value_to '2009-W02'
  end

  describe '#time_field_tag' do
    before do
      self.subject = helper.time_field_tag(:delivery_time, Time.utc('2010', '09', '17', '04', '30', '27'))
    end
    it_must_create_an_input_of_type 'time'
    it_must_create_an_input_with_name 'delivery_time'
    it_must_set_the_value_to '04:30:27'
  end

  describe '#datetime_local_field_tag' do
    before do
      self.subject = helper.datetime_local_field_tag(:preferred_contact_start_time, Time.local('2010', '09', '17', '04', '30', '27'))
    end
    it_must_create_an_input_of_type 'datetime-local'
    it_must_create_an_input_with_name 'preferred_contact_start_time'
    it_must_set_the_value_to '2010-09-17T04:30:27'
  end
  
  describe '#color_field_tag' do
    before do
      self.subject = helper.color_field_tag(:background_color, '#dddddd')
    end
    it_must_create_an_input_of_type 'color'
    it_must_create_an_input_with_name 'background_color'
    it_must_set_the_value_to '#dddddd'
  end
end
