#include "protheus.ch"
#include "TOTVS.CH"
#INCLUDE "TBICONN.CH"
 
//comeÃ§ando tudo denovo



User Function Telaecr()

   local       aArraysexo          :={}                as Array
   LOCAL       aArrayEStado    :={}                    as Array
   local       dData           := CTOD("  /  /  ")     as date
   local       oTFolder                                as object
   local       oSaycodigo                              as object
   local       oSayCpf                                 as object
   local       oSayRg                                  as object
   local       oSaySexo                                as object
   local       oSayNasci                               as object
   local       oSayEmail                               as object
   local       oSayCel                                 as object
   local       oSayTel                                 as object
   local       oSaylogra                               as object
   local       oSayNumero                              as object
   local       oSayComplemen                           as object
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
   local       cTGetcodigo                             as char
   local       cTGetCpf                                as char
   local       cTGetRg                                 as char
   local       cTGetlogra                              as char
   local       cTGetnumero                             as char
   local       cTGetcomple                             as char
   local       cTGetemail                              as char
   local       cTGetcel                                as char
   local       cTGettel                                as char
   local       cTGetCep                                as char
   local       cTGetCidade                             as char
   local       cEstilobutton                           as char
   local       cEstilotfolder                          as char
   local       cEstilotget                             as char
   local       cEstilofundo2                           as char
   local       cEstilofont                             as char


   PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01'


   //css do button
   cEstilobutton := " QPushButton;"
   cEstilobutton += " border-width: 2px;"
   cEstilobutton += " border: 2px solid #C0C0C0;"
   cEstilobutton += " border-radius: 5px;"
   cEstilobutton += " background-color: rgb(255, 255, 255,);"
   cEstilobutton += " border-color: rgb(30,233,233);"
   cEstilobutton += " font: bold 12px Arial;"
   cEstilobutton += " color: rgb(8,138,138,);"
   cEstilobutton += " text-shadow: rgb(235, 97, 17) 3px 3px 3px;"
   cEstilobutton += " padding: 6px;"
   cEstilobutton += " transition: 0.5s;"
   cEstilobutton += "}"
   cEstilobutton += "QPushButton:pressed {"
   cEstilobutton += " background-color: rgb(30,233,233)"
   cEstilobutton += " border-style: inset;"
   cEstilobutton += "}"
   //css do tget
   cEstilotget := " input;"
   cEstilotget += " border: 2px solid #C0C0C0;"
   cEstilotget += " border-radius: 5px;"
   cEstilotget += " border-color: rgb(8,138,138,);"
   cEstilotget += " color: rgb(8,138,138)"
   //css dialog
   cEstilofundo2 := " body;"
   cEstilofundo2 += " background-color: rgb(255, 255, 255,);"
   cEstilofundo2 += " color: rgb(8,138,138,);"
   cEstilofundo2 += " font-family: Arial;"
   cEstilofundo2 += " text-shadow: rgb(235, 97, 17) 3px 3px 3px;"
   cEstilofundo2 += " "
   cEstilofundo2 += " a{"
   cEstilofundo2 += " background-color: rgb(0, 0, 0,);"
   cEstilofundo2 += " display: block;"
   cEstilofundo2 += " padding: 8px;"
   cEstilofundo2 += " }"
   //css fonte
   cEstilofont := " font;"
   cEstilofont += " font-family: Arial;"
   cEstilofont += " font-size: 15px;"
   cEstilofont += " color: rgb(0,0,0,);"
   cEstilofont += " text-shadow: 2px 2px red;"

   //css tfoldel
   cEstilotfolder := " a;"
   cEstilotfolder += " color rgb(8,138,138,);"
   cEstilotfolder += " background-color: rgb(255, 255, 255,);"
   // arrays
   aArraysexo    :={"","Masculino","Feminino"}
   aArrayEStado  :={"","AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RR","RO","RJ","RN","RS","SC","SP","SE","TO"}


   cCombosexo := aArraysexo[1]
   cComboEstado := aArrayEStado[1]

   asize(aArraysexo,3)
   asize(aArrayEStado,29)


   oDlg    := TDialog():New(0,0,1100,650,'Exemplo de Tela',,,,,CLR_BLACK,CLR_WHITE,,,.T.,,,,1000,600,)
   oDlg   :SETCSS(cEstilofundo2)

   // Cria a Folder

   oTFont  := TFont():New('Arial Black',,-13,.T.)

   oTFont2 := TFont():new('Times New Roman',,-24,.T.)
   oTFont3 := TFont():New('Arial Black',,13 ,.T.)

   oSayCadPes     := TSay():New(01,25,{||"Cadastro Pessoal"},oDlg,,oTFont2,,,,.T.,rgb(221,176,36),,400,275,,,,,,)

   aTFolder := { 'Dados Pessoal', 'Endereço' }
   oTFolder := TFolder():New( 25,00,aTFolder,,oDlg,,,,.T.,,550,300 )
   oTFolder:SETCSS(cEstilotfolder)

   // aba cadastrais

   oSaycodigo     := TSay():New(24,06,{||"Codigo*"},oTFolder:aDialogs[1],,oTFont,,,,.T.,rgb(221,176,36),,400,300,,,,,,)
   oSaycodigo:SETCSS(cEstilofont)
   cTGetcodigo    := space(6)
   oTGetcodigo    := TGet():new( 24,40,{|u|if(PCount()>0,cTGetcodigo:=u,cTGetcodigo)},oTFolder:aDialogs[1],090,009,"@A",,,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetcodigo,,,, )
   oTGetcodigo    :SETCSS(cEstilotget)

   oSaynome  := TSay():New(24,275,{||"nome*"},oTFolder:aDialogs[1],,oTFont,,,,.T.,rgb(221,176,36),,400,300,,,,,,)
   oSaynome:SETCSS(cEstilofont)
   cTGetNome := space(50)
   oTGetNome := TGet():new( 24,330,{|u|if(PCount()>0,cTGetNome:=u,cTGetNome)},oTFolder:aDialogs[1],090,009,"@A",,,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetNome,,,, )
   oTGetNome :SETCSS(cEstilotget)

   oSayCpf      := TSay():New(58,06,{||"CPF*"},oTFolder:aDialogs[1],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayCpf      :SETCSS(cEstilofont)
   cTGetCpf     := space(50)
   oTGetCpf     := TGet():new( 58,40,{|u|if(PCount()>0,cTGetCpf:=u,cTGetCpf)},oTFolder:aDialogs[1],090,009,"@9 999.999.999-99",{||},0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetCpf,,,, )
   oTGetCpf     :SETCSS(cEstilotget)

   oSayRg       := TSay():new(58,275,{||"RG*"},oTFolder:aDialogs[1],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayRg       :SETCSS(cEstilofont)
   cTGetRg      := space(50)
   oTGetRg      := TGet():new( 58,330,{|u|if(PCount()>0,cTGetRg:=u,cTGetRg)},oTFolder:aDialogs[1],090,009,"@9 99.999.999-9",{||},0,,oTFont3,.F.,,.T.,,.F.,,.T.,.F.,,.F.,.F.,,cTGetRg,,,, )
   oTGetRg      :SETCSS(cEstilotget)

   oSaySexo     := TSay():new(92,06,{||"Sexo*"},oTFolder:aDialogs[1],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSaySexo     :SETCSS(cEstilofont)
   oCombosexo   :=  TComboBox():Create(oTFolder:aDialogs[1],{|u|if(PCount()>0,cCombosexo:=u,cCombosexo)},92,40,aArraysexo,090,009,,{||},,,,.T.,,,,,,,,,'cCombo')
   oCombosexo   :SETCSS(cEstilotget)

   oSayNasci    := TSay():new(92,275,{||"Nascimento*"},oTFolder:aDialogs[1],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayNasci    :SETCSS(cEstilofont)
   oTGetdata    := tget():new( 92,330,{|u| iif( Pcount( )>0, dData := u,dData ) },oTFolder:aDialogs[1],090,009,"@",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,,,,, )
   oTGetdata    :SETCSS(cEstilotget)

   oSayCel      := TSay():new(126,06,{||"Celular*"},oTFolder:aDialogs[1],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayCel      :SETCSS(cEstilofont)
   cTGetcel     := space(50)
   oTGetcel     := tget():new( 126,40,{|u|if(PCount()>0,cTGetcel:=u,cTGetcel)},oTFolder:aDialogs[1],090,009,"@9 (99) 99999-9999",{||VlCampo(4,cTGetcel)},0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetcel,,,, )
   oTGetcel     :SETCSS(cEstilotget)

   oSayTel      := TSay():new(126,275,{||"Telefone"},oTFolder:aDialogs[1],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayTel      :SETCSS(cEstilofont)
   cTGettel     := space(50)
   oTGettel     := tget():new( 126,330,{|u|if(PCount()>0,cTGettel:=u,cTGettel)},oTFolder:aDialogs[1],090,009,"@9 (99) 9999-9999",{||},0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGettel,,,, )
   oTGettel     :SETCSS(cEstilotget)

   oSayEmail    := TSay():new(160,06,{||"Email"},oTFolder:aDialogs[1],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayEmail    :SETCSS(cEstilofont)
   cTGetemail   := space(50)
   oTGetemail   := tget():new( 160,40,{|u|if(PCount()>0,cTGetemail:=u,cTGetemail)},oTFolder:aDialogs[1],090,009,"@",{||VlCampo(5,cTGetemail)},0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetemail,,,, )
   oTGetemail   :SETCSS(cEstilotget)

   //aba endereço

   oSaylogra    := TSay():new(24,06,{||"Logradouro*"},oTFolder:aDialogs[2],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSaylogra    :SETCSS(cEstilofont)
   cTGetlogra   := space(50)
   oTGetlogra   := TGet():new( 24,65,{|u|if(PCount()>0,cTGetlogra:=u,cTGetlogra)},oTFolder:aDialogs[2],090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetlogra,,,, )
   oTGetlogra   :SETCSS(cEstilotget)

   oSayNumero   := TSay():new(24,275,{||"Numero*"},oTFolder:aDialogs[2],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayNumero   :SETCSS(cEstilofont)
   cTGetnumero  := space(50)
   oTGetnumro   := tget():new( 24,330,{|u|if(PCount()>0,cTGetnumero:=u,cTGetnumero)},oTFolder:aDialogs[2],090,009,"@9",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetnumero,,,, )
   oTGetnumro   :SETCSS(cEstilotget)

   oSayComplemen:= TSay():new(58,06,{||"Complementos*"},oTFolder:aDialogs[2],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayComplemen:SETCSS(cEstilofont)
   cTGetcomple  := space(50)
   oTGetcomple  := tget():new( 58,65,{|u|if(PCount()>0,cTGetcomple:=u,cTGetcomple)},oTFolder:aDialogs[2],090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetcomple,,,, )
   oTGetcomple  :SETCSS(cEstilotget)

   oSayBairro   := TSay():new(58,275,{||"Bairro"},oTFolder:aDialogs[2],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayBairro   :SETCSS(cEstilofont)
   cTGetBairro  := space(50)
   oTGetBairro  := tget():new( 58,330,{|u|if(PCount()>0,cTGetBairro:=u,cTGetBairro)},oTFolder:aDialogs[2],090,009,"@",,0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetcomple,,,, )
   oTGetBairro  :SETCSS(cEstilotget)

   oSayCep      := TSay():new(92,06,{||"CEP*"},oTFolder:aDialogs[2],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayCep      :SETCSS(cEstilofont)
   cTGetCep     := space(50)
   oTGetCEP     := tget():new( 92,65,{|u|if(PCount()>0,cTGetCep:=u,cTGetCep)},oTFolder:aDialogs[2],090,009,"@9 99999-999",{||},0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetCep,,,, )
   oTGetCEP     :SETCSS(cEstilotget)

   oSayCidade   := TSay():new(92,275,{||"Cidade*"},oTFolder:aDialogs[2],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayCidade   :SETCSS(cEstilofont)
   cTGetCidade  := space(50)
   oTGetCidade  := tget():new( 92,330,{|u|if(PCount()>0,cTGetCidade:=u,cTGetCidade)},oTFolder:aDialogs[2],090,009,"@",{||},0,,oTFont3,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTGetCidade,,,, )
   oTGetCidade  :SETCSS(cEstilotget)

   oSayEstado   := TSay():new(126,275,{||"Estado"},oTFolder:aDialogs[2],,oTFont,,,,.T.,,,400,300,,,,,,)
   oSayEstado   :SETCSS(cEstilofont)
   oComboestado :=  TComboBox():Create(oTFolder:aDialogs[2],{|u|if(PCount()>0,cComboEstado:=u,cComboEstado)},126,330,aArrayEStado,090,009,,{||},,,,.T.,,,,,,,,,'cCombo')
   oComboestado :SETCSS(cEstilotget)

   //botões

   oTButtonSalvar       := TButton():New( 01,435, "Salvar",oDlg,{||valide(cTGetcodigo,cTGetCpf,cTGetRg,cTGetcel,cTGetCidade,cTGetemail,cTGetlogra,cTGetCep,cComboEstado,cCombosexo,cTGettel)}, 40,20,CLR_BLUE,oTFont,.F.,.T.,.F.,,.F.,,,.F. )
   oTButtonSalvar:SETCSS(cEstilobutton)


   oTButtonFechar       := TButton():New( 01,390, "Fechar",oDlg,{||oDlg:End()}, 40,20,CLR_CYAN,oTFont,.F.,.T.,.F.,,.F.,,,.F. )
   oTButtonFechar:SETCSS(cEstilobutton)

   oTButtonconsultarcep := TButton():New( 126,65, "Consultar o cep",oTFolder:aDialogs[2],{||browser2()}, 090,20,CLR_CYAN,oTFont,.F.,.T.,.F.,,.F.,,,.F. )
   oTButtonconsultarcep:SETCSS(cEstilobutton)

   oTBitmap1 := TBitmap():New(01,01,50,50,,"C:\Users\Kaique ECR\Downloads\Background.png",.T.,oDlg,;
      {||},,.F.,.F.,,,.F.,,.T.,,.F.)
   oTBitmap1:lAutoSize := .F.




   oDlg:Activate(,,,.T.,{||},,{||} )

   RESET ENVIRONMENT

return

static function valide(cTGetcodigo,cTGetCpf,cTGetRg,cTGetcel,cTGetCidade,cTGetemail,cTGetlogra,cTGetCep,cComboEstado,cCombosexo,cTGettel)
   local cMsg := "Campos não preenchidos:" + CRLF as char
   LOCAL nCount := 15
   if vazio(cTGetcodigo)
      nCount := nCount -1
      cMsg += "NOME" +  CRLF
   endif

   if vazio(cTGetCpf)
      nCount2 := nCount -1
      cMsg   += "CPF" + CRLF
   endif

   if vazio(cTGetRg)
      nCount := nCount -1
      cMsg   += "RG" + CRLF
   endif

   if vazio(cTGetcel)
      nCount := nCount -1
      cMsg   += "CELULAR" + CRLF
   endif

   if vazio(cTGetemail)
      nCount := nCount -1
      cMsg   += "EMAIL" + CRLF
   endif

   if vazio(cTGetCidade)
      nCount := nCount -1
      cMsg   += "CIDADE" + CRLF
   endif



   if vazio(cTGetlogra)
      nCount := nCount -1
      cMsg   += "LOGRADOURO" + CRLF
   endif

   if vazio(cTGetCep)
      nCount := nCount -1
      cMsg   += "CEP" + CRLF
   endif

   if vazio(cComboEstado)
      nCount := nCount -1
      cMsg   += "ESTADO" + CRLF
   endif

   if vazio(cCombosexo)
      nCount := nCount -1
      cMsg   += "SEXO" + CRLF
   endif

   // Validação

   if Len(alltrim(cTGetCpf)) < 14
      nCount := nCount -1
      cMsg   += "CPF" + CRLF
   endif


   if Len(alltrim(cTGetRg)) < 12
      nCount := nCount -1
      cMsg   += "RG" + CRLF
   endif

   if Len(alltrim(cTGetcel)) < 14
      nCount := nCount -1
      cMsg   += "CELULAR" + CRLF
   endif

   if Len(alltrim(cTGettel)) < 13
      nCount := nCount -1
      cMsg   += "TELEFONE" + CRLF
   endif

   if Len(alltrim(cTGetCep)) < 9
      nCount := nCount  -1
      cMsg   += "CEP" + CRLF
   endif

   IF nCount < 15
      MsgAlert(cMsg)
   elseif nCount = 15
      gravardados(cTGetcodigo, cTGetNome, cTGetCpf, cTGetRg, cTGetcel, cTGetemail, cTGetlogra, cTGetCep, cTGetBairro, cComboEstado)
   ENDIF

Return

static function VlCampo(nop,cString,cTGetcel)

   local lret := .F.
   local aArrayEmailF := {"#","%","!","()","á","ç","\"}
   local nCount := 0
   local aArray2EmailT := {"@",".","com"}
   local nCount2 := 3
   local i := 0
   // validação do email

   if nOp == 5
      for i:=1 to len(aArrayemailF)
         if aArrayemailF[i] $ cString
            nCount++
         ENDIF
      next i

      if nCount > 0

         lret := .F.

      else
         lret := .T.

      ENDIF

      for i:=1 to len(aArray2EmailT)
         if aArray2EmailT[i] $ cString
            nCount2++
         ENDIF
      next i

      if nCount2 == 3

         lret := .F.

      else
         lret := .T.

      ENDIF
   ENDIF
   // validação do cpf

   if nOp == 4
      if Len(alltrim(cTGetcel)) < 14

         lret := .T.

      else
         lret := .F.

      ENDIF
   ENDIF

return lret

static function gravardados(cTGetcodigo, cTGetNome, cTGetCpf, cTGetRg, cTGetcel, cTGetemail, cTGetlogra, cTGetCep, cTGetBairro, cComboEstado)

   DbSelectArea("SA1")
   DbSetOrder(1)

   RecLock("SA1",.T.)
   SA1->A1_COD:=cTGetcodigo
   SA1->A1_NOME:=cTGetNome
   SA1->A1_CGC:=cTGetCpf
   SA1->A1_RG:=cTGetRg
   SA1->A1_TEL:=cTGetcel
   SA1->A1_EMAIL:=cTGetemail
   SA1->A1_END:=cTGetlogra
   SA1->A1_CEP:=cTGetCep
   SA1->A1_BAIRRO:=cTGetBairro
   SA1->A1_ESTADO:=cComboEstado
   MsUnlock()

   MsgInfo("Os dados foram salvos com sucesso","Sucesso")


RETURN
