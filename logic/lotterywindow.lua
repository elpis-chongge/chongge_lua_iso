require("Lottery_LotteryWindowByName")
local LotteryWindow = {}
local uis, contentPane, skipCom, curId, openLotteryId, jumpTb, curPoolId, waitFun, curTitleData, showStartChoice

function LotteryWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryWindow.package, WinResConfig.LotteryWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLottery_LotteryWindowUis(contentPane)
    openLotteryId = bridgeObj.argTable[1]
    local stepData = GuideMgr.GetStepData()
    if stepData and stepData.open_gacha_id and LotteryData.Info.openList[stepData.open_gacha_id] then
      openLotteryId = stepData.open_gacha_id
      stepData = nil
    end
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_SUMMON)
    LotteryWindow.InitBtn()
    LotteryWindow.Init()
    if waitFun then
      waitFun()
    end
    SoundUtil.PlayMusic(40006)
  end)
end

function LotteryWindow.Init()
  LotteryWindow.InitBannerList()
end

function LotteryWindow.RefreshWordTxt(data)
  local id = data.bottom_pool[1]
  local num = data.extra_time or 0
  local poolData = TableData.GetConfig(id, "BaseGachaBottomPool")
  local n = LotteryMgr.GetGachaNumber(data)
  if 1 == data.type then
    uis.Main.CardShowRegion.GaChaRegion.Word2Tips.WordTxt.text = T(1166, n, num)
    UIUtil.SetText(uis.Main.CardShowRegion.GaChaRegion.NoviceGaChaChoiceBtn, T(1455))
    showStartChoice = num <= n
    uis.Main.CardShowRegion.GaChaRegion.NoviceGaChaChoiceBtn.onClick:Set(function()
      OpenWindow(WinResConfig.LotteryStartChoiceWindow.name, nil, {
        count = n,
        id = data.id,
        max = num,
        cardIds = data.extra_card_ids
      })
    end)
  else
    showStartChoice = nil
    local tips = uis.Main.CardShowRegion.GaChaRegion.GaChaCount
    local poolInfo = LotteryData.GetGachaPool(data.id)
    if poolInfo then
      tips.WordTxt.text = poolInfo.isReach and T(1555) or T(1554)
      tips.NumberTxt.text = T(1553, poolInfo.floorCount, poolInfo.floorMax)
    end
  end
end

function LotteryWindow.SetPage(data)
  if uis.Main.CardShowRegion.CardShowList.numChildren > 0 then
    for i = 1, uis.Main.CardShowRegion.CardShowList.numItems do
      uis.Main.CardShowRegion.CardShowList:RemoveChildAt(0, true)
    end
  end
  curId = data.id
  curPoolId = data.id
  local item = UIMgr:CreateComponent("Lottery", "CardShow")
  local info = item:GetChild("CardTipsContainer")
  if data.card_ids and data.card_tips_coordinate then
    LotteryWindow.CreatedCardInfo(data.card_ids, data.card_tips_coordinate, info)
  end
  uis.Main.CardShowRegion.GaChaRegion.c1Ctr.selectedIndex = data.type
  LotteryWindow.SetGachaBtn(data.gacha_mode)
  if 2 == data.type then
    uis.Main.CardShowRegion.FunctionList.numItems = 2
  else
    uis.Main.CardShowRegion.FunctionList.numItems = 2
  end
  local holder = item:GetChild("PicHolder")
  holder.scaleX = -1
  holder:SetPivot(0.5, 0.5, true)
  holder:Center()
  local bgEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/GachaKv/FX_ui_gacha_kv.prefab", holder)
  if bgEffect then
    LuaUtil.ChangeTextureValue(bgEffect, "_MainTex", data.back_ground, "changeKV")
  end
  uis.Main.CardShowRegion.CardShowList:AddChild(item)
  LotteryWindow.RefreshWordTxt(data)
end

function LotteryWindow.SetGachaBtn(gachaMode)
  ChangeController(uis.Main.CardShowRegion.GaChaRegion.LotteryFreeTime1Ctr, 0)
  ChangeController(uis.Main.CardShowRegion.GaChaRegion.LotteryFreeTime2Ctr, 0)
  for i, v in pairs(gachaMode) do
    local data = TableData.GetConfig(v, "BaseGachaMode")
    local canDoGacha = true
    local tempGachaData = TableData.GetConfig(curId, "BaseGacha")
    if tempGachaData and tempGachaData.extra_time then
      local n = LotteryMgr.GetGachaNumber(tempGachaData)
      if n >= tempGachaData.extra_time then
        UIUtil.SetText(uis.Main.CardShowRegion.GaChaRegion.NoviceGaChaBtn, T(1459), "Word3Txt")
        ChangeUIController(uis.Main.CardShowRegion.GaChaRegion.NoviceGaChaBtn, "c1", 1)
        canDoGacha = false
      end
    else
      ChangeUIController(uis.Main.CardShowRegion.GaChaRegion.NoviceGaChaBtn, "c1", 0)
    end
    local btn
    if 1 == data.type then
      btn = uis.Main.CardShowRegion.GaChaRegion.Time1Btn
      UIUtil.SetText(btn, T(498, data.gacha_time), "Word1Txt")
      UIUtil.SetText(btn, T(901), "SubtitleTxt")
    elseif 2 == data.type then
      btn = uis.Main.CardShowRegion.GaChaRegion.Times10Btn
      UIUtil.SetText(btn, T(498, data.gacha_time), "Word1Txt")
      UIUtil.SetText(btn, T(902), "SubtitleTxt")
    elseif 3 == data.type then
      btn = uis.Main.CardShowRegion.GaChaRegion.EveryDayBtn
      UIUtil.SetText(btn, T(500), "Word1Txt")
      UIUtil.SetText(btn, T(730), "SubtitleTxt")
      UIUtil.SetText(btn, T(731), "Word3Txt")
    elseif 4 == data.type then
      btn = uis.Main.CardShowRegion.GaChaRegion.NoviceGaChaBtn
      UIUtil.SetText(btn, canDoGacha and T(499) or T(1460), "Word1Txt")
    end
    ChangeController(uis.Main.CardShowRegion.GaChaRegion.c3Ctr, 3 == data.type and 0 or 1)
    if 3 == data.type and data.day_limit_num > 0 and LotteryData.Info.dailyGachaCount[data.id] and LotteryData.Info.dailyGachaCount[data.id] >= data.day_limit_num then
      ChangeUIController(uis.Main.CardShowRegion.GaChaRegion.EveryDayBtn, "c1", 1)
    else
      ChangeUIController(uis.Main.CardShowRegion.GaChaRegion.EveryDayBtn, "c1", 0)
    end
    local arr = LotteryWindow.GetCost(data)
    if LotteryData.Info.dailyFreeCount[data.id] and LotteryData.Info.dailyFreeCount[data.id] > 0 then
      btn:GetChild("Word2Txt").text = T(567)
    else
      UIUtil.SetIconById(btn:GetChild("ItemLoader"), arr.id, true)
      btn:GetChild("Word2Txt").text = arr.value
      if LotteryData.Info.dailyFreeCount[data.id] then
        local time = math.ceil(LoginData.GetRefreshDaySecTime() / 3600)
        if time > 0 then
          if 1 == data.type then
            ChangeController(uis.Main.CardShowRegion.GaChaRegion.LotteryFreeTime2Ctr, 0)
            ChangeController(uis.Main.CardShowRegion.GaChaRegion.LotteryFreeTime1Ctr, 1)
            uis.Main.CardShowRegion.GaChaRegion.LotteryFreeTime1.WordTxt.text = T(1160, time)
          elseif 2 == data.type then
            ChangeController(uis.Main.CardShowRegion.GaChaRegion.LotteryFreeTime2Ctr, 1)
            ChangeController(uis.Main.CardShowRegion.GaChaRegion.LotteryFreeTime1Ctr, 0)
            uis.Main.CardShowRegion.GaChaRegion.LotteryFreeTime2.WordTxt.text = T(1160, time)
          end
        end
      end
    end
    btn.onClick:Set(function()
      if false == canDoGacha then
        FloatTipsUtil.ShowWarnTips(T(1461))
        return
      end
      if LotteryWindow.CheckTime() then
        return
      end
      if LotteryWindow.IsGachaByCount(data.max_num, data.day_limit_num, data.id) then
        FloatTipsUtil.ShowWarnTips(T(511))
        return
      end
      if LotteryData.Info.dailyFreeCount[data.id] and LotteryData.Info.dailyFreeCount[data.id] > 0 or ActorData.GetItemCount(arr.id) >= arr.value then
        LotteryService.DoGachaReq(data.id)
      else
        if arr.id == COMMON_ITEM_ID.BIND_DIAMOND then
          local targetArr = GetDiamondConvertValue()
          if targetArr and targetArr.value then
            local count = arr.value - ActorData.GetItemCount(arr.id)
            local num = math.ceil(count / targetArr.value)
            OpenWindow(WinResConfig.OpalExchangeWindow.name, nil, num, function()
              function waitFun()
                LotteryService.DoGachaReq(data.id)
                
                waitFun = nil
              end
            end, 996)
          end
          return
        else
          if #data.cost_change and data.cost_change[1] then
            local changeArr = Split(data.cost_change[1], ":")
            if changeArr and 3 == #changeArr then
              local id = tonumber(changeArr[2])
              local value = tonumber(changeArr[3])
              local num = arr.value - ActorData.GetItemCount(arr.id)
              if ActorData.GetItemCount(id) >= num * value then
                local costInfo = {
                  cost = {
                    id = arr.id,
                    value = arr.value
                  },
                  costChange = {id = id, value = value},
                  doGacha = true
                }
                OpenWindow(WinResConfig.LotteryComplementWindow.name, nil, costInfo, function()
                  function waitFun()
                    LotteryService.DoGachaReq(data.id)
                    
                    waitFun = nil
                  end
                end)
              else
                local costInfo = {
                  cost = {
                    id = arr.id,
                    value = arr.value
                  },
                  costChange = {id = id, value = value}
                }
                OpenWindow(WinResConfig.LotteryComplementWindow.name, nil, costInfo, function()
                  local targetArr = GetDiamondConvertValue()
                  if targetArr and targetArr.value then
                    local count = num * value - ActorData.GetItemCount(id)
                    local num = math.ceil(count / targetArr.value)
                    OpenWindow(WinResConfig.OpalExchangeWindow.name, nil, num, function()
                      function waitFun()
                        LotteryService.DoGachaReq(data.id)
                        
                        waitFun = nil
                      end
                      
                      UIMgr:CloseWindow(WinResConfig.LotteryComplementWindow.name, true, true, false)
                    end, 996)
                  end
                end)
              end
            end
          end
          return
        end
        local itemConfig = TableData.GetConfig(arr.id, "BaseItem")
        if itemConfig then
          FloatTipsUtil.ShowWarnTips(T(366, itemConfig.name()))
        end
      end
    end)
  end
end

function LotteryWindow.CheckTime()
  if LotteryData.Info.openList[curId] and -1 ~= LotteryData.Info.openList[curId] and LotteryData.Info.openList[curId] < LoginData.GetCurServerTime() then
    local gachaData = TableData.GetConfig(curId, "BaseGacha")
    local closeFun = function()
      LotteryData.curPage = 0
      LotteryWindow.InitBannerList()
    end
    local name = gachaData and gachaData.name and gachaData.name() or ""
    MessageBox.Show(T(1061, name), {touchCallback = closeFun}, nil, {touchCallback = closeFun})
    return true
  end
end

function LotteryWindow.OnShown()
  if uis and waitFun then
    waitFun()
  elseif uis and nil == waitFun and showStartChoice and 0 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.LOTTERY_EXCHANGE) then
    uis.Main.CardShowRegion.GaChaRegion.NoviceGaChaChoiceBtn.onClick:Call()
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.LOTTERY_EXCHANGE, 1)
  end
end

function LotteryWindow.IsGachaByCount(totalCount, dayCount, id)
  if -1 ~= dayCount and LotteryData.Info.dailyGachaCount and LotteryData.Info.dailyGachaCount[id] and dayCount <= LotteryData.Info.dailyGachaCount[id] then
    return true
  end
  if -1 ~= totalCount and LotteryData.Info.totalGachaCount and LotteryData.Info.totalGachaCount[id] and totalCount <= LotteryData.Info.totalGachaCount[id] then
    return true
  end
end

function LotteryWindow.GetCost(data)
  local arr = GetConfigItemList(data.cost, true)
  local num
  for i, v in ipairs(arr) do
    if ActorData.GetItemCount(v.id) >= 1 then
      return v
    else
      num = v.value
    end
  end
  if #data.cost_change and data.cost_change[1] then
    local changeArr = Split(data.cost_change[1], ":")
    if changeArr and 3 == #changeArr and num then
      return {
        id = tonumber(changeArr[2]),
        value = tonumber(changeArr[3]) * num
      }
    end
  end
end

function LotteryWindow.CreatedCardInfo(ids, pos, item)
  if #pos == #ids then
    local index = 0
    for _, id in ipairs(ids) do
      index = index + 1
      if pos[index] then
        local xy = Split(pos[index], ":")
        item:SetXY(tonumber(xy[1]), tonumber(xy[2]))
      end
      ChangeUIController(item, nil, 1)
      item.onClick:Set(function()
        OpenWindow(WinResConfig.CardPreviewWindow.name, nil, id)
      end)
    end
  end
end

function LotteryWindow.GetInfoItem(parent, index)
  local item
  if index < parent.numChildren then
    item = parent:GetChildAt(index)
  end
  if item then
    return item
  else
    item = UIMgr:CreateObject("LotteryCardShow", "CardTips")
    parent:AddChild(item)
    return item
  end
end

function LotteryWindow.GetTipsData(tb)
  local newTb = {}
  for i = 1, #tb do
    if ActorData.GetItemCount(tb[i]) > 0 or tb[i] == COMMON_ITEM_ID.BIND_DIAMOND or tb[i] == COMMON_ITEM_ID.RECHARGE_DIAMOND then
      table.insert(newTb, tb[i])
    end
  end
  return newTb
end

local ShowFreeCount = function(data, item)
  for _, vv in pairs(data.gacha_mode) do
    if LotteryData.Info.dailyFreeCount[vv] and LotteryData.Info.dailyFreeCount[vv] > 0 then
      local modeData = TableData.GetConfig(vv, "BaseGachaMode")
      if modeData then
        local freeNum = LotteryData.Info.dailyFreeCount[vv] * modeData.gacha_time
        UIUtil.SetText(item:GetChild("LotteryFree"), T(1159, freeNum), "WordTxt")
        ChangeUIController(item, "LotteryFree", 1)
      end
      return
    end
  end
  ChangeUIController(item, "LotteryFree", 0)
end

function LotteryWindow.InitBannerList()
  local lotteryData = LotteryWindow.SortGacha()
  uis.Main.CardShowRegion.BannerList.selectedIndex = -1
  
  function uis.Main.CardShowRegion.BannerList.itemRenderer(i, item)
    local data = lotteryData[i + 1]
    if data then
      item:GetChild("BannerLoader").url = UIUtil.GetResUrl(data.banner)
      item.soundFmod = SOUND_EVENT_ENUM.CARD_SELECT
      local changeCallback = function()
        uis.Main.CardShowRegion.BannerList.selectedIndex = i
        LotteryData.curPage = i
        LotteryWindow.SetPage(data)
        curTitleData = LotteryWindow.GetTipsData(data.title_show)
        UIUtil.InitAssetsTips(uis.Main.CardShowRegion.AssetsTipsGroup.AssetsTipsList, curTitleData)
      end
      item.onClick:Set(function()
        if uis.Main.CardShowRegion.BannerList.selectedIndex ~= i then
          uis.Main.CardShowRegion.root.touchable = false
          PlayUITrans(uis.Main.CardShowRegion.root, "back", function()
            uis.Main.CardShowRegion.root.touchable = true
          end):SetHook("Sign", function()
            changeCallback()
          end)
        end
      end)
      if openLotteryId then
        if data.id == openLotteryId then
          changeCallback()
          openLotteryId = nil
        end
      elseif i == LotteryData.curPage then
        changeCallback()
      end
      ShowFreeCount(data, item)
      RedDotMgr.AddNode({
        windowName = WinResConfig.LotteryWindow.name,
        com = item,
        visibleFunc = function()
          return RedDotGacha.CanFreeCoupon(data)
        end,
        dataType = RED_DOT_DATA_TYPE.GACHA
      })
    end
  end
  
  uis.Main.CardShowRegion.BannerList.numItems = #lotteryData
end

function LotteryWindow.SortGacha()
  local tempData = {}
  local curTime = LoginData.GetCurServerTime()
  for i, v in pairs(LotteryData.Info.openList) do
    if -1 == v or v > curTime then
      local data = TableData.GetConfig(i, "BaseGacha")
      table.insert(tempData, data)
    end
  end
  table.sort(tempData, function(a, b)
    if a.sort and b.sort then
      return a.sort < b.sort
    end
  end)
  return tempData
end

function LotteryWindow.IsRestrict(card_ids)
  local tb = GetConfigItemList(card_ids)
  for i, v in pairs(tb) do
    if 1 == v.value then
      return true
    end
  end
  return false
end

function LotteryWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.LotteryWindow.name, uis.Main.CardShowRegion.CurrencyReturn, FEATURE_ENUM.HOME_SUMMON)
  
  function uis.Main.CardShowRegion.FunctionList.itemRenderer(i, btn)
    UIUtil.SetBtnText(btn, T(491 + i), T(494 + i))
    btn.onClick:Set(function()
      LotteryWindow.FunctionListClick(i)
    end)
  end
  
  uis.Main.CardShowRegion.FunctionList.numItems = 2
end

function LotteryWindow.FunctionListClick(type)
  if 0 == type then
    local data = TableData.GetConfig(curId, "BaseGacha")
    local mainType
    if data and data.bottom_main_type then
      mainType = data.bottom_main_type
    end
    LotteryService.GetGachaRecordsReq(mainType and mainType or curPoolId)
  elseif 1 == type then
    OpenWindow(WinResConfig.LotteryProbabilityWindow.name, nil, curId)
  elseif 2 == type then
    OpenWindow(WinResConfig.LotteryExchangeWindow.name, nil, curId)
  end
end

function LotteryWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.LotteryWindow.UPDATE_GOLD then
    local data = TableData.GetConfig(curId, "BaseGacha")
    if data then
      LotteryWindow.SetGachaBtn(data.gacha_mode)
      LotteryWindow.RefreshWordTxt(data)
      local tempItem = uis.Main.CardShowRegion.BannerList:GetChildAt(LotteryData.curPage)
      if tempItem then
        ShowFreeCount(data, tempItem)
      end
    end
    local number = uis.Main.CardShowRegion.AssetsTipsGroup.AssetsTipsList.numChildren
    uis.Main.CardShowRegion.AssetsTipsGroup.AssetsTipsList.numItems = number
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    local data = TableData.GetConfig(curId, "BaseGacha")
    if data then
      UIUtil.InitAssetsTips(uis.Main.CardShowRegion.AssetsTipsGroup.AssetsTipsList, LotteryWindow.GetTipsData(data.title_show))
    end
  elseif msgId == WindowMsgEnum.LotteryWindow.UPDATE_LIST then
    LotteryWindow.InitBannerList()
  elseif msgId == WindowMsgEnum.LotteryWindow.HIDE then
    if contentPane then
      contentPane.visible = false
      if nil == skipCom then
        skipCom = UIMgr:CreateComponent("Lottery", "ChoiceCard")
        contentPane.parent:AddChild(skipCom)
        skipCom.size = contentPane.size
        skipCom:Center()
        local btn = skipCom:GetChild("SkipBtn")
        UIUtil.SetBtnText(btn, T(11021))
        btn.onClick:Set(function()
          if skipCom then
            skipCom.touchable = false
          end
          if btn then
            btn.visible = false
          end
          LotteryEffect.AutoClick()
        end)
      else
        skipCom.visible = true
        skipCom.alpha = 1
        local btn = skipCom:GetChild("SkipBtn")
        btn.visible = true
      end
    end
  elseif msgId == WindowMsgEnum.LotteryWindow.SHOW then
    if contentPane then
      contentPane.visible = true
      if skipCom then
        local ani = skipCom:GetChild("ChoiceNumberAni")
        ChangeUIController(skipCom, "c1", 0)
        skipCom.visible = false
      end
    end
  elseif msgId == WindowMsgEnum.LotteryWindow.UPDATE_COUNT then
    if skipCom then
      ChangeUIController(skipCom, "c1", 1)
      local ani = skipCom:GetChild("ChoiceNumberAni")
      if 1 == para then
        local num = ani:GetChild("ChoiceNumber")
        ChangeUIController(num, "c1", para - 1)
        PlayUITrans(ani, "First")
      else
        PlayUITrans(ani, "Switch"):SetHook("Sign", function()
          if skipCom then
            local num = ani:GetChild("ChoiceNumber")
            ChangeUIController(num, "c1", para - 1)
          end
        end)
      end
    end
  elseif msgId == WindowMsgEnum.LotteryWindow.HIDE_CHOICE then
    LeanTween.delayedCall(0.5, function()
      if skipCom then
        skipCom:TweenFade(0, 0.2):OnComplete(function()
          if skipCom then
            skipCom.visible = false
            skipCom.touchable = true
          end
        end)
      end
    end)
    UIMgr:SendWindowMessage(WinResConfig.GuideWindow.name, WindowMsgEnum.GuideWindow.LOTTERY_CALLBACK)
  end
end

function LotteryWindow.IsChangePage(dataGacha)
  for i, v in pairs(dataGacha.gacha_mode) do
    local data = TableData.GetConfig(v, "BaseGachaMode")
    if LotteryWindow.IsGachaByCount(data.max_num, data.day_limit_num, data.id) then
      return true
    end
  end
end

function LotteryWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.LotteryWindow.name)
  LotteryEffect.CloseLotteryScene()
  LotteryEffect.CloseCardEffect()
  uis = nil
  contentPane = nil
  skipCom = nil
  curId = nil
  openLotteryId = nil
  waitFun = nil
  curTitleData = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return LotteryWindow
