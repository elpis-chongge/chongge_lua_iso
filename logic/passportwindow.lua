require("Passport_PassportWindowByName")
local PassportWindow = {}
local uis, contentPane, lvMax, modelType, expMax, rewardData, rewardType, rewardLv, listPage, passLv, jumpTb, isShowAllGet, passPortConfig, lvTween, lastLv, waitMessageId, newPassPort, animTween

function PassportWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.PassportWindow.package, WinResConfig.PassportWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPassport_PassportWindowUis(contentPane)
    PassportData.GetPassport()
    PassportWindow.GetBuyInfo()
    listPage = math.ceil(uis.Main.RewardRegion.MiddleList.MiddleList.width / 120)
    uis.Main.RewardRegion.MiddleList.MiddleList.scrollItemToViewOnClick = false
    newPassPort = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.PASSPORT_NEW)
    PassportWindow.InitLv()
    PassportWindow.InitEffect()
    animTween = {}
    PassportWindow.UpdateTextDisplay()
    if bridgeObj.argTable[1] then
      PassportService.GetBattlePassInfoReq(function()
        PassportData.GetPassport()
        if PassportData.info then
          PassportWindow.GetExpMxp()
          PassportWindow.SetLevelInfo()
          PassportWindow.InitPassport()
          PassportWindow.CheckItemTime()
        else
          PassportWindow.ShowQuitTips()
        end
      end)
    else
      UIMgr:SetWindowArgs(WinResConfig.PassportWindow.name, {true})
      if PassportData.info then
        PassportWindow.InitPassport()
        PassportWindow.CheckItemTime()
      end
    end
    PassportWindow.InitBtn()
  end)
end

function PassportWindow.GetBuyInfo()
  if PassportData.info and not PassportData.info.openList[2] then
    ld("Shop", function()
      ShopService.GetPurchaseProductsReq({
        ProtoEnum.PRODUCT_TYPE.PT_BATTLE_PASS
      }, ProtoEnum.PLATFORM_TYPE.PFT_ANDROID)
    end)
  end
end

function PassportWindow.InitEffect()
  uis.Main.RewardRegion.EndTwo.Item1.EffectHolder.visible = false
  uis.Main.RewardRegion.EndTwo.Item2.EffectHolder.visible = false
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_get_light.prefab")
  local effect2 = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_get_light.prefab")
  UIUtil.SetObjectToUI(effect, uis.Main.RewardRegion.EndTwo.Item1.EffectHolder, nil, true)
  UIUtil.SetObjectToUI(effect2, uis.Main.RewardRegion.EndTwo.Item2.EffectHolder, nil, true)
end

function PassportWindow.InitLv()
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.PASSPORT_LEVEL)
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
  if PassportData.info and passLv[PassportData.info.passPortId] == nil then
    passLv[PassportData.info.passPortId] = PassportData.info.lv
  end
end

function PassportWindow.ShowLevelUp()
  local lv = passLv[PassportData.info.passPortId]
  if lv and lv < PassportData.info.lv then
    passLv[PassportData.info.passPortId] = PassportData.info.lv
    PassportWindow.SaveLevel()
    OpenWindow(WinResConfig.PassportLevelUpTipsWindow.name, nil, PassportData.info.lv)
    return true
  end
end

function PassportWindow.SaveLevel()
  local tb = {}
  for i, v in pairs(passLv) do
    local str = i .. ":" .. v
    table.insert(tb, str)
  end
  local str = Json.encode(tb)
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.PASSPORT_LEVEL, str)
end

function PassportWindow.GetRewardByLv(tb, lv)
  if lv and tb then
    for i, v in pairs(tb) do
      if v.level == lv then
        return v
      end
    end
  end
end

function PassportWindow.GetRewardNum(ids)
  local rewardNum = 0
  local config = TableData.GetTable("BaseBattlePassReward")
  for i, v in pairs(config) do
    if table.contain(ids, v.pass_id) and v.reward and #v.reward > 0 then
      rewardNum = rewardNum + 1
    end
  end
  return rewardNum
end

function PassportWindow.IsGetAllReward(data)
  if data then
    if #data.openList < 2 then
      return false
    end
    local len = 0
    for i, v in pairs(data.rewards) do
      len = #v.rewardLvs + len
    end
    local num = PassportWindow.GetRewardNum(data.openList)
    return len >= num
  end
end

function PassportWindow.InitPassport()
  if PassportData.info then
    passPortConfig = TableData.GetConfig(PassportData.info.passPortId, "BaseBattlePassport")
    if passPortConfig then
      uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(passPortConfig.bg_pic)
    end
  end
  PassportWindow.SetLastLv()
  local onClickFun = function(i, item)
    if 0 == i then
      PassportWindow.ShowReward()
      UIUtil.SetBtnText(uis.Main.AllGetBtn, T(1071), T(1072))
    elseif 1 == i then
      PassportWindow.InitTask()
      UIUtil.SetBtnText(uis.Main.AllGetBtn, T(1073), T(1074))
    elseif 2 == i then
      if newPassPort ~= PassportData.info.passPortId then
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.PASSPORT_NEW, PassportData.info.passPortId)
      end
      newPassPort = PassportData.info.passPortId
      ChangeUIController(item, "c2", 0)
      PassportWindow.InitClothes()
      PlayUITrans(uis.Main.CardClothesRegion.root, "up")
    end
    uis.Main.AllGetBtn.visible = 2 ~= i
    uis.Main.c1Ctr.selectedIndex = i
    PassportData.index = i
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
    if i == PassportData.index then
      onClickFun(i, item)
    end
    if 0 == i then
      RedDotMgr.AddNode({
        windowName = WinResConfig.PassportWindow.name,
        com = item,
        visibleFunc = function()
          return RedDotPassport.CanReward()
        end,
        dataType = RED_DOT_DATA_TYPE.PASSPORT
      })
    end
    if 1 == i then
      RedDotMgr.AddNode({
        windowName = WinResConfig.PassportWindow.name,
        com = item,
        visibleFunc = function()
          return RedDotPassport.CanTask()
        end,
        dataType = RED_DOT_DATA_TYPE.PASSPORT
      })
    end
    if 2 == i then
      ChangeUIController(item, "c2", (0 == newPassPort or newPassPort ~= PassportData.info.passPortId) and 1 or 0)
    end
  end
  
  uis.Main.TabRegion.TabList.numItems = 3
end

function PassportWindow.ShowReward()
  PassportWindow.RefreshUI()
  uis.Main.RewardRegion.MiddleList.MiddleList.scrollPane.onScroll:Add(function()
    PassportWindow.RefreshListReward(uis.Main.RewardRegion.MiddleList.MiddleList.scrollPane.posX)
  end)
  PassportWindow.ShowLevelUp()
end

function PassportWindow.GetUpdateLv(bar, tb)
  for i = 1, #tb do
    if bar <= tb[i] then
      return tb[i]
    end
  end
end

function PassportWindow.RefreshListReward(posX)
  local curLv = math.floor(posX / 120) + listPage
  if lvMax and curLv > lvMax then
    curLv = lvMax
  end
  local lv2 = PassportWindow.GetUpdateLv(curLv, rewardType[1])
  local lv1 = PassportWindow.GetUpdateLv(curLv, rewardType[1])
  if lv1 ~= rewardLv[1] then
    rewardLv[1] = lv1
    PassportWindow.RefreshRewardEnd(lv1, PassportWindow.GetRewardByLv(rewardData[1], rewardLv[1]), true)
  end
  if lv2 ~= rewardLv[2] then
    rewardLv[2] = lv2
    PassportWindow.RefreshRewardEnd(lv2, PassportWindow.GetRewardByLv(rewardData[2], rewardLv[2]), false)
  end
end

function PassportWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.LevelRegion.LevelBtn.LevelBuyBtn, T(362), T(363))
  uis.Main.LevelRegion.LevelBtn.FullLevel.SubtitleTxt.text = T(747)
  uis.Main.LevelRegion.LevelBtn.FullLevel.WordTxt.text = T(405)
  uis.Main.TaskRegion.TaskMax.WordTxt.text = T(403)
  uis.Main.Time.WordTxt.text = T(351)
  uis.Main.RewardRegion.StartTwo.Pic.WordTxt.text = T(353)
  uis.Main.RewardRegion.StartTwo.Pic.BuyTxt.text = T(1504)
  uis.Main.RewardRegion.EndTwo.LevelWordTxt.text = T(742)
end

function PassportWindow.CheckItemTime()
  if PassportData.info then
    local t = PassportData.info.endStamp - LoginData.GetCurServerTime()
    local timeTxt = uis.Main.Time.TimeTxt
    if t > 0 then
      timeTxt.text = TimeUtil.FormatEnTime(t)
    else
      LeanTween.delayedCall(0.2, function()
        PassportWindow.ShowQuitTips()
      end)
    end
  end
end

function PassportWindow.ShowQuitTips()
  MessageBox.Show(T(409), {
    touchCallback = function()
      UIMgr:CloseWindow(WinResConfig.PassportWindow.name)
    end
  }, nil, {
    touchCallback = function()
      UIMgr:CloseWindow(WinResConfig.PassportWindow.name)
    end
  })
end

function PassportWindow.RefreshUI()
  PassportWindow.GetExpMxp()
  PassportWindow.SetLevelInfo()
  isShowAllGet = false
  PassportWindow.InitList()
  PassportWindow.RefreshRewardFirst()
  ChangeController(uis.Main.c2Ctr, isShowAllGet and 1 or 0)
end

function PassportWindow.GetExpMxp()
  passPortConfig = TableData.GetConfig(PassportData.info.passPortId, "BaseBattlePassport")
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

function PassportWindow.SetLevelInfo()
  if 0 == PassportData.info.lv then
    uis.Main.LevelRegion.LevelBtn.LevelTxt.text = PassportData.info.lv
  else
    uis.Main.LevelRegion.LevelBtn.LevelTxt.text = LuaUtil.FormatNum(PassportData.info.lv, "00")
  end
  local isMaxLv = false
  if PassportData.info.lv >= lvMax then
    isMaxLv = true
    ChangeController(uis.Main.LevelRegion.LevelBtn.c1Ctr, 1)
    ChangeController(uis.Main.TaskRegion.c1Ctr, 1)
  else
    ChangeController(uis.Main.LevelRegion.LevelBtn.c1Ctr, 0)
    ChangeController(uis.Main.TaskRegion.c1Ctr, 0)
  end
  local lvData = PassportData.GetNextExpDataByPhaseId(modelType, PassportData.info.lv)
  if lvData then
    local tempExp = isMaxLv and lvData.next_exp or PassportData.info.exp
    uis.Main.LevelRegion.LevelBtn.ExpNumberTxt.text = T(746, tempExp, lvData.next_exp)
    uis.Main.LevelRegion.LevelBtn.ExpProgressBar.max = lvData.next_exp
    if lvData.level >= lvMax then
      uis.Main.LevelRegion.LevelBtn.ExpProgressBar.value = 0
    else
      uis.Main.LevelRegion.LevelBtn.ExpProgressBar.value = PassportData.info.exp
    end
  end
  local tempExp = isMaxLv and expMax or PassportData.info.expLimit
  uis.Main.LevelRegion.LevelBtn.WeekNumber.NumberTxt.text = T(746, tempExp, expMax)
  uis.Main.LevelRegion.LevelBtn.WeekNumber.LimitTxt.text = T(745)
end

function PassportWindow.InitList()
  local lvD = rewardData[1] or {}
  local list = uis.Main.RewardRegion.MiddleList.MiddleList
  list:SetVirtual()
  list.scrollPane.posX = 0
  local len = #lvD
  
  function list.itemRenderer(i, reward)
    local k = i + 1
    local title = reward:GetChild("Title")
    if PassportData.info.lv >= lvD[k].level then
      ChangeUIController(reward, nil, 0)
    else
      ChangeUIController(reward, nil, 1)
    end
    title:GetChild("LevelTxt").text = lvD[k].level
    title:GetChild("LevelWordTxt").text = T(742)
    ChangeUIController(title, "c1", PassportData.info.lv == i and 1 or 0)
    if lvD[k].reward_special_bg and 1 == lvD[k].reward_special_bg then
      ChangeUIController(reward, "c1", 1)
    else
      ChangeUIController(reward, "c1", 0)
    end
    PassportWindow.RefreshReward(rewardData[1][k], reward:GetChild("Reward1"), PassportData.info.openList[1], 1)
    PassportWindow.RefreshReward(rewardData[2][k], reward:GetChild("Reward2"), PassportData.info.openList[2], 2)
  end
  
  list.numItems = len
  PassportWindow.SetListPos()
end

function PassportWindow.SetListPos()
  local list = uis.Main.RewardRegion.MiddleList.MiddleList
  local len = list.numItems
  for i = 1, len do
    if PassportData.info.lv == i - 3 or len - 3 <= PassportData.info.lv and i == PassportData.info.lv then
      list:ScrollToView(i - 1)
      PassportWindow.RefreshListReward(list.scrollPane.posX)
      break
    end
  end
  PassportWindow.ShowGetEffect()
end

function PassportWindow.RefreshReward(data, reward, lock, type)
  if reward and data then
    if PassportData.info.lv >= data.level and lock then
      ChangeUIController(reward, "c1", 0)
    else
      ChangeUIController(reward, "c1", 1)
    end
    local state = 0
    if data.reward and data.reward ~= "" then
      if lock then
        state = PassportWindow.IsReward(data.pass_id, data.level)
      end
      local holder = reward:GetChild("EffectHolder")
      if 2 == state then
        isShowAllGet = true
        if lastLv[type] < data.level and data.level >= PassportData.info.lv - (listPage - 3) then
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
      PassportWindow.RefreshRewardShow(data, objReward)
      PassportWindow.RefreshRewardState(objReward, state)
      ChangeUIController(reward, "c2", 0)
    else
      ChangeUIController(reward, "c2", 1)
    end
    reward.onClick:Set(function()
      PassportWindow.RewardItemClick(data, state)
    end)
  end
end

function PassportWindow.ShowGetEffect()
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
            LuaUtil.SetScale(effect, 75, 62, 75)
          else
            UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_light.prefab", v.reward.parent:GetChild("Effect2Holder"), nil, true, function()
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

function PassportWindow.RewardItemClick(data, state)
  if 2 == state and PassportData.info.lv >= data.level and data.reward ~= "" then
    PassportService.BattlePassGetRewardReq(PassportData.info.passPortId, data.pass_id, data.level, false, function(msg)
      PassportData.info = msg.info
      if msg.goods then
        if #msg.goods > 0 then
          GetItemTips.Show(msg.goods)
          UIMgr:SendWindowMessage(WinResConfig.PassportWindow.name, WindowMsgEnum.Passport.GET_REWARD)
        else
          FloatTipsUtil.ShowWarnTips(T(378))
        end
      end
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.PASSPORT)
    end, function(code)
      if code == ProtoEnum.RET_CODE.RC_BATTLEPASS_OUT_TIME then
        PassportWindow.ShowQuitTips()
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

function PassportWindow.IsReward(passId, lv)
  for i, v in pairs(PassportData.info.rewards) do
    if v.passId == passId then
      if table.contain(v.rewardLvs, lv) then
        return 1
      elseif lv <= PassportData.info.lv then
        return 2
      else
        return 0
      end
    end
  end
  if lv <= PassportData.info.lv then
    return 2
  else
    return 0
  end
end

function PassportWindow.RefreshRewardFirst()
  PassportWindow.ShowState(PassportData.info.openList[2], uis.Main.RewardRegion.StartTwo.Pic.c1Ctr)
end

function PassportWindow.RefreshRewardEnd(showLv, data, page)
  uis.Main.RewardRegion.EndTwo.LevelTxt.text = showLv
  if data then
    local state = PassportWindow.IsReward(data.pass_id, showLv)
    if page then
      PassportWindow.RefreshRewardShow(data, uis.Main.RewardRegion.EndTwo.Item1.root)
      PassportWindow.ShowState(PassportData.info.openList[1], uis.Main.RewardRegion.EndTwo.Item1.c1Ctr)
      if PassportData.info.openList[1] then
        PassportWindow.RefreshRewardState(uis.Main.RewardRegion.EndTwo.Item1.root, state)
        if 2 == state then
          uis.Main.RewardRegion.EndTwo.Item2.EffectHolder.visible = false
          uis.Main.RewardRegion.EndTwo.Item1.EffectHolder.visible = true
        else
          uis.Main.RewardRegion.EndTwo.Item1.EffectHolder.visible = false
        end
        uis.Main.RewardRegion.EndTwo.Item1.root.onClick:Set(function()
          PassportWindow.RewardItemClick(data, state)
        end)
      end
    else
      PassportWindow.RefreshRewardShow(data, uis.Main.RewardRegion.EndTwo.Item2.root)
      PassportWindow.ShowState(PassportData.info.openList[2], uis.Main.RewardRegion.EndTwo.Item2.c1Ctr)
      if PassportData.info.openList[2] then
        PassportWindow.RefreshRewardState(uis.Main.RewardRegion.EndTwo.Item2.root, state)
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
        PassportWindow.RewardItemClick(data, state)
      end)
    end
  end
end

function PassportWindow.ShowState(bolLock, ctr)
  if bolLock then
    ctr.selectedIndex = 0
  else
    ctr.selectedIndex = 1
  end
end

function PassportWindow.RefreshRewardShow(data, Item)
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

function PassportWindow.RefreshRewardState(Item, isReward)
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

function PassportWindow.OpenBuyWindow()
  if not PassportData.info.openList[2] then
    OpenWindow(WinResConfig.PassportBuyWindow.name)
  end
end

function PassportWindow.PassportActivate()
  PassportService.GetBattlePassInfoReq(function()
    PassportData.GetPassport()
  end)
end

function PassportWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.PassportWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_TASK)
  if PassportData.info then
    uis.Main.RewardRegion.StartTwo.Pic.root.onClick:Set(function()
      local item = uis.Main.TabRegion.TabList:GetChildAt(2)
      if item then
        item.onClick:Call()
      end
    end)
    uis.Main.AllGetBtn.onClick:Set(function()
      if 0 == uis.Main.c1Ctr.selectedIndex then
        PassportService.BattlePassGetRewardReq(PassportData.info.passPortId, nil, nil, true, function(msg)
          PassportData.info = msg.info
          if msg.goods then
            if #msg.goods > 0 then
              GetItemTips.Show(msg.goods)
              UIMgr:SendWindowMessage(WinResConfig.PassportWindow.name, WindowMsgEnum.Passport.GET_REWARD)
            else
              FloatTipsUtil.ShowWarnTips(T(378))
            end
          end
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.PASSPORT)
        end, function(code)
          if code == ProtoEnum.RET_CODE.RC_BATTLEPASS_OUT_TIME then
            PassportWindow.ShowQuitTips()
          end
        end)
      elseif 1 == uis.Main.c1Ctr.selectedIndex then
        PassportService.BattlePassTaskRewardReq(PassportData.info.passPortId, 0, function(msg)
          if msg.info then
            PassportData.info = msg.info
          end
          UIMgr:SendWindowMessage(WinResConfig.PassportWindow.name, WindowMsgEnum.Passport.GET_TASK_REWARD, msg.exp)
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.PASSPORT)
        end, function(code)
          if code == ProtoEnum.RET_CODE.RC_BATTLEPASS_OUT_TIME then
            PassportWindow.ShowQuitTips()
          end
        end)
      end
    end)
    uis.Main.LevelRegion.LevelBtn.LevelBuyBtn.onClick:Set(function()
      if PassportData.info.lv < lvMax then
        OpenWindow(WinResConfig.PassportBuyLevelWindow.name, nil, PassportData.info.passPortId)
      end
    end)
  end
  uis.Main.RewardRegion.StartTwo.Pic1.WordTxt.text = T(1454)
  uis.Main.RewardRegion.StartTwo.Pic.WordTxt.text = T(1450)
end

function PassportWindow.ShowExpBarAnim(expChange)
  if expChange then
    if expMax and PassportData.info.expLimit >= expMax then
      PassportWindow.SetLevelInfo()
      return
    end
    if lvTween then
      LeanTween.cancel(lvTween.uniqueId)
      lvTween = nil
    end
    local expBar = uis.Main.LevelRegion.LevelBtn.ExpProgressBar
    local lvData = PassportData.GetNextExpDataByPhaseId(modelType, PassportData.info.lv)
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
        PassportWindow.SetLevelInfo()
      end
      lvTween = nil
    end)
  end
end

function PassportWindow.InitTask()
  local taskCycleList = uis.Main.TaskRegion.TaskCycleList
  local cycleData = {
    {
      txt = T(1003),
      data = PassportData.info.dailyTask,
      redVisibleFunc = function()
        return RedDotPassport.DailyTaskComplete()
      end
    },
    {
      txt = T(1004),
      data = PassportData.info.weeklyTask,
      redVisibleFunc = function()
        return RedDotPassport.WeeklyTaskComplete()
      end
    },
    {
      txt = T(1005),
      data = PassportData.info.totalTask,
      redVisibleFunc = function()
        return RedDotPassport.TotalTaskComplete()
      end
    }
  }
  taskCycleList.selectedIndex = -1
  
  function taskCycleList.itemRenderer(i, item)
    UIUtil.SetText(item, cycleData[i + 1].txt, "WordTxt")
    ChangeUIController(item, "c1", i)
    item.onClick:Set(function()
      if taskCycleList.selectedIndex ~= i then
        taskCycleList.selectedIndex = i
        PassportData.taskIndex = i
        PassportWindow.ShowTask(cycleData[i + 1].data)
      end
    end)
    if i == PassportData.taskIndex then
      item.onClick:Call()
    end
    RedDotMgr.AddNode({
      windowName = WinResConfig.PassportWindow.name,
      com = item,
      visibleFunc = cycleData[i + 1].redVisibleFunc,
      dataType = RED_DOT_DATA_TYPE.PASSPORT
    })
  end
  
  taskCycleList.numItems = #cycleData
  ChangeController(uis.Main.c2Ctr, RedDotPassport.CanTask() and 1 or 0)
end

function PassportWindow.ShowTask(taskData)
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
  local list = uis.Main.TaskRegion.TaskList
  
  function list.itemRenderer(i, item)
    local v = taskData[i + 1]
    if v then
      local task = item:GetChild("Task")
      local data = TableData.GetConfig(v.taskId, "BaseTask")
      UIUtil.SetText(task, data.name(), "NameTxt")
      UIUtil.SetText(task, T(1006), "GetTxt")
      UIUtil.SetText(task:GetChild("TaskExp"), data.passport_exp, "NumberTxt")
      ChangeUIController(task, "c1", v.state)
      ChangeUIController(task, "c2", 1)
      ChangeUIController(task, "c3", (v.state == ProtoEnum.TASK_STATE.REWARD or PassportData.info.lv >= lvMax) and 1 or 0)
      local barValue = math.min(v.value, data.task_parameter[1])
      if v.state == ProtoEnum.TASK_STATE.FINISHED then
        UIUtil.SetText(task, T(872, barValue, data.task_parameter[1]), "ProgressTxt")
        task.onClick:Set(function()
          if v.state == ProtoEnum.TASK_STATE.FINISHED then
            PassportService.BattlePassTaskRewardReq(PassportData.info.passPortId, 0, function(msg)
              if msg.info then
                PassportData.info = msg.info
              end
              UIMgr:SendWindowMessage(WinResConfig.PassportWindow.name, WindowMsgEnum.Passport.GET_TASK_REWARD, msg.exp)
              RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.PASSPORT)
            end, function(code)
              if code == ProtoEnum.RET_CODE.RC_BATTLEPASS_OUT_TIME then
                PassportWindow.ShowQuitTips()
              end
            end)
          end
        end)
      else
        task.onClick:Set(function()
        end)
        UIUtil.SetText(task, T(897, barValue, data.task_parameter[1]), "ProgressTxt")
      end
      local GoToBtn = task:GetChild("TaskGuideBtn")
      if GoToBtn and data.go_to_id then
        local featureData = TableData.GetConfig(data.go_to_id, "BaseFeature")
        if featureData then
          CurrencyReturnWindow.SetJumpFun(GoToBtn, featureData)
        end
      end
      task.alpha = 0
      PlayUITrans(item, "up", function()
        task.alpha = 1
      end, i * 0.08)
    end
  end
  
  list.numItems = #taskData
end

function PassportWindow.InitClothes()
  if passPortConfig then
    local clothes = uis.Main.CardClothesRegion
    clothes.PicLoader.url = UIUtil.GetResUrl(passPortConfig.fashion_pic)
    clothes.ClothesTips.WordTxt.text = T(1007)
    local LoadListItem = function(list, rewards, clear, buy)
      if list.numItems > 0 and clear then
        for i = 1, list.numItems do
          list:RemoveChildAt(0, true)
        end
      end
      local arrItem = GetConfigItemList(rewards, true)
      for i, v in pairs(arrItem) do
        if v.id ~= 21000007 then
          local item = UIMgr:CreateComponent("Passport", "Clothes_ItemFrame")
          UIUtil.ShowItemFrame(v.id, item, v.value, nil, function()
            UIUtil.CommonItemClickCallback(v.id, v.type)
          end)
          ChangeUIController(item, "buy", buy and 1 or 0)
          list:AddChild(item)
        end
      end
    end
    local ChangeListItemState = function(list)
      if list.numItems > 0 then
        for i = 1, list.numItems do
          ChangeUIController(list:GetChildAt(i - 1), "buy", 1)
        end
      end
    end
    local highData = PassportMgr.GetPlatformId(passPortConfig.id, 4)
    local superData = PassportMgr.GetPlatformId(passPortConfig.id, 6)
    local minData = PassportMgr.GetPlatformId(passPortConfig.id, 7)
    local newHighRewards = {}
    if highData then
      local gradeTips = clothes.Grade1
      gradeTips.WordTxt.text = T(1448)
      gradeTips.TitleTxt.text = T(1449)
      gradeTips.NameTxt.text = T(1450)
      UIUtil.SetText(gradeTips.BuyBtn, T(1008, highData.price), "PriceTxt")
      local state = ShopData.limitRecord[highData.id] or ShopData.limitRecord[superData.id]
      newHighRewards = SimpleCopy(highData.rewards)
      if highData.diamond and highData.diamond > 0 then
        table.insert(newHighRewards, "1:21000002:" .. highData.diamond)
      end
      if highData.bindDiamond and highData.bindDiamond > 0 then
        table.insert(newHighRewards, "1:21000001:" .. highData.bindDiamond)
      end
      LoadListItem(gradeTips.ItemList, newHighRewards, true, state)
      gradeTips.BuyBtn.onClick:Set(function()
        ShopMgr.BuyProduct(highData.id, function()
          PassportWindow.PassportActivate()
          if uis then
            state = ShopData.limitRecord[highData.id] or ShopData.limitRecord[superData.id]
            ChangeController(gradeTips.buyCtr, state and 1 or 0)
            ChangeListItemState(gradeTips.ItemList)
            if ShopData.limitRecord[highData.id] and not ShopData.limitRecord[superData.id] then
              UIUtil.SetText(clothes.Grade2.BuyBtn, T(1008, minData.price), "PriceTxt")
              if #newHighRewards > 0 then
                for i = 1, #newHighRewards do
                  ChangeUIController(clothes.Grade2.ItemList:GetChildAt(i - 1), "buy", 1)
                end
              end
            end
            ChangeController(clothes.c1Ctr, 1)
          end
        end)
      end)
      ChangeController(gradeTips.buyCtr, state and 1 or 0)
      gradeTips.GetTips.WordTxt.text = T(1011)
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_yueka1.prefab", clothes.Grade1.EffectHolder)
    end
    if superData and minData then
      local buyId = superData.id
      local gradeTips = clothes.Grade2
      gradeTips.TitleTxt.text = T(1449)
      gradeTips.NameTxt.text = T(1451)
      if ShopData.limitRecord[highData.id] then
        buyId = minData.id
        gradeTips.WordTxt.text = T(1452)
        UIUtil.SetText(gradeTips.BuyBtn, T(1008, minData.price), "PriceTxt")
      else
        gradeTips.WordTxt.text = T(1452)
        UIUtil.SetText(gradeTips.BuyBtn, T(1008, superData.price), "PriceTxt")
      end
      if superData then
        local arrItem = GetConfigItemList(superData.rewards, true)
        LoadListItem(gradeTips.ItemList, newHighRewards, true, ShopData.limitRecord[superData.id] or ShopData.limitRecord[highData.id])
        local item = UIMgr:CreateComponent("Passport", "Clothes_ItemAdd")
        gradeTips.ItemList:AddChild(item)
        local newRewards = SimpleCopy(minData.rewards)
        if minData.diamond and minData.diamond > 0 then
          table.insert(newRewards, "1:21000002:" .. minData.diamond)
        end
        if minData.bindDiamond and minData.bindDiamond > 0 then
          table.insert(newRewards, "1:21000001:" .. minData.bindDiamond)
        end
        LoadListItem(gradeTips.ItemList, newRewards, false, ShopData.limitRecord[superData.id] or ShopData.limitRecord[minData.id])
      end
      gradeTips.BuyBtn.onClick:Set(function()
        if ShopData.limitRecord[highData.id] then
          buyId = minData.id
        end
        ShopMgr.BuyProduct(buyId, function()
          PassportWindow.PassportActivate()
          if uis then
            ChangeController(gradeTips.buyCtr, (ShopData.limitRecord[superData.id] or ShopData.limitRecord[minData.id]) and 1 or 0)
            ChangeListItemState(clothes.Grade2.ItemList)
            local state = ShopData.limitRecord[highData.id] or ShopData.limitRecord[superData.id]
            ChangeController(clothes.Grade1.buyCtr, state and 1 or 0)
            ChangeListItemState(clothes.Grade1.ItemList)
            ChangeController(clothes.c1Ctr, 1)
          end
        end)
      end)
      ChangeController(gradeTips.buyCtr, (ShopData.limitRecord[superData.id] or ShopData.limitRecord[minData.id]) and 1 or 0)
      gradeTips.GetTips.WordTxt.text = T(1011)
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_yueka2.prefab", clothes.Grade2.EffectHolder)
    end
    if passPortConfig.fashion_id and passPortConfig.fashion_id[1] then
      local fashionData = TableData.GetConfig(passPortConfig.fashion_id[1], "BaseFashion")
      if fashionData then
        UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionData.spd), clothes.CardQB.QBHolder, SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionData.spd_scale / 10000, true, function(spineModel)
          SkeletonAnimationUtil.SetFlip(spineModel, false, false)
          SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
        end)
        PlayUITrans(clothes.CardQB.root, "up")
      end
      uis.Main.CardClothesRegion.CardLookBtn.onClick:Set(function()
        OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, {
          {
            id = fashionData.id
          }
        })
      end)
    end
    clothes.c1Ctr.selectedIndex = PassportData.info.openList[2] and 1 or 0
  end
end

function PassportWindow.SetLastLv()
  if nil == lastLv then
    lastLv = {}
  end
  lastLv[1] = PassportData.info.lv
  if PassportData.info.openList[2] then
    lastLv[2] = PassportData.info.lv
  else
    lastLv[2] = -1
  end
end

function PassportWindow.OnShown()
  if uis and waitMessageId then
    PassportWindow.HandleMessage(waitMessageId)
  end
end

function PassportWindow.PlayFirstRewardEffect()
  for i = 1, 2 do
    if lastLv[i] < PassportData.info.lv and PassportData.info.openList[i] then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_light_main.prefab", uis.Main.RewardRegion.StartTwo[string.format("Effect%sHolder", i)], nil, true)
    end
  end
end

function PassportWindow.PlayEndRewardEffect()
  for i = 1, 2 do
    if lvMax == PassportData.info.lv and PassportData.info.openList[i] then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/PassCard/FX_passcard_light_end.prefab", uis.Main.RewardRegion.EndTwo[string.format("Effect%sHolder", i)], nil, true)
    end
  end
end

function PassportWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Passport.BUY then
    if 0 == uis.Main.c1Ctr.selectedIndex then
      if UIMgr:IsWindowOpen(WinResConfig.PassportWindow.name) then
        local lvUp = PassportWindow.ShowLevelUp()
        if lvUp then
          passLv[PassportData.info.passPortId] = PassportData.info.lv
          return
        end
        PassportWindow.SetLevelInfo()
        uis.Main.RewardRegion.MiddleList.MiddleList:RefreshVirtualList()
        PassportWindow.SetListPos()
        rewardLv[1] = 0
        rewardLv[2] = 0
        PassportWindow.RefreshListReward(uis.Main.RewardRegion.MiddleList.MiddleList.scrollPane.posX)
        ChangeController(uis.Main.c2Ctr, RedDotPassport.CanReward() and 1 or 0)
        TimerUtil.setTimeout(0.2, function()
          if uis then
            PassportWindow.PlayFirstRewardEffect()
            PassportWindow.SetLastLv()
          end
        end)
        waitMessageId = nil
      else
        waitMessageId = msgId
      end
    elseif 1 == uis.Main.c1Ctr.selectedIndex then
      PassportWindow.SetLevelInfo()
      passLv[PassportData.info.passPortId] = PassportData.info.lv
      PassportWindow.SaveLevel()
    end
  elseif msgId == WindowMsgEnum.Passport.GET_REWARD then
    uis.Main.RewardRegion.MiddleList.MiddleList:RefreshVirtualList()
    rewardLv[1] = 0
    rewardLv[2] = 0
    PassportWindow.RefreshListReward(uis.Main.RewardRegion.MiddleList.MiddleList.scrollPane.posX)
    ChangeController(uis.Main.c2Ctr, RedDotPassport.CanReward() and 1 or 0)
  elseif msgId == WindowMsgEnum.Passport.ACTIVATE then
    PassportWindow.PassportActivate()
    PassportWindow.InitClothes()
  elseif msgId == WindowMsgEnum.Passport.GET_TASK_REWARD then
    PassportWindow.InitTask()
    local lvUp = PassportWindow.ShowLevelUp()
    if lvUp then
      passLv[PassportData.info.passPortId] = PassportData.info.lv
    end
    if para and para > 0 then
      PassportWindow.ShowExpBarAnim(para)
    else
      PassportWindow.SetLevelInfo()
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    PassportService.GetBattlePassInfoReq(function()
      PassportData.GetPassport()
      if PassportData.info then
        if LoginData.GetCurServerTime() >= PassportData.info.endStamp then
          PassportWindow.ShowQuitTips()
        elseif 1 == uis.Main.c1Ctr.selectedIndex then
          PassportWindow.InitTask()
          FloatTipsUtil.ShowWarnTips(T(1058))
        end
      end
    end)
  elseif msgId == WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE then
    PassportWindow.CheckItemTime()
  end
end

function PassportWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.PassportWindow.name)
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
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return PassportWindow
