/*
 * Ejemplo Grid n� 24
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo comenzar la edici�n en la tercera
 * columna de una nueva l�nea de un Grid, usando las cl�usulas
 * ON EDITCELL, WHEN y ON ABORTEDIT.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main
   LOCAL aRows[5, 5], k
   PUBLIC lEdit := .T.

   SET DATE ANSI
   SET CENTURY ON
   SET NAVIGATION EXTENDED

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      CLIENTAREA ;
      WIDTH 600 ;
      HEIGHT 550 ;
      TITLE 'Editar una nueva fila desde la columna 3' ;
      MAIN

      FOR k := 1 TO 5
          aRows[k] := { Str( HB_RandomInt(99), 2 ), ;
                        HB_RandomInt(100), ;
                        HB_RandomInt(100), ;
                        "Refer " + Str( HB_RandomInt(10), 2 ), ;
                        HB_RandomInt(10000) }
      NEXT k

      @ 40,10 GRID Grid_1 obj oGrid ;
         WIDTH 520 ;
         HEIGHT 330 ;
         HEADERS {'CODIGO', 'NUMERO', 'ITEM', 'REFERENCIA', 'IMPORTE'} ;
         WIDTHS {60, 80, 100, 120, 140} ;
         ITEMS aRows ;
         COLUMNCONTROLS { {'TEXTBOX', 'CHARACTER', "99"}, ;
                          {'TEXTBOX', "NUMERIC", '999999'}, ;
                          {'TEXTBOX', "NUMERIC", '999999'}, ;
                          {'TEXTBOX', "CHARACTER"}, ;
                          {'TEXTBOX', 'NUMERIC', '999,999,999.99'} } ;
         FONT "COURIER NEW" SIZE 10 ;
         VALUE 5 ;
         APPEND ;
         EDIT INPLACE ;
         FULLMOVE ;
         WHEN { {|| lEdit }, {|| lEdit }, .T., .T., .T. } ;
         ON EDITCELL CeldaEditada( oGrid ) ;
         ON ABORTEDIT lEdit := .T.

      ON KEY ESCAPE ACTION ThisWindow.Release
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN NIL


FUNCTION CeldaEditada( oGrid )
   LOCAL i

   IF This.CellColIndex == 2 .AND. _OOHG_ThisItemCellValue >= 50
      /*
         Hago pensar al Grid que acaba de editar la �ltima columna.
         Si estoy en la �ltima fila, al finalizar esta funci�n se
         agregar� una nueva fila. Si no, contin�a en la siguiente.
      */
      FOR i := 1 TO ( oGrid:ColumnCount - This.CellColIndex )
         oGrid:Right()
      NEXT i

      // Deshabilito la edici�n de las columnas 1 y 2
      lEdit := .F.
   ELSE
      lEdit := .T.
   ENDIF

RETURN NIL


/*
 * EOF
 */
