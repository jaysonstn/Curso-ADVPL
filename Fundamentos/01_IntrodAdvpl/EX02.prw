#Include 'totvs.ch'

User function ex02()
/*Local nVar :=
Static nVar:= 3,141618
Private dVar    := CTOD(Date()) 
Public  CGC     := "00000000000000"
*/

Local nPercentual   := 10
Local nResultado   := 250 * ( 1+(nPercentual / 100))
// Tipos de Dados (nPercetual /100))
MsgAlert(nResultado)

nPercentual := 10
nResultado  := 250 * ( 1-(nPercentual / 100))

MsgAlert(nResultado)
/*
Numericos -  maximo 18 digitos por variavel
    de  2.2250738585072014 E�308  at�  1.7976931348623158 E+308.
L�gico 
    .T. ou .F.
Caractere (Strings)
"Entre Aspas duplas " + "Ol�" + "Isso � uma String"

Data -> Esse tipo � gravado como numero em ADVPL correspondente a data Juliana DD
    Devem ser declaradas atraves de funn��es espec�ficas como CTOD(Date())

ARRAY 
    Vetroes Unidimensionais
    Matrizes Multidimensionais

Bloco de C�digo -> Serve para armazenar um tipo espevcial de instru��o ADVPL e Executada posteriormente


*/

return
