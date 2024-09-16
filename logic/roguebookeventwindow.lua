require("RogueBuild01_BookEventWindowByName")
local RogueBookEventWindow = {}
local uis, contentPane, jumpTb, eventData

function RogueBookEventWindow.ReInitData()
end

function RogueBookEventWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueBookEventWindow.package, WinResConfig.RogueBookEventWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_BookEventWindowUis(contentPane)
    local groupId = bridgeObj.argTable[1]
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_PIC_EVENT)
    eventData = RogueBookEventWindow.GetEventData(groupId)
    RogueBookEventWindow.UpdateInfo()
    RogueBookEventWindow.InitBtn()
  end)
end

function RogueBookEventWindow.UpdateInfo()
  uis.Main.Title.WordTxt.text = T(1396)
  local picInfo = RogueData.GetPicInfoBuyType(ProtoEnum.ROGUE_PIC_TYPE.EVENT)
  local len = #eventData
  local num = 0
  local lastItem, initIndex
  
  function uis.Main.TabList.itemRenderer(i, item)
    local data = eventData[i + 1]
    local btn = item:GetChild("TabBtn")
    local lock = false
    if picInfo and picInfo.picId2States[data.id] ~= nil then
      UIUtil.SetText(btn, data.name(), "WordTxt")
      num = num + 1
      ChangeUIController(btn, "c1", 0)
      lock = true
      if nil == initIndex then
        initIndex = i
      end
    else
      ChangeUIController(btn, "c1", 1)
      UIUtil.SetText(btn:GetChild("Lock"), T(732), "WordTxt")
    end
    ChangeUIController(btn, "c2", picInfo and picInfo.picId2States[data.id] and 1 or 0)
    
    function btn.testEnableOnClick()
      return lock
    end
    
    item.onClick:Set(function()
      if false == lock then
        FloatTipsUtil.ShowWarnTips(T(1476))
        return
      end
      if lastItem and lastItem == btn then
        return
      end
      if lastItem then
        lastItem.selected = false
      end
      RogueBookEventWindow.ShowInfo(data, lock)
      ChangeUIController(btn, "c2", 0)
      lastItem = btn
    end)
    if i < 10 then
      btn.alpha = 0
      PlayUITrans(item, "up", nil, 0.08 * i)
    end
  end
  
  uis.Main.TabList.numItems = len
  if initIndex and uis.Main.TabList.numItems > 0 then
    local item = uis.Main.TabList:GetChildAt(initIndex)
    uis.Main.TabList:GetChildAt(initIndex).onClick:Call()
    item:GetChild("TabBtn").selected = true
    uis.Main.TabList:ScrollToView(initIndex)
  end
  uis.Main.Title.NumberTxt.text = T(1397, num, len)
  RogueMgr.ClearNewByType(ProtoEnum.ROGUE_PIC_TYPE.EVENT)
end

function RogueBookEventWindow.ShowInfo(data, lock)
  uis.Main.EventPic.LockTxt.text = T(1398)
  if data.back_ground then
    local curBackgroundObj = ResourceManager.LoadTexture(data.back_ground)
    UIUtil.SetLoaderTexture(uis.Main.EventPic.PicLoader, curBackgroundObj)
  end
  if lock then
    uis.Main.EventPic.NameTxt.text = data.des_title()
    uis.Main.EventPic.WordTxt.text = data.des_detail()
  else
    uis.Main.EventPic.NameTxt.text = T(732)
    uis.Main.EventPic.WordTxt.text = T(1398)
  end
  ChangeController(uis.Main.EventPic.c1Ctr, lock and 0 or 1)
end

function RogueBookEventWindow.GetEventData(groupId)
  local data = TableData.GetTable("BaseRogueEvent")
  local newTb = {}
  for i, v in pairs(data) do
    if v.group_id == groupId then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.sort < b.sort
  end)
  return newTb
end

function RogueBookEventWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueBookEventWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ROGUE_PIC_EVENT)
end

function RogueBookEventWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  eventData = nil
end

return RogueBookEventWindow
