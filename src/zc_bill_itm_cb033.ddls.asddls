@EndUserText.label: 'Bill Item Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_BILL_ITM_CB033
  as projection on ZI_BILL_ITM_CB033
{
    key ItemUuid,
    BillUuid,
    ItemPosition,
    ProductId,
    Quantity,
    UnitOfMeasure,
    UnitPrice,
    Subtotal,
    Currency,
    
    /* Associations */
    _Header : redirected to parent ZC_BILL_HDR_CB033
}
