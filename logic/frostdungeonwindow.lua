require("SuperDungeon_SuperWindowByName")
local FrostDungeonWindow = {}
local uis, contentPane, bgEffect
local STAGE_EFFECT_LOOKUP = {
  [1] = "icon1_Columns",
  [2] = "icon2_Columns",
  [3] = "icon3_Columns",
  [4] = "icon4_Columns",
  [5] = "icon5_boss"
}
local BOSS_STAGE_EFFECT_LOOKUP = {
  [1] = "icon1_main",
  [2] = "icon2_main",
  [3] = "icon3_main",
  [4] = "icon4_main"
}
local RefreshLevelItem = function(i, levelItem)
  local index = i
  local starlist = levelItem:GetChild("StarList")
  local lockItem = levelItem:GetChild("Lock")
  local list = FrostDungeonData.GetLevelList()
  local stageId = list[index]
  local conf = TableData.GetConfig(stageId, "BaseStage")
  local started, diff = FrostDungeonMgr.IsStarted(stageId)
  local unlock
  if not started then
    unlock = false
    local timeTxtContent = T(20333, TimeUtil.FormatEnTime(diff))
    if not lockItem then
      lockItem = levelItem:GetChild("Lock1")
      local lock2 = levelItem:GetChild("Lock2")
      if lock2 then
        lock2.visible = false
      end
    end
    UIUtil.SetText(lockItem:GetChild("TimeLock"), timeTxtContent, "TimeTxt")
    ChangeUIController(lockItem, "c1", 0)
    lockItem.visible = true
  else
    local unlock_buff = conf.unlock_buff
    unlock = FrostDungeonMgr.IsLevelUnlock(stageId)
    if not unlock then
      local tipsText = T(20432)
      if lockItem then
        if unlock_buff then
          ChangeUIController(lockItem, "c1", 1)
          lockItem.visible = not unlock
          local str = unlock_buff[1]
          local splits = Split(str, ":")
          local buffConf = TableData.GetConfig(tonumber(splits[1]), "BaseSkillBuffPre")
          local lock = lockItem:GetChild("BuffNumberLock")
          UIUtil.SetText(lock, tipsText, "WordTxt")
          UIUtil.SetText(lock, string.format("x%s", splits[2]), "NumberTxt")
          local loader = lock:GetChild("PicLoader")
          loader.url = UIUtil.GetResUrl(buffConf.mini_icon)
        end
      elseif unlock_buff then
        for j, v in ipairs(unlock_buff) do
          local item = levelItem:GetChild(string.format("Lock%d", j))
          ChangeUIController(item, "c1", 1)
          local splits = Split(v, ":")
          local buffConf = TableData.GetConfig(tonumber(splits[1]), "BaseSkillBuffPre")
          local lock = item:GetChild("BuffNumberLock")
          UIUtil.SetText(lock, tipsText, "WordTxt")
          local num = tonumber(splits[2])
          item.visible = num > FrostDungeonMgr.GetBuffGrade(buffConf.id)
          UIUtil.SetText(lock, string.format("x%s", splits[2]), "NumberTxt")
          local loader = lock:GetChild("PicLoader")
          loader.url = UIUtil.GetResUrl(buffConf.mini_icon)
        end
      end
    else
      local buffNumber = levelItem:GetChild("BuffNumber")
      if buffNumber then
        local grade = FrostDungeonMgr.GetLevelBuffGrade(stageId)
        local inherit_stage_id = conf.inherit_stage_id
        local gradeText
        if inherit_stage_id then
          local inherit_grade = FrostDungeonMgr.GetLevelBuffGrade(inherit_stage_id)
          gradeText = string.format("x%s(%s)", grade + inherit_grade, grade)
          buffNumber.visible = true
        else
          gradeText = grade > 0 and string.format("x%s", grade) or grade
          buffNumber.visible = grade > 0
        end
        UIUtil.SetText(buffNumber, gradeText, "NumberTxt")
        local loader = buffNumber:GetChild("PicLoader")
        local buffConf = TableData.GetConfig(conf.buff_add, "BaseSkillBuffPre")
        loader.url = UIUtil.GetResUrl(buffConf.mini_icon)
      end
    end
  end
  local numberTxtContent = conf.name and conf.name() or "未配置" .. tostring(stageId)
  UIUtil.SetText(levelItem, numberTxtContent, "NumberTxt")
  ChangeUIController(levelItem, "c1", unlock and 1 or 0)
  levelItem.onClick:Set(function()
    local started, diff = FrostDungeonMgr.IsStarted(stageId)
    if not started then
      FloatTipsUtil.ShowWarnTips(T(20333, TimeUtil.FormatEnTime(diff)))
      return
    elseif not FrostDungeonMgr.IsLevelUnlock(stageId) then
      if conf.unlock_buff then
        for _, v in ipairs(conf.unlock_buff) do
          local splits = Split(v, ":")
          local buffId = tonumber(splits[1])
          local buffConf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
          local cnt = tonumber(splits[2])
          local imgstr = "<img  src='%s'  width='25'  height='25'/>x%s"
          local condition = FrostDungeonMgr.GetBuffGrade(buffId)
          if cnt > condition then
            local tips = T(20434, string.format(imgstr, UIUtil.GetResUrl(buffConf.mini_icon), splits[2]))
            FloatTipsUtil.ShowWarnTips(tips)
          end
        end
      end
      return
    end
    OpenWindow(WinResConfig.FrostDungeonDetailsWindow.name, nil, stageId)
  end)
  local levelStars = FrostDungeonMgr.GetLevelStars(stageId)
  local challenges = FrostDungeonData.GetLevelChallenges(stageId)
  
  function starlist.itemRenderer(j, gcmp)
    ChangeUIController(gcmp, "c1", j < levelStars and 1 or 0)
  end
  
  local numStars = 0
  for _, v in pairs(challenges) do
    numStars = numStars + (v.star and 1 or 0)
  end
  starlist.numItems = numStars
end
local UpdateEffectState = function()
  local stages = FrostDungeonData.GetLevelList()
  local new_stages = FrostDungeonMgr.__new_stages
  local grade_change_stages = FrostDungeonMgr.__grade_change_stages
  local star_change_stages = FrostDungeonMgr.__star_change_stages
  for i, name in pairs(STAGE_EFFECT_LOOKUP) do
    local stageId = stages[i]
    local unlock = FrostDungeonMgr.IsLevelUnlock(stageId)
    local o = LuaUtil.FindChild(bgEffect, name, true)
    if unlock then
      if new_stages and table.keyof(new_stages, stageId) then
        LuaUtil.PlayEffect(o)
        table.remove(new_stages, table.keyof(new_stages, stageId))
      else
        LuaUtil.SimulateEffect(o, 1, true)
      end
    else
      LuaUtil.StopEffectEmitting(o, true)
    end
    if FrostDungeonMgr.IsHighestLevel(stageId) then
      for j, subname in ipairs(BOSS_STAGE_EFFECT_LOOKUP) do
        local grade = FrostDungeonMgr.GetLevelBuffGrade(stages[j])
        o = LuaUtil.FindChild(bgEffect, subname, true)
        if grade > 0 then
          if grade_change_stages and table.keyof(grade_change_stages, stageId) then
            table.remove(grade_change_stages, table.keyof(grade_change_stages, stageId))
            LuaUtil.PlayEffect(o)
          else
            LuaUtil.SimulateEffect(o, 1.5, true)
          end
        else
          LuaUtil.StopEffectEmitting(o, true)
        end
      end
    end
    local dot = uis.Main[string.format("Dot%s", i)].root
    local starlist = dot:GetChild("StarList")
    if star_change_stages and table.keyof(star_change_stages, stageId, "stageId") then
      local k = table.keyof(star_change_stages, stageId, "stageId")
      local stars = star_change_stages[k].stars
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_jiuri_com")
      for _, index in ipairs(stars) do
        local j = index - 1
        if j >= 0 and j < starlist.numChildren then
          local child = starlist:GetChildAt(j)
          local holder = CS.FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
          child:AddChild(holder)
          UIUtil.SetHolderCenter(holder)
          local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Faradventure/FX_ui_faradventureploteff_star.prefab")
          UIUtil.SetObjectToUI(eff, holder)
          eff.transform.localPosition = Vector3.zero
          LuaUtil.PlayEffect(eff)
          LuaUtil.SetEffectSetting(eff, function()
            holder:Dispose()
          end)
        end
      end
      table.remove(star_change_stages, k)
    end
  end
end

function FrostDungeonWindow.ReInitData()
end

function FrostDungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FrostDungeonWindow.package, WinResConfig.FrostDungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetSuperDungeon_SuperWindowUis(contentPane)
    FrostDungeonWindow.UpdateInfo()
    FrostDungeonWindow.InitBtn()
  end)
end

function FrostDungeonWindow.UpdateInfo()
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.FrostDungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.FROST_DUNGEON)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local conf = TableData.GetConfig(info.chapterId, "BaseChapter")
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(conf.back_ground)
  local holder = uis.Main.BackGround.BackGroundHolder
  local bgEffectPath = "Assets/Art/Effects/Prefab/UI_prefab/Faradventure/FX_ui_faradventureboss_active.prefab"
  local eff = ResourceManager.Instantiate(bgEffectPath)
  UIUtil.SetHolderCenter(holder)
  UIUtil.SetObjectToUI(eff, holder)
  bgEffect = eff
  local cnt = #conf.stages
  for i = 1, cnt do
    RefreshLevelItem(i, uis.Main[string.format("Dot%s", i)].root, true)
  end
  local titleTxtContent = conf.name()
  local diff = info.endStamp - LoginData.GetCurServerTime()
  local timeTxtContent = T(20356, TimeUtil.FormatEnTime(diff))
  local titleCom = uis.Main.Title.root
  UIUtil.SetText(titleCom, titleTxtContent, "TitleTxt")
  UIUtil.SetText(titleCom, timeTxtContent, "TimeTxt")
  UpdateEffectState()
  RedDotMgr.AddNode({
    windowName = WinResConfig.FrostDungeonWindow.name,
    com = uis.Main.RewardBtn,
    visibleFunc = function()
      return RedDotFrostDungeon.HasAnyRewards()
    end,
    dataType = RED_DOT_DATA_TYPE.ABYSS
  })
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.FrostDungeonWindow.name)
end

function FrostDungeonWindow.InitBtn()
  uis.Main.RewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.FrostDungeonRewardWindow.name)
  end)
end

function FrostDungeonWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.FrostDungeonWindow.name) then
    UpdateEffectState()
  end
end

function FrostDungeonWindow.OnClose()
  uis = nil
  contentPane = nil
  RedDotMgr.RemoveNode(WinResConfig.FrostDungeonWindow.name)
end

function FrostDungeonWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.FrostDungeonWindow.REFRESH_PANEL_INFO then
    for i = 1, 5 do
      RefreshLevelItem(i, uis.Main[string.format("Dot%s", i)].root)
    end
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.FrostDungeonWindow.name)
  elseif msgId == WindowMsgEnum.FrostDungeonWindow.REFRESH_EFFECT_STATE then
    UpdateEffectState()
  end
end

return FrostDungeonWindow
