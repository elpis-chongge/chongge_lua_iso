require("Badge_FilterSortWindowByName")
local BadgeFilterSortWindow = {}
local uis, contentPane

function BadgeFilterSortWindow.ReInitData()
end

function BadgeFilterSortWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeFilterSortWindow.package, WinResConfig.BadgeFilterSortWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBadge_FilterSortWindowUis(contentPane)
    BadgeFilterSortWindow.UpdateInfo()
    BadgeFilterSortWindow.InitBtn()
  end)
end

function BadgeFilterSortWindow.UpdateInfo()
  local tips = uis.Main.FilterSortTips
  tips.TitleTxt.text = T(1227)
  local basics = UIMgr:CreateComponent("Badge", "FilterSortTipsRegion1")
  UIUtil.SetText(basics:GetChild("FilterSortTitle"), T(1228), "NameTxt")
  local starList = basics:GetChild("ChoiceList")
  local wordId = {1217, 1230}
  
  function starList.itemRenderer(i, item)
    UIUtil.SetText(item, T(wordId[i + 1]), "NameTxt")
    item.onClick:Set(function()
      if starList.selectedIndex ~= i then
        starList.selectedIndex = i
        if BadgeData.sortType ~= i then
          BadgeData.sortType = i
        end
      end
    end)
    if i == BadgeData.sortType then
      item.onClick:Call()
    end
  end
  
  starList.numItems = #wordId
  tips.ContentList:AddChild(basics)
  local attribute = UIMgr:CreateComponent("Badge", "FilterSortTipsRegion2")
  UIUtil.SetText(attribute:GetChild("FilterSortTitle"), T(1229), "NameTxt")
  local attributeList = attribute:GetChild("ChoiceList")
  local arr = BadgeData.GetMainAttribute()
  local sort = BadgeMgr.mainAttributeCtr
  
  function attributeList.itemRenderer(i, item)
    local type = tonumber(arr[i + 1])
    ChangeUIController(item, "c1", sort[type])
    UIUtil.SetText(item, BadgeData.GetBadgeAttributeName(type), "NameTxt")
    item.onClick:Set(function()
      item.selected = not item.selected
      if item.selected then
        table.insert(BadgeData.SortAttribute, type)
        local len = #BadgeData.SortAttribute
        UIUtil.SetText(item, 0 == len and "" or len, "OrderTxt")
      else
        BadgeFilterSortWindow.Remove(type)
        for index = 0, attributeList.numChildren - 1 do
          local bol, k = table.contain(BadgeData.SortAttribute, tonumber(arr[index + 1]))
          if bol then
            UIUtil.SetText(attributeList:GetChildAt(index), k, "OrderTxt")
          else
            UIUtil.SetText(attributeList:GetChildAt(index), "", "OrderTxt")
          end
        end
      end
    end)
    local bol, k = table.contain(BadgeData.SortAttribute, type)
    if bol then
      item.selected = true
      UIUtil.SetText(item, k, "OrderTxt")
    end
  end
  
  attributeList.numItems = #arr
  tips.ContentList:AddChild(attribute)
  UIUtil.SetText(tips.ClearBtn, T(1222), "NameTxt")
  tips.ClearBtn.onClick:Set(function()
    BadgeData.SortAttribute = {}
    local item
    for i = 0, attributeList.numChildren - 1 do
      item = attributeList:GetChildAt(i)
      item.selected = false
      UIUtil.SetText(item, "", "OrderTxt")
    end
  end)
  UIUtil.SetText(tips.SureBtn, T(1223), "NameTxt")
  tips.SureBtn.onClick:Set(BadgeFilterSortWindow.CloseWindow)
end

function BadgeFilterSortWindow.Remove(type)
  for i = #BadgeData.SortAttribute, 1, -1 do
    if BadgeData.SortAttribute[i] == type then
      table.remove(BadgeData.SortAttribute, i)
      break
    end
  end
end

function BadgeFilterSortWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeFilterSortWindow.CloseWindow)
  uis.Main.FilterSortTips.CloseBtn.onClick:Set(BadgeFilterSortWindow.CloseWindow)
end

function BadgeFilterSortWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeFilterSortWindow.name)
  if UIMgr:IsWindowOpen(WinResConfig.BadgeWindow.name) then
    UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.SCREENING_SHOW)
  end
  if UIMgr:IsWindowOpen(WinResConfig.BadgeDecomposeWindow.name) then
    UIMgr:SendWindowMessage(WinResConfig.BadgeDecomposeWindow.name, WindowMsgEnum.BadgeWindow.SCREENING_SHOW)
  end
end

function BadgeFilterSortWindow.OnClose()
  uis = nil
  contentPane = nil
end

return BadgeFilterSortWindow
