local Time = Time
local getTime = function(unscaledTime)
  if unscaledTime then
    return Time.unscaledTime * 1000
  end
  return Time.fixedTime * 1000
end
local TimerUtil = {}
TimerUtil.runningTimersFixedUpdate = {}
TimerUtil.runningTimersUpdate = {}
TimerUtil.fixedUpdateHandler = nil
TimerUtil.updateHandler = nil

function TimerUtil.new(interval, count, perFunc, compFunc, params)
  local obj = {}
  obj.interval = math.floor(tonumber(interval) * 1000 or 1000)
  obj.count = tonumber(count) or 1
  obj.perFunc = perFunc
  obj.compFunc = compFunc
  obj.params = params
  obj.handler = nil
  obj.timeBase = true
  obj.scale = 1
  obj.unscaledTime = false
  obj._t = 0
  obj._c = 0
  obj._d = false
  obj.isRun = false
  obj._offt = 0
  
  function obj:start()
    if 0 == self.count then
      self:_tick(0)
      return
    end
    if self.interval <= 0 then
      for i = 1, self.count do
        self:_tick(0)
      end
      return
    end
    self._t = getTime(self.unscaledTime)
    self.isRun = true
    if self.unscaledTime then
      table.insert(TimerUtil.runningTimersUpdate, self)
      if TimerUtil.updateHandler == nil then
        UpdateManager.AddUpdateHandler(TimerUtil.updateCallback)
        TimerUtil.updateHandler = true
      end
    else
      table.insert(TimerUtil.runningTimersFixedUpdate, self)
      if nil == TimerUtil.fixedUpdateHandler then
        UpdateManager.AddFixedUpdateHandler(TimerUtil.fixedUpdateCallback)
        TimerUtil.fixedUpdateHandler = true
      end
    end
  end
  
  function obj:stop()
    self:_destroy()
  end
  
  function obj:Comp()
    self:_comp()
  end
  
  function obj:pause()
    self:_delFromRunningTimers()
    self.handler = nil
    self.isRun = false
  end
  
  function obj:resume()
    if self._d then
      return
    end
    self:start()
  end
  
  function obj:restart()
    self:pause()
    self._t = 0
    self._c = 0
    self:start()
  end
  
  function obj:reset()
    self:pause()
    self._t = 0
    self._c = 0
    self.perFunc = nil
    self.compFunc = nil
    self.params = nil
  end
  
  function obj:_doTick(ms)
    if self._d then
      return
    end
    if self.timeBase then
      if self._d == true then
        return
      end
      local _now = getTime(self.unscaledTime)
      self._offt = self._offt + _now - self._t
      self._t = _now
      local itvl = self.interval / self.scale
      while self._offt - itvl >= 0 and self._d ~= true do
        self._offt = self._offt - itvl
        self:_tick(itvl)
      end
    else
      if self._d == true then
        return
      end
      local _now = getTime(self.unscaledTime)
      self._offt = _now - self._t
      self._t = _now
      self:_tick(self._offt)
    end
  end
  
  function obj:_tick(ms)
    local _c = self._c
    _c = _c + 1
    self._c = _c
    if self.perFunc then
      self.perFunc(self, _c, self.params)
    end
    if self.count >= 0 and _c >= self.count then
      self:_comp()
      return
    end
  end
  
  function obj:_comp()
    local compFunc = self.compFunc
    local params = self.params
    self:_destroy()
    if compFunc then
      compFunc(self, params)
    end
  end
  
  function obj:IsRunIng()
    return self and self.isRun
  end
  
  function obj:_destroy()
    if self._d then
      return
    end
    self._d = true
    self.perFunc = nil
    self.compFunc = nil
    self.params = nil
    self.isRun = false
    self:_delFromRunningTimers()
    self.handler = nil
  end
  
  function obj:_delFromRunningTimers()
    for i = #TimerUtil.runningTimersFixedUpdate, 1, -1 do
      local v = TimerUtil.runningTimersFixedUpdate[i]
      if v == self then
        table.remove(TimerUtil.runningTimersFixedUpdate, i)
        return
      end
    end
    for i = #TimerUtil.runningTimersUpdate, 1, -1 do
      local v = TimerUtil.runningTimersUpdate[i]
      if v == self then
        table.remove(TimerUtil.runningTimersUpdate, i)
        return
      end
    end
  end
  
  return obj
end

function TimerUtil.StopAllTimer()
  TimerUtil.runningTimersFixedUpdate = {}
  TimerUtil.runningTimersUpdate = {}
  TimerUtil.fixedUpdateHandler = nil
  TimerUtil.updateHandler = nil
  UpdateManager.RemoveFixedUpdateHandler(TimerUtil.fixedUpdateCallback)
  UpdateManager.RemoveUpdateHandler(TimerUtil.updateCallback)
end

function TimerUtil.fixedUpdateCallback()
  local ms = Time.fixedDeltaTime * 1000
  if #TimerUtil.runningTimersFixedUpdate < 1 then
    if TimerUtil.fixedUpdateHandler then
      UpdateManager.RemoveFixedUpdateHandler(TimerUtil.fixedUpdateCallback)
      TimerUtil.fixedUpdateHandler = nil
    end
    return
  end
  for i = #TimerUtil.runningTimersFixedUpdate, 1, -1 do
    local v = TimerUtil.runningTimersFixedUpdate[i]
    if v and v._d ~= true then
      v:_doTick(ms)
    end
  end
end

function TimerUtil.updateCallback()
  local ms = Time.unscaledDeltaTime * 1000
  if #TimerUtil.runningTimersUpdate < 1 then
    if TimerUtil.updateHandler then
      UpdateManager.RemoveUpdateHandler(TimerUtil.updateCallback)
      TimerUtil.updateHandler = nil
    end
    return
  end
  for i = #TimerUtil.runningTimersUpdate, 1, -1 do
    local v = TimerUtil.runningTimersUpdate[i]
    if v and v._d ~= true then
      v:_doTick(ms)
    end
  end
end

function TimerUtil.setTimeout(interval, func, params, timeBase, unscaledTime)
  local t = TimerUtil.new(interval, 1, nil, func, params)
  if nil == timeBase then
    timeBase = true
  end
  t.timeBase = timeBase
  t.unscaledTime = unscaledTime
  t:start()
  return t
end

function TimerUtil.setInterval(interval, count, perFunc, compFunc, params, timeBase, unscaledTime)
  local t = TimerUtil.new(interval, count, perFunc, compFunc, params)
  if nil == timeBase then
    timeBase = true
  end
  t.timeBase = timeBase
  t.unscaledTime = unscaledTime
  t:start()
  return t
end

return TimerUtil
