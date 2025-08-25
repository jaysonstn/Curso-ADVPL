#include 'totvs.ch'

User Function ESTRREP()

    Local nCount
    Local nNum   := 0

    For nCount := 0 To 10 step 2 //Incrementar de 2 em 2

    nNum += nCount

    Next
    Alert("Valor: " + cValToChar(nNum))

Return
