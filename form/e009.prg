/*
 * Ejemplo Form n� 9
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo utilizar el m�todo SaveAs para
 * guardar la ventana de un form en un archivo.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

PROCEDURE Main

   PUBLIC oWin

   DEFINE WINDOW Win_1 ;
      MAIN ;
      TITLE 'Guardar una instant�nea de un formulario en un archivo' ;
      OBJ oWin ;
      WIDTH 700 HEIGHT 300

      @ 010,10 TEXTBOX Txt0 VALUE "Cliquee para guardar"

      @ 040, 10 BUTTON But1 CAPTION "BMP" ACTION Save( "bmp" )
      @ 070, 10 BUTTON But2 CAPTION "JPG" ACTION Save( "jpg" )
      @ 100, 10 BUTTON But3 CAPTION "TIF" ACTION Save( "tif" )
      @ 130, 10 BUTTON But4 CAPTION "PNG" ACTION Save( "png" )

      ON KEY ESCAPE ACTION oWin:Release
   END WINDOW

   CENTER WINDOW Win_1
   ACTIVATE WINDOW Win_1

RETURN


PROCEDURE Save( cType )

   oWin:SaveAs( "SnapShot." + cType, .T., cType )

RETURN

/*
 * EOF
 */
