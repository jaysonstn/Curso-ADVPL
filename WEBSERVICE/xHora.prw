#Include "Totvs.ch"

User Function xHora()
Local oBj

oBj:=WSSERVERTIME():new()
//Instancia o objeto utilizando classe criada pelo assistente no fonte wsHorario

If !Empty(oBj)  
    oBj:GETSERVERTIME()
    //Faz a passagem de par�metro
    msgInfo( oBj:cGETSERVERTIMERESULT )
    //Recupera o resultado
Else  
    cSvcError   := GetWSCError()  // Resumo do erro
    cSoapFCode  := GetWSCError(2) // Soap Fault Code
    cSoapFDescr := GetWSCError(3) // Soap Fault Description  
    If ! empty(cSoapFCode)
        // Caso a ocorr�ncia de erro esteja com o fault_code preenchido ,
        // a mesma teve rela��o com a chamada do servi�o .
        MsgStop(cSoapFDescr,cSoapFCode)
    Else
        // Caso a ocorr�ncia n�o tenha o soap_code preenchido
        // Ela est� relacionada a uma outra falha ,
        // provavelmente local ou interna.
        MsgStop(cSvcError,'FALHA INTERNA DE EXECUCAO DO SERVI�O')
    Endif
Endif

Return
