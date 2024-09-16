require("GuildSupply_GuildSupplyWindowByName")
local GuildSupplyWindow = {}
local uis, contentPane, supplyData, index, listIndex, jumpTb

function GuildSupplyWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildSupplyWindow.package, WinResConfig.GuildSupplyWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildSupply_GuildSupplyWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.GUILD_SIGN_IN)
    GuildSupplyWindow.InitBtn()
    GuildSupplyWindow.Init()
  end)
end

function GuildSupplyWindow.GetData(type)
  local config = TableData.GetTable("BaseActivitySignIn")
  for i, v in pairs(config) do
    if v.index == type then
      return v
    end
  end
end

function GuildSupplyWindow.Init()
  local num = math.floor(GuildData.signInInfo.signStat / 10000)
  index = GuildData.signInInfo.signStat - num * 10000 + 1
  supplyData = GuildSupplyWindow.GetData(num)
  if supplyData and index >= 0 then
    local arr = GetConfigItemList(supplyData.reward, true)
    local itemConfig
    for i = 1, 7 do
      if arr[i] then
        local tips = UIMgr:CreateObject("GuildSupply", string.format("Tips%d", i))
        UIUtil.SetText(tips, string.format("0%d", i), "OrderTxt")
        UIUtil.SetText(tips, T(444), "DayTxt")
        UIUtil.SetText(tips, arr[i].value, "NumberTxt")
        itemConfig = TableData.GetConfig(arr[i].id, "BaseItem")
        if itemConfig then
          ChangeUIController(tips, "c1", itemConfig.quality)
          local item = tips:GetChild("Item")
          item:GetChild("IconLoader").url = UIUtil.GetResUrl(itemConfig.icon)
          item.onClick:Set(function()
            OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
              id = arr[i].id
            })
          end)
        end
        if i < index then
          ChangeUIController(tips, "state", 2)
        elseif i == index and not GuildData.signInInfo.isTodaySignIn then
          ChangeUIController(tips, "state", 1)
          tips.onClick:Set(function()
            if not GuildData.signInInfo.isTodaySignIn then
              GuildService.ActorSignInReq()
            end
          end)
          listIndex = i - 1
        end
        uis.Main.TipsList:AddChild(tips)
      end
    end
  end
end

function GuildSupplyWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.GuildSupplyWindow.name, uis.Main.CurrencyReturn)
end

function GuildSupplyWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWindow.SIGN_IN then
    local tips = uis.Main.TipsList:GetChildAt(listIndex)
    if tips then
      ChangeUIController(tips, "state", 2)
    end
  end
end

function GuildSupplyWindow.OnClose()
  uis = nil
  contentPane = nil
  supplyData = nil
  index = nil
  listIndex = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return GuildSupplyWindow
