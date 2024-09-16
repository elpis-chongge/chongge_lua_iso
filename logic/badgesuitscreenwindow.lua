require("Badge_SuitScreenWindowByName")
local BadgeSuitScreenWindow = {}
local uis, contentPane, selecteId

function BadgeSuitScreenWindow.ReInitData()
end

function BadgeSuitScreenWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeSuitScreenWindow.package, WinResConfig.BadgeSuitScreenWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBadge_SuitScreenWindowUis(contentPane)
    BadgeSuitScreenWindow.UpdateInfo()
    BadgeSuitScreenWindow.InitBtn()
  end)
end

function BadgeSuitScreenWindow.GetAllSuits()
  local suits = TableData.GetTable("BaseBadgeSuitGroup")
  local tb = {}
  for i, v in pairs(suits) do
    table.insert(tb, v)
  end
  table.sort(tb, function(a, b)
    return a.id < b.id
  end)
  return tb
end

function BadgeSuitScreenWindow.UpdateInfo()
  local tips = uis.Main.SuitTips
  tips.TitleTxt.text = T(1221)
  local suits = BadgeSuitScreenWindow.GetAllSuits()
  selecteId = {}
  
  function tips.ContentList.itemRenderer(i, item)
    local data = suits[i + 1]
    UIUtil.SetText(item, data.name(), "NameTxt")
    UIUtil.SetText(item, BadgeData.GetSuitCountBySuitId(data.suit_id), "NumberTxt")
    item:GetChild("ItemLoader").url = UIUtil.GetResUrl(data.icon)
    item.onClick:Set(function()
      item.selected = not item.selected
      selecteId[data.id] = item.selected
    end)
    if table.contain(BadgeData.SuitId, data.id) then
      item.selected = true
      selecteId[data.id] = true
    end
  end
  
  tips.ContentList.numItems = #suits
  UIUtil.SetText(tips.ClearBtn, T(1222), "NameTxt")
  tips.ClearBtn.onClick:Set(function()
    selecteId = {}
    for i = 0, tips.ContentList.numChildren - 1 do
      tips.ContentList:GetChildAt(i).selected = false
    end
  end)
  UIUtil.SetText(tips.SureBtn, T(1223), "NameTxt")
  tips.SureBtn.onClick:Set(function()
    BadgeData.SuitId = BadgeSuitScreenWindow.GetSelecteId()
    BadgeSuitScreenWindow.CloseWindow()
    UIMgr:SendWindowMessage(WinResConfig.BadgeScreenWindow.name, WindowMsgEnum.BadgeWindow.SCREENING)
  end)
end

function BadgeSuitScreenWindow.GetSelecteId()
  local new = {}
  for i, v in pairs(selecteId) do
    if v then
      table.insert(new, i)
    end
  end
  return new
end

function BadgeSuitScreenWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeSuitScreenWindow.name)
end

function BadgeSuitScreenWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeSuitScreenWindow.CloseWindow)
  uis.Main.SuitTips.CloseBtn.onClick:Set(BadgeSuitScreenWindow.CloseWindow)
end

function BadgeSuitScreenWindow.OnClose()
  uis = nil
  contentPane = nil
  contentPane = selecteId
end

return BadgeSuitScreenWindow
