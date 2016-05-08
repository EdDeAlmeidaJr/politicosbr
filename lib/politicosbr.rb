require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'roo-xls'
require 'rot13'

require 'politicosbr/constants'
require 'politicosbr/estaduais'
require 'politicosbr/vereadores'

module PoliticosBR

  def self.deputados
    deputados = Array.new

    source = HTTParty.get(PoliticosBR::DEPUTADOS_URL)

    tempfile = Tempfile.new('deputados.xls').tap do |f|
      f.write(source.to_s.force_encoding('UTF-8'))
    end

    spreadsheet = Roo::Excel.new(tempfile.path, file_warning: :ignore)

    (2..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)

      politico = OpenStruct.new
      politico.tipo = 'deputado'
      politico.nome = row[0].upcase
      politico.partido = row[1]
      politico.estado = row[2]
      politico.mandato = ''
      politico.fones = "(61) #{row[11]} | (61) #{row[12]}"
      politico.email = row[13]

      deputados.push(politico)
    end

    deputados
  end

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
