local SettingUtil = {
  savedSetting = {}
}
local PlayerPrefs = CS.UnityEngine.PlayerPrefs

function SettingUtil.ParseSetting(setting)
  if string.len(setting) > 0 then
    SettingUtil.savedSetting = Json.decode(setting)
    local savedSetting = SettingUtil.savedSetting
    for k, v in pairs(savedSetting) do
      PlayerPrefsUtil.SetString(k, v)
    end
    SettingUtil.UpdateSfxVolume()
    SettingUtil.UpdateMusicVolume()
    SettingUtil.UpdateVoiceVolume()
    SettingUtil.UpdateSfx()
    SettingUtil.UpdateMusic()
    SettingUtil.UpdateVoice()
  end
end

function SettingUtil.UpdateFPS()
  local fpsFlag = 0
  fpsFlag = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.UI_HIGH_FPS_ENABLE, PLAYER_PREF_DEFAULT_VALUE.UI_HIGH_FPS_ENABLE)
  if 0 == fpsFlag then
    Application.targetFrameRate = Const.LowFPS
  elseif 1 == fpsFlag then
    Application.targetFrameRate = Const.HighFPS
  end
end

function SettingUtil.UpdateWeatherType(value)
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.WEATHER_SHOW_TYPE, value)
end

function SettingUtil.UpdateSfx()
  local intValue = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.SFX_ENABLE, PLAYER_PREF_DEFAULT_VALUE.SFX_ENABLE)
  PlayerPrefs.SetInt(PLAYER_PREF_ENUM.SFX_ENABLE, intValue)
  SoundManager:SetSfxEnable(1 == intValue)
end

function SettingUtil.UpdateMusic()
  local intValue = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.MUSIC_ENABLE, PLAYER_PREF_DEFAULT_VALUE.MUSIC_ENABLE)
  PlayerPrefs.SetInt(PLAYER_PREF_ENUM.MUSIC_ENABLE, intValue)
  if 1 == intValue then
    SettingUtil.UpdateMusicVolume()
  else
    SettingUtil.UpdateMusicVolume(0)
  end
end

function SettingUtil.UpdateVoice()
  local intValue = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.VOICE_ENABLE, PLAYER_PREF_DEFAULT_VALUE.VOICE_ENABLE)
  PlayerPrefs.SetInt(PLAYER_PREF_ENUM.VOICE_ENABLE, intValue)
  if 1 == intValue then
    SettingUtil.UpdateVoiceVolume()
  else
    SettingUtil.UpdateVoiceVolume(0)
  end
end

function SettingUtil.UpdateSfxVolume(volume, save)
  volume = volume or PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.SFX_VOLUME, PLAYER_PREF_DEFAULT_VALUE.SFX_VOLUME)
  PlayerPrefs.SetInt(PLAYER_PREF_ENUM.SFX_VOLUME, volume)
  SoundManager:SetSfxVolume(volume)
  if save then
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.SFX_VOLUME, volume)
  end
end

function SettingUtil.UpdateMusicVolume(volume, save)
  volume = volume or PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.MUSIC_VOLUME, PLAYER_PREF_DEFAULT_VALUE.MUSIC_VOLUME)
  PlayerPrefs.SetInt(PLAYER_PREF_ENUM.MUSIC_VOLUME, volume)
  SoundManager:SetMusicVolume(volume)
  if save then
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.MUSIC_VOLUME, volume)
  end
end

function SettingUtil.UpdateVoiceVolume(volume, save)
  volume = volume or PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.VOICE_VOLUME, PLAYER_PREF_DEFAULT_VALUE.VOICE_VOLUME)
  PlayerPrefs.SetInt(PLAYER_PREF_ENUM.VOICE_VOLUME, volume)
  SoundManager:SetVoiceVolume(volume)
  if save then
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.VOICE_VOLUME, volume)
  end
end

function SettingUtil.UpdateSetting(key, value, savedServer, opType)
  if value == SettingUtil.savedSetting[key] then
    return
  end
  if savedServer then
    SettingUtil.savedSetting[key] = value
    local settings = Json.encode(SettingUtil.savedSetting)
    ActorService.SaveSettingsReq(settings, opType, value)
  end
end

function SettingUtil.UpdateScreenAdaptRatio(ratio)
  UIMgr.ScreenAdaptRatio = ratio
end

function SettingUtil.ResetScreenAdaptRatio()
  UIMgr.ScreenAdaptRatio = UIMgr.DefaultScreenAdaptRatio
end

function SettingUtil.AccountCenter()
  LoginMgr.OpenUserCenter()
end

function SettingUtil.ChangeAccount()
  LoginMgr.Logout(false, true)
end

function SettingUtil.CustomService()
  LoginMgr.OpenBugReport()
end

function SettingUtil.CloseAccount()
  local data = {
    {
      role_name = ActorData.GetName(),
      server_name = "bilibili\229\140\186",
      level = tostring(ActorData.GetLevel()),
      time = TimeUtil.FormatDate("%Y-%m-%d", LoginData.serverTime)
    }
  }
  local str = Json.encode(data)
  SDKManager:CloseAccount(str)
end

return SettingUtil
