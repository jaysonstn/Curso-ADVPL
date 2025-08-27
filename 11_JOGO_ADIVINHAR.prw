#include 'totvs.ch'

/*/{Protheus.doc} Adivinha
(Jogo de Adivinhar)
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
User Function Adivinha()
    Local nNum := 50
    Local nChute := 0

    While nChute != nNum
    nChute := Val(FWInputBox("Escolha um número [1 - 100]","")) //Utilizando Val para Converter a string dentro de "" para número.
        If nChute == nNum
            MsgInfo("Você Acertou - <b>" + cValToChar(nChute) + "</b>", "Fim de Jogo")
        elseif nChute > nNum
            MsgAlert("Valor Alto","Tente Novamente")
        Else 
            MsgAlert("Valor Baixo","Tente Novamente")
        Endif
    End


Return
