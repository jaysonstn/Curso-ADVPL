#include 'totvs.ch'
user function ex01()
*Declara��o de Vari�veis
*Linha de coment�rio
// comet�rio
/*
Comentarios
de 
varias
linhas
*/
Local nSoma := 0
Local nCnt
For nCnt    := 1 to 10
nSoma += nCnt
Next nCnt

Msgalert(cValtochar(nCnt))

// O ; serve para quebra a linha logica em mais de uma linha fisica: Ver exemplo:
*If !Empty(cNome) .And !Empty(cEnd) .And. ; //<enter>
*!Empty(cTel) .And. !Empty(cFax) .And. ; //<enter>
*!Empty(cEmail)
 *	GravaDados(cNome,cEnd,cTel,cFax,cEmail)
*Endif

// Partes de um Programa
Return

/*
+===========================================+
| Programa: C�lculo do Fatorial             |
| Autor   : Microsiga Software S.A.         |
| Data    : 02 de outubro de 2001           |
+===========================================+
*/
User Function CalcFator()
Local nCnt
Local nResultado := 1  // Resultado do fatorial
Local nFator     := 9 // N�mero para o c�lculo
// C�lculo do fatorial
For nCnt := nFator To 1 Step -1
nResultado *= nCnt
Next nCnt
// Exibe o resultado na tela, atrav�s da fun��o alert
MsgAlert("O fatorial de " + cValToChar(nFator) + ;
      " � " + cValToChar(nResultado))
 
// Termina o programa
Return( NIL )
