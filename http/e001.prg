/*
 * Ejemplo Http n� 1
 * Author: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo obtener el texto y los cabezales
 * de una cierta p�gina de un sitio web utilizando el protocolo
 * http. Este ejemplo est� disponible tambi�n en la carpeta
 * samples/http del CVS de OOHG.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"
#include "i_socket.ch"
#include "h_http.prg"

PROCEDURE Main

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 400 ;
      HEIGHT 200 ;
      TITLE 'Ejemplo de HTTP GET' ;
      MAIN

      DEFINE MAIN MENU
         POPUP 'Prueba con memvar'
            ITEM 'Obtener cabezales y texto'  ACTION PruebaHttpMem( 1 )
            ITEM 'Obtener solo los cabezales' ACTION PruebaHttpMem( 2 )
            ITEM 'Obtener solo el texto'      ACTION PruebaHttpMem( 3 )
         END POPUP
         POPUP 'Prueba con referencia'
            ITEM 'Obtener cabezales y texto'  ACTION PruebaHttpRef( 1 )
            ITEM 'Obtener solo los cabezales' ACTION PruebaHttpRef( 2 )
            ITEM 'Obtener solo el texto'      ACTION PruebaHttpRef( 3 )
         END POPUP
      END MENU

      ON KEY ESCAPE ACTION Form_1.Release()
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN

PROCEDURE PruebaHttpMem( nOpcion )
   LOCAL cRespuesta
   MEMVAR oConex

   // Crea una variable p�blica que contiene el objeto de la conexi�n

   OPEN CONNECTION oConex SERVER 'www.itlnet.net' PORT 80 HTTP

   IF oConex == Nil
       AUTOMSGBOX( "No hay conexi�n !!!" )
   ELSE
      DO CASE
      CASE nOpcion == 1
         GET URL '/programming/program/Reference/c53g01c/menu.html' TO cRespuesta CONNECTION oConex
      CASE nOpcion == 2
         GET URL '/programming/program/Reference/c53g01c/menu.html' TO cRespuesta CONNECTION oConex HEADERS
      OTHERWISE
         GET URL '/programming/program/Reference/c53g01c/menu.html' TO cRespuesta CONNECTION oConex NOHEADERS
      ENDCASE

      CLOSE CONNECTION oConex
      RELEASE oConex

      AUTOMSGBOX( cRespuesta )
   ENDIF

RETURN

PROCEDURE PruebaHttpRef( nOpcion )
   LOCAL cRespuesta, oConex

   // El objeto de la conexi�n es guardado en un variable preexistente.

   OPEN CONNECTION OBJ oConex SERVER 'harbour.github.io' PORT 80 HTTP

   IF oConex == Nil
       AUTOMSGBOX( "No hay conexi�n !!!" )
   ELSE
      DO CASE
      CASE nOpcion == 1
         GET URL '/index.html' TO cRespuesta CONNECTION oConex
      CASE nOpcion == 2
         GET URL '/index.html' TO cRespuesta CONNECTION oConex HEADERS
      OTHERWISE
         GET URL '/index.html' TO cRespuesta CONNECTION oConex NOHEADERS
      ENDCASE

      CLOSE CONNECTION oConex

      AUTOMSGBOX( cRespuesta )
   ENDIF

RETURN

/*
 * EOF
 */

Este es el contenido del archivo i_socket.ch

?#xcommand OPEN CONNECTION [<obj: OBJ>] <con> SERVER <server> PORT <port> HTTP ;
   => ;
   httpconnect( iif( <.obj.>, @<con>, <(con)>), <server>, <port> )


#xcommand CLOSE CONNECTION <con> ;
   => ;
   <con>:Close()

#xcommand GET URL <url> TO <response> CONNECTION <con> [ <data: NOHEADERS, HEADERS> ];
   => ;
   <response> := httpgeturl( <con>, <url>, iif( upper( #<data> ) == "HEADERS", .F., iif( upper( #<data> ) == "NOHEADERS", NIL, .T. ) ) )

Este es el contenido del archivo h_http.prg

*-----------------------------------------------------------------------------*
Function httpconnect( Connection, Server, Port )
*-----------------------------------------------------------------------------*
Local oUrl

   If ! Upper( Left( Server, 7 ) ) == "HTTP://"
      Server := "http://" + Server
   EndIf

   oUrl := tURL():New( Server + ":" + Ltrim( Str( Port ) ) )

   If HB_IsString( Connection )
      Public &Connection

      If Empty( oUrl )
         &Connection := Nil
      Else
         &Connection := TIpClientHttp():New( oUrl )

         If ! (&Connection):Open()
            &Connection := Nil
         EndIf
      EndIf
   Else
      If Empty( oUrl )
         Connection := Nil
      Else
         Connection := TIpClientHttp():New( oUrl )

         If ! Connection:Open()
            Connection := Nil
         EndIf
      EndIf
   EndIf

Return Nil

*-----------------------------------------------------------------------------*
Function httpgeturl( Connection, cPage, uRet )
*-----------------------------------------------------------------------------*
Local cUrl, cResponse, cHeader, i, cRet

   cUrl := "http://"
   If ! Empty( Connection:oUrl:cUserid )
      cUrl += Connection:oUrl:cUserid
      If ! Empty( Connection:oUrl:cPassword )
         cUrl += ":" + Connection:oUrl:cPassword
      EndIf
      cUrl += "@"
   EndIf
   If ! Empty( Connection:oUrl:cServer )
      cUrl += Connection:oUrl:cServer
      If Connection:oUrl:nPort > 0
         cUrl += ":" + hb_ntos( Connection:oUrl:nPort )
      EndIf
   EndIf
   cUrl += cPage

   If Connection:Open( cUrl )
      cResponse := Connection:Read()
      If ! hb_IsString( cResponse )
         cResponse := "<No se recibi� DATA>"
      EndIf

      If hb_IsLogical( uRet )
         cHeader := Connection:cReply
         If ! hb_IsString( cHeader )
            cHeader := "<No se recibi� HEADER>"
         EndIf
         cHeader += hb_OsNewLine()

         For i := 1 to Len( Connection:hHeaders )
            #ifdef __XHARBOUR__
               cHeader += hGetKeyAt( Connection:hHeaders, i ) + ": " + hGetValueAt( Connection:hHeaders, i ) + hb_OsNewLine()
            #else
               cHeader += hb_HKeyAt( Connection:hHeaders, i ) + ": " + hb_HValueAt( Connection:hHeaders, i ) + hb_OsNewLine()
            #endif
         Next
         cHeader += hb_OsNewLine()

         If uRet                       // retorna DATA y HEADERS
            cRet := cHeader + cResponse
         Else                          // retorna solo HEADERS
            cRet := cHeader
         EndIf
      Else                             // retorna solo DATA
         cRet := cResponse
      EndIf
   Else
      cRet := "<Error al abrir URL>"
   EndIf

Return cRet

/*
 * EOF
 */
