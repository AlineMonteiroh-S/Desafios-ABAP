*&---------------------------------------------------------------------*
*& Report Z_CALCULADORA_SIMPLES
*&---------------------------------------------------------------------*

REPORT Z_CALCULADORA_SIMPLES.

*---------------------------------------------------------------------*
* CONSTANTES
*---------------------------------------------------------------------*
CONSTANTS:
  lc_txt_result TYPE string VALUE 'O resultado da',
  lc_txt_eh     TYPE string VALUE 'é:',
  lc_msg_div0   TYPE string VALUE 'Divisão por zero não é permitida.'.

*---------------------------------------------------------------------*
* VARIÁVEIS
*---------------------------------------------------------------------*
DATA:
  lv_resultado TYPE p LENGTH 16 DECIMALS 2,
  lv_operacao  TYPE string.

*---------------------------------------------------------------------*
* TELA DE SELEÇÃO
*---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS:
    p_num1 TYPE p LENGTH 8 DECIMALS 2 OBLIGATORY,
    p_num2 TYPE p LENGTH 8 DECIMALS 2 OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS:
    p_soma RADIOBUTTON GROUP grp1 DEFAULT 'X',
    p_sub  RADIOBUTTON GROUP grp1,
    p_mult RADIOBUTTON GROUP grp1,
    p_div  RADIOBUTTON GROUP grp1.

SELECTION-SCREEN END OF BLOCK b2.

*---------------------------------------------------------------------*
* VALIDAÇÃO
*---------------------------------------------------------------------*
AT SELECTION-SCREEN.

IF p_div = 'X' AND p_num2 = 0.
  MESSAGE lc_msg_div0 TYPE 'E'.
ENDIF.

*---------------------------------------------------------------------*
* PROCESSAMENTO
*---------------------------------------------------------------------*
START-OF-SELECTION.

CASE 'X'.
WHEN p_soma.
  lv_resultado = p_num1 + p_num2.
  lv_operacao  = 'Soma'.

WHEN p_sub.
  lv_resultado = p_num1 - p_num2.
  lv_operacao  = 'Subtração'.

WHEN p_mult.
  lv_resultado = p_num1 * p_num2.
  lv_operacao  = 'Multiplicação'.

WHEN p_div.
  lv_resultado = p_num1 / p_num2.
  lv_operacao  = 'Divisão'.
ENDCASE.

*---------------------------------------------------------------------*
* SAÍDA
*---------------------------------------------------------------------*
END-OF-SELECTION.

IF lv_operacao = 'Divisão' OR lv_operacao = 'Multiplicação'.
  WRITE: lc_txt_result, lv_operacao, lc_txt_eh, lv_resultado LEFT-JUSTIFIED.
ELSE.
  WRITE: lc_txt_result, lv_operacao, lc_txt_eh, lv_resultado LEFT-JUSTIFIED.
ENDIF.
