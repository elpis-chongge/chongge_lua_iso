require("CardAttribute_AttributeDesWindowByName")
local AttributeDesWindow = {}
local uis, contentPane

function AttributeDesWindow.ReInitData()
end

function AttributeDesWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AttributeDesWindow.package, WinResConfig.AttributeDesWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCardAttribute_AttributeDesWindowUis(contentPane)
    AttributeDesWindow.InitBtn()
    AttributeDesWindow.InitUI()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM_IN)
  end)
end

function AttributeDesWindow.GetData()
  local config = TableData.GetTable("BaseAttribute")
  local t = {}
  if config then
    for i, v in pairs(config) do
      if v.sort then
        table.insert(t, v)
      end
    end
  end
  table.sort(t, function(a, b)
    return a.sort < b.sort
  end)
  return t
end

function AttributeDesWindow.ShowAttribute(show_type, item, attribute)
  if 1 == show_type then
    UIUtil.SetText(item, attribute, "NumberTxt")
  elseif 2 == show_type then
    UIUtil.SetText(item, T(91, FormatValidateNum(attribute / 100)), "NumberTxt")
  elseif 3 == show_type then
    UIUtil.SetText(item, GetPreciseDecimal(FormatValidateNum(attribute / 1000), 2), "NumberTxt")
  end
end

function AttributeDesWindow.ShowAddAttribute(show_type, item, attribute)
  if 1 == show_type then
    UIUtil.SetText(item, T(380, attribute), "AddNumberTxt")
  elseif 2 == show_type then
    UIUtil.SetText(item, T(380, T(91, FormatValidateNum(attribute / 100))), "AddNumberTxt")
  elseif 3 == show_type then
    UIUtil.SetText(item, T(380, GetPreciseDecimal(FormatValidateNum(attribute / 1000), 2)), "AddNumberTxt")
  end
end

local GetValue = function(value_enhance, baseValue)
  if value_enhance < 0 then
    return math.ceil(baseValue * 10000 / (10000 - value_enhance))
  elseif value_enhance > 0 then
    return math.ceil(baseValue * (10000 + value_enhance) / 10000)
  end
end

function AttributeDesWindow.InitUI()
  local data = AttributeDesWindow.GetData()
  local list = uis.Main.CardScreen1.CardAttributeList
  local badgeAttribute = CardData.GetBadgeAddAttribute()
  local moveId = CardAttribute.GetIdByName("spd_move")
  local atkId = CardAttribute.GetIdByName("spd_atk")
  local moveIdPer = CardAttribute.GetIdByName("spd_move_enhance")
  local atkIdPer = CardAttribute.GetIdByName("spd_atk_enhance")
  local attributeNun = {
    ProtoEnum.ATTR_ID.ATK,
    ProtoEnum.ATTR_ID.DEF,
    ProtoEnum.ATTR_ID.MAX_HP
  }
  
  function list.itemRenderer(i, item)
    local index = i + 1
    local id = data[index].id
    ChangeUIController(item, "c1", data[index].sort)
    ChangeUIController(item, "c2", index % 2)
    ChangeUIController(item, "c3", data[index].des and 1 or 0)
    UIUtil.SetText(item, data[index].display_name())
    local cardAttribute = CardMgr.cardInfoData.attributes[id] or 0
    local attributeBadge = badgeAttribute[id] or 0
    local attrValue = cardAttribute + attributeBadge
    if table.contain(attributeNun, id) and 0 ~= attributeBadge then
      attrValue = cardAttribute
      AttributeDesWindow.ShowAddAttribute(data[index].show_type, item, attributeBadge)
    else
      attrValue = cardAttribute + attributeBadge
      if id == moveId then
        local badgeEnhance = badgeAttribute[moveIdPer] or 0
        local cardEnhance = CardMgr.cardInfoData.attributes[moveIdPer] or 0
        if 0 ~= cardEnhance + badgeEnhance then
          attrValue = GetValue(badgeEnhance + cardEnhance, cardAttribute)
        end
      elseif id == atkId then
        local badgeEnhance = badgeAttribute[atkIdPer] or 0
        local cardEnhance = CardMgr.cardInfoData.attributes[atkIdPer] or 0
        if 0 ~= cardEnhance + badgeEnhance then
          attrValue = GetValue(cardEnhance + badgeEnhance, cardAttribute)
        end
      end
    end
    AttributeDesWindow.ShowAttribute(data[index].show_type, item, attrValue)
    item:GetChild("CardAttributeTipsBtn").onClick:Set(function()
      if data[index].des then
        OpenWindow(WinResConfig.CardAttributeTipsWindow.name, nil, {
          des = data[index].des(),
          titleTxt = data[index].display_name()
        })
      end
    end)
    item.onClick:Set(function()
      if list.selectedIndex ~= i then
        list.selectedIndex = i
      end
    end)
    if 0 == i then
      item.onClick:Call()
    end
  end
  
  list.numItems = #data
end

function AttributeDesWindow.Quit()
  UIMgr:CloseWindow(WinResConfig.AttributeDesWindow.name)
end

function AttributeDesWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(AttributeDesWindow.Quit)
  uis.Main.TouchScreenBtn.onClick:Set(AttributeDesWindow.Quit)
end

function AttributeDesWindow.OnClose()
  uis = nil
  contentPane = nil
end

function AttributeDesWindow.HandleMessage(msgId, para)
end

return AttributeDesWindow
