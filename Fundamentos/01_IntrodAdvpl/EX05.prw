#Include 'totvs.ch'
User Function EX05()
/*
|||-------------------- CONVERS�O DE TIPO DE DADOS--------------------||

*/
// Manipula��o de Datas
Local cData := CtoD("01/12/20")  // Realiza a convers�o de uma informa��o do tipo caractere no formato �DD/MM/AAAA�, para uma vari�vel do tipo data.
Local dData:= DtoC(Date())
Local sData:= DTOS(date())
//Local tData:= StoD(Date())
Local bVer:={|cMsg,cAviso|Alert(cMsg,cAviso)}

* Manipula��o de Strings
// Manipula��o Strings
Local nVar  := 100
Local  cVar:= "O Valor �: "
Local cStr  := 700

//Str(cStr,8,2)  // STR(nNumero, nTamanho, nDecimal)

eVal(bVer,"Manupula��o de Strings","Strings")
eVal(bVer, cVar)
eVal(bVer,nVar)
eVal(bVer, STR(cStr,8,2) ) 
//STRZERO(nNumero, nTamanho, nDecimal)
//StrZero(98765432.1, 1, 8) // N�o tem efeito

// AllTrim("   ADVPL   ") -> "ADVPL"

eVal(bVer,AllTrim("   ADVPL   "))
// ASC(cCaractere) - Tabela Asc: Exemplo A = 65
eVal(bVer,ASC("B"))
// CHR(Asc) - Numero em Caracter Asc =  65 = A // Chr(13) = ENTER
eVal(bVer,chr(65))
// AT(cProcura, cString, nApos) -> AT("A", "ABCD")    = 1
eVal(bVer,AT("A", "ABCD")  )
// LEN(cString)  - Retona o Tamanho
eVal(bVer,Len(cVar))
// LOWER(cString) / Retorna string em minusculo
eVal(bVer,LOWER("JAILTON")  )
// Stuff("ABCDE", 3, 2, "123") -> "AB123E"  substitui "CD" por "123"
eVal(bVer,Stuff("ABCDE", 3, 2, "123") )

// UPPER(cString) - Retorna Texto em Mai�sculo  // UPPER ("AbCdE") -> "ABCDE"

eVal(bVer,UPPER ("AbCdE") )

//PadR(cString)  Adiciona caracteres de preenchimento � direita do conte�do de uma vari�vel //PadR("ABC", 10, "*") -> "ABC*******"
eVal(bVer,PadR ("Caractere a Direira", 30, "*") )
//PadR(cString)  Adiciona caracteres de preenchimento � direita do conte�do de uma vari�vel 
eVal(bVer,PadL ("Caractere a Esqueda", 30, "*") )
// PadC(cString) Add caracteres a direira e a esqueda mantendo a string centralizada
eVal(bVer,PadC ("String fica ao Centro", 30, "#") )

// Replicate(String, nVezes) // Replicar auma estring nvezes
eVal(bVer,Replicate("#",30) )
// StrTran(  cString ,  cSearch,  cReplace, nStart ,  nCount  )
cVar:="925.601.135-20"

cVar:= StrTran(cVar,".","")
cVar:=StrTran(cVar,"-","")
eVal(bVer,cVar) 





//Manupula��o de Data
eVal(bVer,"Manupula��o de Datas")
eval(bVer,"Agora � a Variavel " + DtoC(cData))
eval(bVer,"Agora � a Variavel " + dData)
eval(bVer,"Agora � a Variavel " + sData)
//eval(bVer,"Agora � a Variavel " + tData)

// Manipula

Return
