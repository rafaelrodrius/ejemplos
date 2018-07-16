/*
 * Ejemplo Grid n� 21
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra el uso de SET AUTOADJUST ON para reajustar
 * autom�ticamente los controles de un formulario cada vez que se
 * modifica el tama�o del mismo.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include 'oohg.ch'

FUNCTION Main
   LOCAL oGrid

   SET AUTOADJUST ON
   
   DEFINE WINDOW Form_1 ;
      AT 0, 0 ;
      CLIENTAREA ;
      WIDTH 640 ;
      HEIGHT 480 ;
      TITLE "Ejemplo AutoAdjust" ;

      @ 20, 20 GRID Grid_1 ;
         OBJ oGrid ;
         WIDTH 600 ;
         HEIGHT 400 ;
         HEADERS {'Col.1', 'Col.2'} ;
         WIDTHS { 200, 200 }

      @ 430, 20 LABEL Label_1 ;
         WIDTH 600 ;
         VALUE "Las columnas mantienen sus proporciones " + ;
               "cada vez que cambia el tama�o del formulario." ;
         FONTCOLOR RED
   END WINDOW

   ACTIVATE WINDOW Form_1
RETURN NIL

/*
 * EOF
 */
