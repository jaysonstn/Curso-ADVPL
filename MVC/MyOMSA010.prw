#Include 'Protheus.ch'
#Include "TOTVS.CH"
#Include "APWEBEX.CH"
#Include "TBICONN.CH"

User Function MyOMSA010()

Local aCabec := {}
Local aItens := {}
Local aLinha := {}
Local nY := 0
Local lOk := .T.

Private lMsErroAuto := .F.
 
//��������������������������������������������������������������Ŀ
//| Abertura do ambiente |
//����������������������������������������������������������������
 
ConOut(Repl("-",80))
 
ConOut(PadC("Teste de Inclusao de 1 tabela de preco",80))
 
//PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"
 
//��������������������������������������������������������������Ŀ
//| Verificacao do ambiente para teste |
//����������������������������������������������������������������
 
dbSelectArea("SB1")
dbSetOrder(1)
If !SB1->(MsSeek(xFilial("SB1")+"PA001"))
    lOk := .F.
    ConOut("Cadastrar produto: PA001")
EndIf
 
If !SB1->(MsSeek(xFilial("SB1")+"PA002"))
    lOk := .F.
    ConOut("Cadastrar produto: PA002")
EndIf
 
If lOk
    ConOut("Inicio: "+Time())
    For nY := 1 To 1
        aCabec := {}
        aItens := {}
        aadd(aCabec,{"DA0_DESCRI" ,"TESTE DE TABELA",Nil})
        //aadd(aCabec,{"DA0_CONDPG" ,"001",Nil})
        aLinha := {}
        aadd(aLinha,{"DA1_ITEM","0001"})
        aadd(aLinha,{"DA1_CODPRO","PA001"})
        aadd(aLinha,{"DA1_PRCVEN",10,Nil})         
        aadd(aItens,aLinha)
        aLinha := {}
        aadd(aLinha,{"DA1_ITEM","0002"})
        aadd(aLinha,{"DA1_CODPRO","PA002"})
        aadd(aLinha,{"DA1_PRCVEN",10,Nil})         
        aadd(aItens,aLinha)
 
        //��������������������������������������������������������������Ŀ
        //| Teste de Inclusao |
        //����������������������������������������������������������������
 
        aRotina := MenuDef()
 
        FWMVCRotAuto(ModelDef(),"DA0",3,{{"OMSA010_DA0",aCabec},{"OMSA010_DA1",aItens}})
 
        If !lMsErroAuto
            ConOut("Incluido com sucesso! ")
        Else
            ConOut("Erro na inclusao!")
        EndIf
    Next nY
    ConOut("Fim : "+Time())
 
    //��������������������������������������������������������������Ŀ
    //| Teste de alteracao |
    //����������������������������������������������������������������
 
    aCabec := {}
    aItens := {}
    For nY := 1 To 1
        aCabec := {}
        aItens := {}
        aadd(aCabec,{"DA0_CODTAB" ,DA0->DA0_CODTAB,Nil})
        aadd(aCabec,{"DA0_DESCRI" ,"TESTE DE TABELA",Nil})
        //aadd(aCabec,{"DA0_CONDPG" ,"001",Nil})
        aLinha := {}
        aadd(aLinha,{"LINPOS","DA1_ITEM","0001"})
        aadd(aLinha,{"AUTDELETA","N",Nil})
        aadd(aLinha,{"DA1_CODPRO","PA001"})
        aadd(aLinha,{"DA1_PRCVEN",11,Nil})         
        aadd(aItens,aLinha)
        aLinha := {}
        aadd(aLinha,{"LINPOS","DA1_ITEM","0002"})
        aadd(aLinha,{"AUTDELETA","N",Nil})             
        aadd(aLinha,{"DA1_CODPRO","PA002"})
        aadd(aLinha,{"DA1_PRCVEN",11,Nil})         
        aadd(aItens,aLinha)
    Next nY
    ConOut(PadC("Teste de alteracao",80))
    ConOut("Inicio: "+Time())
 
    //��������������������������������������������������������������Ŀ
    //| Teste de alteracao |
    //����������������������������������������������������������������
 
    aRotina := MenuDef()
    FWMVCRotAuto(ModelDef(),"DA0",4,{{"OMSA010_DA0",aCabec},{"OMSA010_DA1",aItens}})
    ConOut("Fim : "+Time())
    ConOut(Repl("-",80))
 
    //��������������������������������������������������������������Ŀ
    //| Teste de Exclusao |
    //����������������������������������������������������������������
 
    ConOut(PadC("Teste de exclusao",80))
    ConOut("Inicio: "+Time())
    aRotina := MenuDef()
    FWMVCRotAuto(ModelDef(),"DA0",5,{{"OMSA010_DA0",aCabec},{"OMSA010_DA1",aItens}})
 
    If !lMsErroAuto
        ConOut("Exclusao com sucesso! "+DA0->DA0_CODTAB)
    Else
        ConOut("Erro na exclusao!")
    EndIf
 
    ConOut("Fim : "+Time())
    ConOut(Repl("-",80))   
EndIf
 
//RESET ENVIRONMENT
 
Return(.T.)