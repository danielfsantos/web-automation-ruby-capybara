class LoginPage < SitePrism::Page
  set_url $URL

  element :username_field, '#user-name'
  element :password_field, '#password'
  element :login_button, '#login-button'
  element :error_message, "[data-test='error']"
end
