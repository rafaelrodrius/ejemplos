/*
 * Ejemplo API de Windows n� 1
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo demuestra como obtener y mostrar la versi�n
 * de Windows.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"

FUNCTION Main

   SetOneArrayItemPerLine( .T. )

   AutoMsgBox( WindowsVersion() )

RETURN Nil

/*
 * EOF
 */
