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

    //Vari�veis locais
    Local nVar0 := 1
    Local nVar1 := 20

    //Vari�veis private
    Private cPri := 'private!'

    //Vari�vel public
    Public __cPublic := 'RCTI'

    TestEscop(nVar0, @nVar1)

 return

 //-------Fun��o Static----------//

 Static Function TestEscop(nValor1, nValor2)
    Local __cPublic := 'Alterei'
    Default nValor1 := 0
    //Alterando conte�do da variavel
    nValor2 := 10

    //Mostrando conte�do da vari�vel private
    Alert("Private: "+ cPri)

    //Alterar valor da vari�vel public
    Alert("Public "+ __cPublic)

    MsgAlert(nValor2)
    Alert("Vari�vel Static: "+ cStatic)
Return
