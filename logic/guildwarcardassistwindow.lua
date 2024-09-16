require("GuildBoss_GuildCardAssistWindowByName")
local GuildWarCardAssistWindow = {}
local uis, contentPane, max, info

function GuildWarCardAssistWindow.ReInitData()
end

function GuildWarCardAssistWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarCardAssistWindow.package, WinResConfig.GuildWarCardAssistWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_GuildCardAssistWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.GUILD_WAR_WINDOW_BG)
    max = TableData.GetConfig(70011407, "BaseFixed").int_value
    info = GuildWarData.GetGuildPlayerInfo()
    GuildWarCardAssistWindow.UpdateInfo()
    GuildWarCardAssistWindow.InitBtn()
    CurrencyReturnWindow.AutoOpenCaption(12306, uis, uis.Main.FunctionDetailsBtn)
  end)
end

function GuildWarCardAssistWindow.UpdateInfo()
  if info then
    local selectCardId = {}
    for i, v in pairs(info.assistCardId2Count) do
      table.insert(selectCardId, i)
    end
    table.sort(selectCardId, function(a, b)
      local aNum = info.assistCardId2Count[a] or 0
      local bNum = info.assistCardId2Count[b] or 0
      if aNum == bNum then
        local aInfo = CardData.GetCardDataById(a)
        local bInfo = CardData.GetCardDataById(b)
        if bInfo and bInfo then
          if bInfo.level == aInfo.level then
            local aData = TableData.GetConfig(a, "BaseCard")
            local bData = TableData.GetConfig(b, "BaseCard")
            if bData and aData then
              if bData.star == aData.star then
                return a < b
              else
                return aData.star > bData.star
              end
            end
          else
            return aInfo.level > bInfo.level
          end
        end
      else
        return aNum > bNum
      end
    end)
    
    function uis.Main.TipsList.itemRenderer(i, item)
      local id
      if selectCardId[i + 1] then
        id = selectCardId[i + 1]
        local cardInfo = CardData.GetCardDataById(id)
        UIUtil.ShowCardTips(cardInfo, item:GetChild("Tips"), nil, nil, HEAD_ICON_TYPE_ENUM.BANNER)
        if info.assistCardId2Count[id] then
          UIUtil.SetText(item:GetChild("Number"), T(1606, info.assistCardId2Count[id]), "NumberTxt")
          ChangeUIController(item, "c2", info.assistCardId2Count[id] > 0 and 1 or 0)
        else
          ChangeUIController(item, "c2", 0)
        end
        ChangeUIController(item, "c1", 0)
        local data = TableData.GetConfig(id, "BaseCard")
        if data then
          ChangeUIController(item:GetChild("Tips"), "c1", data.star - 1)
        end
      else
        ChangeUIController(item, "c1", 1)
      end
      item.onClick:Set(function()
        OpenWindow(WinResConfig.GuildWarEditTeamWindow.name, nil, selectCardId, id)
      end)
    end
    
    uis.Main.TipsList.numItems = max
  end
end

function GuildWarCardAssistWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarCardAssistWindow.name)
  end)
end

function GuildWarCardAssistWindow.OnShown()
  if uis then
    GuildWarCardAssistWindow.UpdateInfo()
  end
end

function GuildWarCardAssistWindow.OnClose()
  uis = nil
  contentPane = nil
  max = nil
  info = nil
end

return GuildWarCardAssistWindow
