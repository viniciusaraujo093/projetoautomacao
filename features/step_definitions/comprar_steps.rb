# frozen_string_literal: true

Dado('que estou na pagina de login') do
    @app.comprar.load
  end
  
  E("eu faço login com {string} e {string}") do |email, senha|
    @app.comprar.login(email, senha)
  end

  Então("devo ver a mensagem de alerta {string}") do |mensagem|                 
    expect(@app.comprar.mensagem_alerta).to include mensagem
  end

  Quando("Pesquiso o item {string}") do |roupa|
    @app.comprar.pesquisar(roupa)
  end

  E("seleciono o item pesquisado") do
    @app.comprar.selecionar
  end

  Então("adiciono o produto no carrinho e confiro o checkout") do                 
    @app.comprar.adicionar_carrinho
  end

  Quando("confiro as opcoes de entrega e concordo") do
    @app.comprar.checkout_confirmar
  end

  Então("seleciono minha forma de pagamento e finalizo a compra") do
    @app.comprar.finalizar_compra
  end

  E("devo ver {string} no final") do |expect_message|                 
    expect(@app.comprar.finalizou_message).to have_content expect_message
  end
                                                                           