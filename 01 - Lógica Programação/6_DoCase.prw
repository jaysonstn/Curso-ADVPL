#include 'totvs.ch'

User Function DoCase()

    Local cData := "15/12/2025"

    Do Case

    Case cData == "20/12/2025"
    Alert ("N�o � Natal " + cData)

    Case cdata == "25/12/2025"
    Alert("� Natal! ")

    OtherWise
    MsgAlert("N�o sei qual dia � hoje!")

    EndCase

Return
