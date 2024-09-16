local FunctionQueueUtil = {}
local funTb = {}
local start = false
local curFun
local Sort = function()
  if #funTb > 1 then
    table.sort(funTb, function(a, b)
      return a.weight < b.weight
    end)
  end
end
local Call = function()
  curFun = funTb[1]
  if curFun then
    if not curFun.play then
      curFun.isEnd = curFun.fun()
      curFun.play = true
    elseif curFun.listenCompleteFunc and curFun.listenCompleteFunc() then
      curFun.isEnd = true
    end
    if curFun.isEnd then
      table.remove(funTb, 1)
      if curFun.isHome then
        UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.SET_HOME_TOUCHABLE)
      end
      return
    end
  end
end

function FunctionQueueUtil.Add(name, fun, weight, isHome, listenCompleteFunc)
  if type(fun) == "function" and name then
    for i, v in pairs(funTb) do
      if v.name == name then
        v.fun = fun
        v.isEnd = false
        v.play = false
        v.weight = weight
        v.isHome = isHome
        v.listenCompleteFunc = listenCompleteFunc
        Sort()
        return
      end
    end
    local tb = {}
    tb.name = name
    tb.fun = fun
    tb.listenCompleteFunc = listenCompleteFunc
    tb.isEnd = false
    tb.play = false
    tb.isHome = isHome
    tb.weight = weight or #funTb + 1
    table.insert(funTb, tb)
    Sort()
  end
end

function FunctionQueueUtil.Remove(name)
  for i = #funTb, 1, -1 do
    if funTb[i].name == name then
      table.remove(funTb, i)
      break
    end
  end
end

function FunctionQueueUtil.SetFunEnd(name)
  for i, v in pairs(funTb) do
    if v.play and v.name == name then
      v.isEnd = true
      return
    end
  end
end

function FunctionQueueUtil.Update()
  if start then
    Call()
  end
end

function FunctionQueueUtil.CheckHomeIsEnd()
  for i, v in pairs(funTb) do
    if v.isHome then
      return false
    end
  end
  return true
end

function FunctionQueueUtil.Start()
  start = true
end

function FunctionQueueUtil.Stop()
  start = nil
end

return FunctionQueueUtil
