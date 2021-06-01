class UnidadesPage
    include RSpec::Matchers
    include Capybara::DSL

    def click_filtro_facilidade
        find(ELEMENTS['rota_unidades']['click_facilidade']).click
    end

    def check_facilidades(table_0,table_1)
    find(ELEMENTS['rota_unidades'][table_0]).click
    find(ELEMENTS['rota_unidades'][table_1]).click
    end

    def get_first_name
        find(ELEMENTS['rota_unidades']['nome_primeira_unidade']).text
    end

    def first_link
        first(:link, 'Ver detalhes').click
    end

    def valida_nome_unidade(nome)
        begin
            get_first_name() == nome 
        rescue
            $error = "Nome unidade não está de acordo com busca anterior"
            raise $error
        end
    end







end
