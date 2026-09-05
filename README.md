web-automation-ruby-capybara 🐹

Projeto de QA (teste automatizado) em Ruby, utilizando Cucumber, Capybara, SitePrism e Selenium WebDriver, com cenários escritos em BDD (Gherkin, em português).

Os testes cobrem o fluxo de login e carrinho de compras do site de demonstração SauceDemo.

🛠️ Tecnologias
Ruby
Cucumber — cenários em Gherkin (BDD)
Capybara — automação de interações web
SitePrism — padrão Page Object
Selenium WebDriver — driver do navegador (Chrome)
RSpec — asserções (expect)
Pry — debug interativo
📁 Estrutura do projeto
.
├── features/
│   ├── login.feature                    # Cenários em Gherkin (login e carrinho)
│   ├── pages/
│   │   ├── login_page.rb                # Page Object da tela de login
│   │   └── inventory_page.rb            # Page Object da tela de produtos
│   ├── step_definitions/
│   │   └── login_steps.rb               # Implementação dos steps em Ruby
│   └── support/
│       ├── env.rb                       # Configuração do Capybara/Selenium
│       ├── hooks.rb                     # Hooks Before/AfterStep (evidências em print)
│       └── utils_custom_methods.rb      # Métodos utilitários (ex: criação de diretórios)
├── .github/workflows/
│   └── ruby-tests.yml                   # Pipeline de CI (GitHub Actions)
├── Gemfile
└── Gemfile.lock
✅ Pré-requisitos
Ruby 3.0+ (recomendado 3.3, mesma versão usada no CI)
Bundler
Google Chrome instalado (o Selenium usa o ChromeDriver correspondente)
🚀 Instalação
bash
# Clone o repositório
git clone https://github.com/danielfsantos/web-automation-ruby-capybara.git
cd web-automation-ruby-capybara

# Instale as dependências
bundle install
▶️ Executando os testes

Rodar toda a suíte:

bash
bundle exec cucumber

Rodar apenas cenários com uma tag específica (ex: apenas os de fumaça):

bash
bundle exec cucumber --tags @smoke

Outras tags disponíveis: @login, @negativo, @carrinho.

Rodar em modo headless (sem abrir o navegador), útil para CI ou máquinas sem interface gráfica:

bash
HEADLESS=true bundle exec cucumber
🧪 Cenários cobertos
Tag	Cenário
@login @smoke	Login com credenciais válidas
@login @negativo	Login com usuário bloqueado (locked_out_user)
@carrinho	Adicionar produto ao carrinho de compras
📸 Evidências de execução

A cada passo do teste, um screenshot é automaticamente salvo na pasta:

evidencias/<nome_do_cenario>/<numero>.png

Isso é feito pelo hook AfterStep em features/support/hooks.rb, facilitando a análise de falhas e a documentação da execução.

🔄 Integração Contínua (CI)

O projeto conta com um workflow do GitHub Actions (.github/workflows/ruby-tests.yml) que, a cada push ou pull request nas branches main/master:

Faz checkout do código
Configura o Ruby 3.3
Instala o Google Chrome e o ChromeDriver
Executa a suíte com bundle exec cucumber em modo HEADLESS
👤 Autor

Daniel Santos github.com/danielfsantos

📄 Licença

Este projeto não possui uma licença definida. Caso deseje reutilizá-lo, entre em contato com o autor.
