#include 'totvs.ch'

/*/{Protheus.doc} BANCO002
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
User Function BANCO002()
    Local aArea := SB1->(GetArea())
    Local cMsg := ''

    dbSelectArea("SB1")
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    cMsg := Posicione( 'SB1',;
                        1,;
                        FWXFilial('SB1')+ '000001',;
                        'B1_DESC')

    Alert("Descrição do Produto: " + cMsg, "AVISO")

    RestArea(aArea)


Return
