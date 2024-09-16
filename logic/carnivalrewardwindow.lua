require("InitialCarnival_RewardListWindowByName")
local CarnivalRewardWindow = {}
local uis, contentPane, carnivalData

function CarnivalRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CarnivalRewardWindow.package, WinResConfig.CarnivalRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetInitialCarnival_RewardListWindowUis(contentPane)
    CarnivalRewardWindow.Init()
    CarnivalRewardWindow.InitBtn()
  end)
end

function CarnivalRewardWindow.Init()
  local targetData = CarnivalData.GetCarnivalTargetData()
  local integralNum = ActorData.GetItemCount(COMMON_ITEM_ID.INTEGRAL)
  local list = uis.Main.RewardList1.RewardItemList
  local posInd = 0
  
  function list.itemRenderer(i, item)
    local data = targetData[i + 1]
    local arr = GetConfigItemList(data.reward, true)
    if arr[1] then
      UIUtil.ShowItemFrame(arr[1].id, item:GetChild("RewardItem"), arr[1].value, nil, function()
        UIUtil.CommonItemClickCallback(arr[1].id, arr[1].type)
      end)
    end
    local Integral = item:GetChild("GetIntegral")
    local unlockData = GetConfigItemList(data.unlock_points, true)
    UIUtil.SetText(Integral, unlockData[1].value, "NumberTxt")
    UIUtil.SetIconById(Integral:GetChild("PicLoader"), COMMON_ITEM_ID.INTEGRAL, true)
    if table.contain(CarnivalData.info.rewardTragets, data.id) then
      ChangeUIController(item, nil, 1)
      posInd = i + 2
    elseif unlockData[1] and integralNum >= unlockData[1].value then
      ChangeUIController(item, nil, 0)
    end
  end
  
  list.numItems = #targetData
  uis.Main.RewardList1.CurrentIntegral.NumberTxt.text = integralNum
  UIUtil.SetText(uis.Main.RewardList1.CurrentIntegral.root, T(698), "WordTxt")
  UIUtil.SetIconById(uis.Main.RewardList1.CurrentIntegral.root:GetChild("PicLoader"), COMMON_ITEM_ID.INTEGRAL, true)
  local max = #targetData - 1
  posInd = posInd < #targetData and posInd or max
  list:ScrollToView(posInd)
end

function CarnivalRewardWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.CarnivalRewardWindow.name)
  end)
end

function CarnivalRewardWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.CarnivalWindow.GET_GOODS then
    CarnivalRewardWindow.Init()
  end
end

function CarnivalRewardWindow.OnClose()
  uis = nil
  contentPane = nil
  carnivalData = nil
end

return CarnivalRewardWindow
