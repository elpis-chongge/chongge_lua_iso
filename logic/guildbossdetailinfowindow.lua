require("GuildBoss_DungeonInfoWindowByName")
local GuildBossDetailInfoWindow = {}
local uis, contentPane, conf

function GuildBossDetailInfoWindow.ReInitData()
end

function GuildBossDetailInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildBossDetailInfoWindow.package, WinResConfig.GuildBossDetailInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_DungeonInfoWindowUis(contentPane)
    conf = bridgeObj.argTable[1]
    GuildBossDetailInfoWindow.UpdateInfo()
    GuildBossDetailInfoWindow.InitBtn()
  end)
end

function GuildBossDetailInfoWindow.UpdateInfo()
  local panel = uis.Main.DungeonInfoTips
  panel.NameTxt.text = conf.name and conf.name() or conf.id
  panel.TitleTxt.text = conf.name_detail and conf.name_detail() or conf.id
  panel.ExplainTitle.WordTxt.text = "首领信息"
  local buff_list = conf.buff_list
  if buff_list and _G.next(buff_list) then
    panel.c1Ctr.selectedIndex = 0
    local skilllist = panel.SkillList
    
    function skilllist.itemRenderer(i, gcmp)
      local buffId = buff_list[i + 1]
      local preConfig = TableData.GetConfig(tonumber(buffId), "BaseSkillBuffPre")
      if nil == preConfig then
        return
      end
      UIUtil.SetText(gcmp, preConfig.name(), "NameTxt")
      UIUtil.SetText(gcmp, preConfig.des(), "WordTxt")
    end
    
    skilllist.numItems = #buff_list
  else
    panel.c1Ctr.selectedIndex = 1
    local wordlist = panel.WordList
    
    function wordlist.itemRenderer(i, gcmp)
      UIUtil.SetText(gcmp, conf.des and conf.des() or "", "WordTxt")
    end
    
    wordlist.numItems = 1
  end
  UIUtil.SetText(panel.RecommendBtn, "", "WordTxt")
  UIUtil.SetText(panel.StartBtn, "", "WordTxt")
  panel.StartBtn.onClick:Set(function()
    local simulated = 1 == panel.TestBtn:GetController("c1").selectedIndex
  end)
  panel.RecommendBtn.onClick:Set(function()
    GuildWarService.GetGuildWarRecommendFormationReq(conf.id, function()
    end)
  end)
end

function GuildBossDetailInfoWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildBossDetailInfoWindow.name)
  end)
end

function GuildBossDetailInfoWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildBossDetailInfoWindow
