require("Badge_PrimaryAttributeWindowByName")
local BadgePrimaryAttributeWindow = {}
local uis, contentPane, selecteId

function BadgePrimaryAttributeWindow.ReInitData()
end

function BadgePrimaryAttributeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgePrimaryAttributeWindow.package, WinResConfig.BadgePrimaryAttributeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBadge_PrimaryAttributeWindowUis(contentPane)
    BadgePrimaryAttributeWindow.UpdateInfo()
    BadgePrimaryAttributeWindow.InitBtn()
  end)
end

function BadgePrimaryAttributeWindow.UpdateInfo()
  local tips = uis.Main.PrimaryAttributeTips
  tips.TitleTxt.text = T(1226)
  local arr = BadgeData.GetMainAttribute()
  local sort = BadgeMgr.mainAttributeCtr
  selecteId = {}
  if arr and #arr > 0 then
    function tips.ContentList.itemRenderer(i, item)
      local type = tonumber(arr[i + 1])
      
      ChangeUIController(item, "c1", sort[type])
      UIUtil.SetText(item, BadgeData.GetBadgeAttributeName(type), "NameTxt")
      item.onClick:Set(function()
        item.selected = not item.selected
        selecteId[type] = item.selected
      end)
      if table.contain(BadgeData.MainAttribute, type) then
        item.selected = true
        selecteId[type] = true
      end
    end
    
    tips.ContentList.numItems = #arr
  end
  UIUtil.SetText(tips.ClearBtn, T(1222), "NameTxt")
  tips.ClearBtn.onClick:Set(function()
    selecteId = {}
    for i = 0, tips.ContentList.numChildren - 1 do
      tips.ContentList:GetChildAt(i).selected = false
    end
  end)
  UIUtil.SetText(tips.SureBtn, T(1223), "NameTxt")
  tips.SureBtn.onClick:Set(function()
    BadgeData.MainAttribute = BadgePrimaryAttributeWindow.GetSelecteId()
    BadgePrimaryAttributeWindow.CloseWindow()
    UIMgr:SendWindowMessage(WinResConfig.BadgeScreenWindow.name, WindowMsgEnum.BadgeWindow.SCREENING)
  end)
end

function BadgePrimaryAttributeWindow.GetSelecteId()
  local new = {}
  for i, v in pairs(selecteId) do
    if v then
      table.insert(new, i)
    end
  end
  return new
end

function BadgePrimaryAttributeWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgePrimaryAttributeWindow.CloseWindow)
  uis.Main.PrimaryAttributeTips.CloseBtn.onClick:Set(BadgePrimaryAttributeWindow.CloseWindow)
end

function BadgePrimaryAttributeWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgePrimaryAttributeWindow.name)
end

function BadgePrimaryAttributeWindow.OnClose()
  uis = nil
  contentPane = nil
  selecteId = nil
end

return BadgePrimaryAttributeWindow
