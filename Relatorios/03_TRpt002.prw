#include 'totvs.ch'
#include 'TopConn.ch'

/*/{Protheus.doc} TRpt002
(long_description)
@type user function
@author Jayson
@since 25/09/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function TRpt002()
    Local oReport := Nil 
    Local cPerg := Padr("TRPT002",10)

    Pergunte(cPerg,.F.) //SX1


Return 

/*/{Protheus.doc} RPTPrint
    (long_description)
    @type  Static Function
    @author Jayson
    @since 25/09/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function RPTPrint(oReport)
    Local oSection1 := oReport:Section(1)
    Local oSection2 := oReport:Section(2)
    Local cQuery := ""
    Local cNumCod := ""

    

Return 
