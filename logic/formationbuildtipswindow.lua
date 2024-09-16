require("Formation_BuildTipsWindowByName")
local FormationBuildTipsWindow = {}
local uis, contentPane

function FormationBuildTipsWindow.ReInitData()
end

local buildingId, closeCallback, params

function FormationBuildTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FormationBuildTipsWindow.package, WinResConfig.FormationBuildTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    buildingId, closeCallback, params = bridgeObj.argTable[1], bridgeObj.argTable[2], bridgeObj.argTable[3]
    uis = GetFormation_BuildTipsWindowUis(contentPane)
    FormationBuildTipsWindow.UpdateInfo()
    FormationBuildTipsWindow.InitBtn()
  end)
end

function FormationBuildTipsWindow.UpdateInfo()
  local buildConfig = TableData.GetConfig(buildingId, "BaseBuilding")
  uis.Main.NameTxt.text = buildConfig.name()
  local wordList = uis.Main.WordList
  local word = wordList:AddItemFromPool()
  word:GetChild("WordTxt").text = buildConfig.remark()
  uis.Main.PicLoader.url = UIUtil.GetResUrl(buildConfig.head_icon_square)
  local elementList = uis.Main.ElementList
  local monsterId = buildConfig.monster_id
  if monsterId then
    local monsterConfig = TableData.GetConfig(monsterId, "BaseMonster")
    UIUtil.ShowElementList(elementList, monsterConfig)
  end
  local moduleList = uis.Main.ModuleList
  if params.arenaDefense or params.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
    local cost = moduleList:AddItemFromPool()
    ChangeUIController(cost, "c1", 1)
    cost:GetChild("NumberTxt").text = buildConfig.cost
  end
  local cover = moduleList:AddItemFromPool()
  ChangeUIController(cover, "c1", 0)
  local _needGridX = math.ceil(buildConfig.range[1] / FormationData.bottomGridUIWidth)
  local _needGridY = math.ceil(buildConfig.range[2] / FormationData.bottomGridUIWidth)
  cover:GetChild("NumberTxt").text = T(10854, _needGridX, _needGridY)
  uis.Main.c2Ctr.selectedIndex = 0
end

function FormationBuildTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(FormationBuildTipsWindow.Close)
end

function FormationBuildTipsWindow.Close()
  if closeCallback then
    closeCallback()
    closeCallback = nil
  end
  UIMgr:CloseWindow(WinResConfig.FormationBuildTipsWindow.name)
end

function FormationBuildTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  buildingId, closeCallback, params = nil, nil, nil
end

return FormationBuildTipsWindow
