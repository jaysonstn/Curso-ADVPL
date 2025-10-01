#include 'protheus.ch'
#include "fwmbrowse.ch"
#include "fwmvcdef.ch"

User Function CADCLI()

/*Declarando as vari�veis que ser�o utilizadas*/
Local aArea 		:= SA1->(GetArea())

Private oBrowse
Private cChaveAux 	:= "" 

// Instanciamento da Classe de Browse 
oBrowse := FWMBrowse():New() 

// Defini��o da tabela do Browse 
oBrowse:SetAlias('SA1') 

// Defini��o da legenda 
oBrowse:AddLegend( "A1_TIPO =='F'", "YELLOW", "Cons.Final"      ) 
oBrowse:AddLegend( "A1_TIPO =='L'", "BLUE"  , "Produtor Rural"  )
oBrowse:AddLegend( "A1_TIPO =='R'", "GREEN"  , "Revendedor" 		) 
oBrowse:AddLegend( "A1_TIPO =='S'", "RED"  , "Solidario"  		) 
oBrowse:AddLegend( "A1_TIPO =='X'", "PINK"  , "Exportacao"  	) 

// Titulo da Browse 
oBrowse:SetDescription('Clientes')
 
// Defini��o de filtro 
oBrowse:SetFilterDefault( "A1_PESSOA=='J'" ) 

// Opcionalmente pode ser desligado a exibi��o dos detalhes 
//oBrowse:DisableDetails() 

// Ativa��o da Classe 
oBrowse:Activate() 
RestArea(aArea)

Return

//Criando a MenuDef
/*Static Function MenuDef() 

Local aRotina := {} 
aAdd( aRotina, { 'Visualizar', 'VIEWDEF.CADCLI', 0, 2, 0, NIL } ) 
aAdd( aRotina, { 'Incluir'   , 'VIEWDEF.CADCLI', 0, 3, 0, NIL } ) 
aAdd( aRotina, { 'Alterar'   , 'VIEWDEF.CADCLI', 0, 4, 0, NIL } ) 
aAdd( aRotina, { 'Excluir'   , 'VIEWDEF.CADCLI', 0, 5, 0, NIL } ) 
aAdd( aRotina, { 'Imprimir'  , 'VIEWDEF.CADCLI', 0, 8, 0, NIL } ) 
aAdd( aRotina, { 'Copiar'    , 'VIEWDEF.CADCLI', 0, 9, 0, NIL } ) 

Return aRotina*/

/*
Static Function MenuDef()
 
Local aRotina := {}

ADD OPTION aRotina TITLE "Pesquisar"  	ACTION 'PesqBrw' 			OPERATION 1 ACCESS 0
ADD OPTION aRotina Title 'Visualizar'	Action 'VIEWDEF.CADCLI'	OPERATION 2 ACCESS 0 
ADD OPTION aRotina Title 'Incluir'   	Action 'VIEWDEF.CADCLI'	OPERATION 3 ACCESS 0 
ADD OPTION aRotina Title 'Alterar'  	Action 'VIEWDEF.CADCLI'	OPERATION 4 ACCESS 0 
ADD OPTION aRotina Title 'Excluir'   	Action 'VIEWDEF.CADCLI'	OPERATION 5 ACCESS 0 
ADD OPTION aRotina Title 'Imprimir'  	Action 'VIEWDEF.CADCLI'	OPERATION 8 ACCESS 0 
ADD OPTION aRotina Title 'Copiar'    	Action 'VIEWDEF.CADCLI'	OPERATION 9 ACCESS 0 

Return aRotina
*/

/*
//Poderia ainda ser simplificado
Static Function MenuDef() 
Return FWMVCMenu('CADCLI'))
*/

Static Function ModelDef() 

   // Cria o objeto do Modelo de Dados
   Local oModel // Modelo de dados que ser� constru�do 

   // Cria a estrutura a ser usada no Modelo de Dados 
   Local oStruSA1 := FWFormStruct( 1, 'SA1' , /*bAvalCampo*/,/*lViewUsado*/ )

   oModel := MPFormModel():New('CADCLIEN')

   //bPre := {|  | ValidPre(oModel)}
   //oModel := MPFormModel():New('CADCLIEN', , bPre)

   //bPosModel:={ | oModel | fPosModelo(oModel) }
   //oModel := MPFormModel():New('CADCLIEN', ,bPosModel)

   // Adiciona a descri��o do Modelo de Dados
   oModel:SetDescription('Clientes')

   // Adiciona ao modelo um componente de formul�rio 
   oModel:AddFields( 'SA1MASTER', /*cOwner*/, oStruSA1) 

   //Define a chave primaria utilizada pelo modelo
   oModel:SetPrimaryKey({'A1_FILIAL', 'A1_COD', 'A1_LOJA' })

   // Adiciona a descri��o do Componente do Modelo de Dados 
   oModel:GetModel( 'SA1MASTER' ):SetDescription( 'XCliente' )

// Retorna o Modelo de dados 
Return oModel


Static Function ViewDef() 

   Local oView // Interface de visualiza��o constru�da 
   Local oModel := ModelDef() // Cria um objeto de Modelo de dados baseado no ModelDef() do fonte informado 
   Local oStruSA1 := FWFormStruct( 2, 'SA1' ) // Cria a estrutura a ser usada na View 

   // Cria o objeto de View 
   oView := FWFormView():New() 

   // Define qual o Modelo de dados ser� utilizado na View 
   oView:SetModel( oModel ) 

   // Adiciona no nosso View um controle do tipo formul�rio 
   // (antiga Enchoice) 
   oView:AddField( 'VIEW_SA1', oStruSA1, 'SA1MASTER' )

   // Criar um "box" horizontal para receber algum elemento da view 
   oView:CreateHorizontalBox( 'TELA' , 100 ) 

   // Relaciona o identificador (ID) da View com o "box" para exibi��o 
   oView:SetOwnerView( 'VIEW_SA1','TELA' ) 
   oView:EnableTitleView('VIEW_SA1','Clientes' )	
   oView:SetViewProperty('VIEW_SA1','SETCOLUMNSEPARATOR', {10})

   //For�a o fechamento da janela na confirma��o
   oView:SetCloseOnOk({||.T.})

// Retorna o objeto de View criado 
Return oView

Static Function ValidPre(oModel)

   Local nOperation := oModel:GetOperation()
   Local lRet := .T.

   If nOperation == MODEL_OPERATION_UPDATE
      If Empty( oModel:GetValue( 'SA1MASTER', 'A1_CGC' ) )
         Help( ,, 'HELP',, 'Informe o CNPJ', 1, 0)      
         lRet := .F.
      EndIf
   EndIf

Return lRet



Static Function fPosModelo ( oModel )

   Local nOperation := oModel:GetOperation()
   Local lRet := .T.

   If nOperation == MODEL_OPERATION_UPDATE
      If Empty( oModel:GetValue( 'SA1MASTER', 'A1_CGC' ) )
         Help( ,, 'HELP',, 'Informe o CNPJ ou CPF do Cliente', 1, 0)      
         lRet := .F.
      EndIf
   EndIf

Return lRet
