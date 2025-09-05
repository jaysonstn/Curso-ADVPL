#include 'totvs.ch'

/*/{Protheus.doc} MBRSA2
(Utilizando FilBrowse)
@type user function
@author user
@since 04/09/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function MBRSA2()
    Local cAlias := "SA2"
    Local aCores := {}
    //Local cFiltra := "A2_FILIAL == '"+xFilial('SA2')+"' .And. A2_EST == 'SP'"
    Private cCadastro := "Cadastro MBROWSE"
    Private aRotina := {}
    Private aIndexSA2 := {}
    Private bFiltraBrw := {|| FilBrowse(cAlias,@aIndexSA2,)}

    aADD(aRotina, {"Pesquisar"          ,"AxPesqui"      ,0,1})
    aADD(aRotina, {"Visualizar"         ,"AxVisual"      ,0,2})
    aADD(aRotina, {"Incluir"            ,"U_BInclui"     ,0,3})
    aADD(aRotina, {"Alterar"            ,"U_BAltera"     ,0,4})
    aADD(aRotina, {"Excluir"            ,"U_BDeleta"     ,0,5})
    aADD(aRotina, {"Legenda"            ,"U_BLegenda"    ,0,6})

    //Acores - Legenda
    aADD(aCores,{"A2_TIPO == 'F'"       ,"BR_VERDE"})
    aADD(aCores,{"A2_TIPO == 'J'"       ,"BR_AMARELO"})
    aADD(aCores,{"A2_TIPO == 'X'"       ,"BR_LARANJA"})
    aADD(aCores,{"A2_TIPO == 'R'"       ,"BR_MARROM"})
    aADD(aCores,{"Empty(A2_TIPO)"       ,"BR_PRETO"})

    dbSelectArea(cAlias)
    dbSetorder(1)

    Eval(bFiltraBrw)

    dbGoTop()
    mBROWSE(6,1,22,75,cAlias,,,,,,aCores)

    EndFilBrw(cAlias,aIndexSA2)

Return

/*-------------------------------
        Fun��o BInclui - Inclus�o
*/

User Function BInclui(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxInclui(cAlias,nReg,nOpc)
        If nOpcao == 1
            MsgInfo("Inclus�o efetuada com sucesso!")
        Else 
            MsgAlert("Inclus�o Cancelada!")
        Endif 
Return

/*-------------------------------
        Fun��o BAltera - Altera��o
*/

User Function BAltera(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxAltera(cAlias,nReg,nOpc)
        If nOpcao == 1
            MsgInfo("Altera��o efetuada com sucesso!")
        Else 
            MsgAlert("Altera��o Cancelada!")
        Endif 
Return Nil

/*-------------------------------
        Fun��o BDeleta - Exclus�o
*/

User Function BDeleta(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxDeleta(cAlias,nReg,nOpc)
        If nOpcao == 1
            MsgInfo("Exclus�o efetuada com sucesso!")
        Else 
            MsgAlert("Exclus�o Cancelada!")
        Endif 
Return Nil

/*--------------------------------
        Fun��o BLegenda - Legenda
*/

User Function BLegenda()
    Local aLegenda := {}
    
    aADD(aLegenda,{"BR_VERDE"     ,"Pessoa F�sica"})
    aADD(aLegenda,{"BR_AMARELO"   ,"Pessoa Jur�dica"})
    aADD(aLegenda,{"BR_LARANJA"   ,"Exporta��o"})
    aADD(aLegenda,{"BR_MARROM"    ,"Fornecedor Rural"})
    aADD(aLegenda,{"BR_PRETO"     ,"N�o Classificado"})

    BrwLegenda(cCadastro, "Legenda",aLegenda)

Return

