require("Message_CardPicByName")
require("Message_CardNameByName")
require("Message_CardAttributeByName")

function GetMessage_CardDetailsModularUis(ui)
  local uis = {}
  uis.CardPic = GetMessage_CardPicUis(ui:GetChild("CardPic"))
  uis.CardName = GetMessage_CardNameUis(ui:GetChild("CardName"))
  uis.CardAttribute = GetMessage_CardAttributeUis(ui:GetChild("CardAttribute"))
  uis.SkillList = ui:GetChild("SkillList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Popup_S_Black_Btn = ui:GetChild("Popup_S_Black_Btn")
  uis.Popup_S_Green_Btn = ui:GetChild("Popup_S_Green_Btn")
  uis.root = ui
  return uis
end
