class HomePage
    include RSpec::Matchers
    include Capybara::DSL

    def go
        visit "/"

        begin
            assert_selector(ELEMENTS["home_page"]["fleury_div"])
        rescue
            $error = "não foi possivel carregar a página corretamente."
            raise $error
        end
    end

    def acessar_unidades
        all(ELEMENTS["home_page"]["header_unidades"])[3].click

        begin
            assert_selector(ELEMENTS["home_page"]["header_unidades"])
        rescue
            $error = "Não foi possível encontrar o header unidades, verifique elementos."
            raise $error
        end
    end 







end