/*
 * Ejemplo Client Adjust n� 2
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Basado en una contribuci�n original de
 * Cayetano G�mez <cayetano.gomez@gmail.com>
 *
 * Este ejemplo muestra c�mo colocar una Toolbar al pie de un
 * formulario que, adem�s, tiene una Statusbar al pie.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include 'oohg.ch'

FUNCTION Main()

   DEFINE WINDOW ppal OBJ oWnd WIDTH 400 HEIGHT 300 ;
      TITLE "Statusbar y Toolbar en la parte inferior"

      DEFINE STATUSBAR OBJ oSb
         STATUSITEM "El poder de OOHG !!!"
         DATE
         CLOCK
      END STATUSBAR

      DEFINE INTERNAL inte OBJ oInt
         DEFINE TOOLBAR tool OBJ oTool BUTTONSIZE 25,25 BOTTOM BORDER
            BUTTON firs CAPTION '|<'
            BUTTON prev CAPTION '<<'
            BUTTON next CAPTION '>>'
            BUTTON last CAPTION '>|'
            BUTTON edit CAPTION '><'
         END TOOLBAR
      END INTERNAL

      oInt:Adjust := 'BOTTOM'
      oInt:Height := oTool:Height

      ON KEY ESCAPE ACTION ppal.Release
   END WINDOW

   CENTER WINDOW ppal
   ACTIVATE WINDOW ppal

RETURN NIL

/*
 * EOF
 */
