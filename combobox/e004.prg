/*
 * Ejemplo Combobox n� 4
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo usar los m�todos GetDropDownWidth,
 * SetDropDownWidth, AutosizeDropDown y Autosize para cambiar
 * el tama�o de un control combobox durante la ejecuci�n.
 *
 * Los m�todoss demostrados aqu� son:
 *
 * GetDropDownWidth()
 *    Obtiene el tama�o m�nimo permitido, en pixels, de la
 *    lista desplegable.
 *
 *  SetDropDownWidth( nWidth )
 *    Setea el tama�o m�nimo permitido, en pixels, de la lista
 *    desplegable. Si tiene �xito retorna nWidth sino retorna
 *    el tama�o por defecto.
 *
 *  Autosize( lValue )
 *     Si lValue es .T. el tama�o del control (ancho y alto) ser�
 *     modificado cada vez qaue un item es seleccionado de forma
 *     que todo el texto sea visible.
 *
 *  AutosizeDropDown( lResizeBox, nMinWidth, nMaxWidth )
 *    Setea el ancho m�nimo y el m�ximo de la lista desplegable
 *    y de la ventana de texto.
 *
 *    Calcula el espacio necesario para mostrar el item m�s largo
 *    en la lista desplegable. Si el valor calculado es menor que
 *    el m�nimo, se usa el m�nimo como el nuevo ancho. Si el valor
 *    calculado es mayor que el m�ximo, se usa el m�ximo.
 *    Si lResizeBox es .T. cambia el tama�o del Combobox.
 *    Si es .F. cambia el tama�o de la lista desplegable.
 *
 *    El ancho de la lista desplegable es, siempre, al menos
 *    igual al ancho del Combobox.
 *
 *    Par�metros:
 *       lResizeBox = .T. para cambiar el tama�o de la lista
 *                    desplegable y el del Combobox
 *                    .F. para cambiar solo el tama�o de la lista
 *                    desplegable (acci�n por defecto)
 *       nMinWidth  = ancho m�nimo
 *                    Si se omite o es 0
 *                       Si lResizeBox == .T.
 *                          Se utiliza 0 como valor
 *                       Sino
 *                          Se utiliza el ancho del Combobox
 *       nMaxWidth  = ancho m�ximo
 *                    Si se omite se utiliza el ancho del item
 *                    m�s largo. Si es menor que el m�nimo se
 *                    utiliza el mayor entre el ancho del item
 *                    m�s largo o el ancho m�nimo.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main

  LOCAL oFrm1, oCmb1, oTxt1, oTxt2, oTxt3, oTxt4, oCmb3

   DEFINE WINDOW Form_1 ;
      OBJ oFrm1 ;
      AT 0,0 ;
      WIDTH 440 ;
      HEIGHT 380 ;
      MINWIDTH 440 ;
      MINHEIGHT 380 ;
      TITLE 'ooHG - ComboBox Demo' ;
      MAIN ;
      ON INIT AdjustSize( oFrm1 ) ;
      ON SIZE AdjustSize( oFrm1 )

   @ 10,10 LABEL lbl_1 ;
      VALUE "1. Cliquee la flecha del combo para desplegar la lista." ;
      WIDTH 200

   @ 40,10 COMBOBOX cmb_1 ;
      OBJ oCmb1 ;
      WIDTH 30 ;
      ITEMS {'Item A','Item B','Item C - uno muy grande'} ;
      VALUE 1

   @ 80, 10 BUTTON btn_1 ;
      WIDTH 150 ;
      HEIGHT 24 ;
      CAPTION "GetDropDownWidth" ;
      ACTION AutoMsgBox( oCmb1:GetDropDownWidth() )

   @ 80,170 LABEL lbl_2 ;
      VALUE "2. Ancho actual de la lista." ;
      WIDTH 200

   @ 110, 10 BUTTON btn_2 ;
      WIDTH 150 ;
      HEIGHT 24 ;
      CAPTION "SetDropDownWidth = 300" ;
      ACTION AutoMsgBox( oCmb1:SetDropDownWidth( 300 ) )

   @ 110,170 LABEL lbl_3 ;
      VALUE "3. Cliquee el bot�n y luego cliquee la flecha del combo." ;
      WIDTH 200

   @ 140, 10 BUTTON btn_3 ;
      WIDTH 150 ;
      HEIGHT 24 ;
      CAPTION "SetDropDownWidth = 3" ;
      ACTION AutoMsgBox( oCmb1:SetDropDownWidth( 3 ) )

   @ 140,170 LABEL lbl_4 ;
      VALUE "4. Cliquee el bot�n y luego cliquee la flecha del combo." ;
      WIDTH 200

   @ 170, 170 LABEL lbl_5 ;
      VALUE "M�n." ;
      AUTOSIZE

   @ 170, 220 LABEL lbl_6 ;
      VALUE "M�x." ;
      AUTOSIZE

   @ 190, 10 BUTTON btn_4 ;
      WIDTH 150 ;
      HEIGHT 24 ;
      CAPTION "AutosizeDropDown de la Lista" ;
      ACTION oCmb1:AutosizeDropDown( .F., oTxt1:value, oTxt2:value )

   @ 190, 170 TEXTBOX txt_1 ;
      OBJ oTxt1 ;
      WIDTH 40 ;
      HEIGHT 24 ;
      NUMERIC ;
      INPUTMASK "999"

   @ 190, 220 TEXTBOX txt_2 ;
      OBJ oTxt2 ;
      WIDTH 40 ;
      HEIGHT 24 ;
      NUMERIC ;
      INPUTMASK "999"

   @ 190,270 LABEL lbl_7 ;
      VALUE "5. Ingrese diferentes valores, cliquee y vea que pasa." ;
      WIDTH 150 ;
      HEIGHT 36

   @ 220, 10 BUTTON btn_5 ;
      WIDTH 150 ;
      HEIGHT 24 ;
      CAPTION "AutosizeDropDown Ambos" ;
      ACTION oCmb1:AutosizeDropDown( .T., oTxt3:value, oTxt4:value )

   @ 220, 170 TEXTBOX txt_3 ;
      OBJ oTxt3 ;
      WIDTH 40 ;
      HEIGHT 24 ;
      NUMERIC ;
      INPUTMASK "999"

   @ 220, 220 TEXTBOX txt_4 ;
      OBJ oTxt4 ;
      WIDTH 40 ;
      HEIGHT 24 ;
      NUMERIC ;
      INPUTMASK "999"

   @ 220,270 LABEL lbl_8 ;
      VALUE "6. Ingrese diferentes valores, cliquee y vea que pasa." ;
      WIDTH 150 ;
      HEIGHT 36

   @ 260,10 LABEL lbl_9 ;
      VALUE "7. Cambie el ancho de la ventana para ver que sucede." ;
      WIDTH 180 ;
      HEIGHT 36

   @ 260,200 COMBOBOX cmb_2 ;
      WIDTH 30 ;
      ITEMS {'Item Uno', ;
             'Item Dos, Dos', ;
             'Item Tres, Tres, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, Tres, Tres'} ;
      VALUE 1

   @ 300,10 LABEL lbl_10 ;
      VALUE "8. Seleccione un item y vea que pasa." ;
      WIDTH 180 ;
      HEIGHT 36

   @ 300,200 COMBOBOX cmb_3 ;
      OBJ oCmb3 ;
      WIDTH 30 ;
      ITEMS {'Primer item', ;
             'B', ;
             'Tercer y �ltimo item'} ;
      VALUE 2
   oCmb3:Autosize( .T. )

    ON KEY ESCAPE ACTION THISWINDOW.RELEASE
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN NIL

FUNCTION AdjustSize( oWin )

   WITH OBJECT oWin
      :cmb_2:AutoSizeDropDown( .T., ;
                         30, ;
                         :ClientWidth - :lbl_9:Col - :lbl_9:Width - 20 )
   END WITH

RETURN NIL

/*
 * EOF
 */
