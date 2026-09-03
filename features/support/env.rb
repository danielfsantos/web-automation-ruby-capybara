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
	if ENV['HEADLESS']
    # Configuração para GitHub Actions / Servidores CI (Linux sem GUI)
    options.add_argument('--headless=new')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
  else
    # Configuração para desenvolvimento local
    options.add_argument('--start-maximized')
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 15