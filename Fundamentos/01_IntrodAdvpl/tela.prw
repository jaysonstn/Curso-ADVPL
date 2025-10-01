#include "protheus.ch"
#include "TOTVS.CH"

/*usar funções 
tsay()
tget() 
tdialog()
*/
user function tela()



// declaração de veriaveis 

local       oDlg                                    as object
local       cTGetnome                               as char 
local       cTGetCpf                                as char 
local       cTGetRg                                 as char 
local       cTGetlogra                              as char 
local       cTGetnumero                             as char 
local       cTGetcomple                             as char 
local       cTGetnacio                              as char 
local       cTGetemail                              as char 
local       cTGetcel                                as char 
local       cTGettel                                as char 
local       cTGetCep                                as char 
local       cTGetCidade                             as char 
local       dData           := CTOD("  /  /  ")     as date
local       aArraysexo          :={}                as Array
LOCAL       aArrayEStado    :={}                    as Array
local       oSayCadPes                              as object
local       oSayNome                                as object                                      
local       oSayCpf                                 as object     
local       oSayRg                                  as object    
local       oSaySexo                                as object      
local       oSayNasci                               as object       
local       oSayNacio                               as object       
local       oSayEmail                               as object       
local       oSayCel                                 as object     
local       oSayTel                                 as object     
local       oSaylogra                               as object      
local       oSayNumero                              as object        
local       oSayComplemen                           as object           
local       oSayRefe                                as object      
local       oSayCep                                 as object     
local       oSayCidade                              as object        
local       oSayEstado                              as object
local       oTFont                                  as object
local       oTFont2                                 as object
local       oTFont3                                 as object
local       oCombosexo                              as object
local       oComboestado                            as object
local       cComboEstado                            as char
local       cCombosexo                              as char
local       oPanel                                  as object

aArraysexo    :={"","Masculino","Feminino"}
aArrayEStado  :={"","AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RR","RO","RJ","RN","RS","SC","SP","SE","TO"}


cCombosexo := aArraysexo[1]
cComboEstado := aArrayEStado[1]

asize(aArraysexo,3)
asize(aArrayEStado,29)





oDlg    := TDialog():New(0,0,1200,800,'Exemplo de Tela',,,,,CLR_BLACK,CLR_WHITE,,,.T.,,,,1000,650,)
oTFont  := TFont():New('Arial Black',,-11,.T.)
oTFont2 := TFont():new('Times New Roman',,-24,.T.)
oTFont3 := TFont():New('Arial Black',,13 ,.T.)

// construção da tela 
lHtml := .T.


// Titulos do lado esquerda
oSayCadPes    := TSay():New(01,200,{||"Cadastro Pessoal"},oDlg,,oTFont2,,,,.T.,,,400,300,,,,,,lHtml)
oSayNome      := TSay():New(34,06,{||"Nome*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayCpf       := TSay():New(58,06,{||"CPF*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayRg        := TSay():new(82,06,{||"RG*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSaySexo      := TSay():new(106,06,{||"Sexo*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayNasci     := TSay():new(130,06,{||"Nascimento*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayNacio     := TSay():new(154,06,{||"Nacionalidade*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayEmail     := TSay():new(178,06,{||"Email"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayCel       := TSay():new(202,06,{||"Celular*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayTel       := TSay():new(226,06,{||"Telefone"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
// Titulos do lado direita 
oSaylogra      := TSay():new(35,300,{||"Logradouro*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayNumero    := TSay():new(59,300,{||"Numero*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayBairro    := TSay():new(83,300,{||"Bairro"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayComplemen := TSay():new(107,300,{||"Complementos*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayRefe      := TSay():new(131,300,{||"Referencia"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayCep       := TSay():new(155,300,{||"CEP*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayCidade    := TSay():new(179,300,{||"Cidade*"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)
oSayEstado    := TSay():new(203,300,{||"Estado"},oDlg,,oTFont,,,,.T.,,,400,300,,,,,,lHtml)

//painel


 
// exibe textos e campos 
cTGetnome := space(50)
oTGetnome := TGet():new( 34,55,{|u|if(PCount()>0,cTGetnome:=u,cTGetnome)},oDlg,090,009,"@A",,,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetnome,,,, )

cTGetCpf := space(50)
oTGetCpf := TGet():new( 58,55,{|u|if(PCount()>0,cTGetCpf:=u,cTGetCpf)},oDlg,090,009,"@9 999.999.999-99",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetCpf,,,, )

cTGetRg := space(50)
oTGetRg := TGet():new( 82,55,{|u|if(PCount()>0,cTGetRg:=u,cTGetRg)},oDlg,090,009,"@9 99.999.999-9",,0,,oTFont3,.F.,,.T.,,.F.,,.T.,.F.,,.F.,.F.,,cTGetRg,,,, )

oCombosexo :=  TComboBox():Create(oDlg,{|u|if(PCount()>0,cCombosexo:=u,cCombosexo)},106,55,aArraysexo,090,009,,{||},,,,.T.,,,,,,,,,'cCombo')

oTGetdata := tget():new( 130,55,{|u| iif( Pcount( )>0, dData := u,dData ) },oDlg,090,009,"@",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,,,,, )

cTGetnacio := space(50)
oTGetnacio := tget():new( 155,55,{|u|if(PCount()>0,cTGetnacio:=u,cTGetnacio)},oDlg,090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetnacio,,,, )

cTGetemail := space(50)
oTGetemail := tget():new( 178,55,{|u|if(PCount()>0,cTGetemail:=u,cTGetemail)},oDlg,090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetemail,,,, )

cTGetcel := space(50)
oTGetcel := tget():new( 202,55,{|u|if(PCount()>0,cTGetcel:=u,cTGetcel)},oDlg,090,009,"@9 (99) 99999-9999",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetcel,,,, )


cTGettel := space(50)
oTGettel := tget():new( 226,55,{|u|if(PCount()>0,cTGettel:=u,cTGettel)},oDlg,090,009,"@9 (99) 9999-9999",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGettel,,,, )


cTGetlogra := space(50)
oTGetlogra := TGet():new( 34,350,{|u|if(PCount()>0,cTGetlogra:=u,cTGetlogra)},oDlg,090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetlogra,,,, )

cTGetnumero := space(50)
oTGetnumro  := tget():new( 58,350,{|u|if(PCount()>0,cTGetnumero:=u,cTGetnumero)},oDlg,090,009,"@9",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetnumero,,,, )

cTGetBairro := space(50)
oTGetBairro := tget():new( 83,350,{|u|if(PCount()>0,cTGetBairro:=u,cTGetBairro)},oDlg,090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetcomple,,,, )

cTGetcomple := space(50)
oTGetcomple := tget():new( 107,350,{|u|if(PCount()>0,cTGetcomple:=u,cTGetcomple)},oDlg,090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetcomple,,,, )



cTGetRefe := space(50)
oTGetRefe := tget():new( 131,350,{|u|if(PCount()>0,cTGetRefe:=u,cTGetRefe)},oDlg,090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetRefe,,,, )

cTGetCep := space(50)
oTGetCEP := tget():new( 155,350,{|u|if(PCount()>0,cTGetCep:=u,cTGetCep)},oDlg,090,009,"@9 99999-999",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetCep,,,, )

cTGetCidade := space(50)
oTGetCidade := tget():new( 179,350,{|u|if(PCount()>0,cTGetCidade:=u,cTGetCidade)},oDlg,090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetCidade,,,, )


oComboestado :=  TComboBox():Create(oDlg,{|u|if(PCount()>0,cComboEstado:=u,cComboEstado)},203,350,aArrayEStado,090,009,,{||},,,,.T.,,,,,,,,,'cCombo')

oTButton := TButton():New( 230, 350, "Salvar",oDlg,{||valid(cTGetnome,cTGetCpf,cTGetRg,cTGetcel,cTGetCidade,cTGetemail,cTGetlogra,cTGetnacio,cTGetCep,cComboEstado,cCombosexo,cTGettel)}, 50,20,CLR_BLUE,oTFont,.F.,.T.,.F.,,.F.,,,.F. )

oDlg:Activate(,,,.T.,{||},,{||} )

return

static function valid(cTGetnome,cTGetCpf,cTGetRg,cTGetcel,cTGetCidade,cTGetemail,cTGetlogra,cTGetnacio,cTGetCep,cComboEstado,cCombosexo,cTGettel)


if vazio(cTGetnome)
   MSGALERT(" FALTA PREENCHER OS CAMPO (Nome)")                     
endif 

if vazio(cTGetCpf)
   MSGALERT("FALTA PREENCHER OS CAMPO (CPF)") 
endif

if vazio(cTGetRg)
   MSGALERT("FALTA PREENCHER OS CAMPO (RG)")
endif

if vazio(cTGetcel)
   MSGALERT("FALTA PREENCHER OS CAMPO (Celular)")
endif

if vazio(cTGetemail)
   MSGALERT("FALTA PREENCHER OS CAMPO (Email)")
endif

if vazio(cTGetCidade)
    MSGALERT("FALTA PREENCHER OS CAMPO (Cidade)")
endif

if vazio(cTGetnacio)
   MSGALERT("FALTA PREENCHER OS CAMPO (Nacionalidade)")
endif

if vazio(cTGetlogra)
   MSGALERT(" FALTA PREENCHER OS CAMPO (Logradouro)")
endif

if vazio(cTGetCep)
   MSGALERT(" FALTA PREENCHER OS CAMPO (CEP)")
endif

if vazio(cComboEstado)
   MSGALERT("FALTA PREENCHER OS CAMPO (ESTADO)")  
endif

if vazio(cCombosexo)
   MSGALERT("FALTA PREENCHER OS CAMPO (SEXO)")  
endif

// Validação

if Len(alltrim(cTGetCpf)) < 14
 
   MSGALERT("O campo CPF esta faltando")
endif


if Len(alltrim(cTGetRg)) < 12
 
   MSGALERT("O campo RG esta faltando")
endif


if Len(alltrim(cTGetcel)) < 14
 
   MSGALERT("O campo Celular esta faltando")
endif

if Len(alltrim(cTGettel)) < 13
  
     MSGALERT("O campo Telefone esta faltando")

endif    

if Len(alltrim(cTGetCep)) < 9
 
   MSGALERT("O campo CEP esta faltando")
endif

 


return

