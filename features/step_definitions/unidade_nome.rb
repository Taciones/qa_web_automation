Quando('acesso a pagina inicial do site Fleury') do
    @home_page.go
  end
  
  Quando('navego até a pagina busca de unidades') do
    @home_page.acessar_unidades
  end
  
  Quando('realizo um filtro pelas seguintes facilidades') do |table|
    @data = table.raw
    table_0 = "selecao_" + @data[0][0].gsub!(/\s/,'_')
    table_1 = "selecao_" + @data[1][0].gsub!(/\s/,'_')
    @unidades_page.click_filtro_facilidade
    @unidades_page.check_facilidades(table_0,table_1)

    
  end
  
  Quando('seleciono a primeira unidade disponivel') do
    @unidade_nome = @unidades_page.get_first_name
    @unidades_page.first_link
    
    
  end
  
  Então('o nome da unidade precisa estar correto de acordo com a página anterior de busca de unidades') do
    @unidades_page.valida_nome_unidade(@unidade_nome)
  end