require("Guild_IconChoiceWindowByName")
local GuildIconChoiceWindow = {}
local uis, contentPane, listData, selectId, curId

function GuildIconChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildIconChoiceWindow.package, WinResConfig.GuildIconChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    curId = bridgeObj.argTable[1]
    uis = GetGuild_IconChoiceWindowUis(contentPane)
    GuildIconChoiceWindow.UpdateTextDisplay()
    GuildIconChoiceWindow.InitBtn()
  end)
end

function GuildIconChoiceWindow.UpdateTextDisplay()
  listData = {}
  local config = TableData.GetTable("BaseGuildHeadIcon")
  if config then
    for i, v in pairs(config) do
      if v.unlock_tag then
        if GuildData.GuildInfo and GuildData.GuildInfo.info and GuildData.GuildInfo.info.unlockedHeadIds and table.contain(GuildData.GuildInfo.info.unlockedHeadIds, v.id) then
          table.insert(listData, v)
        end
      else
        table.insert(listData, v)
      end
    end
  end
  if listData then
    table.sort(listData, function(a, b)
      return a.sort > b.sort
    end)
    local IconList = uis.Main.IconChoice1.IconList
    IconList.itemRenderer = GuildIconChoiceWindow.RefreshIconItem
    IconList.numItems = #listData
  end
end

function GuildIconChoiceWindow.RefreshIconItem(index, obj)
  local data = listData[index + 1]
  obj:GetChild("GulidIconLoader").url = UIUtil.GetResUrl(data.icon)
  obj.onClick:Set(function()
    if uis.Main.IconChoice1.IconList.selectedIndex ~= index then
      GuildIconChoiceWindow.ItemOnClick(data)
      uis.Main.IconChoice1.IconList.selectedIndex = index
    end
  end)
  if curId and data.id == curId then
    obj.onClick:Call()
  end
end

function GuildIconChoiceWindow.ItemOnClick(data)
  selectId = data.id
end

function GuildIconChoiceWindow.ClickClose()
  UIMgr:CloseWindow(WinResConfig.GuildIconChoiceWindow.name)
end

function GuildIconChoiceWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(GuildIconChoiceWindow.ClickClose)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = function()
      if selectId == curId then
        return
      end
      GuildService.ChangeGuildIconReq(selectId)
    end
  }, {
    touchCallback = GuildIconChoiceWindow.ClickClose
  })
end

function GuildIconChoiceWindow.HandleMessage(msgId, para)
end

function GuildIconChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
  selectId = nil
  curId = nil
end

return GuildIconChoiceWindow
