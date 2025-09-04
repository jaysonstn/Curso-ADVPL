#include 'totvs.ch'

/*/{Protheus.doc} BANCO005
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
User Function BANCO005()
    
    Local aArea := GetArea()
    Local aDados := {}
    Private lMSErroAuto := .F.

    //Adicionando dados no vetor
    aDados := {;
                {"B1_COD", "000002",       Nil},;
                {"B1_DESC", "Mouse Gamer", Nil},;
                {"B1_TIPO", "ME",          Nil},;
                {"B1_UM", "UN",            Nil},;
                {"B1_LOCPAD", "01",        Nil};
                }

    //Inicio do cotrole de transação
    Begin Transaction 

        //Chama cadastro de produto
        MSExecAuto({|x,y|Mata010(x,y)}, aDados, 3) //3 é operação de inclusão

        //Casso ocorra erro
        If lMSErroAuto 
            Alert("Ocorreram erros durante a operação!")
            MostraErro()
            DisarmTransaction()
        
            Else
                MsgInfo("Operação finalizada!", "Aviso")
            EndIf
        End Transaction
    RestArea(aArea)

Return
