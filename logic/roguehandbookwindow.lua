require("RogueBuild01_HandBookWindowByName")
local RogueHandBookWindow = {}
local uis, contentPane, jumpTb

function RogueHandBookWindow.ReInitData()
end

function RogueHandBookWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueHandBookWindow.package, WinResConfig.RogueHandBookWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    local id = bridgeObj.argTable[1]
    uis = GetRogueBuild01_HandBookWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_PIC_MAIN)
    RogueHandBookWindow.UpdateInfo()
    RogueHandBookWindow.InitBtn(id)
  end)
end

function RogueHandBookWindow.UpdateInfo()
end

function RogueHandBookWindow.InitBtn(id)
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueHandBookWindow.name, uis.Main.CurrencyReturn)
  local rogueThemeData = TableData.GetConfig(id, "BaseRogueTheme")
  if rogueThemeData then
    RogueService.GetRogueAllPicReq(ProtoEnum.ROGUE_PIC_TYPE.ENDING, function()
      local picInfo = RogueData.GetPicInfoBuyType(ProtoEnum.ROGUE_PIC_TYPE.ENDING)
      local lock = true
      if picInfo and RogueHandBookWindow.getLen(picInfo.picId2States) > 0 then
        lock = false
      end
      if uis then
        ChangeUIController(uis.Main.BookEndBtn, "c2", lock and 1 or 0)
        uis.Main.BookEndBtn.onClick:Set(function()
          if false == lock then
            OpenWindow(WinResConfig.RogueBookEndWindow.name, nil, rogueThemeData.group_id)
          else
            FloatTipsUtil.ShowWarnTips(T(1469))
          end
        end)
      end
    end)
    UIUtil.SetText(uis.Main.BookEndBtn, T(1388), "WordTxt")
    UIUtil.SetText(uis.Main.BookEndBtn, T(1493), "TipsTxt")
    RogueService.GetRogueAllPicReq(ProtoEnum.ROGUE_PIC_TYPE.EVENT, function()
      local picInfo = RogueData.GetPicInfoBuyType(ProtoEnum.ROGUE_PIC_TYPE.EVENT)
      local lock = true
      if picInfo and RogueHandBookWindow.getLen(picInfo.picId2States) > 0 then
        lock = false
      end
      if uis then
        ChangeUIController(uis.Main.BookEventBtn, "c2", lock and 1 or 0)
        uis.Main.BookEventBtn.onClick:Set(function()
          if false == lock then
            OpenWindow(WinResConfig.RogueBookEventWindow.name, nil, rogueThemeData.group_id)
          else
            FloatTipsUtil.ShowWarnTips(T(1474))
          end
        end)
      end
    end)
    UIUtil.SetText(uis.Main.BookEventBtn, T(1386), "WordTxt")
    UIUtil.SetText(uis.Main.BookEventBtn, T(1495), "TipsTxt")
    uis.Main.BookTreasureBtn.onClick:Set(function()
      RogueService.GetRogueAllPicReq(ProtoEnum.ROGUE_PIC_TYPE.TREASURE, function()
        OpenWindow(WinResConfig.RogueBookTreasureWindow.name, nil, rogueThemeData.group_id, rogueThemeData.group_id)
      end)
    end)
    UIUtil.SetText(uis.Main.BookTreasureBtn, T(1387), "WordTxt")
    RogueHandBookWindow.UpdateRed()
  end
end

function RogueHandBookWindow.getLen(t)
  local count = 0
  for i, v in pairs(t) do
    count = count + 1
  end
  return count
end

function RogueHandBookWindow.UpdateRed()
  ChangeUIController(uis.Main.BookEventBtn, "c1", RogueMgr.CanEventNew() and 1 or 0)
  ChangeUIController(uis.Main.BookEndBtn, "c1", RogueMgr.CanEndindNew() and 1 or 0)
  ChangeUIController(uis.Main.BookTreasureBtn, "c1", RogueMgr.CanMapNew() and 1 or 0)
end

function RogueHandBookWindow.OnShown()
  if uis then
    RogueHandBookWindow.UpdateRed()
  end
end

function RogueHandBookWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return RogueHandBookWindow
