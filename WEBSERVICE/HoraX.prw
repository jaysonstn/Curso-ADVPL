#Include 'Totvs.ch'

User Function HoraX()
Local oWsdl
Local lOk
Local aOps := {}

// Cria o objeto da classe TWsdlManager
oWsdl := TWsdlManager():New()

// Faz o parse de uma URL
lOk := oWsdl:ParseURL( "http://localhost:8090/ws/SERVERTIME.apw?WSDL" )

if !lOk
    MsgStop( oWsdl:cError , "ParseURL() ERROR")
    Return
endif

// Lista os Metodos do serviço
aOps := oWsdl:ListOperations()

// Seta a operação a ser utilizada listada pelo ListOperations nome do método 
//que ira executar.
lOk := oWsdl:SetOperation( "GETSERVERTIME" )

if !lOk
    MsgStop( oWsdl:cError , "SetOperation(ConversionRate) ERROR")
    Return
Endif

// Passando os valores para o parametro do método
xRet := oWsdl:SetValue(0,"")

// Exibe a mensagem que será enviada
conout( oWsdl:GetSoapMsg() )

// Faz a requisição ao WebService
lOk := oWsdl:SendSoapMsg()
if !lOk
   MsgStop( oWsdl:cError , "SendSoapMsg() ERROR")
   Return
endif

// Recupera os elementos de retorno, já parseados
cResp := oWsdl:GetParsedResponse()

// Monta um array com a resposta transformada, considerando
// as quebras de linha ( LF == Chr(10) ) 
aElem := StrTokArr(cResp,chr(10))
MsgInfo( SubStr(aElem[2], AT(":",aElem[2] )+1))

Return
