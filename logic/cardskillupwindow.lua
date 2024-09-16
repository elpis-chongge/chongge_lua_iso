CardSkillUpWindow = {}
local uis, starAddLv, selectedBtn, cardId, curSkillName

function CardSkillUpWindow.Open(_uis, _cardId)
  uis = _uis
  cardId = _cardId
  curSkillName = nil
  CardSkillUpWindow.InitBtn()
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Roleskills/FX_UI_roleskills.prefab", uis.Effect.EffectHolder)
  CardSkillUpWindow.ShowHeadList()
  PlayUITrans(uis.root, "in")
end

function CardSkillUpWindow.ShowHeadList()
  local listData = CardData.GetDetailsSortData()
  if nil == listData or #listData < 1 then
    listData = CardData.GetSortCardList()
  end
  local ctrPage
  local list = uis.HeadList
  list.selectedIndex = -1
  
  function list.itemRenderer(i, item)
    UIUtil.SetHeadByFaceId(listData[i + 1].fashionId, item:GetChild("HeadBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
    ChangeUIController(item:GetChild("Breach"), "c1", listData[i + 1].quality)
    item.onClick:Set(function()
      if list.selectedIndex ~= i then
        CardMgr.InitData(listData[i + 1].cardId)
        print(listData[i + 1].cardId, ">>>>>>>", CardMgr.cardInfoData.cardId)
        selectedBtn = nil
        cardId = listData[i + 1].cardId
        CardSkillUpWindow.InitStarAddSkillLv()
        CardSkillUpWindow.OnInit(true)
        list.selectedIndex = i
        UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.COM_TYPE.CHANGE_CARD)
      end
    end)
    if listData[i + 1].cardId == cardId then
      ctrPage = i
    end
  end
  
  list.numItems = #listData
  if ctrPage then
    list.selectedIndex = ctrPage
    list:ScrollToView(ctrPage)
  end
  CardSkillUpWindow.InitStarAddSkillLv()
  CardSkillUpWindow.OnInit()
end

function CardSkillUpWindow.ShowSkillLv(typeCom, lv, ctr, skillType, maxLevel)
  ChangeUIController(typeCom, "c1", ctr)
  UIUtil.SetText(typeCom, string.format("%s/%s", lv, maxLevel < lv and lv or maxLevel), "NumberTxt")
  if skillType then
    UIUtil.SetText(typeCom, CardData.GetSkillTypeName(skillType), "NameTxt")
  end
end

function CardSkillUpWindow.SetUpEffect(btn, bol)
  if btn then
    btn:GetChild("EffectHolder").visible = bol and true or false
    ChangeUIController(btn, "c2", bol and 1 or 0)
  end
end

function CardSkillUpWindow.OnInit(changeBol)
  local skillId = {
    CardMgr.cardConfigData.normal_skill,
    CardMgr.cardConfigData.special_skill,
    CardMgr.cardConfigData.burst_skill
  }
  local skillName = {
    "Skill1",
    "Skill3",
    "Skill5"
  }
  for i = 1, #skillId do
    local btn = uis.root:GetChild(skillName[i])
    local data = TableData.GetConfig(skillId[i], "BaseSkill")
    if btn and data then
      if not changeBol then
        btn.selected = false
      end
      btn:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
      local typeCom = btn:GetChild("Type")
      if CardMgr.cardInfoData.skill2Level[data.id] then
        local lv = 1
        if CardMgr.cardInfoData.gradeUpSkills[data.id] then
          lv = CardMgr.cardInfoData.skill2Level[data.id] + CardMgr.cardInfoData.gradeUpSkills[data.id]
        else
          lv = CardMgr.cardInfoData.skill2Level[data.id]
        end
        if CardMgr.cardInfoData.skill2Level[data.id] >= data.max_level then
          CardSkillUpWindow.ShowSkillLv(typeCom, lv, 2, data.type, data.max_level + (CardMgr.cardInfoData.gradeUpSkills[data.id] or 0))
          ChangeUIController(btn, "c1", 2)
        else
          CardSkillUpWindow.ShowSkillLv(typeCom, lv, 1, data.type, data.max_level + (CardMgr.cardInfoData.gradeUpSkills[data.id] or 0))
          ChangeUIController(btn, "c1", 1)
        end
      else
        CardSkillUpWindow.ShowSkillLv(typeCom, 1, 0, data.type, data.max_level)
        ChangeUIController(btn, "c1", 0)
      end
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/skill_levelup/FX_skilllevelup_prepare2.prefab", btn:GetChild("EffectHolder"))
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/skill_levelup/FX_skilllevelup_prepare.prefab", btn:GetChild("Effect1Holder"))
      CardSkillUpWindow.SetUpEffect(btn, CardSkillUpWindow.CanLvUp(data))
      btn.onClick:Set(function()
        curSkillName = skillName[i]
        btn.selected = true
        CardSkillUpWindow.ShowSkillTips(data, btn, "Assets/Art/Effects/Prefab/UI_prefab/skill_levelup/FX_skilllevelup_choose.prefab")
      end)
      if changeBol and curSkillName and curSkillName == skillName[i] then
        btn.onClick:Call()
      end
    end
  end
  local skillMinName = {
    "Skill2",
    "Skill4",
    "Skill6"
  }
  skillId = CardMgr.cardConfigData.grow_skill_ids
  for i = 1, #skillId do
    local btn = uis.root:GetChild(skillMinName[i])
    local data = TableData.GetConfig(skillId[i], "BaseSkill")
    if btn and data then
      if not changeBol then
        btn.selected = false
      end
      btn:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
      local typeCom = btn:GetChild("Type")
      if CardMgr.cardInfoData.skill2Level[data.id] then
        local lv = 1
        if CardMgr.cardInfoData.gradeUpSkills[data.id] then
          lv = CardMgr.cardInfoData.skill2Level[data.id] + CardMgr.cardInfoData.gradeUpSkills[data.id]
        else
          lv = CardMgr.cardInfoData.skill2Level[data.id]
        end
        local page = 1
        if CardMgr.cardInfoData.skill2Level[data.id] >= data.max_level then
          page = 2
          ChangeUIController(btn, "c1", 2)
        else
          ChangeUIController(btn, "c1", 1)
        end
        CardSkillUpWindow.ShowSkillLv(typeCom, lv, page, nil, data.max_level + (CardMgr.cardInfoData.gradeUpSkills[data.id] or 0))
      else
        CardSkillUpWindow.ShowSkillLv(typeCom, 1, 0, nil, data.max_level)
        ChangeUIController(btn, "c1", 0)
      end
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/skill_levelup/FX_skilllevelup_prepare2_small.prefab", btn:GetChild("EffectHolder"))
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/skill_levelup/FX_skilllevelup_prepare_small.prefab", btn:GetChild("Effect1Holder"))
      CardSkillUpWindow.SetUpEffect(btn, CardSkillUpWindow.CanLvUp(data))
      btn.onClick:Set(function()
        curSkillName = skillMinName[i]
        btn.selected = true
        CardSkillUpWindow.ShowSkillTips(data, btn, "Assets/Art/Effects/Prefab/UI_prefab/skill_levelup/FX_skilllevelup_choose_small.prefab")
      end)
      if changeBol and curSkillName and curSkillName == skillMinName[i] then
        btn.onClick:Call()
      end
    end
  end
end

function CardSkillUpWindow.CanLvUp(skillData)
  local lv = CardMgr.cardInfoData.skill2Level[skillData.id] and CardMgr.cardInfoData.skill2Level[skillData.id] + 1 or 1
  if lv >= skillData.max_level then
    return false
  end
  local nextSkillLvData = TableData.GetConfig(skillData.id * 1000 + lv, "BaseSkillLevelUp")
  local skillUp = false
  if nextSkillLvData and nextSkillLvData.cost then
    skillUp = true
    local costItem = GetConfigItemList(nextSkillLvData.cost, true)
    local count
    for i = 1, #costItem do
      count = ActorData.GetItemCount(costItem[i].id)
      if count < costItem[i].value then
        skillUp = false
      end
    end
    if skillUp then
      if nextSkillLvData.need_quality_level == nil or CardMgr.cardInfoData.quality >= nextSkillLvData.need_quality_level then
        skillUp = true
      else
        skillUp = false
      end
    end
  end
  return skillUp
end

function CardSkillUpWindow.ShowSkillTips(skillData, skillBtn, effectPath)
  if selectedBtn and skillBtn == selectedBtn then
    return
  end
  UIUtil.SetEffectToUI(effectPath, skillBtn:GetChild("Effect2Holder"))
  if selectedBtn then
    selectedBtn.selected = false
  end
  selectedBtn = skillBtn
  local tips = uis.CardSkillTips.SkillTips
  tips.c2Ctr.selectedIndex = 0
  tips.PicLoader.url = UIUtil.GetResUrl(skillData.icon)
  tips.NameTxt.text = skillData.name()
  tips.TypeTxt.text = CardData.GetSkillTypeName(skillData.type)
  UIUtil.SetText(tips.NextBtn, T(1082))
  tips.NextBtn.selected = false
  uis.CardSkillTips.root.opaque = tips.NextBtn.selected
  tips.NextBtn.onClick:Set(function()
    tips.c2Ctr.selectedIndex = tips.NextBtn.selected and 1 or 0
    uis.CardSkillTips.root.opaque = tips.NextBtn.selected
    UIUtil.SetText(tips.NextBtn, tips.NextBtn.selected and T(1083) or T(1082))
  end)
  tips.CloseBtn.onClick:Set(function()
    tips.NextBtn.selected = false
    tips.c2Ctr.selectedIndex = 0
    uis.CardSkillTips.root.opaque = tips.NextBtn.selected
    UIUtil.SetText(tips.NextBtn, tips.NextBtn.selected and T(1083) or T(1082))
  end)
  local cardInfo = CardData.GetCardDataById(cardId)
  if cardInfo then
    CardSkillUpWindow.UpdateInfo(skillData, cardInfo)
  end
  tips.SkillMax.NameTxt.text = T(927)
  tips.SkillMax.SubtitleTxt.text = T(928)
  if 0 == uis.c1Ctr.selectedIndex then
    uis.PopupCloseBtn.touchable = false
    UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.COM_TYPE.SKILL_TO_LEFT)
    PlayUITrans(uis.root, "toleft", function()
      uis.PopupCloseBtn.touchable = true
    end)
    ChangeController(uis.c1Ctr, 1)
    PlayUITrans(uis.CardSkillTips.root, "in")
  end
end

function CardSkillUpWindow.ShowSkillDes(info, skills, skInfo)
  UIUtil.SetText(info, T(1135), "TitleTxt")
  local list = info:GetChild("SkillList")
  local name = {
    T(1136),
    T(1137),
    T(1138)
  }
  
  function list.itemRenderer(i, item)
    local arr = Split(skills[i + 1], ":")
    local type = tonumber(arr[1])
    if type and name[type + 1] then
      UIUtil.SetText(item, name[type + 1], "NameTxt")
      ChangeUIController(item, "c1", type)
    end
    if 0 == type then
      local lockLv = string.sub(arr[2], -3)
      if lockLv then
        lockLv = tonumber(lockLv)
        ChangeUIController(item, "c2", lockLv <= skInfo.level and 1 or 0)
      end
    elseif 1 == type then
      local star = tonumber(arr[3])
      if skInfo.cardInfo and star and star <= skInfo.cardInfo.grade then
        ChangeUIController(item, "c2", 1)
      else
        ChangeUIController(item, "c2", 0)
      end
    elseif 2 == type then
      local badgeId = tonumber(arr[3])
      local badgeStar = tonumber(arr[4])
      local badgeInfo = ActorData.GetBadgeInfoById(badgeId)
      if badgeInfo and badgeStar and badgeStar <= badgeInfo.grade then
        ChangeUIController(item, "c2", 1)
      else
        ChangeUIController(item, "c2", 0)
      end
    end
    local skillLvData = TableData.GetConfig(tonumber(arr[2]), "BaseSkillLevelUp")
    if skillLvData and skillLvData.association_des then
      UIUtil.SetText(item, skillLvData.association_des(), "WordTxt")
    end
  end
  
  list.numItems = #skills
  list:ResizeToFit()
end

function CardSkillUpWindow.UpdateInfo(skillData, cardInfo)
  local tips = uis.CardSkillTips.SkillTips
  local lv = cardInfo.skill2Level[skillData.id] or 1
  local gradeLv = cardInfo.gradeUpSkills[skillData.id] or 0
  local nextDesInfo = TableData.GetConfig(skillData.id * 1000 + (lv + 1 + gradeLv), "BaseSkillLevelUp")
  local curDesInfo = TableData.GetConfig(skillData.id * 1000 + (lv + gradeLv), "BaseSkillLevelUp")
  if curDesInfo then
    function tips.WordList.itemRenderer(i, item)
      local desTxt = item:GetChild("WordTxt")
      
      desTxt.text = curDesInfo.des()
      if skillData.association_skills then
        local SkillInfo = item:GetChild("SkillInfo")
        local infoData = {
          level = CardMgr.GetCurSkillLv(skillData.id),
          cardInfo = cardInfo
        }
        CardSkillUpWindow.ShowSkillDes(SkillInfo, skillData.association_skills, infoData)
        local SizeImage = item:GetChild("SizeImage")
        SkillInfo:SetXY(SkillInfo.x, desTxt.height + 16)
        SizeImage:SetSize(SizeImage.width, desTxt.height + 16 + SkillInfo.height)
        ChangeUIController(item, "c1", 1)
      else
        local SizeImage = item:GetChild("SizeImage")
        if SizeImage then
          SizeImage:SetSize(SizeImage.width, desTxt.height + 16)
        end
        ChangeUIController(item, "c1", 0)
      end
    end
    
    tips.WordList.numItems = 1
    tips.WordList.scrollPane:ScrollTop()
  end
  if skillData.cd then
    ChangeController(tips.c3Ctr, 1)
    tips.SkillCD.WordTxt.text = T(1121, skillData.cd)
  else
    ChangeController(tips.c3Ctr, 0)
  end
  if nextDesInfo then
    function tips.SkillWordNext.WordNextList.itemRenderer(i, item)
      local desTxt = item:GetChild("WordTxt")
      
      desTxt.text = nextDesInfo.des()
      if skillData.association_skills then
        local SkillInfo = item:GetChild("SkillInfo")
        local infoData = {
          level = CardMgr.GetCurSkillLv(skillData.id),
          cardInfo = cardInfo
        }
        CardSkillUpWindow.ShowSkillDes(SkillInfo, skillData.association_skills, infoData)
        local SizeImage = item:GetChild("SizeImage")
        SkillInfo:SetXY(SkillInfo.x, desTxt.height + 16)
        SizeImage:SetSize(SizeImage.width, desTxt.height + 16 + SkillInfo.height)
        ChangeUIController(item, "c1", 1)
      else
        local SizeImage = item:GetChild("SizeImage")
        if SizeImage then
          SizeImage:SetSize(SizeImage.width, desTxt.height + 16)
        end
        ChangeUIController(item, "c1", 0)
      end
    end
    
    tips.SkillWordNext.WordNextList.numItems = 1
    tips.SkillWordNext.WordNextList.scrollPane:ScrollTop()
    if cardInfo.gradeUpSkills[skillData.id] then
      tips.SkillWordNext.LevelNextTxt.text = T(1097, lv + 1, cardInfo.gradeUpSkills[skillData.id])
    else
      tips.SkillWordNext.LevelNextTxt.text = T(244, lv + 1)
    end
  end
  local skillUp = true
  local tempId
  local costLv = cardInfo.skill2Level[skillData.id] and cardInfo.skill2Level[skillData.id] + 1 or 1
  local nextSkillLvData = TableData.GetConfig(skillData.id * 1000 + costLv, "BaseSkillLevelUp")
  if nextSkillLvData and nextSkillLvData.cost then
    local costItem = GetConfigItemList(nextSkillLvData.cost, true)
    
    function tips.StarList.itemRenderer(i, item)
      local id = costItem[i + 1].id
      local count = ActorData.GetItemCount(id)
      local needCount, countText
      if id == COMMON_ITEM_ID.GAME_COIN then
        if count >= costItem[i + 1].value then
          countText = T(828, costItem[i + 1].value)
        else
          countText = T(622, costItem[i + 1].value)
          skillUp = false
          if nil == tempId then
            tempId = id
          end
          needCount = costItem[i + 1].value - count
        end
      elseif count >= costItem[i + 1].value then
        local num = count > 999 and T(948) or count
        countText = T(609, num, costItem[i + 1].value)
      else
        countText = T(827, count, costItem[i + 1].value)
        skillUp = false
        if nil == tempId then
          tempId = id
        end
        needCount = costItem[i + 1].value - count
      end
      UIUtil.ShowItemFrame(id, item, countText, nil, function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
        OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
          id = id,
          needCount = needCount,
          fromCardId = CardMgr.cardId
        })
      end)
    end
    
    tips.StarList.numItems = #costItem
  else
    tips.StarList.numItems = 0
  end
  local tempLv = cardInfo.skill2Level[skillData.id] or 1
  tempLv = cardInfo.gradeUpSkills[skillData.id] and cardInfo.gradeUpSkills[skillData.id] + tempLv or tempLv
  if cardInfo.gradeUpSkills[skillData.id] then
    tips.LevelTxt.text = T(1097, cardInfo.skill2Level[skillData.id], cardInfo.gradeUpSkills[skillData.id])
  else
    tips.LevelTxt.text = T(244, tempLv)
  end
  if cardInfo.skill2Level[skillData.id] and cardInfo.skill2Level[skillData.id] >= skillData.max_level then
    if starAddLv[skillData.id] == nil then
      tips.c1Ctr.selectedIndex = 3
      tips.c2Ctr.selectedIndex = 0
      uis.CardSkillTips.root.opaque = false
    elseif starAddLv[skillData.id] and cardInfo.gradeUpSkills[skillData.id] and cardInfo.gradeUpSkills[skillData.id] >= starAddLv[skillData.id] then
      tips.c1Ctr.selectedIndex = 3
      tips.c2Ctr.selectedIndex = 0
      uis.CardSkillTips.root.opaque = false
    else
      tips.c1Ctr.selectedIndex = 2
    end
  else
    local lvBol = nil == nextSkillLvData.need_quality_level and true or cardInfo.quality >= nextSkillLvData.need_quality_level
    if skillUp and lvBol then
      tips.c1Ctr.selectedIndex = 1
      if cardInfo.skill2Level[skillData.id] then
        UIUtil.SetBtnText(uis.CardSkillTips.SkillTips.SkillUpSureBtn, T(805), T(806))
      else
        UIUtil.SetBtnText(uis.CardSkillTips.SkillTips.SkillUpSureBtn, T(1090), T(1091))
      end
    else
      tips.c1Ctr.selectedIndex = 0
      if skillUp or false == lvBol then
        if skillData.unlock_quality_level then
          if nextSkillLvData.need_quality_level then
            tips.SkillLock.WordTxt.text = T(1094, CardData.GetFormatNum(math.max(skillData.unlock_quality_level, nextSkillLvData.need_quality_level)))
          else
            tips.SkillLock.WordTxt.text = T(1094, CardData.GetFormatNum(skillData.unlock_quality_level))
          end
        else
          tips.SkillLock.WordTxt.text = ""
        end
        tips.SkillLock.root.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(tips.SkillLock.WordTxt.text)
        end)
      elseif lvBol then
        tips.SkillLock.WordTxt.text = T(1124)
        tips.SkillLock.root.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(T(1124))
        end)
      end
    end
  end
  tips.SkillUpSureBtn.onClick:Set(function()
    if skillUp then
      if nextSkillLvData and nextSkillLvData.need_quality_level then
        if cardInfo.quality >= nextSkillLvData.need_quality_level then
          CardService.LevelupCardSkillReq(CardMgr.cardId, skillData.id, function()
            if uis then
              local cardInfo = CardData.GetCardDataById(CardMgr.cardId)
              CardSkillUpWindow.OpenSkillUpTips(skillData, cardInfo)
              CardSkillUpWindow.UpdateBtnState()
            end
          end)
        elseif cardInfo.skill2Level[skillData.id] then
          FloatTipsUtil.ShowWarnTips(T(94, CardData.GetFormatNum(nextSkillLvData.need_quality_level)))
        else
          FloatTipsUtil.ShowWarnTips(T(1092, CardData.GetFormatNum(nextSkillLvData.need_quality_level)))
        end
      else
        CardService.LevelupCardSkillReq(CardMgr.cardId, skillData.id, function()
          if uis then
            local cardInfo = CardData.GetCardDataById(CardMgr.cardId)
            CardSkillUpWindow.OpenSkillUpTips(skillData, cardInfo)
            CardSkillUpWindow.UpdateBtnState()
          end
        end)
      end
    else
      local itemData = TableData.GetConfig(tempId, "BaseItem")
      if itemData then
        FloatTipsUtil.ShowWarnTips(T(230, itemData.name()))
      end
    end
  end)
end

function CardSkillUpWindow.InitStarAddSkillLv()
  starAddLv = {}
  local unlockSkillList = CardMgr.cardConfigData.unlock_skill_ids
  for _, v in pairs(unlockSkillList) do
    local skillLevelUpConfig = TableData.GetConfig(v * 1000 + 1, "BaseSkillLevelUp")
    if skillLevelUpConfig and skillLevelUpConfig.set_skill_level then
      for i = 1, #skillLevelUpConfig.set_skill_level do
        local arr = Split(skillLevelUpConfig.set_skill_level[i], ":")
        if 2 == #arr then
          local id = tonumber(arr[1])
          local lv = tonumber(arr[2])
          if starAddLv[id] then
            if lv > starAddLv[id] then
              starAddLv[id] = lv
            end
          else
            starAddLv[id] = lv
          end
        end
      end
    end
  end
end

function CardSkillUpWindow.OpenSkillUpTips(data, cardInfo)
  if data and cardInfo then
    local lv = cardInfo.skill2Level[data.id]
    if lv and selectedBtn then
      local gradeLv = cardInfo.gradeUpSkills[data.id] or 0
      OpenWindow(WinResConfig.SkillUpSuccessWindow.name, nil, lv + gradeLv)
      if lv >= data.max_level then
        UIUtil.SetText(selectedBtn, T(60), "LevelTxt")
        ChangeUIController(selectedBtn, "c1", 2)
      else
        ChangeUIController(selectedBtn, "c1", 1)
      end
      if cardInfo.gradeUpSkills[data.id] then
        UIUtil.SetText(selectedBtn, T(244, cardInfo.skill2Level[data.id] + cardInfo.gradeUpSkills[data.id]), "LevelTxt")
      else
        UIUtil.SetText(selectedBtn, T(244, cardInfo.skill2Level[data.id]), "LevelTxt")
      end
      CardSkillUpWindow.UpdateInfo(data, cardInfo)
    end
  end
end

function CardSkillUpWindow.UpdateBtnState()
  local skillId = {
    CardMgr.cardConfigData.normal_skill,
    CardMgr.cardConfigData.special_skill,
    CardMgr.cardConfigData.burst_skill
  }
  local skillName = {
    "Skill1",
    "Skill3",
    "Skill5"
  }
  for i = 1, #skillId do
    local btn = uis.root:GetChild(skillName[i])
    local data = TableData.GetConfig(skillId[i], "BaseSkill")
    CardSkillUpWindow.SetUpEffect(btn, CardSkillUpWindow.CanLvUp(data))
    if CardMgr.cardInfoData.skill2Level[data.id] then
      local typeCom = btn:GetChild("Type")
      local lv = 1
      if CardMgr.cardInfoData.gradeUpSkills[data.id] then
        lv = CardMgr.cardInfoData.skill2Level[data.id] + CardMgr.cardInfoData.gradeUpSkills[data.id]
      else
        lv = CardMgr.cardInfoData.skill2Level[data.id]
      end
      if CardMgr.cardInfoData.skill2Level[data.id] >= data.max_level then
        CardSkillUpWindow.ShowSkillLv(typeCom, lv, 2, data.type, data.max_level + (CardMgr.cardInfoData.gradeUpSkills[data.id] or 0))
        ChangeUIController(btn, "c1", 2)
      else
        CardSkillUpWindow.ShowSkillLv(typeCom, lv, 1, data.type, data.max_level + (CardMgr.cardInfoData.gradeUpSkills[data.id] or 0))
        ChangeUIController(btn, "c1", 1)
      end
    end
  end
  skillName = {
    "Skill2",
    "Skill4",
    "Skill6"
  }
  skillId = CardMgr.cardConfigData.grow_skill_ids
  for i = 1, #skillId do
    local btn = uis.root:GetChild(skillName[i])
    local data = TableData.GetConfig(skillId[i], "BaseSkill")
    CardSkillUpWindow.SetUpEffect(btn, CardSkillUpWindow.CanLvUp(data))
    local typeCom = btn:GetChild("Type")
    if CardMgr.cardInfoData.skill2Level[data.id] then
      local lv = 1
      if CardMgr.cardInfoData.gradeUpSkills[data.id] then
        lv = CardMgr.cardInfoData.skill2Level[data.id] + CardMgr.cardInfoData.gradeUpSkills[data.id]
      else
        lv = CardMgr.cardInfoData.skill2Level[data.id]
      end
      local page = 1
      if CardMgr.cardInfoData.skill2Level[data.id] >= data.max_level then
        page = 2
        ChangeUIController(btn, "c1", 2)
      else
        ChangeUIController(btn, "c1", 1)
      end
      CardSkillUpWindow.ShowSkillLv(typeCom, lv, page, nil, data.max_level + (CardMgr.cardInfoData.gradeUpSkills[data.id] or 0))
    else
      CardSkillUpWindow.ShowSkillLv(typeCom, 1, 0, nil, data.max_level)
      ChangeUIController(btn, "c1", 0)
    end
  end
end

function CardSkillUpWindow.InitBtn()
  uis.PopupCloseBtn.onClick:Set(function()
    if selectedBtn then
      selectedBtn.selected = false
      selectedBtn = nil
    end
    if 1 == uis.c1Ctr.selectedIndex then
      PlayUITrans(uis.root, "toright")
      PlayUITrans(uis.CardSkillTips.root, "out", function()
        ChangeController(uis.c1Ctr, 0)
      end)
      UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.COM_TYPE.SKILL_TO_RIGHT)
      local tips = uis.CardSkillTips.SkillTips
      tips.NextBtn.selected = false
      curSkillName = nil
    end
  end)
end

function CardSkillUpWindow.QuitHide()
  selectedBtn = nil
  ChangeController(uis.c1Ctr, 0)
  local tips = uis.CardSkillTips.SkillTips
  tips.NextBtn.selected = false
  PlayUITransToComplete(uis.root, "toright")
end

function CardSkillUpWindow.OnClose()
  uis = nil
  selectedBtn = nil
  cardId = nil
  curSkillName = nil
end

return CardSkillUpWindow
