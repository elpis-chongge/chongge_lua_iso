require("CommonResource_BackGroundByName")
require("Friend_TabRegionByName")
require("Friend_EmptyByName")
require("Friend_SearchByName")
require("CommonResource_CurrencyReturnByName")

function GetFriend_FriendUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TabRegion = GetFriend_TabRegionUis(ui:GetChild("TabRegion"))
  uis.FriendList = ui:GetChild("FriendList")
  uis.Empty = GetFriend_EmptyUis(ui:GetChild("Empty"))
  uis.DelNumberBtn = ui:GetChild("DelNumberBtn")
  uis.Search = GetFriend_SearchUis(ui:GetChild("Search"))
  uis.AgreeBtn = ui:GetChild("AgreeBtn")
  uis.RefuseBtn = ui:GetChild("RefuseBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
