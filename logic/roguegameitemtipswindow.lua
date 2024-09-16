require("RogueBuild01_Camp_ItemTipsWindowByName")
local RogueGameItemTipsWindow = {}
local uis, contentPane, treasure, treasureIdList, unlokedHalidoms, lookover
local DisplayTreasure = function(treasureId)
  if lookover then
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_item_reward_static")
  else
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_item_reward")
  end
  local conf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
  local panel = uis.Main.TipsRegion
  local root = panel.root
  if conf then
    local loader = root:GetChild("PicLoader")
    loader.url = UIUtil.GetResUrl(conf.icon)
    local wordlist = panel.WordList
    UIUtil.SetText(root, conf.number(), "IDTxt")
    UIUtil.SetText(root, conf.name(), "NameTxt")
    ChangeUIController(root:GetChild("Type"), "c1", conf.type - 1)
    ChangeUIController(root:GetChild("Level"), "c1", conf.level - 1)
    
    function wordlist.itemRenderer(i, gcmp)
      UIUtil.SetText(gcmp, conf.des(), "EffectTxt")
      UIUtil.SetText(gcmp, conf.des_detail(), "WordTxt")
    end
    
    wordlist.numItems = 1
  else
    printError("未配置的 宝物", treasureId)
  end
end

function RogueGameItemTipsWindow.ReInitData()
end

function RogueGameItemTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameItemTipsWindow.package, WinResConfig.RogueGameItemTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_Camp_ItemTipsWindowUis(contentPane)
    treasure = bridgeObj.argTable[1]
    unlokedHalidoms = bridgeObj.argTable[2]
    lookover = bridgeObj.argTable[3]
    RogueGameItemTipsWindow.UpdateInfo()
    RogueGameItemTipsWindow.InitBtn()
  end)
end

function RogueGameItemTipsWindow.UpdateInfo()
  treasureIdList = {}
  if type(treasure) == "number" then
    table.insert(treasureIdList, treasure)
  elseif type(treasure) == "table" then
    for _, v in ipairs(treasure) do
      table.insert(treasureIdList, v)
    end
  end
  local treasureId = table.remove(treasureIdList, 1)
  DisplayTreasure(treasureId)
  PlayUITrans(uis.Main.root, lookover and "in2" or "in1")
end

function RogueGameItemTipsWindow.InitBtn()
  uis.Main.TipsRegion.CloseBtn.onClick:Set(function()
    local root = uis.Main.root
    if IsUITransPlaying(root, "in1") or IsUITransPlaying(root, "in2") or IsUITransPlaying(root, "out") then
      return
    end
    if #treasureIdList > 0 then
      local treasureId = table.remove(treasureIdList, 1)
      DisplayTreasure(treasureId)
      PlayUITrans(root, "in1")
    else
      UIMgr:CloseWindow(WinResConfig.RogueGameItemTipsWindow.name)
    end
  end)
end

function RogueGameItemTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  if unlokedHalidoms and _G.next(unlokedHalidoms) then
    OpenWindow(WinResConfig.RogueGameUnlockHalidomTipsWindow.name, nil, unlokedHalidoms)
  end
  unlokedHalidoms = nil
  RogueGameMgr.DisplayItemNotifyIfNecessary()
end

return RogueGameItemTipsWindow
