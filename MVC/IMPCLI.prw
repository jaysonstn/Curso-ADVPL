#Include "Protheus.ch"
#Include "FWMVCDEF.CH"

User Function IMPCLI()

// Importamos outro registro
Local aCampos := {}
Local cFonte  :="CADCLI"
Local cAlias  := "SA1"
Local lRet	  := .T.
	
aAdd( aCampos, { 'A1_COD'   , '000104' } )
aAdd( aCampos, { 'A1_LOJA'  , '02' } )
aAdd( aCampos, { 'A1_NOME'  , 'MVC EXEC' } )
aAdd( aCampos, { 'A1_NREDUZ', 'Emilio Rosa' } )
aAdd( aCampos, { 'A1_TIPO'  , 'F' } )
aAdd( aCampos, { 'A1_EST'   , 'SP' } )
aAdd( aCampos, { 'A1_MUN'   , 'S�O PAULO' } )
aAdd( aCampos, { 'A1_END'   , 'Av Braz Leme' } )
	
// Carrega modelo	
oModel := FWLoadModel( cFonte )
// informa opera��o Incluir
oModel:SetOperation( 3 )
oModel:Activate()
	
// ID do componete addfields
oAux := oModel:GetModel( "SA1MASTER" ):GetStruct()
// Removendo todas as valida��es do modo de edi��es dos campos

oAux:SetProperty('*',MODEL_FIELD_WHEN, FWBuildFeature( STRUCT_FEATURE_WHEN , NIL  ) )
	
For nI := 1 To Len( aCampos )
	If oAux:HasField(aCampos[nI][1])
		// � feita a atribui��o do dado ao campo do Model
		If !( lAux := oModel:SetValue( "SA1MASTER", aCampos[nI][1], aCampos[nI][2] ) )
  			// Caso a atribui��o n�o possa ser feita, por algum motivo
  			// (valida��o, por exemplo) o   //m�todo SetValue retorna .F.
    		lRet := .F.
    		Exit
  		EndIf
 	EndIf
Next nI

If lRet
// neste momento os dados n�o s�o gravados, s�o somente validados.
 If ( lRet := oModel:VldData() )
 // Se os dados foram validados faz-se a grava��o efetiva dos dados (commit)
  oModel:CommitData()
 EndIf
EndIf
	
If ! lRet
// Se os dados n�o foram validados obtemos a descri��o do erro para gerar LOG 
//ou mensagem de aviso
	aErro := oModel:GetErrorMessage()
	// A estrutura do vetor com erro �:
	// [1] identificador (ID) do formul�rio de origem
	// [2] identificador (ID) do campo de origem
	// [3] identificador (ID) do formul�rio de erro
	// [4] identificador (ID) do campo de erro
	// [5] identificador (ID) do erro
	// [6] mensagem do erro
	// [7] mensagem da solu��o
	// [8] Valor atribu�do
	// [9] Valor anterior
	
	AutoGrLog( "Id do formul�rio de origem:" + ' [' + AllToChar( aErro[1] ) + ']' )
	AutoGrLog( "Id do campo de origem: " + ' [' + AllToChar( aErro[2] ) + ']' )
	AutoGrLog( "Id do formul�rio de erro: " + ' [' + AllToChar( aErro[3] ) + ']' )
	AutoGrLog( "Id do campo de erro: " + ' [' + AllToChar( aErro[4] ) + ']' )
	AutoGrLog( "Id do erro: " + ' [' + AllToChar( aErro[5] ) +']' )
	AutoGrLog( "Mensagem do erro: " + ' [' + AllToChar( aErro[6] ) + ']' )
	AutoGrLog( "Mensagem da solu��o: " + ' [' + AllToChar( aErro[7] ) + ']' )
	AutoGrLog( "Valor atribu�do: " + ' [' + AllToChar( aErro[8] ) + ']' )
	AutoGrLog( "Valor anterior: " + ' [' + AllToChar( aErro[9] ) + ']' )
	MostraErro()
Else
	MsgInfo("Registro gavado com sucesso")
EndIf

// Desativamos o Model
oModel:DeActivate()

Return