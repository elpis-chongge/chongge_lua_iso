HomeData = {}
local data = {curBgPath = nil, isFogging = false}
local testTime

function HomeData.IsFogging()
  return data.isFogging
end

function HomeData.CanFogging()
  return true
end

function HomeData.SetIsFogging(isFogging)
  data.isFogging = isFogging
end

function HomeData.SetTestTime(time)
  testTime = time
end

function HomeData.GetTimeEnum()
  if testTime then
    return testTime
  end
  local savedForceWeather = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.WEATHER_SHOW_TYPE, PLAYER_PREF_DEFAULT_VALUE.WEATHER_SHOW_TYPE)
  if savedForceWeather ~= PLAYER_PREF_DEFAULT_VALUE.WEATHER_SHOW_TYPE then
    if 1 == savedForceWeather then
      return HOME_TIME_ENUM.DAY
    elseif 2 == savedForceWeather then
      return HOME_TIME_ENUM.DUSK
    elseif 3 == savedForceWeather then
      return HOME_TIME_ENUM.NIGHT
    end
    return
  end
  local configValue = TableData.GetConfig(70010020, "BaseFixed").array_value
  local strs = Split(configValue, "|")
  local curTime = LoginData.GetCurServerTime()
  local hour = tonumber(TimeUtil.FormatDate("%H", curTime))
  if hour >= tonumber(strs[1]) and hour < tonumber(strs[2]) then
    return HOME_TIME_ENUM.DAY
  elseif hour >= tonumber(strs[2]) and hour < tonumber(strs[3]) then
    return HOME_TIME_ENUM.DUSK
  else
    return HOME_TIME_ENUM.NIGHT
  end
end

function HomeData.GetWeatherBackground()
  local path
  local effectList = {}
  local timeEnum = HomeData.GetTimeEnum()
  if timeEnum == HOME_TIME_ENUM.DAY then
    path = "Assets/Art/Effects/Prefab/Mainbg_02_stand.prefab"
    effectList = {
      "Assets/Art/Effects/Prefab/FX_ui_mainbg02_stand_daylight.prefab"
    }
  elseif timeEnum == HOME_TIME_ENUM.DUSK then
    path = "Assets/Art/Effects/Prefab/Mainbg_02_dusk.prefab"
  elseif timeEnum == HOME_TIME_ENUM.NIGHT then
    path = "Assets/Art/Effects/Prefab/Mainbg_02_night.prefab"
    effectList = {
      "Assets/Art/Effects/Prefab/FX_ui_mainbg02_night.prefab"
    }
  end
  return path, effectList
end

function HomeData.UpdateWeatherLightParam(interval)
  local timeEnum = HomeData.GetTimeEnum()
  if timeEnum == HOME_TIME_ENUM.DAY then
    LightManager:SetLightParam(1.15, 173, 159, 141, 255, 55.8, 4.5, 534, interval)
    LightManager:SetCameraBloom(UICamera, true, 0.5, 191, 158, 159, 1.89, interval, "UI")
  elseif timeEnum == HOME_TIME_ENUM.DUSK then
    LightManager:SetLightParam(1, 255, 175, 59, 255, 51, -81, 102, interval)
    LightManager:SetCameraBloom(UICamera, true, 0.5, 146, 151, 191, 1.8638, interval, "UI")
  elseif timeEnum == HOME_TIME_ENUM.NIGHT then
    LightManager:SetLightParam(1, 153, 186, 255, 255, 232, 141, 361, interval)
    LightManager:SetCameraBloom(UICamera, true, 0.5, 110, 116, 191, 2.3568, interval, "UI")
  end
end

function HomeData.UpdateWeatherModelParam(obj, interval)
  if nil == obj then
    return
  end
  LeanTween.cancel(obj)
  local showSpineLight = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.SHOW_SPINE_LIGHT, PLAYER_PREF_DEFAULT_VALUE.SHOW_SPINE_LIGHT)
  if 1 == showSpineLight then
    SkeletonAnimationUtil.SetShaderEffectEnable(obj, true, false)
    local timeEnum = HomeData.GetTimeEnum()
    if timeEnum == HOME_TIME_ENUM.DAY then
      SkeletonAnimationUtil.ChangeColor(obj, "DAY", interval)
    elseif timeEnum == HOME_TIME_ENUM.DUSK then
      SkeletonAnimationUtil.ChangeColor(obj, "DUSK", interval)
    elseif timeEnum == HOME_TIME_ENUM.NIGHT then
      SkeletonAnimationUtil.ChangeColor(obj, "NIGHT", interval)
    end
  else
    SkeletonAnimationUtil.SetShaderEffectEnable(obj, false, false)
    SkeletonAnimationUtil.RemoveColor(obj)
  end
end
