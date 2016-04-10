require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'roo-xls'

module PoliticosBR
  DEPUTADOS_URL = 'http://www.camara.gov.br/internet/deputado/deputado.xls'
  SENADORES_URL = 'http://www25.senado.leg.br/web/senadores/em-exercicio/-/e/por-nome'

  def self.deputados
    deputados = Array.new

    source = HTTParty.get(DEPUTADOS_URL)

    tempfile = Tempfile.new('deputados.xls').tap do |f|
      f.write(source)
    end

    spreadsheet = Roo::Excel.new(tempfile.path, file_warning: :ignore)

    (2..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)

      deputado = OpenStruct.new
      deputado.tipo = 'deputado'
      deputado.nome = row[0]
      deputado.partido = row[1]
      deputado.estado = row[2]
      deputado.mandato = ''
      deputado.fones = "(61) #{row[11]} | (61) #{row[12]}"
      deputado.email = row[13]

      deputados.push(deputado)
    end

    deputados
  end

  def self.senadores
    senadores = Array.new

    doc = Nokogiri::HTML(open(SENADORES_URL))
    rows = doc.xpath('//table[@id="senadoresemexercicio-tabela-senadores"]/tbody/tr')

    rows.each do |row|
      senador = OpenStruct.new
      senador.tipo = 'senador'
      senador.nome = row.at_xpath('td[1]/a/text()').to_s.strip
      senador.partido = row.at_xpath('td[2]/text()').to_s.strip
      senador.estado = row.at_xpath('td[3]/text()').to_s.strip
      senador.mandato = row.at_xpath('td[4]/text()').to_s.strip
      senador.fones = row.at_xpath('td[5]/text()').to_s.strip
      senador.email = row.at_xpath('td[6]/text()').to_s.strip

      senadores.push(senador)
    end

    senadores
  end

  def self.todos
    all = deputados
    all.push(*senadores)

    all
  end
end
