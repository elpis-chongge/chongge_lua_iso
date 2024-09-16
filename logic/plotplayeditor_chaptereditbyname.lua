function GetPlotPlayEditor_ChapterEditUis(ui)
  local uis = {}
  
  uis.IdInputTxt = ui:GetChild("IdInputTxt")
  uis.RefreshBtn = ui:GetChild("RefreshBtn")
  uis.DelBtn = ui:GetChild("DelBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.TitleInputTxt = ui:GetChild("TitleInputTxt")
  uis.SectionIdsInputTxt = ui:GetChild("SectionIdsInputTxt")
  uis.SkipTipsInputTxt = ui:GetChild("SkipTipsInputTxt")
  uis.ChapterStartTitleTxt = ui:GetChild("ChapterStartTitleTxt")
  uis.ChapterStartSubtitleTxt = ui:GetChild("ChapterStartSubtitleTxt")
  uis.ChapterStartNameTitleTxt = ui:GetChild("ChapterStartNameTitleTxt")
  uis.ChapterStartNameSubtitleTxt = ui:GetChild("ChapterStartNameSubtitleTxt")
  uis.ChapterEndTitleTxt = ui:GetChild("ChapterEndTitleTxt")
  uis.ChapterEndSubtitleTxt = ui:GetChild("ChapterEndSubtitleTxt")
  uis.ChapterEndNameTitleTxt = ui:GetChild("ChapterEndNameTitleTxt")
  uis.ChapterEndNameSubtitleTxt = ui:GetChild("ChapterEndNameSubtitleTxt")
  uis.NextIdInputTxt = ui:GetChild("NextIdInputTxt")
  uis.UseStaticCardBtn = ui:GetChild("UseStaticCardBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
