EnergyService = {}

function EnergyService.Init()
  Net.AddListener(Proto.MsgName.GetEnergyRecoverInfoRsp, EnergyService.GetEnergyRecoverInfoRsp)
  Net.AddListener(Proto.MsgName.BuyCountResourceRsp, EnergyService.BuyCountResourceRsp)
  Net.AddListener(Proto.MsgName.ExchangeEnergyRsp, EnergyService.ExchangeEnergyRsp)
end

function EnergyService.GetEnergyRecoverInfoReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetEnergyRecoverInfoReq, msg)
end

function EnergyService.GetEnergyRecoverInfoRsp(msg)
  EnergyData.info = msg.info
  if UIMgr:IsWindowOpen(WinResConfig.EnergyWindow.name) then
    UIMgr:SendWindowMessage(WinResConfig.EnergyWindow.name, WindowMsgEnum.EnergyWindow.UPDATE_TIME)
    return
  end
  OpenWindow(WinResConfig.EnergyWindow.name)
end

function EnergyService.BuyCountResourceReq(count)
  local msg = {}
  msg.count = count
  msg.timesType = 1
  Net.Send(Proto.MsgName.BuyCountResourceReq, msg)
end

function EnergyService.BuyCountResourceRsp(msg)
  if msg.cntResources[1] then
    EnergyData.info.curBuyTimes = msg.cntResources[1]
  end
  UIMgr:SendWindowMessage(WinResConfig.EnergyWindow.name, WindowMsgEnum.EnergyWindow.BUY_ENERGY)
end

function EnergyService.ExchangeEnergyReq(items)
  local msg = {}
  msg.items = items
  Net.Send(Proto.MsgName.ExchangeEnergyReq, msg)
end

function EnergyService.ExchangeEnergyRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.EnergyWindow.name, WindowMsgEnum.EnergyWindow.USE_ENERGY)
end

EnergyService.Init()
