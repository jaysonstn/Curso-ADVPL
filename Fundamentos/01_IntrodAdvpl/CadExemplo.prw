#Include "protheus.ch"


User Function CadExem1()
    Local oModel   := FWFormModel():New("CADUSER", .F., .T.)  // alias, sem commit, auto-create
    Local oView    := FWFormView():New(oModel, "Cadastro de Usuário")

    // Definição dos campos no Model
    oModel:AddField("NOME",     "C", 50, "Nome")
    oModel:AddField("EMAIL",    "C", 100, "E-mail")
    oModel:AddField("TELEFONE", "C", 20, "Telefone")

    // Definição dos controles na View
    oView:AddField("NOME"    , 10, 10, 200, 20)
    oView:AddField("EMAIL"   , 40, 10, 200, 20)
    oView:AddField("TELEFONE", 70, 10, 200, 20)

    // Botão Salvar
    oView:AddButton("Salvar", {|| SalvarCadastro(oModel:GetValue("NOME"), ;
                                                 oModel:GetValue("EMAIL"), ;
                                                 oModel:GetValue("TELEFONE"))})

    // Botão Cancelar
    oView:AddButton("Cancelar", {|| oView:Close()})

    // Ativa a tela
    oView:Activate()

Return

Static Function SalvarCadastro(cNome, cEmail, cTelefone)
    MsgInfo("Usuário cadastrado: " + cNome + ;
            " | E-mail: " + cEmail + ;
            " | Telefone: " + cTelefone, ;
            "Confirmação")
Return
