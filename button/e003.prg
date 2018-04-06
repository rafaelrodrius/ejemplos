/*
 * Ejemplo Button n� 3
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo definir botones con im�genes.
 * Tambi�n sirve como un caso de prueba para la clase TButton.
 *
 * Los botones pueden mostrar im�genes ICO y BMP de cualquier
 * tama�o (se muestran en su tama�o actual).
 *
 * Transparencia:
 *
 * Im�genes ICO:
 * a. profundidad de color 24 bpp + canal alfa, o
 * b. para otras profundidades de color, el color negro
 *    ser� el transparente.
 *
 * Im�genes BMP:
 * a. la profuncidad de color no debe superar los 8 bpp, y
 * b. el color del pixel ubicado arriba a la izquierda
 *    ser� el transparente si tiene �ndice 0 en la paleta.
 *
 * Im�genes JPG/JPEG/GIF:
 * a. la que se haya definido.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 *
 * El archivo de recursos y las im�genes pueden descargarse desde:
 * https://github.com/oohg/ejemplos/tree/master/Button
 */

#include "oohg.ch"

FUNCTION Main()

   DEFINE WINDOW FormMain ;
      AT 0,0 ;
      WIDTH 258 ;
      HEIGHT 100 ;
      MAIN ;
      NOMINIMIZE ;
      NOMAXIMIZE ;
      TITLE "ooHG - Im�genes en Botones" ;

      @ 20, 20 BUTTON But_1 ;
         CAPTION "Con Texto" ;
         ACTION ShowForm1() ;
         WIDTH 100 ;
         HEIGHT 28

      @ 20, 130 BUTTON But_2 ;
         CAPTION "Sin Texto" ;
         ACTION ShowForm2() ;
         WIDTH 100 ;
         HEIGHT 28

      ON KEY ESCAPE ACTION FormMain.Release
   END WINDOW

   CENTER WINDOW FormMain
   ACTIVATE WINDOW FormMain

RETURN NIL

FUNCTION ShowForm1

   // Botones con imagen y texto

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 558 ;
      HEIGHT 450 ;
      NOMINIMIZE ;
      NOMAXIMIZE ;
      TITLE "ooHG - Im�genes en Botones" ;

      // Primera columna: ICOs desde archivo

      @  10, 10 BUTTON Bt_AccesoA04 CAPTION 'info2.ico' ;
         PICTURE 'info2.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @  60, 10 BUTTON Bt_AccesoA05 CAPTION 'otro.ico' ;
         PICTURE 'otro.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 110, 10 BUTTON Bt_AccesoA06 CAPTION 'globe.ico' ;
         PICTURE 'globe.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 160, 10 BUTTON Bt_AccesoA07 CAPTION 'ooHg.ico' ;
         PICTURE 'ooHg.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 210, 10 BUTTON Bt_AccesoA08 CAPTION 'led_on.ico' ;
         PICTURE 'led_on.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 260, 10 BUTTON Bt_AccesoA09 CAPTION 'led_on2.ico' ;
         PICTURE 'led_on2.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 310, 10 BUTTON Bt_AccesoA10 CAPTION 'intl_no.ico' ;
         PICTURE 'intl_no.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 360, 10 BUTTON Bt_AccesoA11 CAPTION 'info1.ico' ;
         PICTURE 'info1.ico' ;
         ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      // Segunda columna: otros formatos desde archivo

      @  10, 140 BUTTON Bt_AccesoB04 CAPTION 'info2.bmp' ;
         PICTURE 'info2.bmp' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @  60, 140 BUTTON Bt_AccesoB05 CAPTION 'ooHg.bmp' ;
         PICTURE 'ooHg.bmp' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 110, 140 BUTTON Bt_AccesoB06 CAPTION 'albaran.bmp' ;
         PICTURE 'albaran.bmp' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 160, 140 BUTTON Bt_AccesoB07 CAPTION 'ooHg.jpg' ;
         PICTURE 'ooHg.jpg' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 210, 140 BUTTON Bt_AccesoB08 CAPTION 'ooHg.jpeg' ;
         PICTURE 'ooHg.jpeg' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 260, 140 BUTTON Bt_AccesoB09 CAPTION 'ooHg.gif' ;
         PICTURE 'ooHg.gif' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 310, 140 BUTTON Bt_AccesoB10 CAPTION 'albaran.ico' ;
         PICTURE 'albaran.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 360, 140 BUTTON Bt_AccesoB11 CAPTION 'No Image' ;
         ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      // Tercera columna: ICOs desde archivo de recursos

      @  10, 270 BUTTON Bt_AccesoC04 CAPTION 'i_info2' ;
         PICTURE 'I_INFO2' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @  60, 270 BUTTON Bt_AccesoC05 CAPTION 'i_otro' ;
         PICTURE 'I_OTRO' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 110, 270 BUTTON Bt_AccesoC06 CAPTION 'i_globe' ;
         PICTURE 'I_GLOBE' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 160, 270 BUTTON Bt_AccesoC07 CAPTION 'i_ooHg' ;
         PICTURE 'I_OOHG' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 210, 270 BUTTON Bt_AccesoC08 CAPTION 'i_led1' ;
         PICTURE 'I_LED1' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 260, 270 BUTTON Bt_AccesoC09 CAPTION 'i_led2' ;
         PICTURE 'I_LED2' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 310, 270 BUTTON Bt_AccesoC10 CAPTION 'intl_no' ;
         PICTURE 'INTL_NO' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 360, 270 BUTTON Bt_AccesoC11 CAPTION 'i_info1' ;
         PICTURE 'I_INFO1' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      // Cuatra columna: otros formatos desde archivo de recursos

      @  10, 400 BUTTON Bt_AccesoD04 CAPTION 'b_info' ;
         PICTURE 'B_INFO' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @  60, 400 BUTTON Bt_AccesoD05 CAPTION 'b_ooHg' ;
         PICTURE 'B_OOHG' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 110, 400 BUTTON Bt_AccesoD06 CAPTION 'b_albar' ;
         PICTURE 'B_ALBAR' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 160, 400 BUTTON Bt_AccesoD07 CAPTION 'j_ooHg' ;
         PICTURE 'J_OOHG' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 210, 400 BUTTON Bt_AccesoD08 CAPTION 'p_ooHg' ;
         PICTURE 'P_OOHG' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 260, 400 BUTTON Bt_AccesoD09 CAPTION 'g_ooHg' ;
         PICTURE 'G_OOHG' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 310, 400 BUTTON Bt_AccesoD10 CAPTION 'i_albar' ;
         PICTURE 'I_ALBAR' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 360, 400 BUTTON Bt_AccesoD11 CAPTION 'Sin Imagen' ;
         ACTION MsgInfo('Ok') LEFT WIDTH 120 HEIGHT 40

      ON KEY ESCAPE ACTION Form_1.Release
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN NIL

FUNCTION ShowForm2

   // Botones con images sin texto

   DEFINE WINDOW Form_2 ;
      AT 0,0 ;
      WIDTH 558 ;
      HEIGHT 450 ;
      NOMINIMIZE ;
      NOMAXIMIZE ;
      TITLE "ooHG - Botones con Imagen sin Texto" ;

      // Primera columna: ICOs desde archivo

      @  10, 10 BUTTON Bt_AccesoA04 ;
         PICTURE 'info2.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @  60, 10 BUTTON Bt_AccesoA05 ;
         PICTURE 'otro.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 110, 10 BUTTON Bt_AccesoA06 ;
         PICTURE 'globe.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 160, 10 BUTTON Bt_AccesoA07 ;
         PICTURE 'ooHg.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 210, 10 BUTTON Bt_AccesoA08 ;
         PICTURE 'led_on.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 260, 10 BUTTON Bt_AccesoA09 ;
         PICTURE 'led_on2.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 310, 10 BUTTON Bt_AccesoA10 ;
         PICTURE 'intl_no.ico' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 360, 10 BUTTON Bt_AccesoA11 ;
         PICTURE 'info1.ico' ;
         ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      // Segunda columna: otros formatos desde archivo

      @  10, 140 BUTTON Bt_AccesoB04 ;
         PICTURE 'info2.bmp' ACTION MsgInfo('Ok') ;
         RIGHT WIDTH 120 HEIGHT 40

      @  60, 140 BUTTON Bt_AccesoB05 ;
         PICTURE 'ooHg.bmp' ACTION MsgInfo('Ok') ;
         RIGHT WIDTH 120 HEIGHT 40

      @ 110, 140 BUTTON Bt_AccesoB06 ;
         PICTURE 'albaran.bmp' ACTION MsgInfo('Ok') ;
         RIGHT WIDTH 120 HEIGHT 40

      @ 160, 140 BUTTON Bt_AccesoB07 ;
         PICTURE 'ooHg.jpg' ACTION MsgInfo('Ok') ;
         RIGHT WIDTH 120 HEIGHT 40

      @ 210, 140 BUTTON Bt_AccesoB08 ;
         PICTURE 'ooHg.jpeg' ACTION MsgInfo('Ok') ;
         RIGHT WIDTH 120 HEIGHT 40

      @ 260, 140 BUTTON Bt_AccesoB09 ;
         PICTURE 'ooHg.gif' ACTION MsgInfo('Ok') ;
         RIGHT WIDTH 120 HEIGHT 40

      @ 310, 140 BUTTON Bt_AccesoB10 ;
         PICTURE 'albaran.ico' ACTION MsgInfo('Ok') ;
         RIGHT WIDTH 120 HEIGHT 40

      @ 360, 140 BUTTON Bt_AccesoB11 ;
         ACTION MsgInfo('Ok') ;
         RIGHT WIDTH 120 HEIGHT 40

      // Tercera columna: ICOs desde archivo de recursos

      @  10, 270 BUTTON Bt_AccesoC04 ;
         PICTURE 'I_INFO2' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @  60, 270 BUTTON Bt_AccesoC05 ;
         PICTURE 'I_OTRO' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 110, 270 BUTTON Bt_AccesoC06 ;
         PICTURE 'I_GLOBE' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 160, 270 BUTTON Bt_AccesoC07 ;
         PICTURE 'I_OOHG' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 210, 270 BUTTON Bt_AccesoC08 ;
         PICTURE 'I_LED1' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 260, 270 BUTTON Bt_AccesoC09 ;
         PICTURE 'I_LED2' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 310, 270 BUTTON Bt_AccesoC10 ;
         PICTURE 'INTL_NO' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      @ 360, 270 BUTTON Bt_AccesoC11 ;
         PICTURE 'I_INFO1' ACTION MsgInfo('Ok') ;
         LEFT WIDTH 120 HEIGHT 40

      // Cuatra columna: otros formatos desde archivo de recursos

      @  10, 400 BUTTON Bt_AccesoD04 ;
         PICTURE 'B_INFO' ACTION MsgInfo('Ok') ;
         CENTER WIDTH 120 HEIGHT 40

      @  60, 400 BUTTON Bt_AccesoD05 ;
         PICTURE 'B_OOHG' ACTION MsgInfo('Ok') ;
         CENTER WIDTH 120 HEIGHT 40

      @ 110, 400 BUTTON Bt_AccesoD06 ;
         PICTURE 'B_ALBAR' ACTION MsgInfo('Ok') ;
         CENTER WIDTH 120 HEIGHT 40

      @ 160, 400 BUTTON Bt_AccesoD07 ;
         PICTURE 'J_OOHG' ACTION MsgInfo('Ok') ;
         CENTER WIDTH 120 HEIGHT 40

      @ 210, 400 BUTTON Bt_AccesoD08 ;
         PICTURE 'P_OOHG' ACTION MsgInfo('Ok') ;
         CENTER WIDTH 120 HEIGHT 40

      @ 260, 400 BUTTON Bt_AccesoD09 ;
         PICTURE 'G_OOHG' ACTION MsgInfo('Ok') ;
         CENTER WIDTH 120 HEIGHT 40

      @ 310, 400 BUTTON Bt_AccesoD10 ;
         PICTURE 'I_ALBAR' ACTION MsgInfo('Ok') ;
         CENTER WIDTH 120 HEIGHT 40

      @ 360, 400 BUTTON Bt_AccesoD11 ;
         ACTION MsgInfo('Ok') CENTER WIDTH 120 HEIGHT 40

      ON KEY ESCAPE ACTION Form_2.Release
   END WINDOW

   CENTER WINDOW Form_2
   ACTIVATE WINDOW Form_2

RETURN NIL

/*
 * EOF
 */
