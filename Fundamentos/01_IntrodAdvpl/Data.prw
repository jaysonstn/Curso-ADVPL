#include 'totvs.ch'
User Function datas()
//convers�o para o padr�o Britanico
local cMensg := "Outra forma de chamar data "
SET DATE BRITISH  
dData := DATE()
MsgAlert(cMensg + " criado no dia: " + DTOC(dData))
	
	// vai corinthians
Return
