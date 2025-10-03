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

    Pergunte(cPerg,.T.) //SX1
    oReport := RPTSTRUC(cPerg)
    oReport:printDialog()
    oReport:HideParamPage()


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

        cQuery := " SELECT C7_FILIAL FILIAL, "
        cQuery += " C7_EMISSAO EMISSAO, "
        cQuery += " C7_FORNECE FORNECEDOR, "
        cQuery += " C7_PRODUTO PRODUTO, "
        cQuery += " C7_DESCRI DESCRICAO, "
        cQuery += " C7_UM UM, "
        cQuery += " C7_QUANT QUANTIDADE, "
        cQuery += " C7_PRECO PRECO, "
        cQuery += " C7_TOTAL TOTAL "
        cQuery += " FROM SC7990 "
        cQuery += " WHERE D_E_L_E_T_ = '' AND C7_FORNECE = '"+MV_PAR01+"' "

        //Verifica se a tabela já está aberta
            If Select("TEMP") <> 0
                DbSelectArea("TEMP")
                DbCloseArea()
            Endif

        //Envia os dados para a tabela TEMP    
        TCQUERY cQuery NEW ALIAS "TEMP"

            DbSelectArea("TEMP")
            TEMP->(DBGoTop())

            oReport:SetMeter(TEMP->(LastRec()))


        While !EoF()
            If oReport:Cancel() //Se o user Cancela                Exit
            Endif 

            //Iniciando a primeira seção
            oSection1:Init()
            oReport:IncMeter()

            cNumCod := TEMP->FORNECEDOR
            IncProc("Imprimindo Produtos "+ Alltrim(TEMP->FORNECEDOR))

            //Imprimindo primeira seção:
            oSection1:Cell("FORNECEDOR"):SetValue(TEMP->FORNECEDOR)
            
            oSection1:PrintLine()

            //Iniciando a segunda seção
            oSection2:Init()

                //Verifica se o código é o mesmo, se sim, imprime os dados
                While TEMP->FORNECEDOR == cNumCod
                    oReport:IncMeter()
                    IncProc("Imprimindo dados..."+ Alltrim(TEMP->FORNECEDOR))
                    //oSection2:Cell("C7_EMISSAO"):SetValue(TEMP->EMISSAO)
                    oSection2:Cell("C7_PRODUTO"):SetValue(TEMP->PRODUTO)
                    oSection2:Cell("C7_DESCRI"):SetValue(TEMP->DESCRICAO)
                    //oSection2:Cell("C7_UM"):SetValue(TEMP->UM)
                    oSection2:Cell("C7_QUANT"):SetValue(TEMP->QUANTIDADE)
                    //oSection2:Cell("C7_PRECO"):SetValue(TEMP->PRECO)
                    oSection2:Cell("C7_TOTAL"):SetValue(TEMP->TOTAL)
                    oSection2:PrintLine()

                        TEMP->(dbSkip())
                EndDo
                    oSection2:Finish()
                    oReport:ThinLine()

                    oSection1:Finish()
        EndDo
Return 


/*/{Protheus.doc} RPTSTRUC
    (long_description)
    @type  Static Function
    @author Jayson
    @since 03/10/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function RPTSTRUC(cNome)
    Local oReport := Nil
    Local oSection1 := Nil
    Local oSection2 := Nil

    oReport := TReport():New(cNome,"Relatório de Pedidos de Compra",cNome,{|oReport| RPTPrint(oReport)},"Descrição do Help")
    oReport:SetPortrait() //Orientação em retrato

    oSection1 := TRSection():New(oReport,"Pedidos de Compra",{"SC7"},Nil,.F.,.T.)
    TRCell():New(oSection1,"FORNECEDOR"  ,"TEMP","FORNECEDOR"   ,"@!",100)
    

    oSection2 := TRSection():New(oReport,"Produtos",{"SC7"},Nil,.F.,.T.)
    TRCell():New(oSection2,"C7_PRODUTO"  ,"TEMP","PRODUTO"    ,"@!",8)
    TRCell():New(oSection2,"C7_DESCRI"  ,"TEMP","DESCRICAO"    ,"@!",100)
    TRCell():New(oSection2,"C7_QUANT"  ,"TEMP","QUANTIDADE"    ,"@!",12)
    TRCell():New(oSection2,"C7_TOTAL"  ,"TEMP","TOTAL"    ,"@!",12)

    oSection1:SetPageBreak(.F.) //Quebra de seção


    

    

Return (oReport)
