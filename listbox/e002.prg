/*
 * Ejemplo Listbox n� 2
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo agregar im�genes a un listbox.
 *
 * Vis�tenos en https://github.com/fyurisich/OOHG_Samples o en
 * http://oohg.wikia.com/wiki/Object_Oriented_Harbour_GUI_Wiki
 *
 * Puede descargar las im�genes utilizadas en este ejemplo desde
 * https://github.com/fyurisich/OOHG_Samples/tree/master/Espa�ol/Ejemplos/ListBox
 */

#include "oohg.ch"

FUNCTION Main

   SET AUTOADJUST ON

   DEFINE WINDOW Form_1 ;
      AT 0, 0 ;
      WIDTH 480 ;
      HEIGHT 680 ;
      TITLE 'Listbox con Im�genes' ;
      MAIN

      /*
      Cada item puede ser:
      a) un string.
      b) un array de 2 elementos con un string en la posici�n 1 y una referencia
         a una image en la posici�n 1. La imagen ser� mostrada a la izquierda del
         string todo el tiempo.
      c) un array de 3 elementos con un string en la posici�n 1 y dos referencias
         a im�genes en las posiciones y 3. Las im�genes ser�n mostradas a la
         izquierda del string. Se mostrar� la ubicada en la posici�n 2 cuando el
         item tenga el foco y la otra cuando no lo tenga.

      Notas:
      - Los items pueden ser de diferentes tipos: algunos a), algunos b) y algunos
        c) al mismo tiempo.
      - Las im�genes se numeran a partir de 0.
      - TEXTHEIGHT establece el alto de los items.
      - El alto no puede cambiarse luego de la creaci�n del control.
      - Cuando se omite TEXTHEIGHT, se computa un valor por defecto a partir de
        la fuente asignada al control.
      - Utilice la cl�usula FIT para cortar las im�genes que excedan el alto.
      - Las im�genes ser�n pintadas verticalmente centradas si hay suficiente espacio.
      - Las im�genes se cortan por su lado derecho y/o su lado inferior.
      */

      @ 10,10 LISTBOX List_1 ;
         ITEMS { {'Chat', 0}, {'Edit', 1}, {'Help', 2}, {'Move', 3}, {'Sound', 4} } ;
         VALUE 2 ;
         IMAGE {"chat.bmp", "edit.bmp", "help.bmp", "move.bmp", "sound.bmp"} ;
         HEIGHT 200 ;
         WIDTH 200

      @ 10,250 LISTBOX List_2 ;
         ITEMS { {'Chat', 0}, {'Edit', 1}, {'Help', 2}, {'Move', 3}, {'Sound', 4} } ;
         VALUE 2 ;
         IMAGE {"chat.bmp", "edit.bmp", "help.bmp", "move.bmp", "sound.bmp"} ;
         HEIGHT 200 ;
         WIDTH 200

      @ 220,10 LISTBOX List_3 ;
         ITEMS { {'Chat', 0}, {'Edit', 1}, {'Help', 2}, {'Move', 3}, {'Sound', 4} } ;
         VALUE 2 ;
         IMAGE {"chat.bmp", "edit.bmp", "help.bmp", "move.bmp", "sound.bmp"} ;
         HEIGHT 200 ;
         WIDTH 200 ;
         TEXTHEIGHT 30

      @ 220,250 LISTBOX List_4 ;
         ITEMS { {'Chat', 0}, {'Edit', 1}, {'Help', 2}, {'Move', 3}, {'Sound', 4} } ;
         VALUE 2 ;
         IMAGE {"chat.bmp", "edit.bmp", "help.bmp", "move.bmp", "sound.bmp"} ;
         HEIGHT 200 ;
         WIDTH 200 ;
         TEXTHEIGHT 80

      @ 430,10 LISTBOX List_5 ;
         ITEMS { {'Chat', 0}, {'Edit', 1}, {'Help', 2}, {'Move', 3}, {'Sound', 4} } ;
         VALUE 3 ;
         IMAGE {"chat.bmp", "edit.bmp", "help.bmp", "move.bmp", "sound.bmp"} FIT ;
         HEIGHT 200 ;
         WIDTH 200 ;
         TEXTHEIGHT 30

      @ 430,250 LISTBOX List_6 ;
         ITEMS { {'Chat', 0}, {'Edit', 1}, {'Help', 2}, {'Move', 3}, {'Sound', 4} } ;
         VALUE 3 ;
         IMAGE {"chat.bmp", "edit.bmp", "help.bmp", "move.bmp", "sound.bmp"} FIT ;
         HEIGHT 200 ;
         WIDTH 200 ;
         TEXTHEIGHT 80

      ON KEY ESCAPE ACTION ThisWindow.Release()
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN Nil

/*
 * EOF
 */
