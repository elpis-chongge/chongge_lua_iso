require("RogueBuild01_InsideDifficultyLookWindowByName")
local RogueGameDifficultyInfoWindow = {}
local uis, contentPane

function RogueGameDifficultyInfoWindow.ReInitData()
end

function RogueGameDifficultyInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameDifficultyInfoWindow.package, WinResConfig.RogueGameDifficultyInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideDifficultyLookWindowUis(contentPane)
    RogueGameDifficultyInfoWindow.UpdateInfo()
    RogueGameDifficultyInfoWindow.InitBtn()
  end)
end

function RogueGameDifficultyInfoWindow.UpdateInfo()
  local themeInfo = RogueGameData.GetThemeInfo()
  local themeConf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
  local diffLv = themeInfo.curDifficultyLevel
  local groupId = themeConf.group_id
  local tbl = TableData.GetTable("BaseRogueDifficulty")
  local conf = false
  for i, v in pairs(tbl) do
    if v.group_id == groupId and diffLv == v.level then
      conf = v
      if v.score_ratio and v.score_ratio > 0 then
        uis.Main.Tips.Number.c1Ctr.selectedIndex = 1
        uis.Main.Tips.Number.ScoreAdd.WordTxtTxt.text = T(1371)
        uis.Main.Tips.Number.ScoreAdd.NumberTxt.text = T(1372, math.floor(v.score_ratio / 100))
        break
      end
      uis.Main.Tips.Number.c1Ctr.selectedIndex = 0
      break
    end
  end
  local list = uis.Main.Tips.root:GetChild("EffectTxt")
  if conf then
    uis.Main.Tips.Number.WordTxt.text = conf.name()
    uis.Main.Tips.Number.NumberTxt.text = conf.level
    if conf.buff_list then
      function list.itemRenderer(i, item)
        local buffConf = TableData.GetConfig(conf.buff_list[i + 1], "BaseSkillBuffPre")
        
        if buffConf then
          local effect = item:GetChild("Effect")
          effect.alpha = 0
          UIUtil.SetText(effect, buffConf.des(), "WordTxt")
          PlayUITrans(item, "up", nil, 0.08 * i)
        end
      end
      
      list.numItems = #conf.buff_list
    else
      function list.itemRenderer(i, item)
        local effect = item:GetChild("Effect")
        
        effect.alpha = 0
        UIUtil.SetText(effect, conf.des(), "WordTxt")
        PlayUITrans(item, "up", nil, 0.08 * i)
      end
      
      list.numItems = 1
    end
  else
    uis.Main.Tips.Number.c1Ctr.selectedIndex = 0
    list.numItems = 0
  end
end

function RogueGameDifficultyInfoWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueGameDifficultyInfoWindow.name)
  end)
end

function RogueGameDifficultyInfoWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueGameDifficultyInfoWindow
