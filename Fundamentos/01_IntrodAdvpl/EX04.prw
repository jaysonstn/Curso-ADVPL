#Include 'totvs.ch'
User function ex04()
  //  local nRet := 1
    Local nNum1 := 21 //+ nRet ++
    Local nNum2    := 10
    Local nResul
    Local bResult := {| cMsg | MsgInfo(cMsg) }
// Soma
    nResul := nNum1 + nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
//Subtra��o
    nResul := nNum1 - nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
//Multiplica��o
    nResul := nNum1 * nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
//Divis�o
    nResul := nNum1 / nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
// Potencia��o
    nResul := nNum1 ** nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
// Resto da divis�o
    nResul := nNum1 % nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
   /* if (nResul / 2) <> 0
        eval(bResult,"O numero que foi dividido � impar " + CvalToChar(nNum1))
        nNum1 += 1

        U_ex04(nNum1)
    else
        eval(bResult,"O numero que foi dividido � Par "+ CvalToChar(nNum1))
    EndIf
    */
Return
// Adi��o

// Operadores da Linguagem ADVPL
    * Operadores Matem�ticos
/*
+   Adi��o
-    Subtra��o
*   Miltiplica��o
/   Divis�o
** ou ^  Potencia��o
%  Resto da Divis�o
*/
Return
