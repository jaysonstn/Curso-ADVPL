#include 'totvs.ch'


/*/{Protheus.doc} zPessoa
    (Cria��o de Classe)
    @author Jayson
    @since 08/09/2025
    @version version
    /*/
Class zPessoa
     //Atributos
    Data cNome
    Data nIdade
    Data dNascimento


    //M�todo Construtor
    Method New() CONSTRUCTOR

    //M�todo
    Method MostraIdade()

EndClass

Method New(cNome, dNascimento) Class zPessoa
    ::cNome := cNome
    ::dNascimento := dNascimento
    ::nIdade := fCalcIdade(dNascimento)
   
Return Self

/*/{Protheus.doc} MostraIdade
    (Cria��o M�todos)
    @author Jayson
    @since 08/09/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    /*/
Method MostraIdade() Class zPessoa
    Local cMsg := ""

    cMsg := "A pessoa "+::cNome+ " Tem "+cValToChar( ::nIdade )+ " anos!"
    MsgInfo( cMsg, "Informa��o" )


Return

/*/{Protheus.doc} fCalcIdade
    (Fun��o calcula idade)
    @type  Static Function
    @author Jayson
    @since 08/09/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function fCalcIdade(dNascimento)
    Local nIdade
    Local dHoje := Date()

    nIdade := DateDiffYear(dHoje, dNascimento)
Return nIdade
