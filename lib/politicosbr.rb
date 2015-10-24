require 'http'
require 'spreadsheet'

class PoliticosBR
 
  def self.deputados 
    ssheet = HTTP.get('http://www.camara.gov.br/internet/deputado/deputado.xls')
  end

  def self.senadores
    page_content = HTTP.get('http://www25.senado.leg.br/web/senadores/em-exercicio')
    spc = page_content.to_s
    spc.force_encoding("UTF-8")
    lista1 = spc.split
    x = Array.new
    lista1.each do |p|
      if p.index("@")
        p1 = p.slice(4,p.length)
        p2 = p1.slice(0,p1.length-5)
        x.push(p2)
      end
    end
    x.each do |myx|
      puts myx
    end
  end
  
end
