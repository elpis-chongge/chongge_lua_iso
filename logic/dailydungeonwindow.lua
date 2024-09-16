require("DailyDungeon_DailyDungeonWindowByName")
local DailyDungeonWindow = {}
local uis, curIndex, contentPane, jumpTb, totalSceneData

function DailyDungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.DailyDungeonWindow.package, WinResConfig.DailyDungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetDailyDungeon_DailyDungeonWindowUis(contentPane)
    DailyDungeonWindow.LoadBgTexture()
    DailyDungeonWindow.InitBtn()
    DailyDungeonWindow.InitList()
    SoundUtil.PlayMusic(30002)
  end)
end

function DailyDungeonWindow.InitDailyDungeonSceneInfoData()
  local tb = {}
  local config = TableData.GetTable("BaseDailyDungeon")
  for i, v in pairs(config) do
    local data = SimpleCopy(v)
    data.info = AdventureData.GetSceneData(v.type)
    table.insert(tb, data)
  end
  table.sort(tb, function(a, b)
    return a.sort < b.sort
  end)
  return tb
end

function DailyDungeonWindow.LoadBgTexture()
  uis.Main.BackGround.BackGroundHolder:SetPivot(0.5, 0.5, true)
  uis.Main.BackGround.BackGroundHolder:Center()
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Adventuredoor/FX_ui_adventuredoor_itemcollet_list.prefab", uis.Main.BackGround.BackGroundHolder)
end

function DailyDungeonWindow.InitList()
  totalSceneData = DailyDungeonWindow.InitDailyDungeonSceneInfoData()
  uis.Main.Effect2.root.touchable = false
  local tipsWord
  local len = #totalSceneData
  
  function uis.Main.TipsList.itemRenderer(i, item)
    local data = totalSceneData[i + 1]
    item.gameObjectName = data.id
    item.name = data.id
    local tipsPic = item:GetChild("DailyTipsPic")
    tipsWord = tipsPic:GetChild("DailyTipsWord")
    tipsWord:GetChild("NameTxt").text = data.name()
    tipsWord:GetChild("SubtitleTxt").text = data.name_detail()
    tipsPic:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Adventuredoor/FX_ui_adventuredoor_itemcollet_choose.prefab", tipsPic:GetChild("EffectHolder"))
    ChangeUIController(tipsWord:GetChild("TypeIcon1"), "c1", data.type - 11)
    ChangeUIController(tipsWord:GetChild("TypeIcon2"), "c1", data.type - 11)
    if data.info then
      if data.info.inOpenTime and EnterClampUtil.WhetherToEnter(data.feature_id, false) then
        ChangeUIController(tipsWord, "c3", 1)
      else
        ChangeUIController(tipsWord, "c3", 0)
      end
    end
    tipsPic.onClick:Set(function()
      DailyDungeonWindow.SetItemTouchable(i)
      LeanTween.delayedCall(0.3, function()
        if uis then
          DailyDungeonWindow.SetItemTouchable(i, true)
        end
      end)
      DailyDungeonWindow.ItemOnClick(i)
    end)
    if i == len - 1 then
      ChangeUIController(tipsPic, "c1", 2)
    else
      ChangeUIController(tipsPic, "c1", i % 2)
    end
  end
  
  uis.Main.TipsList.numItems = len
end

function DailyDungeonWindow.SetItemTouchable(index, all)
  local list = uis.Main.TipsList
  local obj
  for i = 0, list.numItems - 1 do
    obj = list:GetChildAt(i)
    if obj then
      obj.touchable = all and true or index == i
    end
  end
end

function DailyDungeonWindow.ItemOnClick(index)
  local sceneData = totalSceneData[index + 1]
  if sceneData and EnterClampUtil.WhetherToEnter(sceneData.feature_id) then
    if sceneData.info == nil or not sceneData.info.inOpenTime then
      FloatTipsUtil.ShowWarnTips(sceneData.des())
      return
    end
    if sceneData.info.inOpenTime then
      if uis.Main.TipsList.selectedIndex == index then
        if BlockInTestPackage() then
          return
        end
        curIndex = index + 1
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TRIAL_ENTER)
        DailyDungeonWindow.OpenMap()
      else
        uis.Main.TipsList.selectedIndex = index
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TRIAL_TYPE_SELECT)
      end
      DailyDungeonWindow.ShowSelected(index)
    end
  end
end

function DailyDungeonWindow.ShowSelected(index)
  local list = uis.Main.TipsList
  local obj, tipsPic, len
  len = list.numItems - 1
  local controller
  for i = 0, len do
    obj = list:GetChildAt(i)
    if obj then
      ChangeUIController(obj, "touch", i == index and 1 or 0)
      tipsPic = obj:GetChild("DailyTipsPic")
      controller = obj:GetChild("DailyTipsPic"):GetChild("DailyTipsWord"):GetController("c3")
      if controller and 0 ~= controller.selectedIndex then
        controller.selectedIndex = i == index and 2 or 1
      end
      if index > 0 and i == index - 1 or i == index then
        ChangeUIController(tipsPic, "c1", 2)
      elseif len == i and i ~= index then
        ChangeUIController(tipsPic, "c1", 2)
      else
        ChangeUIController(tipsPic, "c1", i % 2)
      end
    end
  end
end

function DailyDungeonWindow.OpenMap()
  local trans = uis.Main.root:GetTransition("out1")
  if trans then
    trans:SetHook("Sign", function()
      AdventureMgr.dailyMapIndex = 1
      OpenWindow(WinResConfig.DailyMapWindow.name, nil, {
        data = totalSceneData[curIndex]
      })
    end)
    trans:Play()
  end
end

function DailyDungeonWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.DailyDungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ADVENTURE_DAILY)
end

function DailyDungeonWindow.HandleMessage(msgId, para)
end

function DailyDungeonWindow.OnClose()
  uis = nil
  contentPane = nil
  curIndex = nil
  totalSceneData = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return DailyDungeonWindow
