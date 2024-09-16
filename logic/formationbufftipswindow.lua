require("Formation_BuffTipsWindowByName")
local FormationBuffTipsWindow = {}
local uis, contentPane

function FormationBuffTipsWindow.ReInitData()
end

local preBuffIds

function FormationBuffTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FormationBuffTipsWindow.package, WinResConfig.FormationBuffTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetFormation_BuffTipsWindowUis(contentPane)
    preBuffIds = bridgeObj.argTable[1]
    FormationBuffTipsWindow.UpdateInfo()
    FormationBuffTipsWindow.InitBtn()
  end)
end

function FormationBuffTipsWindow.UpdateInfo()
  local nameTxt = uis.Main.BuffTipsRegion.NameTxt
  nameTxt.text = T(10063)
  local moduleList = uis.Main.BuffTipsRegion.ModuleList
  
  function moduleList.itemRenderer(index, item)
    local preBuffId = preBuffIds[index + 1]
    local preConfig = TableData.GetConfig(tonumber(preBuffId), "BaseSkillBuffPre")
    if nil == preConfig then
      return
    end
    item:GetChild("TipsTxt").text = preConfig.name()
    item:GetChild("WordTxt").text = preConfig.des()
  end
  
  moduleList.numItems = #preBuffIds
end

function FormationBuffTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(FormationBuffTipsWindow.Close)
end

function FormationBuffTipsWindow.Close()
  UIMgr:CloseWindow(WinResConfig.FormationBuffTipsWindow.name)
end

function FormationBuffTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  preBuffIds = nil
end

return FormationBuffTipsWindow
