/*
 * Ejemplo Impresi�n n� 1
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo enumerar los tama�os de papel
 * disponibles en un driver de impresora.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 500 ;
      HEIGHT 300 ;
      TITLE 'Tama�os de Papel de una Impresora' ;
      MAIN

      DEFINE STATUSBAR
         STATUSITEM "Haga clic en el bot�n y seleccione una impresora."
      END STATUSBAR

      @ 20, 20 BUTTON But_1 ;
         CAPTION "Mostrar Datos" ;
         ACTION MostrarDatos()

      ON KEY ESCAPE ACTION Form_1.Release()
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN NIL

FUNCTION MostrarDatos()
   LOCAL oPrint

   oPrint := TPrint( "HBPRINTER" )
   oPrint:Init()
   oPrint:SelPrinter()
   IF ! oPrint:LPrError
      AutoMsgBox( oPrint:oHBPrn:PaperNames, "Tama�os de Papel Disponibles" )
   ENDIF

   oPrint:Release()

RETURN NIL

/*
 * EOF
 */
