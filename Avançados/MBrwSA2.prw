#Include "Protheus.ch"

User Function MBrwSA2()

Local cAlias  		:= "SA2"
Local aCores  		:= {}
Local cFiltra 		:= cFiltra:="A2_FILIAL == '"+xFilial('SA2')+"' .And. A2_EST == 'SP'"

Private cCadastro	:= "Cadastro de Fornecedores"
Private aRotina  	:= {}                
Private aIndexSA2	:= {}	
Private bFiltraBrw	:= { || FilBrowse(cAlias,@aIndexSA2,@cFiltra) }
 
AADD(aRotina,{"Pesquisar"	,"PesqBrw"		,0,1})
AADD(aRotina,{"Visualizar"	,"AxVisual"		,0,2})
AADD(aRotina,{"Incluir"		,"U_BInclui"	,0,3})
AADD(aRotina,{"Alterar"		,"U_BAltera"	,0,4})
AADD(aRotina,{"Excluir"		,"U_BDeleta"	,0,5})
AADD(aRotina,{"Legenda"		,"U_BLegenda"	,0,3})
AADD(aRotina,{"Todos"		,"U_MbrwMT"		,0,6})


AADD(aCores,{"A2_TIPO == 'F'"	,"BR_VERDE"		})
AADD(aCores,{"A2_TIPO == 'J'"	,"BR_AMARELO"	})
AADD(aCores,{"A2_TIPO == 'X'"	,"BR_LARANJA"	})
AADD(aCores,{"A2_TIPO == 'R'"	,"BR_MARRON"	})
AADD(aCores,{"Empty(A2_TIPO)"	,"BR_PRETO"		})

dbSelectArea(cAlias)
dbSetOrder(1)

//+------------------------------------------------------------
//| Cria o filtro na MBrowse utilizando a fun��o FilBrowse
//+------------------------------------------------------------
Eval(bFiltraBrw) // Se comentar este c�digo o filtro n�o funcional. A fun��o eVal que executa o bloco de c�digo.

dbSelectArea(cAlias)
dbGoTop()
mBrowse(6,1,22,75,cAlias,,,,,,aCores)

//+------------------------------------------------
//| Deleta o filtro utilizado na fun��o FilBrowse
//+------------------------------------------------

//EndFilBrw(cAlias,aIndexSA2)//Eu comentei est� fun��o.

Return Nil



//+---------------------------------------
//|Fun��o: BInclui - Rotina de Inclus�o
//+---------------------------------------

User Function BInclui(cAlias,nReg,nOpc)

Local nOpcao := AxInclui(cAlias,nReg,nOpc)

If nOpcao == 1
    MsgInfo("Inclus�o efetuada com sucesso!")
Else
	  MsgInfo("Inclus�o cancelada!")
EndIf	

Return Nil


//+-----------------------------------------
//|Fun��o: BAltera - Rotina de Altera��o
//+-----------------------------------------
User Function BAltera(cAlias,nReg,nOpc)

Local nOpcao := AxAltera(cAlias,nReg,nOpc)

If nOpcao == 1
	MsgInfo("Altera��o efetuada com sucesso!")
Else
	MsgInfo("Altera��o cancelada!")
Endif	

Return Nil


//+-----------------------------------------
//|Fun��o: BDeleta - Rotina de Exclus�o
//+-----------------------------------------
User Function BDeleta(cAlias,nReg,nOpc)

Local nOpcao := AxDeleta(cAlias,nReg,nOpc)

If nOpcao == 1
	MsgInfo("Exclus�o efetuada com sucesso!")
Else
	MsgInfo("Exclus�o cancelada!")
Endif	

Return Nil


//+-------------------------------------------
//|Fun��o: BLegenda - Rotina de Legenda
//+-------------------------------------------
User Function BLegenda()

Local ALegenda :={}

AADD(aLegenda,{"BR_VERDE"	,"Pessoa F�sica"	})
AADD(aLegenda,{"BR_AMARELO"	,"Pessoa Jur�dica"	})
AADD(aLegenda,{"BR_LARANJA"	,"Exporta��o"		})
AADD(aLegenda,{"BR_MARRON"	,"Fornecedor Rural"	})
AADD(aLegenda,{"BR_PRETO"	,"N�o Classificado"	})

BrwLegenda(cCadastro, "Legenda", aLegenda)

Return Nil


//-------------------------------------------------------------------

//Minha Fun��o - n�o passar para os amigos.
User Function MbrwMT()

Local cAlias  		:= "SA2"
Local aCores  		:= {}
//Local cFiltra 		:= cFiltra:="A2_FILIAL == '"+xFilial('SA2')+"' .And. A2_EST == 'SP'"

Private cCadastro	:= "Cadastro de Fornecedores"
Private aRotina  	:= {}                
Private aIndexSA2	:= {}	
//Private bFiltraBrw	:= { || FilBrowse(cAlias,@aIndexSA2,@cFiltra) }
 
 
AADD(aRotina,{"Pesquisar"	,"PesqBrw"		,0,1})
AADD(aRotina,{"Visualizar"	,"AxVisual"		,0,2})
AADD(aRotina,{"Incluir"		,"U_BInclui"	,0,3})
AADD(aRotina,{"Alterar"		,"U_BAltera"	,0,4})
AADD(aRotina,{"Excluir"		,"U_BDeleta"	,0,5})
AADD(aRotina,{"Legenda"		,"U_BLegenda"	,0,3})

AADD(aCores,{"A2_TIPO == 'F'"	,"BR_VERDE"		})
AADD(aCores,{"A2_TIPO == 'J'"	,"BR_AMARELO"	})
AADD(aCores,{"A2_TIPO == 'X'"	,"BR_LARANJA"	})
AADD(aCores,{"A2_TIPO == 'R'"	,"BR_MARRON"	})
AADD(aCores,{"Empty(A2_TIPO)"	,"BR_PRETO"		})

dbSelectArea(cAlias)
dbSetOrder(1)

//+------------------------------------------------------------
//| Cria o filtro na MBrowse utilizando a fun��o FilBrowse
//+------------------------------------------------------------
//Eval(bFiltraBrw) // Se comentar este c�digo o filtro n�o funcional. A fun��o eVal que executa o bloco de c�digo.

dbSelectArea(cAlias)
dbGoTop()
mBrowse(6,1,22,75,cAlias,,,,,,aCores)

Return()



