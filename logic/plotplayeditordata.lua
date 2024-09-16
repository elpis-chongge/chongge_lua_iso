PlotPlayEditorData = {}
local partKeyList = {}
local partTypeList = {}
local partDesList = {}
local sectionKeyList = {}
local sectionTypeList = {}
local sectionDesList = {}
local dialogKeyList = {}
local dialogTypeList = {}
local dialogDesList = {}
local wordKeyList = {}
local wordTypeList = {}
local wordDesList = {}
local partFilePath = "Assets/Editor/StoryEditor/csv/base_plot_part.csv.txt"
local sectionFilePath = "Assets/Editor/StoryEditor/csv/base_plot_section.csv.txt"
local dialogFilePath = "Assets/Editor/StoryEditor/csv/base_plot_dialog.csv.txt"
local wordFilePath = "Assets/Editor/StoryEditor/csv/base_plot_word.csv.txt"

function PlotPlayEditorData.LoadCSV(filePath, keyList, typeList, desList)
  local data = CS.DialogMgr.LoadText(filePath)
  local lineStr = Split(data, "\r\n")
  local titles = Split(lineStr[1], ",")
  for i, v in ipairs(titles) do
    if table.contain(keyList, v) == false then
      table.insert(keyList, v)
    end
  end
  local types = Split(lineStr[2], ",")
  for i, v in ipairs(types) do
    if i <= #keyList then
      table.insert(typeList, v)
    end
  end
  local dess = Split(lineStr[3], ",")
  for i, v in ipairs(dess) do
    if table.contain(desList, v) == false then
      table.insert(desList, v)
    end
  end
  local ID = 1
  local arrs = {}
  for i = 4, #lineStr do
    if "" ~= lineStr[i] then
      local content = Split(lineStr[i], ",")
      arrs[ID] = {}
      for j = 1, #titles do
        arrs[ID][titles[j]] = content[j]
      end
      ID = ID + 1
    end
  end
  return arrs
end

function PlotPlayEditorData.TableToCsv(t, keys, types, dess)
  local str = table.concat(keys, ",") .. "\r\n"
  str = str .. table.concat(types, ",") .. "\r\n"
  str = str .. table.concat(dess, ",") .. "\r\n"
  for i, v in ipairs(t) do
    local line = {}
    for _, key in ipairs(keys) do
      table.insert(line, v[key] or "")
    end
    str = str .. table.concat(line, ",")
    if i < #t then
      str = str .. "\r\n"
    end
  end
  return str
end

function PlotPlayEditorData.SaveCSV()
  FileManager.WriteFile(partFilePath, PlotPlayEditorData.TableToCsv(PlotPlayEditorData.parts, partKeyList, partTypeList, partDesList), false)
  FileManager.WriteFile(sectionFilePath, PlotPlayEditorData.TableToCsv(PlotPlayEditorData.sections, sectionKeyList, sectionTypeList, sectionDesList), false)
  FileManager.WriteFile(dialogFilePath, PlotPlayEditorData.TableToCsv(PlotPlayEditorData.dialogs, dialogKeyList, dialogTypeList, dialogDesList), false)
  FileManager.WriteFile(wordFilePath, PlotPlayEditorData.TableToCsv(PlotPlayEditorData.words, wordKeyList, wordTypeList, wordDesList), false)
end

function PlotPlayEditorData.GetPlotInit()
  PlotPlayEditorData.parts = PlotPlayEditorData.LoadCSV(partFilePath, partKeyList, partTypeList, partDesList)
  PlotPlayEditorData.sections = PlotPlayEditorData.LoadCSV(sectionFilePath, sectionKeyList, sectionTypeList, sectionDesList)
  PlotPlayEditorData.dialogs = PlotPlayEditorData.LoadCSV(dialogFilePath, dialogKeyList, dialogTypeList, dialogDesList)
  PlotPlayEditorData.words = PlotPlayEditorData.LoadCSV(wordFilePath, wordKeyList, wordTypeList, wordDesList)
  print("剧情配置初始化完成")
end

function PlotPlayEditorData.GetCurPartDataList()
  local list = {}
  for i, v in ipairs(PlotPlayEditorData.parts) do
    table.insert(list, v)
  end
  return list
end

function PlotPlayEditorData.GetPartData(partId)
  for i, v in ipairs(PlotPlayEditorData.parts) do
    if v.id == partId then
      return v
    end
  end
end

function PlotPlayEditorData.GetCurSectionIds(partId)
  local section_ids
  for i, v in ipairs(PlotPlayEditorData.parts) do
    if v.id == partId then
      section_ids = v.section_ids
      break
    end
  end
  if nil == section_ids or "" == section_ids then
    return {}
  end
  section_ids = Split(section_ids, "|")
  return section_ids
end

function PlotPlayEditorData.GetSectionDataList(sectionIds)
  local list = {}
  local section
  for i, sectionId in ipairs(sectionIds) do
    section = PlotPlayEditorData.GetSectionData(sectionId)
    if section then
      table.insert(list, section)
    end
  end
  return list
end

function PlotPlayEditorData.GetSectionData(sectionId)
  for i, v in ipairs(PlotPlayEditorData.sections) do
    if v.id == sectionId then
      return v
    end
  end
end

function PlotPlayEditorData.GetCurDialogIds(sectionId)
  local dialog_ids
  for i, v in ipairs(PlotPlayEditorData.sections) do
    if v.id == sectionId then
      dialog_ids = v.dialog_ids
      break
    end
  end
  if nil == dialog_ids or "" == dialog_ids then
    return {}
  end
  dialog_ids = Split(dialog_ids, "|")
  return dialog_ids
end

function PlotPlayEditorData.GetDialogDataList(dialogIds)
  local list = {}
  local dialog
  for i, dialogId in ipairs(dialogIds) do
    dialog = PlotPlayEditorData.GetDialogData(dialogId)
    if dialog then
      table.insert(list, dialog)
    end
  end
  return list
end

function PlotPlayEditorData.GetDialogData(dialogId)
  for i, v in ipairs(PlotPlayEditorData.dialogs) do
    if v.id == dialogId then
      return v
    end
  end
end

function PlotPlayEditorData.GetWord(wordId)
  for i, v in ipairs(PlotPlayEditorData.words) do
    if v.id == wordId then
      return string.gsub(v.name_cn, "\\n", "\n")
    end
  end
end

function PlotPlayEditorData.GetPartSkipTipsId(partId)
  if nil == partId then
    return
  end
  return partId .. "1"
end

function PlotPlayEditorData.GetPartStartTitleId(partId)
  if nil == partId then
    return
  end
  return partId .. "21"
end

function PlotPlayEditorData.GetPartStartSubtitleId(partId)
  if nil == partId then
    return
  end
  return partId .. "22"
end

function PlotPlayEditorData.GetPartStartNameTitleId(partId)
  if nil == partId then
    return
  end
  return partId .. "23"
end

function PlotPlayEditorData.GetPartStartNameSubtitleId(partId)
  if nil == partId then
    return
  end
  return partId .. "24"
end

function PlotPlayEditorData.GetPartEndTitleId(partId)
  if nil == partId then
    return
  end
  return partId .. "31"
end

function PlotPlayEditorData.GetPartEndSubtitleId(partId)
  if nil == partId then
    return
  end
  return partId .. "32"
end

function PlotPlayEditorData.GetPartEndNameTitleId(partId)
  if nil == partId then
    return
  end
  return partId .. "33"
end

function PlotPlayEditorData.GetPartEndNameSubtitleId(partId)
  if nil == partId then
    return
  end
  return partId .. "34"
end

function PlotPlayEditorData.GetTalkWordId(dialogId)
  return dialogId .. "0"
end

function PlotPlayEditorData.GetExplainWordId(dialogId)
  return dialogId .. "1"
end

function PlotPlayEditorData.GetNarratorWordId(dialogId)
  return dialogId .. "2"
end

function PlotPlayEditorData.GetMiddleWordId(dialogId)
  return dialogId .. "3"
end

function PlotPlayEditorData.GetOptionWordId(dialogId)
  return dialogId .. "4"
end

function PlotPlayEditorData.GetSpeakNameWordId(dialogId)
  return dialogId .. "5"
end

function PlotPlayEditorData.GetExplainNameWordId(dialogId)
  return dialogId .. "6"
end

function PlotPlayEditorData.GetCGWordId(dialogId)
  return dialogId .. "7"
end

function PlotPlayEditorData.GetOpenTitle1WordId(dialogId)
  return dialogId .. "8"
end

function PlotPlayEditorData.GetOpenTitle2WordId(dialogId)
  return dialogId .. "9"
end

function PlotPlayEditorData.AddOrUpdatePart(data)
  local isFind = false
  for i, v in ipairs(PlotPlayEditorData.parts) do
    if v.id == data.id then
      PlotPlayEditorData.parts[i] = data
      isFind = true
      break
    end
  end
  if false == isFind then
    table.insert(PlotPlayEditorData.parts, data)
  end
  local ids = Split(data.section_ids, "|")
  for i, id in ipairs(ids) do
    if PlotPlayEditorData.GetSectionData(id) == nil then
      PlotPlayEditorData.AddOrUpdateSection({id = id})
    end
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE)
end

function PlotPlayEditorData.DeletePart(partId)
  for i, v in ipairs(PlotPlayEditorData.parts) do
    if v.id == partId then
      local sectionIds = Split(v.section_ids, "|")
      for _, sectionId in ipairs(sectionIds) do
        PlotPlayEditorData.DeleteSection(sectionId)
      end
      table.remove(PlotPlayEditorData.parts, i)
      break
    end
  end
  PlotPlayEditorData.DeleteWord(partId)
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartSkipTipsId(partId))
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartStartTitleId(partId))
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartStartSubtitleId(partId))
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartStartNameTitleId(partId))
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartStartNameSubtitleId(partId))
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartEndTitleId(partId))
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartEndSubtitleId(partId))
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartEndNameTitleId(partId))
  PlotPlayEditorData.DeleteWord(PlotPlayEditorData.GetPartEndNameSubtitleId(partId))
  UIMgr:SendBroadcastMessage(WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE)
end

function PlotPlayEditorData.AddOrUpdateSection(data)
  local isFind = false
  for i, v in pairs(data) do
    data[i] = tostring(v)
  end
  for i, v in ipairs(PlotPlayEditorData.sections) do
    if v.id == data.id then
      PlotPlayEditorData.sections[i] = data
      isFind = true
      break
    end
  end
  if false == isFind then
    table.insert(PlotPlayEditorData.sections, data)
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE)
end

function PlotPlayEditorData.DeleteSection(sectionId)
  for i, v in ipairs(PlotPlayEditorData.sections) do
    if v.id == sectionId then
      local dialogIds = Split(v.dialog_ids, "|")
      for _, dialogId in ipairs(dialogIds) do
        PlotPlayEditorData.DeleteDialog(dialogId)
      end
      table.remove(PlotPlayEditorData.sections, i)
      break
    end
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE)
end

function PlotPlayEditorData.GetAvailableSectionId(partId)
  local tempId
  local baseId = partId * 100
  for i = 1, 99 do
    tempId = tostring(math.floor(baseId + i))
    if PlotPlayEditorData.GetSectionData(tempId) == nil then
      return tempId
    end
  end
  PlotPlayEditorMgr.ShowError("错误", "没有找到可以用的sectionId")
  return nil
end

function PlotPlayEditorData.AddOrUpdateDialog(data)
  local isFind = false
  for i, v in ipairs(PlotPlayEditorData.dialogs) do
    if v.id == data.id then
      PlotPlayEditorData.dialogs[i] = data
      isFind = true
      break
    end
  end
  if false == isFind then
    table.insert(PlotPlayEditorData.dialogs, data)
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE)
end

function PlotPlayEditorData.DeleteDialog(dialogId)
  local actionTimeline
  for i, v in ipairs(PlotPlayEditorData.dialogs) do
    if v.id == dialogId then
      actionTimeline = v.action_timeline
      table.remove(PlotPlayEditorData.dialogs, i)
      break
    end
  end
  local id1 = PlotPlayEditorData.GetTalkWordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetExplainWordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetNarratorWordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetMiddleWordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetOptionWordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetSpeakNameWordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetExplainNameWordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetCGWordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetOpenTitle1WordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  id1 = PlotPlayEditorData.GetOpenTitle2WordId(dialogId)
  PlotPlayEditorData.DeleteWord(id1)
  PlotPlayEditorData.DeleteWord(dialogId)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE)
  if actionTimeline and "" ~= actionTimeline then
    local paths = Split(actionTimeline, "|")
    for i, v in ipairs(paths) do
      CS.DialogTimeline.DelTimelineFile(v)
    end
  end
end

function PlotPlayEditorData.GetAvailableDialogId(sectionId)
  local tempId
  local baseId = sectionId * 1000
  for i = 1, 999 do
    tempId = tostring(math.floor(baseId + i))
    if PlotPlayEditorData.GetDialogData(tempId) == nil then
      return tempId
    end
  end
  PlotPlayEditorMgr.ShowError("错误", "没有找到可以用的dialogId")
  return nil
end

function PlotPlayEditorData.AddOrUpdateWord(data)
  local isFind = false
  data.name_cn = string.gsub(data.name_cn, "\r\n", "\n")
  data.name_cn = string.gsub(data.name_cn, "\n", "\\n")
  for i, v in ipairs(PlotPlayEditorData.words) do
    if v.id == data.id then
      PlotPlayEditorData.words[i].name_cn = data.name_cn
      isFind = true
      break
    end
  end
  if false == isFind then
    table.insert(PlotPlayEditorData.words, data)
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE)
end

function PlotPlayEditorData.DeleteWord(wordId)
  for i, v in ipairs(PlotPlayEditorData.words) do
    if v.id == wordId then
      table.remove(PlotPlayEditorData.words, i)
      break
    end
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE)
end

function PlotPlayEditorData.GetLocalBg(path)
  return ListToTable(LuaUtil.GetFilesPath(path, "*.png"))
end

function PlotPlayEditorData.GetLocalCard(path)
  return ListToTable(LuaUtil.GetFilesPath(path, "*.prefab"))
end
