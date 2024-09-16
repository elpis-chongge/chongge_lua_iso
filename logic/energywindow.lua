require("EnergyObtain_EnergyWindowByName")
local EnergyWindow = {}
local uis, contentPane, bgPrefab, middle_press, red_screen, line, press, spine, itemNum, cost, reward, getEnergy
local costId = {}
local itemUid = {}
local costData, curIndex
local energyNum = {}
local maskImage, downTime, energyMax, longPressStop, isMax, tween, itemEffect, jumpTb

function EnergyWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.EnergyWindow.package, WinResConfig.EnergyWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetEnergyObtain_EnergyWindowUis(contentPane)
    EnergyWindow.GetCostIds()
    EnergyWindow.InitBgPrefab()
    EnergyWindow.InitBtn()
    EnergyWindow.InitUI()
  end)
end

function EnergyWindow.GetEnergyMax()
  local config = TableData.GetConfig(70010003, "BaseFixed")
  return config.int_value
end

function EnergyWindow.GetCostIds()
  local id = {
    70010040,
    70010041,
    70010042
  }
  costId = {}
  for i = 1, #id do
    local config = TableData.GetConfig(id[i], "BaseFixed")
    if config and config.array_value then
      local arr = Split(config.array_value, "|")
      costId[i] = {}
      for ind = 1, #arr do
        table.insert(costId[i], tonumber(arr[ind]))
      end
    end
  end
end

function EnergyWindow.InitBgPrefab()
  bgPrefab = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Reason/FX_ui_tili.prefab")
  local curSceneCamera = bgPrefab:GetComponentInChildren(typeof(Camera), true)
  curSceneCamera.gameObject:GetOrAddComponent(typeof(CS.AutoAdaptScreen))
  middle_press = bgPrefab.transform:Find("FX_ui_tili_middle_press")
  middle_press.gameObject:SetActive(false)
  red_screen = bgPrefab.transform:Find("FX_ui_tili_redscreen")
  spine = bgPrefab.transform:Find("ui_reson").gameObject
  line = {}
  for i = 1, 3 do
    line[i] = bgPrefab.transform:Find("FX_ui_tili_line" .. i)
    line[i].gameObject:SetActive(false)
  end
  press = {}
  for i = 1, 3 do
    press[i] = bgPrefab.transform:Find("FX_ui_tili_press_" .. i)
    press[i].gameObject:SetActive(false)
  end
  EnergyWindow.SetEnergyAlpha(0)
  SkeletonAnimationUtil.SetAnimation(spine, 1, "idle", true)
  SkeletonAnimationUtil.SetAnimation(spine, 2, "idle", true)
  SkeletonAnimationUtil.SetAnimation(spine, 3, "idle", true)
  UIMgr:PlayAlphaChangeAnimIn(bgPrefab)
end

function EnergyWindow.StopTween()
  if tween then
    LeanTween.cancel(tween.uniqueId)
    tween = nil
  end
end

function EnergyWindow.SetEnergyAlpha(interval)
  local red = EnergyData.info.curEnergy / EnergyData.info.energyRecoverLimit
  if interval > 0 then
    EnergyWindow.StopTween()
    local a = LuaUtil.GetEnergyAlpha(red_screen.gameObject)
    local targetNum = Mathf.Lerp(0.45, 0, red)
    tween = LeanTween.value(a, targetNum, interval):setOnUpdate(function(val)
      LuaUtil.SetEnergyAlpha(red_screen.gameObject, val)
    end):setOnComplete(function()
      LuaUtil.SetEnergyAlpha(red_screen.gameObject, targetNum)
      tween = nil
    end)
  else
    LuaUtil.SetEnergyAlpha(red_screen.gameObject, Mathf.Lerp(0.45, 0, red))
  end
end

function EnergyWindow.Split(str)
  local arr = Split(str, ":")
  if 3 == #arr then
    return {
      type = tonumber(arr[1]),
      id = tonumber(arr[2]),
      value = tonumber(arr[3])
    }
  end
end

function EnergyWindow.GetIdByPos(pos)
  local allId = costId[pos]
  for i, v in ipairs(allId) do
    local count, uid = ActorData.GetItemCountByExpire(v)
    if 1 == pos then
      return {
        id = v,
        count = count,
        uid = uid
      }
    elseif count > 0 then
      return {
        id = v,
        count = count,
        uid = uid
      }
    end
  end
end

function EnergyWindow.ShowItem()
  local idArr = EnergyWindow.GetIdByPos(1)
  if idArr then
    itemUid[1] = {
      id = idArr.id,
      uid = idArr.uid
    }
    costData = TableData.GetConfig(idArr.id, "BaseItem")
    UIUtil.SetIconById(uis.Main.EnergyBuy.EnergyItemBtn:GetChild("PicLoader"), idArr.id)
    UIUtil.SetText(uis.Main.EnergyBuy.EnergyItemBtn, ActorData.GetItemCount(idArr.id), "NumberTxt")
    UIUtil.SetText(uis.Main.EnergyBuy.EnergyItemBtn, T(817, EnergyData.info.maxBuyTimes - EnergyData.info.curBuyTimes, EnergyData.info.maxBuyTimes), "LimitTxt")
    ChangeUIController(uis.Main.EnergyBuy.EnergyItemBtn, "c1", 0)
    uis.Main.EnergyBuy.EnergyItemBtn.onClick:Set(function()
      EnergyWindow.AddItemClick(1, uis.Main.EnergyBuy, idArr)
    end)
    EnergyWindow.SetLongPressGesture(1, uis.Main.EnergyBuy, idArr)
  end
  energyNum = {}
  local SetEnergyNum = function(id)
    local data = TableData.GetConfig(id, "BaseItem")
    if data.view_item and data.view_item[1] then
      local arr = Split(data.view_item[1], ":")
      if arr[2] and arr[3] and tonumber(arr[2]) == COMMON_ITEM_ID.ENERGY then
        energyNum[id] = tonumber(arr[3])
      end
    end
  end
  local idArr2 = EnergyWindow.GetIdByPos(2)
  if idArr2 then
    itemUid[2] = {
      id = idArr2.id,
      uid = idArr2.uid
    }
    SetEnergyNum(idArr2.id)
    UIUtil.SetIconById(uis.Main.ItemUse1.EnergyItemBtn:GetChild("PicLoader"), idArr2.id)
    uis.Main.c2Ctr.selectedIndex = 1
    UIUtil.SetText(uis.Main.ItemUse1.EnergyItemBtn, idArr2.count, "NumberTxt")
    ChangeUIController(uis.Main.ItemUse1.EnergyItemBtn, "c1", 1)
    EnergyWindow.ShowDay(ActorData.GetItemInfoByUid(idArr2.uid), uis.Main.ItemUse1.EnergyItemBtn)
    uis.Main.ItemUse1.EnergyItemBtn.onClick:Set(function()
      EnergyWindow.AddItemClick(2, uis.Main.ItemUse1, idArr2)
    end)
    EnergyWindow.SetLongPressGesture(2, uis.Main.ItemUse1, idArr2)
  else
    uis.Main.c2Ctr.selectedIndex = 0
    EnergyWindow.SetAlpha(maskImage[2], 0)
    SkeletonAnimationUtil.SetAnimation(spine, 2, "hide2", false)
  end
  local idArr3 = EnergyWindow.GetIdByPos(3)
  if idArr3 then
    itemUid[3] = {
      id = idArr3.id,
      uid = idArr3.uid
    }
    SetEnergyNum(idArr3.id)
    UIUtil.SetIconById(uis.Main.ItemUse2.EnergyItemBtn:GetChild("PicLoader"), idArr3.id)
    uis.Main.c3Ctr.selectedIndex = 1
    UIUtil.SetText(uis.Main.ItemUse2.EnergyItemBtn, idArr3.count, "NumberTxt")
    EnergyWindow.ShowDay(ActorData.GetItemInfoByUid(idArr3.uid), uis.Main.ItemUse2.EnergyItemBtn)
    uis.Main.ItemUse2.EnergyItemBtn.onClick:Set(function()
      EnergyWindow.AddItemClick(3, uis.Main.ItemUse2, idArr3)
    end)
    ChangeUIController(uis.Main.ItemUse2.EnergyItemBtn, "c1", 1)
    EnergyWindow.SetLongPressGesture(3, uis.Main.ItemUse2, idArr3)
  else
    uis.Main.c3Ctr.selectedIndex = 0
    EnergyWindow.SetAlpha(maskImage[3], 0)
    SkeletonAnimationUtil.SetAnimation(spine, 3, "hide3", false)
  end
end

function EnergyWindow.InitUI()
  itemNum = {}
  maskImage = {}
  energyMax = EnergyWindow.GetEnergyMax()
  local maskName = {
    "AImage",
    "BImage",
    "CImage"
  }
  for i = 1, 3 do
    maskImage[i] = uis.Main.root:GetChild(maskName[i])
    maskImage[i].alpha = 0
    maskImage[i].visible = true
  end
  EnergyWindow.ShowItem()
  uis.Main.EnergyMunber.WordTxt.text = T(830, EnergyData.info.curEnergy, EnergyData.info.energyRecoverLimit)
  UIUtil.SetBtnText(uis.Main.UseBtn, T(818), T(819))
  local btn = {
    uis.Main.EnergyBuy.CleanBtn,
    uis.Main.ItemUse1.CleanBtn,
    uis.Main.ItemUse2.CleanBtn
  }
  for i = 1, #btn do
    btn[i].soundFmod = SOUND_EVENT_ENUM.ENERGY_CANCEL
    btn[i].onClick:Set(function()
      EnergyWindow.CleanItemClick(i)
    end)
    UIUtil.SetBtnText(btn[i], T(821), T(822))
  end
  EnergyWindow.UpdateTime()
  itemEffect = {}
  local holder = {
    uis.Main.EnergyBuy.EffectHolder,
    uis.Main.ItemUse1.EffectHolder,
    uis.Main.ItemUse2.EffectHolder
  }
  for i = 1, 3 do
    itemEffect[i] = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Reason/FX_ui_tili_additem.prefab", holder[i])
    holder[i].visible = false
  end
end

function EnergyWindow.UpdateTime()
  EnergyWindow.InitTime()
  local curTime = LoginData.GetCurServerTime()
  if EnergyData.info.recoverDoneStamp - curTime > 0 then
    uis.Main.EnergyMunber.c1Ctr.selectedIndex = 1
    local time = EnergyData.info.recoverDoneStamp - curTime
    uis.Main.EnergyMunber.RecoveryTime1.WordTxt.text = T(815, EnergyWindow.FormatTime(time))
    downTime[1] = TimerUtil.new(1, time, function(timer, tickTime)
      uis.Main.EnergyMunber.RecoveryTime1.WordTxt.text = T(815, EnergyWindow.FormatTime(time - tickTime))
    end, function()
      uis.Main.EnergyMunber.RecoveryTime1.WordTxt.text = ""
    end)
    downTime[1]:start()
  else
    uis.Main.EnergyMunber.c1Ctr.selectedIndex = 0
  end
  if EnergyData.info.nextRecoverStamp - curTime > 0 then
    uis.Main.EnergyMunber.c2Ctr.selectedIndex = 1
    local time = EnergyData.info.nextRecoverStamp - curTime
    uis.Main.EnergyMunber.RecoveryTime2.WordTxt.text = T(814, EnergyWindow.FormatTime(time))
    downTime[2] = TimerUtil.new(1, time, function(timer, tickTime)
      uis.Main.EnergyMunber.RecoveryTime2.WordTxt.text = T(814, EnergyWindow.FormatTime(time - tickTime))
    end, function()
      uis.Main.EnergyMunber.RecoveryTime2.WordTxt.text = ""
    end)
    downTime[2]:start()
  else
    uis.Main.EnergyMunber.c2Ctr.selectedIndex = 0
  end
end

function EnergyWindow.SetLongPressGesture(index, itemCom, idArr)
  local gesture = LongPressGesture.GetLongPressGesture(itemCom.EnergyItemBtn)
  gesture.trigger = 0.3
  gesture.interval = 0.5
  gesture.onAction:Set(function()
    if longPressStop then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ENERGY_ADD)
      EnergyWindow.AddItemClick(index, itemCom, idArr)
    end
  end)
  gesture.onBegin:Set(function()
    longPressStop = true
  end)
end

function EnergyWindow.FormatTime(time)
  local mathFloor = math.floor
  time = mathFloor(time)
  local hours, minutes, seconds
  hours = mathFloor(time / 3600)
  time = time % 3600
  minutes = mathFloor(time / 60)
  seconds = time % 60
  local day = mathFloor(hours / 24)
  hours = hours % 24
  if 0 == day then
    if hours < 10 then
      return string.format("%d:%02d:%02d", hours, minutes, seconds)
    else
      return string.format("%02d:%02d:%02d", hours, minutes, seconds)
    end
  elseif day < 10 then
    return string.format("%d %02d:%02d:%02d", day, hours, minutes, seconds)
  else
    return string.format("%02d %02d:%02d:%02d", day, hours, minutes, seconds)
  end
end

function EnergyWindow.InitTime()
  if downTime then
    for i, v in pairs(downTime) do
      v:stop()
    end
  end
  downTime = {}
end

function EnergyWindow.RefreshUI()
  isMax = false
  local item = {
    uis.Main.EnergyBuy,
    uis.Main.ItemUse1,
    uis.Main.ItemUse2
  }
  local count
  for i = 1, 3 do
    local id = itemUid[i] and itemUid[i].id or 0
    count = 1 == i and ActorData.GetItemCount(id) or ActorData.GetItemCountByExpire(id)
    if nil == itemNum[id] or 0 == itemNum[id] then
      UIUtil.SetText(item[i].EnergyItemBtn, count, "NumberTxt")
      item[i].c1Ctr.selectedIndex = 0
      if 1 == i then
        if nil == EnergyWindow.IsPitchOn(i) then
          EnergyWindow.SetAlpha(maskImage[i], 0)
          line[i].gameObject:SetActive(false)
        end
      else
        EnergyWindow.SetAlpha(maskImage[i], 0)
        line[i].gameObject:SetActive(false)
      end
    else
      UIUtil.SetText(item[i].EnergyItemBtn, T(823, count, itemNum[id]), "NumberTxt")
    end
  end
  local num = EnergyWindow.GetEffectNum(1)
  if num > 0 then
    uis.Main.c1Ctr.selectedIndex = 1
    uis.Main.EnergyMunber.WordTxt.text = T(813, EnergyData.info.curEnergy, num, EnergyData.info.energyRecoverLimit)
  else
    uis.Main.c1Ctr.selectedIndex = 0
    uis.Main.EnergyMunber.WordTxt.text = T(830, EnergyData.info.curEnergy, EnergyData.info.energyRecoverLimit)
  end
  if itemNum[itemUid[1].id] == nil or 0 == itemNum[itemUid[1].id] then
    UIUtil.SetText(uis.Main.UseBtn, "", "WordTxt")
  else
    local costNum, tempGetEnergy = EnergyWindow.GetOneCostNum(EnergyData.info.curBuyTimes, itemNum[itemUid[1].id])
    UIUtil.SetText(uis.Main.UseBtn, T(820, costNum, costData.name(), tempGetEnergy), "WordTxt")
  end
  if EnergyData.info.curEnergy >= EnergyData.info.energyRecoverLimit then
    uis.Main.EnergyMunber.c1Ctr.selectedIndex = 0
    uis.Main.EnergyMunber.c2Ctr.selectedIndex = 0
    EnergyWindow.InitTime()
  end
end

function EnergyWindow.IsPitchOn(index)
  if 1 == index then
    for i = 2, 3 do
      if itemUid[i] and itemNum[itemUid[i].id] and itemNum[itemUid[i].id] > 0 then
        return true
      end
    end
  elseif itemNum[itemUid[1].id] and itemNum[itemUid[1].id] > 0 then
    return true
  end
end

function EnergyWindow.AddItemClick(index, item, idArr)
  if itemNum[idArr.id] == nil then
    itemNum[idArr.id] = 0
  end
  if EnergyWindow.IsPitchOn(index) then
    FloatTipsUtil.ShowWarnTips(T(825))
    return
  end
  if 1 == index then
    local costItemCount = EnergyWindow.GetOneCostNum(EnergyData.info.curBuyTimes, itemNum[idArr.id] + 1)
    if costItemCount > idArr.count and idArr.id == COMMON_ITEM_ID.BIND_DIAMOND then
      longPressStop = false
      if UIMgr:IsWindowOpen(WinResConfig.MainOpalExchangeWindow.name) == false then
        OpenWindow(WinResConfig.MainOpalExchangeWindow.name)
      end
      return
    end
  elseif idArr.count < itemNum[idArr.id] + 1 then
    longPressStop = false
    return
  end
  if 1 == index and EnergyData.info.curBuyTimes + itemNum[idArr.id] + 1 > EnergyData.info.maxBuyTimes then
    longPressStop = false
    FloatTipsUtil.ShowWarnTips(T(826))
    return
  end
  itemNum[idArr.id] = itemNum[idArr.id] + 1
  if EnergyWindow.GetAllEnergy() then
    longPressStop = false
    FloatTipsUtil.ShowWarnTips(T(824))
    itemNum[idArr.id] = itemNum[idArr.id] - 1
    return
  end
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ENERGY_ADD)
  if item.EffectHolder.visible then
    LuaUtil.PlayEffect(itemEffect[index])
  else
    item.EffectHolder.visible = true
  end
  curIndex = index
  uis.Main.c1Ctr.selectedIndex = 1
  line[index].gameObject:SetActive(true)
  SkeletonAnimationUtil.SetMix(spine, "idle", "press" .. index, 0.3)
  SkeletonAnimationUtil.SetMix(spine, "press" .. index, "idle", 0.25)
  SkeletonAnimationUtil.SetAnimation(spine, index, "idle", true)
  SkeletonAnimationUtil.SetAnimation(spine, index, "press" .. index, true)
  item.c1Ctr.selectedIndex = 1
  ChangeUIController(item.EnergyItemBtn, "c1", 1 == index and 0 or 1)
  if 1 == index then
    EnergyWindow.SetAlpha(maskImage[1], 0)
    EnergyWindow.SetAlpha(maskImage[2], 1)
    EnergyWindow.SetAlpha(maskImage[3], 1)
    local costNum, tempGetEnergy = EnergyWindow.GetOneCostNum(EnergyData.info.curBuyTimes, itemNum[idArr.id])
    UIUtil.SetText(uis.Main.UseBtn, T(820, costNum, costData.name(), tempGetEnergy), "WordTxt")
    UIUtil.SetText(uis.Main.EnergyBuy.EnergyItemBtn, T(817, EnergyData.info.maxBuyTimes - EnergyData.info.curBuyTimes - itemNum[idArr.id], EnergyData.info.maxBuyTimes), "LimitTxt")
    UIUtil.SetText(item.EnergyItemBtn, T(823, idArr.count, costNum), "NumberTxt")
    uis.Main.EnergyMunber.WordTxt.text = T(813, EnergyData.info.curEnergy, tempGetEnergy, EnergyData.info.energyRecoverLimit)
  else
    EnergyWindow.SetAlpha(maskImage[1], 1)
    EnergyWindow.SetAlpha(maskImage[2], 0)
    EnergyWindow.SetAlpha(maskImage[3], 0)
    getEnergy = EnergyWindow.GetEffectNum()
    UIUtil.SetText(uis.Main.UseBtn, "", "WordTxt")
    UIUtil.SetText(item.EnergyItemBtn, T(823, idArr.count, itemNum[idArr.id]), "NumberTxt")
    uis.Main.EnergyMunber.WordTxt.text = T(813, EnergyData.info.curEnergy, getEnergy, EnergyData.info.energyRecoverLimit)
  end
end

function EnergyWindow.GetOneCostNum(curBuyTimes, num)
  local config = TableData.GetTable("BaseBuyTime")
  local cost = 0
  local reward = 0
  local endIndex = curBuyTimes + num
  for i, v in pairs(config) do
    if 1 == v.type and curBuyTimes < v.start and endIndex >= v.finish then
      local costArr = EnergyWindow.Split(v.cost[1])
      if costArr then
        cost = cost + costArr.value
      end
      local rewardArr = EnergyWindow.Split(v.reward[1])
      if rewardArr then
        reward = reward + rewardArr.value
      end
    end
  end
  return cost, reward
end

function EnergyWindow.GetEffectNum()
  local num = 0
  for i = 2, 3 do
    if itemUid[i] and itemNum[itemUid[i].id] and energyNum[itemUid[i].id] then
      num = itemNum[itemUid[i].id] * energyNum[itemUid[i].id] + num
    end
  end
  return num
end

function EnergyWindow.CleanItemClick(index)
  local ctr = {
    uis.Main.EnergyBuy.c1Ctr,
    uis.Main.ItemUse1.c1Ctr,
    uis.Main.ItemUse2.c1Ctr
  }
  ctr[index].selectedIndex = 0
  itemNum[itemUid[index].id] = 0
  SkeletonAnimationUtil.StopTrackIndex(spine, 0, 0.3)
  SkeletonAnimationUtil.SetAnimation(spine, index, "idle", true)
  UIUtil.SetText(uis.Main.EnergyBuy.EnergyItemBtn, T(817, EnergyData.info.maxBuyTimes - EnergyData.info.curBuyTimes, EnergyData.info.maxBuyTimes), "LimitTxt")
  EnergyWindow.RefreshUI()
end

function EnergyWindow.ShowDay(itemInfo, itemObject)
  if itemInfo and 0 ~= itemInfo.expireStamp then
    ChangeUIController(itemObject, "c2", 1)
    local timeTxt = itemObject:GetChild("SurplusDay"):GetChild("DayTxt")
    timeTxt.text = T(1521, TimeUtil.FormatEnTime(itemInfo.expireStamp - LoginData.GetCurServerTime()))
  else
    ChangeUIController(itemObject, "c2", 0)
  end
end

function EnergyWindow.ShowEffect()
  middle_press.gameObject:SetActive(true)
  press[curIndex].gameObject:SetActive(true)
  for i = 1, 3 do
    if itemUid[i] and itemNum[itemUid[i].id] and itemNum[itemUid[i].id] > 0 then
      SkeletonAnimationUtil.SetAnimation(spine, i, "idle", true)
    end
  end
  EnergyWindow.SetEnergyAlpha(1)
end

function EnergyWindow.GetAllEnergy()
  local curEnergy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
  local num2 = EnergyWindow.GetEffectNum()
  if itemNum[itemUid[1].id] and itemNum[itemUid[1].id] > 0 then
    local costNum, tempGetEnergy = EnergyWindow.GetOneCostNum(EnergyData.info.curBuyTimes, itemNum[itemUid[1].id])
    num2 = num2 + tempGetEnergy
  end
  print(curEnergy + num2, energyMax, ">>>>>")
  if curEnergy and num2 and energyMax then
    return curEnergy + num2 > energyMax
  end
end

function EnergyWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.EnergyWindow.name, uis.Main.CurrencyReturn, nil, function()
    UIMgr:CloseWindow(WinResConfig.EnergyWindow.name)
  end)
  uis.Main.UseBtn.onClick:Set(function()
    if curIndex then
      if EnergyWindow.GetAllEnergy() then
        MessageBox.Show(T(831), {
          touchCallback = function()
            uis.Main.UseBtn.onClick:Call()
          end
        })
        return
      end
      if 1 == curIndex then
        if EnergyData.info.curBuyTimes >= EnergyData.info.maxBuyTimes then
          FloatTipsUtil.ShowWarnTips(T(826))
          return
        end
        EnergyService.BuyCountResourceReq(itemNum[itemUid[1].id])
      else
        local t = {}
        for i = 2, 3 do
          if itemUid[i] and itemUid[i].uid then
            t[itemUid[i].uid] = itemNum[itemUid[i].id]
          end
        end
        EnergyService.ExchangeEnergyReq(t)
      end
    end
  end)
end

function EnergyWindow.SetAlpha(obj, alpha, interval)
  local time = interval or 0.6
  if time > 0 and obj.alpha ~= alpha then
    LeanTween.value(obj.alpha, alpha, time):setOnUpdate(function(val)
      if uis then
        obj.alpha = val
      end
    end):setOnComplete(function()
      if uis then
        obj.alpha = alpha
      end
    end)
  else
    obj.alpha = alpha
  end
end

function EnergyWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.EnergyWindow.BUY_ENERGY or msgId == WindowMsgEnum.EnergyWindow.USE_ENERGY then
    middle_press.gameObject:SetActive(false)
    press[curIndex].gameObject:SetActive(false)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ENERGY_BUY_USE)
    EnergyWindow.ShowEffect()
    EnergyData.info.curEnergy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
    itemNum = {}
    if msgId == WindowMsgEnum.EnergyWindow.BUY_ENERGY then
      UIUtil.SetText(uis.Main.EnergyBuy.EnergyItemBtn, T(817, EnergyData.info.maxBuyTimes - EnergyData.info.curBuyTimes, EnergyData.info.maxBuyTimes), "LimitTxt")
    end
    EnergyWindow.ShowItem()
    EnergyWindow.RefreshUI()
  elseif msgId == WindowMsgEnum.EnergyWindow.UPDATE_TIME then
    EnergyWindow.UpdateTime()
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    EnergyData.info.curEnergy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
    EnergyWindow.ShowItem()
    EnergyWindow.RefreshUI()
    if EnergyData.info.curEnergy < EnergyData.info.energyRecoverLimit then
      EnergyService.GetEnergyRecoverInfoReq()
    end
  end
end

function EnergyWindow.OnClose()
  ResourceManager.DestroyGameObject(bgPrefab)
  EnergyWindow.InitTime()
  EnergyWindow.StopTween()
  uis = nil
  contentPane = nil
  bgPrefab = nil
  middle_press = nil
  red_screen = nil
  line = nil
  press = nil
  spine = nil
  itemNum = nil
  cost = nil
  reward = nil
  getEnergy = nil
  costData = nil
  curIndex = nil
  energyNum = nil
  maskImage = nil
  energyMax = nil
  longPressStop = nil
  itemEffect = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return EnergyWindow
