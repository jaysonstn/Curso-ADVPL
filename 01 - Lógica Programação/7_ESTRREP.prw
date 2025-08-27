#include 'totvs.ch'

User Function ESTRREP()

    //Local nCount
    //Local nNum   := 0

    //For nCount := 0 To 10 step 2 //Incrementar de 2 em 2

    //nNum += nCount

    //Next
    //Alert("Valor: " + cValToChar(nNum))

    //Exemplo utilizando WHILE ENDDO
    //Local nNum1 := 0
    //Local nNum2 := 10

    //While nNum1 < nNum2
    //    nNum1++

    //EndDo
    //    Alert(nNum1 + nNum2)

    Local nNum1 := 1
    Local cNome := "RCTI"

    While nNum1 != 10 .AND. cNome != "Protheus"        
        nNum1++
            If nNum1 == 5
            cNome := "Protheus"
            EndIf
    EndDo
        Alert("Número: "+ cValToChar(nNum1))
        Alert("Nome:"+ cValToChar(cNome))

Return
