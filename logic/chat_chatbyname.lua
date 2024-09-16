require("Chat_FrameByName")
require("Chat_PlayerListAniByName")
require("Chat_EmojiChoiceByName")
require("CommonResource_CurrencyReturnByName")

function GetChat_ChatUis(ui)
  local uis = {}
  uis.Frame = GetChat_FrameUis(ui:GetChild("Frame"))
  uis.PlayerListAni = GetChat_PlayerListAniUis(ui:GetChild("PlayerListAni"))
  uis.EmojiChoice = GetChat_EmojiChoiceUis(ui:GetChild("EmojiChoice"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
