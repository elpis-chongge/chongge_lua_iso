require("RogueBuild01_Camp_RecruitTipsWindowByName")
local RogueGameRecruitTipsWindow = {}
local uis, contentPane, maskTexture, recruitCards
local DisplayRecruitTips = function(cardId)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_item_reward")
  local conf = TableData.GetConfig(cardId, "BaseCard")
  local recruitTipsText = T(20423, conf.name())
  uis.Main.TipsRegion.NameTxt.text = T(20462)
  uis.Main.TipsRegion.WordTxt.text = recruitTipsText
  if not maskTexture then
    maskTexture = ResourceManager.LoadTexture("Assets/Art/TextureSingle/UI/Camp_RecruitTipsHead.png")
  end
  local loader = uis.Main.TipsRegion.Head.Bg.PicLoader
  UIUtil.SetHeadByFaceId(conf.fashion_id, loader, HEAD_ICON_TYPE_ENUM.BANNER)
  loader:SetMaskTexture(maskTexture)
end

function RogueGameRecruitTipsWindow.ReInitData()
end

function RogueGameRecruitTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameRecruitTipsWindow.package, WinResConfig.RogueGameRecruitTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_Camp_RecruitTipsWindowUis(contentPane)
    recruitCards = bridgeObj.argTable[1]
    RogueGameRecruitTipsWindow.UpdateInfo()
    RogueGameRecruitTipsWindow.InitBtn()
  end)
end

function RogueGameRecruitTipsWindow.UpdateInfo()
  local card = table.remove(recruitCards, 1)
  DisplayRecruitTips(card.cardId)
end

function RogueGameRecruitTipsWindow.InitBtn()
  uis.Main.TipsRegion.CloseBtn.onClick:Set(function()
    local root = uis.Main.root
    if IsUITransPlaying(root, "in") or IsUITransPlaying(root, "out") then
      return
    end
    if #recruitCards > 0 then
      PlayUITrans(root, "out", function()
        local card = table.remove(recruitCards, 1)
        DisplayRecruitTips(card.cardId)
        PlayUITrans(root, "in")
      end)
    else
      UIMgr:CloseWindow(WinResConfig.RogueGameRecruitTipsWindow.name)
    end
  end)
end

function RogueGameRecruitTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  RogueGameMgr.DisplayItemNotifyIfNecessary()
  if maskTexture then
    ResourceManager.UnloadTexture(maskTexture)
  end
  maskTexture = nil
end

return RogueGameRecruitTipsWindow
