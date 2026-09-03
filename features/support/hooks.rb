require 'pry'
$URL = "https://www.saucedemo.com/"
DIR_EVIDENCIAS_BASE = File.join(Dir.pwd + "/evidencias")
$utilities = UtilsCustomMethods.new

Before do |scenario|
  @dir_evidencias_cenario = File.join(DIR_EVIDENCIAS_BASE, scenario.name)
  $utilities.create_directory @dir_evidencias_cenario
  @screen = 1
end

AfterStep do |scenario|
   screenshot = File.join(@dir_evidencias_cenario, "#{@screen}.png")
   page.driver.browser.save_screenshot screenshot
   @screen += 1 
end