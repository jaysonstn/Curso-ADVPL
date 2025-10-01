#include 'totvs.ch'
User Function datas()
//conversão para o padrão Britanico
local cMensg := "Outra forma de chamar data "
SET DATE BRITISH  
dData := DATE()
MsgAlert(cMensg + " criado no dia: " + DTOC(dData))
	
	// vai corinthians
Return
