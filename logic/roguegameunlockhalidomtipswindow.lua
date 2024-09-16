require("RogueBuild01_InsideSacredWindowByName")
local RogueGameUnlockHalidomTipsWindow = {}
local uis, contentPane, halidomList, lookover
local DisplayHalidomInfo = function(halidomId)
  local panel = uis.Main.Tips
  local conf = TableData.GetConfig(halidomId, "BaseRogueHoly")
  panel.Name.NameTxt.text = conf.name()
  panel.Item.PicLoader.url = UIUtil.GetResUrl(conf.icon)
  if not lookover then
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_holy_reward")
    local holder = panel.Item.EffectHolder
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Rugel/FX_ui_rogue_relicsget.prefab")
    UIUtil.SetObjectToUI(effect, holder)
    LuaUtil.PlayEffect(effect)
  end
  local exclusive = type(conf.card_id) == "number"
  panel.c1Ctr.selectedIndex = exclusive and 1 or 0
  if exclusive then
    local loader = panel.Head.HeadBg.PicLoader
    local cardId = conf.card_id
    local cardConf = TableData.GetConfig(cardId, "BaseCard")
    UIUtil.SetHeadByFaceId(cardConf.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
  end
  local list = panel.WordList
  
  function list.itemRenderer(j, gcmp)
    UIUtil.SetText(gcmp, conf.des(), "EffectTxt")
    UIUtil.SetText(gcmp, conf.des_detail(), "WordTxt")
  end
  
  list.numItems = 1
end

function RogueGameUnlockHalidomTipsWindow.ReInitData()
end

function RogueGameUnlockHalidomTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameUnlockHalidomTipsWindow.package, WinResConfig.RogueGameUnlockHalidomTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideSacredWindowUis(contentPane)
    halidomList = bridgeObj.argTable[1]
    lookover = bridgeObj.argTable[2]
    RogueGameUnlockHalidomTipsWindow.UpdateInfo()
    RogueGameUnlockHalidomTipsWindow.InitBtn()
  end)
end

function RogueGameUnlockHalidomTipsWindow.UpdateInfo()
  local panel = uis.Main.Tips
  panel.Title.TitleTxt.text = T(20465)
  local halidomId = table.remove(halidomList, 1)
  DisplayHalidomInfo(halidomId)
  PlayUITrans(uis.Main.root, lookover and "in2" or "in1")
end

function RogueGameUnlockHalidomTipsWindow.InitBtn()
  uis.Main.Tips.root.onClick:Set(function()
    local root = uis.Main.root
    if IsUITransPlaying(root, "in1") or IsUITransPlaying(root, "in2") or IsUITransPlaying(root, "out") then
      return
    end
    if #halidomList > 0 then
      local removed = table.remove(halidomList, 1)
      DisplayHalidomInfo(removed)
      PlayUITrans(root, "in1")
    else
      UIMgr:CloseWindow(WinResConfig.RogueGameUnlockHalidomTipsWindow.name)
    end
  end)
end

function RogueGameUnlockHalidomTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  RogueGameMgr.DisplayItemNotifyIfNecessary()
end

return RogueGameUnlockHalidomTipsWindow
