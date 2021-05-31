class UnidadesPage
    include RSpec::Matchers
    include Capybara::DSL

    def click_filtro_facilidade
        find(ELEMENTS['rota_unidades']['click_facilidade']).click
    end

    def check_facilidades(table_0,table_1)
    Kernel.puts table_1
    find(ELEMENTS['rota_unidades'][table_0]).click
    find(ELEMENTS['rota_unidades'][table_1]).click
    end






end
