local require = require
require("ActorMgr")
require("ActorData")
if IsBattleServer ~= true then
  require("ActorService")
end
