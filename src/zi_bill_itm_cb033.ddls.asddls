
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bill Item Interface View'
define view entity ZI_BILL_ITM_CB033
  as select from zbill_itm_cb033
  association to parent ZI_BILL_HDR_CB033 as _Header on $projection.BillUuid = _Header.BillUuid
{
  key item_uuid      as ItemUuid,
  bill_uuid          as BillUuid,
  item_position      as ItemPosition,
  product_id         as ProductId,
  @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
  quantity           as Quantity,
  unit_of_measure    as UnitOfMeasure,
  @Semantics.amount.currencyCode: 'Currency'
  unit_price         as UnitPrice,
  @Semantics.amount.currencyCode: 'Currency'
  subtotal           as Subtotal,
  currency           as Currency,
  
  _Header // Association back to parent [cite: 78, 79]
}
