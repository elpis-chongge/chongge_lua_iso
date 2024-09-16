require("SuperDungeon_PlayDetailsWindowByName")
local FrostDungeonDetailsWindow = {}
local uis, contentPane, stageId, stageBuffList, selectedBuffs
local BuffItemRenderer = function(i, gcmp)
  local buffName, buffDesc
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local index = table.keyof(info.stages, stageId, "stageId")
  local item = info.stages[index]
  local buffNumberDesc = ""
  local loader = gcmp:GetChild("PicLoader")
  if stageId and FrostDungeonMgr.IsHighestLevel(stageId) then
    local buffInfo = stageBuffList[i + 1]
    local buffId = buffInfo.id
    local buffConf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
    buffName = buffConf.name and buffConf.name() or ""
    buffDesc = type(buffConf.des) == "function" and buffConf.des() or "未配置"
    loader.url = UIUtil.GetResUrl(buffConf.icon)
    local wordList = gcmp:GetChild("WordList")
    
    function wordList.itemRenderer(j, ggcmp)
      UIUtil.SetText(ggcmp, buffDesc, "BuffWordTxt")
    end
    
    wordList.numItems = 1
    UIUtil.SetText(gcmp, string.format("%s%s", T(20433), string.format("x%s", buffInfo.overlap)), "NumberTxt")
  else
    local stageConf = TableData.GetConfig(stageId, "BaseStage")
    if 1 == i then
      ChangeUIController(gcmp, "c1", 1)
      local buffConf = TableData.GetConfig(stageConf.buff_add, "BaseSkillBuffPre")
      loader.url = UIUtil.GetResUrl(buffConf.icon)
      buffName = stageConf.buff_add_name and stageConf.buff_add_name() or ""
      buffDesc = type(buffConf.des) == "function" and buffConf.des() or "未配置"
      local stageBuffGrade = FrostDungeonMgr.GetLevelBuffGrade(stageId)
      if stageConf.inherit_stage_id then
        local inheritStageBuffGrade = FrostDungeonMgr.GetLevelBuffGrade(stageConf.inherit_stage_id)
        buffNumberDesc = string.format("x%s(%s)", stageBuffGrade + inheritStageBuffGrade, stageBuffGrade)
      else
        buffNumberDesc = string.format("x%s", stageBuffGrade)
      end
      UIUtil.SetText(gcmp, T(20433), "BuffWordTxt")
      gcmp:GetChild("PicBuffLoader").url = UIUtil.GetResUrl(buffConf.mini_icon)
      local wordList = gcmp:GetChild("WordList")
      
      function wordList.itemRenderer(j, ggcmp)
        UIUtil.SetText(ggcmp, buffDesc, "BuffWordTxt")
      end
      
      wordList.numItems = 1
    else
      ChangeUIController(gcmp, "c1", 0)
      buffName = stageConf.buff_add_trigger_name and stageConf.buff_add_trigger_name()
      buffDesc = stageConf.buff_add_trigger_des and stageConf.buff_add_trigger_des()
      local wordList = gcmp:GetChild("WordList")
      
      function wordList.itemRenderer(j, ggcmp)
        UIUtil.SetText(ggcmp, buffDesc, "BuffWordTxt")
      end
      
      wordList.numItems = 1
    end
  end
  UIUtil.SetText(gcmp, buffName, "BuffNameTxt")
  UIUtil.SetText(gcmp, buffNumberDesc, "BuffNumberTxt")
end
local TargetItemRenderer = function(i, gcmp)
  local challenges = FrostDungeonData.GetLevelChallenges(stageId)
  local item = challenges[i + 1]
  local conf = TableData.GetConfig(item.id, "BaseStageChallenge")
  local stageConf = TableData.GetConfig(stageId, "BaseStage")
  local targetDesc = conf.name()
  local achieved = item.state > ProtoEnum.CHALLENGE_STAT_TYPE.CST_NONE
  local hasStar = i > 0
  UIUtil.SetText(gcmp, targetDesc, "WordTxt")
  ChangeUIController(gcmp, "c1", achieved and 1 or 0)
  ChangeUIController(gcmp, "c2", hasStar and 1 or 0)
end

function FrostDungeonDetailsWindow.ReInitData()
end

function FrostDungeonDetailsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FrostDungeonDetailsWindow.package, WinResConfig.FrostDungeonDetailsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetSuperDungeon_PlayDetailsWindowUis(contentPane)
    stageId = bridgeObj.argTable[1]
    FrostDungeonDetailsWindow.UpdateInfo()
    FrostDungeonDetailsWindow.InitBtn()
  end)
end

function FrostDungeonDetailsWindow.UpdateInfo()
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_slide_single_show")
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.FrostDungeonDetailsWindow.name)
  end)
  local panel = uis.Main.PlayTips
  local titleCom = panel.Title.root
  local buffPanel = panel.Buff
  local targetPanel = panel.Target
  local bufflist = buffPanel.BuffList
  local targetlist = targetPanel.ContentList
  local bossBuffPanel = panel.BossBuff
  local bossBufflist = bossBuffPanel.BuffList
  local conf = TableData.GetConfig(stageId, "BaseStage")
  local titleTxtContent = T(20234)
  local buttTitleTxtContent = T(20357)
  local orderTxtContent = conf.name_detail()
  local nameTxtContent = conf.name()
  local word1TxtContent = T(663)
  local word2TxtContent = ""
  UIUtil.SetText(titleCom, orderTxtContent, "OrderTxt")
  UIUtil.SetText(titleCom, nameTxtContent, "NameTxt")
  UIUtil.SetText(titleCom, word1TxtContent, "Word1Txt")
  UIUtil.SetText(titleCom, word2TxtContent, "Word2Txt")
  UIUtil.SetText(buffPanel.root, buttTitleTxtContent, "TitleTxt")
  UIUtil.SetText(targetPanel.root, titleTxtContent, "TitleTxt")
  local bossBuffPanelTitleTxtContent = T(20443)
  local bossBuffPanelWordTxtContent = T(20444)
  UIUtil.SetText(bossBuffPanel.root, bossBuffPanelTitleTxtContent, "TitleTxt")
  UIUtil.SetText(bossBuffPanel.root, bossBuffPanelWordTxtContent, "WordTxt")
  local startBtnText = T(20358)
  local closeBtnText = T(20273)
  UIUtil.SetBtnText(panel.StartBtn, startBtnText)
  UIUtil.SetBtnText(panel.CloseBtn, closeBtnText)
  selectedBuffs = {}
  stageBuffList = {}
  local info = FrostDungeonData.GetFrostDungeonInfo()
  if info.buffList then
    for i, v in pairs(info.buffList) do
      table.insert(stageBuffList, {id = i, overlap = v})
    end
    table.sort(stageBuffList, function(x, y)
      return x.id < y.id
    end)
  end
  bufflist.itemRenderer = BuffItemRenderer
  targetlist.itemRenderer = TargetItemRenderer
  bossBufflist.itemRenderer = BuffItemRenderer
  local challenges = FrostDungeonData.GetLevelChallenges(stageId)
  targetlist.numItems = #challenges
  local isHighestLevel = FrostDungeonMgr.IsHighestLevel(stageId)
  ChangeUIController(panel.root, "c1", isHighestLevel and 1 or 0)
  if isHighestLevel then
    bossBufflist.numItems = #stageBuffList
    panel.PlaySuggest1.WordTxt.text = T(20480)
    local recommendBufflist = panel.PlaySuggest1.BuffList
    local recommend_buff = conf.recommend_buff
    
    function recommendBufflist.itemRenderer(i, gcmp)
      local str = recommend_buff[i + 1]
      local splits = Split(str, ":")
      local buffId, layer = tonumber(splits[1]), tonumber(splits[2])
      local buffConf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
      local loader = gcmp:GetChild("PicBuffLoader")
      UIUtil.SetText(gcmp, T(20481), "BuffWordTxt")
      UIUtil.SetText(gcmp, string.format("x%s", layer), "BuffNumberTxt")
      loader.url = UIUtil.GetResUrl(buffConf.mini_icon)
    end
    
    recommendBufflist.numItems = recommend_buff and #recommend_buff or 0
  else
    panel.PlaySuggest2.WordTxt.text = T(20482)
    local recommendCardlist = panel.PlaySuggest2.CardList
    local recommend_card = conf.recommend_card
    
    function recommendCardlist.itemRenderer(i, gcmp)
      local cardId = recommend_card[i + 1]
      local loader = gcmp:GetChild("n2"):GetChild("n3")
      local fashionId = TableData.GetConfig(cardId, "BaseCard").fashion_id
      UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
    end
    
    recommendCardlist.numItems = recommend_card and #recommend_card or 0
    
    function bufflist.itemProvider(i)
      if 0 == i then
        return "ui://0q9o3n6b8x9b1a"
      else
        return "ui://0q9o3n6beqo230"
      end
    end
    
    bufflist.numItems = 2
  end
end

local params = {
  stageId = -1,
  sceneType = ProtoEnum.SCENE_TYPE.BUFF_STAGE,
  backFunc = function()
    UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
  end
}

function FrostDungeonDetailsWindow.InitBtn()
  uis.Main.PlayTips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.FrostDungeonDetailsWindow.name)
  end)
  uis.Main.PlayTips.StartBtn.onClick:Set(function()
    ld("Formation")
    params.stageId = stageId
    FormationMgr.TryOpenFormationWindow(params)
  end)
end

function FrostDungeonDetailsWindow.OnClose()
  uis = nil
  contentPane = nil
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_slide_single_off")
end

return FrostDungeonDetailsWindow
