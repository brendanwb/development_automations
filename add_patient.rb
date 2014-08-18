require 'rubygems'
require 'watir-webdriver'
require 'faker'

opt_out = ARGV[0]

browser = Watir::Browser.new :ff
browser.window.maximize

browser.goto "http://wellbe.dev/"
browser.text_field(id: "user_email").set('nancy@lange.com')
browser.text_field(id: "user_password").set('testing')
browser.form(id: "new_user").submit

browser.link(href: "/enrollment/").click

# check unknown record
browser.div(class: "field unknown-record-number-field").
  checkbox(class: "ember-view ember-checkbox").set

# fill in an email
browser.div(class: "form-row email-field").
  text_field(class: "ember-view ember-text-field").set(Faker::Internet.safe_email)

# find the field ids for the first and last name fields
ids = browser.text_fields.map do |field|
  field.id
end.slice(2..-2)
# fill in the first and last name fields
ids.each do |id|
  browser.text_field(id: id).set(Faker::Name.name)
end

if opt_out
  # check the optted out checkbox
  browser.div(class: "form-row actions").
    checkbox(class: "ember-view ember-checkbox").set
end

# select a doctor
browser.select_list(class: "ember-view ember-select").select("Smith")
