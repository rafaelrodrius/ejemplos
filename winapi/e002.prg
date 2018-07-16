/*
 * Ejemplo API de Windows n� 2
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo demuestra como mostrar nombres de archivos o
 * carpetas muy largos en forma compacta sustituyendo algunos
 * caracters por puntos suspensivos.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main

   AutoMsgBox( _GetCompactPath( "C:\OOHG_Samples\English\Samples\ClientAdjust\GetCompactPath", 32 ) )

RETURN Nil

/*
 * EOF
 */
