#include 'totvs.ch'

/*/{Protheus.doc} MODELO1
(long_description)
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
User Function MODELO1()
    Local cAlias := "SB1"
    Local cTitulo := "Cadastro - AXCadastro"
    Local cVldExc := ".T."
    Local cVldAlt := ".T."

    AXCadastro(cAlias, cTitulo, cVldExc, cVldAlt)


Return Nil
