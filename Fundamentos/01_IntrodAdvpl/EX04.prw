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
//Subtração
    nResul := nNum1 - nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
//Multiplicação
    nResul := nNum1 * nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
//Divisão
    nResul := nNum1 / nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
// Potenciação
    nResul := nNum1 ** nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
// Resto da divisão
    nResul := nNum1 % nNum2
    Eval(bResult,"Resultado: " + cValToChar(nResul))
   /* if (nResul / 2) <> 0
        eval(bResult,"O numero que foi dividido é impar " + CvalToChar(nNum1))
        nNum1 += 1

        U_ex04(nNum1)
    else
        eval(bResult,"O numero que foi dividido é Par "+ CvalToChar(nNum1))
    EndIf
    */
Return
// Adição

// Operadores da Linguagem ADVPL
    * Operadores Matemáticos
/*
+   Adição
-    Subtração
*   Miltiplicação
/   Divisão
** ou ^  Potenciação
%  Resto da Divisão
*/
Return
