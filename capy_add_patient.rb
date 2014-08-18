require 'capybara'
session = Capybara::Session.new(:selenium)
window = session.driver.browser.manage.window
window.resize_to(1024, 768)
session.visit "http://wellbe.dev/"


session.fill_in('user_email', with: 'nancy@lange.com')
session.fill_in('Password', with: 'testing')
session.click_on('Login')

session.click_on('Add Patient')

session.find(:xpath, "(//input[@type='checkbox'])[1]").click
session.fill_in('First Name', with: 'John')
session.fill_in('Last Name', with: 'Doe')
session.fill_in('Email', with: 'johndoe1234@wellbe.me')
session.find(:xpath, "(//input[@type='checkbox'])[2]").click
session.select("Smith", from: 'Attending Doctor')
session.select("Spine Surgery", from: 'Procedure')
session.fill_in("Surgery Date", with: 'June 03 2014')
session.click_on('Next')
session.click_on('Next')
session.click_on('Submit')
#rep_1 = session.find(:xpath, "(//input[@type='checkbox'])[1]")
#session.click_on('ADD ANOTHER')
#rep_1.click
#rep_2 = session.find(:xpath, "(//input[@type='checkbox'])[2]")
#rep_2.click
sleep 25
