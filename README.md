Html5Helpers
============

Html5Helpers allows you to use HTML5 specific tags in your Rails views.

The HTML5 form input types I've added are:

* search
* telephone
* number
* range
* email
* url

Installation
============
You just need to clone this repository in your plugin directory and restart your Rails instance

`cd rails_app/vendor/plugins
git clone git@github.com:jessedearing/html5_rails2_plugin.git html5-helpers
`

Example
=======

Using the __form_for__ helpers:

`<% form_for :person, @person, :url => url, :method => :post do |f| %>
<%= f.search_field :search %>
<%= f.telephone_field :phone %>
<%= f.number_field :number, :min => 0, :step => 1 %>
<%= f.range_field :range, :min => 0, :max => 10 %>
<%= f.email_field :email %>
<%= f.url_field :url %>
<% end %>`

Likewise the tag helpers are:

`<%= search_field_tag :search, "Search something..." %>
<%= telephone_field_tag :phone, "123-456-7890" %>
<%= number_field_tag :number, 5, :step => 1, :min => 0, :max => 10 %>
<%= range_field_tag :range, 5, :min => 0, :max => 10 %>
<%= email_field_tag :email, "person@email.com" %>
<%= url_field_tag :url, "http://github.com" %>`

Copyright (c) 2010 Jesse Dearing, released under the MIT license
