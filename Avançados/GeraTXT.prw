#include "protheus.ch"
 

User Function GeraTXT()

//+--------------------------------+
//| Declara��o de Vari�veis        |
//+--------------------------------+
Local oGeraTxt

Private cAlias	:= "SA1"

dbSelectArea(cAlias)
dbSetOrder(1)
//+-----------------------------------+
//| Montagem da tela de processamento.|
//+-----------------------------------+
DEFINE MSDIALOG oGeraTxt TITLE OemToAnsi("Gera��o de Arquivo Texto") ;
FROM 000,000 TO 200,400 PIXEL

@ 005,005 TO 095,195 OF oGeraTxt PIXEL
@ 010,020 Say " Este programa ira gerar um arquivo texto, conforme os parame- " Of oGeraTxt PIXEL
@ 018,020 Say " tros definidos  pelo usu�rio,  com os registros do arquivo de " Of oGeraTxt PIXEL
@ 026,020 Say " SA1 " OF oGeraTxt PIXEL

DEFINE SBUTTON FROM 070, 030 TYPE 1 ;
ACTION (OkGeraTxt(),oGeraTxt:End()) ENABLE OF oGeraTxt

DEFINE SBUTTON FROM 070, 070 TYPE 2 ;
ACTION (oGeraTxt:End()) ENABLE OF oGeraTxt

ACTIVATE DIALOG oGeraTxt CENTERED

Return Nil


Static Function OkGeraTxt

//+-----------------------------------------------------------------------//| Cria o arquivo texto
//+-----------------------------------------------------------------------

Private cArqTxt := "\SYSTEM\EXPSA1.TXT"
Private nHdl    := fCreate(cArqTxt)

If nHdl == -1
    MsgAlert("O arquivo de nome "+cArqTxt+" n�o pode ser executado! Verifique os par�metros.","Aten��o!")
    Return
Endif


// Inicializa a r�gua de processamento
Processa({|| RunCont() },"Processando...")

MsgInfo("Arquivo Exportado, com sucesso!!!")

Return Nil


Static Function RunCont

Local cLin

dbSelectArea(cAlias)
dbGoTop()
ProcRegua(RecCount()) // Numero de registros a processar

While (cAlias)->(!EOF())
//Incrementa a r�gua
IncProc()

cLin := (cAlias)->A1_FILIAL
cLin += (cAlias)->A1_COD
cLin += (cAlias)->A1_LOJA
cLin += (cAlias)->A1_NREDUZ
cLin += STRZERO((cAlias)->A1_MCOMPRA*100,16) // 14,2
cLin += DTOS((cAlias)->A1_ULTCOM)//AAAAMMDD
cLin += CRLF
	
//+-------------------------------------------------------------------+
//| Grava��o no arquivo texto. Testa por erros durante a grava��o da  |
//| linha montada.                                                    |
//+-------------------------------------------------------------------+

If fWrite(nHdl,cLin,Len(cLin)) != Len(cLin)
	If !MsgAlert("Ocorreu um erro na grava��o do arquivo."+;
                               "Continua?","Aten��o!")
     		Exit
	Endif
Endif

    	(cAlias)->(dbSkip())
EndDo

// O arquivo texto deve ser fechado, bem como o dialogo criado na fun��o anterior
fClose(nHdl)

Return Nil
