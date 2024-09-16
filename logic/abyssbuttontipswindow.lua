require("AbyssFunctionOpen_AbyssButtonTipsWindowByName")
local AbyssButtonTipsWindow = {}
local uis, contentPane, canOpaque

function AbyssButtonTipsWindow.ReInitData()
end

function AbyssButtonTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssButtonTipsWindow.package, WinResConfig.AbyssButtonTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyssFunctionOpen_AbyssButtonTipsWindowUis(contentPane)
    canOpaque = bridgeObj.argTable[1]
    AbyssButtonTipsWindow.UpdateInfo()
    AbyssButtonTipsWindow.InitBtn()
    UIMgr:ShowBlur(contentPane)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ABYSS_FUNCTION_OPEN)
  end)
end

function AbyssButtonTipsWindow.UpdateInfo()
  if canOpaque then
    uis.root.opaque = true
    uis.Main.root.opaque = true
  else
    local inAbyss = AbyssExploreMgr and AbyssExploreMgr.Exists()
    uis.root.opaque = not inAbyss
    uis.Main.root.opaque = not inAbyss
  end
  local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_functionactivated_icon.prefab")
  local holder = uis.Main.AbyssTipsBtn:GetChild("EffectHolder")
  UIUtil.SetObjectToUI(eff, holder)
  UIUtil.SetHolderCenter(holder)
  local featureId = {
    FEATURE_ENUM.FROST_DUNGEON,
    FEATURE_ENUM.TIDE_DUNGEON,
    FEATURE_ENUM.ADVENTURE_BOSS,
    FEATURE_ENUM.ADVENTURE_ROGUE
  }
  local showId
  for i = 1, #featureId do
    if EnterClampUtil.WhetherToEnter(featureId[i], false) then
      showId = featureId[i]
    end
  end
  local infoTxt = {
    [FEATURE_ENUM.ADVENTURE_BOSS] = T(1267),
    [FEATURE_ENUM.FROST_DUNGEON] = T(1500),
    [FEATURE_ENUM.ADVENTURE_ROGUE] = T(1279),
    [FEATURE_ENUM.TIDE_DUNGEON] = T(1323)
  }
  if showId and infoTxt[showId] then
    uis.Main.AbyssTipsWord.WordTxt.text = infoTxt[showId]
    local data = TableData.GetConfig(showId, "BaseFeature")
    if data and data.open_icon then
      uis.Main.AbyssTipsBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(data.open_icon)
    end
  end
end

function AbyssButtonTipsWindow.InitBtn()
  uis.Main.AbyssTipsBtn.onClick:Set(function()
    OpenWindow(WinResConfig.AbyssTipsWindow.name, UILayer.Guide, AbyssExploreMgr and AbyssExploreMgr.Exists())
    UIMgr:CloseWindow(WinResConfig.AbyssButtonTipsWindow.name)
  end)
end

function AbyssButtonTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  canOpaque = nil
end

return AbyssButtonTipsWindow
