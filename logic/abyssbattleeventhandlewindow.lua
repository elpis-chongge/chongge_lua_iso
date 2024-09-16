require("Abyss_MobWindowByName")
local AbyssBattleEventHandleWindow = {}
local uis, contentPane, grid, eventInfo
local BTN_TITLE_FUNC = {
  [1] = {
    ui_ctrl_index = 0,
    title = T(20361),
    callback = function()
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_BATTLE, grid, eventInfo)
      local stageId = tonumber(eventInfo.param)
      AbyssExploreMgr.PrepareEnterBattle(eventInfo, stageId, nil, nil, nil, true)
    end
  },
  [2] = {
    ui_ctrl_index = 1,
    title = T(20362),
    callback = function()
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_BATTLE, grid, eventInfo)
      local stageId = tonumber(eventInfo.param)
      AbyssExploreMgr.PrepareEnterBattle(eventInfo, stageId)
    end
  },
  [3] = {
    ui_ctrl_index = 2,
    title = T(20363),
    callback = function()
      UIMgr:CloseWindow(WinResConfig.AbyssBattleEventHandleWindow.name)
    end
  }
}
local DESC_POOL

function AbyssBattleEventHandleWindow.ReInitData()
end

function AbyssBattleEventHandleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssBattleEventHandleWindow.package, WinResConfig.AbyssBattleEventHandleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    grid = bridgeObj.argTable[1]
    eventInfo = bridgeObj.argTable[2]
    uis = GetAbyss_MobWindowUis(contentPane)
    AbyssBattleEventHandleWindow.UpdateInfo()
    AbyssBattleEventHandleWindow.InitBtn()
  end)
end

function AbyssBattleEventHandleWindow.UpdateInfo()
  local funclist = {}
  for i, v in ipairs(BTN_TITLE_FUNC) do
    table.insert(funclist, v)
  end
  local quicklyBattleVisible = true
  if not quicklyBattleVisible then
    table.remove(funclist, 1)
  end
  local btnlist = uis.Main.MobTips.BtnList
  
  function btnlist.itemRenderer(i, gcmp)
    local item = funclist[i + 1]
    UIUtil.SetText(gcmp, item.title, "WordTxt")
    ChangeUIController(gcmp, "c1", item.ui_ctrl_index)
    gcmp.onClick:Set(item.callback)
  end
  
  btnlist.numItems = #funclist
  if not DESC_POOL then
    DESC_POOL = {}
    local splits = Split(TableData.GetConfig(70010822, "BaseFixed").array_value, "|")
    for i, v in ipairs(splits) do
      table.insert(DESC_POOL, tonumber(v))
    end
  end
  local rdmDesc = DESC_POOL[math.random(1, #DESC_POOL)]
  local wordlist = uis.Main.MobTips.WordList
  
  function wordlist.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, T(rdmDesc), "WordTxt")
  end
  
  wordlist.numItems = 1
end

function AbyssBattleEventHandleWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.AbyssBattleEventHandleWindow.name)
  end)
end

function AbyssBattleEventHandleWindow.OnClose()
  uis = nil
  contentPane = nil
  grid = nil
  eventInfo = nil
end

return AbyssBattleEventHandleWindow
