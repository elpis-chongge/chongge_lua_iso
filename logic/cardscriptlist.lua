local require = require
require("CardAttribute")
require("CardData")
require("CardMgr")
if IsBattleServer ~= true then
  require("CardService")
end
