#Include 'totvs.ch'
User Function 01_EX02()

// Laço de repetioção WHILE ------- ENDO

Local x := 0
Local y:= 100

x :=1
While x < y

MsgAlert("Ocontador esta em " + cValToChar(x)) 
  
   If x  == 10 
   If MsgYesNo("Atiginu a metade, Deseja Encerrar?","Sair")
   EXIT
   else
       MsgInfo("Clique e continui a contagem a " + cvaltochar(y))
       Loop  // Volta a partir do IF
   EndIf
       
EndIf
x   := X+1

EndDo

