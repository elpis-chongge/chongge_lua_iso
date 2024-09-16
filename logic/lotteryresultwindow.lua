require("Lottery_ResultWindowByName")
local LotteryResultWindow = {}
local uis, contentPane, rewardData
local effectBgList = {
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_green.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_blue.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_purple.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_yellow.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_orange.prefab"
}
local effectBgUpList = {
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_green_up.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_blue_up.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_purple_up.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_yellow_up.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/gahcaendlevel/FX_ui_gacha_end_level_orange_up.prefab"
}

function LotteryResultWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryResultWindow.package, WinResConfig.LotteryResultWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLottery_ResultWindowUis(contentPane)
    rewardData = bridgeObj.argTable[1]
    LotteryResultWindow.InitBg()
    LotteryResultWindow.InitBtn()
    LotteryResultWindow.Sort()
    LotteryResultWindow.InitList()
    SoundUtil.PlayUISfx(LotteryEffect.GetResultSoundPath())
    SoundUtil.PlaySfx(40007)
  end)
end

function LotteryResultWindow.InitBg()
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/FX_ui_gachaendshowback_back.prefab", uis.Main.EffectHolder)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/FX_ui_gachaendshowback_front.prefab", uis.Main.Effect1Holder)
end

function LotteryResultWindow.Sort()
  local temp = {}
  for i, v in ipairs(rewardData) do
    local bol = false
    if temp[v.item.itemId] == nil then
      temp[v.item.itemId] = i
      bol = true
    end
    if false == bol and v.isNew then
      if false == rewardData[temp[v.item.itemId]].isNew then
        rewardData[temp[v.item.itemId]].isNew = true
      end
      rewardData[i].isNew = false
    end
  end
end

local itemRotationList = {
  {rotationY = -45, offZ = -40},
  {rotationY = -35, offZ = 20},
  {rotationY = -25, offZ = 55},
  {rotationY = -15, offZ = 90},
  {rotationY = -5, offZ = 120},
  {rotationY = 5, offZ = 120},
  {rotationY = 15, offZ = 90},
  {rotationY = 25, offZ = 55},
  {rotationY = 35, offZ = 20},
  {rotationY = 45, offZ = -40}
}

function LotteryResultWindow.InitList()
  local data
  local animationNameList = table.randomSort({
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
  })
  local animationLoopNameList = table.randomSort({
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
  })
  local cardShowCom = uis.Main.CardShowCom.root
  local posX = 0
  local posY = 0
  local posZ = 0
  for i, v in ipairs(rewardData) do
    local tips
    local item = UIMgr:CreateObject("Lottery", "ResultTipsAni")
    if 0 == posY then
      posY = -(cardShowCom.height - item.height) / 2
    end
    data = TableData.GetConfig(v.item.itemId, "BaseCard")
    local rotationInfo = itemRotationList[i]
    if data then
      local resultTipsEmpty0 = item:GetChild("ResultTipsEmpty0")
      resultTipsEmpty0.alpha = 0
      local resultTipsEmpty1 = resultTipsEmpty0:GetChild("ResultTipsEmpty1")
      local resultTipsEmpty2 = resultTipsEmpty1:GetChild("ResultTipsEmpty2")
      tips = resultTipsEmpty2:GetChild("ResultTips")
      local ResultTipsPic = tips:GetChild("ResultTipsPic")
      local picLoader = ResultTipsPic:GetChild("PicLoader")
      UIUtil.SetHeadByFaceId(data.fashion_id, picLoader, HEAD_ICON_TYPE_ENUM.LOTTERY)
      local nameTxt = tips:GetChild("CardNameTxt")
      nameTxt.text = data.name()
      local quality = tips:GetChild("Quality")
      if quality then
        ChangeUIController(quality, nil, data.star - 1)
      end
      ChangeUIController(tips, "c1", v.isNew and 1 or 0)
      local occupation = tips:GetChild("Occupation")
      if occupation then
        ChangeUIController(occupation, nil, data.type - 1)
        ChangeUIController(occupation, "c2", data.element_type[1])
      end
      local starList = tips:GetChild("StarList")
      
      function starList.itemRenderer()
      end
      
      starList.numItems = data.star
      local index = (1 + #rewardData) / 2
      local interval = math.floor(math.abs(i - index)) * 0.075
      local star = data.star
      LeanTween.delayedCall(interval, function()
        if uis then
          resultTipsEmpty0.alpha = 1
          local effectBg = tips:GetChild("Effect1")
          if effectBg then
            local holder = effectBg:GetChild("EffectHolder")
            holder:SetPivot(0.5, 0.5, true)
            holder:Center()
            UIUtil.SetEffectToUI(effectBgList[star], holder)
          end
          local effectBgUp = tips:GetChild("Effect2")
          if effectBgUp then
            local holder = effectBgUp:GetChild("EffectHolder")
            holder:SetPivot(0.5, 0.5, true)
            holder:Center()
            UIUtil.SetEffectToUI(effectBgUpList[star], holder)
          end
          AnimatorHelper.SetAnimator("Assets/Art/Animation/GachaEnd/GachaEndShowPanel.controller", resultTipsEmpty2.displayObject.gameObject)
        end
      end)
    end
    cardShowCom:AddChild(item)
    LuaUtil.SetLocalPos(item.displayObject.gameObject, posX, posY, posZ)
    local rotationY = rotationInfo.rotationY
    item.rotationY = rotationY
    local rad = math.rad(rotationY)
    posX = posX + math.abs(item.width * math.cos(rad))
    posZ = posZ - item.width * math.sin(rad)
  end
  cardShowCom.z = -50
  cardShowCom.rotationX = 6
  cardShowCom.width = posX
  cardShowCom:Center()
end

function LotteryResultWindow.OnShowAnimationEnd()
  if LotteryData.showReview then
    LotteryMgr.ShowReview()
    LotteryData.showReview = false
  end
end

function LotteryResultWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    local items = GetItemTips.GetCardChangeItem(rewardData)
    if #items > 0 then
      OpenWindow(WinResConfig.GetItemTipsWindow.name, nil, items)
    end
    UIMgr:CloseWindow(WinResConfig.LotteryResultWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.LotteryWindow.name, WindowMsgEnum.LotteryWindow.SHOW)
  end)
end

function LotteryResultWindow.HandleMessage(msgId, para)
end

function LotteryResultWindow.OnClose()
  uis = nil
  contentPane = nil
  rewardData = nil
end

return LotteryResultWindow
