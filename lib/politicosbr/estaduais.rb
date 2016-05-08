module PoliticosBR
  
  # Métodos para os estados
  
  # Paraná
  def self.deputados_estaduais_pr
    deputados = Array.new
    url = PoliticosBR::DEPS_ESTADUAIS[:pr]
    doc = Nokogiri::HTML(open(url))
    rows = doc.xpath('//ul/li')
    rows.each do |row|
      nome = row.at_xpath('span/a/text()').to_s.strip.upcase
      if (!nome.empty?) then
        politico = OpenStruct.new
        politico.tipo = 'deputado'
        politico.estado = 'PR'
        politico.nome = nome
        politico.url = row.at_xpath('span/a/@href').to_s.strip
        politico.partido = row.at_xpath('span/text()[normalize-space()]').to_s.strip

        docdetails = Nokogiri::HTML(open(politico.url))
        politico.fones = docdetails.xpath('//div[contains(@class, "redes")]/p[3]/text()[normalize-space()]').to_s.strip
        politico.email = Rot13.rotate(docdetails.xpath('//div[contains(@class, "redes")]/p[4]/a/text()[normalize-space()]').to_s.strip)
        
        deputados.push(politico)
      end
    end
    deputados
  end  
  
  # Rio Grande do Sul
  def self.deputados_estaduais_rs
    deputados = Array.new
    url = PoliticosBR::DEPS_ESTADUAIS[:rs]
    doc = Nokogiri::HTML(open(url))
    rows = doc.xpath('//div[contains(@id, "dnn_ctr657_ModuleContent")]/div')
    rows.each do |row|
      politico = OpenStruct.new
      politico.tipo = 'deputado'
      politico.estado = 'RS'
      politico.nome = row.at_xpath('a/text()').to_s.strip.upcase
      politico.partido = row.at_xpath('span[1]/text()').to_s.strip
      politico.email = row.at_xpath('span[2]/text()').to_s.strip
      politico.fones = row.at_xpath('span[3]/text()').to_s.strip
      deputados.push(politico)
    end
    deputados
  end
  
  # Santa Catarina
  def self.deputados_estaduais_sc
    deputados = Array.new
    url = PoliticosBR::DEPS_ESTADUAIS[:sc]
    doc = Nokogiri::HTML(open(url))
    rows = doc.xpath('//table/tbody/tr')
    rows.each do |row|
      politico = OpenStruct.new
      politico.tipo = 'deputado'
      politico.estado = 'SC'
      politico.nome = row.at_xpath('td[1]/span/a/text()').to_s.strip.upcase
      politico.partido = row.at_xpath('td[2]/text()').to_s.strip
      politico.email = row.at_xpath('td[3]/div/ul/li/p/a/text()').to_s.strip
      politico.fones = row.at_xpath('td[5]/ul/li/p/text()').to_s.strip
      deputados.push(politico)
    end
    deputados    
  end
  
end
