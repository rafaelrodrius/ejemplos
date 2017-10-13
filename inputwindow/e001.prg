/*
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licencido bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Basado en una contribuci�n original de
 * Antonio V�zquez <avazquezc@telefonica.net>
 *
 * Este ejemplo muestra c�mo capturar datos utilizando
 * la funci�n InputWindow.
 *
 * Vis�tenos en https://github.com/fyurisich/OOHG_Samples o en
 * http://oohg.wikia.com/wiki/Object_Oriented_Harbour_GUI_Wiki
 */

#include "oohg.ch"

FUNCTION Main()

   SET LANGUAGE TO SPANISH

   DEFINE WINDOW Frm1 ;
      AT 0, 0 ;
      WIDTH 300 HEIGHT 300 ;
      MAIN ;
      TITLE "Funci�n InputWindow"

      @  20, 20 LABEL lbl_0 VALUE "Concepto:"
      @  50, 20 LABEL lbl_1 VALUE "Motivo:"
      @  83, 20 LABEL lbl_2 VALUE "Fecha:"
      @ 113, 20 LABEL lbl_3 VALUE "Importe:"
      @ 143, 20 LABEL lbl_4 VALUE "Contabilizar:"
      @ 173, 20 LABEL lbl_5 VALUE "Tipo:"

      @  20, 120 LABEL lbl_Concepto ;
         VALUE "ENTREGA A CUENTA" ;
         AUTOSIZE
      @  50, 120 LABEL lbl_Motivo ;
         VALUE "PAGO FACTURA N� 1122" ;
         AUTOSIZE
      @  80, 120 DATEPICKER dtp_Fecha ;
         WIDTH 110 ;
         DISABLED ;
         NOTABSTOP
      @ 110, 120 TEXTBOX txt_Importe ;
         VALUE 1234 ;
         HEIGHT 24 ;
         WIDTH 110 ;
         NUMERIC ;
         INPUTMASK "@E 999,999.99" ;
         READONLY ;
         NOTABSTOP
      @ 140, 120 CHECKBOX chk_Contabil ;
         CAPTION "" ;
         WIDTH 110 ;
         HEIGHT 24 ;
         VALUE .F. ;
         DISABLED ;
         NOTABSTOP
      @ 170, 120 COMBOBOX cmb_Tipo ;
         ITEMS { "Cobro", "Pago" } ;
         WIDTH 110 ;
         HEIGHT 60 ;
         VALUE 1 ;
         DISABLED ;
         NOTABSTOP

      @ 220, 90 BUTTON btn_Capturar ;
         CAPTION "Capturar" ;
         ACTION Capturar() ;
         WIDTH 120 ;
         HEIGHT 28

      ON KEY ESCAPE ACTION Frm1.Release
   END WINDOW

   CENTER WINDOW Frm1
   ACTIVATE WINDOW Frm1

RETURN NIL

FUNCTION Capturar()

/*
 * Par�metros de la funci�n InputWindow:
 *
 * ( cTitulo, ;
 *   aEtiquetas, ;
 *   aValoresIniciales, ;
 *   aFormatos, ;
 *   nFila, ;
 *   nColumna, ;
 *   aTextoBotones, ;
 *   nAnchoEtiqueta, ;
 *   nAnchoControl, ;
 *   nAnchoBoton  )
 *
 * cTitulo
 *    String.
 *    T�tulo de la ventana.
 * aEtiquetas
 *    Array de strings.
 *    Etiquetas a mostrar. La cantidad de �tems determina la cantidad de
 *    campos a capturar.
 * aValoresIniciales
 *    Array.
 *    Valores iniciales de los campos a capturar.
 *    El tipo de cada �tem determina el tipo de control a utilizar para la
 *    captura. Los tipos v�lidos son logical, date, numeric, string y memo.
 *    Los controles a utilizar son checkbox, datepicker, combobox o editbox
 *    (ver siguiente par�metro), textbox o editbox (ver siguiente par�metro)
 *    y editbox.
 * aFormatos
 *    Array.
 *    Datos adicionales para la captura. Dependen del tipo de datos a capturar.
 *    Logical y memo: NIL.
 *    Date: "SHOWNONE" para permitir fechas en blanco, NIL en otro caso.
 *    Numeric: array o string. Si es un array se utilizar� un control combobox
 *       y el contenido del array ser� utilizado como items del combobox.
 *       Si es un string (o memo) se utilizar� un control textbox num�rico.
 *       Si el string contiene un punto decimal, su contenido se usar� como
 *       m�scara; si no lo contiene, el largo del string se usar� para indicar
 *       la cantidad m�xima de caracteres del textbox.
 *    String: numeric. Si el valor del item es menor o igual a 32 se usar�
 *       un control textbox y si es mayor se usar� un control editbox.
 *       El valor se utilizar� para indicar la cantidad m�xima de caracteres
 *       del control.
 * nFila y nColumna
 *   Num�ricos
 *   Posici�n de la ventana.
 *   Si no son num�ricos la ventana se centrar� en la pantalla.
 * aTextoBotones
 *   Array con 2 �tems de tipo string
 *   Texto de los botones en la ventana de captura.
 *   Por defecto se utilizar� {'Ok','Cancel'} si el lenguaje
 *   es Ingl�s o {'Aceptar','Cancelar'} si el lenguaje es Espa�ol.
 * nAnchoEtiqueta
 *   Num�rico
 *   Ancho de las etiquetas. Por defecto se utilizar� 110.
 * nAnchoControl
 *   Num�rico
 *   Ancho de los controles. Por defecto se utilizar� 140.
 * nAnchoBoton
 *   Num�rico
 *   Ancho de los botons. Por defecto se utilizar� 100.
 */

   cTitle      := "Introduzca Datos"
   aLabels     := { "Concepto:", ;
                    "Motivo:", ;
                    "Fecha:", ;
                    "Importe:", ;
                    "Contabilizar:", ;
                    "Tipo:" }
   aInitValues := { Frm1.lbl_Concepto.Value, ;
                    Frm1.lbl_Motivo.Value, ;
                    Frm1.dtp_Fecha.Value, ;
                    Frm1.txt_Importe.Value, ;
                    Frm1.chk_Contabil.Value, ;
                    Frm1.cmb_Tipo.Value }
   aFormats    := { 40, ;
                    20, ;
                    NIL, ;
                    "@E 999,999.99", ;
                    NIL, ;
                    {"Cobro", "Pago"} }

   aResults    := InputWindow( cTitle, aLabels, aInitValues, aFormats )

   Frm1.lbl_Concepto.Value := aResults[1]
   Frm1.lbl_Motivo.Value   := aResults[2]
   Frm1.dtp_Fecha.Value    := aResults[3]
   Frm1.txt_Importe.Value  := aResults[4]
   Frm1.chk_Contabil.Value := aResults[5]
   Frm1.cmb_Tipo.Value     := aResults[6]

RETURN NIL

/*
 * EOF
 */
