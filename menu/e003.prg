/*
 * Ejemplo Menu n� 3
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Basado en un ejemplo de la distribuci�n de OOHG creado
 * por Ciro Vargas C. <cvc@oohg.org>
 *
 * Este ejemplo muestra c�mo cambiar los colores del men�
 * de un formulario utilizando los m�todos SetMenuBarColor
 * y SetItemsColor.
 *
 * Vis�tenos en https://github.com/fyurisich/OOHG_Samples o en
 * http://oohg.wikia.com/wiki/Object_Oriented_Harbour_GUI_Wiki
 *
 * Las im�genes utilizadas en este ejemplo pueden descargarse desde:
 * https://github.com/fyurisich/OOHG_Samples/tree/master/Espa�ol/Ejemplos/Menu
 */

#include "oohg.ch"

FUNCTION Main

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 400 ;
      HEIGHT 200 ;
      TITLE 'Colores del Men�' ;
      MAIN

      DEFINE MAIN MENU OBJ oPrincipal
         ITEM 'Salir' ACTION MsgInfo( 'Salir' )
         POPUP 'Archivo' OBJ oArch
            POPUP 'Uno'
              ITEM 'Abrir' IMAGE 'Check.Bmp'
              ITEM 'Guardar' IMAGE 'Free.Bmp'
              ITEM 'Imprimir' IMAGE 'Info.Bmp'
              ITEM 'Guardar como ...'
            END POPUP
            POPUP 'M�s'
              ITEM 'Abrir' IMAGE 'Check.Bmp'
              ITEM 'Guardar' IMAGE 'Free.Bmp'
              ITEM 'Imprimir' IMAGE 'Info.Bmp'
              ITEM 'Guardar como ...'
            END POPUP
         END POPUP
         POPUP 'Probar'
            ITEM 'Item 1'
            ITEM 'Item 2'
            POPUP 'Item 3' OBJ oItem3
               ITEM 'Item 3.1'
               SEPARATOR
               ITEM 'Item 3.2'
               POPUP 'Item 3.3'
                  ITEM 'Item 3.3.1'
                  SEPARATOR
                  ITEM 'Item 3.3.2'
                  POPUP 'Item 3.3.3'
                     ITEM 'Item 3.3.3.1'
                     ITEM 'Item 3.3.3.2'
                     ITEM 'Item 3.3.3.3'
                     ITEM 'Item 3.3.3.4'
                     ITEM 'Item 3.3.3.5'
                     ITEM 'Item 3.3.3.6'
                  END POPUP
                  ITEM 'Item 3.3.4'
               END POPUP
            END POPUP
            ITEM 'Item 4'
         END POPUP
         POPUP 'Ayuda'
            ITEM 'Acerca de'
         END POPUP
      END MENU

      /* Esto no funciona en Win Vista o 7 cuando los temas est�n habilitados.
         Esto no funciona en Win 10 porque los temas est�n habilitados _siempre_.
         Para cambiar el color del menu principal se deben deshabilitar los temas
         para todo el form. Ver el men� contextual.
         Note que luego de deshabilitar los tema no se pueden volver a habilitar.
      */
      oPrincipal:SetMenuBarColor( RED, .F. )
      oArch:SetItemsColor( {170,213,255}, .T. )
      oItem3:SetItemsColor( {170,213,255}, .F. )
      /* Solo el men� que contiene los items:
         Item 3.1
         Item 3.2
         Item 3.3
         ser� coloreado en azul p�lido.
      */

      DEFINE CONTEXT MENU OBJ oContexto
         ITEM 'Item 1'
         ITEM 'Item 2'
         SEPARATOR
         ITEM 'Cambiar' ;
            ACTION CambiarColoresDelItem3( oItem3 )
         SEPARATOR
         ITEM 'Deshabilitar temas y cambiar el color a ROJO' ;
            ACTION ( oPrincipal:DisableVisualStyle(), oPrincipal:SetMenuBarColor( RED, .F. ) )
      END MENU

      oContexto:SetMenuBarColor( {170,213,255}, .T. )

      @ 20,10 LABEL lbl_1 ;
         VALUE 'Haga clic en la opci�n "Cambiar" del menu contextual' ;
         AUTOSIZE

      ON KEY ESCAPE ACTION Form_1.Release()
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN NIL

STATIC FUNCTION CambiarColoresDelItem3( oItem3 )

   STATIC lColorearSubmenues := .F.

   lColorearSubmenues := ! lColorearSubmenues

   IF lColorearSubmenues
      oItem3:SetItemsColor( YELLOW, .T. )
      /* El men� conteniendo los items:
         Item 3.1
         Item 3.2
         Item 3.3
         y todos sus submen�es ser�n coloreados en amarillo.
      */
   ELSE
      oItem3:SetItemsColor( WHITE, .T. )
      /* El men� conteniendo los items:
         Item 3.1
         Item 3.2
         Item 3.3
          todos sus submen�es ser�n coloreados en blanco.
      */
      oItem3:SetItemsColor( {170,213,255}, .F. )
      /* Solo el men� conteniendo los items:
         Item 3.1
         Item 3.2
         Item 3.3
         ser� coloreado en azul p�lido.
      */
   ENDIF

RETURN NIL

/*
 * EOF
 */
