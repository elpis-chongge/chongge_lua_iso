require("RogueBuild01_TalentWindowByName")
local RogueTalentWindow = {}
local uis, contentPane, jumpTb, talentIds, talentItemId, rogueThemeData, themeInfo, lastItem, specialDes
local effectPath = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/Rugel/FX_ui_RogueEquipment_levelup_f.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/Rugel/FX_ui_RogueEquipment_levelup_y.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/Rugel/FX_ui_RogueEquipment_levelup_s.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/Rugel/FX_ui_RogueEquipment_levelup_y_huge.prefab"
}

function RogueTalentWindow.ReInitData()
end

function RogueTalentWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueTalentWindow.package, WinResConfig.RogueTalentWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    local id = bridgeObj.argTable[1]
    rogueThemeData = TableData.GetConfig(id, "BaseRogueTheme")
    uis = GetRogueBuild01_TalentWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_TALENT)
    talentItemId = rogueThemeData.talent_item
    RogueTalentWindow.UpdateInfo()
    RogueTalentWindow.InitBtn()
  end)
end

function RogueTalentWindow.UpdateInfo()
  themeInfo = RogueData.GetRogueTheme()
  if nil == themeInfo then
    return
  end
  talentIds = themeInfo.talentIds
  uis.Main.Number.NumberTxt.text = ActorData.GetItemCount(talentItemId)
  uis.Main.Number.WordTxt.text = T(1505)
  
  function uis.Main.TreeList.itemRenderer(i, item)
    RogueTalentWindow.InitTalentUp(item)
  end
  
  uis.Main.TreeList.numItems = 1
  uis.Main.TalentLeftRegion.TitleTxt.text = T(1424)
  uis.Main.TalentLeftRegion.SpecialRegion.TitleTxt.text = T(1425)
  local ordinaryTips = uis.Main.TalentLeftRegion.OrdinaryRegion
  ordinaryTips.TitleTxt.text = T(1426)
  local allAttribute = RogueTalentWindow.GetallAttributeName()
  local allAttributeVaule = RogueTalentWindow.GetallAttributeVaule()
  
  function ordinaryTips.WordList.itemRenderer(index, item)
    local i = index + 1
    UIUtil.SetText(item, allAttribute[i].name(), "WordTxt")
    local typeInfo = RogueTalentWindow.GetConfigAttribute(allAttribute[i].type)
    if typeInfo then
      local value = allAttributeVaule[typeInfo.type][typeInfo.id] and allAttributeVaule[typeInfo.type][typeInfo.id].value or 0
      if 1 == typeInfo.type then
        UIUtil.SetText(item, value, "NumberTxt")
      elseif 2 == typeInfo.type then
        UIUtil.SetText(item, T(1246, GetPreciseDecimal(value / 100)), "NumberTxt")
      end
    end
  end
  
  ordinaryTips.WordList.numItems = #allAttribute
  if #specialDes > 1 then
    table.sort(specialDes, function(a, b)
      return a.id < b.id
    end)
  end
  local specialList = uis.Main.TalentLeftRegion.SpecialRegion.WordList
  
  function specialList.itemRenderer(i, item)
    UIUtil.SetText(item, specialDes[i + 1].des())
    ChangeUIController(item, "c1", table.contain(talentIds, specialDes[i + 1].id) and 1 or 0)
  end
  
  specialList.numItems = #specialDes
end

function RogueTalentWindow.SetSpecialPre(preData, item)
  if type(preData) == "table" then
    table.sort(preData, function(a, b)
      return b < a
    end)
    local up = table.contain(talentIds, preData[1])
    local index
    for i = 2, #preData do
      if up and table.contain(talentIds, preData[i]) == false then
        index = i
      end
    end
    if index then
      local data = TableData.GetConfig(preData[index], "BaseRogueTalent")
      if data and data.next_line[1] then
        local line = item:GetChild(data.next_line[1])
        if line then
          local lastIndex = item:GetChildIndex(line)
          if lastIndex then
            item:SetChildIndex(line, lastIndex + (index - 1))
          end
        end
      end
    end
  end
end

function RogueTalentWindow.InitTalentUp(item)
  specialDes = {}
  local data = TableData.GetTable("BaseRogueTalent")
  for i, v in pairs(data) do
    if v.pre and #v.pre > 1 and RogueTalentWindow.PreIsContain(v.pre) == false then
      RogueTalentWindow.SetSpecialPre(v.pre, item)
    end
    local oneTalentItem = item:GetChild(v.pos)
    if oneTalentItem then
      if table.contain(talentIds, v.id) then
        if v.next_line then
          for _, lineName in pairs(v.next_line) do
            ChangeUIController(item:GetChild(lineName), "c1", 1)
          end
        end
        ChangeUIController(oneTalentItem, "c1", 1)
      else
        ChangeUIController(oneTalentItem, "c1", 0)
        if v.next_line then
          for _, lineName in pairs(v.next_line) do
            ChangeUIController(item:GetChild(lineName), "c1", 0)
          end
        end
      end
      ChangeUIController(oneTalentItem, "type", v.type)
    end
    oneTalentItem.onClick:Set(function()
      if lastItem and lastItem == oneTalentItem then
        return
      end
      ChangeUIController(lastItem, "c2", 0)
      ChangeUIController(oneTalentItem, "c2", 1)
      lastItem = oneTalentItem
      ChangeController(uis.Main.c1Ctr, 1)
      RogueTalentWindow.ShowTalentInfo(v, oneTalentItem)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ROGUE_TALENT_SELET)
    end)
    if v.function_type then
      table.insert(specialDes, v)
    end
  end
end

function RogueTalentWindow.ShowTalentInfo(data, talentItem)
  local tips = uis.Main.TalentBottomRegion
  ChangeController(tips.typeCtr, data.type)
  tips.TitleTxt.text = data.name()
  tips.WordTxt.text = data.des()
  if themeInfo.running then
    tips.State5.WordTxt.text = T(1431)
    ChangeController(tips.c1Ctr, 4)
  elseif data.pre and RogueTalentWindow.PreIsContain(data.pre) == false then
    tips.State3.WordTxt.text = T(1429)
    ChangeController(tips.c1Ctr, 2)
  elseif table.contain(talentIds, data.id) then
    tips.State4.WordTxt.text = T(1430)
    ChangeController(tips.c1Ctr, 3)
  else
    local costArr = GetConfigItemList(data.cost, true)
    if costArr[1] then
      if ActorData.GetItemCount(costArr[1].id) >= costArr[1].value then
        UIUtil.SetText(tips.State2Btn, T(1428), "WordTxt")
        ChangeController(tips.c1Ctr, 0)
        UIUtil.SetText(tips.State2Btn:GetChild("Spend"), "-" .. costArr[1].value, "NumberTxt")
        tips.State2Btn.onClick:Set(function()
          RogueService.ActivateRogueTalentReq(data.id, function()
            if uis then
              tips.State4.WordTxt.text = T(1430)
              ChangeController(tips.c1Ctr, 3)
              local pathType = data.type + 1
              if data.function_type then
                pathType = 4
              end
              if talentItem and effectPath[pathType] then
                UIUtil.SetEffectToUI(effectPath[pathType], talentItem:GetChild("EffectHolder"), nil, true)
                SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ROGUE_TALENT_UP)
              end
              RogueTalentWindow.UpdateInfo()
            end
          end)
        end)
      else
        tips.State1.WordTxt.text = T(1427)
        ChangeController(tips.c1Ctr, 1)
        tips.State1.Spend.NumberTxt.text = "-" .. costArr[1].value
      end
    end
  end
end

function RogueTalentWindow.PreIsContain(pre)
  for i, v in pairs(pre) do
    if table.contain(talentIds, v) == false then
      return false
    end
  end
  return true
end

function RogueTalentWindow.GetConfigAttribute(type)
  local arr = Split(type, ":")
  if 2 == #arr then
    return {
      type = tonumber(arr[1]),
      id = tonumber(arr[2])
    }
  end
end

function RogueTalentWindow.GetallAttributeVaule()
  local vaule = {
    [1] = {},
    [2] = {}
  }
  local data
  for _, v in pairs(talentIds) do
    data = TableData.GetConfig(v, "BaseRogueTalent")
    if data and data.add_attr then
      local arr = GetConfigItemList(data.add_attr)
      if arr then
        for key, vv in pairs(arr) do
          if vaule[vv.type][key] then
            vaule[vv.type][key].value = vv.value + vaule[vv.type][key].value
          else
            vaule[vv.type][key] = vv
          end
        end
      end
    end
  end
  return vaule
end

function RogueTalentWindow.GetallAttributeName()
  local tb = {}
  if rogueThemeData then
    for i = 1, #rogueThemeData.talent_att do
      local data = TableData.GetConfig(rogueThemeData.talent_att[i], "BaseRogueTalentAtt")
      if data then
        table.insert(tb, data)
      end
    end
  end
  return tb
end

function RogueTalentWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueTalentWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ROGUE_TALENT)
end

function RogueTalentWindow.OnClose()
  uis = nil
  contentPane = nil
  lastItem = nil
  talentIds = nil
  talentItemId = nil
  rogueThemeData = nil
  themeInfo = nil
  lastItem = nil
  specialDes = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return RogueTalentWindow
