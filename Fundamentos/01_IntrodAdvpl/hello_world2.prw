#Include 'Totvs.ch'
#Include 'protheus.ch'

 /*/{Protheus.doc} nomeFunction
    (long_description)
    @type  Function
    @author user
    @since 24/03/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function Hello_world()
    local cMsg := "Ol� Mundo!" // Texto que vai ser exibido

    hellomsg(cMsg) // Chamada da fun��o estatica

Return


Static Function hellomsg(cMsg) // Fun��o que vai chamar a msginfo para exibi��o do texto
  
   MsgInfo(cMsg) // Variavel de texto com a mensagem definida na fun��o Hello_world

Return
