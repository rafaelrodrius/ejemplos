/*
 * Ejemplo Image n� 7
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo pintar una imagen sobre otra y
 * c�mo simular una imagen m�vil, utilizando los m�todos Copy
 * y Blend. Dese por avisado que bajo XP el flicker es horrible.
 * Vea en el Changelog la nota relacionada.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main
   PUBLIC oImage, oSprite, wB, hB, wS, hS, hImage

   DEFINE WINDOW frm_Main ;
      AT 0, 0 ;
      MAIN ;
      TITLE "Imagen M�vil" ;
      CLIENTAREA ;
      WIDTH 600 ;
      HEIGHT 400 ;
      ON INIT ( wS := _OOHG_BitMapWidth( oSprite:HBitMap ), ;
                hS := _OOHG_BitMapHeight( oSprite:HBitMap ), ;
                wB := _OOHG_BitMapWidth( oImage:HBitMap ), ;
                hB := _OOHG_BitMapHeight( oImage:HBitMap ), ;
                hImage := oImage:Copy() )

      @ 20, 20 IMAGE img_Back ;
         OBJ oImage ;
         PICTURE "back.bmp" ;
         WIDTH 560 ;
         HEIGHT 360

      @ 20, 20 IMAGE img_Sprite ;
         OBJ oSprite ;
         PICTURE "oohg.bmp" ;
         WIDTH 60 ;
         HEIGHT 80 ;
         INVISIBLE

      DEFINE TIMER tmr_Mover ;
         INTERVAL 500 ;
         ACTION MoverImagen()

      ON KEY ESCAPE ACTION frm_Main.Release
   END WINDOW

   CENTER WINDOW frm_Main
   ACTIVATE WINDOW frm_Main

RETURN NIL

FUNCTION MoverImagen
   LOCAL hAux
   STATIC lX := .T., lY := .T., x := 0, y := 0

   hAux := oImage:hImage
   oImage:hImage := hImage
   hImage := oImage:Copy()
   oImage:Blend( oSprite:HBitMap, x, y )
   DeleteObject( hAux )

   IF lX
      IF x + wS + 10 > wB
        lX := ! lX
      ENDIF
   ELSE
      IF x - 10 < 0
        lX := ! lX
      ENDIF
   ENDIF

   IF lX
      x += 10
   ELSE
      x -= 10
   ENDIF

   IF lY
      IF y + hS + 15 > hB
        lY := ! lY
      ENDIF
   ELSE
      IF y - 15 < 0
        lY := ! lY
      ENDIF
   ENDIF

   IF lY
      y += 15
   ELSE
      y -= 15
   ENDIF

RETURN NIL

/*
 * EOF
 */
