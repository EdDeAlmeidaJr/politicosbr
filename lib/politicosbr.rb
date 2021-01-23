require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'roo-xls'
require 'rot13'

require 'politicosbr/deputados'

require 'politicosbr/constants'
require 'politicosbr/estaduais'
require 'politicosbr/vereadores'

module PoliticosBR

  def self.senadores
    senadores = Array.new

    doc = Nokogiri::HTML(open(PoliticosBR::SENADORES_URL))
    rows = doc.xpath('//table[@id="senadoresemexercicio-tabela-senadores"]/tbody/tr')

    rows.each do |row|
      politico = OpenStruct.new
      politico.tipo = 'senador'
      politico.nome = row.at_xpath('td[1]/a/text()').to_s.strip.upcase
      politico.partido = row.at_xpath('td[2]/text()').to_s.strip
      politico.estado = row.at_xpath('td[3]/text()').to_s.strip
      politico.mandato = row.at_xpath('td[4]/text()').to_s.strip
      politico.fones = row.at_xpath('td[5]/text()').to_s.strip
      politico.email = row.at_xpath('td[6]/text()').to_s.strip

      senadores.push(politico)
    end

    senadores
  end

  def self.todos
    all = deputados
    all.push(*senadores)
    all
  end
  
  def self.deputados_estaduais(estado)
    method_name = "deputados_estaduais_#{estado}"
    method(method_name).call
  end
  
end
