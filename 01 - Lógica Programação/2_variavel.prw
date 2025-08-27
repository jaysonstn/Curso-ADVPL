#INCLUDE 'TOTVS.CH'

User Function variavel()
    Local nNum := 66
    Local lLogic := .T.
    Local cCarac := "String"
    Local dData := DATE()
    Local aArray :={"João", "Maria", "José"}
    Local bBloco := {|| nValor := 2, MsgAlert ("O numero é: "+ cValToChar(nValor), "Aviso")}

    Alert (nNum)
    Alert (lLogic)
    Alert (cValToChar(cCarac))
    Alert (dData)
    Alert (aArray[1])
    Eval (bBloco)
    
Return
