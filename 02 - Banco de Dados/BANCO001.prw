#include 'totvs.ch'

/*/{Protheus.doc} BANCO001
(long_description)
@type user function
@author Jayson
@since 27/08/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function BANCO001()
   /* Local aArea := SB1->(GetArea())
    //Local cMsg := ""

    //Abre Tabela
    DbSelectArea("SB1")
    SB1->(DbSetOrder(1)) //Posiciona índice 1 (referência ao índice 1).
    SB1->(DbGoTop())

    //Posiciona o produto 000002
    If SB1->(dbseek(FWXFilial("SB1")+ "000001"))
        Alert(SB1->B1_DESC)
    Endif

    RestArea(aArea) */

 Local cQuery := ""
    Local cAlias := GetNextAlias()
    
    // Query SQL direta
    cQuery := "SELECT B1_COD, B1_DESC, B1_TIPO "
    cQuery += "FROM SB1990 "
    cQuery += "WHERE B1_COD = '000001' "
    
    // Executa a query
    DbUseArea(.T., "TOPCONN", TCGenQry(,, cQuery), cAlias, .F., .T.)
    
    If Select(cAlias) == 0
        Alert("Erro ao executar consulta!")
        Return
    EndIf
    
    // Verifica se encontrou o produto
    If !(cAlias)->(Eof())
        Alert("Código: " + (cAlias)->B1_COD + Chr(13) + ;
              "Descrição: " + AllTrim((cAlias)->B1_DESC) + Chr(13) + ;
              "Tipo: " + (cAlias)->B1_TIPO)
    Else
        Alert("Produto 000001 não encontrado!")
    EndIf
    
    (cAlias)->(DbCloseArea())
    
Return
