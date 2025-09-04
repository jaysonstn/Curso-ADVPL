#include 'totvs.ch'
#include 'TopConn.ch'

/*/{Protheus.doc} BANCO003
(long_description)
@type user function
@author Jayson
@since 04/09/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function BANCO003()
    Local aArea := SB1->(GetArea())
    Local cQuery := ""
    Local aDados := {}
    Local nCount := ""

    cQuery := " SELECT "
    cQuery += " B1_COD AS CODIGO, "
    cQuery += " B1_DESC AS DESCRICAO "
    cQuery += " FROM "
    cQuery += " "+ RetSQLName("SB1") +  " SB1 "
    cQuery += " WHERE "
    cQuery += " B1_MSBLQL != '1' "

    //Executando a consulta a cima
    TCQuery cQuery New Alias "TMP"

    While ! TMP->(EoF())
        aAdd(aDados, TMP->CODIGO)
        aAdd(aDados, TMP->DESCRICAO)
        TMP->(DbSkip())
    EndDo

    Alert(Len(aDados))
    
        For nCount := 1 To Len(aDados)
            MsgInfo(aDados[nCount])
        Next nCount
    
    TMP->(DbCloseArea())
    RestArea(aArea)

Return 
