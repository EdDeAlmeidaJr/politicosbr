module PoliticosBR

  ## URL to get the spreadesheet with the list of federal representatives
  DEPUTADOS_URL = 'http://www.camara.gov.br/internet/deputado/deputado.xls'
  
  ## URL to get the list the senators in Brazilian congress
  SENADORES_URL = 'http://www25.senado.leg.br/web/senadores/em-exercicio/-/e/por-nome'
  
  ## Hash containing the list of URLs to get the lists of state representatives in Brazilian states
  DEPS_ESTADUAIS = { pr: 'http://www.alep.pr.gov.br/deputados',
                     rj: 'http://www.alerj.rj.gov.br/Deputados/QuemSao',
                     rs: 'http://www.al.rs.gov.br/deputados/ListadeDeputados.aspx',
                     sc: 'http://www.alesc.sc.gov.br/portal_alesc/todos-deputados',
                     sp: 'http://www.al.sp.gov.br/alesp/deputados-estaduais/' }
  
  
end
