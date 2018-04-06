/*
 * Ejemplo ComboBox n� 7
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Basado en un ejemplo de la distribuci�n de OOHG
 * (c) 2002 Roberto Lopez
 * Modificado por Ciro Vargas Clemow <cvc@oohg.org>
 *
 * Este ejemplo muestra c�mo cambiar la posici�n de la
 * careta de edici�n en un control ComboBox con la cl�usula
 * DISPLAYEDIT y c�mo forzar el valor del DisplayEdit
 * a may�sculas.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 400 ;
      HEIGHT 200 ;
      TITLE 'CaretPos en ComboBox con DisplaEdit' ;
      MAIN

      DEFINE MAIN MENU
         DEFINE POPUP 'Probar'
            MENUITEM 'Obtener Value' ;
               ACTION autoMsgInfo( oCombo:Value )
            MENUITEM 'Cambiar Value' ;
               ACTION oCombo:Value := 1
            MENUITEM 'Obtener DisplayValue' ;
               ACTION MsgInfo( oCombo:DisplayValue )
            MENUITEM 'Cambiar DisplayValue' ;
               ACTION ( oCombo:DisplayValue := 'Nuevo Texto', ;
                        oCombo:SetFocus(), ;
                        oCombo:CaretPos := 3 )
         END POPUP
      END MENU


      @ 10,10 COMBOBOX Combo_1 OBJ oCombo ;
         ITEMS { 'Naranja' , 'Negro' , 'Amarillo' } ;
         VALUE 1 ;
         DISPLAYEDIT ;
         IMAGE {} ;
         ON DISPLAYCHANGE ForzarMayusculas( oCombo, oText )
      oCombo:FontColorSelected := GREEN
      oCombo:BackColorSelected := YELLOW

      @ 50, 10 TEXTBOX Text_1 OBJ oText

   END WINDOW

   CENTER WINDOW Form_1

   ACTIVATE WINDOW Form_1

RETURN NIL

STATIC FUNCTION ForzarMayusculas( oCombo, oText )

  LOCAL nPos := oCombo:CaretPos

  oText:value := oCombo:DisplayValue

  oCombo:DisplayValue := Upper( oCombo:DisplayValue )

  oCombo:CaretPos := nPos

RETURN NIL

/*
 * EOF
 */
