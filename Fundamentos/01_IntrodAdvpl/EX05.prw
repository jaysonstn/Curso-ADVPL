#Include 'totvs.ch'
User Function EX05()
/*
|||-------------------- CONVERSÃO DE TIPO DE DADOS--------------------||

*/
// Manipulação de Datas
Local cData := CtoD("01/12/20")  // Realiza a conversão de uma informação do tipo caractere no formato “DD/MM/AAAA”, para uma variável do tipo data.
Local dData:= DtoC(Date())
Local sData:= DTOS(date())
//Local tData:= StoD(Date())
Local bVer:={|cMsg,cAviso|Alert(cMsg,cAviso)}

* Manipulação de Strings
// Manipulação Strings
Local nVar  := 100
Local  cVar:= "O Valor é: "
Local cStr  := 700

//Str(cStr,8,2)  // STR(nNumero, nTamanho, nDecimal)

eVal(bVer,"Manupulação de Strings","Strings")
eVal(bVer, cVar)
eVal(bVer,nVar)
eVal(bVer, STR(cStr,8,2) ) 
//STRZERO(nNumero, nTamanho, nDecimal)
//StrZero(98765432.1, 1, 8) // Não tem efeito

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

// UPPER(cString) - Retorna Texto em Maiúsculo  // UPPER ("AbCdE") -> "ABCDE"

eVal(bVer,UPPER ("AbCdE") )

//PadR(cString)  Adiciona caracteres de preenchimento à direita do conteúdo de uma variável //PadR("ABC", 10, "*") -> "ABC*******"
eVal(bVer,PadR ("Caractere a Direira", 30, "*") )
//PadR(cString)  Adiciona caracteres de preenchimento à direita do conteúdo de uma variável 
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





//Manupulação de Data
eVal(bVer,"Manupulação de Datas")
eval(bVer,"Agora é a Variavel " + DtoC(cData))
eval(bVer,"Agora é a Variavel " + dData)
eval(bVer,"Agora é a Variavel " + sData)
//eval(bVer,"Agora é a Variavel " + tData)

// Manipula

Return
