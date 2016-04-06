require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'roo-xls'

module PoliticosBR
 
  def self.deputados 
    camara = Array.new
    ssheet = HTTParty.get('http://www.camara.gov.br/internet/deputado/deputado.xls')
    planilha = ssheet.to_s
    planilha.force_encoding('UTF-8')
    arq = File.open('deputados.xls','w')
    arq.write(planilha)
    arq.close
    file_basename = File.basename('deputados.xls', '.xls') 
    xls = Roo::Excel.new('deputados.xls')
    xls.to_csv("#{file_basename}.csv")
    x = Array.new
    File.readlines("#{file_basename}.csv").each do |linha|
      campos = linha.split(',')
      campos.each_index { |i|
        campos[i] = campos[i].delete '"'
      }
      deputado = Hash.new
      deputado[:nome] = campos[0]
      deputado[:partido] = campos[1]
      deputado[:estado] = campos[2]
      deputado[:mandato] = ''
      deputado[:fones] = '(61) ' + campos[11] + ' |  (61) ' + campos[12]
      deputado[:email] = campos[15]
      camara.push(deputado)
    end
    camara.shift
    camara
  end

  def self.senadores
    keys = [ :nome, :partido, :estado, :mandato, :fones, :email ]
    senado = Array.new
    senador = Hash.new
    doc = Nokogiri::HTML(open('http://www25.senado.leg.br/web/senadores/em-exercicio/-/e/por-nome'))
    tds = doc.xpath('//td').to_a
    tds.each_index{ |i|
      rem = i % 6
      if (rem == 0) then
        if (!senador.empty?) then
          senado.push(senador)
        end
        senador = Hash.new
      end
      senador[keys[rem]] = tds[i].content
    }
    senado
  end
  
  def self.todos
    x = senadores
    y = deputados
    y.each do |p|
      x.push(p)
    end
    x
  end
  
end
