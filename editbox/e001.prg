/*
 * Ejemplo EditBox n� 1
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo detectar cuando la �ltima
 * l�nea del texto se muestra en el �rea del control,
 * utilizando los m�todos GetLastVisibleLine y GetLineCount.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main
   PRIVATE oForm, oCtrl, oLbl, oTmr

   DEFINE WINDOW Frm_1 ;
      AT 0, 0 ;
      OBJ oForm ;
      WIDTH 480 ;
      HEIGHT 430 ;
      CLIENTAREA ;
      NOSIZE ;
      TITLE 'EditBox - Detectar cuando se muestra la �ltima l�nea' ;
      MAIN ;
      ON INIT LlenarCtrl()

      @ 10, 10 EDITBOX edt_1 ;
         OBJ oCtrl ;
         WIDTH oForm:ClientWidth - 20 ;
         HEIGHT oForm:ClientHeight - 60 ;
         READONLY ;
         NOHSCROLL

      @ oForm:ClientHeight - 40, 10 LABEL lbl_1 ;
         OBJ oLbl ;
         VALUE "" ;
         WIDTH 300 ;
         HEIGHT 30 ;
         FONTCOLOR BLUE

      DEFINE TIMER tmr_1 OBJ oTmr INTERVAL 200 ACTION ControlarFin()

      ON KEY ESCAPE ACTION oForm:Release()
   END WINDOW

   CENTER WINDOW Frm_1
   ACTIVATE WINDOW Frm_1

RETURN NIL

FUNCTION LlenarCtrl
   LOCAL cLines, i

   cLines := "Esta es la l�nea 001"
   FOR i = 2 TO 100
      cLines += ( CRLF + "Esta es la l�nea " + StrZero( i, 3, 0 ) )
   NEXT
   oCtrl:Value := cLines

RETURN NIL

FUNCTION ControlarFin
   IF oCtrl:GetLastVisibleLine() + 1 == oCtrl:GetLineCount()
       oLbl:Value := "Se lleg� al final"
       oLbl:FontColor := RED
   ELSE
       oLbl:Value := "�ltima l�nea visible " + LTrim( Str( oCtrl:GetLastVisibleLine() + 1 ) ) + " de " + LTrim( Str( oCtrl:GetLineCount() ) )
       oLbl:FontColor := BLUE
   ENDIF
RETURN NIL

/*
 * EOF
 */
