local LuaUpdateMgr = CS.LuaUpdateManager.Singleton
require("Handler")
local updateHandler = GetNewHandler()
local UpdateManager = {}

function UpdateManager.AddUpdateHandler(func, tableobj)
  updateHandler:AddHandle(1, func, tableobj)
end

function UpdateManager.RemoveUpdateHandler(func)
  updateHandler:RemoveHandle(1, func)
end

function UpdateManager.AddLateUpdateHandler(func, tableobj)
  updateHandler:AddHandle(2, func, tableobj)
end

function UpdateManager.RemoveLateUpdateHandler(func)
  updateHandler:RemoveHandle(2, func)
end

function UpdateManager.AddFixedUpdateHandler(func, tableobj)
  updateHandler:AddHandle(3, func, tableobj)
end

function UpdateManager.RemoveFixedUpdateHandler(func)
  updateHandler:RemoveHandle(3, func)
end

function UpdateManager.ClearAll()
  updateHandler.RemoveAllHandle(1)
  updateHandler.RemoveAllHandle(2)
  updateHandler.RemoveAllHandle(3)
end

local Update = function(data)
  updateHandler:RunId(1, data)
end
local LateUpdate = function(data)
  updateHandler:RunId(2, data)
end
local FixedUpdate = function(data)
  updateHandler:RunId(3, data)
end
LuaUpdateMgr:InitLua(Update, FixedUpdate, LateUpdate)
return UpdateManager
