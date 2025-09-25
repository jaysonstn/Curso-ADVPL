#Include 'totvs.ch'

/*/{Protheus.doc} RelTxt
    (Gera relatório em TXT)
    @type  Function
    @author Jayson  
    @since 19/09/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function RelTxt()

    If MsgYesNo("Esta função tem como objetivo gerar arquivo TXT")
        Processa({||MntQry() },,"Processando...")
        MsAguarde({|| GeraArq()},,"O arquivo TXT está sendo gerado...")
    else
        Alert("Cancelado pelo operador")
    Endif

Return Nil


/*/{Protheus.doc} MntQry
    (Monta Query)
    @type  Function
    @author Jayson
    @since 25/09/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/

Static Function MntQry()
    Local cQuery := ""

    cQuery := " SELECT B1_FILIAL AS FILIAL, B1_COD AS CODIGO,  "
    cQuery += " B1_DESC AS DESCRICAO "
    cQuery += " FROM SB1990 WHERE D_E_L_E_T_ = '' "

    cQuery := ChangeQuery(cQuery)
        DbUseArea(.T.,"TOPCONN", TCGENQRY(,,cQuery), 'TMP',.F.,.T.)


Return 



/*/{Protheus.doc} GeraArq
    (MGera o arquivo)
    @type  Function
    @author Jayson
    @since 25/09/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
Static Function GeraArq()
    Local cDir := "temp\" 
    Local cArq := "relatorio.txt"
    Local nHandle := FCreate(cDir+cArq)
    Local nLinha := ""

        If nHandle < 0
            MsgAlert("Erro ao criar o arquivo", "ERRO")
        else
                /*For nlinha := 1 to 200 
                    FWrite(nHandle,"Gravando a linha " + StrZero(nLinha,3)+ CRLF)
                Next nLinha*/
                While TMP->(!EoF())
                    FWrite(nHandle, TMP->(FILIAL)+ " | " + TMP->(CODIGO) + " | " + TMP->(DESCRICAO) + CRLF)
                    TMP->(dbSkip())
                EndDo
                FClose(nHandle)
        
        Endif

        If FILE("temp\relatorio.txt")
            MsgInfo("Arquivo criado com sucesso!")
        else
                MsgAlert("Não foi possível criar o arquivo", "ALERTA")
        Endif

Return
