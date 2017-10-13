/*
 * Ejemplo Tree n� 6
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo agregar items en forma din�mica
 * a un control TREE con la cl�usula ITEMIDS. Para ello hace
 * uso de los m�todos AddItem, SelectionID y Value.
 *
 * Vis�tenos en https://github.com/fyurisich/OOHG_Samples o en
 * http://oohg.wikia.com/wiki/Object_Oriented_Harbour_GUI_Wiki
 */

#include "oohg.ch"

FUNCTION Main()

   LOCAL oForm, oTree, aIDs := {}

   DEFINE WINDOW Form_1 OBJ oForm ;
      AT 0,0 ;
      WIDTH 640 ;
      HEIGHT 410 ;
      TITLE 'TreeView con ITEMIDS' ;
      MAIN

      DEFINE TREE Tree_1 OBJ oTree ;
         AT 10,10 ;
         WIDTH 300 ;
         HEIGHT 202 ;
         SELBOLD ;
         ITEMIDS

         NODE 'Documentos' ID 'DOCS'
            NODE 'Impuestos' ID 'IMPUESTOS'
               NODE 'Luz' ID 'LUZ'
                  NODE '2011' ID 'LUZ_2011'
                  END NODE
                  NODE '2012' ID 'LUZ_2012'
                  END NODE
               END NODE
               NODE 'Gas' ID 'GAS'
                  NODE '2011' ID 'GAS_2011'
                  END NODE
                  NODE '2012' ID 'GAS_2012'
                  END NODE
               END NODE
               NODE 'Tel�fono' ID 'TEL'
                  NODE '2013' ID 'TEL_2013'
                  END NODE
               END NODE
               NODE 'Tv' ID 'TV'
               END NODE
            END NODE
         END NODE
      END TREE

/*
 * El �ltimo par�metro en .T. asignar� un ID usando AUTOID.
 * Este ID es devuelto por el m�todo AddItem.
 */
      @ 250,10 BUTTON Button_1 ;
         CAPTION 'Agregar En Gas/2011' ;
         WIDTH 160 ;
         ACTION oTree:Value := ;
                   oTree:AddItem( 'Factura 123', 'GAS_2011', NIL, NIL, ;
                                  NIL, NIL, NIL, NIL, NIL, .T. )

/*
 * Agrega un �tem con un ID dado, bajo el nodo seleccionado.
 */
      @ 250,180 BUTTON Button_2 ;
         CAPTION 'Agregar En Seleccionado' ;
         WIDTH 160 ;
         ACTION oTree:Value := oTree:AddItem( 'Factura 555', ;
                                              oTree:SelectionID(), ;
                                              'FAC_555' )

      ON KEY ESCAPE OF (oForm) ACTION oForm:Release()
   END WINDOW

   ACTIVATE WINDOW Form_1

RETURN NIL

/*
 * EOF
 */
