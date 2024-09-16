require("RogueBuild01_Camp_RebirthTipsWindowByName")
local RogueGameRebirthTipsWindow = {}
local uis, contentPane, revivalCards, maskTexture
local DisplayRevivalInfo = function(cardId)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_item_reward")
  local conf = TableData.GetConfig(cardId, "BaseCard")
  uis.Main.TipsRegion.NameTxt.text = T(20463)
  uis.Main.TipsRegion.WordTxt.text = T(20430, conf.name())
  if not maskTexture then
    maskTexture = ResourceManager.LoadTexture("Assets/Art/TextureSingle/UI/Camp_RecruitTipsHead.png")
  end
  local loader = uis.Main.TipsRegion.Head.Bg.PicLoader
  UIUtil.SetHeadByFaceId(conf.fashion_id, loader, HEAD_ICON_TYPE_ENUM.BANNER)
  loader:SetMaskTexture(maskTexture)
  local transition = uis.Main.TipsRegion.root:GetTransition("in")
  uis.Main.TipsRegion.HpProgressBar.value = 0
  local targetValue = 0
  local rogueCardInfo = RogueGameData.GetCardInfo(cardId)
  if rogueCardInfo then
    local map = rogueCardInfo.info.attributes
    local hp_key = CardAttribute.GetIdByName(ATTR_ENUM.hp)
    local max_hp_key = CardAttribute.GetIdByName(ATTR_ENUM.max_hp)
    targetValue = map[hp_key] / map[max_hp_key] * 100
  end
  transition:SetHook("sign", function()
    uis.Main.TipsRegion.HpProgressBar:TweenValue(targetValue, 1.2)
  end)
end

function RogueGameRebirthTipsWindow.ReInitData()
end

function RogueGameRebirthTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameRebirthTipsWindow.package, WinResConfig.RogueGameRebirthTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_Camp_RebirthTipsWindowUis(contentPane)
    revivalCards = bridgeObj.argTable[1]
    RogueGameRebirthTipsWindow.UpdateInfo()
    RogueGameRebirthTipsWindow.InitBtn()
  end)
end

function RogueGameRebirthTipsWindow.UpdateInfo()
  local cardId = table.remove(revivalCards, 1).cardId
  DisplayRevivalInfo(cardId)
end

function RogueGameRebirthTipsWindow.InitBtn()
  uis.Main.TipsRegion.CloseBtn.onClick:Set(function()
    local root = uis.Main.root
    if IsUITransPlaying(root, "in") or IsUITransPlaying(root, "out") then
      return
    end
    if #revivalCards > 0 then
      PlayUITrans(root, "out", function()
        local removed = table.remove(revivalCards, 1)
        DisplayRevivalInfo(removed.cardId)
        PlayUITrans(root, "in")
      end)
    else
      UIMgr:CloseWindow(WinResConfig.RogueGameRebirthTipsWindow.name)
    end
  end)
end

function RogueGameRebirthTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  RogueGameMgr.DisplayItemNotifyIfNecessary()
  if maskTexture then
    ResourceManager.UnloadTexture(maskTexture)
  end
  maskTexture = nil
end

return RogueGameRebirthTipsWindow
