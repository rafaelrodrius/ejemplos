/*
 * Ejemplo Message Boxes n� 1
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo definir ventanas de mensajes
 * con diferentes modos. Ver funci�n "Messagebox function"
 * en MSDN.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"
#include "i_windefs.ch"

FUNCTION Main

  SetMsgDefaultMode( MB_APPLMODAL )
  SetMsgDefaultMessage( "Mensaje por defecto." )
  SetMsgDefaultTitle( "T�tulo por defecto" )

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 600 HEIGHT 280 ;
      TITLE 'ooHg - Modos de Ventanas de Mensajes' ;
      MAIN

      @ 10, 10 BUTTON btn_1 ;
         CAPTION "Usa el modo por defecto, el mensaje por defecto y el t�tulo por defecto." ;
         WIDTH 500 ;
         HEIGHT 28 ;
         ACTION MsgInfo()

      @ 50, 10 BUTTON btn_2 ;
         CAPTION "Usa el mensaje por defecto y el t�tulo por defecto, modo = MB_SYSTEMMODAL." ;
         WIDTH 500 ;
         HEIGHT 28 ;
         ACTION MsgStop( Nil, Nil, MB_SYSTEMMODAL )

      @ 90, 10 BUTTON btn_3 ;
         CAPTION "Usa el modo por defecto y el mensaje y el t�tulo definidos." ;
         WIDTH 500 ;
         HEIGHT 28 ;
         ACTION MsgExclamation( "No hay �cono en la barra de t�tulo !!!", ;
                                "MB_APPLMODAL" )

      @ 130, 10 BUTTON btn_4 ;
         CAPTION "Usa el modo, el mensaje y el t�tulo definidos." ;
         WIDTH 500 ;
         HEIGHT 28 ;
         ACTION MsgBox( "Este mensaje contiene un �cono del sistema.", ;
                        "MB_SYSTEMMODAL", MB_SYSTEMMODAL )

      @ 180, 10 LABEL lbl_1 ;
         VALUE "Haga clic en los botones para ver ventanas de mensajes con diferentes modos." ;
         WIDTH 500

      ON KEY ESCAPE ACTION Form_1.Release

   END WINDOW

   Form_1.Center

   Form_1.Activate

RETURN Nil

/*
 * EOF
 */
