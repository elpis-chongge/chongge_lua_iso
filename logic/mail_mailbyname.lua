require("CommonResource_BackGroundByName")
require("Mail_TipsByName")
require("Mail_NumberByName")
require("Mail_TitleByName")
require("Mail_ItemByName")
require("Mail_GetTipsByName")
require("CommonResource_CurrencyReturnByName")

function GetMail_MailUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Tips = GetMail_TipsUis(ui:GetChild("Tips"))
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.Number = GetMail_NumberUis(ui:GetChild("Number"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.Title = GetMail_TitleUis(ui:GetChild("Title"))
  uis.WordList = ui:GetChild("WordList")
  uis.Item = GetMail_ItemUis(ui:GetChild("Item"))
  uis.GetTips = GetMail_GetTipsUis(ui:GetChild("GetTips"))
  uis.DeleteBtn = ui:GetChild("DeleteBtn")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
