module PoliticosBR

  ## URL to get the spreadesheet with the list of federal representatives
  DEPUTADOS_URL = 'http://www.camara.gov.br/internet/deputado/deputado.xls'
  
  ## URL to get the list the senators in Brazilian congress
  SENADORES_URL = 'http://www25.senado.leg.br/web/senadores/em-exercicio/-/e/por-nome'
  
  ## Hash containing the list of URLs to get the lists of state representatives in Brazilian states
  DEPS_ESTADUAIS = { ac: 'http://www.al.ac.leg.br/?page_id=2064',
                     al: 'http://www.al.al.leg.br/processo-legislativo/parlamentares',
                     am: 'http://www.ale.am.gov.br/deputados/',
                     ap: 'http://www.al.ap.gov.br/pagina.php?pg=exibir_legislatura&idlegislatura=7',
                     ba: 'http://www.al.ba.gov.br/deputados/Deputados.php',
                     ce: 'http://www.al.ce.gov.br/index.php/deputados/nomes-e-historico',
                     df: 'http://www.cl.df.gov.br/deputados',
                     es: 'http://www.al.es.gov.br/novo_portal/',
                     go: 'http://al.go.leg.br/deputado/',
                     ma: 'http://www.al.ma.leg.br/deputados/',
                     mg: 'http://www.almg.gov.br/deputados/conheca_deputados/index.html',
                     ms: 'http://www.al.ms.gov.br/tabid/471/Default.aspx',
                     mt: 'http://www.al.mt.gov.br/deputados',
                     pa: 'http://www.alepa.pa.gov.br/Principal#representantes',
                     pb: 'http://www.al.pb.gov.br/deputados',
                     pe: 'http://www.alepe.pe.gov.br/parlamentares/',
                     pi: 'http://www.alepi.pi.gov.br/deputados_inc.php?idMenu=11',
                     pr: 'http://www.alep.pr.gov.br/deputados',
                     rj: 'http://www.alerj.rj.gov.br/Deputados/QuemSao',
                     rn: 'http://www.al.rn.gov.br/portal/atuallegislatura',
                     ro: 'http://www.al.ro.leg.br/institucional/parlamentares-1',
                     rr: 'http://www.al.rr.leg.br/portal/deputados/7-legislatura',
                     rs: 'http://www.al.rs.gov.br/deputados/ListadeDeputados.aspx',
                     sc: 'http://www.alesc.sc.gov.br/portal_alesc/todos-deputados',
                     se: 'http://www.al.se.gov.br/deputados/',
                     sp: 'http://www.al.sp.gov.br/alesp/deputados-estaduais/',
                     to: 'http://www.al.to.gov.br/perfil' }
  
  
end
