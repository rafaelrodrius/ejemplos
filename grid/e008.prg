/*
 * Ejemplo Grid n� 08
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo utilizar un ColumnControl
 * COMBOBOX para editar Inplace un control Grid/Browse.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"
#include "dbstruct.ch"

FUNCTION Main

   LOCAL lOpen, oWnd, aFilas[10,4], i

   REQUEST DBFCDX, DBFFPT

/*
 * La dbf debe abrirse antes de crear el grid para que los valores iniciales
 * de las filas puedan mostrarse correctamente. Si est� cerrada, los valores
 * iniciales ser�n ignorados y las celdas quedar�n en blanco.
 */
   IF ( lOpen := MsgYesNo( "Abrir dbf antes del INIT ?" ) )
      AbrirTablas()
   ENDIF

   DEFINE WINDOW Form_1 ;
      MAIN ;
      TITLE "Edici�n de Celdas en Grid usando un ColumnControl ComboBox" ;
      WIDTH 640 ;
      HEIGHT 400 ;
      ON INIT IF( ! lOpen, AbrirTablas(), NIL )

/*
 * Definici�n de las filas
 * Los valores de las celdas deben corresponder con el tipo del valor
 * retornado por el ColumnControl. Si se utilizan valores de diferente tipo
 * se producir� un error en tipo de ejecuci�n.
 */
      FOR i := 1 TO LEN( aFilas )
         IF i % 2 == 0
            aFilas[i] := {i * 3, ;
                         STRZERO(i * 2, 2), ;
                         i % 3 + 1, ;
                         i % 3 + 4, ;
                         STR(i % 3 + 4, 1, 0), ;
                         i}
         ELSE
            aFilas[i] := {0, "", 0, 0, "", 0}
         ENDIF
      NEXT

/*
 * El Value de la Col 1 es Test->CodeLast y su tipo es Numeric como el field.
 * El Value de la Col 2 es Test->CodeFirst y su tipo es String dado que el
 * field es Character.
 * El Value de la Col 3 es Numeric (es el �ndice del �tem seleccionado) dado
 * que el tercer �tem en el ColumnControl es NIL.
 * El Value de la Col 4 es Numeric (uno de los valores) dado que el tercer
 * �tem en el ColumnControl es un array de n�meros.
 * El Value de la Col 5 es String (uno de los valores) dado que el tercer �tem
 * en el ColulmnControl es un array de strings.
 * El Value del Col 6 es Numeric (es el n�mero de registro en la dbf) dado que
 * el tercer item en el ColumnControl es NIL.
 */
      DEFINE MAIN MENU
         ITEM "Valores del �tem" ;
            ACTION AUTOMSGBOX( VerItem(1) + HB_OsNewLine() + ;
                               VerItem(2) + HB_OsNewLine() + ;
                               VerItem(3) + HB_OsNewLine() + ;
                               VerItem(4) + HB_OsNewLine() + ;
                               VerItem(5) + HB_OsNewLine() + ;
                               VerItem(6) )
      END MENU

      @ 10,10 GRID Grid_1 ;
         WIDTH 620 ;
         HEIGHT 330 ;
         HEADERS { 'Columna 1', ;
                   'Columna 2', ;
                   'Columna 3', ;
                   'Columna 4', ;
                   'Columna 5', ;
                   'Columna 6'} ;
         WIDTHS {100, 100, 100, 100, 100, 100} ;
         ITEMS aFilas ;
         EDIT INPLACE ;
         COLUMNCONTROLS { ;
            {'COMBOBOX','Test->Last','Test->CodeLast','NUMERIC'}, ;
            {'COMBOBOX','Test->First','Test->CodeFirst','CHARACTER'}, ;
            {'COMBOBOX',{'One','Two','Three'}}, ;
            {'COMBOBOX',{'Four','Five','Six'},{4,5,6}}, ;
            {'COMBOBOX',{'Four','Five','Six'},{'4','5','6'}}, ;
            {'COMBOBOX','Test->Last'} }
/*
 * Par�metros del ColumnControl COMBOBOX
 * OPCI�N 1: {'COMBOBOX', par2, par3}
 *   par2 = Array de strings a mostrar en la lista del combo.
 *          Similar a la cl�usula ITEMS del control COMBOBOX.
 *   par3 = Array de valores (numeros o strings) a retornar cuando un item es
 *          seleccionado en el combo (el valor retornado es el valor de la
 *          de la celda).
 *          Similar a la cl�usula VALUESOURCE del control COMBOBOX.
 *          o
 *          NIL: el combo retornar� un valor num�rico entre 1 y LEN(par2).
 * OPCI�N 2: {'COMBOBOX', par2, par3, par4}
 *   par2 = Un string conteniendo el nombre calificado de un field de tipo
 *          character (dbf->field).
 *          Similar a la cl�usula ITEMSOURCE del control COMBOBOX.
 *   par3 = Un string conteniendo el nombre calificado de un field (de tipo
 *          numeric o character).
 *          Similar a la cl�usula VALUESOURCE del control COMBOBOX.
 *          o
 *          NIL: el combo retornar� el n�mero de registro en la dbf.
 *   par4 = constante 'NUMERIC' o 'CHARACTER' indicando el tipo de par3.
 *          Por defecto se asume 'NUMERIC'.
 *          Esta constante debe coincidir con el tipo de par3 o se generar�
 *          un error en tipo de ejecuci�n.
 */

      ON KEY ESCAPE ACTION Form_1.Release()
   END WINDOW

   CENTER WINDOW Form_1

   ACTIVATE WINDOW Form_1

Return

//--------------------------------------------------------------------------//
FUNCTION AbrirTablas()

   LOCAL aDbf[ 4, 4 ]

   aDbf[1][ DBS_NAME ] := "CodeLast"
   aDbf[1][ DBS_TYPE ] := "Numeric"
   aDbf[1][ DBS_LEN ]  := 2
   aDbf[1][ DBS_DEC ]  := 0

   aDbf[2][ DBS_NAME ] := "Last"
   aDbf[2][ DBS_TYPE ] := "Character"
   aDbf[2][ DBS_LEN ]  := 25
   aDbf[2][ DBS_DEC ]  := 0

   aDbf[3][ DBS_NAME ] := "CodeFirst"
   aDbf[3][ DBS_TYPE ] := "Character"
   aDbf[3][ DBS_LEN ]  := 2
   aDbf[3][ DBS_DEC ]  := 0

   aDbf[4][ DBS_NAME ] := "First"
   aDbf[4][ DBS_TYPE ] := "Character"
   aDbf[4][ DBS_LEN ]  := 25
   aDbf[4][ DBS_DEC ]  := 0

   DBCREATE("Test", aDbf, "DBFCDX")

   USE Test VIA "DBFCDX"
   ZAP

   FOR i := 1 TO 30
      APPEND BLANK
      REPLACE CodeLast  WITH i * 3
      REPLACE Last      WITH 'Apellido '+ LTRIM(STR(i))
      REPLACE CodeFirst WITH STRZERO(i * 2, 2)
      REPLACE First     WITH 'Nombre '+ LTRIM(STR(i))
   NEXT i

RETURN NIL

//--------------------------------------------------------------------------//
STATIC FUNCTION VerItem( nItem )

RETURN ( "Col " + ;
         LTRIM(STR(nItem)) + ;
         " - ValType: " + ;
         VALTYPE(Form_1.Grid_1.Item( Form_1.Grid_1.Value )[nItem]) + ;
         " Value: " + ;
         LTRIM(AUTOTYPE(Form_1.Grid_1.Item( Form_1.Grid_1.Value )[nItem])) )

/*
 * EOF
 */
