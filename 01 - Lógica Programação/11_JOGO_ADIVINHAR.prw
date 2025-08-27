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
    Local nNum := Randomize(1,10) //Randomize gera n�mero aleat�rio. //N�mero aleat�rio gerado pelo Protheus.
    Local nChute := 0 //Chute informado pelo usu�rio.
    Local nTent := 0 //Tentativas

    While nChute != nNum
    nChute := Val(FWInputBox("Escolha um n�mero [1 - 10]","")) //Utilizando Val para Converter a string dentro de "" para n�mero.
        If nChute == nNum
            MsgInfo("Voc� Acertou - <b>" + cValToChar(nChute) + "</b><br>ERROS: " + cValToChar(nTent), "Fim de Jogo")
        elseif nChute > nNum
            MsgAlert("Valor Alto","Tente Novamente")
            nTent += 1
        Else 
            MsgAlert("Valor Baixo","Tente Novamente")
            nTent += 1
        Endif
    End


Return
