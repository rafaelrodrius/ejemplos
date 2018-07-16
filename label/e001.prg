/*
 * Ejemplo Label n� 1
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo cambiar el cursor cuando el
 * mouse pasa sobre un LABEL, y c�mo definir una acci�n
 * para que se ejecute al cliquear en el LABEL.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main

   DEFINE WINDOW Form OBJ oWin ;
      AT 0,0 ;
      WIDTH 330 HEIGHT 200 ;
      TITLE "OOHG - Cambiar el cursor y definir una acci�n" ;
      MAIN

      @ 20,20 LABEL lbl OBJ oLbl ;
         VALUE "Cuando el mouse pase sobre mi se ver� un cursor tipo mano." ;
         WIDTH 200 ;
         HEIGHT 50 ;
         TOOLTIP "Cliqu�ame para disparar una acci�n !!!" ;
         ACTION {|| AutoMsgBox( "Acci�n ejecutada !!!" ) }

      /*
       * Los valores aceptables son:
       * a) cursores est�ndar, use las constantes definidas en i_controlmisc.ch
       * b) cursores desde el archivo de recursos, use el "nombre" asignado en el archivo RC
       * c) cursores desde el disco, use el "nombre del archivo"
       */
      oLbl:Cursor := IDC_HAND

      /*
       * La acci�n tambi�n puede especificarse usando:
       * oLbl:OnClick := {|| AutoMsgBox( "Acci�n ejecutada !!!" ) }
       * Form.lbl.OnClick := {|| AutoMsgBox("Acci�n ejecutada !!!")}
       *
       * Para ejecutar la acci�n desde el c�digo, utilice:
       * Form.lbl.OnClick()
       * Eval( Form.lbl.OnClick )
       * Eval( oLbl:OnClick )
       * Form.lbl.Action()
       * Eval( Form.lbl.Action )
       * Eval( oLbl:Action )
       */

      ON KEY ESCAPE ACTION Form.Release
   END WINDOW

   CENTER WINDOW Form
   ACTIVATE WINDOW Form

RETURN NIL

/*
 * EOF
 */
