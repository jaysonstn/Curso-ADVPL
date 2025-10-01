#include 'totvs.ch'
// Strings
User Function EX04B()
Local nVar	:= 10
Local cVar	:= "10"
Local nVar2	:= 30
If nVar + &(cVar) + 20 >= nVar2
	nVar  *= nVar
    Alert("Loop 1 " + cValToChar(nVar))
    Else
	nVar /= nVar
    Alert("Loop 2 " + cValToChar(nVar))
   EndIf
// + Concatenar
// - Concatenar e eliminar espaços brancos finais
// $ Pertence (esta contido em)

Return
