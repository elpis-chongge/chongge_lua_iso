RedDotMgr = {}

function RedDotMgr.Init()
end

function RedDotMgr.Clear()
end

function RedDotMgr.AddNode(param)
  RedDotData.AddNode(param)
end

function RedDotMgr.UpdateNode(dataType)
  RedDotData.UpdateNode(dataType)
end

function RedDotMgr.UpdateNodeByWindowName(windowName)
  RedDotData.UpdateNodeByWindowName(windowName)
end

function RedDotMgr.RemoveNode(windowName)
  RedDotData.RemoveNode(windowName)
end

function RedDotMgr.RemoveOneNode(windowName, com)
  RedDotData.RemoveOneNode(windowName, com)
end

function RedDotMgr.SetRedVisible(com, visible)
  local red = com:GetChild("Red")
  if red then
    red.visible = visible
  end
end
