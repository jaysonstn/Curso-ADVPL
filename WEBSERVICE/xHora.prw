#Include "Totvs.ch"

User Function xHora()
Local oBj

oBj:=WSSERVERTIME():new()
//Instancia o objeto utilizando classe criada pelo assistente no fonte wsHorario

If !Empty(oBj)  
    oBj:GETSERVERTIME()
    //Faz a passagem de parâmetro
    msgInfo( oBj:cGETSERVERTIMERESULT )
    //Recupera o resultado
Else  
    cSvcError   := GetWSCError()  // Resumo do erro
    cSoapFCode  := GetWSCError(2) // Soap Fault Code
    cSoapFDescr := GetWSCError(3) // Soap Fault Description  
    If ! empty(cSoapFCode)
        // Caso a ocorrência de erro esteja com o fault_code preenchido ,
        // a mesma teve relação com a chamada do serviço .
        MsgStop(cSoapFDescr,cSoapFCode)
    Else
        // Caso a ocorrência não tenha o soap_code preenchido
        // Ela está relacionada a uma outra falha ,
        // provavelmente local ou interna.
        MsgStop(cSvcError,'FALHA INTERNA DE EXECUCAO DO SERVIÇO')
    Endif
Endif

Return
