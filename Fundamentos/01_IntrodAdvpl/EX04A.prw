#include 'totvs.ch'
// Strings
User Function EX04A()
Local cNome :="Jailton"
Local cSNome    :="     Lima  "
Local cNomeComp := cNome - cSNome

If cNome $ cNomeComp  // comparação
Alert("Esta contido")
//cNome - Alltrim(cSNome)
Alert(cNomeComp)
else
    Alert("Não esta contido")
EndIf

// + Concatenar
// - Concatenar e eliminar espaços brancos finais
// $ Pertence (esta contido em)

Return
