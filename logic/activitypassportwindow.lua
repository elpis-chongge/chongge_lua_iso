require("ActivityDungeon1_PassportWindowByName")
local ActivityPassportWindow = {}
local uis, contentPane, passInfo, lvMax, modelType, expMax, rewardData, rewardType, rewardLv, listPage, passLv, jumpTb, isShowAllGet, passPortConfig, lvTween, lastLv, waitMessageId, newPassPort, animTween

function ActivityPassportWindow.ReInitData()
end

function ActivityPassportWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityPassportWindow.package, WinResConfig.ActivityPassportWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_PassportWindowUis(contentPane)
    passInfo = PassportData.GetActivityPassport()
    if passInfo then
      listPage = math.ceil(uis.Main.RewardRegion.MiddleList.MiddleList.width / 120)
      uis.Main.RewardRegion.MiddleList.MiddleList.scrollItemToViewOnClick = false
      newPassPort = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.PASSPORT_ACTIVITY_NEW)
    end
    local data = ActivityDungeonData.GetActivityData()
    if data then
      uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(data.bg_passport)
    end
    ActivityPassportWindow.InitLv()
    ActivityPassportWindow.InitEffect()
    animTween = {}
    ActivityPassportWindow.UpdateTextDisplay()
    if bridgeObj.argTable[1] then
      PassportService.GetBattlePassInfoReq(function()
        passInfo = PassportData.GetActivityPassport()
        if passInfo then
          ActivityPassportWindow.GetExpMxp()
          ActivityPassportWindow.SetLevelInfo()
          ActivityPassportWindow.InitPassport()
          ActivityPassportWindow.CheckItemTime()
        else
          ActivityPassportWindow.ShowQuitTips()
        end
      end)
    else
      UIMgr:SetWindowArgs(WinResConfig.ActivityPassportWindow.name, {true})
      if passInfo then
        ActivityPassportWindow.InitPassport()
        ActivityPassportWindow.CheckItemTime()
      end
    end
    ActivityPassportWindow.InitBtn()
  end)
end

function ActivityPassportWindow.UpdateTextDisplay()
  uis.Main.TaskRegion.Max.WordTxt.text = T(403)
  uis.Main.Time.WordTxt.text = T(351)
  uis.Main.RewardRegion.StartTwo.Pic.BuyTxt.text = T(1504)
end

function ActivityPassportWindow.InitPassport()
  ActivityPassportWindow.SetLastLv()
  local onClickFun = function(i, item)
    if 0 == i then
      ActivityPassportWindow.ShowReward()
      UIUtil.SetBtnText(uis.Main.AllGetBtn, T(1071), T(1072))
    elseif 1 == i then
      ActivityPassportWindow.InitTask()
      UIUtil.SetBtnText(uis.Main.AllGetBtn, T(1073), T(1074))
    elseif 2 == i then
      if newPassPort ~= passInfo.passPortId then
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.PASSPORT_ACTIVITY_NEW, passInfo.passPortId)
      end
      newPassPort = passInfo.passPortId
      ChangeUIController(item, "c2", 0)
      ActivityPassportWindow.InitClothes()
    end
    uis.Main.AllGetBtn.visible = 2 ~= i
    uis.Main.c1Ctr.selectedIndex = i
    ActivityDungeonMgr.activityIndex = i
    uis.Main.TabRegion.TabList.selectedIndex = i
  end
  
  function uis.Main.TabRegion.TabList.itemRenderer(i, item)
    ChangeUIController(item, "c1", i)
    item.onClick:Set(function()
      if uis.Main.TabRegion.TabList.selectedIndex ~= i then
        uis.Main.TabRegion.TabList.selectedIndex = i
        onClickFun(i, item)
      end
    end)
    if i == ActivityDungeonMgr.activityIndex then
      onClickFun(i, item)
    end
    if 0 == i then
      RedDotMgr.AddNode({
        windowName = WinResConfig.ActivityPassportWindow.name,
        com = item,
        visibleFunc = function()
          return RedDotActivityDungeon.CanReward(ActivityDungeonData.GetShowId())
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
    end
    if 1 == i then
      RedDotMgr.AddNode({
        windowName = WinResConfig.ActivityPassportWindow.name,
        com = item,
        visibleFunc = function()
          return RedDotActivityDungeon.DailyTaskComplete(ActivityDungeonData.GetShowId())
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
    end
    if 2 == i then
      ChangeUIController(item, "c2", (0 == newPassPort or newPassPort ~= passInfo.passPortId) and 1 or 0)
    end
  end
  
  uis.Main.TabRegion.TabList.numItems = 3
end

function ActivityPassportWindow.InitEffect()
  uis.Main.RewardRegion.EndTwo.Item1.EffectHolder.visible = false
  uis.Main.RewardRegion.EndTwo.Item2.EffectHolder.visible = false
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_get_light.prefab")
  local effect2 = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_get_light.prefab")
  UIUtil.SetObjectToUI(effect, uis.Main.RewardRegion.EndTwo.Item1.EffectHolder, nil, true)
  UIUtil.SetObjectToUI(effect2, uis.Main.RewardRegion.EndTwo.Item2.EffectHolder, nil, true)
end

function ActivityPassportWindow.InitLv()
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.PASSPORT_ACTIVITY_LEVEL)
  passLv = {}
  if "" ~= str then
    local tb = Json.decode(str)
    local arr
    for i, v in pairs(tb) do
      arr = Split(v, ":")
      if 2 == #arr then
        passLv[tonumber(arr[1])] = tonumber(arr[2])
      end
    end
  else
    for i = 1, #PassportData.infoArr do
      passLv[PassportData.infoArr[i].passPortId] = 0
    end
  end
  if passInfo and passLv[passInfo.passPortId] == nil then
    passLv[passInfo.passPortId] = passInfo.lv
  end
end

function ActivityPassportWindow.ShowLevelUp()
  local lv = passLv[passInfo.passPortId]
  if lv and lv < passInfo.lv then
    passLv[passInfo.passPortId] = passInfo.lv
    ActivityPassportWindow.SaveLevel()
    OpenWindow(WinResConfig.ActivityPassportLevelUpTipsWindow.name, nil, passInfo.lv)
    return true
  end
end

function ActivityPassportWindow.SaveLevel()
  local tb = {}
  for i, v in pairs(passLv) do
    local str = i .. ":" .. v
    table.insert(tb, str)
  end
  local str = Json.encode(tb)
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.PASSPORT_ACTIVITY_LEVEL, str)
end

function ActivityPassportWindow.GetRewardByLv(tb, lv)
  if lv and tb then
    for i, v in pairs(tb) do
      if v.level == lv then
        return v
      end
    end
  end
end

function ActivityPassportWindow.GetRewardNum(ids)
  local rewardNum = 0
  local config = TableData.GetTable("BaseBattlePassReward")
  for i, v in pairs(config) do
    if table.contain(ids, v.pass_id) and v.reward and #v.reward > 0 then
      rewardNum = rewardNum + 1
    end
  end
  return rewardNum
end

function ActivityPassportWindow.IsGetAllReward(data)
  if data then
    if #data.openList < 2 then
      return false
    end
    local len = 0
    for i, v in pairs(data.rewards) do
      len = #v.rewardLvs + len
    end
    local num = ActivityPassportWindow.GetRewardNum(data.openList)
    return len >= num
  end
end

function ActivityPassportWindow.ShowReward()
  ActivityPassportWindow.RefreshUI()
  uis.Main.RewardRegion.MiddleList.MiddleList.scrollPane.onScroll:Add(function()
    ActivityPassportWindow.RefreshListReward(uis.Main.RewardRegion.MiddleList.MiddleList.scrollPane.posX)
  end)
  ActivityPassportWindow.ShowLevelUp()
end

function ActivityPassportWindow.GetUpdateLv(bar, tb)
  for i = 1, #tb do
    if bar <= tb[i] then
      return tb[i]
    end
  end
end

function ActivityPassportWindow.RefreshListReward(posX)
  local curLv = math.floor(posX / 120) + listPage
  if lvMax and curLv > lvMax then
    curLv = lvMax
  end
  local lv2 = ActivityPassportWindow.GetUpdateLv(curLv, rewardType[1])
  local lv1 = ActivityPassportWindow.GetUpdateLv(curLv, rewardType[1])
  if lv1 ~= rewardLv[1] then
    rewardLv[1] = lv1
    ActivityPassportWindow.RefreshRewardEnd(lv1, ActivityPassportWindow.GetRewardByLv(rewardData[1], rewardLv[1]), true)
  end
  if lv2 ~= rewardLv[2] then
    rewardLv[2] = lv2
    ActivityPassportWindow.RefreshRewardEnd(lv2, ActivityPassportWindow.GetRewardByLv(rewardData[2], rewardLv[2]), false)
  end
end

function ActivityPassportWindow.CheckItemTime()
  if passInfo then
    local t = passInfo.endStamp - LoginData.GetCurServerTime()
    local timeTxt = uis.Main.Time.TimeTxt
    if t > 0 then
      timeTxt.text = TimeUtil.FormatEnTime(t)
    else
      LeanTween.delayedCall(0.2, function()
        ActivityPassportWindow.ShowQuitTips()
      end)
    end
  end
end

function ActivityPassportWindow.ShowQuitTips()
  MessageBox.Show(T(409), {
    touchCallback = function()
      UIMgr:CloseWindow(WinResConfig.ActivityPassportWindow.name)
    end
  }, nil, {
    touchCallback = function()
      UIMgr:CloseWindow(WinResConfig.ActivityPassportWindow.name)
    end
  })
end

function ActivityPassportWindow.RefreshUI()
  ActivityPassportWindow.GetExpMxp()
  ActivityPassportWindow.SetLevelInfo()
  isShowAllGet = false
  ActivityPassportWindow.InitList()
  ActivityPassportWindow.RefreshRewardFirst()
  ChangeController(uis.Main.c2Ctr, isShowAllGet and 1 or 0)
  ChangeController(uis.Main.RewardRegion.StartTwo.Pic.c1Ctr, passInfo.openList[2] and 0 or 1)
end

function ActivityPassportWindow.GetExpMxp()
  passPortConfig = TableData.GetConfig(passInfo.passPortId, "BaseBattlePassport")
  if passPortConfig then
    expMax = passPortConfig.exp_max
    lvMax = passPortConfig.level_max
    modelType = passPortConfig.grow_model_id
  end
  rewardData = {}
  rewardType = {}
  rewardLv = {}
  for i = 1, #passPortConfig.pass_ids do
    rewardData[i], rewardType[i] = PassportData.GetRewardDataByPhaseId(passPortConfig.pass_ids[i])
    rewardLv[i] = 0
  end
end

function ActivityPassportWindow.SetLevelInfo()
  if 0 == passInfo.lv then
    uis.Main.Level.LevelTxt.text = passInfo.lv
  else
    uis.Main.Level.LevelTxt.text = LuaUtil.FormatNum(passInfo.lv, "00")
  end
  local isMaxLv = false
  if passInfo.lv >= lvMax then
    isMaxLv = true
    ChangeController(uis.Main.TaskRegion.c1Ctr, 1)
    UIUtil.SetBtnText(uis.Main.Level.LevelBuyBtn, T(405), T(363))
  else
    UIUtil.SetBtnText(uis.Main.Level.LevelBuyBtn, T(362), T(363))
    ChangeController(uis.Main.TaskRegion.c1Ctr, 0)
  end
  local lvData = PassportData.GetNextExpDataByPhaseId(modelType, passInfo.lv)
  if lvData then
    local tempExp = isMaxLv and lvData.next_exp or passInfo.exp
    uis.Main.Level.ExpProgressBar.max = lvData.next_exp
    if lvData.level >= lvMax then
      uis.Main.Level.ExpProgressBar.value = lvData.next_exp
      uis.Main.Level.ExpNumberTxt.text = T(746, lvData.next_exp, lvData.next_exp)
    else
      uis.Main.Level.ExpProgressBar.value = passInfo.exp
      uis.Main.Level.ExpNumberTxt.text = T(746, tempExp, lvData.next_exp)
    end
  end
end

function ActivityPassportWindow.InitList()
  local lvD = rewardData[1] or {}
  local list = uis.Main.RewardRegion.MiddleList.MiddleList
  list:SetVirtual()
  list.scrollPane.posX = 0
  local len = #lvD
  
  function list.itemRenderer(i, reward)
    local k = i + 1
    local title = reward:GetChild("Title")
    if passInfo.lv >= lvD[k].level then
      ChangeUIController(reward, nil, 0)
    else
      ChangeUIController(reward, nil, 1)
    end
    title:GetChild("LevelTxt").text = lvD[k].level
    ChangeUIController(title, "c1", passInfo.lv == i and 1 or 0)
    if lvD[k].reward_special_bg and 1 == lvD[k].reward_special_bg then
      ChangeUIController(reward, "c1", 1)
    else
      ChangeUIController(reward, "c1", 0)
    end
    ActivityPassportWindow.RefreshReward(rewardData[1][k], reward:GetChild("Reward1"), passInfo.openList[1], 1)
    ActivityPassportWindow.RefreshReward(rewardData[2][k], reward:GetChild("Reward2"), passInfo.openList[2], 2)
  end
  
  list.numItems = len
  ActivityPassportWindow.SetListPos()
end

function ActivityPassportWindow.SetListPos()
  local list = uis.Main.RewardRegion.MiddleList.MiddleList
  local len = list.numItems
  for i = 1, len do
    if passInfo.lv == i - 3 or len - 3 <= passInfo.lv and i == passInfo.lv then
      list:ScrollToView(i - 1)
      ActivityPassportWindow.RefreshListReward(list.scrollPane.posX)
      break
    end
  end
  ActivityPassportWindow.ShowGetEffect()
end

function ActivityPassportWindow.RefreshReward(data, reward, lock, type)
  if reward and data then
    if passInfo.lv >= data.level and lock then
      ChangeUIController(reward, "c1", 0)
    else
      ChangeUIController(reward, "c1", 1)
    end
    local state = 0
    if data.reward and data.reward ~= "" then
      if lock then
        state = ActivityPassportWindow.IsReward(data.pass_id, data.level)
      end
      local holder = reward:GetChild("EffectHolder")
      if 2 == state then
        isShowAllGet = true
        if lastLv[type] < data.level and data.level >= passInfo.lv - (listPage - 3) then
          if nil == animTween[type] then
            animTween[type] = {}
          end
          local bol = true
          for i, v in pairs(animTween[type]) do
            if v.level == data.level then
              animTween[type][i] = {
                reward = reward,
                level = data.level,
                type = type
              }
              bol = nil
              break
            end
          end
          if bol then
            table.insert(animTween[type], {
              reward = reward,
              level = data.level,
              type = type
            })
          end
        else
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_get_light.prefab", holder)
        end
        holder.visible = true
      else
        holder.visible = false
      end
      local objReward = reward:GetChild("Item")
      ActivityPassportWindow.RefreshRewardShow(data, objReward)
      ActivityPassportWindow.RefreshRewardState(objReward, state)
      ChangeUIController(reward, "c2", 0)
    else
      ChangeUIController(reward, "c2", 1)
    end
    reward.onClick:Set(function()
      ActivityPassportWindow.RewardItemClick(data, state)
    end)
  end
end

function ActivityPassportWindow.ShowGetEffect()
  local minScale = 0.82
  for i = 1, 2 do
    if animTween[i] then
      table.sort(animTween[i], function(a, b)
        return a.level < b.level
      end)
      for k, v in ipairs(animTween[i]) do
        TimerUtil.setTimeout(0.2 + k * 0.1, function()
          if 1 == v.type then
            local effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_light.prefab", v.reward.parent:GetChild("Effect1Holder"), nil, true, function()
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_get_light.prefab", v.reward:GetChild("EffectHolder"))
              animTween[i][k] = nil
            end)
            LuaUtil.SetScale(effect, 75 * minScale, 62 * minScale, 75 * minScale)
          else
            UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_light.prefab", v.reward.parent:GetChild("Effect2Holder"), minScale, true, function()
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_get_light.prefab", v.reward:GetChild("EffectHolder"))
              animTween[i][k] = nil
            end)
          end
          if lastLv[v.type] < v.level then
            lastLv[v.type] = v.level
          end
        end)
      end
    end
  end
end

function ActivityPassportWindow.RewardItemClick(data, state)
  if 2 == state and passInfo.lv >= data.level and data.reward ~= "" then
    PassportService.BattlePassGetRewardReq(passInfo.passPortId, data.pass_id, data.level, false, function(msg)
      passInfo = msg.info
      if msg.goods then
        if #msg.goods > 0 then
          GetItemTips.Show(msg.goods)
          UIMgr:SendWindowMessage(WinResConfig.ActivityPassportWindow.name, WindowMsgEnum.Passport.GET_REWARD)
        else
          FloatTipsUtil.ShowWarnTips(T(378))
        end
      end
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
    end, function(code)
      if code == ProtoEnum.RET_CODE.RC_BATTLEPASS_OUT_TIME then
        ActivityPassportWindow.ShowQuitTips()
      end
    end)
  elseif data.reward and data.reward[1] ~= "" then
    local addAttr = Split(data.reward[1], ":")
    if 3 == #addAttr then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
      UIUtil.OpenPreviewTips(tonumber(addAttr[2]), tonumber(addAttr[1]))
    end
  end
end

function ActivityPassportWindow.IsReward(passId, lv)
  for i, v in pairs(passInfo.rewards) do
    if v.passId == passId then
      if table.contain(v.rewardLvs, lv) then
        return 1
      elseif lv <= passInfo.lv then
        return 2
      else
        return 0
      end
    end
  end
  if lv <= passInfo.lv then
    return 2
  else
    return 0
  end
end

function ActivityPassportWindow.RefreshRewardFirst()
  ActivityPassportWindow.ShowState(passInfo.openList[2], uis.Main.RewardRegion.StartTwo.Pic.c1Ctr)
end

function ActivityPassportWindow.RefreshRewardEnd(showLv, data, page)
  if showLv then
    uis.Main.RewardRegion.EndTwo.LevelTxt.text = showLv
  end
  if data then
    local state = ActivityPassportWindow.IsReward(data.pass_id, showLv)
    if page then
      ActivityPassportWindow.RefreshRewardShow(data, uis.Main.RewardRegion.EndTwo.Item1.root)
      ActivityPassportWindow.ShowState(passInfo.openList[1], uis.Main.RewardRegion.EndTwo.Item1.c1Ctr)
      if passInfo.openList[1] then
        ActivityPassportWindow.RefreshRewardState(uis.Main.RewardRegion.EndTwo.Item1.root, state)
        if 2 == state then
          uis.Main.RewardRegion.EndTwo.Item2.EffectHolder.visible = false
          uis.Main.RewardRegion.EndTwo.Item1.EffectHolder.visible = true
        else
          uis.Main.RewardRegion.EndTwo.Item1.EffectHolder.visible = false
        end
        uis.Main.RewardRegion.EndTwo.Item1.root.onClick:Set(function()
          ActivityPassportWindow.RewardItemClick(data, state)
        end)
      end
    else
      ActivityPassportWindow.RefreshRewardShow(data, uis.Main.RewardRegion.EndTwo.Item2.root)
      ActivityPassportWindow.ShowState(passInfo.openList[2], uis.Main.RewardRegion.EndTwo.Item2.c1Ctr)
      if passInfo.openList[2] then
        ActivityPassportWindow.RefreshRewardState(uis.Main.RewardRegion.EndTwo.Item2.root, state)
        if 2 == state then
          uis.Main.RewardRegion.EndTwo.Item2.EffectHolder.visible = false
          uis.Main.RewardRegion.EndTwo.Item2.EffectHolder.visible = true
        else
          uis.Main.RewardRegion.EndTwo.Item2.EffectHolder.visible = false
        end
      else
        state = 0
      end
      uis.Main.RewardRegion.EndTwo.Item2.root.onClick:Set(function()
        ActivityPassportWindow.RewardItemClick(data, state)
      end)
    end
  end
end

function ActivityPassportWindow.ShowState(bolLock, ctr)
  if bolLock then
    ctr.selectedIndex = 0
  else
    ctr.selectedIndex = 1
  end
end

function ActivityPassportWindow.RefreshRewardShow(data, Item)
  if data.reward and data.reward[1] ~= "" then
    local addAttr = Split(data.reward[1], ":")
    if Item and data.reward_special_show then
      local CardFrame = Item:GetChild("CardFrame")
      CardFrame:GetChild("ItemCardPic"):GetChild("ItemLoader").url = UIUtil.GetResUrl(data.reward_special_show)
      ChangeUIController(Item, "c2", 1)
      if tonumber(addAttr[1]) == ProtoEnum.TUPLE_TYPE.T_FASHION then
        ChangeUIController(CardFrame, "c2", 1)
      end
      return
    end
    if 3 == #addAttr then
      if tonumber(addAttr[1]) == ProtoEnum.TUPLE_TYPE.ITEM then
        UIUtil.ShowItemFrame(tonumber(addAttr[2]), Item:GetChild("ItemFrame"), tonumber(addAttr[3]))
        ChangeUIController(Item, "c2", 0)
      elseif tonumber(addAttr[1]) == ProtoEnum.TUPLE_TYPE.ITEM then
        ChangeUIController(Item, "c2", 1)
        local cardData = TableData.GetConfig(tonumber(addAttr[2]), "BaseCard")
        local fData = TableData.GetConfig(cardData.fashion_id, "BaseFashion")
        if fData then
          Item:GetChild("CardFrame"):GetChild("ItemLoader").url = UIUtil.GetResUrl(fData.head_icon_square)
        end
      end
    end
  end
end

function ActivityPassportWindow.RefreshRewardState(Item, isReward)
  if 1 == isReward then
    ChangeUIController(Item, "c1", 2)
    ChangeUIController(Item:GetChild("ItemFrame"), "c3", 1)
    ChangeUIController(Item:GetChild("CardFrame"), "c3", 1)
  elseif 2 == isReward then
    ChangeUIController(Item, "c1", 0)
    ChangeUIController(Item:GetChild("ItemFrame"), "c3", 0)
    ChangeUIController(Item:GetChild("CardFrame"), "c3", 0)
  elseif 0 == isReward then
    ChangeUIController(Item, "c1", 1)
    ChangeUIController(Item:GetChild("ItemFrame"), "c3", 0)
    ChangeUIController(Item:GetChild("CardFrame"), "c3", 0)
  end
end

function ActivityPassportWindow.PassportActivate()
  PassportService.GetBattlePassInfoReq(function()
    passInfo = PassportData.GetActivityPassport()
  end)
end

function ActivityPassportWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ActivityPassportWindow.name)
end

function ActivityPassportWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(ActivityPassportWindow.CloseWindow)
  if passInfo then
    uis.Main.RewardRegion.StartTwo.Pic.root.onClick:Set(function()
      local item = uis.Main.TabRegion.TabList:GetChildAt(2)
      if item then
        item.onClick:Call()
      end
    end)
    uis.Main.AllGetBtn.onClick:Set(function()
      if 0 == uis.Main.c1Ctr.selectedIndex then
        PassportService.BattlePassGetRewardReq(passInfo.passPortId, nil, nil, true, function(msg)
          passInfo = msg.info
          if msg.goods then
            if #msg.goods > 0 then
              GetItemTips.Show(msg.goods)
              UIMgr:SendWindowMessage(WinResConfig.ActivityPassportWindow.name, WindowMsgEnum.Passport.GET_REWARD)
            else
              FloatTipsUtil.ShowWarnTips(T(378))
            end
          end
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
        end, function(code)
          if code == ProtoEnum.RET_CODE.RC_BATTLEPASS_OUT_TIME then
            ActivityPassportWindow.ShowQuitTips()
          end
        end)
      elseif 1 == uis.Main.c1Ctr.selectedIndex then
        PassportService.BattlePassTaskRewardReq(passInfo.passPortId, 0, function(msg)
          if msg.info then
            passInfo = msg.info
          end
          UIMgr:SendWindowMessage(WinResConfig.ActivityPassportWindow.name, WindowMsgEnum.Passport.GET_TASK_REWARD, msg.exp)
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
        end, function(code)
          if code == ProtoEnum.RET_CODE.RC_BATTLEPASS_OUT_TIME then
            ActivityPassportWindow.ShowQuitTips()
          end
        end)
      end
    end)
    uis.Main.Level.LevelBuyBtn.onClick:Set(function()
      if passInfo.lv < lvMax then
        OpenWindow(WinResConfig.ActivityBuyLevelDesWindow.name, nil, passInfo.passPortId)
      end
    end)
  end
end

function ActivityPassportWindow.ShowExpBarAnim(expChange)
  if expChange then
    if expMax and passInfo.expLimit >= expMax then
      ActivityPassportWindow.SetLevelInfo()
      return
    end
    if lvTween then
      LeanTween.cancel(lvTween.uniqueId)
      lvTween = nil
    end
    local expBar = uis.Main.Level.ExpProgressBar
    local lvData = PassportData.GetNextExpDataByPhaseId(modelType, passInfo.lv)
    local preExp = expBar.value
    local preExpMax = expBar.max
    local isUp = true
    lvTween = LeanTween.value(0, expChange, 0.8):setOnUpdate(function(value)
      local tempExp = preExp + value
      if uis then
        if tempExp <= preExpMax then
          expBar.value = tempExp
        else
          if isUp then
            isUp = false
            expBar.max = lvData.next_exp
          end
          if lvData.level >= lvMax then
            expBar.value = 0
          else
            expBar.value = tempExp - preExpMax
          end
        end
      end
    end):setOnComplete(function()
      if uis then
        ActivityPassportWindow.SetLevelInfo()
      end
      lvTween = nil
    end)
  end
end

function ActivityPassportWindow.InitTask()
  local taskData = passInfo.dailyTask
  local sortNum = {
    [ProtoEnum.TASK_STATE.FINISHED] = 0,
    [ProtoEnum.TASK_STATE.NORMAL] = 1,
    [ProtoEnum.TASK_STATE.REWARD] = 2
  }
  table.sort(taskData, function(a, b)
    if sortNum[a.state] == sortNum[b.state] then
      local aData = TableData.GetConfig(a.taskId, "BaseTask")
      local bData = TableData.GetConfig(b.taskId, "BaseTask")
      if bData and aData then
        return aData.sort < bData.sort
      end
    end
    return sortNum[a.state] < sortNum[b.state]
  end)
  local list = uis.Main.TaskRegion.TipsList
  
  function list.itemRenderer(i, item)
    local v = taskData[i + 1]
    if v then
      local task = item:GetChild("Tips")
      local data = TableData.GetConfig(v.taskId, "BaseTask")
      UIUtil.SetText(task, data.name(), "WordTxt")
      UIUtil.SetText(task:GetChild("Integral"), data.passport_exp, "NumberTxt")
      ChangeUIController(task, "c1", v.state)
      ChangeUIController(task, "c2", 1)
      ChangeUIController(task, "c3", (v.state == ProtoEnum.TASK_STATE.REWARD or passInfo.lv >= lvMax) and 1 or 0)
      local barValue = math.min(v.value, data.task_parameter[1])
      UIUtil.SetText(task, T(1544, barValue, data.task_parameter[1]), "ProgressTxt")
      if v.state == ProtoEnum.TASK_STATE.FINISHED then
        UIUtil.SetText(task, T(1382), "TipsTxt")
        task.onClick:Set(function()
          if v.state == ProtoEnum.TASK_STATE.FINISHED then
            PassportService.BattlePassTaskRewardReq(passInfo.passPortId, 0, function(msg)
              if msg.info then
                passInfo = msg.info
              end
              UIMgr:SendWindowMessage(WinResConfig.ActivityPassportWindow.name, WindowMsgEnum.Passport.GET_TASK_REWARD, msg.exp)
              RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
            end, function(code)
              if code == ProtoEnum.RET_CODE.RC_BATTLEPASS_OUT_TIME then
                ActivityPassportWindow.ShowQuitTips()
              end
            end)
          end
        end)
      elseif v.state == ProtoEnum.TASK_STATE.NORMAL then
        UIUtil.SetText(task, T(1545), "TipsTxt")
        local featureData = TableData.GetConfig(data.go_to_id, "BaseFeature")
        if featureData then
          CurrencyReturnWindow.SetJumpFun(task, featureData)
        end
      else
        UIUtil.SetText(task, T(1383), "TipsTxt")
        task.onClick:Set(function()
        end)
      end
    end
  end
  
  list.numItems = #taskData
  ChangeController(uis.Main.c2Ctr, RedDotActivityDungeon.DailyTaskComplete() and 1 or 0)
end

function ActivityPassportWindow.InitClothes()
  if passPortConfig then
    local clothes = uis.Main.ClothseRegion
    clothes.Word.WordTxt.text = T(1543)
    UIUtil.SetText(clothes.root:GetChild("Name"), passPortConfig.name(), "NameTxt")
    if passPortConfig.fashion_id and passPortConfig.fashion_id[1] then
      local fashionData = TableData.GetConfig(passPortConfig.fashion_id[1], "BaseFashion")
      if fashionData then
        UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionData.spd), clothes.CardQB.QBHolder, SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionData.spd_scale / 10000, true, function(spineModel)
          SkeletonAnimationUtil.SetFlip(spineModel, false, false)
          SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
        end)
        PlayUITrans(clothes.CardQB.root, "up")
      end
      clothes.root:GetChild("Name").onClick:Set(function()
        OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, {
          {
            id = fashionData.id
          }
        })
      end)
    end
    local highData = PassportMgr.GetPlatformId(passPortConfig.id, 4)
    if highData then
      local newHighRewards = SimpleCopy(highData.rewards)
      if highData.diamond and highData.diamond > 0 then
        table.insert(newHighRewards, "1:21000002:" .. highData.diamond)
      end
      if highData.bindDiamond and highData.bindDiamond > 0 then
        table.insert(newHighRewards, "1:21000001:" .. highData.bindDiamond)
      end
      local state = ShopData.limitRecord[highData.id]
      local arrItem = GetConfigItemList(newHighRewards, true)
      
      function clothes.BuyReward.RewardList.itemRenderer(i, item)
        local frame
        if arrItem[i + 1].type == ProtoEnum.TUPLE_TYPE.T_FASHION or arrItem[i + 1].type == ProtoEnum.TUPLE_TYPE.CARD then
          frame = item:GetChild("CardFrame")
          ChangeUIController(frame, "c2", 1)
          ChangeUIController(item, "c2", 1)
        else
          ChangeUIController(item, "c2", 0)
          frame = item:GetChild("ItemFrame")
        end
        ChangeUIController(item, "c1", state and 2 or 0)
        UIUtil.ShowItemFrame(arrItem[i + 1].id, frame, arrItem[i + 1].value, nil, function()
          UIUtil.CommonItemClickCallback(arrItem[i + 1].id, arrItem[i + 1].type)
        end)
        if arrItem[i + 1].type == ProtoEnum.TUPLE_TYPE.T_FASHION or arrItem[i + 1].type == ProtoEnum.TUPLE_TYPE.CARD then
          ChangeUIController(frame, "c2", 1)
        end
      end
      
      clothes.BuyReward.RewardList.numItems = #arrItem
      clothes.BuyReward.WordTxt.text = ""
      clothes.BuyReward.TitleTxt.text = T(1546)
      UIUtil.SetText(clothes.BuyBtn, state and T(1011) or T(1548, highData.price), "PriceTxt")
      clothes.BuyBtn.onClick:Set(function()
        if state then
          return
        end
        ShopMgr.BuyProduct(highData.id, function()
          ActivityPassportWindow.PassportActivate()
          ActivityPassportWindow.InitClothes()
        end)
      end)
    end
  end
end

function ActivityPassportWindow.SetLastLv()
  if nil == lastLv then
    lastLv = {}
  end
  lastLv[1] = passInfo.lv
  if passInfo.openList[2] then
    lastLv[2] = passInfo.lv
  else
    lastLv[2] = -1
  end
end

function ActivityPassportWindow.PlayFirstRewardEffect()
  for i = 1, 2 do
    if lastLv[i] < passInfo.lv and passInfo.openList[i] then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_light_main.prefab", uis.Main.RewardRegion.StartTwo[string.format("Effect%sHolder", i)], nil, true)
    end
  end
end

function ActivityPassportWindow.PlayEndRewardEffect()
  for i = 1, 2 do
    if lvMax == passInfo.lv and passInfo.openList[i] then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_light_end.prefab", uis.Main.RewardRegion.EndTwo[string.format("Effect%sHolder", i)], nil, true)
    end
  end
end

function ActivityPassportWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Passport.BUY then
    passInfo = PassportData.GetActivityPassport()
    if 0 == uis.Main.c1Ctr.selectedIndex then
      if UIMgr:IsWindowOpen(WinResConfig.ActivityPassportWindow.name) then
        local lvUp = ActivityPassportWindow.ShowLevelUp()
        if lvUp then
          passLv[passInfo.passPortId] = passInfo.lv
          return
        end
        ActivityPassportWindow.SetLevelInfo()
        uis.Main.RewardRegion.MiddleList.MiddleList:RefreshVirtualList()
        ActivityPassportWindow.SetListPos()
        rewardLv[1] = 0
        rewardLv[2] = 0
        ActivityPassportWindow.RefreshListReward(uis.Main.RewardRegion.MiddleList.MiddleList.scrollPane.posX)
        ChangeController(uis.Main.c2Ctr, RedDotActivityDungeon.CanReward() and 1 or 0)
        TimerUtil.setTimeout(0.2, function()
          if uis then
            ActivityPassportWindow.PlayFirstRewardEffect()
            ActivityPassportWindow.SetLastLv()
          end
        end)
        waitMessageId = nil
      else
        waitMessageId = msgId
      end
    elseif 1 == uis.Main.c1Ctr.selectedIndex then
      ActivityPassportWindow.SetLevelInfo()
      passLv[passInfo.passPortId] = passInfo.lv
      ActivityPassportWindow.SaveLevel()
    end
  elseif msgId == WindowMsgEnum.Passport.GET_REWARD then
    uis.Main.RewardRegion.MiddleList.MiddleList:RefreshVirtualList()
    rewardLv[1] = 0
    rewardLv[2] = 0
    ActivityPassportWindow.RefreshListReward(uis.Main.RewardRegion.MiddleList.MiddleList.scrollPane.posX)
    ChangeController(uis.Main.c2Ctr, RedDotActivityDungeon.CanReward() and 1 or 0)
  elseif msgId == WindowMsgEnum.Passport.ACTIVATE then
    ActivityPassportWindow.PassportActivate()
    ActivityPassportWindow.InitClothes()
  elseif msgId == WindowMsgEnum.Passport.GET_TASK_REWARD then
    ActivityPassportWindow.InitTask()
    local lvUp = ActivityPassportWindow.ShowLevelUp()
    if lvUp then
      passLv[passInfo.passPortId] = passInfo.lv
    end
    if para and para > 0 then
      ActivityPassportWindow.ShowExpBarAnim(para)
    else
      ActivityPassportWindow.SetLevelInfo()
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    PassportService.GetBattlePassInfoReq(function()
      passInfo = PassportData.GetActivityPassport()
      if passInfo then
        if LoginData.GetCurServerTime() >= passInfo.endStamp then
          ActivityPassportWindow.ShowQuitTips()
        elseif 1 == uis.Main.c1Ctr.selectedIndex then
          ActivityPassportWindow.InitTask()
          FloatTipsUtil.ShowWarnTips(T(1058))
        end
      end
    end)
  elseif msgId == WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE then
    ActivityPassportWindow.CheckItemTime()
  end
end

function ActivityPassportWindow.OnShown()
  if uis then
    if waitMessageId then
      ActivityPassportWindow.HandleMessage(waitMessageId)
    end
    PassportService.GetBattlePassInfoReq(function()
      passInfo = PassportData.GetActivityPassport()
      if passInfo then
        if 1 == uis.Main.c1Ctr.selectedIndex then
          ActivityPassportWindow.InitTask()
        end
      else
        ActivityPassportWindow.ShowQuitTips()
      end
    end)
  end
end

function ActivityPassportWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.ActivityPassportWindow.name)
  uis = nil
  contentPane = nil
  lvMax = nil
  expMax = nil
  rewardData = nil
  listPage = nil
  isShowAllGet = nil
  passPortConfig = nil
  rewardType = nil
  rewardLv = nil
  passLv = nil
  lastLv = nil
  newPassPort = nil
  animTween = nil
end

return ActivityPassportWindow
