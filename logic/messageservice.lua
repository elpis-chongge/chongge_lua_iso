MessageService = {}

function MessageService.Init()
  Net.AddListener(Proto.MsgName.ExchangeCardFragmentRsp, MessageService.ExchangeCardFragmentRsp)
end

function MessageService.ExchangeCardFragmentReq(id, count, targetId)
  local msg = {}
  msg.itemId = id
  msg.count = count
  msg.targetItemId = targetId
  Net.Send(Proto.MsgName.ExchangeCardFragmentReq, msg)
end

function MessageService.ExchangeCardFragmentRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.DebrisWindow.name, WindowMsgEnum.CardWindow.CHANGE_CARD, msg)
end

MessageService.Init()
