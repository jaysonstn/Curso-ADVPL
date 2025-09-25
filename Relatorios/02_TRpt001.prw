#include 'totvs.ch'
#include 'topconn.ch'

/*/{Protheus.doc} TRpt001
(Relatório TReport simples)
@type user function
@author Jayson
@since 25/09/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function TRpt001()
    Local oReport
    Local cAlias := getNextAlias()

    oReport := RptStruc(cAlias)

    oReport:printDialog()

Return 

/*/{Protheus.doc} RPrint
    (Imprimir relatório baseado na consulta)
    @type  Static Function
    @author Jayson
    @since 25/09/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function RPrint(oReport,cAlias)
    Local oSecao1 := oReport:Section(1)

    oSecao1:BeginQuery()

        BeginSQL Alias cAlias
            SELECT
            B1_FILIAL FILIAL,
            B1_COD CODIGO,
            B1_DESC DESCRICAO,
            B1_TIPO TIPO,
            B1_ATIVO ATIVO
            FROM %Table:SB1% SB1
            WHERE B1_FILIAL <> '' AND B1_MSBLQL <> '1' AND D_E_L_E_T_ = ''
            GROUP BY B1_FILIAL, B1_COD, B1_DESC, B1_TIPO, B1_ATIVO

        EndSQL

    oSecao1:EndQuery()
    oReport:SetMeter((cAlias)->(RecCount()))

    oSecao1:Print()

Return 


/*/{Protheus.doc} RptStruc
    (Monta Estrutura)
    @type  Static Function
    @author Jayson
    @since 25/09/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function RptStruc(cAlias)
    Local cTitulo := "Relatório de Produtos"
    Local cHelp := "Permite imprimir relatório de produtos"
    Local oReport
    Local oSection1

    oReport := TReport():New('TRPT001',cTitulo,/**/,{|oReport|RPrint(oReport, cAlias)},cHelp) //Instanciando a classe TReport

    oSection1 := TRSection():New(oReport, "Produtos", {"SB1"}) //Seção

    TRCell():New(oSection1, "FILIAL","SB1",          "Filial")
    TRCell():New(oSection1, "CODIGO","SB1",          "Codigo")
    TRCell():New(oSection1, "DESCRICAO","SB1",    "Descricao")
    TRCell():New(oSection1, "TIPO","SB1",              "Tipo")
    TRCell():New(oSection1, "ATIVO","SB1",            "Ativo")

Return(oReport)
