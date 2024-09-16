require("PlayerLevelUp_LevelUpWindowByName")
local LevelUpWindow = {}
local uis, contentPane, bgPrefab, closeCallBack

function LevelUpWindow.ReInitData()
end

function LevelUpWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.LevelUpWindow.package, WinResConfig.LevelUpWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    closeCallBack = bridgeObj.argTable[1]
    uis = GetPlayerLevelUp_LevelUpWindowUis(contentPane)
    LevelUpWindow.InitBtn()
    LevelUpWindow.UpdateInfo()
    LevelUpWindow.LoadBgTexture()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.LV_UP_SUCCEED)
    SoundUtil.PlaySfx(40005)
  end)
end

function LevelUpWindow.LoadBgTexture()
  bgPrefab = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/TeamLevelUp/FX_ui_teamlevelup.prefab")
  UIMgr:PlayAlphaChangeAnimIn(bgPrefab)
end

function LevelUpWindow.UpdateInfo()
  local lv = ActorData.GetLevel()
  local data = TableData.GetConfig(lv - 1, "BasePlayerLevelUp")
  uis.Main.LevelTxt.text = lv
  local tips = {}
  if data.reward then
    local arr = GetConfigItemList(data.reward, true)
    for i, v in pairs(arr) do
      if v.id == COMMON_ITEM_ID.ENERGY then
        table.insert(tips, {
          TitleTxt = T(899),
          WordTxt = v.value
        })
      end
    end
  end
  
  function uis.Main.ContentList.itemRenderer(i, item)
    local word = item:GetChild("OpenWord")
    UIUtil.SetText(word, tips[i + 1].TitleTxt, "TitleTxt")
    UIUtil.SetText(word, tips[i + 1].WordTxt, "WordTxt")
    PlayUITrans(item, "in", nil, i * 0.4)
  end
  
  uis.Main.ContentList.numItems = #tips
end

function LevelUpWindow.GetUnlocked()
  local data = TableData.GetTable("BaseFeature")
  local lv = ActorData.GetLevel()
  local tb = {}
  for i, v in pairs(data) do
    if v.unlock_icon and v.level and lv == v.level then
      table.insert(tb, v.id)
    end
  end
  return tb
end

function LevelUpWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    local locked = LevelUpWindow.GetUnlocked()
    if #locked > 0 then
      OpenWindow(WinResConfig.FunctionWindow.name, nil, locked, closeCallBack)
    else
      UIMgr:CloseWindow(WinResConfig.LevelUpWindow.name)
      if closeCallBack then
        closeCallBack()
      end
    end
  end)
end

function LevelUpWindow.OnClose()
  uis = nil
  contentPane = nil
  ResourceManager.DestroyGameObject(bgPrefab)
  bgPrefab = nil
  closeCallBack = nil
end

return LevelUpWindow
