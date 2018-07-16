/*
 * Ejemplo Form n� 6
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplos muestra c�mo desplegar un mensaje mientras
 * un proceso se est� ejecutando.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION MAIN

   PUBLIC oWait

   DEFINE WINDOW MainWin ;
      AT 10, 10 ;
      TITLE "OOHG - Mensaje de Espera" ;
      MAIN

      @ 30, 30 BUTTON btn_Process ;
         CAPTION "Cliqu�ame" ;
         ACTION Process()

      ON KEY ESCAPE ACTION MainWin.Release
   END WINDOW

   MainWin.Center

   DEFINE WINDOW Form_Wait OBJ oWait  ;
      AT 10, 10 ;
      WIDTH 150 ;
      HEIGHT 100 ;
      CLIENTAREA ;
      CHILD ;
      NOSYSMENU ;
      NOCAPTION ;
      NOSHOW ;
      ON INIT oWait:Center()

      @ 40, 15 LABEL lbl_Msg ;
         WIDTH 120 ;
         CENTERALIGN
   END WINDOW

   ACTIVATE WINDOW MainWin, Form_Wait

RETURN NIL

FUNCTION Process()

   oWait:lbl_Msg:Value := "Por favor espere ..."
   oWait:Show()

   /*
    * Sustituya esta l�nea con su proceso
    */
   hb_IdleSleep( 3 )

   oWait:Hide()

RETURN NIL

/*
 * EOF
 */
