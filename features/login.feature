#language: pt

Funcionalidade: Login no SauceDemo

  @login @smoke
  Cenario: Login com credenciais validas
    Dado que estou na pagina de login do saucedemo
    Quando informo o usuario "standard_user" e a senha "secret_sauce"
    E clico no botao de login
    Entao a pagina de produtos e exibida com sucesso

  @login @negativo
  Cenario: Login com usuario bloqueado
    Dado que estou na pagina de login do saucedemo
    Quando informo o usuario "locked_out_user" e a senha "secret_sauce"
    E clico no botao de login
    Entao a mensagem de erro "Epic sadface: Sorry, this user has been locked out." e exibida

  @carrinho
  Cenario: Adicionar produto ao carrinho
    Dado que estou logado no saucedemo como "standard_user"
    Quando adiciono o produto "Sauce Labs Backpack" ao carrinho
    Entao o carrinho exibe 1 item
