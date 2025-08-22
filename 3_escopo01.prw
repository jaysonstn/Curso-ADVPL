#include 'totvs.ch'

/*/{Protheus.doc} ESCOPO1
(long_description)
@type user function
@author user
@since 22/08/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/

Static cStat := ''
User Function ESCOPO1()

    //Variáveis locais
    Local nVar0 := 1
    Local nVar1 := 20

    //Variáveis private
    Private cPri := 'private!'

    //Variável public
    Public __cPublic := 'RCTI'

    TestEscop(nVar0, @nVar1)

 return

 //-------Função Static----------//

 Static Function TestEscop(nValor1, nValor2)
    Local __cPublic := 'Alterei'
    Default nValor1 := 0
    //Alterando conteúdo da variavel
    nValor2 := 10

    //Mostrando conteúdo da variável private
    Alert("Private: "+ cPri)

    //Alterar valor da variável public
    Alert("Public "+ __cPublic)

    MsgAlert(nValor2)
    Alert("Variável Static: "+ cStatic)
Return
