/*
 * Ejemplo ActiveX n� 1
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo desplegar un mapa utilizando un
 * control ACTIVEX para cargar la API de Google.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 *
 * Los archivos gmap1.html y gmap2.html pueden descargarse desde:
 * https://github.com/oohg/ejemplos/tree/master/ActiveX
 */


#include "oohg.ch"


#ifndef __XHARBOUR__

#xtranslate CurDrive() + ':\' + CurDir() + '\' + 'temp.html' ;
      => ;
      hb_cwd() + 'temp.html'

#endif


/*--------------------------------------------------------------------------------------------------------------------------------*/
FUNCTION Main()

   LOCAL oForm, oActiveX, oLat, oLng, oAddr, oCity, oCntr

   DEFINE WINDOW Form OBJ oForm ;
      AT 0, 0 ;
      WIDTH 650 ;
      HEIGHT 608 ;
      TITLE "Mostrar un Mapa de Google" ;
      MAIN ;
      NOMAXIMIZE ;
      NOSIZE ;
      ON INIT ShowLocationByCoords( oActiveX, oLat:Value, oLng:Value ) ;
      ON RELEASE FErase( CurDrive() + ':\' + CurDir() + '\' + 'temp.html' )

      @ 0, 0 ACTIVEX ActiveX OBJ oActiveX ;
         WIDTH 640 ;
         HEIGHT 458 ;
         PROGID "Shell.Explorer.2"

      @ 470, 10 LABEL lbl_Lat ;
         WIDTH 80 ;
         VALUE "Latitud:"

      @ 470, 90 TEXTBOX txt_Lat OBJ oLat ;
         WIDTH 100 ;
         INPUTMASK "9999.999999" ;
         NUMERIC ;
         VALUE -34.855202

      @ 470, 210 LABEL lbl_Lng ;
         WIDTH 80 ;
         VALUE "Longitud:"

      @ 470, 290 TEXTBOX txt_Lng OBJ oLng ;
         WIDTH 100 ;
         NUMERIC ;
         INPUTMASK "9999.999999" ;
         VALUE -56.194813

      @ 470, 480 BUTTON btn_SearchCoord ;
         WIDTH 150 ;
         ACTION ShowLocationByCoords( oActiveX, oLat:Value, oLng:Value ) ;
         CAPTION "Buscar por Coordenadas"

      @ 500, 10 LABEL lbl_Address ;
         WIDTH 120 ;
         VALUE "Calle y n�mero:"

      @ 500, 130 TEXTBOX txt_Address OBJ oAddr ;
         WIDTH 300

      @ 500, 480 BUTTON btn_SearchAddr ;
         WIDTH 150 ;
         ACTION ShowLocationByAddress( oActiveX, oAddr:Value, oCity:Value, oCntr:Value ) ;
         CAPTION "Buscar por Direcci�n"

      @ 530, 10 LABEL lbl_City ;
         WIDTH 50 ;
         VALUE "Ciudad:"

      @ 530, 60 TEXTBOX txt_City OBJ oCity ;
         WIDTH 160

      @ 530, 240 LABEL lbl_Country ;
         WIDTH 70 ;
         VALUE "Pa�s:"

      @ 530, 310 TEXTBOX txt_Country OBJ oCntr ;
         WIDTH 120

      @ 530, 480 BUTTON btn_Exit ;
         WIDTH 150 ;
         ACTION oForm:Release() ;
         CAPTION "Salir"

      ON KEY ESCAPE ACTION oForm:Release()
   END WINDOW

   oForm:Center()
   oForm:Activate()

RETURN NIL


/*--------------------------------------------------------------------------------------------------------------------------------*/
FUNCTION ShowLocationByCoords( oActiveX, nLat, nLng )
   LOCAL cHtml := MemoRead( "gmap2.html" )

   cHtml := StrTran( cHtml, "<<LAT>>", LTrim( Str( nLat ) ) )
   cHtml := StrTran( cHtml, "<<LNG>>", LTrim( Str( nLng ) ) )

   MemoWrit( "temp.html", cHtml )

   oActiveX:Navigate( CurDrive() + ':\' + CurDir() + '\' + 'temp.html' )

   RETURN NIL


/*--------------------------------------------------------------------------------------------------------------------------------*/
FUNCTION ShowLocationByAddress( oActiveX, cAddress, cCity, cCountry )
   LOCAL cHtml := MemoRead( "gmap1.html" )

   cHtml = StrTran( cHtml, "<<STREET>>", AllTrim( cAddress ) )
   cHtml = StrTran( cHtml, "<<CITY>>", AllTrim( cCity ) )
   cHtml = StrTran( cHtml, "<<COUNTRY>>", AllTrim( cCountry ) )

   MemoWrit( "temp.html", cHtml )

   oActiveX:Navigate( CurDrive() + ':\' + CurDir() + '\' + 'temp.html' )

   RETURN NIL

/*
 * EOF
 */
