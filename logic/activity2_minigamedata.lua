local miniGameInfo
local SetMiniGameInfo = function(info)
  miniGameInfo = info
end
local GetMiniGameInfo = function()
  return miniGameInfo
end
return {SetMiniGameInfo = SetMiniGameInfo, GetMiniGameInfo = GetMiniGameInfo}
