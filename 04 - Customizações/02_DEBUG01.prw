#include 'totvs.ch'

/*/{Protheus.doc} DEBUG01
(Debug) Quantidade de produtos da SB1
@type user function
@author Jayson
@since 08/09/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function DEBUG01()
    Local aArea := GetArea()
    Local aProduto := {}
    Local nCount := 0

    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    While ! SB1->(EoF()) //Enquanto não for final do arquivo
        aAdd(aProduto, { SB1->B1_COD,;
                         SB1->B1_DESC})

        nCount++
        Sb1->(DbSkip())
    EndDo

    MsgAlert("Quantidade de Produtos encontrada: <b>" + cValToChar(nCount))
    nCount := 0 //Zerando o valor da variável nCount

    RestArea(aArea)

Return
