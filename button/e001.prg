/*
 * Ejemplo Button n� 1
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo destacar un bot�n usando
 * el evento OnMouseMove del bot�n y el evento OnMouseMouse
 * del formulario.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include 'oohg.ch'

FUNCTION Main()

   LOCAL oMainForm
   PRIVATE oButton_3, oLbl_1

   DEFINE WINDOW MainForm ;
      OBJ oMainForm ;
      AT 0, 0 ;
      WIDTH 600 ;
      HEIGHT 200 ;
      TITLE "ooHG Demo - Eventos OnMouseMove del Control y del Form" ;
      MAIN ;
      ON MOUSEMOVE {|| OnMouseMoveWindow()}

      @ 10, 10 BUTTON Button_3 ;
         OBJ oButton_3 ;
         WIDTH 150 ;
         HEIGHT 30 ;
         CAPTION "&Salir" ;
         ACTION oMainForm:Release() ;
         FONT "Tahoma" SIZE 9 ;
         ON MOUSEMOVE {|| OnMouseMoveButton()}

      @ 10, 200 LABEL lbl_1 ;
         OBJ oLbl_1 ;
         WIDTH 200 ;
         VALUE "" ;
         TRANSPARENT

      @ 70, 10 LABEL lbl_2 ;
         WIDTH 200 ;
         HEIGHT 100 ;
         VALUE "Mueva el mouse dentro del formulario y mire " + ;
               "que sucede cuando pasa por encima del bot�n."

      ON KEY ESCAPE ACTION oMainForm:Release()
   END WINDOW

   CENTER WINDOW MainForm
   ACTIVATE WINDOW MainForm

RETURN Nil

FUNCTION OnMouseMoveWindow

   oLbl_1:Value := "Form. - Fila " + ;
                   LTRIM(STR(_OOHG_MouseRow)) + ;
                   " Columna " + LTRIM(STR(_OOHG_MouseCol))
   oButton_3:FontSize := 9

RETURN Nil

FUNCTION OnMouseMoveButton

   oLbl_1:Value := ""
   oButton_3:FontSize := 18

RETURN Nil

/*
 * EOF
 */
