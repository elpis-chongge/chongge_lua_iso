PlotPlayEditorMgr = {}

function PlotPlayEditorMgr.SaveFile()
  PlotPlayEditorData.SaveCSV()
end

function PlotPlayEditorMgr.ShowError(title, content)
  CS.UnityEditor.EditorUtility.DisplayDialog(title, content, "确认")
end
