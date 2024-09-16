require("Abyss_HandBookEventWindowByName")
local HandBookEventWindow = {}
local uis, contentPane

function HandBookEventWindow.ReInitData()
end

local bgm_monster, illustrationId, soundInst, effWrapper, effWrapper2, delayPlaySoundTweenId

function HandBookEventWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.HandBookEventWindow.package, WinResConfig.HandBookEventWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_HandBookEventWindowUis(contentPane)
    bgm_monster = 6 == bridgeObj.argTable[1]
    illustrationId = bridgeObj.argTable[2]
    HandBookEventWindow.UpdateInfo()
    HandBookEventWindow.InitBtn()
    if bgm_monster then
      SoundManager:PlaySnapShot("snapshot:/system/music_tujian_vol+")
    end
  end)
end

local story_list_req = {newStory = 0}

function HandBookEventWindow.UpdateInfo()
  uis.Main.c1Ctr.selectedIndex = bgm_monster and 1 or 0
  local conf = TableData.GetConfig(illustrationId, bgm_monster and "BaseSound" or "BaseStoryMonster")
  local name = conf.name and conf.name() or "未配置"
  local en_name = conf.name_english and conf.name_english() or "未配置"
  local desc = conf.event_des and conf.event_des() or "未配置"
  local icon = UIUtil.GetResUrl(conf.event_icon)
  local panel = bgm_monster and uis.Main.MusicBook or uis.Main.MonsterBook
  panel.Title.NameTxt.text = bgm_monster and T(20210) or T(20212)
  panel.Title.SubtitleTxt.text = bgm_monster and T(20211) or T(20213)
  local nameTxt = bgm_monster and panel.MusicNameTxt or panel.MonsterNameTxt
  nameTxt.text = name
  panel.WordTxt.text = desc
  panel.Show.PicLoader.url = icon
  local collect = uis.Main.Collect
  PlayUITrans(panel.root, "in")
  if bgm_monster then
    Net.Send(Proto.MsgName.GetStoryListReq, story_list_req, function()
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
      StoryMgr.InitData()
      local musicData = StoryMgr.musicData
      local total, unlockNum = 0, 0
      for _, v in pairs(musicData) do
        if v.child_ids then
          local cnt = #v.child_ids
          total = total + cnt
          for i = 1, cnt do
            if StoryMgr.storyList[v.child_ids[i]] then
              unlockNum = unlockNum + 1
            end
          end
        end
      end
      if uis then
        collect.NumberTxt.text = T(20354, string.format("%s/%s", unlockNum, total))
      end
    end)
    collect.TitleTxt.text = T(20353)
    SoundUtil.StopCurMusic(false)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_music")
    delayPlaySoundTweenId = LeanTween.delayedCall(0.7, function()
      if not delayPlaySoundTweenId then
        return
      end
      delayPlaySoundTweenId = nil
      soundInst = SoundManager:PlayMusicSound(conf.path, conf.bank)
    end).id
    local holder = panel.Show.EffectHolder
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_mapadventure_Illustrated_getmusic_midvoice.prefab")
    effWrapper = UIUtil.SetObjectToUI(effect, holder, 10000)
    holder = panel.Show.Effect1Holder
    effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_mapadventure_Illustrated_getmusic_eff.prefab")
    effWrapper2 = UIUtil.SetObjectToUI(effect, holder, 10000)
  else
    collect.TitleTxt.text = T(20355)
    StoryService.GetStoryMonsterListReq(function()
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
      if uis then
        local unlockNum = #StoryMgr.monsterIds
        local tbl = TableData.GetTable("BaseStoryMonster")
        local total = table.getLen(tbl)
        collect.NumberTxt.text = T(20354, string.format("%s/%s", unlockNum, total))
      end
    end)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_handbook")
    local fashionId = conf.fashion_id
    local skinConf = TableData.GetConfig(fashionId, "BaseFashion")
    if skinConf then
      local go = ResourceManager.Instantiate(ModelUtil.GetFullPath(skinConf.spd))
      local goTrans = go.transform
      local scale = type(skinConf.manor_scale) == "number" and skinConf.manor_scale / 10000 or 1
      local val = TableData.GetConfig(70010813, "BaseFixed").int_value / 10000
      local scaleRatio = 1.25 * scale * val * 10000
      UIUtil.SetObjectToUI(go, panel.Show.PicHolder, scaleRatio)
      local position = goTrans.localPosition
      position.y = -panel.Show.PicHolder.height * 0.5
      goTrans.localPosition = position
      SkeletonAnimationUtil.SetShaderEffectEnable(go, false, false, false, true)
      SkeletonAnimationUtil.SetAnimation(go, 0, SPINE_STATE_ENUM.IDLE, true)
    end
    local holder = panel.Show.root:GetChild("EffectHolder")
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_mapadventure_handbook_monster_light.prefab")
    effWrapper = UIUtil.SetObjectToUI(effect, holder, 10000)
  end
end

function HandBookEventWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    if effWrapper then
      effWrapper:Dispose()
    end
    if effWrapper2 then
      effWrapper2:Dispose()
    end
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.ILLUSTRATION_ACK, illustrationId)
    UIMgr:CloseWindow(WinResConfig.HandBookEventWindow.name)
  end)
end

function HandBookEventWindow.OnClose()
  uis = nil
  contentPane = nil
  if soundInst then
    SoundManager:StopSoundEvent(soundInst, false)
  end
  if delayPlaySoundTweenId then
    LeanTween.cancel(delayPlaySoundTweenId)
  end
  delayPlaySoundTweenId = nil
  soundInst = nil
  if bgm_monster then
    SoundManager:StopSnapShot("snapshot:/system/music_tujian_vol+")
    SoundUtil.PlayLastMusic()
  end
  effWrapper = nil
  effWrapper2 = nil
end

return HandBookEventWindow
