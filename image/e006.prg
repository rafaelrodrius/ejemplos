/*
 * Ejemplo Image n� 6
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * See <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo usar la cl�usula EXCLUDEAREA
 * de un control IMAGE para restringir el ON CLICK y el
 * TOOLTIP a un �rea espec�fica del control. Tambien muestra
 * c�mo definir din�micamente el �rea excluida utilizando
 * la DATA aExcludeArea.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 *
 * El archivo img1.bmp puede descargarse desde:
 * https://github.com/oohg/ejemplos/tree/master/Image
 */

#include 'oohg.ch'

FUNCTION Main
   LOCAL oImage1

   DEFINE WINDOW frm_Main OBJ oWin ;
      AT 0, 0 ;
      CLIENTAREA ;
      WIDTH 300 ;
      HEIGHT 160 ;
      TITLE 'Exclusi�n de �rea en un Control IMAGE' ;
      MAIN

      DEFINE IMAGE img_Image1
         OBJECT oImage1             // Esta variable debe declararse
         ROW 20
         COL 20
         WIDTH 120
         HEIGHT 120
         PICTURE "img1.bmp"
         TOOLTIP "Solo visible sobre el �rea verde."
         ONCLICK AutoMsgBox( "Click en el �rea verde !!!" )
         EXCLUDEAREA { { 30, 30, 90, 90 } }  // izquierda, arriba, derecha, abajo
      END IMAGE

      @ 20, 180 LABEL lbl_1 ;
         VALUE "Mueva el mouse sobre la imagen y haga click en diferentes lugares. Use F5 para cambiar el �rea excluida." ;
         WIDTH 90 ;
         HEIGHT 120 ;
         FONTCOLOR RED

      ON KEY ESCAPE ACTION oWin:Release()
      ON KEY F5 ACTION CambiarArea( oImage1 )
	END WINDOW

   oWin:Center()
   oWin:Activate()

RETURN NIL

FUNCTION CambiarArea( oImage1 )
   STATIC lCambiar := .T.
/*
   El pixel ubicado en (derecha, abajo) no es parte del �rea excluida.
   Las coordenadas deben ser relativas a oImage1.
*/
   IF lCambiar
      oImage1:aExcludeArea := { {  0,  0, 120,  30 }, ;
                                { 90, 30, 120, 120 }, ;
                                {  0, 30,  30, 120 }, ;
                                { 30, 90,  90, 120 } }
      oImage1:Tooltip := "Solo visible sobre el �rea roja."
      oImage1:bOnClick := { || AutoMsgBox( "Click en el �rea roja !!!" ) }
   ELSE
      oImage1:aExcludeArea := { { 30, 30, 90, 90 } }
      oImage1:Tooltip := "Solo visible sobre el �rea verde."
      oImage1:bOnClick := { || AutoMsgBox( "Click en el �rea verde !!!" ) }
   ENDIF

   lCambiar := ! lCambiar
RETURN NIL

/*
 * EOF
 */
