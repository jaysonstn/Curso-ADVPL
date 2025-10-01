#Include "protheus.ch"

User Function LeTXT()
 
//+-------------------------------------------------------------------+
//| Declara��o de Vari�veis                                           |
//+-------------------------------------------------------------------+

Local oLeTxt

Private cAlias := "SA1"

dbSelectArea(cAlias)
dbSetOrder(1)

//+-------------------------------------------------------------------+
// Montagem da tela de processamento					     |
//+-------------------------------------------------------------------+

DEFINE MSDIALOG oLeTxt TITLE OemToAnsi("Leitura de Arquivo Texto");
FROM 000,000 TO 200,400 PIXEL

@ 005,005 TO 095,195 OF oLeTxt PIXEL
@ 10,020 Say " Este programa ira ler o conte�do de um arquivo texto, conforme" Of oLeTxt PIXEL
@ 18,020 Say " os par�metros definidos pelo usu�rio, com os registros do arquivo" Of oLeTxt PIXEL
@ 26,020 Say " SA1" Of oLeTxt PIXEL

DEFINE SBUTTON FROM 070, 030 TYPE 1 ;
ACTION (OkLeTxt(),oLeTxt:End()) ENABLE OF oLeTxt

DEFINE SBUTTON FROM 070, 070 TYPE 2 ;
ACTION (oLeTxt:End()) ENABLE OF oLeTxt

ACTIVATE DIALOG oLeTxt CENTERED

Return Nil

Static Function OkLeTxt()

Private cArqTxt := "\SYSTEM\EXPSA1.TXT"
Private nHdl    := fOpen(cArqTxt,68)

If nHdl == -1
    MsgAlert("O arquivo de nome "+cArqTxt+" n�o pode ser aberto! Verifique os par�metros.","Aten��o!")
    Return
Endif

// Inicializa a r�gua de processamento
Processa({|| RunCont() },"Processando...")

MsgInfo("Arquivo importado!!!")

Return Nil

Static Function RunCont

Local nTamFile 	:= 0
Local nTamLin  	:= 56
Local cBuffer	:= ""
Local nBtLidos  := 0
Local cFilSA1	:= ""
Local cCodSA1	:= ""
Local cLojaSA1	:= ""

//1234567890123456789012345678901234567890123456789012345678901234567890
//00000000010000000002000000000300000000040000000005000000000600000000070
//FFCCCCCCLLNNNNNNNNNNNNNNNNNNNNVVVVVVVVVVVVVVVVDDDDDDDD
//A1_FILIAL 	- 01, 02 - TAM: 02
//A1_COD		- 03, 08 - TAM: 06
//A1_LOJA		- 09, 10 - TAM: 02
//A1_NREDUZ		- 11, 30 - TAM: 20
//A1_MCOMPRA	- 31, 46 - TAM: 14,2
//A1_ULTCOM		- 47, 54 - TAM: 08

nTamFile := fSeek(nHdl,0,2)
fSeek(nHdl,0,0)
cBuffer  := Space(nTamLin) // Vari�vel para cria��o da linha do registro para leitura

ProcRegua(nTamFile) // Numero de registros a processar
While nBtLidos < nTamFile

//Incrementa a r�gua
    	IncProc()
	
// Leitura da primeira linha do arquivo texto
	nBtLidos += fRead(nHdl,@cBuffer,nTamLin) 
    
	cFilSA1 	:= Substr(cBuffer,01,02) //- 01, 02 - TAM: 02
	cCodSA1		:= Substr(cBuffer,03,06) //- 03, 08 - TAM: 06
	cLojaSA1	:= Substr(cBuffer,09,02) //- 09, 10 - TAM: 02 
	
	While .T.
		IF dbSeek(cFilSA1+cCodSA1+cLojaSA1)
			cCodSA1 := SOMA1(cCodSA1)
			Loop
		Else
			Exit
		Endif
	Enddo
	dbSelectArea(cAlias)
	RecLock(cAlias,.T.)
		(cAlias)->A1_FILIAL		:= cFilSA1	//- 01, 02 - TAM: 02
		(cAlias)->A1_COD		:= cCodSA1	//- 03, 08 - TAM: 06
		(cAlias)->A1_LOJA	  	:= cLojaSA1	//- 09, 10 - TAM: 02
		(cAlias)->A1_NREDUZ 	:= Substr(cBuffer,11,20) //- 11, 30 - TAM: 20
		(cAlias)->A1_MCOMPRA	:= Val(Substr(cBuffer,31,16))/100 //- 31, 46 - TAM: 14,2
		(cAlias)->A1_ULTCOM 	:= STOD(Substr(cBuffer,47,08))//- 47, 54 - TAM: 08
	MSUnLock()

EndDo

// O arquivo texto deve ser fechado, bem como o dialogo criado na fun��o 
//anterior.
fClose(nHdl)

Return Nil