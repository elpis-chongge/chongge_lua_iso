require("PlotDungeon_OpenSceneWindowByName")
local OpenSceneWindow = {}
local uis, contentPane, chapterId, effect

function OpenSceneWindow.ReInitData()
end

function OpenSceneWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.OpenSceneWindow.package, WinResConfig.OpenSceneWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPlotDungeon_OpenSceneWindowUis(contentPane)
    local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
    chapterId = info.currentChapter
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_NEXT2)
    OpenSceneWindow.UpdateInfo()
    effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Adventure/Chapter_openend/open/FX_ui_adventure_open.prefab")
    local curSceneCamera = effect:GetComponentInChildren(typeof(Camera), true)
    curSceneCamera.gameObject:GetOrAddComponent(typeof(CS.AutoAdaptScreen))
    LeanTween.delayedCall(4.5, function()
      OpenSceneWindow.CloseWindow()
    end)
  end)
end

function OpenSceneWindow.UpdateInfo()
  local data = TableData.GetConfig(chapterId, "BaseChapter")
  if data then
    if data.name_detail then
      uis.Main.NameTxt.text = data.name_detail()
    end
    uis.Main.Number1Txt.text = data.name()
    uis.Main.Number2Txt.text = data.name()
    uis.Main.WordTxt.text = data.des()
    uis.Main.SubtitleTxt.text = data.chapter_english()
  end
end

function OpenSceneWindow.InitBtn()
end

function OpenSceneWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.LevelUpWindow.name)
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.PLOT_ANIM_CHAPTER_OPEN, 0)
  AdventureMgr.playSpineAnim = true
  AdventureMgr.firstOpenChapter = true
  OpenWindow(WinResConfig.PlotDungeonWindow.name, nil, chapterId, true)
end

function OpenSceneWindow.OnInitEnd()
end

function OpenSceneWindow.OnClose()
  uis = nil
  contentPane = nil
  ResourceManager.DestroyGameObject(effect, false)
  effect = nil
  chapterId = nil
end

return OpenSceneWindow
