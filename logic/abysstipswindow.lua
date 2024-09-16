require("AbyssFunctionOpen_AbyssTipsWindowByName")
local AbyssTipsWindow = {}
local uis, contentPane, isAbyss, rookieFinished
local sortTb = {}
local pageIndex

function AbyssTipsWindow.ReInitData()
end

function AbyssTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssTipsWindow.package, WinResConfig.AbyssTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyssFunctionOpen_AbyssTipsWindowUis(contentPane)
    isAbyss = bridgeObj.argTable[1]
    AbyssTipsWindow.UpdateInfo()
    AbyssTipsWindow.InitBtn()
    UIMgr:ShowBlur(contentPane)
  end)
end

function AbyssTipsWindow.UpdateInfo()
  ld("AbyssExplore", function()
    AbyssExploreMgr.GetExploreInfo(function(msg)
      if msg and msg.manorInfo then
        rookieFinished = msg.manorInfo.rookieFinished
      end
      AbyssTipsWindow.ShowInfo()
    end)
  end)
end

function AbyssTipsWindow.ShowInfo()
  local tips = uis.Main.AbyssTips1
  local infoTxt = {
    [FEATURE_ENUM.ADVENTURE_BOSS] = {
      nameTitle = T(1267),
      info = {
        T(1276),
        T(1277),
        T(1278)
      },
      page = 0
    },
    [FEATURE_ENUM.FROST_DUNGEON] = {
      nameTitle = T(1500),
      info = {
        T(1501),
        T(1502),
        T(1503)
      },
      page = 3
    },
    [FEATURE_ENUM.ADVENTURE_ROGUE] = {
      nameTitle = T(1279),
      info = {
        T(1273),
        T(1274),
        T(1275)
      },
      page = 1
    },
    [FEATURE_ENUM.TIDE_DUNGEON] = {
      nameTitle = T(1323),
      info = {
        T(1324),
        T(1325),
        T(1326)
      },
      page = 2
    }
  }
  local sort = {
    [FEATURE_ENUM.ADVENTURE_BOSS] = 1,
    [FEATURE_ENUM.ADVENTURE_ROGUE] = 0,
    [FEATURE_ENUM.TIDE_DUNGEON] = 3,
    [FEATURE_ENUM.FROST_DUNGEON] = 2
  }
  local level = ActorData.GetLevel()
  sortTb = {}
  for i, v in pairs(infoTxt) do
    local data = TableData.GetConfig(i, "BaseFeature")
    if data then
      local lv = data.level or -1
      if level >= lv then
        if data.quality then
          if CardData.CanOpenBadge(data.quality) then
            v.lock = true
            table.insert(sortTb, {
              key = i,
              sortPage = sort[data.id] or 0
            })
          end
        elseif isAbyss then
          v.lock = true
          table.insert(sortTb, {
            key = i,
            sortPage = sort[data.id] or 0
          })
        elseif level == data.level then
          v.lock = true
          table.insert(sortTb, {
            key = i,
            sortPage = sort[data.id] or 0
          })
        end
      end
    end
  end
  table.sort(sortTb, function(a, b)
    return a.sortPage > b.sortPage
  end)
  local len = #sortTb
  pageIndex = tips.c1Ctr.selectedIndex + 1
  local key = sortTb[pageIndex] and sortTb[pageIndex].key
  if infoTxt[key] then
    AbyssTipsWindow.ChangeInfo(infoTxt[key], len)
  end
  ChangeController(tips.c2Ctr, isAbyss and 1 or 0)
  tips.TipsGoToBtn.onClick:Set(function()
    AbyssTipsWindow.CloseWindow()
    CurrencyReturnWindow.jumpAbyssExplore()
  end)
  tips.TipsLeftBtn.onClick:Set(function()
    local ind = pageIndex - 1
    local key = sortTb[ind] and sortTb[ind].key or 0
    local data = infoTxt[key]
    if data then
      tips.c1Ctr.selectedIndex = data.page
      pageIndex = ind
      AbyssTipsWindow.ChangeInfo(data, len)
    end
  end)
  tips.TipsRightBtn.onClick:Set(function()
    local ind = pageIndex + 1
    local key = sortTb[ind] and sortTb[ind].key or 0
    local data = infoTxt[key]
    if data then
      tips.c1Ctr.selectedIndex = data.page
      pageIndex = ind
      AbyssTipsWindow.ChangeInfo(data, len)
    end
  end)
end

function AbyssTipsWindow.ChangeInfo(data, len)
  local tips = uis.Main.AbyssTips1
  if data then
    tips.NameTxt.text = data.nameTitle
    tips.c1Ctr.selectedIndex = data.page
    local listItemName = {
      T(1270),
      T(1271),
      T(1272)
    }
    
    function tips.TipsInfoList.itemRenderer(i, item)
      UIUtil.SetText(item, data.info[i + 1], "WordTxt")
      UIUtil.SetText(item, listItemName[i + 1], "NameTxt")
    end
    
    tips.TipsInfoList.numItems = 3
    
    function tips.TipsSwitchList.itemRenderer(i, item)
      ChangeUIController(item, "c1", i == pageIndex - 1 and 1 or 0)
    end
    
    tips.TipsSwitchList.numItems = len
    tips.TipsSwitchList.visible = len > 1
    tips.TipsSign.WordTxt.text = T(1266)
    if rookieFinished then
      UIUtil.SetText(tips.TipsGoToBtn, T(1280), "WordTxt")
      tips.TipsInfo1.root.visible = false
    else
      tips.TipsInfo1.WordTxt.text = T(1268, data.nameTitle)
      UIUtil.SetText(tips.TipsGoToBtn, T(1269), "WordTxt")
      tips.TipsInfo1.root.visible = true
    end
  end
  if sortTb[pageIndex - 1] and sortTb[pageIndex - 1].key then
    tips.leftCtr.selectedIndex = 1
  else
    tips.leftCtr.selectedIndex = 0
  end
  if sortTb[pageIndex + 1] and sortTb[pageIndex + 1].key then
    tips.rightCtr.selectedIndex = 1
  else
    tips.rightCtr.selectedIndex = 0
  end
end

function AbyssTipsWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.AbyssTipsWindow.name)
end

function AbyssTipsWindow.InitBtn()
  uis.Main.AbyssTips1.TipsCloseBtn.onClick:Set(AbyssTipsWindow.CloseWindow)
end

function AbyssTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  isAbyss = nil
  rookieFinished = nil
  sortTb = {}
  pageIndex = nil
end

return AbyssTipsWindow
