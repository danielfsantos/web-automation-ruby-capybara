login_page = LoginPage.new
inventory_page = InventoryPage.new

Dado(/^que estou na pagina de login do saucedemo$/) do
  login_page.load
end

Quando(/^informo o usuario "([^"]*)" e a senha "([^"]*)"$/) do |usuario, senha|
  login_page.username_field.set(usuario)
  login_page.password_field.set(senha)
end

Quando(/^clico no botao de login$/) do
  login_page.login_button.click
end

Então(/^a pagina de produtos e exibida com sucesso$/) do
  expect(inventory_page).to have_page_title
  expect(inventory_page.page_title.text).to eq('Products')
end

Então(/^a mensagem de erro "([^"]*)" e exibida$/) do |mensagem_esperada|
  expect(login_page).to have_error_message
  expect(login_page.error_message.text).to include(mensagem_esperada)
end

Dado(/^que estou logado no saucedemo como "([^"]*)"$/) do |usuario|
  login_page.load
  login_page.username_field.set(usuario)
  login_page.password_field.set('secret_sauce')
  login_page.login_button.click
end

Quando(/^adiciono o produto "([^"]*)" ao carrinho$/) do |nome_produto|
  inventory_page.add_product_to_cart(nome_produto)
end

Então(/^o carrinho exibe (\d+) item$/) do |quantidade|
  expect(inventory_page).to have_cart_badge
  expect(inventory_page.cart_badge.text).to eq(quantidade)
end
