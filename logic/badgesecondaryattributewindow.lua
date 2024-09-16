require("Badge_SecondaryAttributeWindowByName")
local BadgeSecondaryAttributeWindow = {}
local uis, contentPane, selecteId

function BadgeSecondaryAttributeWindow.ReInitData()
end

function BadgeSecondaryAttributeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeSecondaryAttributeWindow.package, WinResConfig.BadgeSecondaryAttributeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBadge_SecondaryAttributeWindowUis(contentPane)
    BadgeSecondaryAttributeWindow.UpdateInfo()
    BadgeSecondaryAttributeWindow.InitBtn()
  end)
end

function BadgeSecondaryAttributeWindow.UpdateInfo()
  selecteId = {}
  local tips = uis.Main.PrimaryAttributeTips
  tips.TitleTxt.text = T(1224)
  tips.WordTxt.text = T(1225)
  local str = TableData.GetConfig(70010035, "BaseFixed").array_value
  local arr = Split(str, "|")
  local sort = BadgeMgr.viceAttributeCtr
  if arr and #arr > 0 then
    function tips.ContentList.itemRenderer(i, item)
      local type = tonumber(arr[i + 1])
      
      ChangeUIController(item, "c1", sort[type])
      UIUtil.SetText(item, BadgeData.GetBadgeAttributeName(type), "NameTxt")
      item.onClick:Set(function()
        if #BadgeSecondaryAttributeWindow.GetSelecteId() < 4 or selecteId[type] then
          item.selected = not item.selected
          selecteId[type] = item.selected
        end
      end)
      if table.contain(BadgeData.ViceAttribute, type) then
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
    BadgeData.ViceAttribute = BadgeSecondaryAttributeWindow.GetSelecteId()
    BadgeSecondaryAttributeWindow.CloseWindow()
    UIMgr:SendWindowMessage(WinResConfig.BadgeScreenWindow.name, WindowMsgEnum.BadgeWindow.SCREENING)
  end)
end

function BadgeSecondaryAttributeWindow.GetSelecteId()
  local new = {}
  for i, v in pairs(selecteId) do
    if v then
      table.insert(new, i)
    end
  end
  return new
end

function BadgeSecondaryAttributeWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeSecondaryAttributeWindow.name)
end

function BadgeSecondaryAttributeWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeSecondaryAttributeWindow.CloseWindow)
  uis.Main.PrimaryAttributeTips.CloseBtn.onClick:Set(BadgeSecondaryAttributeWindow.CloseWindow)
end

function BadgeSecondaryAttributeWindow.OnClose()
  uis = nil
  contentPane = nil
  selecteId = nil
end

return BadgeSecondaryAttributeWindow
