LotteryEffect = {}
local sceneEffect, cardEffect
local lotteryEffectPath = "Assets/Art/Effects/Prefab/UI_prefab/Gacha/FX_gacha_all.prefab"
local lotteryOneCardEffectPath = "Assets/Art/Effects/Prefab/UI_prefab/Gacha/FX_gacha_showcase.prefab"
local lotteryOneCardHighEffectPath = "Assets/Art/Effects/Prefab/UI_prefab/Gacha/FX_gacha_showcase_high.prefab"
local lotteryOneCardOrangeEffectPath = "Assets/Art/Effects/Prefab/UI_prefab/Gacha/FX_gacha_showcase_orange.prefab"
local lotterySoundPath = {
  IN = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_p1",
  CLICK = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_click",
  END_1 = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_explosion_comn",
  END_2 = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_explosion_yellow",
  END_3 = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_explosion_gold",
  PAINT_1 = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_end_comn",
  PAINT_2 = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_end_yellow",
  PAINT_3 = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_end_gold",
  RESULT = "event:/sfx/sfx_ui/ui_zhaomu/zhaomu_jiesuan_10"
}
local lotterySoundBank = "sfx/sfx_ui/ui_effect/ui_zhaomu"

function LotteryEffect.GetResultSoundPath()
  return lotterySoundPath.RESULT, lotterySoundBank
end

function LotteryEffect.ShowLotteryScene(qualityTable, typeTable, func, gachaId)
  sceneEffect = ResourceManager.Instantiate(lotteryEffectPath)
  PrintTable(qualityTable, "卡片品质")
  local maxStar = 0
  for i, v in ipairs(qualityTable) do
    maxStar = math.max(v, maxStar)
  end
  LuaUtil.SetLotteryEffectGroup(sceneEffect, maxStar)
  local gachaConfig = TableData.GetConfig(gachaId, "BaseGacha")
  local index
  if 1 == gachaConfig.type then
    index = 0
  elseif 0 == gachaConfig.type then
    index = 1
  elseif 2 == gachaConfig.type then
    index = 2
  end
  if index then
    LuaUtil.SetLotteryColorGroup(sceneEffect, index)
  end
  CS.GachaTest.InitGachaInfo(sceneEffect, qualityTable, typeTable, function()
    local endTime = EffectUtil.PlayTimeLineByName(sceneEffect, "timeline_gacha_end")
    TimerUtil.setTimeout(endTime, func)
    UIMgr:SendWindowMessage(WinResConfig.LotteryWindow.name, WindowMsgEnum.LotteryWindow.HIDE_CHOICE)
    if maxStar > 4 then
      SoundUtil.PlayUISfx(lotterySoundPath.END_3, lotterySoundBank)
    elseif maxStar > 3 then
      SoundUtil.PlayUISfx(lotterySoundPath.END_2, lotterySoundBank)
    else
      SoundUtil.PlayUISfx(lotterySoundPath.END_1, lotterySoundBank)
    end
  end, function(count)
    SoundUtil.PlayUISfx(lotterySoundPath.CLICK, lotterySoundBank)
    UIMgr:SendWindowMessage(WinResConfig.LotteryWindow.name, WindowMsgEnum.LotteryWindow.UPDATE_COUNT, count)
  end)
  UIMgr:SendWindowMessage(WinResConfig.LotteryWindow.name, WindowMsgEnum.LotteryWindow.HIDE)
  EffectUtil.PlayTimeLineByName(sceneEffect, "timeline_gacha_in")
  SoundUtil.PlayUISfx(lotterySoundPath.IN, lotterySoundBank)
end

function LotteryEffect.CloseLotteryScene()
  if sceneEffect then
    ResourceManager.DestroyGameObject(sceneEffect)
    sceneEffect = nil
  end
end

function LotteryEffect.PlayCardEffect(item, func)
  LotteryEffect.CloseCardEffect()
  local cardId = item.itemId
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  if cardConfig.star > 4 then
    cardEffect = ResourceManager.Instantiate(lotteryOneCardOrangeEffectPath)
    SoundUtil.PlayUISfx(lotterySoundPath.PAINT_3, lotterySoundBank)
  elseif cardConfig.star > 3 then
    cardEffect = ResourceManager.Instantiate(lotteryOneCardHighEffectPath)
    SoundUtil.PlayUISfx(lotterySoundPath.PAINT_2, lotterySoundBank)
  else
    cardEffect = ResourceManager.Instantiate(lotteryOneCardEffectPath)
    SoundUtil.PlayUISfx(lotterySoundPath.PAINT_1, lotterySoundBank)
  end
  LuaUtil.SetLotteryEffectGroup(cardEffect, cardConfig.star)
  local endTime = EffectUtil.PlayTimeLineByName(cardEffect, "timeline")
  TimerUtil.setTimeout(endTime, func)
end

function LotteryEffect.CloseCardEffect()
  if cardEffect then
    ResourceManager.DestroyGameObject(cardEffect)
    cardEffect = nil
  end
end

function LotteryEffect.AutoClick()
  if sceneEffect then
    CS.GachaTest.AutoClick(sceneEffect)
  end
end
