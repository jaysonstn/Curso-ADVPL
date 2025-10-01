#include "Totvs.ch"
#INCLUDE "apwebsrv.ch"

WsService CTT description "Treinamento do WebService para o Curso CTT"
    Wsdata cCodEmp as String // código da empresa
    Wsdata aEmpresa as array of EstruturaEmp // estrutura inteira do sigamat.emp
    Wsdata cRet as String // Mensagem de Retorno
    WsMethod LISTAEMPRESA DESCRIPTION "APRESENTA TODOS OS DADOS DO SIGAMAT.EMP DO CLIENTE"
EndWsservice

//Montagem da Estrutura do Array EstruturaEmp
WsStruct EstruturaEmp
    WsData M0_CODIGO As String
    WsData M0_CODFIL As String
    WsData M0_FILIAL As String
    WsData M0_NOME As String
    WsData M0_NOMECOM As String
    WsData X_MENSAGEM As String
EndWsStruct

//Chamada do metodo passando o Array aEmpresa
WsMethod LISTAEMPRESA WsReceive cCodEmp WsSend aEmpresa WsService CTT
    Local cEmp := "99"
    Local cFil := "01"
    Local aTab := {"SA1"}
    Local aRet := {}
    Local nDados := 0
    RpcSetEnv(cEmp,cFil,,,'FIN','ListEmpresa',aTab)//abre a conexão com o banco e a empresa padrão

    //Inicialização do Array aEmpresa com dados em branco
    if cCodEmp != 'Abrir'
        ::cRet := "Palavra Chave Invalida"
        aadd(aEmpresa,WsClassNew("EstruturaEmp"))
        aEmpresa[1]:M0_CODIGO := ""
        aEmpresa[1]:M0_CODFIL := ""
        aEmpresa[1]:M0_FILIAL := ""
        aEmpresa[1]:M0_NOME := ""
        aEmpresa[1]:M0_NOMECOM := ""
        aEmpresa[1]:X_MENSAGEM := ::cRet
        Return .t.
    endif

    aRet := SM0->(GETAREA())

    //Alimentação do Array aEmpresa com Valores da Filial Logada
    WHILE SM0->(!EOF())
        nDados += 1
        aadd(aEmpresa,WsClassNew("EstruturaEmp"))
        aEmpresa[nDados]:M0_CODIGO := SM0->M0_CODIGO
        aEmpresa[nDados]:M0_CODFIL := SM0->M0_CODFIL
        aEmpresa[nDados]:M0_FILIAL := SM0->M0_FILIAL
        aEmpresa[nDados]:M0_NOME := SM0->M0_NOME
        aEmpresa[nDados]:M0_NOMECOM := SM0->M0_NOMECOM
        aEmpresa[nDados]:X_MENSAGEM := "Sucesso "+strzero(nDados,2)
        SM0->(DBSKIP())
    END

    RESTAREA(aRet)

Return .T.
