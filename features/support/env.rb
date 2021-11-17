# frozen_string_literal: true

# gems
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'site_prism'
require 'report_builder'
require 'site_prism'

# Registrando o driver
Capybara.register_driver :site_prism do |app|
    Capybara::Selenium::Driver.new(app, browser:  :firefox)
  end

Capybara.configure do |config|
    config.app_host = 'http://automationpractice.com/index.php?controller=authentication&back=my-account'
    config.run_server = false
    Capybara.default_driver = :site_prism
    Capybara.current_session.driver.browser.manage.window.maximize
    config.default_max_wait_time = 10
    config.default_selector = :css
    config.ignore_hidden_elements = false
end


