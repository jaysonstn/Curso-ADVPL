#include 'totvs.ch'

User Function BLOCO()

    //Local bBloco := {|| Alert("Ol� Mundo!")} //Bloco de c�digo. ||>Adicionar par�metros
    //Eval(bBloco) //Chamar bloco de c�digo.

    //Passagem por par�metros - Bloco de c�digos
    Local bBloco := {|cMsg| Alert(cMsg)}
    Eval(bBloco, "Ol� Mundo!") 
Return
