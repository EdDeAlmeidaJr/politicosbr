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