require("RogueBuild01_InsideDungeonInfoWindowByName")
local RogueGameNodeHandleWindow = {}
local uis, contentPane, nodeId, handleCallback, cancelCallback
local CONTROLLER_LOOKUP = {
  BATTLE_NORMAL = 0,
  BATTLE_ENCOUNTER = 1,
  BATTLE_BOSS = 2,
  EVENT = 3,
  SHOP = 4,
  SUPPLY = 5,
  [RogueGameNodeType.BATTLE_NORMAL] = 0,
  [RogueGameNodeType.BATTLE_ENCOUNTER] = 1,
  [RogueGameNodeType.BATTLE_BOSS] = 2,
  [RogueGameNodeType.EVENT] = 3,
  [RogueGameNodeType.SHOP] = 4,
  [RogueGameNodeType.SUPPLY] = 5
}

function RogueGameNodeHandleWindow.ReInitData()
end

function RogueGameNodeHandleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameNodeHandleWindow.package, WinResConfig.RogueGameNodeHandleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideDungeonInfoWindowUis(contentPane)
    nodeId = bridgeObj.argTable[1]
    handleCallback = bridgeObj.argTable[2]
    cancelCallback = bridgeObj.argTable[3]
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_SHOW)
    RogueGameNodeHandleWindow.UpdateInfo()
    RogueGameNodeHandleWindow.InitBtn()
  end)
end

function RogueGameNodeHandleWindow.UpdateInfo()
  local conf = TableData.GetConfig(nodeId, "BaseRogueNode")
  local nodeType = conf.type
  local ctrl_index = CONTROLLER_LOOKUP[nodeType]
  local titlePanel = uis.Main.DungeonInfoTips.Title
  local midPanel = uis.Main.DungeonInfoTips.Mid
  titlePanel.c1Ctr.selectedIndex = ctrl_index
  midPanel.c1Ctr.selectedIndex = ctrl_index
  ChangeUIController(uis.Main.DungeonInfoTips.SureBtn, "c1", ctrl_index)
  local des, des_detail
  local chapterInfo = RogueGameData.GetChapterInfo()
  local stageIdLookup = chapterInfo.nextNode2StageIds
  if nodeType <= RogueGameNodeType.BATTLE_BOSS then
    local stageId = stageIdLookup[nodeId]
    local stageConf = TableData.GetConfig(stageId, "BaseStage")
    local buff_list = stageConf.buff_list
    if stageConf then
      titlePanel.BattleTxt.text = conf.name()
      des = stageConf.des
      if buff_list then
        local buffConf = TableData.GetConfig(buff_list[1], "BaseSkillBuffPre")
        des_detail = buffConf.des
      end
    end
    titlePanel.NameTxt.text = stageConf.name()
  else
    titlePanel.NameTxt.text = conf.name()
    des = conf.des
  end
  local wordlist = midPanel.WordList
  local cnt = 0
  cnt = cnt + (des and 1 or 0)
  cnt = cnt + (des_detail and 1 or 0)
  
  function wordlist.itemProvider(i)
    if 0 == i then
      return "ui://RogueBuild01/DungeonInfo_MidWord"
    end
    return "ui://RogueBuild01/DungeonInfo_MidEffect"
  end
  
  function wordlist.itemRenderer(i, gcmp)
    if 0 == i then
      UIUtil.SetText(gcmp, des(), "WordTxt")
    else
      UIUtil.SetText(gcmp, des_detail(), "EffectTxt")
    end
  end
  
  wordlist.numItems = cnt
  local sureBtnText = T(685)
  UIUtil.SetText(uis.Main.DungeonInfoTips.SureBtn, sureBtnText, "WordTxt")
end

function RogueGameNodeHandleWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    if type(cancelCallback) == "function" then
      cancelCallback()
    end
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
    UIMgr:CloseWindow(WinResConfig.RogueGameNodeHandleWindow.name)
  end)
  uis.Main.DungeonInfoTips.SureBtn.onClick:Set(handleCallback)
end

function RogueGameNodeHandleWindow.OnClose()
  uis = nil
  contentPane = nil
  handleCallback = nil
  cancelCallback = nil
end

return RogueGameNodeHandleWindow
