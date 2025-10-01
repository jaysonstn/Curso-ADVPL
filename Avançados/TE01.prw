#include "protheus.ch"

User Function TE01()

Local aSize    	:= {}	
Local aPObj  	:= {}
Local aObj		:= {}
Local nReg		:= 0
Local nOpc		:= 1
Local cAlias1	:= "SA1"	
 
// Retorna a area util das janelas Protheus
aSize := MsAdvSize()

// Ser� utilizado tr�s �reas na janela
// 1� - Enchoice, sendo 80 pontos pixel
	
aAdd( aObj, { 100, 080, .T., .F. })
aAdd( aObj, { 100, 100, .T., .T. })
aAdd( aObj, { 100, 015, .T., .F. })
	
// C�lculo autom�tico da dimens�es dos objetos (altura/largura) em pixel
	
aInfo := { aSize[1], aSize[2], aSize[3], aSize[4], 3, 3 }
aPObj := MsObjSize( aInfo, aObj )
	
// C�lculo autom�tico de dimens�es dos objetos MSGET
oDialog:=MSDialog():New(aSize[7],aSize[1],aSize[6],aSize[5],;                  
            "MSDialog",,,,,,,,,.T.)
	
EnChoice( cAlias1, nReg, nOpc, , , , , aPObj[1]) 

oDialog:Activate(,,,.T.)

Return