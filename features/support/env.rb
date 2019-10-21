require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara/dsl'

@browser = ENV['BROWSER']

Capybara.configure do |config|
  @driver = case @browser
            when 'chrome'
              :selenium_chrome
            when 'firefox'
              :selenium
            when 'chrome_headless'
              :selenium_chrome_headless
            when 'firefox_headless'
              :selenium_headless
            end

  if @driver == :selenium
    Capybara.register_driver :selenium do |app|
      caps = Selenium::WebDriver::Remote::Capabilities.new(acceptInsecureCerts: true)
      Capybara::Selenium::Driver.new(
        app,
        desired_capabilities: caps
      )
    end
    config.app_host = ' ' # Add your site address to be tested between the single quotes
    config.default_driver = :selenium
    config.javascript_driver = :selenium
    config.default_max_wait_time = 20 # Adjust as your needs 
  elsif
    config.default_driver = @driver
    config.javascript_driver = @driver
    config.app_host = ' ' # Add your site address to be tested between the single quotes
    config.default_max_wait_time = 20 # Adjust as your needs
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
