#include 'totvs.ch'
User function 03_EX01()
#DEFINE SET DATE BRITISH  
Local dVenc := CtoD("16/07/20")
Local dAtula:= Date()
//Local dData := DATE()
If dAtual > dVenc
    Alert("Vencimento Ultrapassado" + DtoC(dVenc))
ElseIf Date() == dVenc
    Alert("Vencimento em dia a Data é " + DtoC(dVenc))
Else
    Alert("Vencimento detro do prazo!" + DtoC(dVenc))
EndIf

Return
