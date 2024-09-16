BagService = {}

function BagService.Init()
  Net.AddListener(Proto.MsgName.SaleItemRsp, BagService.DealSaleItemRsp)
  Net.AddListener(Proto.MsgName.UseItemRsp, BagService.DealUseItemRsp)
end

function BagService.SaleItemReq(itemUid, itemCount, rspCallBack)
  local msg = {}
  msg.itemUid = itemUid
  msg.count = itemCount
  Net.Send(Proto.MsgName.SaleItemReq, msg, rspCallBack)
end

function BagService.DealSaleItemRsp(msg)
  local item = msg.item
  FloatTipsUtil.AddPopupItem(item.itemId, item.count)
end

function BagService.UseItemReq(itemUid, itemCount, selectIndex, rspCallBack)
  local msg = {}
  msg.itemUid = itemUid
  msg.count = itemCount
  msg.params = tostring(selectIndex)
  Net.Send(Proto.MsgName.UseItemReq, msg, rspCallBack)
end

function BagService.DealUseItemRsp(msg)
end

BagService.Init()
