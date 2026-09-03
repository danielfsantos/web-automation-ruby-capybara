require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'

RSpec.configure do |config|
	config.include Capybara::DSL, :type => :request
  end

Capybara.register_driver :selenium do |app|
	options = Selenium::WebDriver::Options.chrome
	options.add_argument('--start-maximized')
	Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 15