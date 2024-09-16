require("RogueBuild01_Camp_RecoveryTipsWindowByName")
local RogueGameRecoveryTipsWindow = {}
local uis, contentPane, rewardId, recoverCards

function RogueGameRecoveryTipsWindow.ReInitData()
end

function RogueGameRecoveryTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameRecoveryTipsWindow.package, WinResConfig.RogueGameRecoveryTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_Camp_RecoveryTipsWindowUis(contentPane)
    rewardId = bridgeObj.argTable[1]
    recoverCards = bridgeObj.argTable[2]
    RogueGameRecoveryTipsWindow.UpdateInfo()
    RogueGameRecoveryTipsWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_item_reward")
  end)
end

function RogueGameRecoveryTipsWindow.UpdateInfo()
  local conf = TableData.GetConfig(rewardId, "BaseRogueNodeReward")
  local val = math.floor(tonumber(conf.parameter) / 100)
  uis.Main.TipsRegion.NameTxt.text = T(20428)
  uis.Main.TipsRegion.WordTxt.text = T(20429, val)
  local list = uis.Main.TipsRegion.HeadList
  
  function list.itemRenderer(i, gcmp)
    local info = recoverCards[i + 1]
    local cardId = info.cardId, info.cur, info.prev, info.max
    local loader = gcmp:GetChild("HeadBg"):GetChild("PicLoader")
    local cardConf = TableData.GetConfig(cardId, "BaseCard")
    local bar = gcmp:GetChild("HpProgressBar")
    bar.value = info.cur / info.max * 100
    UIUtil.SetHeadByFaceId(cardConf.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
  end
  
  local numItems = recoverCards and #recoverCards or 0
  list.numItems = numItems
  local transition = uis.Main.TipsRegion.root:GetTransition("in")
  transition:SetHook("sign", function()
    for i = 0, list.numChildren - 1 do
      local child = list:GetChildAt(i)
      local bar = child:GetChild("HpProgressBar")
      local itemIndex = list:ChildIndexToItemIndex(i) + 1
      local info = recoverCards[itemIndex]
      bar.value = info.prev / info.max * 100
      bar:TweenValue(info.cur / info.max * 100, 1.2)
    end
  end)
end

function RogueGameRecoveryTipsWindow.InitBtn()
  uis.Main.TipsRegion.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueGameRecoveryTipsWindow.name)
  end)
end

function RogueGameRecoveryTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  RogueGameMgr.DisplayItemNotifyIfNecessary()
end

return RogueGameRecoveryTipsWindow
