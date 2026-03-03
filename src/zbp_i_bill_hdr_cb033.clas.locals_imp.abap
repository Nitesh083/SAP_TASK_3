CLASS lhc_BillHeader DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PUBLIC SECTION.
    " --- THE BUFFER (Now Public so the Saver class can access it) ---
    TYPES: tt_bill_header TYPE TABLE OF zbill_hdr_cb033.
    CLASS-DATA: mt_buffer TYPE tt_bill_header.

  PRIVATE SECTION.
    " --- The generated methods stay private ---
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR BillHeader RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE BillHeader.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE BillHeader.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE BillHeader.

    METHODS read FOR READ
      IMPORTING keys FOR READ BillHeader RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK BillHeader.

    METHODS rba_Items FOR READ
      IMPORTING keys_rba FOR READ BillHeader\_Items FULL result_requested RESULT result LINK association_links.

    METHODS cba_Items FOR MODIFY
      IMPORTING entities_cba FOR CREATE BillHeader\_Items.

ENDCLASS.

CLASS lhc_BillHeader IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<entity>).
      DATA(ls_new_bill) = VALUE zbill_hdr_cb033(
        bill_uuid      = cl_system_uuid=>create_uuid_x16_static( )
        bill_number    = <entity>-BillNumber
        customer_name  = <entity>-CustomerName
        billing_date   = <entity>-BillingDate
        total_amount   = <entity>-TotalAmount
        currency       = <entity>-Currency
        payment_status = 'Draft'
      ).

      APPEND ls_new_bill TO mt_buffer.

      APPEND VALUE #( %cid = <entity>-%cid BillUuid = ls_new_bill-bill_uuid )
             TO mapped-billheader.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Items.
  ENDMETHOD.

  METHOD cba_Items.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_BillItem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE BillItem.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE BillItem.

    METHODS read FOR READ
      IMPORTING keys FOR READ BillItem RESULT result.

    METHODS rba_Header FOR READ
      IMPORTING keys_rba FOR READ BillItem\_Header FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_BillItem IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Header.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_BILL_HDR_CB033 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.
    METHODS check_before_save REDEFINITION.
    METHODS save REDEFINITION.
    METHODS cleanup REDEFINITION.
    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_BILL_HDR_CB033 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    IF lhc_BillHeader=>mt_buffer IS NOT INITIAL.
      INSERT zbill_hdr_cb033 FROM TABLE @lhc_BillHeader=>mt_buffer.
    ENDIF.
  ENDMETHOD.

  METHOD cleanup.
    CLEAR lhc_BillHeader=>mt_buffer.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
