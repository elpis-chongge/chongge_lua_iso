require("Expedition_BattleBuffLookWindowByName")
local ExpeditionBattleBuffLookWindow = {}
local uis, contentPane
local trans_intvl = 0.04

function ExpeditionBattleBuffLookWindow.ReInitData()
end

function ExpeditionBattleBuffLookWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionBattleBuffLookWindow.package, WinResConfig.ExpeditionBattleBuffLookWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExpedition_BattleBuffLookWindowUis(contentPane)
    ExpeditionBattleBuffLookWindow.UpdateInfo()
    ExpeditionBattleBuffLookWindow.InitBtn()
  end)
end

function ExpeditionBattleBuffLookWindow.UpdateInfo()
  uis.Main.root.opaque = false
  uis.Main.TipsTxt.root.opaque = false
  uis.Main.CommonTitle.root.opaque = false
  local use_records = false
  local bufflist = ExpeditionData.GetCurBufflist()
  local cnt = bufflist and #bufflist or 0
  if 0 == cnt then
    bufflist = ExpeditionMgr.GetBuffRecords()
    cnt = #bufflist
    use_records = true
  end
  local list = uis.Main.SkillList
  list.opaque = false
  list.defaultItem = "ui://Expedition/SkillTipsAni"
  
  function list.itemRenderer(i, gcmp)
    local subItem = gcmp:GetChild("SkillTips")
    subItem.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * trans_intvl)
    local nameTxt = subItem:GetChild("NameTxt")
    local wordList = subItem:GetChild("WordList")
    wordList.defaultItem = "ui://Expedition/SkillTipsWord"
    if i + 1 <= cnt then
      local item = bufflist[i + 1]
      local buffId = item.id
      local conf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
      
      function wordList.itemRenderer(_, _gcmp)
        local wordTxt = _gcmp:GetChild("WordTxt")
        wordTxt.text = conf.des()
      end
      
      wordList.numItems = 1
      nameTxt.text = conf.name()
      local loader = subItem:GetChild("PicLoader")
      loader.url = UIUtil.GetResUrl(conf.icon)
      ChangeUIController(subItem, "c1", 1)
      local occup = subItem:GetChild("Occupation")
      ChangeUIController(occup, "c1", item.type - 1)
    else
      wordList.numItems = 0
      nameTxt.text = T(20052)
      ChangeUIController(subItem, "c1", 0)
    end
  end
  
  list.numItems = 4
  local skipTipsTitle = T(20045)
  local windowMainTitle = T(20043)
  uis.Main.TipsTxt.text = skipTipsTitle
  uis.Main.CommonTitle.WordTxt.text = windowMainTitle
  uis.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExpeditionBattleBuffLookWindow.name)
  end)
end

function ExpeditionBattleBuffLookWindow.InitBtn()
end

function ExpeditionBattleBuffLookWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ExpeditionBattleBuffLookWindow
