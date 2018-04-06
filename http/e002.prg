/*
 * Ejemplo HTTP Sample n� 2
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo actualizar autom�ticamente una
 * aplicaci�n desde Internet. Para probarlo se necesita
 * "MyApp.prg".
 *
 * Este ejemplo fue probado con �xito usango una direcci�n
 * "http" para bajar el nuevo archivo. La prueba con una
 * direcci�n "https" no fue existosa. Por favor env�anos un
 * correo si tienes �xito.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 *
 * El archivo MyApp.prg puede descargarse desde:
 * https://github.com/oohg/ejemplos/tree/master/Http
 */

#include "oohg.ch"

FUNCTION Main
   LOCAL cActualizado

   IF HayUnaNuevaVersion()
      IF DescargarNuevaVersion()
         RENAME ( "MyApp.exe" ) TO ( "OldApp_" + DTOS(DATE()) + "_" + STRTRAN(TIME(), ":", "_") + ".exe" )
         IF ! FILE( "MyApp.exe" )
            hb_UnzipFile( "NewApp.zip" )
            IF FILE( "NewApp.exe" )
               RENAME ( "NewApp.exe" ) TO ( "MyApp.exe" )
            ENDIF
            IF FILE( "MyApp.exe" )
               cActualizado := "T"
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   IF File( "MyApp.exe")
      EXECUTE FILE "MyApp.exe" PARAMETERS cActualizado
   ELSE
      MsgStop( "Aplicaci�n no encontrada !!!" )
   ENDIF
RETURN NIL

FUNCTION HayUnaNuevaVersion
RETURN .T.

FUNCTION DescargarNuevaVersion
   LOCAL cUrl := "http://..."
   LOCAL oUrl
   LOCAL oHTTP

   oUrl := TUrl():New( cUrl )
   oHTTP := TIpClientHTTP():New( oUrl )
   IF ( lRetVal := oHTTP:Open() )
      oHTTP:ReadToFile( "NewApp.zip" )
      oHTTP:Close()
   ENDIF
RETURN lRetVal

/*
 * EOF
 */
