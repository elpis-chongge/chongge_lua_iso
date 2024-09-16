require("BattleBuffTips_BuffTipsWindowByName")
local BuffTipsWindow = {}
local uis, contentPane, closeCallback, buffTipsInfo, curUid, curType, showAnim

function BuffTipsWindow.ReInitData()
end

function BuffTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BuffTipsWindow.package, WinResConfig.BuffTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBattleBuffTips_BuffTipsWindowUis(contentPane)
    curUid = bridgeObj.argTable[1]
    closeCallback = bridgeObj.argTable[2]
    curType = bridgeObj.argTable[3]
    BuffTipsWindow.InitBtn()
    BuffTipsWindow.UpdateInfo()
    LightManager:SetCameraBloom(UICamera, false)
  end)
end

function BuffTipsWindow.UpdateInfo()
  buffTipsInfo = BattleScene.GetUnitListForBuffTips(curType)
  buffTipsInfo = table.reverseTable(buffTipsInfo)
  if buffTipsInfo then
    local toIndex
    if curUid then
      for i = 1, #buffTipsInfo do
        if buffTipsInfo[i].uid == curUid then
          toIndex = i - 1
          break
        end
      end
    end
    local list = uis.Main.HeadList
    uis.Main.HeadList.selectedIndex = -1
    
    function list.itemRenderer(index, item)
      BuffTipsWindow.SetController(item, "button")
      BuffTipsWindow.SetController(item, "c1")
      local i = index + 1
      local config = buffTipsInfo[i]:GetBaseConfig()
      local fashionConfig = buffTipsInfo[i]:GetFashionConfig()
      local head = item:GetChild("CardHead")
      if curType == BATTLE_CAMP_FLAG.LEFT then
        head = item:GetChild("CardHead")
        if fashionConfig then
          head:GetChild("Pic"):GetChild("PicLoader").url = UIUtil.GetResUrl(fashionConfig.head_icon_rect)
        end
        ChangeUIController(item, "c1", 0)
      else
        head = item:GetChild("MonsterHead")
        if fashionConfig then
          head:GetChild("Pic"):GetChild("PicLoader").url = UIUtil.GetResUrl(fashionConfig.head_icon_square)
        end
        UIUtil.SetText(head:GetChild("Sign"), StoryMgr.GetMonsterName(buffTipsInfo[i].monsterRank), "NameTxt")
        ChangeUIController(head:GetChild("Sign"), "c1", buffTipsInfo[i].monsterRank)
        ChangeUIController(item, "c1", 1)
      end
      if config then
        ChangeUIController(head:GetChild("Occupation"), "c1", config.type - 1)
        ChangeUIController(head, "c1", config.star - 1)
        UIUtil.ShowElementList(head:GetChild("ElementList"), config)
      end
      local hp = buffTipsInfo[i].tempHpPer
      if hp then
        local hpProgressBar = head:GetChild("HpProgressBar")
        hpProgressBar.value = 100 * hp
      end
      local buffDataList = buffTipsInfo[i]:GetBuffIconList()
      local buffList = head:GetChild("BuffList")
      buffList:RemoveChildrenToPool()
      if buffDataList then
        local itemBuff, buffLoader, buffProgressBar, numberTxt
        for i, data in ipairs(buffDataList) do
          itemBuff = buffList:AddItemFromPool()
          buffLoader = itemBuff:GetChild("BuffLoader")
          buffProgressBar = itemBuff:GetChild("BuffIconProgressBar")
          numberTxt = itemBuff:GetChild("NumberTxt")
          if data.count > 1 then
            numberTxt.text = data.count
          else
            numberTxt.text = ""
          end
          buffLoader.url = UIUtil.GetResUrl(data.iconPath)
          if data.remainFrames and data.remainMaxFrames then
            buffProgressBar.visible = true
            buffProgressBar.value = 100 * (data.remainMaxFrames - data.remainFrames) / data.remainMaxFrames
          else
            buffProgressBar.visible = false
          end
        end
      end
      item.onClick:Set(function()
        if list.selectedIndex == index then
          return
        end
        local burst = BattleScene.GetBurst(buffTipsInfo[i].camp)
        local burstSecond
        if burst and burst.energySkillRemainFrame then
          burstSecond = math.ceil(burst.energySkillRemainFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
        end
        BuffTipsWindow.ShowCardBuffInfo(buffDataList, burstSecond)
        if curType == BATTLE_CAMP_FLAG.LEFT then
          UIUtil.SetCardShowSpineAutoAlpha(fashionConfig.id, nil, uis.Main.CardShow.ShowHolder, true, nil, nil, true)
          ChangeController(uis.Main.c1Ctr, 0, true)
        else
          local skinConf = TableData.GetConfig(fashionConfig.id, "BaseFashion")
          if skinConf then
            local go = ResourceManager.Instantiate(ModelUtil.GetFullPath(skinConf.spd))
            local scale = type(skinConf.manor_scale) == "number" and skinConf.manor_scale / 10000 or 1
            local val = TableData.GetConfig(70010813, "BaseFixed").int_value / 10000
            local scaleRatio = 1.25 * scale * val * 10000
            UIUtil.SetObjectToUI(go, uis.Main.MonterShow.ShowHolder, scaleRatio)
            SkeletonAnimationUtil.SetShaderEffectEnable(go, false, false, false, true)
            SkeletonAnimationUtil.SetAnimation(go, 0, SPINE_STATE_ENUM.IDLE, true)
            go:IgnoreTimeScale(true)
          end
          ChangeController(uis.Main.c1Ctr, 1, true)
        end
        list.selectedIndex = index
      end)
      if curUid then
        if buffTipsInfo[i].uid == curUid then
          item.onClick:Call()
          toIndex = nil
          curUid = nil
        end
      elseif 0 == index then
        item.onClick:Call()
      end
      if showAnim then
        head.alpha = 0
        TimerUtil.setTimeout(index * 0.07, function()
          PlayUITrans(item, "Switch", function()
            head.alpha = 1
          end, nil, nil, nil, nil, true)
        end, nil, nil, true)
      end
    end
    
    list:SetVirtual()
    list.numItems = #buffTipsInfo
    if toIndex then
      list:ScrollToView(toIndex)
    end
  end
end

function BuffTipsWindow.ShowCardBuffInfo(buffDataList, burstSecond)
  local addBuff = {}
  local reduceBuff = {}
  for i, data in ipairs(buffDataList) do
    local buffConfig = TableData.GetConfig(data.buffId, "BaseSkillBuff")
    if buffConfig then
      data.showType = data.showType or 0
      if data.showType == BATTLE_BUFF_TYPE.ADD_EFFECT then
        table.insert(addBuff, {config = buffConfig, buffInfo = data})
      elseif data.showType == BATTLE_BUFF_TYPE.REDUCE_EFFECT then
        table.insert(reduceBuff, {config = buffConfig, buffInfo = data})
      end
    end
  end
  uis.Main.BuffCount.WordTxt.text = T(1343)
  uis.Main.BuffCount.BuffTxt.text = T(1344, #addBuff)
  uis.Main.BuffCount.DeBuffTxt.text = T(1345, #reduceBuff)
  local allBuff = {addBuff, reduceBuff}
  local titleNumber = {1346, 1347}
  local hintNumber = {1348, 1349}
  
  function uis.Main.BuffList.itemRenderer(i, item)
    local index = i + 1
    BuffTipsWindow.LoadBuff(allBuff[index], item, titleNumber[index], hintNumber[index], burstSecond)
  end
  
  uis.Main.BuffList.numItems = 2
end

function BuffTipsWindow.LoadBuff(data, item, titleNumber, hintNumber, burstSecond)
  local len = #data
  UIUtil.SetText(item:GetChild("BuffTitle"), T(titleNumber, len), "WordTxt")
  local buffList = item:GetChild("BuffList")
  if len > 0 then
    function buffList.itemRenderer(index, buff)
      local i = index + 1
      
      if data[i].buffInfo then
        buff:GetChild("BuffLoader").url = UIUtil.GetResUrl(data[i].buffInfo.iconPath)
        if data[i].buffInfo.remainFrames then
          local second = math.ceil(data[i].buffInfo.remainFrames / BATTLE_CONFIG_ENUM.FIXED_FPS)
          if second > 0 then
            UIUtil.SetText(buff, T(1447, second), "NumberTxt")
          else
            UIUtil.SetText(buff, "", "NumberTxt")
          end
        elseif data[i].buffInfo.remainFrames == nil and data[i].buffInfo.deduceType == BUFF_DEDUCE_TYPE.ENERGY_SKILL_END and burstSecond then
          UIUtil.SetText(buff, T(1447, burstSecond), "NumberTxt")
        else
          UIUtil.SetText(buff, "∞", "NumberTxt")
        end
      end
      if data[i].config then
        UIUtil.SetText(buff, data[i].config.name and data[i].config.name() or "", "NameTxt")
        local des = data[i].config.des and data[i].config.des() or ""
        if string.find(des, "{t:s}") then
          des = string.gsub(des, "{t:s}", math.ceil(data[i].buffInfo.remainMaxFrames / BATTLE_CONFIG_ENUM.FIXED_FPS))
        end
        UIUtil.SetText(buff, des, "WordTxt")
      end
      if data[i].buffInfo.count and data[i].buffInfo.count > 1 then
        UIUtil.SetText(buff, data[i].buffInfo.count, "BuffNumberTxt")
      else
        UIUtil.SetText(buff, "", "BuffNumberTxt")
      end
    end
    
    buffList.numItems = len
    ChangeUIController(item, "c1", 0)
  else
    UIUtil.SetText(item:GetChild("BuffNothing"), T(hintNumber), "WordTxt")
    ChangeUIController(item, "c1", 1)
    buffList.numItems = 0
  end
  buffList:ResizeToFit()
end

function BuffTipsWindow.SetController(com, controllerName)
  local controller = com:GetController(controllerName)
  if controller then
    controller.ignoreTimeScale = true
  end
end

function BuffTipsWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BuffTipsWindow.name)
    LightManager:SetCameraBloom(UICamera, true, 1, 255, 255, 255, 1.1, 0, "UI")
  end)
  if BattleData.stageType ~= ProtoEnum.SCENE_TYPE.ARENA then
    BuffTipsWindow.SetController(uis.Main.SwitchBtn, "button")
    uis.Main.SwitchBtn.onClick:Set(function()
      if curType == BATTLE_CAMP_FLAG.LEFT then
        curType = BATTLE_CAMP_FLAG.RIGHT
      elseif curType == BATTLE_CAMP_FLAG.RIGHT then
        curType = BATTLE_CAMP_FLAG.LEFT
      end
      showAnim = true
      BuffTipsWindow.UpdateInfo()
    end)
    uis.Main.SwitchBtn.visible = true
    uis.Main.SwitchBtn.selected = curType == BATTLE_CAMP_FLAG.RIGHT
  else
    uis.Main.SwitchBtn.visible = false
  end
end

function BuffTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  if type(closeCallback) == "function" then
    closeCallback()
    closeCallback = nil
  end
  buffTipsInfo = nil
  curUid = nil
  curType = nil
  showAnim = nil
end

return BuffTipsWindow
