#include 'totvs.ch'

/*/{Protheus.doc} MBRW00
(Utitlizando MBrowse)
@type user function
@author Jayson
@since 04/09/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function MBRW00()
    Local cAlias := "SB1"
    Private cTitulo := "Cadastro Produtos MBROWSE"
    Private aRotina := {}

    aAdd(aRotina,{"Pesquisar"   ,"AXPesqui"        ,0,1}) // 1 é tipo de operação (Pesquisar)
    aAdd(aRotina,{"Visualizar"  ,"AXVisual"        ,0,2})
    aAdd(aRotina,{"Incluir"     ,"AXInclui"        ,0,3})
    aAdd(aRotina,{"Alterar"     ,"AXAltera"        ,0,4})
    aAdd(aRotina,{"Excluir"     ,"AXDeleta"        ,0,5})
    aAdd(aRotina,{"Olá Mundo"   ,"U_OlaMundo"      ,0,6})

    dbSelectArea(cAlias)
    dbSetOrder(1)
    mBrowse(,,,,cAlias)



Return Nil
