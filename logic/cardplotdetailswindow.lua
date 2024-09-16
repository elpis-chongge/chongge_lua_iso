require("Abyss_CardPlotDetailsWindowByName")
local CardPlotDetailsWindow = {}
local uis, contentPane, nodeConfs, cardId, branch
local GetAllNodesByEventId = function(eventId)
  local evtConf = TableData.GetConfig(eventId, "BaseManorEvent")
  local nodeConfTbl = TableData.GetTable("BaseManorNode")
  local result = {}
  for i, v in pairs(nodeConfTbl) do
    if v.group_id == tonumber(evtConf.parameter) then
      table.insert(result, v)
    end
  end
  table.sort(result, function(x, y)
    return x.id < y.id
  end)
  return result
end
local LeftTabItemRenderer = function(i, gcmp)
  for j = 0, gcmp.numChildren - 1 do
    gcmp:GetChildAt(j).alpha = 0
  end
  PlayUITrans(gcmp, "up", nil, i * 0.03)
  local num = i + 1
  local nameTxt = gcmp:GetChild("NameTxt")
  local nodeConf = nodeConfs[num]
  local name = type(nodeConf.name) == "function" and nodeConf.name() or "未配置" .. tostring(nodeConf.id)
  nameTxt.text = name
  gcmp.onClick:Set(function()
    local step = branch.step
    if step > i then
      local index
      for j, v in ipairs(branch.nodeStoryRecords) do
        if v.nodeId == nodeConf.id then
          index = j
          break
        end
      end
      OpenWindow(WinResConfig.CardPlotTalkWindow.name, nil, true, index, branch)
    elseif i == step then
      local content = T(20215, name)
      MessageBox.Show(content, {
        touchCallback = function()
          JumpToWindow(WinResConfig.AbyssWindow.name)
          AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, branch)
        end
      }, {})
    else
      FloatTipsUtil.ShowWarnTips(T(20074))
    end
  end)
end

function CardPlotDetailsWindow.ReInitData()
end

function CardPlotDetailsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardPlotDetailsWindow.package, WinResConfig.CardPlotDetailsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_CardPlotDetailsWindowUis(contentPane)
    cardId = bridgeObj.argTable[1]
    branch = bridgeObj.argTable[2]
    CardPlotDetailsWindow.UpdateInfo()
    CardPlotDetailsWindow.InitBtn()
  end)
end

function CardPlotDetailsWindow.UpdateInfo()
  local conf = TableData.GetConfig(cardId, "BaseCard")
  local url_main = UIUtil.GetResUrl(conf.manor_bg)
  local url_sub = UIUtil.GetResUrl(TableData.GetConfig(11302, "BaseFeature").back_ground)
  uis.Main.BackGround.BackGroundLoader.url = url_main
  local tab = uis.Main.LeftTab
  conf = TableData.GetConfig(branch.eventId, "BaseManorEvent")
  tab.NameTxt.text = conf.name()
  tab.SubtitleTxt.text = T(20063)
  local numNodes = branch.numNodes
  tab.ProgressTxt.text = string.format("[color=#e6ff51]%02d[/color]/%02d", math.min(math.max(1, branch.step + 1), numNodes), numNodes)
  nodeConfs = GetAllNodesByEventId(branch.eventId)
  local left_list = tab.LeftTabList
  left_list.defaultItem = "ui://Abyss/LeftBtn"
  left_list.itemRenderer = LeftTabItemRenderer
  left_list.numItems = math.min(#nodeConfs, branch.step + 1)
  uis.Main.c1Ctr.onChanged:Set(function()
    if 0 == uis.Main.c1Ctr.selectedIndex then
      uis.Main.BackGround.BackGroundLoader.url = url_main
    else
      uis.Main.BackGround.BackGroundLoader.url = url_sub
    end
  end)
end

function CardPlotDetailsWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    if 0 ~= uis.Main.c1Ctr.selectedIndex then
      uis.Main.c1Ctr.selectedIndex = 0
      return
    end
    UIMgr:CloseWindow(WinResConfig.CardPlotDetailsWindow.name)
  end)
end

function CardPlotDetailsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return CardPlotDetailsWindow
