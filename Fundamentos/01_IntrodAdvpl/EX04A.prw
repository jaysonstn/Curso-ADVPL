#include 'totvs.ch'
// Strings
User Function EX04A()
Local cNome :="Jailton"
Local cSNome    :="     Lima  "
Local cNomeComp := cNome - cSNome

If cNome $ cNomeComp  // compara��o
Alert("Esta contido")
//cNome - Alltrim(cSNome)
Alert(cNomeComp)
else
    Alert("N�o esta contido")
EndIf

// + Concatenar
// - Concatenar e eliminar espa�os brancos finais
// $ Pertence (esta contido em)

Return
