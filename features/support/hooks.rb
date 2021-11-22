# frozen_string_literal: true

Before do
    @app = App.new
  end

After do |scenario|
    add_screenshot(scenario)
 end

 def add_screenshot(scenario)
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
    nome_cenario = nome_cenario.gsub(' ','_').downcase!
    screenshot = "log/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
 end

at_exit do
    info = { Environment: 'Projeto Automação', Date: Time.now.strftime("%d/%m/%Y %H:%M"), 
        Testers: 'Vinicius Araujo, Rafael Sena, Pedro Augusto, Júlio César, Felipe Bezerra, Carlos Correia' }
    ReportBuilder.configure do |config|
        config.json_path = 'report.json'
        config.report_path = 'cucumber_web_report'
        config.report_types = [:html]
        config.report_tabs = %w[Overview Features Scenarios Errors]
        config.report_title = 'Cucumber Report Builder web automation test results'
        config.compress_images = false
        config.additional_info = info
        config.color = 'blue'
    end
    ReportBuilder.build_report
end
