#Include 'totvs.ch'
User Function 01_EX01()

Local x
Local y := 100
Local nSomar:= 0

for x := 0 to y step 2

nSomar += x
    
next
MsgAlert("a Soma do numero ? " + cValtoChar(nSomar))

// Usando Exit

for x := 1 to 10
  Alert("Numero " + cValtoChar(x))
If x == 8
    Alert("Numero " + cValtoChar(x) + " atingido")
EXIT

x += X
Endif
next x
MsgAlert("O valor de X é: " + cValtoChar(X))

Return
