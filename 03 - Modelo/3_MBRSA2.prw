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
    Local cFiltra := "A2_FILIAL == '"+xFilial('SA2')+"' .And. A2_EST == 'SP'"
    Private cCadastro := "Cadastro MBROWSE"
    Private aRotina := {}
    Private aIndexSA2 := {}
    Private bFiltraBrw := {|| FilBrowse(cAlias,@aIndexSA2,@cFiltra)}

    aADD(aRotina, {"Pesquisar"          ,"AxPesqui"      ,0,1})
    aADD(aRotina, {"Visualizar"         ,"AxVisual"      ,0,2})
    aADD(aRotina, {"Incluir"            ,"U_BInclui"     ,0,3})
    aADD(aRotina, {"Alterar"            ,"U_BAltera"     ,0,4})
    aADD(aRotina, {"Excluir"            ,"U_BDeleta"     ,0,5})
    aADD(aRotina, {"Legenda"            ,"U_BLegenda"    ,0,6})

    dbSelectArea(cAlias)
    dbSetorder(1)

    Eval(bFiltraBrw)

    dbGoTop()
    mBROWSE(6,1,22,75,cAlias)

    EndFilBrw(cAlias,aIndexSA2)

Return
