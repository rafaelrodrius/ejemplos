/*
 * Ejemplo Menu n� 5
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo abrir un item del menu
 * (din�micamente definido) usando su tecla de acceso
 * r�pido.
 *
 * Vis�tenos en https://github.com/fyurisich/OOHG_Samples o en
 * http://oohg.wikia.com/wiki/Object_Oriented_Harbour_GUI_Wiki
 */

#include "oohg.ch"

FUNCTION Main()

   cMenuItem := "Abrir &Archivo"
   cShortcut := SUBSTR( cMenuItem, AT( "&", cMenuItem ) + 1, 1 )

   DEFINE WINDOW Win_1 ;
      AT 0,0 ;
      WIDTH 640 ;
      HEIGHT 480 ;
      TITLE "Abrir Men�" ;
      MAIN ;
      ON INIT INSERTAR_ALT_F( ASC( cShortcut ) )

      DEFINE MAIN MENU OF Win_1
         POPUP cMenuItem
            ITEM "Uno" ACTION MsgInfo( "Opci�n de Men� Uno" )
            ITEM "Dos" ACTION MsgInfo( "Opci�n de Men� Dos" )
            SEPARATOR
            ITEM "Salir" ACTION Win_1.Release
         END POPUP
      END MENU

      /*
      El truco consiste en definir una tecla aceleradora para el item,
      usando un & antes de la correspondiente letra (en este caso A),
      y simular que el usuario ha presionado Alt+F por medio de la
      funci�n INSERTAR_ALT_F().
      */

      @ 100, 10 LABEL Lbl_1 ;
         VALUE "El men� deber�a verse abierto al iniciarse el formulario." ;
         AUTOSIZE

      ON KEY ESCAPE ACTION Win_1.Release
   END WINDOW

   CENTER WINDOW Win_1
   ACTIVATE WINDOW Win_1

RETURN NIL

#pragma BEGINDUMP

#include "hbapi.h"
#include <windows.h>

HB_FUNC( INSERTAR_ALT_F )
{
   keybd_event( VK_MENU, 0, 0, 0 ) ;
   keybd_event( VkKeyScan( hb_parni( 1 ) ), 0, 0, 0 ) ;
   keybd_event( VK_MENU, 0, KEYEVENTF_KEYUP, 0 );
}

#pragma ENDDUMP

/*
 * EOF
 */
