require("RogueBuild01_BookEndWindowByName")
local RogueBookEndWindow = {}
local uis, contentPane, jumpTb, endingData

function RogueBookEndWindow.ReInitData()
end

function RogueBookEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueBookEndWindow.package, WinResConfig.RogueBookEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_BookEndWindowUis(contentPane)
    local groupId = bridgeObj.argTable[1]
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_PIC_ENDING)
    endingData = RogueBookEndWindow.GetEndingData(groupId)
    RogueBookEndWindow.UpdateInfo()
    RogueBookEndWindow.InitBtn()
  end)
end

function RogueBookEndWindow.UpdateInfo()
  local picInfo = RogueData.GetPicInfoBuyType(ProtoEnum.ROGUE_PIC_TYPE.ENDING)
  local initIndex
  
  function uis.Main.TabList.itemRenderer(i, item)
    local data = endingData[i + 1]
    local lock = false
    if picInfo and picInfo.picId2States[data.id] ~= nil then
      ChangeUIController(item, "c1", 0)
      UIUtil.SetText(item, data.name())
      lock = true
      if nil == initIndex then
        initIndex = i
      end
    else
      UIUtil.SetText(item:GetChild("Lock"), T(1439))
      ChangeUIController(item, "c1", 1)
    end
    ChangeUIController(item, "c2", picInfo and picInfo.picId2States[data.id] and 1 or 0)
    
    function item.testEnableOnClick()
      if false == lock then
        FloatTipsUtil.ShowWarnTips(T(1469))
      end
      return lock
    end
    
    item.onClick:Set(function()
      if uis.Main.TabList.selectedIndex ~= i then
        uis.Main.TabList.selectedIndex = i
        RogueBookEndWindow.ShowInfo(data, lock)
      end
      ChangeUIController(item, "c2", 0)
    end)
  end
  
  uis.Main.TabList.numItems = #endingData
  if initIndex and uis.Main.TabList.numItems > 0 then
    local item = uis.Main.TabList:GetChildAt(initIndex)
    uis.Main.TabList:GetChildAt(initIndex).onClick:Call()
    uis.Main.TabList:ScrollToView(initIndex)
  end
  RogueMgr.ClearNewByType(ProtoEnum.ROGUE_PIC_TYPE.ENDING)
end

function RogueBookEndWindow.ShowInfo(data, lock)
  local tips = uis.Main.Word
  if lock then
    tips.WordTxt.text = data.des_detail()
    tips.NameTxt.text = data.des_title()
  else
    tips.NameTxt.text = T(732)
    tips.WordTxt.text = T(1439)
  end
  if data.back_ground then
    local curBackgroundObj = ResourceManager.LoadTexture(data.back_ground)
    UIUtil.SetLoaderTexture(tips.PicLoader, curBackgroundObj)
  end
  tips.LookBtn.onClick:Set(function()
    if lock then
      OpenWindow(WinResConfig.RogueGameEndingWindow.name, nil, data.id)
    end
  end)
end

function RogueBookEndWindow.GetEndingData(groupId)
  local data = TableData.GetTable("BaseRogueEnding")
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

function RogueBookEndWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueBookEndWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ROGUE_PIC_ENDING)
end

function RogueBookEndWindow.OnClose()
  uis = nil
  contentPane = nil
  endingData = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return RogueBookEndWindow
