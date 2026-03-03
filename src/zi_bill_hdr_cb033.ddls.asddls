

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bill Header Interface View'
define root view entity ZI_BILL_HDR_CB033
  as select from zbill_hdr_cb033
  composition [0..*] of ZI_BILL_ITM_CB033 as _Items
{
  key bill_uuid       as BillUuid,
  bill_number        as BillNumber,
  customer_name      as CustomerName,
  billing_date       as BillingDate,
  @Semantics.amount.currencyCode: 'Currency'
  total_amount       as TotalAmount,
  currency           as Currency,
  payment_status     as PaymentStatus,
  
  _Items // Make association public 
}
