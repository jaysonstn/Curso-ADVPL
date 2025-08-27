#include 'totvs.ch'

User Function AVETOR2()
    /**
    AADD() - Permite a inser��o de um item em um Array j� existente.
    AINS() - Permite a inser��o de um elemento em qualquer posi��o do Array.
    ACLONE() - Realiza a c�pia de um Array para outro.
    ADEL() - Permite a exclus�o de um elemento do Array, tornando o ultima valor NULL.
    ASIZE() - Redefine a estrutura de um Array pr�-existente, adicionando ou removendo itens.
    LEN() - Retorna a quantidade de elementos de um Array
    **/

    Local aVetor := {10,20,30}

        //AADD
        //Aadd(aVetor, 40)
        //Alert(Len(aVetor)) //Len (Tamanho do array)

        //AINS
        //AIns(aVetor,2)
        //aVetor[2] := 200
        //Alert(aVetor[2])
        //Alert(Len(aVetor))

        //ACLONE
        //aVetor2 := AClone(aVetor)
        //Local nCount
        //    for nCount := 1 To Len(aVetor2)
        //        Alert(aVetor2[nCount])
        //    Next nCount

        //ADEL
        //Adel(aVetor, 2)
        //Alert(aVetor[3])
        //Alert(Len(aVetor))

        //ASIZE
        Asize(aVetor,2)
        Alert(Len(aVetor))

Return
