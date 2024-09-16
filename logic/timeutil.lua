local TimeUtil = {}
local s_format = string.format
local mathFloor = math.floor
local osTime = os.time
local osDate = os.date
local osDifftime = os.difftime

function TimeUtil.GetTimeStr(time, showDay)
  time = mathFloor(time)
  local hours, minutes, seconds
  hours = mathFloor(time / 3600)
  time = time % 3600
  minutes = mathFloor(time / 60)
  seconds = time % 60
  if hours > 0 then
    if showDay then
      local day = mathFloor(hours / 24)
      hours = hours % 24
      if 0 == day then
        if hours < 10 then
          return s_format("%d:%02d:%02d", hours, minutes, seconds)
        else
          return s_format("%02d:%02d:%02d", hours, minutes, seconds)
        end
      elseif day < 10 then
        return s_format("%d%s %02d:%02d:%02d", day, T(299), hours, minutes, seconds)
      else
        return s_format("%02d%s %02d:%02d:%02d", day, T(299), hours, minutes, seconds)
      end
    elseif hours < 10 then
      return s_format("%d:%02d:%02d", hours, minutes, seconds)
    else
      return s_format("%02d:%02d:%02d", hours, minutes, seconds)
    end
  elseif hours < 10 then
    return s_format("%d:%02d", minutes, seconds)
  else
    return s_format("%02d:%02d", minutes, seconds)
  end
end

function TimeUtil.CountDown(time, text, func, showDay, perFunc)
  time = mathFloor(time)
  local timerInfo = {}
  text.text = TimeUtil.GetTimeStr(time, showDay)
  timerInfo.timer = TimerUtil.new(1, time, function(timer, tickTime)
    text.text = TimeUtil.GetTimeStr(time - tickTime, showDay)
    if perFunc then
      perFunc(tickTime)
    end
  end, function()
    if nil ~= func then
      func()
    end
  end)
  
  function timerInfo:start()
    self.timer:start()
  end
  
  function timerInfo:Stop()
    self.timer:stop()
  end
  
  function timerInfo:Complete()
    self.timer:Comp()
  end
  
  function timerInfo:Pause()
    self.timer:pause()
  end
  
  function timerInfo:Resume()
    self.timer:resume()
  end
  
  return timerInfo
end

function TimeUtil.FormatRemainTimeRough(time)
  time = mathFloor(time)
  local hours, minutes, seconds
  hours = mathFloor(time / 3600)
  time = time % 3600
  minutes = mathFloor(time / 60)
  seconds = time % 60
  if hours > 0 then
    local day = mathFloor(hours / 24)
    hours = hours % 24
    if 0 == day then
      return T(123, hours)
    elseif day < 3 then
      return T(122, day)
    else
      return T(121, day)
    end
  else
    return T(124, math.max(minutes, 1))
  end
end

function TimeUtil.FormatTime(time)
  time = mathFloor(time)
  local hours, minutes, seconds
  hours = mathFloor(time / 3600)
  time = time % 3600
  minutes = mathFloor(time / 60)
  seconds = time % 60
  if hours > 0 then
    local day = mathFloor(hours / 24)
    hours = hours % 24
    if 0 == day then
      return T(10651, hours)
    else
      return T(10650, day)
    end
  elseif minutes > 0 then
    return T(10652, minutes)
  else
    return T(10653, seconds)
  end
end

function TimeUtil.FormatDate(format, timestamp)
  local timezoneOffset = LoginData.timezoneOffset
  local clientTimezone = TimeUtil.GetTimeZone()
  return osDate(format, math.ceil(timestamp) - clientTimezone + timezoneOffset)
end

function TimeUtil.GetTimeZone()
  local now = osTime()
  return osDifftime(now, osTime(osDate("!*t", now)))
end

function TimeUtil.FormatOfflineTime(time)
  if time < 0 then
    time = 0
  end
  time = math.floor(time)
  local hours, minutes, seconds
  hours = math.floor(time / 3600)
  time = time % 3600
  minutes = math.floor(time / 60)
  seconds = time % 60
  if hours > 0 then
    local day = math.floor(hours / 24)
    hours = hours % 24
    if 0 == day then
      return T(280, hours)
    else
      if day >= 3 then
        return T(1128)
      end
      return T(279, day)
    end
  else
    return T(281, math.max(minutes, 1))
  end
end

function TimeUtil.FormatEnTime(time, notShowHours)
  if time < 1 then
    return ""
  end
  time = math.floor(time)
  local hours = math.ceil(time / 3600)
  local day = math.floor(hours / 24)
  if day > 0 then
    hours = hours % 24
    if 0 == hours or notShowHours then
      return T(1069, day)
    else
      return T(750, day, hours)
    end
  else
    return T(751, hours)
  end
end

return TimeUtil
