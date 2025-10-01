#include 'protheus.ch'
#include 'parmtype.ch'
#INCLUDE "FWMBROWSE.CH"
#INCLUDE "FWMVCDEF.CH"

user function MVC01()  //Constru��o b�sica de um browse.

//Para a constru��o de uma aplica��o que possui um Browse, o MVC utiliza a classe FWMBrowse
oBrowse:=FWMBrowse():New() //FWMBrowse. Esta classe exibe um objeto browse que � constru�do
							// a partir de metadados (dicion�rio). 
//Definimos a tabela que ser� exibida na Browse utilizando o m�todo SetAlias. As colunas, ordens, etc.. 
//A exibi��o � obtidos pelo metadados (dicion�rios). 	
oBrowse:SetAlias('SB1')
//Definimos o t�tulo que ser� exibido como m�todo SetDescription.
oBrowse:SetDescription ('Meus Produtos') // SetDescription. Definimos o t�tulo que ser� exibido como m�todo. 
 

//Se quisermos definir um filtro para o Browse utilizamos o m�todo SetFilterDefault,
// que possui a seguinte sintaxe: 

//oBrowse:SetFilterDefault("B1_TIPO=='ME'")

/*Desabilita��o de detalhes do Browse (DisableDetails) 
Automaticamente para o Browse s�o exibidos, em detalhes, os dados da linha posicionada.
 Para desabilitar esta caracter�stica utilizamos o m�todo DisableDetails.
*/
//oBrowse:DisableDetails()
//oBrowse:DisableDetails()

/*Para o uso de legendas no Browse utilizamos o m�todo AddLegend, que possui a seguinte sintaxe: 
AddLegend(  <cRegra>, <cCor>, <cDescri��o>  ) 
Exemplo: 
oBrowse:AddLegend( "ZA0_TIPO=='1'", "YELLOW", "Autor"  ) 
oBrowse:AddLegend( "ZA0_TIPO=='2'", "BLUE"  , "Interprete"  ) 
cRegra  � a express�o em AdvPL para definir a legenda. 
cCor   � o par�metro que define a cor de cada item da legenda. 
cDescri��o  � a que ser� exibida para cada item da legenda 
Observa��o:   
 Cada uma das legendas se tornar� automaticamente uma op��o de filtro. 
 Cuidado ao montar as regras da legenda. Se houverem regras conflitantes ser� exibida a legenda
 correspondente � 1� regra que for satisfeita. 

*/
oBrowse:AddLegend( "B1_TIPO=='ME'", "YELLOW",  "Mercadoria"  ) 
oBrowse:AddLegend( "B1_TIPO=='GE'", "BLUE"  ,  "Garantia estendida"  )
oBrowse:AddLegend( "B1_TIPO=='EM'", "GREEN"  , "Embalagem"  )
oBrowse:AddLegend( "B1_TIPO=='PA'", "RED"  ,   "Produto acabado"  )
oBrowse:AddLegend( "B1_TIPO=='MC'", "ORANGE",  "Material de consumo"  )





//Com esta estrutura b�sica constru�mos uma aplica��o com Browse. 
//E ao final ativamos a classe.
oBrowse:Activate() // Ativa a classe.

return()



//Return FWMVCMenu('Mcar2')

Static Function MenuDef()

Local aRotina := {}

ADD OPTION aRotina TITLE "Pesquisar"  	ACTION 'AxPesqui()'    OPERATION 1 ACCESS 0
ADD OPTION aRotina TITLE "Visualizar" 	ACTION "VIEWDEF.MVC01" OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE "Incluir"    	ACTION "VIEWDEF.MVC01" OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE "Alterar"    	ACTION "VIEWDEF.MVC01" OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE "Excluir"    	ACTION "VIEWDEF.MVC01" OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE "Imprimir" 	ACTION "VIEWDEF.MVC01" OPERATION 8 ACCESS 0
ADD OPTION aRotina TITLE "Legenda" 		ACTION "u_Lx()"        OPERATION 9 ACCESS 0

Return aRotina	


User Function Lx()

Private cCadastro:="Legenda"
BrwLegenda(cCadastro,"", {{"BR_AZUL","ME - Consumidor final"},;
								{"BR_LARANJA","GE - Garantia estendida"},;
								{"BR_VERDE","EM - Embalagem"},;
								{"BR_VERMELHO","PA - Produto acabado"},;
								{"BR_LARANJA","MC - Material de consumo"}})

Return .T.	


//--------------------------------------------------------------------------------------

Static Function ModelDef

Local oStruZA0 := FWFormStruct( 1, 'SB1' ) //Com a fun��o FWFormStruct a estrutura ser� criada a partir do metadado.
                 //1 para Modelo de dados (Model) e 2 para interface (View);  
                 //'SB1 Alias da tabela no metadado; 

Local oModel // Modelo de dados que ser� constru�do 

//Construindo o Model 
oModel := MPFormModel():New( 'MVC01M' ) 


/*MPFormModel � a classe utilizada para a constru��o de um objeto de modelo de dados (Model). 
Devemos dar um identificador (ID) para o modelo como um todo e tamb�m um para cada componente.  
Essa � uma caracter�stica do MVC, todo componente do modelo ou da interface devem ter um ID,
como formul�rios, GRIDs, boxes, etc. 
COMP011M � o identificador (ID) dado ao Model, � importante ressaltar com rela��o ao identificador (ID) do Model:  
Se a aplica��o � uma Function, o identificador (ID) do modelo de dados (Model) pode ter o mesmo nome da fun��o principal e esta pr�tica � recomendada para facilitar a codifica��o. Por exemplo, se estamos escrevendo a fun��o XPTO, o identificador (ID) do modelo de dados (Model) poder� ser XPTO. 
Se a aplica��o � uma User Function o identificador (ID) do modelo de dados (Model) N�O 
16 - AdvPl utilizando MVC 
pode ter o mesmo nome da fun��o principal, isso por causa dos pontos de entrada que j� s�o criados
automaticamente quando desenvolvemos uma aplica��o em MVC. Isso ser� mais detalhado � frente (ver cap�tulo 0 Pontos de entrada 
*/

/*
Cria��o de um componente de formul�rios no modelo de dados (AddFields) 
O m�todo AddFields adiciona um componente de formul�rio ao modelo. 
A estrutura do modelo de dados (Model) deve iniciar, obrigatoriamente, com um componente de formul�rio. 
Exemplo: 
*/
//oModel:AddFields( 'ZA0MASTER', /*cOwner*/, oStruZA0 )  
//Devemos dar um identificador (ID) para cada componente do modelo.  
//ZA0MASTER � o identificador (ID) dado ao componente de formul�rio no modelo, 
//oStruZA0 � a estrutura que ser� usada no formul�rio e que foi constru�da anteriormente utilizando
//FWFormStruct, note que o segundo par�metro (owner) n�o foi informado, isso porque este � o
//1� componente do modelo, � o Pai do modelo de dados (Model) e portanto n�o tem um componente superior
//ou owner. 


oModel:AddFields( 'ZA0MASTER', /*cOwner*/, oStruZA0 ) 

// Descri��o dos componentes do modelo de dados (SetDescription) 
//Sempre definindo uma descri��o para os componentes do modelo.  
//Com o m�todo SetDescription adicionamos a descri��o ao modelo de dados (Model), essa descri��o ser� usada
//em v�rios lugares como em Web Services por exemplo.
//Adicionamos a descri��o do modelo de dados: 
oModel:SetDescription( 'Modelo de dados de Autor/Interprete' ) 
//Para um modelo que s� cont�m um componente parece ser redundante darmos uma descri��o para o modelo de dados
//(Model) como um todo e uma para o componente, mas quando estudarmos outros modelos onde haver� mais de um
//componente esta a��o ficar� mais clara. 
//Adicionamos a descri��o dos componentes do modelo de dados: 
oModel:GetModel( 'ZA0MASTER' ):SetDescription( 'Dados de Autor/Interprete' )

//Finaliza��o de ModelDef 
//Ao final da fun��o ModelDef, deve ser retornado o objeto de modelo de dados (Model) gerado na fun��o.
Return oModel 

//--------------------------------------------



Static Function ViewDef()

Local oStruZA0 := FWFormStruct( 2, 'SB1' )

//A interface (View) � respons�vel por possibilitar a intera��o do usu�rio, ou seja,
//� o respons�vel por exibir os dados.  
//O ViewDef cont�m a defini��o de toda a parte visual da aplica��o. 
//A interface (View) sempre trabalha baseada em um modelo de dados (Model). Criaremos um objeto de modelo de dados baseado no ModelDef que desejamos.  
//Com a fun��o FWLoadModel obtemos o modelo de dados (Model) que est�
//definido em um fonte, no nosso caso � o pr�prio fonte, mas nada impediria que us�ssemos o modelo
//de qualquer outro fonte em MVC, com isso podemos reaproveitar um mesmo modelo de dados (Model)
//em mais de uma interface (View). 
Local oModel := FWLoadModel( 'MVC01' ) //MVC01 � nome do fonte de onde queremos obter o modelo de dados (Model). 
//Iniciando a constru��o da interface (View) 
oView := FWFormView():New() 
//FWFormView � a classe que dever� ser usada para a constru��o de um objeto de interface (View). 
//Definimos qual o modelo de dados (Model) que ser� utilizado na interface (View). 
oView:SetModel( oModel ) 
//Cria��o de um componente de formul�rios na interface (AddField) 
//Adicionamos no nosso interface (View) um controle do tipo formul�rio (antiga Enchoice),
//para isso usamos o m�todo AddField 
//A interface (View) deve iniciar, obrigatoriamente, com um componente do tipo formul�rio. 
//Devemos dar um identificador (ID) para cada componente do interface (View).
//VIEW_ZA0 � o identificador (ID) dado ao componente da interface (View), oStruZA0 � a estrutura que ser�
//usada e ZA0MASTER � identificador (ID) do componente do modelo de dados (Model) vinculado a este componente
//da interface (View). 
//Cada componente da interface (View) deve ter um componente do modelo de dados (Model) relacionado,
//isso equivale a dizer que os dados do ZA0MASTER ser�o exibidos na interface (View) no componente VIEW_ZA0

oView:AddField( 'VIEW_ZA0', oStruZA0, 'ZA0MASTER' ) 

//Exibi��o dos dados na interface (CreateHorizontalBox / CreateVerticalBox) 
//Sempre precisamos criar um cont�iner1, um objeto, para receber algum elemento da interface (View).
//Em MVC criaremos sempre box horizontal ou vertical para isso. 
//O m�todo para cria��o de um box horizontal �: 
oView:CreateHorizontalBox( 'TELA' , 100 ) 
//Devemos dar um identificador (ID) para cada componente da interface (View). 
//TELA � o identificador (ID) dado ao box e o n�mero 100 representa o percentual da tela que ser� utilizado pelo Box. 
//No MVC n�o h� refer�ncias a coordenadas absolutas de tela, os componentes visuais s�o sempre All Client,
//ou seja, ocupar�o todo o cont�iner onde for inserido.

//Relacionando o componente da interface (SetOwnerView) 
//Precisamos relacionar o componente da interface (View) com um box para exibi��o, para isso usamos o m�todo
// SetOwnerView.
oView:SetOwnerView( 'VIEW_ZA0', 'TELA' ) 
//oView:SetOwnerView( 'VIEW_ZA0', 'TELA' ) 
// Finaliza��o da ViewDef 
//Ao final da fun��o ViewDef, deve ser retornado o objeto de interface (View) gerado 


Return oView 



 



