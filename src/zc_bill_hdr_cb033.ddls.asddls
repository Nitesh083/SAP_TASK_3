@EndUserText.label: 'Bill Header Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true // Enables Phase 4 Metadata Extensions

define root view entity ZC_BILL_HDR_CB033
  provider contract transactional_query
  as projection on ZI_BILL_HDR_CB033
{
    key BillUuid,
    BillNumber,
    CustomerName,
    BillingDate,
    TotalAmount,
    Currency,
    PaymentStatus,
    
    /* Associations */
    _Items : redirected to composition child ZC_BILL_ITM_CB033
}
