#include 'totvs.ch'

/*/{Protheus.doc} nBANCO004
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
User Function BANCO004()
    Local aArea := SB1->(GetArea())

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    //Iniciar Transação
    Begin Transaction

        MsgInfo("A descrição do produto será alterada!", "Atenção")

    If SB1->(DbSeek(FWXFilial('SB1') + '000001'))
        RecLock('SB1', .F.) //Trava registro para alteração

            Replace B1_DESC With "Teclado Redragon sem fio"

        Sb1->(MsUnlock())
    
    EndIf
        MsgAlert("Alteração concluída!", "Atenção")

    End Transaction
    RestArea(aArea)

Return
