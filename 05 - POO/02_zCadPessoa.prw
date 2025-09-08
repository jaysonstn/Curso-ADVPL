#Include 'totvs.ch'

/*/{Protheus.doc} zCadPessoa
(Cadastro de Pessoa)
@type user function
@author Jayson
@since 08/09/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function zCadPessoa()
    Local oPessoa
    Local cNome := "Jayson"
    Local dNascimento := sTod("19940430")

    //Instanciando o Objeto através da classe Pessoa
    oPessoa := zPessoa():New(cNome, dNascimento)

    //Chamando método
    oPessoa:MostraIdade()

Return
