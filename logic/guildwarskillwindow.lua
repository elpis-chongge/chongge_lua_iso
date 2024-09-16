require("GuildBoss_GuildSkillWindowByName")
local GuildWarSkillWindow = {}
local uis, contentPane, lastBtn, teamId

function GuildWarSkillWindow.ReInitData()
end

function GuildWarSkillWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarSkillWindow.package, WinResConfig.GuildWarSkillWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_GuildSkillWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Battlefieldskills/FX_ui_battlefieldskills_background.prefab", uis.Main.BackGround.BackGroundHolder)
    GuildWarSkillWindow.UpdateInfo()
    GuildWarSkillWindow.InitBtn()
    CurrencyReturnWindow.AutoOpenCaption(12305, uis, uis.Main.FunctionDetailsBtn)
    uis.Main.Word.WordTxt.text = T(1643)
  end)
end

function GuildWarSkillWindow.UpdateInfo()
  local skillCom = uis.Main.ModuleRegion
  local data = GuildWarData.GetGuildWarConfig()
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  if data and playerInfo then
    for i = 1, #data.skill_id do
      local skill = skillCom[string.format("SkillModule%dBtn", i)]
      local skillData = TableData.GetConfig(data.skill_id[i], "BaseSkill")
      if skill and skillData then
        skill:GetChild("PicLoader").url = UIUtil.GetResUrl(skillData.icon)
        UIUtil.SetText(skill:GetChild("Wear"), T(1594))
        local skillLevel = playerInfo.skill2Level[skillData.id] or 1
        UIUtil.SetText(skill, T(244, skillLevel), "NumberTxt")
        ChangeUIController(skill, "lock", playerInfo.skill2Level[skillData.id] and 0 or 1)
        skill.soundFmod = SOUND_EVENT_ENUM.GUILD_WAR_SKILL_BUTTON
        skill.onClick:Set(function()
          if lastBtn then
            lastBtn.selected = false
          end
          if 0 == uis.Main.c1Ctr.selectedIndex then
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SHOP_BANNER_OPEN)
          end
          ChangeController(uis.Main.SkillProgramme.c1Ctr, 0)
          GuildWarSkillWindow.ShowSkillInfo(skillData, playerInfo.skill2Level)
          skill.selected = true
          lastBtn = skill
        end)
      end
    end
  end
end

function GuildWarSkillWindow.ShowSkillInfo(skillData, skill2Level)
  local tips = uis.Main.SkillProgramme
  tips.Level.NumberTxt.text = T(1599)
  local skillLevel = skill2Level[skillData.id] or 1
  if skill2Level[skillData.id] then
    ChangeController(tips.lcokCtr, 0)
  else
    ChangeController(tips.lcokCtr, 1)
  end
  ChangeController(tips.maxCtr, skillLevel >= skillData.max_level and 1 or 0)
  local id = skillData.id * 1000 + skillLevel
  local skillLvData = TableData.GetConfig(id, "BaseSkillLevelUp")
  if skillLvData and skillLvData.des then
    function tips.WordList.itemRenderer(i, txtItem)
      UIUtil.SetText(txtItem, skillLvData.des())
    end
    
    tips.WordList.numItems = 1
    local nextLvData = TableData.GetConfig(skillLvData.id + 1, "BaseSkillLevelUp")
    if nextLvData and nextLvData.cost then
      local arr = GetConfigItemList(nextLvData.cost, true)
      if arr[1] then
        UIUtil.SetIconById(tips.UpBtn:GetChild("PicLoader"), arr[1].id)
        local count = ActorData.GetItemCount(arr[1].id)
        if count >= arr[1].value then
          ChangeUIController(tips.UpBtn, "c1", 0)
          UIUtil.SetText(tips.UpBtn, T(868, count, arr[1].value), "NumberTxt")
        else
          UIUtil.SetText(tips.UpBtn, T(1635, count, arr[1].value), "NumberTxt")
          ChangeUIController(tips.UpBtn, "c1", 1)
        end
        UIUtil.SetText(tips.UpBtn, T(1603))
        tips.UpBtn.onClick:Set(function()
          if count >= arr[1].value then
            GuildWarService.LevelupGuildWarSkillReq(skillData.id, function(msg)
              local playerInfo = GuildWarData.GetGuildPlayerInfo()
              if playerInfo and uis then
                GuildWarSkillWindow.ShowSkillInfo(skillData, playerInfo.skill2Level)
                GuildWarSkillWindow.UpdateLvTxt()
              end
            end)
          else
            local config = TableData.GetConfig(arr[1].id, "BaseItem")
            if config and config.name then
              FloatTipsUtil.ShowWarnTips(T(81, config.name()))
            end
          end
        end)
      end
    end
  end
  tips.NameTxt.text = skillData.name and skillData.name() or ""
  tips.Level.WordTxt.text = T(1303, skillLevel)
  local tabData = {}
  if skillLvData.trigger_max then
    table.insert(tabData, {
      name = T(1598),
      txt = skillLvData.trigger_max,
      ctr = 0
    })
  end
  if skillData.cd then
    table.insert(tabData, {
      name = T(1630),
      txt = T(1140, skillData.cd),
      ctr = 1
    })
  end
  if skillData.element_type and #skillData.element_type > 0 then
    table.insert(tabData, {
      name = T(1631),
      txt = T(11725),
      ctr = 2
    })
  end
  if skillData.skill_atk then
    table.insert(tabData, {
      name = T(1600),
      txt = skillData.skill_atk,
      ctr = 3
    })
  end
  
  function tips.NumberList.itemRenderer(i, tabitem)
    local tempData = tabData[i + 1]
    UIUtil.SetText(tabitem, tempData.name, "WordTxt")
    if 2 ~= tempData.ctr or skillData.element_type and 0 == skillData.element_type[1] then
      UIUtil.SetText(tabitem, tempData.txt, "NumberTxt")
      ChangeUIController(tabitem, "c2", 0)
    else
      local elementList = tabitem:GetChild("ElementList")
      UIUtil.ShowElementList(elementList, skillData)
      ChangeUIController(tabitem, "c2", 1)
    end
    ChangeUIController(tabitem, "c1", tempData.ctr)
  end
  
  tips.NumberList.numItems = #tabData
  tips.NumberList:ResizeToFit()
  tips.Lock.TitleTxt.text = T(1601)
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  if playerInfo then
    teamId = teamId or 1
    tips.ProgrammeList.selectedIndex = -1
    
    function tips.ProgrammeList.itemRenderer(i, item)
      UIUtil.SetText(item, T(1596, i + 1))
      item.onClick:Set(function()
        if tips.ProgrammeList.selectedIndex ~= i then
          local curSkillTeam = GuildWarData.GetSkillTeamByTeamId(i + 1)
          local ids = curSkillTeam and curSkillTeam.skillIds or {}
          teamId = i + 1
          GuildWarSkillWindow.ShowSkillRegion(tips.SkillRegion.SkillList, ids, playerInfo.skill2Level, curSkillTeam, skillData.id)
          if table.contain(ids, skillData.id) then
            UIUtil.SetText(tips.WearBtn, T(1613))
            tips.WearBtn.touchable = true
          else
            UIUtil.SetText(tips.WearBtn, T(1602))
          end
          GuildWarSkillWindow.UpdateWear()
          tips.ProgrammeList.selectedIndex = i
        end
      end)
      if i + 1 == teamId then
        item.onClick:Call()
      end
    end
    
    tips.ProgrammeList.numItems = 4
    tips.WearBtn.onClick:Set(function()
      local skillTeam = GuildWarData.GetSkillTeamByTeamId(teamId)
      if nil == skillTeam then
        skillTeam = {
          skillIds = {},
          used = false
        }
      end
      local canWear = table.contain(skillTeam.skillIds, skillData.id)
      if canWear then
        for i = #skillTeam.skillIds, 1, -1 do
          if skillTeam.skillIds[i] == skillData.id then
            table.remove(skillTeam.skillIds, i)
            break
          end
        end
        GuildWarService.SetGuildWarSkillTeamReq(teamId, skillTeam.skillIds, skillTeam.used, function()
          local updateInfo = GuildWarData.GetGuildPlayerInfo()
          if updateInfo and uis then
            GuildWarSkillWindow.ShowSkillInfo(skillData, updateInfo.skill2Level)
          end
        end)
      else
        if 3 == #skillTeam.skillIds then
          table.remove(skillTeam.skillIds, 1)
        end
        table.insert(skillTeam.skillIds, skillData.id)
        GuildWarService.SetGuildWarSkillTeamReq(teamId, skillTeam.skillIds, skillTeam.used, function()
          local updateInfo = GuildWarData.GetGuildPlayerInfo()
          if updateInfo and uis then
            GuildWarSkillWindow.ShowSkillInfo(skillData, updateInfo.skill2Level)
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ROGUE_TALENT_UP)
          end
        end)
      end
    end)
  end
  UIUtil.SetText(tips.LookBtn, T(1597))
  tips.LookBtn.selected = false
  tips.LookBtn.onClick:Set(function()
    if 1 == tips.c1Ctr.selectedIndex then
      UIUtil.SetText(tips.LookBtn, T(1597))
      ChangeController(tips.c1Ctr, 0)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.STORY_PLOT_OFF)
    else
      local effectList = tips.EffectRegion.EffectList
      local toIndex
      local skillDes = GuildWarSkillWindow.GetAllSkillEffect(skillData)
      
      function effectList.itemRenderer(i, item)
        UIUtil.SetText(item, skillDes[i + 1].des, "WordTxt")
        UIUtil.SetText(item, T(1303, skillDes[i + 1].lv), "LevelTxt")
        if skillDes[i + 1].lv == skillLevel then
          toIndex = i
          UIUtil.SetText(item:GetChild("Sign"), T(1604), "WordTxt")
          ChangeUIController(item, "c1", 1)
        else
          ChangeUIController(item, "c1", 0)
        end
      end
      
      effectList.numItems = #skillDes
      if toIndex then
        effectList:ScrollToView(toIndex)
      end
      UIUtil.SetText(tips.LookBtn, T(1632))
      ChangeController(tips.c1Ctr, 1)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.STORY_PLOT_ON)
    end
  end)
  ChangeController(uis.Main.c1Ctr, 1)
  ChangeController(uis.Main.ModuleRegion.c1Ctr, 1)
  uis.Main.ModuleRegion.TouchScreenBtn.onClick:Set(function()
    ChangeController(uis.Main.c1Ctr, 0)
    ChangeController(tips.c1Ctr, 0)
    ChangeController(uis.Main.ModuleRegion.c1Ctr, 0)
    if lastBtn then
      lastBtn.selected = false
    end
    GuildWarSkillWindow.UpdateWear(true)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  end)
end

function GuildWarSkillWindow.UpdateWear(notShow)
  local skillCom = uis.Main.ModuleRegion
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  local data = GuildWarData.GetGuildWarConfig()
  if data and playerInfo then
    local curSkillTeam = GuildWarData.GetSkillTeamByTeamId(teamId)
    local ids = curSkillTeam and curSkillTeam.skillIds or {}
    for i = 1, #data.skill_id do
      local skill = skillCom[string.format("SkillModule%dBtn", i)]
      if notShow then
        ChangeUIController(skill, "wear", 0)
      else
        ChangeUIController(skill, "wear", table.contain(ids, data.skill_id[i]) and 1 or 0)
      end
    end
  end
end

function GuildWarSkillWindow.UpdateLvTxt()
  local skillCom = uis.Main.ModuleRegion
  local data = GuildWarData.GetGuildWarConfig()
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  if data and playerInfo then
    for i = 1, #data.skill_id do
      local skill = skillCom[string.format("SkillModule%dBtn", i)]
      local skillData = TableData.GetConfig(data.skill_id[i], "BaseSkill")
      if skill and skillData then
        local skillLevel = playerInfo.skill2Level[skillData.id] or 1
        UIUtil.SetText(skill, T(244, skillLevel), "NumberTxt")
        ChangeUIController(skill, "lock", playerInfo.skill2Level[skillData.id] and 0 or 1)
      end
    end
  end
end

function GuildWarSkillWindow.ShowSkillRegion(list, skillIds, skillLevel, curSkillTeam, wearSkillId)
  function list.itemRenderer(i, skill)
    if skillIds[i + 1] then
      local skillData = TableData.GetConfig(skillIds[i + 1], "BaseSkill")
      
      if skill and skillData then
        skill:GetChild("PicLoader").url = UIUtil.GetResUrl(skillData.icon)
        ChangeUIController(skill, "c1", 1)
        UIUtil.SetText(skill, T(244, skillLevel[skillData.id] and skillLevel[skillData.id] or 1), "NumberTxt")
        skill.onClick:Set(function()
          if curSkillTeam then
            for i = #curSkillTeam.skillIds, 1, -1 do
              if curSkillTeam.skillIds[i] == skillData.id then
                table.remove(curSkillTeam.skillIds, i)
                break
              end
            end
            GuildWarService.SetGuildWarSkillTeamReq(teamId, curSkillTeam.skillIds, curSkillTeam.used, function()
              local updateInfo = GuildWarData.GetGuildPlayerInfo()
              if updateInfo and uis then
                GuildWarSkillWindow.ShowSkillInfo(skillData, updateInfo.skill2Level)
              end
            end)
          end
        end)
      end
      ChangeUIController(skill, "c2", skillIds[i + 1] == wearSkillId and 1 or 0)
    else
      skill.onClick:Clear()
      ChangeUIController(skill, "c1", 0)
      ChangeUIController(skill, "c2", 0)
    end
  end
  
  list.numItems = 3
end

function GuildWarSkillWindow.GetAllSkillEffect(skillData)
  local des = {}
  for skillLevel = 1, skillData.max_level do
    local id = skillData.id * 1000 + skillLevel
    local skillLvData = TableData.GetConfig(id, "BaseSkillLevelUp")
    if skillLvData and skillLvData.des then
      table.insert(des, {
        lv = skillLevel,
        des = skillLvData.des()
      })
    end
  end
  return des
end

function GuildWarSkillWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarSkillWindow.name)
  end)
  UIUtil.SetText(uis.Main.EditBtn, T(1595))
  uis.Main.EditBtn.onClick:Set(function()
    uis.Main.ModuleRegion.SkillModule1Btn.onClick:Call()
  end)
  uis.Main.ModuleRegion.TouchScreenBtn.onClick:Set(function()
    ChangeController(uis.Main.c1Ctr, 0)
  end)
end

function GuildWarSkillWindow.OnClose()
  uis = nil
  contentPane = nil
  lastBtn = nil
  teamId = nil
end

return GuildWarSkillWindow
