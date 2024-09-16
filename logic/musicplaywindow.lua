require("Story_MusicPlayWindowByName")
local MusicPlayWindow = {}
local uis, contentPane, teamIndex, sound, chapterData, curSoundData, evtInstCache, audioVisualCtrl, entirety, musicPlayEffect, musicEnterEffect, postprocessvolumeCache, lastBtn
local elapse = 0
local lastElapse = 0
local fadeTime = 0.8
local isPause, isComplete, pauseTweenCache, stopTweenCache, volumeCache, lastEvt, tempLoader, bgmVolume
local bgmFadeTime = 1
local initAudioVisualiser = function()
  entirety = ResourceManager.Instantiate(RES_PATH_PREFIX.EFFECT .. "UI_prefab/Music/MusicGroup.prefab")
  entirety.transform.position = Vector3(10000, 10000, 0)
  musicPlayEffect = LuaUtil.FindChild(entirety.transform, "FX_ui_musicplay_grp", true).gameObject
  musicEnterEffect = LuaUtil.FindChild(entirety.transform, "FX_ui_musicname_grp", true).gameObject
  local camera = entirety:GetComponentInChildren(typeof(CS.UnityEngine.Camera))
  local stageCam = StageCamera.main
  camera.transform.localPosition = stageCam.transform.position
  local orthographic = stageCam.orthographic
  if orthographic then
    camera.orthographic = true
    camera.orthographicSize = stageCam.orthographicSize
  else
    camera.orthographic = false
    camera.fieldOfView = stageCam.fieldOfView
  end
  camera.depth = 10
  postprocessvolumeCache = camera:GetComponent(typeof(CS.UnityEngine.Rendering.PPSMobile.PostProcessVolume))
  local effectHolder = uis.Main.SongInfo.PlayBtn:GetChild("EffectHolder")
  effectHolder.pivot = Vector2(0.5, 0.5)
  local position = effectHolder:LocalToGlobal(Vector2.zero)
  local audioVisual = entirety:GetComponentInChildren(typeof(CS.AudioVisualiser))
  audioVisual.transform.localPosition = stageCam:ScreenToWorldPoint(Vector3(position.x, Screen.height - position.y, -stageCam.transform.position.z))
  local component = stageCam:GetComponent(typeof(CS.FairyGUI.StageCamera))
  local scale = component.unitsPerPixel * audioVisual.ppu * UIContentScaler.scaleFactor
  audioVisual.transform.localScale = scale * Vector3.one
  audioVisual.UIAdaptScale = scale
  audioVisual:Init()
  return audioVisual
end
local onstart = function()
  elapse = 0
  lastElapse = 0
  isPause = false
  isComplete = false
  musicPlayEffect:SetActive(true)
  postprocessvolumeCache.enabled = true
  audioVisualCtrl:SetNoteRot(true)
  audioVisualCtrl:SetSampleFadespeed(1)
  audioVisualCtrl:Pause(false)
end
local onupdate = function(duration, samples)
  local muteOrZeroVolume = false
  if not isPause then
    if muteOrZeroVolume then
      if LuaUtil.IsPlaying(musicPlayEffect) then
        LuaUtil.StopEffectEmitting(musicPlayEffect, true, true)
        audioVisualCtrl:ResetSamplesData()
      end
    elseif not LuaUtil.IsPlaying(musicPlayEffect) then
      LuaUtil.PlayEffect(musicPlayEffect)
    end
  end
  if not muteOrZeroVolume then
    audioVisualCtrl:OnSpectrumUpdate(samples)
  end
  if not isPause and duration > elapse then
    elapse = elapse + Time.deltaTime
    if elapse - lastElapse >= 0.5 then
      local timeTxt = uis.Main.SongInfo.TimeTxt
      local length = MusicPlayWindow.FormationTime(duration)
      timeTxt.text = T(934, MusicPlayWindow.FormationTime(elapse), length)
      lastElapse = elapse
    end
    audioVisualCtrl:SetProgress(elapse / duration)
  end
end
local oncomplete = function()
  local inst = evtInstCache
  if inst then
    SoundManager:StopSoundEvent(inst, true)
  end
  evtInstCache = nil
  isComplete = true
  audioVisualCtrl:ResetAndStopNoteRot(1)
  audioVisualCtrl:ResetSamplesData()
  audioVisualCtrl:SetProgress(1)
  audioVisualCtrl:SetSampleFadespeed(0.2)
  postprocessvolumeCache.enabled = false
  LuaUtil.StopEffectEmitting(musicPlayEffect)
end
local fadevolume = function(evtInst, from, to, duration, oncomplete)
  return LeanTween.value(from, to, duration):setOnUpdate(function(val)
    evtInst:setVolume(val)
  end):setOnComplete(oncomplete).id
end
local stop = function(duration)
  if pauseTweenCache then
    LeanTween.cancel(pauseTweenCache)
    pauseTweenCache = nil
  end
  if stopTweenCache then
    LeanTween.cancel(stopTweenCache)
    stopTweenCache = nil
  end
  if lastEvt then
    SoundManager:StopSoundEvent(lastEvt, true)
    lastEvt = nil
  end
  if evtInstCache then
    local inst = evtInstCache
    evtInstCache = nil
    local _, volume = inst:getVolume()
    if type(duration) == "number" and duration > 0 then
      lastEvt = inst
      stopTweenCache = fadevolume(inst, volume, 0, duration, function()
        lastEvt = nil
        stopTweenCache = nil
        SoundManager:StopSoundEvent(inst, true)
      end)
    else
      SoundManager:StopSoundEvent(inst, true)
    end
  end
end
local play = function(path, bank, fadeinTime)
  onstart()
  evtInstCache = SoundManager:PlayMusicSound(path, bank)
  if type(fadeinTime) == "number" and fadeinTime > 0 then
    local _, volume = evtInstCache:getVolume()
    evtInstCache:setVolume(0)
    fadevolume(evtInstCache, 0, volume, fadeinTime)
  end
  local timeTxt = uis.Main.SongInfo.TimeTxt
  local duration = SoundManager:GetDuration(path, bank) / 1000
  local length = MusicPlayWindow.FormationTime(duration)
  timeTxt.text = T(934, MusicPlayWindow.FormationTime(0), length)
  SoundManager:SetSpectrumUpdate(evtInstCache, audioVisualCtrl.sampleSize, function(samples)
    if not isComplete then
      onupdate(duration, samples)
      if elapse >= duration then
        elapse = elapse - duration
        lastElapse = 0
        evtInstCache:setTimelinePosition(0)
      end
    end
  end)
end
local pause = function(time, callback)
  if evtInstCache then
    audioVisualCtrl:Pause(true, time)
    LuaUtil.StopEffectEmitting(musicPlayEffect)
    local _, volume = evtInstCache:getVolume()
    volumeCache = volume
    pauseTweenCache = fadevolume(evtInstCache, volume, 0, time, function()
      isPause = true
      pauseTweenCache = nil
      SoundManager:PauseSoundEvent(evtInstCache)
      if callback then
        callback()
      end
    end)
  end
end
local resume = function(time, callback)
  if evtInstCache then
    isPause = false
    audioVisualCtrl:Pause(false, time)
    LuaUtil.PlayEffect(musicPlayEffect)
    LuaUtil.SetAlpha(musicPlayEffect, 0)
    LeanTween.value(0, 1, time):setOnUpdate(function(val)
      LuaUtil.SetAlpha(musicPlayEffect, val)
    end)
    SoundManager:ResumeSoundEvent(evtInstCache)
    pauseTweenCache = fadevolume(evtInstCache, 0, volumeCache, time, function()
      pauseTweenCache = nil
      if callback then
        callback()
      end
    end)
  end
end

local function setAlpha()
  if not audioVisualCtrl or not uis then
    return
  end
  local go = audioVisualCtrl.gameObject
  local alpha = uis.Main.SongInfo.root.alpha
  if alpha > 0 then
    go:SetActive(true)
  end
  LuaUtil.SetAlpha(go, alpha)
  if alpha >= 1 then
    UpdateManager.RemoveUpdateHandler(setAlpha)
  end
end

local releaseAudioVisualiser = function()
  if evtInstCache then
    SoundManager:ClearSpectrumUpdate(evtInstCache)
  end
  stop(bgmFadeTime / 2)
  ResourceManager.DestroyGameObject(entirety, true)
  musicEnterEffect = nil
  musicPlayEffect = nil
  audioVisualCtrl = nil
  postprocessvolumeCache = nil
  entirety = nil
  UpdateManager.RemoveUpdateHandler(setAlpha)
end
local setPlayUIEffect = function(gobj)
  local unity = CS.UnityEngine
  local holder = gobj:GetChild("RhythmAni"):GetChild("EffectHolder")
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_music_voice.prefab")
  local renderer = effect:GetComponentInChildren(typeof(unity.Renderer))
  local material = renderer.sharedMaterial
  local list = uis.Main.SongRegionAni.SongRegion.SongList
  material:SetVector("_SoftMaskRect", unity.Vector4(list.width, list.height, 0, 1))
  local matrix = list.displayObject.cachedTransform.worldToLocalMatrix
  material:SetMatrix("_SoftMaskMatrix", matrix)
  UIUtil.SetObjectToUI(effect, holder, 10000)
  local halfW = holder.width / 2
  local halfH = holder.height / 2
  effect.transform.localPosition = Vector3(-halfW, -halfH, 0)
end
local ChangeUIController = function(cmp, ctrl, index)
  local controller = cmp:GetController(ctrl)
  if controller then
    controller.selectedIndex = index
  end
end

function MusicPlayWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MusicPlayWindow.package, WinResConfig.MusicPlayWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetStory_MusicPlayWindowUis(contentPane)
    local arg = bridgeObj.argTable[1]
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/flower/FX_UI_flower_backeff.prefab", uis.Main.BackGround.BackGroundHolder)
    chapterData = arg.chapterData
    curSoundData = arg.curSoundData
    sound = {}
    MusicPlayWindow.InitBtn()
    MusicPlayWindow.Init()
    SoundManager:PlaySnapShot("snapshot:/system/music_tujian_vol+")
  end)
end

function MusicPlayWindow.LoadMusicBg()
  if curSoundData then
    UIUtil.SetEffectToUI(RES_PATH_PREFIX.MUSIC_BG .. curSoundData.bg_path, uis.Main.BackGround.BackGroundHolder)
  end
end

function MusicPlayWindow.ChangeSound()
  if curSoundData then
    uis.Main.SongStar.WordTxt.text = curSoundData.name()
    uis.Main.SongInfo.NameTxt.text = curSoundData.name()
    local tab = {}
    if curSoundData.lyricist then
      table.insert(tab, {
        WordTxt = T(799),
        NameTxt = curSoundData.lyricist()
      })
    end
    if curSoundData.composer then
      table.insert(tab, {
        WordTxt = T(800),
        NameTxt = curSoundData.composer()
      })
    end
    
    function uis.Main.SongInfo.AuthorInfo2List.itemRenderer(i, word)
      UIUtil.SetText(word, tab[i + 1].WordTxt, "WordTxt")
      UIUtil.SetText(word, tab[i + 1].NameTxt, "NameTxt")
    end
    
    uis.Main.SongInfo.AuthorInfo2List.numItems = #tab
    local playName = {}
    if curSoundData.singer then
      table.insert(playName, {
        WordTxt = T(941),
        NameTxt = curSoundData.singer()
      })
    end
    
    function uis.Main.SongInfo.AuthorInfo1List.itemRenderer(i, word)
      UIUtil.SetText(word, playName[i + 1].WordTxt, "WordTxt")
      UIUtil.SetText(word, playName[i + 1].NameTxt, "NameTxt")
    end
    
    uis.Main.SongInfo.AuthorInfo1List.numItems = #playName
  end
end

function MusicPlayWindow.Init()
  local bgm = SoundUtil.GetCurMusic()
  if bgm then
    local _, volume = bgm:getVolume()
    bgmVolume = volume
    fadevolume(bgm, volume, 0, bgmFadeTime, function()
      bgm:setPaused(true)
    end)
  end
  audioVisualCtrl = initAudioVisualiser()
  local go = audioVisualCtrl.gameObject
  go:SetActive(false)
  EffectUtil.PlayTimeLineByName(musicEnterEffect, "timeline")
  UpdateManager.AddUpdateHandler(setAlpha)
  local list = uis.Main.SongRegionAni.SongRegion.SongList
  local childData = StoryMgr.GetUnlockData(chapterData.child_ids)
  UIUtil.SetText(uis.Main.ListBtn, #childData, "NumberTxt")
  
  function list.itemRenderer(i, item)
    local itemData = TableData.GetConfig(childData[i + 1], "BaseSound")
    local btn = item:GetChild("SongBtn")
    if itemData then
      UIUtil.SetText(btn, itemData.name(), "NameTxt")
      local duration = SoundManager:GetDuration(itemData.path, itemData.bank)
      if duration then
        UIUtil.SetText(btn, MusicPlayWindow.FormationTime(duration / 1000), "TimeTxt")
      end
    end
    btn.soundFmod = nil
    btn.soundVolumeScale = 0
    item.onClick:Set(function()
      if lastBtn and lastBtn ~= btn then
        ChangeUIController(lastBtn, "c1", 0)
      end
      ChangeUIController(btn, "c1", 1)
      lastBtn = btn
      stop(curSoundData and curSoundData.id ~= itemData.id and fadeTime or -1)
      curSoundData = itemData
      MusicPlayWindow.ChangeSound()
      UIMgr:ShowBlur(uis.Main.root)
      uis.Main.c1Ctr.selectedIndex = 0
      PlayUITrans(uis.Main.root, "in", function()
        uis.Main.c1Ctr.selectedIndex = 1
      end)
      EffectUtil.PlayTimeLineByName(musicEnterEffect, "timeline")
      play(itemData.path, itemData.bank)
      UpdateManager.AddUpdateHandler(setAlpha)
    end)
    local ctrl = btn:GetController("c1")
    ctrl.onChanged:Set(function(context)
      if 1 == ctrl.selectedIndex then
        setPlayUIEffect(btn)
      else
        local holder = btn:GetChild("RhythmAni"):GetChild("EffectHolder")
        holder:SetNativeObject(nil)
      end
    end)
  end
  
  list.numItems = #childData
  MusicPlayWindow.LoadMusicBg()
  MusicPlayWindow.ChangeSound()
  play(curSoundData.path, curSoundData.bank, bgmFadeTime * 2)
  for i, v in ipairs(childData) do
    local itemData = TableData.GetConfig(v, "BaseSound")
    if itemData.id == curSoundData.id then
      local btn = list:GetChildAt(i - 1):GetChild("SongBtn")
      ChangeUIController(btn, "c1", 1)
      lastBtn = btn
      break
    end
  end
end

function MusicPlayWindow.Pause()
  if lastBtn then
    ChangeUIController(lastBtn, "c1", 2)
    pause(fadeTime)
  end
end

function MusicPlayWindow.Resume()
  if lastBtn then
    ChangeUIController(lastBtn, "c1", 1)
    resume(fadeTime)
  end
end

function MusicPlayWindow.FormationTime(t)
  local time = math.ceil(t)
  local minutes = math.floor(time / 60)
  local seconds = time % 60
  local str = string.format("%02d:%02d", minutes, seconds)
  return str
end

function MusicPlayWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.MusicPlayWindow.name)
  end)
  uis.Main.SongInfo.PlayBtn.soundFmod = nil
  uis.Main.SongInfo.PlayBtn.soundVolumeScale = 0
  uis.Main.SongInfo.PlayBtn.onClick:Set(function()
    if isComplete then
      ChangeUIController(lastBtn, "c1", 1)
      play(curSoundData.path, curSoundData.bank)
    else
      if pauseTweenCache then
        return
      end
      if isPause then
        MusicPlayWindow.Resume()
      else
        MusicPlayWindow.Pause()
      end
    end
  end)
  local list = uis.Main.SongRegionAni.SongRegion.SongList
  uis.Main.ListBtn.onClick:Set(function()
    local idx = uis.Main.c1Ctr.selectedIndex
    idx = (idx + 1) % 2
    uis.Main.c1Ctr.selectedIndex = idx
    if 1 == idx then
      local item
      for i = 0, list.numChildren - 1 do
        item = list:GetChildAt(i)
        item:GetChild("SongBtn").alpha = 0
        PlayUITrans(item, "up", nil, i * 0.08)
      end
    end
  end)
end

function MusicPlayWindow.HandleMessage(msgId, para)
end

function MusicPlayWindow.OnPreClose()
  releaseAudioVisualiser()
end

function MusicPlayWindow.OnClose()
  SoundManager:StopSnapShot("snapshot:/system/music_tujian_vol+")
  local bgm = SoundUtil.GetCurMusic()
  if bgm then
    bgm:setPaused(false)
    fadevolume(bgm, 0, bgmVolume, bgmFadeTime)
  end
  if tempLoader then
    tempLoader:Dispose()
  end
  tempLoader = nil
  uis = nil
  teamIndex = nil
  contentPane = nil
  curSoundData = nil
  lastBtn = nil
  isPause = nil
end

return MusicPlayWindow
