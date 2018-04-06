/*
 * Ejemplo Execute n� 1
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplos muestra c�mo abrir un archivo con extensi�n
 * registrada utilizando la aplicaci�n asociada al mismo.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include 'oohg.ch'

FUNCTION Main()

   DEFINE WINDOW MainForm ;
      AT 114,218 ;
      WIDTH 534 ;
      HEIGHT 276 ;
      TITLE 'Como Abrir un Archivo de Tipo Registrado' ;
      MAIN

      @ 20,20 BUTTON btn_1 ;
         CAPTION 'Abrir' ;
         ACTION AbrirArchivo()

      ON KEY ESCAPE ACTION MainForm.Release
   END WINDOW

   MainForm.Center
   MainForm.Activate

RETURN NIL

FUNCTION AbrirArchivo

   HB_MemoWrit( 'prueba.txt', ;
                'Este es un archivo de prueba' + hb_OsNewLine() + ;
                'Se deber�a abrir con el Bloc de Notas o' + hb_OsNewLine() + ;
                'con la aplicaci�n registrada para ello.'+ hb_OsNewLine() )
   EXECUTE FILE 'CMD.EXE' PARAMETERS '/C prueba.txt' HIDE

RETURN NIL

/*
 * EOF
 */
