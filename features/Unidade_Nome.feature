# language: pt

Funcionalidade: Validar nome de unidade Fleury
    Eu como analista de qualidade
    Preciso validar o nome de uma unidade está correto de acordo com a pagina de busca de unidades



    @unidade_nome
    Cenário: Nome de unidade precisa estar correto de acordo com a pagina de busca de unidades
        Quando acesso a pagina inicial do site Fleury
        E navego até a pagina busca de unidades
        E realizo um filtro pelas seguintes facilidades
        | Vaga Verde Para Carro Elétrico |
        | Próximo ao metrô               |
        E seleciono a primeira unidade disponivel
        Então o nome da unidade precisa estar correto de acordo com a página anterior de busca de unidades


