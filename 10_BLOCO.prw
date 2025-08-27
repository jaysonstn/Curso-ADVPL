#include 'totvs.ch'

User Function BLOCO()

    //Local bBloco := {|| Alert("Olá Mundo!")} //Bloco de código. ||>Adicionar parâmetros
    //Eval(bBloco) //Chamar bloco de código.

    //Passagem por parâmetros - Bloco de códigos
    Local bBloco := {|cMsg| Alert(cMsg)}
    Eval(bBloco, "Olá Mundo!") 
Return
