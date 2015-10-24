require 'http'
require 'roo-xls'

class PoliticosBR
 
  def self.deputados 
    ssheet = HTTP.get('http://www.camara.gov.br/internet/deputado/deputado.xls')
    planilha = ssheet.to_s
    arq = File.open("deputados.xls","w")
    arq.write(planilha)
    arq.close
    file_basename = File.basename("deputados.xls", ".xls") 
    xls = Roo::Excel.new("deputados.xls")
    xls.to_csv("#{file_basename}.csv")
    x = Array.new
    File.readlines("#{file_basename}.csv").each do |linha|
      campos = linha.split(",")
      campos.each do |campo|
        if campo.index("@")
          p1 = campo.slice(1,campo.length)
          p2 = p1.slice(0,p1.length-1)
          x.push(p2)
        end
      end
    end
    x
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
    x
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
