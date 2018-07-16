/*
 * Ejemplo Label n� 3
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo crear un LABEL multil�nea.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main

   DEFINE WINDOW Form OBJ oWin ;
      AT 0,0 ;
      WIDTH 330 HEIGHT 200 ;
      TITLE "Demo de Control LABEL Multil�nea" ;
      MAIN

      @ 20,20 LABEL lbl OBJ oLbl ;
         VALUE "Este es un control label " + HB_OSNewLine() + ;
               "multil�nea." + HB_OSNewLine() + ;
               "Yo soy la tercera l�nea !!!" ;
         WIDTH 200 ;
         HEIGHT 50

      ON KEY ESCAPE ACTION Form.Release
   END WINDOW

   CENTER WINDOW Form
   ACTIVATE WINDOW Form

RETURN NIL

/*
 * EOF
 */
