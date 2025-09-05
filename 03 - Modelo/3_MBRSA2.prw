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
        Função BInclui - Inclusão
*/

User Function BInclui(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxInclui(cAlias,nReg,nOpc)
        If nOpcao == 1
            MsgInfo("Inclusão efetuada com sucesso!")
        Else 
            MsgAlert("Inclusão Cancelada!")
        Endif 
Return

/*-------------------------------
        Função BAltera - Alteração
*/

User Function BAltera(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxAltera(cAlias,nReg,nOpc)
        If nOpcao == 1
            MsgInfo("Alteração efetuada com sucesso!")
        Else 
            MsgAlert("Alteração Cancelada!")
        Endif 
Return Nil

/*-------------------------------
        Função BDeleta - Exclusão
*/

User Function BDeleta(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxDeleta(cAlias,nReg,nOpc)
        If nOpcao == 1
            MsgInfo("Exclusão efetuada com sucesso!")
        Else 
            MsgAlert("Exclusão Cancelada!")
        Endif 
Return Nil

/*--------------------------------
        Função BLegenda - Legenda
*/

User Function BLegenda()
    Local aLegenda := {}
    
    aADD(aLegenda,{"BR_VERDE"     ,"Pessoa Física"})
    aADD(aLegenda,{"BR_AMARELO"   ,"Pessoa Jurídica"})
    aADD(aLegenda,{"BR_LARANJA"   ,"Exportação"})
    aADD(aLegenda,{"BR_MARROM"    ,"Fornecedor Rural"})
    aADD(aLegenda,{"BR_PRETO"     ,"Não Classificado"})

    BrwLegenda(cCadastro, "Legenda",aLegenda)

Return

