#Include 'totvs.ch'
User function ex03()
// Exercicio com Variaveis:
    Local xVar   // Nulo
    Local x 
   xVar    :="Agora sou variavel de texto"
    MsgInfo(xVar)

    xVar    := 100 // Agora a Variavel é numerica
    MsgInfo("Sou agora o  Nº " + cValTochar(xVar))

    xVar    := .T. // Agora sou variavel Lógica
    If xVar
        MsgInfo("A Variavel é Verdadeira")
    else
        MsgInfo("A variavel é Falsa")
    EndIf
    xVar    :=Date() //  A variavel agora é data
    MsgInfo("Hoje e: " + DtoC(xVar))
    xVar    := Nil // Voltei a ser nulo novamente

    Alert("Valor Nulo de ")

    xVar:= { }  //  aGORA SOU Array
    aAdd(xVar,{"Texto", "Salvador" , "F"})
     aAdd(xVar,{"Antonio", "Manaus" ,"M"})
       aAdd(xVar,{"Marina", "Guarulhos" , "F"})
     aAdd(xVar,{"Miguel", "Palmeiras" ,"M"})
     
    For x := 1 to len(xVar)
    Alert("Nome: " + xVar[x,1] +  chr(13);
         +   "Naturalidade: " + xVar[x,2] +  chr(13);
         +    "Sexo: " + xVar[x,3] )
            next x
    xVar    := {| | MsgAlert("Bloco de Codigo") }
    Eval(xVar)

      xVar    := {| X, Y| MsgAlert("Bloco de Codigo" + cvaltochar(300)) }
Eval(xVar)  
Return
