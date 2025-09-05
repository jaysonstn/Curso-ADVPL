#include 'totvs.ch'

/*/{Protheus.doc} A010TOK
(Ponto de Entrada para bloquear a inclusão de 
produtos do tipo "PA" com a conta contábil "001")
@type user function
@author user
@since 05/09/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function A010TOK()
    Local lExecuta := .T.
    Local cTipo := AllTrim(M->B1_TIPO)
    Local cConta := AllTrim(M->B1_CONTA)

        If (cTipo = "PA" .AND. cConta = "001")
            Alert("A conta <b> " + cConta + "</b> não pode estar associada a um produto do tipo <b>" + cTipo + "</b>")


            lExecuta := .F.
        EndIf 

Return(lExecuta) 
