#include 'protheus.ch'
#include 'parmtype.ch'

user function Mvc_br1()

oBrowse:=FWMBROWSE():NEW()
oBrowse:SetAlias("SA1")
oBrowse:SetDescription("Clientes")
//oBrowse:Activate()

//Defini��o da legenda

oBrowse:addlegend("A1_TIPO=='F'","YELLOW","Consumidor final")
oBrowse:addlegend("A1_TIPO=='L'","BLUE","Produtor rural")
obrowse:addlegend("A1_TIPO=='R'","RED","Revendedor")
obrowse:addlegend("A1_TIPO=='S'","ORANGE","Solid�rio")
obrowse:addlegend("A1_TIPO=='X'","GREEN","Exporta��o")

//oBrowse:Activate()

//Filtros de um browse

//oBrowse:SetfilterDefault("A1_TIPO=='F'")

oBrowse:Activate()


return

Static Function ModelDef() 
//Aqui s�o definidas as regras de neg�cio ou modelo de dados (model)
//Cont�m - Entidades envolvidas
//Valida��es, relacionamentos, persist�ncia de dados grava��o.

Local oModel //Modelo de dados que ser� constru�do.
			//Construindo o modelo.
//Cria o objeto do modelo de dados.
oModel:=MPFormModel():New('COMP011M') //MPFormModel � a classe utilizada para a
										//constru��o de um objeto de modelo de dados(model).
//Cria a estrutura a ser usada no modelo de dados.
Local oStruSA1:=FWFormStruct(1,'SA1')

//Adiciona ao modelo um componente de formul�rio.
oModel:AddFields('SA1MASTER', /*cOwner*/, oStrucSA1)

//Adiciona a descri��o do modelo de dados
oModel:SetDescription('Modelo de dados de clientes')

//Adiciona a descri��o do componente do modelo de dados
oModel:GetModel('SA1MASTER'):SetDescription('Dados do cliente')

//Retorna o modelo de dados

Return oModel

//--------------------------------------

Static Function ViewDef()

//Cria um objeto de modelo de dados baseado no Modeldef() do fonte informado.
Local oModel:=FWLoadModel('Mvc_br1')
//Cria a estrutura a ser usada na view.
Local oStruSA1:=FWForStruct(2,'SA1')
//Interface de visualiza��o constru�da.
Local oView
//Cria o objeto da View
oView:FWForView():New()
//Define qual o modelo de dados ser� utilizado na View.
oView:SetModel(oModel)
//Adiciona no nosso View um controle do tipo formul�rio.
//Antiga Enchoice)
oView:AddField('VIEW_SA1', oStruSA1,'SA1MASTER')
)//Cria um "box" horizontal para receber algum elemento da view.
oView:CreateHorizontalBox('TELA', 100)
//Relaciona o identificador (ID) da view com o "box" para exibi��o.
oView:SetOwnerView('VIEW_SA1', 'TELA')
//Retorna o objeto de View criado.
Return oView







Static Function MenuDef()

//Return(FWMVCMENU('CADICLI')) // inclui no menu os bot�es de incluir, alterar e etc.
Local aRotina:={}

ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.COMP011_MVC' OPERATION 2
ADD OPTION aRotina TITLE 'Legenda'    ACTION 'u_zMVC01Leg'     OPERATION 6                      ACCESS 0 //OPERATION X
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.COMP011_MVC' OPERATION 3
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.zMVCMd1' OPERATION 4
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.zMVCMd1' OPERATION 5
 
Return aRotina





