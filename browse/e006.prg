/*
 * Ejemplo Browse n� 6
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Basado en un ejemplo de la distribuci�n de OOHG mantenida
 * por Ciro Vargas Clemow <cvc@oohg.org> y en informaci�n
 * compartida por Vicente Guerra <vic@guerra.com.mx>
 *
 * Este ejemplo explica c�mo mostrar el �ltimo registro en
 * la �ltima fila del control y c�mo utilizar la propiedad
 * Anchor para mantener el control centrado en el �rea
 * cliente del formulario.
 *
 * Vis�tenos en https://github.com/oohg/ejemplos
 *
 */

#include "oohg.ch"
#include "dbstruct.ch"

REQUEST DBFCDX, DBFFPT

FUNCTION Main

   LOCAL oForm, Browse_1, cMode

   SET CENTURY ON
   SET DELETED ON
   SET BROWSESYNC ON

   DEFINE WINDOW Form_1 OBJ oForm ;
      AT 0,0 ;
      CLIENTAREA ;
      WIDTH 500 HEIGHT 380 ;
      MINWIDTH 500 MINHEIGHT 380 ;
      TITLE 'Browse: Posicionar Registro y Propiedad Anchor' ;
      MAIN;
      ON INIT AbrirTablas( Browse_1 ) ;
      ON RELEASE dbCloseAll()

      @ 10,10 BROWSE Browse_1 OBJ Browse_1 ;
         WIDTH oForm:ClientWidth - 20 ;
         HEIGHT oForm:ClientHeight - 20 ;
         HEADERS { 'C�digo', ;
                   'Nombre', ;
                   'Apellido', ;
                   'Nacido', ;
                   'Casado', ;
                   'Biograf�a' } ;
         WIDTHS { 150, 150, 150, 150, 150, 150 } ;
         WORKAREA Test ;
         FIELDS { 'Test->Code', ;
                  'Test->First', ;
                  'Test->Last', ;
                  'Test->Birth', ;
                  'Test->Married', ;
                  'Test->Bio' } ;
         FONT "Courier New" SIZE 10 ;
         JUSTIFY { BROWSE_JTFY_RIGHT, ;
                   BROWSE_JTFY_CENTER, ;
                   BROWSE_JTFY_CENTER, ;
                   BROWSE_JTFY_CENTER, ;
                   BROWSE_JTFY_CENTER, ;
                   BROWSE_JTFY_CENTER }

      cMode := ""
      Browse_1:Anchor := cMode

      /*
       * cMode est� formado por las palabras TOP, LEFT, BOTTOM y RIGHT.
       * El valor por defecto es "TOPLEFT".
       *
       * Indica el costado del formulario al cual quedar� anclado
       * el control. Esto significa que, cuando la ventana es
       * redimensionada, la distancia entre el control y el borde del
       * formulario se mantiene incambiada.
       *
       * cMode := "RIGHT" fuerza al control a mantener constante su
       * distancia con el borde derecho.
       *
       * cMode := "LEFTRIGHT" fuerza al control a mantener constante
       * su distancia con los lados derecho e izquierdo, por lo que
       * cambiar� su tama�o y se mantendr� centrado entre esos bordes.
       *
       * Si no se especifica una orientaci�n (no se inclue TOP ni BOTTOM,
       * o no se incluye LEFT ni RIGHT), el control no queda anclado y se
       * mantiene centrado entre los correspondientes bordes.
       *
       * Si no se especifica nada, el control no queda anclado y se
       * mantiene en el centro del formulario.
       */

      ON KEY ESCAPE ACTION oForm:Release()
   END WINDOW

   oForm:Center()
   oForm:Activate()

RETURN NIL

//--------------------------------------------------------------------------//
FUNCTION AbrirTablas( oBrw )

   LOCAL i

   DBCREATE( "Test", ;
             { { "Code",    "Numeric",   10, 0 }, ;
               { "First",   "Character", 25, 0 }, ;
               { "Last",    "Character", 25, 0 }, ;
               { "Married", "Logical",    1, 0 }, ;
               { "Birth",   "Date",       8, 0 }, ;
               { "Bio",     "Memo",      10, 0 } }, ;
             "DBFCDX" )

   USE test VIA "DBFCDX"
   ZAP

   FOR i := 1 TO 100
      APPEND BLANK
      REPLACE Code    WITH i * 10000
      REPLACE First   WITH 'Nombre '+ STR( i )
      REPLACE Last    WITH 'Apellido '+ STR( i )
      REPLACE Married WITH .T.
      REPLACE Birth   WITH DATE() + i - 10000
   NEXT i

   INDEX ON code TO code

   GO BOTTOM

   /*
    * Obliga a que el browse muestre el �ltimo registro en la �ltima fila.
    * Por defecto el �ltimo registro es mostrado en la fila media del browse.
    *
    * El primer par�metro de esta funci�n indica cual ser� el registro
    * seleccionado. El segundo indica la fila en que dicho registro debe
    * ser mostrado.
    */

	oBrw:SetValue( RECNO(), oBrw:CountPerPage )

RETURN Nil

/*
 * EOF
 */
