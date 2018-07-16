/*
 * Ejemplo Button n� 2
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Parcialmente adaptado a partir de un ejemplo de la
 * distribution de OOHG (ver samples\button_mix) mantenida
 * por Ciro Vargas Clemow <pcman2010@yahoo.com>
 *
 * Este ejemplo muestra c�mo definir botones con texto
 * y/o im�genes.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 *
 * La imagen Button6.bmp puede descargarse desde
 * https://github.com/oohg/ejemplos/tree/master/Button
 */

#include "oohg.ch"

FUNCTION Main()

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 320 ;
      HEIGHT 610 ;
      MAIN ;
      TITLE "ooHG - Botones varios" ;
      BACKCOLOR YELLOW

      @ 10,80 BUTTON btn_1 ;
         OBJ But1 ;
         CAPTION "Cliqu�ame" ;
         PICTURE "hbprint_print" ;
         ACTION if( But1:ImageMargin()[1] == 0, But1:ImageMargin( {-20, 0, 0, 0} ), But1:ImageMargin( {0, 10, 0, 0} ) ) ;
         LEFT ;
         WIDTH 140 ;
         HEIGHT 60 ;
         TOOLTIP "Haz click para cambiar los m�rgenes de la imagen." ;
         IMAGEMARGIN {0, 10, 0, 0}

      @ 80,80 BUTTON btn_2 ;
         CAPTION "A la derecha" ;
         PICTURE "hbprint_save" ;
         ACTION MsgInfo('btn_2') ;
         RIGHT ;
         WIDTH 140 ;
         HEIGHT 60 ;
         TOOLTIP "Bot�n con texto e imagen a la derecha." ;
         IMAGEMARGIN {0, 0, 0, 10}

      @ 150,80 BUTTON btn_3 ;
         CAPTION "Arriba" ;
         PICTURE "hbprint_print"  ;
         ACTION MsgInfo('btn_3') ;
         TOP ;
         WIDTH 140 ;
         HEIGHT 60 ;
         TOOLTIP "Bot�n con texto e imagen arriba." ;
         IMAGEMARGIN {10, 0, 0, 0}

      @ 220,80 BUTTON btn_4 ;
         CAPTION "Abajo" ;
         PICTURE "hbprint_save" ;
         ACTION MsgInfo('btn_4') ;
         BOTTOM ;
         WIDTH 140 ;
         HEIGHT 60 ;
         TOOLTIP "Bot�n con texto e imagen a debajo." ;
         IMAGEMARGIN {0, 0, 10, 0}

      @ 290,80 BUTTON btn_5 ;
         CAPTION "Bot�n solo Texto pero Multil�nea Realmente Largo"  ;
         MULTILINE ;
         ACTION MsgInfo('btn_5') ;
         WIDTH 140 ;
         HEIGHT 60 ;
         TOOLTIP "Bot�n solo texto (multil�nea)." ;
         IMAGEMARGIN {150, 150, 150, 150}

      @ 360,80 BUTTON btn_6 ;
         PICTURE "Button6.bmp" ;
         ACTION MsgInfo('btn_6') ;
         CENTER ;
         WIDTH 140 ;
         HEIGHT 60 ;
         TOOLTIP "Bot�n solo imagen (centrado), OOHGDRAW."

      @ 430,80 BUTTON btn_7 ;
         PICTURE "Button6.bmp"  ;
         ACTION MsgInfo('btn_7') ;
         CENTER ;
         WIDTH 140 ;
         HEIGHT 60 ;
         WINDRAW ;
         TOOLTIP "Bot�n solo imagen (centrado), WINDRAW."

      @ 500,80 BUTTON btn_8 ;
         CAPTION "Texto y             Bitmap" ;
         PICTURE  "hbprint_save"   ;
         ACTION MsgInfo('btn_8') ;
         CENTER ;
         WIDTH 140 ;
         HEIGHT 60 ;
         TOOLTIP "Bot�n con exto e imagen (centrada)."

      ON KEY ESCAPE ACTION Form_1.Release

   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN NIL

/*
 * EOF
 */
