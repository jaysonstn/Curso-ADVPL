#Include 'totvs.ch'

/*/{Protheus.doc} RelTxt
    (Gera relat�rio em TXT)
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

    If MsgYesNo("Esta fun��o tem como objetivo gerar arquivo TXT")
        GeraArq()
    else
        Alert("Cancelado pelo operador")
    Endif

Return Nil


//Fun��o que gera o arquivo TXT
Static Function GeraArq()
    Local cDir := "protheus_data\temp" 
    Local cArq := "teste_arquivo.txt"
    Local nHandle := FCreate(cDir+cArq)
    Local nLinha := ""

        If nHandle < 0
            MsgAlert("Erro ao criar o arquivo", "ERRO")
            else
                For nlinha := 1 to 200 
                    FWrite(nHandle,"Gravando a linha " + StrZero(nLinha,3)+ CRLF)
                Next nLinha
                FClose(nHandle)
        
        Endif

        If FILE("protheus_data\temp\teste_arquivo.txt")
            MsgInfo("Arquivo criado com sucesso!")
            else
                MsgAlert("N�o foi poss�vel criar o arquivo", "ALERTA")
        Endif

Return
