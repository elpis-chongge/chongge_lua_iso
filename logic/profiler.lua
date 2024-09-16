local EMPTY_TIME = "0.0000"
local emptyToThis = "~"
local timeWidth = 7
local relaWidth = 6
local callWidth = 10
local divider = ""
local formatOutput = ""
local formatTotalTime = "Total time spent in profiled functions: %s\n"
local formatFunTime = "%04.4f"
local formatFunRelative = "%03.1f"
local formatFunCount = "%" .. callWidth - 1 .. "i"
local formatHeader = ""
local charRepetition = function(n, character)
  local s = {}
  character = character or " "
  for _ = 1, n do
    table.insert(s, character)
  end
  return table.concat(s)
end
local clockNow
local scale = 1
clockNow = os.clock
local Profiler = {}
local newProfiler = function(variant)
  if Profiler.running then
    print("Profiler already running.")
    return
  end
  variant = variant or "time"
  if "time" ~= variant and "call" ~= variant then
    print("Profiler method must be 'time' or 'call'.")
    return
  end
  local newprof = {}
  for k, v in pairs(Profiler) do
    newprof[k] = v
  end
  newprof.variant = variant
  return newprof
end

function Profiler:start()
  if Profiler.running then
    return
  end
  Profiler.running = self
  self.caller_cache = {}
  self.callstack = {}
  self.start_time = clockNow()
  if self.variant == "time" then
  elseif self.variant == "call" then
    self.setpause = collectgarbage("setpause")
    self.setstepmul = collectgarbage("setstepmul")
    collectgarbage("setpause", 300)
    collectgarbage("setstepmul", 5000)
    debug.sethook(profiler_hook_wrapper_by_call, "cr")
  else
    error("Profiler method must be 'time' or 'call'.")
  end
end

function Profiler:stop()
  if Profiler.running ~= self then
    return
  end
  self.end_time = clockNow()
  debug.sethook(nil)
  if self.variant == "call" then
    collectgarbage("setpause", self.setpause)
    collectgarbage("setstepmul", self.setstepmul)
  end
  collectgarbage("collect")
  collectgarbage("collect")
  Profiler.running = nil
end

function profiler_hook_wrapper_by_call(action)
  if Profiler.running == nil then
    debug.sethook(nil)
    return
  end
  Profiler.running:analysis_call_info(action)
end

function Profiler:analysis_call_info(action)
  local caller_info = debug.getinfo(3, "Slfn")
  if nil == caller_info then
    return
  end
  local last_caller = self.callstack[1]
  if "call" == action then
    local this_caller = self:get_func_info_by_cache(caller_info.func, caller_info)
    this_caller.parent = last_caller
    this_caller.clock_start = clockNow()
    this_caller.count = this_caller.count + 1
    table.insert(self.callstack, 1, this_caller)
  else
    local last_caller = table.remove(self.callstack, 1)
    local this_caller = self.caller_cache[caller_info.func]
    if "tail return" == action and last_caller then
      this_caller = self.caller_cache[last_caller.func]
    end
    if nil == this_caller then
      return
    end
    this_caller.this_time = clockNow() - this_caller.clock_start
    this_caller.time = this_caller.time + this_caller.this_time
    if this_caller.parent then
      this_caller.parent.children[this_caller.func] = (this_caller.parent.children[this_caller.func] or 0) + 1
      this_caller.parent.children_time[this_caller.func] = (this_caller.parent.children_time[this_caller.func] or 0) + this_caller.this_time
      if nil == this_caller.name then
        this_caller.parent.unknow_child_time = this_caller.parent.unknow_child_time + this_caller.this_time
      else
        this_caller.parent.name_child_time = this_caller.parent.name_child_time + this_caller.this_time
      end
    end
  end
end

function Profiler:get_func_info_by_cache(func, info)
  local ret = self.caller_cache[func]
  if nil == ret then
    ret = {}
    ret.func = func
    ret.count = 0
    ret.time = 0
    ret.unknow_child_time = 0
    ret.name_child_time = 0
    ret.children = {}
    ret.children_time = {}
    if info.source and string.find(info.source, "\n") then
      info.source = "[string]"
    end
    ret.func_info = info
    self.caller_cache[func] = ret
  end
  return ret
end

function Profiler:format_header(ordering, lines, totalTime)
  local TABL_REPORTS = {}
  local maxFileLen = 0
  local maxFuncLen = 0
  for i, func in ipairs(ordering) do
    local record = self.caller_cache[func]
    local reportInfo = {
      count = record.count,
      timer = record.time,
      src = record.func_info.short_src,
      name = record.func_info.name or "unknow",
      linedefined = record.func_info.linedefined,
      what = record.func_info.what,
      source = record.func_info.source
    }
    reportInfo.src = self:pretty_name(func, true)
    if maxFileLen < string.len(reportInfo.src) and reportInfo.count > 0 then
      maxFileLen = string.len(reportInfo.src) + 1
    end
    if maxFuncLen < string.len(reportInfo.name) and reportInfo.count > 0 then
      maxFuncLen = string.len(reportInfo.name) + 1
    end
    table.insert(TABL_REPORTS, reportInfo)
  end
  if maxFileLen >= 99 then
    maxFileLen = 99
  end
  formatOutput = "| %-" .. maxFileLen .. "s: %-" .. maxFuncLen .. "s: %-" .. timeWidth .. "s: %-" .. relaWidth .. "s: %-" .. callWidth .. "s|\n"
  formatHeader = string.format(formatOutput, "FILE", "FUNCTION", "TIME", "%", "Call count")
  divider = charRepetition(#formatHeader - 1, "-") .. "\n"
  table.insert(lines, "\n" .. divider)
  table.insert(lines, formatHeader)
  table.insert(lines, divider)
  local totalCount = 0
  for i, reportInfo in ipairs(TABL_REPORTS) do
    if reportInfo.count > 0 and totalTime >= reportInfo.timer then
      local count = string.format(formatFunCount, reportInfo.count)
      local timer = string.format(formatFunTime, reportInfo.timer)
      local relTime = string.format(formatFunRelative, reportInfo.timer / totalTime * 100)
      if timer == EMPTY_TIME then
        timer = emptyToThis
        relTime = emptyToThis
      end
      local outputLine = string.format(formatOutput, reportInfo.src, reportInfo.name, timer, relTime, count)
      table.insert(lines, outputLine)
      totalCount = totalCount + reportInfo.count
    end
  end
  table.insert(lines, divider)
  table.insert(lines, [[


]])
  table.insert(lines, 2, "Total call count spent in profiled functions: " .. totalCount .. [[


]])
end

function Profiler:report()
  local lines = {}
  table.insert(lines, "Lua Profile output created by profiler.lua. author: myc ")
  table.insert(lines, [[


]])
  local total_time = self.end_time - self.start_time
  table.insert(lines, 1, "Total time spent in profiled functions: " .. string.format("%5.3g", total_time) .. [[
s

]])
  local terms = {}
  if self.variant == "time" then
  elseif self.variant == "call" then
    terms.capitalized = "Call"
    terms.single = "call"
    terms.pastverb = "called"
    local ordering = {}
    for func, record in pairs(self.caller_cache) do
      table.insert(ordering, func)
    end
    table.sort(ordering, function(a, b)
      return self.caller_cache[a].time > self.caller_cache[b].time
    end)
    self:format_header(ordering, lines, total_time)
    for i, v in ipairs(ordering) do
      local func = ordering[i]
      local record = self.caller_cache[func]
      if record.count and record.count > 0 then
        local thisfuncname = " " .. self:pretty_name(func) .. " "
        if string.len(thisfuncname) < 42 then
          thisfuncname = string.rep("-", (42 - string.len(thisfuncname)) / 2) .. thisfuncname
          thisfuncname = thisfuncname .. string.rep("-", 42 - string.len(thisfuncname))
        end
        local timeinself = record.time - (record.unknow_child_time + record.name_child_time)
        if timeinself < 0 then
          timeinself = 0
        end
        local children = record.unknow_child_time + record.name_child_time
        if children > record.time then
          children = record.time
        end
        timeinself = timeinself * scale
        table.insert(lines, string.rep("-", 19) .. thisfuncname .. string.rep("-", 19) .. "\n")
        table.insert(lines, terms.capitalized .. " count:         " .. string.format("%4d", record.count) .. "\n")
        table.insert(lines, "Time spend total:       " .. string.format("%4.4f", record.time * scale) .. "s\n")
        table.insert(lines, "Time spent in children: " .. string.format("%4.4f", children * scale) .. "s\n")
        table.insert(lines, "Time spent in self:     " .. string.format("%4.4f", timeinself) .. "s\n")
        local added_blank = 0
        for k, v in pairs(record.children) do
          if 0 == added_blank then
            table.insert(lines, "\n")
            added_blank = 1
          end
          table.insert(lines, "Child " .. self:pretty_name(k) .. string.rep(" ", 41 - string.len(self:pretty_name(k))) .. " " .. terms.pastverb .. " " .. string.format("%6d", v))
          table.insert(lines, " times. Took " .. string.format("%4.5f", record.children_time[k] * scale) .. "s\n")
        end
        table.insert(lines, "\n")
      end
    end
  end
  table.insert(lines, "END\n")
  return lines, total_time
end

function Profiler:dump_report_to_file(outfile)
  local outfile = io.open(outfile, "w+")
  local lines, total_time = self:report()
  for i, v in ipairs(lines) do
    outfile:write(v)
  end
  outfile:flush()
  outfile:close()
  return total_time
end

function Profiler:pretty_name(func, force)
  local info = self.caller_cache[func].func_info
  local name = ""
  if info.what == "Lua" and force then
    name = "L:" .. info.short_src .. ":" .. info.linedefined
    return name
  end
  if info.what == "Lua" then
    name = "L:"
  end
  if info.what == "C" then
    name = "C:"
  end
  if info.what == "main" then
    name = " :"
  end
  if info.name == nil then
    name = name .. "<" .. tostring(func) .. ">"
  else
    name = name .. info.name
  end
  if info.source then
    name = name .. "@" .. info.source
  elseif info.what == "C" then
    name = name .. "@?"
  else
    name = name .. "@<string>"
  end
  name = name .. ":"
  name = name .. info.linedefined
  return name
end

return newProfiler
