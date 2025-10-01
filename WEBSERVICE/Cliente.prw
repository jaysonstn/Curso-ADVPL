#include "Totvs.ch"
#include "apwebsrv.ch"

WsService TCliente description "Treinamento do WebService para a Criacao Cliente"

	WSDATA ACLIENTE	AS CLIENTES  // ESTRUTURA DE DADOS RECEBIDOS DO CLIENTE
	WsData _cEmp	As String
	WsData _cFil	As String
	WsData CREGSA1	As string 	// RETORNO DA MENSAGEM DO EXECAUTO

	WSMETHOD GRAVACLIENTE DESCRIPTION "Clientes"

ENDWSSERVICE

WsStruct CLIENTES
	WsData	A1_NOME	 	as	String
	WsData	A1_PESSOA	as	String
	WsData	A1_NREDUZ	as	String
	WsData	A1_END	 	as	String
	WsData	A1_BAIRRO	as	String
	WsData	A1_TIPO	 	as	String
	WsData	A1_EST	 	as	String
	WsData	A1_CEP  	as	String
	WsData	A1_MUN	 	as	String
	WsData	A1_CGC	 	as	String
	WsData	A1_EMAIL	as	String
EndWsStruct

WSMETHOD GRAVACLIENTE WSRECEIVE ACLIENTE,_cEmp,_cFil  WSSEND CREGSA1 WSSERVICE TCliente

	Local cEmp				:= _cEmp
	Local cFil				:= _cFil
	Local aDat				:= {}
	Local cCodigo			:= ""
	Local cLoja				:= ""
	Local cMsg				:= ""
	Local nOpc				:= 3
	Local nFor
	Local bQuery 			:= {|X| Iif(Select(X) > 0, (X)->(dbCloseArea()), Nil),;
		dbUseArea(.T.,"TOPCONN",TCGENQRY(,,cQuery),X,.F.,.T.),;
		dbSelectArea(X),;
		(X)->(dbGoTop())}

	RpcSetEnv(cEmp,cFil) 

	DBSELECTAREA("SA1")
	SA1->(DBSETORDER(3))

	cCPF := aCliente:A1_CGC

	//Estrutura para preencher o array para o execauto
	//usando a função ClassDataArr que converte um objeto em array multidimensional
	aDat := ClassDataArr(aCliente)

	// Verificamos se o CPF/CGC já existe no cadastro
	If SA1->(DBSEEK(XFILIAL("SA1") + cCPF))
		// Se encontrar a operação é de alteração
		nOpc	:= 4
		cCodigo	:= SA1->A1_COD
		cLoja	:= SA1->A1_LOJA
	Else
		cCodigo := GETSXENUM("SA1","A1_COD")
		CONFIRMSX8()
		cLoja	:= "01"
		aAdd(aDat,{"A1_COD", cCodigo, Nil})
		aAdd(aDat,{"A1_LOJA", cLoja, Nil})
	EndIf

	cQuery := "SELECT CC2_CODMUN "
	cQuery += "FROM " + RETSQLNAME("CC2")+" CC2 "
	cQuery += "WHERE CC2.D_E_L_E_T_ = '' "
	cQuery += "AND CC2_FILIAL = '"+xFilial("CC2")+"' "
	cQuery += "AND CC2_EST = '" + allTrim(aCliente:A1_EST) + "' "
	cQuery += "AND CC2_MUN = '" + allTrim(aCliente:A1_MUN)+"' "

	X := "TMP"
	CONOUT(cQuery)
	Eval(bQuery,"TMP")
	If !empty(TMP->CC2_CODMUN)
		aAdd(aDat,{"A1_COD_MUN", TMP->CC2_CODMUN, Nil})
	EndIf

	oModel := FWLoadModel("CRMA980")
	oModel:SetOperation(nOpc)
	oModel:Activate()
	
	//Pegando o model dos campos da SA1
	oSA1Mod:= oModel:getModel("SA1MASTER")
	For nFor := 1 to Len(aDat)
		oSA1Mod:setValue(aDat[nFor, 1], aDat[nFor, 2])
	Next

	//Se conseguir validar as informações
	If oModel:VldData()
		
		//Tenta realizar o Commit
		If oModel:CommitData()
			lDeuCerto := .T.
			
		//Se não deu certo, altera a variável para false
		Else
			lDeuCerto := .F.
		EndIf
		
	//Se não conseguir validar as informações, altera a variável para false
	Else
		lDeuCerto := .F.
	EndIf
	
	//Se não deu certo a inclusão, mostra a mensagem de erro
	If ! lDeuCerto
		//Busca o Erro do Modelo de Dados
		aErro := oModel:GetErrorMessage()
		
		//Monta o Texto que será mostrado na tela
		cMsg += "Id do formulário de origem:"  + ' [' + AllToChar(aErro[01]) + ']' + CRLF
		cMsg += "Id do campo de origem: "      + ' [' + AllToChar(aErro[02]) + ']' + CRLF
		cMsg += "Id do formulário de erro: "   + ' [' + AllToChar(aErro[03]) + ']' + CRLF
		cMsg += "Id do campo de erro: "        + ' [' + AllToChar(aErro[04]) + ']' + CRLF
		cMsg += "Id do erro: "                 + ' [' + AllToChar(aErro[05]) + ']' + CRLF
		cMsg += "Mensagem do erro: "           + ' [' + AllToChar(aErro[06]) + ']' + CRLF
		cMsg += "Mensagem da solução: "        + ' [' + AllToChar(aErro[07]) + ']' + CRLF
		cMsg += "Valor atribuído: "            + ' [' + AllToChar(aErro[08]) + ']' + CRLF
		cMsg += "Valor anterior: "             + ' [' + AllToChar(aErro[09]) + ']' + CRLF
		
		::CREGSA1:= "ERRO AO GRAVAR O CLIENTE:" + CRLF + cMsg
	Else
		::CREGSA1:= "SUCESSO! CODIGO DO CLIENTE: " + cCodigo + " / " + cLoja
	EndIf
	
	//Desativa o modelo de dados
	oModel:DeActivate()

Return .T.
