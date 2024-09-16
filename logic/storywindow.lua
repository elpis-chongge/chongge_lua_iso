require("Story_StoryWindowByName")
local StoryWindow = {}
local uis, contentPane, allPlotItem, tabMainIndex, jumpTb, plotJump

function StoryWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.StoryWindow.package, WinResConfig.StoryWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetStory_StoryWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_STORY)
    plotJump = bridgeObj.argTable[1]
    tabMainIndex = plotJump or 1
    StoryMgr.InitData()
    StoryWindow.InitBtn()
  end)
end

function StoryWindow.OpenMainPlot()
  if #StoryMgr.plotData.mainData > 0 then
    tabMainIndex = #StoryMgr.plotData.mainData >= tabMainIndex and tabMainIndex or #StoryMgr.plotData.mainData
    StoryMgr.InitTab(StoryMgr.plotData.mainData, uis.Main.MainPlotReview.Tab1Region.TabBtnList, function(data)
      StoryWindow.SetPlotInfo(data, uis.Main.MainPlotReview)
    end, tabMainIndex - 1)
    return true
  end
end

function StoryWindow.SetPlotInfo(data, Com)
  local main = Com
  main.MainPlotPic.WordTxt.text = data.name()
  main.MainPlotPic.PicLoader.url = UIUtil.GetResUrl(data.icon)
  main.ReturnBtn.onClick:Set(function()
    main.c1Ctr.selectedIndex = 0
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.STORY_PLOT_ON)
  end)
  main.MainPlotPic.root.onClick:Set(function()
    if 1 ~= main.c1Ctr.selectedIndex then
      local childData = StoryMgr.GetUnlockData(data.child_ids)
      
      function main.SegmentRegion.SegmentList.itemRenderer(i, item)
        local itemData = TableData.GetConfig(childData[i + 1], "BaseStory")
        UIUtil.SetText(item, itemData.name(), "NumberTxt")
        UIUtil.SetText(item, itemData.name_detail(), "NameTxt")
        item.onClick:Set(function()
          ld("PlotPlay", function()
            LoginData.SetTimeScale(1)
            PlotPlayMgr.PlayFixedPlots(itemData.story_ids)
          end)
        end)
      end
      
      main.SegmentRegion.SegmentList.numItems = #childData
      main.c1Ctr.selectedIndex = 1
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.STORY_PLOT_OFF)
    end
  end)
  if plotJump then
    main.MainPlotPic.root.onClick:Call()
    plotJump = nil
  else
    main.c1Ctr.selectedIndex = 0
  end
end

function StoryWindow.OpenBranchPlot()
  if #StoryMgr.plotData.activityData > 0 then
    StoryMgr.InitTab(StoryMgr.plotData.activityData, uis.Main.BranchPlotReview.Tab1Region.TabBtnList, function(data)
      StoryWindow.SetPlotInfo(data, uis.Main.BranchPlotReview)
    end)
    return true
  end
end

function StoryWindow.OpenCg()
  if #StoryMgr.cgData.mainData > 0 or #StoryMgr.cgData.activityData > 0 or #StoryMgr.cgData.otherData > 0 then
    local lock = TableData.GetConfig(70011002, "BaseFixed").array_value
    local arr = Split(lock, "|")
    local tab = {
      {
        name = T(769),
        subName = T(770),
        data = StoryMgr.cgData.mainData,
        max = StoryMgr.cgData.mainMax,
        lock = StoryMgr.cgData.mainLock
      },
      {
        name = T(771),
        subName = T(772),
        data = StoryMgr.cgData.activityData,
        max = StoryMgr.cgData.activityMax,
        lock = StoryMgr.cgData.activityLock
      },
      {
        name = T(783),
        subName = T(784),
        data = StoryMgr.cgData.otherData,
        max = StoryMgr.cgData.otherMax,
        lock = StoryMgr.cgData.otherLock
      }
    }
    local showTb = {}
    for i = 1, #tab do
      if 1 == tonumber(arr[i]) then
        table.insert(showTb, tab[i])
      end
    end
    tab = showTb
    local list = uis.Main.CG.Tab2Region.TabBtnList
    local show = true
    
    function list.itemRenderer(i, item)
      UIUtil.SetBtnText(item, tab[i + 1].name, tab[i + 1].subName)
      item.onClick:Set(function()
        if #tab[i + 1].data <= 0 then
          FloatTipsUtil.ShowWarnTips(T(810, tab[i + 1].name))
          return
        end
        ChangeUIController(item, "Flag", 0)
        if list.selectedIndex ~= i then
          list.selectedIndex = i
          uis.Main.CG.CGNumber.WordTxt.text = T(785)
          uis.Main.CG.CGNumber.NumberTxt.text = T(786, table.getLen(tab[i + 1].lock), tab[i + 1].max)
          StoryWindow.LoadList(tab[i + 1].data, tab[i + 1].lock, uis.Main.CG.CGList)
        end
      end)
      if #tab[i + 1].data > 0 and show then
        show = false
        item.onClick:Call()
        list:ScrollToView(i)
      end
      RedDotMgr.AddNode({
        windowName = WinResConfig.StoryWindow.name,
        com = item,
        dataType = RED_DOT_DATA_TYPE.STORY,
        visibleFunc = function()
          return RedDotStory.CGRedDotByTypeData(tab[i + 1].data)
        end
      })
    end
    
    list.numItems = #tab
    return true
  end
end

function StoryWindow.LoadList(data, lock, list)
  local teamAllRedId = {}
  
  function list.itemRenderer(i, item)
    local btn = item:GetChild("CGIconBtn")
    local ind = i + 1
    if btn and data[ind] then
      btn.onClick:Set(function()
        ChangeUIController(btn, "Flag", 0)
        if lock[data[ind].id] then
          OpenWindow(WinResConfig.CGShowWindow.name, nil, data[ind].id)
        else
          FloatTipsUtil.ShowWarnTips(T(1154))
        end
      end)
      if lock[data[ind].id] then
        btn:GetChild("PicLoader").url = UIUtil.GetResUrl(data[ind].icon)
        UIUtil.SetBtnText(btn, data[ind].name(), data[ind].name_english())
        ChangeUIController(btn, "lock", 0)
      else
        ChangeUIController(btn, "lock", 1)
      end
      if not StoryMgr.CheckNew(data[ind].id) then
        RedDotMgr.AddNode({
          windowName = WinResConfig.StoryWindow.name,
          com = btn,
          newFlagVisibleFunc = function()
            return RedDotStory.MusicOneShowByChapterId(data[ind].id)
          end,
          dataType = RED_DOT_DATA_TYPE.STORY,
          onlyNew = true
        })
      end
      if lock[data[ind].id] and not StoryMgr.CheckNew(data[ind].id) then
        table.insert(teamAllRedId, data[ind].id)
      end
      btn.alpha = 0
      PlayUITrans(item, "up", nil, i * 0.05)
    end
  end
  
  list.numItems = #data
  if #teamAllRedId > 0 then
    StoryMgr.SaveEventNewReq(teamAllRedId)
  end
end

function StoryWindow.OpenMusic()
  if #StoryMgr.musicData > 0 then
    local list = uis.Main.Music.CoverList
    
    function list.itemRenderer(i, item)
      local data = StoryMgr.musicData[i + 1]
      if data then
        UIUtil.SetText(item, data.name())
        UIUtil.SetText(item, StoryMgr.GetMusicNum(data), "NumberTxt")
        item:GetChild("CoverLoader").url = UIUtil.GetResUrl(data.icon)
        item.onClick:Set(function()
          if list.selectedIndex ~= i then
            list.selectedIndex = i
            StoryWindow.ShowSoundItem(data)
          end
        end)
        RedDotMgr.AddNode({
          windowName = WinResConfig.StoryWindow.name,
          com = item,
          newFlagVisibleFunc = function()
            return RedDotStory.MusicShowByChapterId(data.id)
          end,
          dataType = RED_DOT_DATA_TYPE.STORY,
          onlyNew = true
        })
      end
    end
    
    list.numItems = #StoryMgr.musicData
    uis.Main.Music.ReturnBtn.onClick:Set(function()
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
      uis.Main.Music.c1Ctr.selectedIndex = 0
      PlayUITrans(uis.Main.Music.root, "CoverListIn")
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.STORY_MUSIC_OFF)
      list.scrollPane.onScroll:Call()
    end)
    uis.Main.Music.c1Ctr.selectedIndex = 0
    StoryWindow.SetNewOnScroll(list, uis.Main.Music.ListLeftCtr, uis.Main.Music.ListCtr, 2)
    return true
  end
end

function StoryWindow.ShowSoundItem(data)
  UIUtil.SetText(uis.Main.Music.CoverBtn, data.name())
  uis.Main.Music.CoverBtn:GetChild("CoverLoader").url = UIUtil.GetResUrl(data.icon)
  local childData = SimpleCopy(data.child_ids)
  table.sort(childData, function(a, b)
    if StoryMgr.storyList[a] and not StoryMgr.storyList[b] then
      return true
    elseif not StoryMgr.storyList[a] and StoryMgr.storyList[b] then
      return false
    end
  end)
  local teamAllRedId = {}
  local list = uis.Main.Music.SongNameRegion.SongNameList
  
  function list.itemRenderer(i, item)
    local songNameBtn = item:GetChild("SongNameBtn")
    local itemData = TableData.GetConfig(childData[i + 1], "BaseSound")
    if itemData then
      UIUtil.SetText(songNameBtn, itemData.name(), "NameTxt")
      if StoryMgr.storyList[childData[i + 1]] then
        item.onClick:Set(function()
          ChangeUIController(songNameBtn, "Flag", 0)
          OpenWindow(WinResConfig.MusicPlayWindow.name, nil, {chapterData = data, curSoundData = itemData})
        end)
        ChangeUIController(songNameBtn, "lock", 0)
        if StoryMgr.CheckNewStoryList(childData[i + 1]) and not StoryMgr.CheckNew(childData[i + 1]) then
          ChangeUIController(songNameBtn, "Flag", 1)
          table.insert(teamAllRedId, childData[i + 1])
        else
          ChangeUIController(songNameBtn, "Flag", 0)
        end
      else
        ChangeUIController(songNameBtn, "Flag", 0)
        item.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(T(1153))
        end)
        ChangeUIController(songNameBtn, "lock", 1)
      end
    end
    songNameBtn.alpha = 0
    PlayUITrans(item, "up", nil, i * 0.08)
  end
  
  list.numItems = #childData
  list.scrollPane.posY = 0
  uis.Main.Music.c1Ctr.selectedIndex = 1
  PlayUITrans(uis.Main.Music.root, "CoverListOut")
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.STORY_MUSIC_ON)
  if #teamAllRedId > 0 then
    StoryMgr.SaveEventNewReq(teamAllRedId)
  end
end

function StoryWindow.GetMonsterCamp()
  local t = {}
  local camp = TableData.GetTable("BaseStoryMonsterCamp")
  for i, v in pairs(camp) do
    table.insert(t, v)
  end
  if #t > 1 then
    table.sort(t, function(a, b)
      return a.sort < b.sort
    end)
  end
  return t
end

function StoryWindow.OpenMonster()
  local campData = StoryWindow.GetMonsterCamp()
  uis.Main.Monster.c1Ctr.selectedIndex = 0
  
  function uis.Main.Monster.MonsterList.itemRenderer(i, item)
    local ind = i + 1
    local data, num = StoryMgr.GetMonsterDataByCampId(campData[ind].id)
    UIUtil.SetBtnText(item, campData[ind].name(), campData[ind].name_english())
    UIUtil.SetText(item, num, "NumberTxt")
    item:GetChild("PicLoader").url = UIUtil.GetResUrl(campData[ind].icon)
    item.onClick:Set(function()
      uis.Main.Monster.c1Ctr.selectedIndex = 1
      PlayUITrans(uis.Main.Monster.root, "out")
      StoryWindow.ShowMonsterInfo(data)
    end)
    RedDotMgr.AddNode({
      windowName = WinResConfig.StoryWindow.name,
      com = item,
      newFlagVisibleFunc = function()
        return RedDotStory.MonsterByCamp(campData[ind].id)
      end,
      dataType = RED_DOT_DATA_TYPE.STORY,
      onlyNew = true
    })
  end
  
  uis.Main.Monster.MonsterList.numItems = #campData
  StoryWindow.SetNewOnScroll(uis.Main.Monster.MonsterList, uis.Main.Monster.ListLeftCtr, uis.Main.Monster.ListCtr, 3)
  uis.Main.Monster.MonsterInfo.ReturnBtn.onClick:Set(function()
    uis.Main.Monster.c1Ctr.selectedIndex = 0
    PlayUITrans(uis.Main.Monster.root, "in")
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
    uis.Main.Monster.MonsterList.scrollPane.onScroll:Call()
  end)
  uis.Main.Monster.MonsterInfo.MonsterTitle.WordTxt.text = T(797)
  return true
end

function StoryWindow.SetNewOnScroll(list, leftCtr, rightCtr, pageNum)
  if pageNum < list.numChildren then
    local flagCtr = {}
    local flagItem = {}
    for i = 0, list.numChildren - 1 do
      local children = list:GetChildAt(i)
      table.insert(flagCtr, children:GetController("Flag"))
      table.insert(flagItem, children:GetChild("New"))
    end
    local startPos = list.x
    local endPos = list.x + list.width
    local v2, left, right
    list.scrollPane.onScroll:Set(function()
      left, right = false, false
      for i = 1, #flagItem do
        if 1 == flagCtr[i].selectedIndex then
          v2 = flagItem[i]:LocalToRoot(Vector2.zero, GRoot.inst.root)
          if v2.x < startPos then
            left = true
          end
          if v2.x > endPos then
            right = true
          end
        end
      end
      ChangeController(leftCtr, left and 1 or 0)
      ChangeController(rightCtr, right and 1 or 0)
    end)
    LeanTween.delayedCall(0.1, function()
      if uis then
        list.scrollPane.onScroll:Call()
      end
    end)
  else
    ChangeController(rightCtr, 0)
    ChangeController(leftCtr, 0)
  end
end

function StoryWindow.ShowMonsterInfo(data)
  local info = uis.Main.Monster.MonsterInfo
  local tab = {
    {
      name = T(789),
      subName = T(790),
      data = data[1]
    },
    {
      name = T(791),
      subName = T(792),
      data = data[2]
    },
    {
      name = T(793),
      subName = T(794),
      data = data[3]
    },
    {
      name = T(795),
      subName = T(796),
      data = data[4]
    }
  }
  for i = #tab, 1, -1 do
    if tab[i].data and #tab[i].data < 1 or tab[i].data == nil then
      table.remove(tab, i)
    end
  end
  local func = function(monsterData)
    local showInfo = false
    local tempAllRedId = {}
    
    function info.HeadList.itemRenderer(i, item)
      local ind = i + 1
      if monsterData[ind].lock then
        showInfo = true
        ChangeUIController(item, "lock", 0)
        UIUtil.SetText(item, monsterData[ind].name())
        item:GetChild("MonsterHeadBg"):GetChild("PicLoader").url = UIUtil.GetResUrl(monsterData[ind].icon)
      else
        ChangeUIController(item, "lock", 1)
      end
      item.onClick:Set(function()
        if not monsterData[ind].lock then
          FloatTipsUtil.ShowWarnTips(T(1151))
          return
        end
        if i > 0 then
          ChangeUIController(info.HeadList:GetChildAt(0), "Flag", 0)
        end
        ChangeUIController(item, "Flag", 0)
        if info.HeadList.selectedIndex ~= i then
          if -1 ~= info.HeadList.selectedIndex and monsterData[ind].lock then
            PlayUITrans(uis.Main.Monster.MonsterInfo.root, "change")
          end
          if monsterData[ind].lock then
            info.HeadList.selectedIndex = i
            LeanTween.delayedCall(0.2, function()
              StoryWindow.InitInfoWord(monsterData[ind])
            end)
          end
        end
      end)
      if 0 == i then
        if monsterData[ind].lock then
          if info.HeadList.selectedIndex ~= i then
            info.HeadList.selectedIndex = i
          end
          StoryWindow.InitInfoWord(monsterData[ind])
          ChangeUIController(item, "Flag", 0)
        else
          info.HeadList.selectedIndex = -1
        end
      end
      if RedDotStory.MonsterOneLock(monsterData[ind].id) then
        table.insert(tempAllRedId, monsterData[ind].id)
        ChangeUIController(item, "Flag", 1)
      else
        ChangeUIController(item, "Flag", 0)
      end
    end
    
    info.HeadList.numItems = #monsterData
    info.MonsterInfoWord.root.visible = showInfo
    if #tempAllRedId > 0 then
      StoryMgr.SaveEventNewReq(tempAllRedId)
    end
  end
  local select = true
  info.Tab2Region.TabBtnList.selectedIndex = -1
  info.HeadList.selectedIndex = -1
  
  function info.Tab2Region.TabBtnList.itemRenderer(i, item)
    UIUtil.SetBtnText(item, tab[i + 1].name, tab[i + 1].subName)
    item.onClick:Set(function()
      if tab[i + 1].data == nil or #tab[i + 1].data <= 0 then
        FloatTipsUtil.ShowWarnTips(T(809))
        return
      end
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
      local red = item:GetChild("Red")
      if red then
        red.visible = false
      end
      if info.Tab2Region.TabBtnList.selectedIndex ~= i then
        info.Tab2Region.TabBtnList.selectedIndex = i
        func(tab[i + 1].data)
      end
    end)
    if select and tab[i + 1].data and #tab[i + 1].data > 0 then
      select = false
      item.onClick:Call()
    else
      RedDotMgr.AddNode({
        windowName = WinResConfig.StoryWindow.name,
        com = item,
        visibleFunc = function()
          return RedDotStory.MonsterRedDot(tab[i + 1].data)
        end,
        dataType = RED_DOT_DATA_TYPE.STORY
      })
    end
  end
  
  info.Tab2Region.TabBtnList.numItems = #tab
end

function StoryWindow.InitInfoWord(data)
  local list = uis.Main.Monster.MonsterInfo.MonsterInfoWord.InfoList
  for i = 1, list.numItems do
    list:RemoveChildAt(0, true)
  end
  local tips
  tips = UIMgr:CreateObject("Story", "Info1")
  UIUtil.SetText(tips, data.name())
  list:AddChild(tips)
  tips = UIMgr:CreateObject("Story", "Info2")
  UIUtil.SetText(tips, T(787))
  UIUtil.SetText(tips:GetChild("Level"), data.level(), "WordTxt")
  list:AddChild(tips)
  local arg = {
    "atk",
    "def",
    "max_hp"
  }
  local wordText = {
    T(923),
    T(924),
    T(925)
  }
  for i = 1, 3 do
    tips = UIMgr:CreateObject("Story", "Info3")
    ChangeUIController(tips, "c1", i - 1)
    UIUtil.SetText(tips, wordText[i], "WordTxt")
    if data[arg[i]] then
      UIUtil.SetText(tips, data[arg[i]](), "LevelTxt")
    end
    list:AddChild(tips)
  end
  local wordTxt = {
    T(788),
    T(919),
    T(920)
  }
  for i = 1, #data.des do
    tips = UIMgr:CreateObject("Story", "Info4")
    if wordTxt[i] then
      UIUtil.SetText(tips, wordTxt[i], "TitleTxt")
    end
    UIUtil.SetText(tips, T(data.des[i]), "WordTxt")
    list:AddChild(tips)
  end
  list:ScrollToView(0)
end

function StoryWindow.OpenWord()
end

function StoryWindow.OpenItemInfo()
  if nil == allPlotItem then
    allPlotItem = StoryMgr.GetPlotItem()
  end
  uis.Main.Item.MonsterTitle.WordTxt.text = T(798)
  local itemWord = function(data)
    local list = uis.Main.Item.ItemInfo.InfoList
    for i = 1, list.numItems do
      list:RemoveChildAt(0, true)
    end
    local tips = UIMgr:CreateObject("Story", "ItemInfoWord")
    UIUtil.SetText(tips, data.name(), "NameTxt")
    UIUtil.SetText(tips, data.remark(), "WordTxt")
    local btn = tips:GetChild("ItemUseBtn")
    btn.visible = false
    if data.effect_value then
      local id = tonumber(data.effect_value)
      if id and btn then
        btn.onClick:Set(function()
          ld("PlotPlay", function()
            LoginData.SetTimeScale(1)
            PlotPlayMgr.PlayPlot(id, nil, nil, nil, true)
          end)
        end)
        btn.visible = true
      end
    end
    list:AddChild(tips)
  end
  local teamAllRedId = {}
  local info = uis.Main.Item
  info.ItemList.selectedIndex = -1
  
  function info.ItemList.itemRenderer(i, item)
    local ind = i + 1
    local lock = ActorData.GetItemCount(allPlotItem[ind].id) > 0
    if lock then
      UIUtil.SetText(item, allPlotItem[ind].name())
      item:GetChild("ItemLoader").url = UIUtil.GetResUrl(allPlotItem[ind].icon)
      ChangeUIController(item, "lock", 0)
    else
      ChangeUIController(item, "lock", 1)
    end
    item.onClick:Set(function()
      if i > 0 then
        ChangeUIController(info.ItemList:GetChildAt(0), "Flag", 0)
      end
      ChangeUIController(item, "Flag", 0)
      if info.ItemList.selectedIndex ~= i then
        if lock then
          info.ItemList.selectedIndex = i
          itemWord(allPlotItem[ind])
        else
          FloatTipsUtil.ShowWarnTips(T(1152))
        end
      end
    end)
    if 0 == i and lock then
      item.onClick:Call()
    end
    if RedDotStory.ItemOneLock(allPlotItem[ind].id) then
      ChangeUIController(item, "Flag", 1)
      table.insert(teamAllRedId, allPlotItem[ind].id)
    else
      ChangeUIController(item, "Flag", 0)
    end
  end
  
  info.ItemList.numItems = #allPlotItem
  if #teamAllRedId > 0 then
    StoryMgr.SaveEventNewReq(teamAllRedId)
  end
  return true
end

function StoryWindow.InitBtn()
  local lock = TableData.GetConfig(70011001, "BaseFixed").array_value
  local arr = Split(lock, "|")
  local tab = {
    {
      name = T(769),
      subName = T(770),
      ctr = 0,
      func = StoryWindow.OpenMainPlot,
      show = function()
        return #StoryMgr.plotData.mainData > 0
      end
    },
    {
      name = T(771),
      subName = T(772),
      ctr = 1,
      func = StoryWindow.OpenBranchPlot,
      show = function()
        return #StoryMgr.plotData.activityData > 0
      end
    },
    {
      name = T(773),
      subName = T(774),
      ctr = 2,
      func = StoryWindow.OpenCg,
      show = function()
        if #StoryMgr.cgData.mainData > 0 or #StoryMgr.cgData.activityData > 0 or #StoryMgr.cgData.otherData > 0 then
          return true
        end
      end,
      visibleFunc = function()
        return RedDotStory.CGRedDotByTypeData(TableData.GetTable("BaseStoryCg"))
      end
    },
    {
      name = T(775),
      subName = T(776),
      ctr = 3,
      func = StoryWindow.OpenMusic,
      show = function()
        return #StoryMgr.musicData > 0
      end,
      visibleFunc = function()
        return RedDotStory.MusicRedDot(TableData.GetTable("BaseSound"))
      end
    },
    {
      name = T(777),
      subName = T(778),
      ctr = 4,
      func = StoryWindow.OpenWord,
      show = function()
        return true
      end
    },
    {
      name = T(779),
      subName = T(780),
      ctr = 5,
      func = StoryWindow.OpenMonster,
      show = function()
        return #StoryMgr.monsterIds > 0
      end,
      visibleFunc = function()
        return RedDotStory.MonsterRedDot(TableData.GetTable("BaseStoryMonster"))
      end
    },
    {
      name = T(781),
      subName = T(782),
      ctr = 6,
      func = StoryWindow.OpenItemInfo,
      show = function()
        return true
      end,
      visibleFunc = function()
        return RedDotStory.ItemRedDot()
      end
    }
  }
  local showTb = {}
  for i = 1, #tab do
    if 1 == tonumber(arr[i]) then
      table.insert(showTb, tab[i])
    end
  end
  tab = showTb
  local lastIndex = uis.Main.c1Ctr.selectedIndex
  
  function uis.Main.TabRegion.TabList.itemRenderer(i, item)
    UIUtil.SetBtnText(item, tab[i + 1].name, tab[i + 1].subName)
    item.soundFmod = SOUND_EVENT_ENUM.TAB_TAG1
    item.onClick:Set(function()
      if i ~= uis.Main.TabRegion.TabList.selectedIndex then
        local open = tab[i + 1].func()
        if open then
          uis.Main.c1Ctr.selectedIndex = tab[i + 1].ctr
          uis.Main.TabRegion.TabList.selectedIndex = i
          if 5 == lastIndex and 1 == uis.Main.Monster.c1Ctr.selectedIndex then
            LeanTween.delayedCall(0.3, function()
              if uis then
                uis.Main.Monster.c1Ctr.selectedIndex = 0
                PlayUITransToComplete(uis.Main.Monster.root, "in")
              end
            end)
          end
          if 3 == lastIndex and 1 == uis.Main.Music.c1Ctr.selectedIndex then
            LeanTween.delayedCall(0.3, function()
              if uis then
                uis.Main.Music.c1Ctr.selectedIndex = 0
                PlayUITransToComplete(uis.Main.Music.root, "CoverListIn")
              end
            end)
          end
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
          lastIndex = uis.Main.c1Ctr.selectedIndex
        end
      end
    end)
    ChangeUIController(item, "c1", tab[i + 1].ctr)
    if tab[i + 1].visibleFunc then
      RedDotMgr.AddNode({
        windowName = WinResConfig.StoryWindow.name,
        com = item,
        visibleFunc = tab[i + 1].visibleFunc,
        dataType = RED_DOT_DATA_TYPE.STORY
      })
    end
    if 0 == i then
      item.onClick:Call()
    end
  end
  
  uis.Main.TabRegion.TabList.numItems = #tab
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.StoryWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_STORY, function()
    if 1 == uis.Main.Music.c1Ctr.selectedIndex and 3 == uis.Main.c1Ctr.selectedIndex then
      uis.Main.Music.c1Ctr.selectedIndex = 0
      uis.Main.Music.CoverList.scrollPane.onScroll:Call()
      PlayUITrans(uis.Main.Music.root, "CoverListIn")
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
    elseif 1 == uis.Main.MainPlotReview.c1Ctr.selectedIndex and 0 == uis.Main.c1Ctr.selectedIndex or 1 == uis.Main.c1Ctr.selectedIndex then
      uis.Main.MainPlotReview.c1Ctr.selectedIndex = 0
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
    elseif 1 == uis.Main.Monster.c1Ctr.selectedIndex and 5 == uis.Main.c1Ctr.selectedIndex then
      uis.Main.Monster.c1Ctr.selectedIndex = 0
      uis.Main.Monster.MonsterList.scrollPane.onScroll:Call()
      PlayUITrans(uis.Main.Monster.root, "in")
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
    else
      UIMgr:CloseWindow(WinResConfig.StoryWindow.name)
    end
  end)
end

function StoryWindow.HandleMessage(msgId, para)
end

function StoryWindow.OnShown()
end

function StoryWindow.OnClose()
  uis = nil
  contentPane = nil
  allPlotItem = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  RedDotMgr.RemoveNode(WinResConfig.StoryWindow.name)
end

return StoryWindow
