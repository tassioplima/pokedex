require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium/webdriver'

BROWSER = ENV['BROWSER']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")

Capybara.register_driver :selenium do |app|

  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app,
    :browser => :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => {
      prefs: { 'credentials_enable_service': false,
        'profile': {'password_manager_enabled': false}}
        })
        )
        end
end

Before do
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = CONFIG['url']
    Capybara.page.driver.browser.manage.window.maximize
  end
  Capybara.default_max_wait_time = 30
  Capybara.javascript_driver = :selenium
end

After do
  unless BROWSER.eql?('chrome')
    Capybara.current_session.driver.close
  end
end