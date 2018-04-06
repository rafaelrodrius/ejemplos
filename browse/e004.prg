/*
 * Ejemplo Browse n� 4
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Basado en un ejemplo de la distribuci�n de OOHG mantenida
 * por Ciro Vargas Clemow <cvc@oohg.org>
 *
 * Este ejemplo muestra el comportamiento del Browse cuando se
 * edita un archivo dbf (con o sin �ndice activo) junto con las
 * cl�usulas FULLMOVE, INPLACE, FORCEREFRESH y NOREFRESH.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"
#include "dbstruct.ch"

FUNCTION Main

   LOCAL Form_1, Browse_1, lIndex := .F., DataAppend := ""

   REQUEST DBFCDX, DBFFPT

   SET CENTURY ON
   SET DELETED ON
   SET BROWSESYNC ON

   DEFINE WINDOW Form_1 OBJ Form_1 ;
      AT 0, 0 ;
      CLIENTAREA ;
      WIDTH 500 HEIGHT 380 ;
      MINWIDTH 500 MINHEIGHT 380 ;
      TITLE 'ooHG Demo - Edici�n en el Browse' ;
      MAIN NOMAXIMIZE ;
      ON INIT { || OnPaint( Form_1 ), OpenTables() } ;
      ON RELEASE dbCloseAll() ;
      ON SIZE OnPaint( Form_1 )

      DEFINE MAIN MENU
         ITEM "Index" ;
            ACTION { || lIndex := ! lIndex, dbSetOrder( IF( lIndex, 1, 0 ) ) }
         ITEM "Sync" ;
            ACTION SetBrowseSync( ! SetBrowseSync() )
         ITEM "Inplace" ;
            ACTION Browse_1:InPlace := ! Browse_1:InPlace
         ITEM "FullMove" ;
            ACTION Browse_1:FullMove := ! Browse_1:FullMove
         POPUP "Refresh"
            ITEM "Force" ;
               NAME mnu_1 ;
               ACTION { || Browse_1:RefreshType := 0, ;
                           Form_1:mnu_1:Checked := .T., ;
                           Form_1:mnu_2:Checked := .F., ;
                           Form_1:mnu_3:Checked := .F. }
            ITEM "No" ;
               NAME mnu_2 ;
               ACTION { || Browse_1:RefreshType := 1, ;
                           Form_1:mnu_1:Checked := .F., ;
                           Form_1:mnu_2:Checked := .T., ;
                           Form_1:mnu_3:Checked := .F. }
            ITEM "Default" ;
               NAME mnu_3 ;
               CHECKED ;
               ACTION { || Browse_1:RefreshType := NIL, ;
                           Form_1:mnu_1:Checked := .F., ;
                           Form_1:mnu_2:Checked := .F., ;
                           Form_1:mnu_3:Checked := .T. }
         END POPUP
         ITEM "Data" ;
            ACTION Form_1.StatusBar.Item( 1 ) := ;
                      IF( lIndex, "INDX - ", "NO INDX - " ) + ;
                      IF( SetBrowseSync(), "SYNC - ", "NO SYNC - " ) + ;
                      IF( Browse_1:InPlace, "INPL - ", "NO INPL - " ) + ;
                      IF( Browse_1:FullMove, "FULL - ", "NO FULL - " ) + ;
                      "RecNo: " + LTrim( Str( test->(RecNo()) ) ) + ;
                      " Value: " + LTrim( Str( Browse_1:Value ) ) + ;
                      " Append: " + DataAppend
      END MENU

      DEFINE STATUSBAR
        STATUSITEM "El Poder de OOHG !!!"
      END STATUSBAR

      @ 10, 10 BROWSE Browse_1 OBJ Browse_1 ;
         WIDTH 610 ;
         HEIGHT 390 ;
         HEADERS { 'C�digo', ;
                   'Nombre', ;
                   'Apellido', ;
                   'Nacido', ;
                   'Casado' } ;
         WIDTHS { 150, ;
                  150, ;
                  150, ;
                  150, ;
                  150 } ;
         WORKAREA test ;
         FIELDS { 'Code', ;
                  'First', ;
                  'Last', ;
                  'Birth', ;
                  'Married' } ;
         FONT "Courier New" SIZE 10 ;
         JUSTIFY { BROWSE_JTFY_RIGHT, ;
                   BROWSE_JTFY_CENTER, ;
                   BROWSE_JTFY_CENTER, ;
                   BROWSE_JTFY_CENTER, ;
                   BROWSE_JTFY_CENTER } ;
         DELETE ;
         LOCK ;
         EDIT ;
         INPLACE ;
         FULLMOVE ;
         APPEND ;
         ON CHANGE Form_1.StatusBar.Item( 1 ) := ;
                      IF( lIndex, "INDX - ", "NO INDX - " ) + ;
                      IF( SetBrowseSync(), "SYNC - ", "NO SYNC - " ) + ;
                      IF( Browse_1:InPlace, "INPL - ", "NO INPL - " ) + ;
                      IF( Browse_1:FullMove, "FULL - ", "NO FULL - " ) + ;
                      "RecNo: " + LTRIM( Str( test->(RecNo()) ) ) + ;
                      " Value: " + LTrim( Str( Browse_1:Value ) ) + ;
                      " Append: " + DataAppend ;
         ON APPEND Form_1.StatusBar.Item( 1 ) := ;
                      IF( lIndex, "INDX - ", "NO INDX - " ) + ;
                      IF( SetBrowseSync(), "SYNC - ", "NO SYNC - " ) + ;
                      IF( Browse_1:InPlace, "INPL - ", "NO INPL - " ) + ;
                      IF( Browse_1:FullMove, "FULL - ", "NO FULL - " ) + ;
                      "RecNo: " + LTrim( Str( test->(RecNo()) ) ) + ;
                      " Value: " + LTrim( Str( Browse_1:Value ) ) + ;
                      " Append: " + ;
                      ( DataAppend := LTrim( Str( test->(RecNo()) ) ) + ;
                                      " " + LTrim( Str( Browse_1:Value )) )

      ON KEY ESCAPE ACTION Form_1.Release
   END WINDOW

   CENTER WINDOW Form_1

   ACTIVATE WINDOW Form_1

RETURN NIL

//--------------------------------------------------------------------------//
FUNCTION OpenTables()

   LOCAL aDbf[ 5, 4 ]

   aDbf[1][ DBS_NAME ] := "Code"
   aDbf[1][ DBS_TYPE ] := "Numeric"
   aDbf[1][ DBS_LEN ]  := 10
   aDbf[1][ DBS_DEC ]  := 0

   aDbf[2][ DBS_NAME ] := "First"
   aDbf[2][ DBS_TYPE ] := "Character"
   aDbf[2][ DBS_LEN ]  := 25
   aDbf[2][ DBS_DEC ]  := 0

   aDbf[3][ DBS_NAME ] := "Last"
   aDbf[3][ DBS_TYPE ] := "Character"
   aDbf[3][ DBS_LEN ]  := 25
   aDbf[3][ DBS_DEC ]  := 0

   aDbf[4][ DBS_NAME ] := "Married"
   aDbf[4][ DBS_TYPE ] := "Logical"
   aDbf[4][ DBS_LEN ]  := 1
   aDbf[4][ DBS_DEC ]  := 0

   aDbf[5][ DBS_NAME ] := "Birth"
   aDbf[5][ DBS_TYPE ] := "Date"
   aDbf[5][ DBS_LEN ]  := 8
   aDbf[5][ DBS_DEC ]  := 0

   DBCREATE("Test", aDbf, "DBFCDX")

   USE test VIA "DBFCDX"
   ZAP

   FOR i := 1 TO 50
      APPEND BLANK
      REPLACE Code    WITH HB_RandomInt(99) * 10000
      REPLACE First   WITH 'First Name '+ STR(i)
      REPLACE Last    WITH 'Last Name '+ STR(i)
      REPLACE Married WITH .t.
      REPLACE Birth   WITH Date() + i - 10000
   NEXT i

   INDEX ON Code TO code
   SET ORDER TO 0
   GO BOTTOM

   Form_1.Browse_1.Value := RecNo()

RETURN NIL

//--------------------------------------------------------------------------//
FUNCTION OnPaint( Form )

  WITH OBJECT Form
    :Browse_1:Row    := ;
    :Browse_1:Col    := 20
    :Browse_1:Width  := :ClientWidth - :Browse_1:Col * 2
    :Browse_1:Height := :ClientHeight - :Browse_1:Row * 2 + :StatusBar:ClientHeightUsed
  END WITH

RETURN NIL

/*
 * EOF
 */
