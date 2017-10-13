/*
 * Ejemplo ProgressBar n� 1
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra c�mo definir un control ProgressBar
 * con estila Marquee (el control muestra una barra animada
 * que nunca se detiene), y c�mo cambiar el estilo desde el
 * programa.
 *
 * Vis�tenos en https://github.com/fyurisich/OOHG_Samples o en
 * http://oohg.wikia.com/wiki/Object_Oriented_Harbour_GUI_Wiki
 */

#include "oohg.ch"

FUNCTION Main

   LOCAL nPrevio := 10

   DEFINE WINDOW Form_1 ;
      AT 0,0 ;
      WIDTH 466 + GetBorderWidth() ;
      HEIGHT 200 + GetTitleHeight() + 2 * GetBorderHeight() ;
      TITLE "OOHG - Estilos Marquee y Normal en Controles ProgressBar" ;
      MAIN

      @ 20,20 PROGRESSBAR Progress_1 ;
         OBJ oProg1 ;
         WIDTH 420 ;
         HEIGHT 26 ;
         SMOOTH ;
         TOOLTIP 'Control ProgressBar Marquee. Cliquee el boton "Detener" para detener la animaci�n.' ;
         MARQUEE 90
      /*
       * 90 es el tiempo, en milisegundos, con que se actualiza la animaci�n.
       * Cuanto m�s alto sea el n�mero, m�s despacio se mueve.
       * Si este par�metro es cero o negativo, la animaci�n se detiene.
       */

      @ 80,20 PROGRESSBAR Progress_2 ;
         OBJ oProg2 ;
         RANGE 0, 100 ;
         WIDTH 420 ;
         HEIGHT 26 ;
         SMOOTH ;
         VALUE 30 ;
         TOOLTIP 'Control ProgressBar Normal. Cliquee el boton "Cambiar Estilo" para cambiar a Marquee.'

      @ 140,20 BUTTON Button_1 ;
         OBJ oBut1 ;
         CAPTION "Cambiar Estilo" ;
         WIDTH 100 ;
         HEIGHT 28 ;
         ACTION nPrevio := CambiarEstilo( oProg2, nPrevio, oBut1 ) ;
         TOOLTIP 'Cliquee para convertir el segundo ProgressBar a Marquee e iniciar la animaci�n.'

      @ 140,340 BUTTON Button_2 ;
         OBJ oBut2 ;
         CAPTION "Detener" ;
         WIDTH 100 ;
         HEIGHT 28 ;
         ACTION AlternarMarquee( oProg1, oBut2 ) ;
         TOOLTIP 'Cliquee para detener el primer control.'

      ON KEY ESCAPE ACTION Form_1.Release
   END WINDOW

   CENTER WINDOW Form_1

   ACTIVATE WINDOW Form_1

RETURN NIL

FUNCTION CambiarEstilo( oProg, nValue, oBut )

   IF oProg:IsStyleNormal()
      nValue := oProg:Value

      oProg:SetStyleMarquee( 20 )
      oBut:ToolTip := 'Cliquee para convertir el segundo ProgressBar a estilo Normal.'
      oProg:ToolTip := 'Control ProgressBar Marquee. Cliquee el boton "Cambiar Estilo" para cambiar a Normal.'
   ELSE
      oProg:SetStyleNormal( nValue )
      oBut:ToolTip := 'Cliquee para convertir el segundo ProgressBar a estilo Marquee e iniciar la animaci�n.'
      oProg:ToolTip := 'Control ProgressBar Normal. Cliquee el boton "Cambiar Estilo" para cambiar a Marquee.'
   ENDIF

   /*
    * SetStyleNormal() configura el control en estilo Normal.
    * Si el par�metro se omite o no es num�rico o es negativo,
    * se asume cero. Este par�metro setea el VALUE del control.
    *
    * SetStyleMarquee() configura el control en estilo Marquee.
    * Si el par�metro se omite o no es num�rico o es negativo,
    * el estilo se cambia pero lo animaci�n no se inicia.
    * Este par�metro indica el tiempo, en milisegundos, con que
    * se actualiza la animaci�n. Cuanto m�s alto sea el n�mero,
    * m�s despacio se mueve.
    *
    * Al configurar el estilo normal no se restaura el VALUE
    * del control al valor anterior al cambio de estilo.
    * Ud. debe guardar el VALUE antes de cambiar el estilo si
    * desea restaurarlo m�s tarde.
    */

RETURN nValue

FUNCTION AlternarMarquee( oProg, oBut )

   IF oProg:IsStyleMarquee()
      IF oProg:IsMarqueeRunning()
         oProg:StopMarquee()
         oBut:Caption := "Iniciar"
         oBut:ToolTip := 'Cliquee para animar el primer control.'
         oProg:ToolTip := 'Control ProgressBar Marquee. Cliquee el boton "Iniciar" para comenzar la animaci�n.'
      ELSE
         oProg:StartMarquee()
         oBut:Caption := "Detener"
         oBut:ToolTip := 'Cliquee para detener la animaci�n del primer control.'
         oProg:ToolTip := 'Control ProgressBar Marquee. Cliquee el boton "Detener" para detener la animaci�n.'
      ENDIF
   ENDIF

   /*
    * StartMarquee() utiliza el tiempo definido en el control.
    * Si este valor es negativo o cero, se asume 30.
    *
    * En estilo Marquee, el VALUE del control es siempre 1, por lo
    * tanto no es posible reiniciar la animaci�n desde el punto en
    * que se detuvo. Siempre se inicia desde el principio.
    */

RETURN NIL

/*
 * EOF
 */
