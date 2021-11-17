#language: pt

Funcionalidade: Fluxo de Comprar

  Cenario: Comprar
    Dado que estou na pagina de login
    E eu faço login com "ava2nassau@gmail.com" e "Teste123."
    Então devo ver "My account" na área logada
    Quando Pesquiso o item "Faded Short Sleeve T-shirts"
    E seleciono o item pesquisado
    Então adiciono o produto no carrinho e confiro o checkout
    Quando confiro as opcoes de entrega e concordo
    Então seleciono minha forma de pagamento e finalizo a compra
    E devo ver "Your order on My Store is complete." no final