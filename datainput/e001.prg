/*
 * Data Input Sample n� 1
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo evitar la validaci�n de datos
 * cuando se cancela la transacci�n de ingreso.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main

   LOCAL oForm1

   DEFINE WINDOW Form_1 ;
      OBJ oForm1 ;
      AT 0,0 ;
      WIDTH 500 ;
      HEIGHT 200 ;
      MAIN ;
      NOSYSMENU ;
      TITLE "ooHG - c�mo evitar las validaciones cuando se cancela la transacci�n"

      @ 13, 10 LABEL lbl_1 ;
         VALUE "Valor" ;
         WIDTH 60 ;
         HEIGHT 24

      @ 10, 70 TEXTBOX txt_1 ;
         OBJ oTxt1 ;
         NUMERIC ;
         INPUTMASK "999.9" ;
         VALID {|| oTxt1:value > 0} ;
         WIDTH 60 ;
         HEIGHT 24

      @ 80, 100 BUTTON btn_1 ;
         CAPTION 'Salir' ;
         WIDTH  100 ;
         ACTION oForm1:Release() ;
         CANCEL

      ON KEY ESCAPE ACTION oForm1:Release()
   END WINDOW

   oForm1:Center()
   oForm1:Activate()

RETURN NIL

/*
 * EOF
 */
