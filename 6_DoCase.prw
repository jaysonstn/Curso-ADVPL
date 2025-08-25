#include 'totvs.ch'

User Function DoCase()

    Local cData := "15/12/2025"

    Do Case

    Case cData == "20/12/2025"
    Alert ("Não é Natal " + cData)

    Case cdata == "25/12/2025"
    Alert("É Natal! ")

    OtherWise
    MsgAlert("Não sei qual dia é hoje!")

    EndCase

Return
