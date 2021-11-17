# frozen_string_literal: true

class Comprar < SitePrism::Page
    set_url '/'
    element :input_email, '#email'
    element :input_password, '#passwd'
    element :alert, '#center_column > div.alert.alert-danger > ol > li'
    element :barra_pesquisa, '#search_query_top'
    element :submit_pesquisa, 'button[name="submit_search"]'
    element :link_produto, '.right-block > h5:nth-child(1) > a:nth-child(1)'
    element :adicionar_produto, 'button[class="exclusive"]'
    element :checkout_button, 'a.btn:nth-child(2)'
    element :checkout_confirm, '.standard-checkout'
    element :checkout_confirm_endereco, 'button.button:nth-child(4)'
    element :entrega_checkbox, '#cgv'
    element :checkout_confirm_entrega, 'button.button:nth-child(4)'
    element :forma_pagamento, '.bankwire'
    element :confirmar_pagamento, 'button.button-medium'
    element :message_complete, '.cheque-indent > strong:nth-child(1)'
  
    def login(email, senha)
      input_email.send_keys(email)
      input_password.send_keys(senha)
      click_button "Sign in"
      sleep 2
    end
    
    def mensagem_alerta 
      alert.text
    end

    def pesquisar(roupa)
      barra_pesquisa.send_keys(roupa)
      submit_pesquisa.click
    end

    def selecionar
      link_produto.click
    end

    def adicionar_carrinho
      adicionar_produto.click
      checkout_button.click
      checkout_confirm.click
      checkout_confirm_endereco.click
    end

    def checkout_confirmar
      entrega_checkbox.set(true)
      checkout_confirm_entrega.click
    end

    def finalizar_compra
      forma_pagamento.click
      confirmar_pagamento.click
    end

    def finalizou_message
      message_complete
    end
  
  end