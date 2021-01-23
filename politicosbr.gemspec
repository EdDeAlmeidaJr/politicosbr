Gem::Specification.new do |s|
  s.name                   =  'politicosbr'
  s.version                =  PoliticosBR::VERSION
  s.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.6.2'
  s.add_runtime_dependency 'httparty', '~> 0.13', '>= 0.13.7'
  s.add_runtime_dependency 'roo-xls', '~> 1.0', '>= 1.0.0'  
  s.add_runtime_dependency 'rot13', '~> 0.1', '>= 0.1.3'  
  s.executables            << 'politicosbr'
  s.date                   =  '2016-05-07'
  s.summary                =  "PoliticosBR"
  s.description            =  "Uma gem para obter listas atualizadas com os dados de deputados federais e senadores brasileiros."
  s.authors                =  ["Edvaldo Silva de Almeida Jr. (edvaldoajunior@gmail.com)", "Eduardo Becker (edu.bkr@gmail.com)"]
  s.email                  =  'edvaldoajunior@gmail.com'
  s.files                  =  ["lib/politicosbr.rb", "lib/politicosbr/constants.rb", "lib/politicosbr/estaduais.rb", "lib/politicosbr/vereadores.rb", "bin/politicosbr", "Rakefile"]
  s.homepage               =  'https://github.com/EdDeAlmeidaJr/politicosbr'
  s.license                =  'MIT'
end
