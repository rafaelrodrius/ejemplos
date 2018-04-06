/*
 * Ejemplo Combobox n� 2
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo asociar im�genes con items
 * utilizando la cla�sula IMAGE.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 *
 * Las im�genes utilizadas en este ejemplo pueden descargarse desde:
 * https://github.com/oohg/ejemplos/tree/master/Combobox
 */

#include "oohg.ch"

FUNCTION Main

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 400 ;
      HEIGHT 200 ;
      TITLE 'ooHG - ComboBox con Im�genes desde una lista' ;
      MAIN

      @ 10,10 COMBOBOX Combo_1 obj Ocombo ;
         ITEMS { {'A', 0} , {'B', 1} , {'C', 2} } ;
         VALUE 1 ;
         IMAGE {"albaran.bmp", "info.bmp", "globe.bmp"} ;
         FIT ;
         TEXTHEIGHT 48 ;
         HEIGHT 300 ;
         BACKCOLOR YELLOW

      ON KEY ESCAPE ACTION ThisWindow.Release()
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN NIL

/*
 * EOF
 */
