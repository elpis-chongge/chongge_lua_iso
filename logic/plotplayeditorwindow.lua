require("PlotPlayEditor_PlotPlayEditorWindowByName")
local SELECT_RES_TYPE = {
  BACKGROUND = 1,
  CARD = 2,
  HEAD = 3
}
local PlotPlayEditorWindow = {}
local uis, contentPane, selectPartId, selectSectionId, selectDialogId
local tempParts = {}
local tempSections = {}
local tempDialogs = {}
local ChapterList, SectionList, DialogList, AddChapterBtn, AddSectionBtn, AddDialogBtn, DelDialogBtn, CopyDialogBtn, curDialogEditIndex
local cachedModel = {}

function PlotPlayEditorWindow.ReInitData()
end

local useStaticCard = false

function PlotPlayEditorWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.PlotPlayEditorWindow.package, WinResConfig.PlotPlayEditorWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    ld("PlotPlay")
    ld("PlotPlayEditor", function()
      PlotPlayEditorData.GetPlotInit()
    end)
    uis = GetPlotPlayEditor_PlotPlayEditorWindowUis(contentPane)
    uis.Main.root:SetSize(contentPane.width, contentPane.height)
    ChapterList = uis.Main.ChapterArea.ChapterList
    ChapterList:SetVirtual()
    ChapterList.itemRenderer = PlotPlayEditorWindow.RenderPart
    SectionList = uis.Main.SectionArea.SectionList
    SectionList:SetVirtual()
    SectionList.itemRenderer = PlotPlayEditorWindow.RenderSection
    DialogList = uis.Main.DialogArea.DialogList
    DialogList:SetVirtual()
    DialogList.itemRenderer = PlotPlayEditorWindow.RenderDialog
    AddChapterBtn = uis.Main.ChapterArea.AddChapterBtn
    AddSectionBtn = uis.Main.SectionArea.AddSectionBtn
    AddDialogBtn = uis.Main.DialogArea.AddDialogBtn
    DelDialogBtn = uis.Main.DialogArea.DelDialogBtn
    CopyDialogBtn = uis.Main.DialogArea.CopyDialogBtn
    PlotPlayEditorWindow.UpdateInfo()
    PlotPlayEditorWindow.InitBtn()
    PlotPlayEditorWindow.InitDialogEdit()
  end)
end

function PlotPlayEditorWindow.UpdateInfo()
  PlotPlayEditorWindow.UpdatePartList()
  PlotPlayEditorWindow.UpdateSectionList()
  PlotPlayEditorWindow.UpdateDialogList()
  PlotPlayEditorWindow.UpdateEditComp()
end

function PlotPlayEditorWindow.UpdatePartList()
  tempParts = PlotPlayEditorData.GetCurPartDataList()
  ChapterList.numItems = #tempParts
  AddChapterBtn.onClick:Set(function()
    PlotPlayEditorWindow.PopPartEdit()
  end)
end

function PlotPlayEditorWindow.UpdateSectionList()
  if selectPartId then
    AddSectionBtn.touchable = true
    local sectionIds = PlotPlayEditorData.GetCurSectionIds(selectPartId)
    tempSections = PlotPlayEditorData.GetSectionDataList(sectionIds)
    SectionList.numItems = #sectionIds
    AddSectionBtn.onClick:Set(function()
      local id = PlotPlayEditorData.GetAvailableSectionId(selectPartId)
      local selectPartData = PlotPlayEditorData.GetPartData(selectPartId)
      if selectPartData then
        if selectPartData.section_ids ~= "" then
          selectPartData.section_ids = selectPartData.section_ids .. "|" .. id
        else
          selectPartData.section_ids = id
        end
      end
      PlotPlayEditorData.AddOrUpdateSection(GetSectionStruct({id = id}))
      PlotPlayEditorWindow.CloseSectionEdit()
    end)
  else
    AddSectionBtn.touchable = false
  end
end

function PlotPlayEditorWindow.UpdateDialogList()
  if selectSectionId then
    local dialogIds = PlotPlayEditorData.GetCurDialogIds(selectSectionId)
    tempDialogs = PlotPlayEditorData.GetDialogDataList(dialogIds)
    DialogList.numItems = #dialogIds
    AddDialogBtn.touchable = true
    DelDialogBtn.touchable = true
    CopyDialogBtn.touchable = true
    AddDialogBtn.onClick:Set(function()
      local id = PlotPlayEditorData.GetAvailableDialogId(selectSectionId)
      if id then
        local section = PlotPlayEditorData.GetSectionData(selectSectionId)
        if section then
          local dialog_ids = section.dialog_ids
          if "" == dialog_ids then
            section.dialog_ids = id
          else
            section.dialog_ids = dialog_ids .. "|" .. id
          end
        end
        PlotPlayEditorData.AddOrUpdateDialog({id = id})
      end
    end)
    CopyDialogBtn.onClick:Set(function()
      if nil == selectDialogId then
        return
      end
      local id = PlotPlayEditorData.GetAvailableDialogId(selectSectionId)
      if id then
        local selectDialog = PlotPlayEditorData.GetDialogData(selectDialogId)
        local copySelectDialog = {}
        copySelectDialog.id = id
        local section = PlotPlayEditorData.GetSectionData(selectSectionId)
        if section then
          local dialog_ids = section.dialog_ids
          if "" == dialog_ids then
            section.dialog_ids = id
          else
            section.dialog_ids = dialog_ids .. "|" .. id
          end
        end
        copySelectDialog.role_ids = selectDialog.role_ids
        copySelectDialog.role_position = selectDialog.role_position
        copySelectDialog.skin = selectDialog.skin
        PlotPlayEditorData.AddOrUpdateDialog(copySelectDialog)
      end
    end)
    DelDialogBtn.onClick:Set(function()
      if nil == selectDialogId then
        return
      end
      local id = PlotPlayEditorData.GetAvailableDialogId(selectSectionId)
      if id then
        local section = PlotPlayEditorData.GetSectionData(selectSectionId)
        if section then
          local dialog_ids = Split(section.dialog_ids, "|")
          for i, v in ipairs(dialog_ids) do
            if v == selectDialogId then
              table.remove(dialog_ids, i)
            end
          end
          section.dialog_ids = table.concat(dialog_ids, "|")
          PlotPlayEditorData.AddOrUpdateSection(section)
        end
        PlotPlayEditorData.DeleteDialog(selectDialogId)
      end
    end)
  else
    AddDialogBtn.touchable = false
    DelDialogBtn.touchable = false
    CopyDialogBtn.touchable = false
    DialogList.numItems = 0
  end
  PlotPlayEditorWindow.UpdateDialogEdit()
end

function PlotPlayEditorWindow.RenderPart(index, item)
  local partData = tempParts[index + 1]
  item:GetChild("title").text = partData.id
  item.onClick:Set(function(context)
    if context.inputEvent.isDoubleClick then
      UIMgr:HideWindow(WinResConfig.PlotPlayEditorWindow.name)
      PlotPlayMgr.PlayPlot(tonumber(partData.id), nil, nil, nil, true)
      return
    end
    if item.selected == false then
      ChapterList.selectedIndex = index
      useStaticCard = partData.use_static == "1"
      selectPartId = partData.id
      selectSectionId = nil
      selectDialogId = nil
      SectionList.selectedIndex = -1
      DialogList.selectedIndex = -1
      PlotPlayEditorWindow.UpdateSectionList()
      PlotPlayEditorWindow.UpdateDialogList()
      PlotPlayEditorWindow.UpdateSelectList()
    end
  end)
  item.onRightClick:Set(function()
    PlotPlayEditorWindow.PopPartEdit(partData.id)
  end)
end

function PlotPlayEditorWindow.RenderSection(index, item)
  local sectionData = tempSections[index + 1]
  item:GetChild("IdTxt").text = sectionData.id
  local indexCBox = item:GetChild("IndexCBox")
  local items = {}
  local values = {}
  for i, v in ipairs(tempSections) do
    table.insert(items, i)
    table.insert(values, i)
  end
  indexCBox.items = items
  indexCBox.values = values
  indexCBox.value = index + 1
  indexCBox.onChanged:Set(function()
    if tonumber(indexCBox.value) ~= index + 1 then
      local part = PlotPlayEditorData.GetPartData(selectPartId)
      local ids = Split(part.section_ids, "|")
      table.remove(ids, index + 1)
      table.insert(ids, tonumber(indexCBox.value), sectionData.id)
      part.section_ids = table.concat(ids, "|")
      PlotPlayEditorData.AddOrUpdatePart(part)
    end
  end)
  local skipBtn = item:GetChild("SkipBtn")
  if sectionData.skip == "1" then
    skipBtn.selected = true
  else
    skipBtn.selected = false
  end
  skipBtn.onClick:Set(function()
    local section = PlotPlayEditorData.GetSectionData(sectionData.id)
    section.skip = skipBtn.selected and "1" or "0"
    PlotPlayEditorData.AddOrUpdateSection(section)
  end)
  local skipStopBtn = item:GetChild("SkipStopBtn")
  if sectionData.skip_stop == "1" then
    skipStopBtn.selected = true
  else
    skipStopBtn.selected = false
  end
  skipStopBtn.onClick:Set(function()
    local section = PlotPlayEditorData.GetSectionData(sectionData.id)
    section.skip_stop = skipStopBtn.selected and "1" or "0"
    PlotPlayEditorData.AddOrUpdateSection(section)
  end)
  local effectInCBox = item:GetChild("EffectInCBox")
  items = {}
  values = {}
  for _, v in pairs(PLOT_BG_IN_EFFECT) do
    table.insert(items, v[1])
    table.insert(values, v[2])
  end
  effectInCBox.items = items
  effectInCBox.values = values
  effectInCBox.value = sectionData.bg_effect_in ~= "" and sectionData.bg_effect_in or PLOT_BG_IN_EFFECT.NONE[2]
  effectInCBox.onChanged:Set(function()
    local section = PlotPlayEditorData.GetSectionData(sectionData.id)
    if section.bg_effect_in ~= effectInCBox.value then
      section.bg_effect_in = effectInCBox.value
      PlotPlayEditorData.AddOrUpdateSection(section)
    end
  end)
  local in_inputText = item:GetChild("InParamText")
  in_inputText.text = sectionData.bg_effect_in_param
  in_inputText.onFocusOut:Set(function()
    local section = PlotPlayEditorData.GetSectionData(sectionData.id)
    if in_inputText.text ~= section.bg_effect_in_param then
      section.bg_effect_in_param = in_inputText.text
      PlotPlayEditorData.AddOrUpdateSection(section)
    end
  end)
  local effectOutCBox = item:GetChild("EffectOutCBox")
  items = {}
  values = {}
  for i, v in pairs(PLOT_BG_OUT_EFFECT) do
    table.insert(items, v[1])
    table.insert(values, v[2])
  end
  effectOutCBox.items = items
  effectOutCBox.values = values
  effectOutCBox.value = "" ~= sectionData.bg_effect_out and sectionData.bg_effect_out or PLOT_BG_OUT_EFFECT.NONE[2]
  effectOutCBox.onChanged:Set(function()
    local section = PlotPlayEditorData.GetSectionData(sectionData.id)
    if effectOutCBox.value ~= section.bg_effect_out then
      section.bg_effect_out = effectOutCBox.value
      PlotPlayEditorData.AddOrUpdateSection(section)
    end
  end)
  local out_inputText = item:GetChild("OutParamText")
  out_inputText.text = sectionData.bg_effect_out_param
  out_inputText.onFocusOut:Set(function()
    local section = PlotPlayEditorData.GetSectionData(sectionData.id)
    if out_inputText.text ~= section.bg_effect_out_param then
      section.bg_effect_out_param = out_inputText.text
      PlotPlayEditorData.AddOrUpdateSection(section)
    end
  end)
  local loader = item:GetChild("BgLoader")
  RTManager:ReleaseModelFromLoader(loader)
  loader.texture = nil
  if sectionData.bg_id and "" ~= sectionData.bg_id then
    local config = TableData.GetConfig(tonumber(sectionData.bg_id), "BasePlotPlayBG")
    if config.path then
      local texture = ResourceManager.LoadTexture(RES_PATH_PREFIX.SINGLE_TEXTURE .. config.path)
      UIUtil.SetLoaderTexture(loader, texture)
    elseif config.cg_path then
      local path = RES_PATH_PREFIX.PLOT_CG .. config.cg_path
      local cg = ResourceManager.Instantiate(path)
      RTManager:ShowModelToLoader(loader, cg)
      LuaUtil.SetLocalPos(cg, 0, 0, 0)
    end
  end
  loader.onClick:Set(function()
    PlotPlayEditorWindow.UpdateSelectList(SELECT_RES_TYPE.BACKGROUND)
  end)
  ChangeUIController(item, "c1", 0)
  item.onClick:Set(function(context)
    if context.inputEvent.isDoubleClick then
      PlotPlayMgr.PlayPlot(tonumber(selectPartId), tonumber(sectionData.id), nil, nil, true)
      return
    end
    if item.selected == false then
      SectionList.selectedIndex = index
      selectSectionId = sectionData.id
      selectDialogId = nil
      PlotPlayEditorWindow.UpdateDialogList()
      DialogList.selectedIndex = -1
      PlotPlayEditorWindow.UpdateSelectList()
    end
  end)
  item.onRightClick:Set(function()
    PlotPlayEditorWindow.PopSectionEdit(sectionData.id)
  end)
end

function PlotPlayEditorWindow.RenderDialog(index, item)
  local dialogData = tempDialogs[index + 1]
  if dialogData then
    item.onClick:Set(function(context)
      if context.inputEvent.isDoubleClick then
        PlotPlayMgr.PlayPlot(tonumber(selectPartId), tonumber(selectSectionId), tonumber(dialogData.id), nil, true)
        return
      end
      if item.selected == false then
        DialogList.selectedIndex = index
        selectDialogId = dialogData.id
        PlotPlayEditorWindow.UpdateDialogEdit()
        PlotPlayEditorWindow.UpdateSelectList()
      end
    end)
    local indexCBox = item:GetChild("IndexCBox")
    local items = {}
    local values = {}
    for i, v in ipairs(tempDialogs) do
      table.insert(items, i)
      table.insert(values, i)
    end
    indexCBox.items = items
    indexCBox.values = values
    indexCBox.value = index + 1
    indexCBox.onChanged:Set(function()
      if tonumber(indexCBox.value) ~= index + 1 then
        local section = PlotPlayEditorData.GetSectionData(selectSectionId)
        local ids = Split(section.dialog_ids, "|")
        table.remove(ids, index + 1)
        table.insert(ids, tonumber(indexCBox.value), dialogData.id)
        section.dialog_ids = table.concat(ids, "|")
        PlotPlayEditorData.AddOrUpdateSection(section)
      end
    end)
    local nextCBox = item:GetChild("NextCBox")
    local nextDialogId = dialogData.next_dialog
    items = {"无"}
    values = {""}
    for i, v in ipairs(tempDialogs) do
      table.insert(items, v.id)
      table.insert(values, v.id)
    end
    nextCBox.items = items
    nextCBox.values = values
    nextCBox.value = nextDialogId
    nextCBox.onChanged:Set(function()
      if tonumber(nextCBox.value) ~= tonumber(nextDialogId) then
        dialogData.next_dialog = nextCBox.value
        PlotPlayEditorData.AddOrUpdateDialog(dialogData)
      end
    end)
    ChangeUIController(item, "c1", 0)
    local idTxt = item:GetChild("IdTxt")
    idTxt.text = dialogData.id
    local wordTxt = item:GetChild("WordTxt")
    wordTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetTalkWordId(dialogData.id)) or PlotPlayEditorData.GetWord(PlotPlayEditorData.GetNarratorWordId(dialogData.id)) or PlotPlayEditorData.GetWord(PlotPlayEditorData.GetMiddleWordId(dialogData.id)) or PlotPlayEditorData.GetWord(PlotPlayEditorData.GetOptionWordId(dialogData.id)) or ""
  end
end

local popPartEdit

function PlotPlayEditorWindow.PopPartEdit(partId)
  popPartEdit = UIMgr:CreateObject("PlotPlayEditor", "ChapterEdit")
  contentPane:AddChild(popPartEdit)
  popPartEdit.size = contentPane.size
  popPartEdit:Center()
  popPartEdit:GetChild("CloseBtn").onClick:Add(PlotPlayEditorWindow.ClosePartEdit)
  popPartEdit.draggable = true
  ChangeUIController(popPartEdit, "c1", 0)
  require("PlotPlayEditor_ChapterEditByName")
  local editUis = GetPlotPlayEditor_ChapterEditUis(popPartEdit)
  local titleList = {
    {
      name = "start_title",
      txt = editUis.ChapterStartTitleTxt,
      id = PlotPlayEditorData.GetPartStartTitleId(partId)
    },
    {
      name = "start_subtitle",
      txt = editUis.ChapterStartSubtitleTxt,
      id = PlotPlayEditorData.GetPartStartSubtitleId(partId)
    },
    {
      name = "start_name_title",
      txt = editUis.ChapterStartNameTitleTxt,
      id = PlotPlayEditorData.GetPartStartNameTitleId(partId)
    },
    {
      name = "start_name_subtitle",
      txt = editUis.ChapterStartNameSubtitleTxt,
      id = PlotPlayEditorData.GetPartStartNameSubtitleId(partId)
    },
    {
      name = "end_title",
      txt = editUis.ChapterEndTitleTxt,
      id = PlotPlayEditorData.GetPartEndTitleId(partId)
    },
    {
      name = "end_subtitle",
      txt = editUis.ChapterEndSubtitleTxt,
      id = PlotPlayEditorData.GetPartEndSubtitleId(partId)
    },
    {
      name = "end_name_title",
      txt = editUis.ChapterEndNameTitleTxt,
      id = PlotPlayEditorData.GetPartEndNameTitleId(partId)
    },
    {
      name = "end_name_subtitle",
      txt = editUis.ChapterEndNameSubtitleTxt,
      id = PlotPlayEditorData.GetPartEndNameSubtitleId(partId)
    }
  }
  local partData = PlotPlayEditorData.GetPartData(partId)
  editUis.IdInputTxt.text = partId
  editUis.TitleInputTxt.text = PlotPlayEditorData.GetWord(partId)
  if partData then
    editUis.NextIdInputTxt.text = partData.next_part
    editUis.SectionIdsInputTxt.text = partData.section_ids
  end
  editUis.SkipTipsInputTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetPartSkipTipsId(partId))
  for i, v in ipairs(titleList) do
    v.txt.text = PlotPlayEditorData.GetWord(v.id)
  end
  local useStaticBtn = editUis.UseStaticCardBtn
  if useStaticBtn then
    if partData and partData.use_static == "1" then
      useStaticBtn.selected = true
    else
      useStaticBtn.selected = false
    end
  end
  local delBtn = editUis.DelBtn
  delBtn.onClick:Set(function()
    PlotPlayEditorData.DeletePart(partId)
    PlotPlayEditorWindow.ClosePartEdit()
  end)
  local refreshBtn = editUis.RefreshBtn
  refreshBtn.onClick:Set(function()
    local id = editUis.IdInputTxt.text
    local next_part = editUis.NextIdInputTxt.text
    if "" == id or string.len(id) < 4 then
      PlotPlayEditorMgr.ShowError("错误", "id 不符合条件")
      return
    end
    local title = editUis.TitleInputTxt.text
    if "" ~= string.gsub(title, " ", "") then
      PlotPlayEditorData.AddOrUpdateWord({id = id, name_cn = title})
      title = string.format("T_S(%s)", id)
    end
    local skipTips = editUis.SkipTipsInputTxt.text
    if "" ~= string.gsub(skipTips, " ", "") then
      local tipsId = PlotPlayEditorData.GetPartSkipTipsId(id)
      PlotPlayEditorData.AddOrUpdateWord({id = tipsId, name_cn = skipTips})
      skipTips = string.format("T_S(%s)", tipsId)
    end
    local part = GetPartStruct({
      id = id,
      next_part = next_part,
      section_ids = editUis.SectionIdsInputTxt.text,
      title = title,
      skip_tips = skipTips,
      use_static = useStaticBtn.selected and "1" or "0"
    })
    for i, v in ipairs(titleList) do
      local text = v.txt.text
      if "" ~= string.gsub(text, " ", "") then
        local textId = v.id
        PlotPlayEditorData.AddOrUpdateWord({id = textId, name_cn = text})
        part[v.name] = string.format("T_S(%s)", textId)
      end
    end
    PlotPlayEditorData.AddOrUpdatePart(part)
    PlotPlayEditorWindow.ClosePartEdit()
  end)
end

function PlotPlayEditorWindow.ClosePartEdit()
  if popPartEdit then
    popPartEdit:Dispose()
  end
end

local popSectionEdit

function PlotPlayEditorWindow.PopSectionEdit(sectionId)
  popSectionEdit = UIMgr:CreateObject("PlotPlayEditor", "SectionEdit")
  contentPane:AddChild(popSectionEdit)
  popSectionEdit.size = contentPane.size
  popSectionEdit:Center()
  popSectionEdit:GetChild("CloseBtn").onClick:Add(PlotPlayEditorWindow.CloseSectionEdit)
  popSectionEdit.draggable = true
  local addBtn = popSectionEdit:GetChild("AddBtn")
  if sectionId then
    ChangeUIController(popSectionEdit, "c1", 0)
    local sectionData = PlotPlayEditorData.GetSectionData(sectionId)
    popSectionEdit:GetChild("IdInputTxt").text = sectionId
    popSectionEdit:GetChild("DialogIdsInputTxt").text = sectionData.dialog_ids
    local delBtn = popSectionEdit:GetChild("DelBtn")
    delBtn.onClick:Set(function()
      local part = PlotPlayEditorData.GetPartData(selectPartId)
      local section_ids = part.section_ids
      section_ids = Split(section_ids, "|")
      for i, v in ipairs(section_ids) do
        if v == sectionId then
          table.remove(section_ids, i)
          break
        end
      end
      part.section_ids = table.concat(section_ids, "|")
      PlotPlayEditorData.DeleteSection(sectionId)
      PlotPlayEditorWindow.CloseSectionEdit()
    end)
  else
    ChangeUIController(popSectionEdit, "c1", 1)
    popSectionEdit:GetChild("IdInputTxt").text = PlotPlayEditorData.GetAvailableSectionId(selectPartId)
  end
  addBtn.onClick:Set(function()
    local id = popSectionEdit:GetChild("IdInputTxt").text
    if "" == id or string.len(id) < 6 or not string.find(id, selectPartId) then
      PlotPlayEditorMgr.ShowError("错误", "id 不符合条件")
      return
    end
    if not sectionId then
      local selectPartData = PlotPlayEditorData.GetPartData(selectPartId)
      if selectPartData then
        if "" ~= selectPartData.section_ids then
          selectPartData.section_ids = selectPartData.section_ids .. "|" .. id
        else
          selectPartData.section_ids = id
        end
      end
    end
    PlotPlayEditorData.AddOrUpdateSection(GetSectionStruct({
      id = popSectionEdit:GetChild("IdInputTxt").text,
      dialog_ids = popSectionEdit:GetChild("DialogIdsInputTxt").text
    }))
    PlotPlayEditorWindow.CloseSectionEdit()
  end)
end

function PlotPlayEditorWindow.CloseSectionEdit()
  if popSectionEdit then
    popSectionEdit:Dispose()
  end
end

function PlotPlayEditorWindow.UpdateSelectList(type, cardIndex)
  local list = uis.Main.ResourceChoose.SelectArea.SelectList
  list:RemoveChildrenToPool()
  if nil == type then
    list:ClearPool()
  end
  list.selectedIndex = -1
  uis.Main.ResourceChoose.c2Ctr.selectedIndex = 0
  if type == SELECT_RES_TYPE.BACKGROUND then
    uis.Main.ResourceChoose.c2Ctr.selectedIndex = 1
    uis.Main.ResourceChoose.c1Ctr.selectedIndex = 0
    local btn1 = uis.Main.ResourceChoose.Ratio1Btn
    PlotPlayEditorWindow.ShowBgList(true)
    btn1.onClick:Set(function()
      list:RemoveChildrenToPool()
      list.selectedIndex = -1
      PlotPlayEditorWindow.ShowBgList(true)
    end)
    local btn2 = uis.Main.ResourceChoose.Ratio2Btn
    btn2.onClick:Set(function()
      list:RemoveChildrenToPool()
      list.selectedIndex = -1
      PlotPlayEditorWindow.ShowBgList(false)
    end)
  elseif type == SELECT_RES_TYPE.CARD then
    local cardConfig = TableData.GetTable("BasePlotRole")
    local sortTable = {}
    for _, v in pairs(cardConfig) do
      if useStaticCard and v.texture_path or false == useStaticCard and v.spine_path then
        table.insert(sortTable, v)
      end
    end
    table.sort(sortTable, function(a, b)
      return a.id < b.id
    end)
    for i, v in ipairs(sortTable) do
      PlotPlayEditorWindow.CreateCardInList(i, v, cardIndex)
    end
  elseif type == SELECT_RES_TYPE.HEAD then
    local headConfig = TableData.GetTable("BasePlotHead")
    local sortTable = {}
    for _, v in pairs(headConfig) do
      if useStaticCard and v.texture_path or false == useStaticCard and v.spine_path then
        table.insert(sortTable, v)
      end
    end
    table.sort(sortTable, function(a, b)
      return a.id < b.id
    end)
    for i, v in ipairs(sortTable) do
      PlotPlayEditorWindow.CreateHeadInList(i, v)
    end
  end
end

function PlotPlayEditorWindow.ShowBgList(isTexture)
  if isTexture then
    local config = TableData.GetTable("BasePlotPlayBG")
    local sortTable = {}
    for i, v in pairs(config) do
      if v.path then
        table.insert(sortTable, v)
      end
    end
    table.sort(sortTable, function(a, b)
      return a.id < b.id
    end)
    for i, v in ipairs(sortTable) do
      PlotPlayEditorWindow.CreateBgInList(i, v, true)
    end
  else
    local config = TableData.GetTable("BasePlotPlayBG")
    local sortTable = {}
    for i, v in pairs(config) do
      if v.cg_path then
        table.insert(sortTable, v)
      end
    end
    table.sort(sortTable, function(a, b)
      return a.id < b.id
    end)
    for i, v in ipairs(sortTable) do
      PlotPlayEditorWindow.CreateBgInList(i, v, false)
    end
  end
end

function PlotPlayEditorWindow.CreateBgInList(index, config, isTexture)
  local list = uis.Main.ResourceChoose.SelectArea.SelectList
  local hand = list:AddItemFromPool(UIUtil.GetResUrl("PlotPlayEditor:SelectBtnInList"))
  PlotPlayEditorWindow.ClearSelectBtn(hand)
  if isTexture then
    local path = RES_PATH_PREFIX.SINGLE_TEXTURE .. config.path
    local texture = ResourceManager.LoadTexture(path)
    UIUtil.SetLoaderTexture(hand:GetChild("BgLoader"), texture)
    hand:GetChild("NameTxt").text = config.id
    hand.onClick:Set(function()
      list.selectedIndex = index - 1
      if 6 == curDialogEditIndex then
        local dialog = PlotPlayEditorData.GetDialogData(selectDialogId)
        dialog.open_bg_id = config.id
        PlotPlayEditorData.AddOrUpdateDialog(dialog)
      else
        local section = PlotPlayEditorData.GetSectionData(selectSectionId)
        section.bg_id = config.id
        PlotPlayEditorData.AddOrUpdateSection(section)
      end
    end)
  else
    local path = RES_PATH_PREFIX.PLOT_CG .. config.cg_path
    local cg = ResourceManager.Instantiate(path)
    RTManager:ShowModelToLoader(hand:GetChild("BgLoader"), cg)
    LuaUtil.SetLocalPos(cg, 0, 0, 0)
    hand:GetChild("NameTxt").text = config.id
    hand.onClick:Set(function()
      list.selectedIndex = index - 1
      if 6 == curDialogEditIndex then
        local dialog = PlotPlayEditorData.GetDialogData(selectDialogId)
        dialog.open_bg_id = config.id
        PlotPlayEditorData.AddOrUpdateDialog(dialog)
      else
        local section = PlotPlayEditorData.GetSectionData(selectSectionId)
        section.bg_id = config.id
        PlotPlayEditorData.AddOrUpdateSection(section)
      end
    end)
  end
end

function PlotPlayEditorWindow.CreateCardInList(index, config, cardIndex)
  local list = uis.Main.ResourceChoose.SelectArea.SelectList
  local hand = list:AddItemFromPool(UIUtil.GetResUrl("PlotPlayEditor:SelectBtnInList"))
  PlotPlayEditorWindow.ClearSelectBtn(hand)
  if false == useStaticCard and config.spine_path and config.spine_path ~= "" then
    local path = RES_PATH_PREFIX.NPC_SPINE .. config.spine_path
    local model = ResourceManager.Instantiate(path)
    UIUtil.SetObjectToUI(model, hand:GetChild("CardHolder"), 1000)
    SkeletonAnimationUtil.SetAnimation(model, 0, "idle", true)
    SkeletonAnimationUtil.SetSkin(model, "common")
  elseif useStaticCard and config.texture_path and "" ~= config.texture_path then
    local path = RES_PATH_PREFIX.NPC_TEXTURE .. config.texture_path
    local model = ResourceManager.Instantiate(path)
    UIUtil.SetObjectToUI(model, hand:GetChild("CardHolder"), 1000, nil, true)
  end
  hand:GetChild("NameTxt").text = config.name()
  hand.onClick:Set(function()
    list.selectedIndex = index - 1
    local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
    local role_ids = Split(dialogData.role_ids, "|")
    if role_ids[cardIndex] then
      role_ids[cardIndex] = config.id
    else
      table.insert(role_ids, config.id)
    end
    dialogData.role_ids = table.concat(role_ids, "|")
    PlotPlayEditorData.AddOrUpdateDialog(dialogData)
  end)
end

function PlotPlayEditorWindow.CreateHeadInList(index, config)
  local list = uis.Main.ResourceChoose.SelectArea.SelectList
  local hand = list:AddItemFromPool(UIUtil.GetResUrl("PlotPlayEditor:SelectBtnInList"))
  PlotPlayEditorWindow.ClearSelectBtn(hand)
  if false == useStaticCard and config.spine_path and config.spine_path ~= "" then
    local path = config.spine_path
    local model = ResourceManager.Instantiate(path)
    SkeletonAnimationUtil.CreateMaterialOverride(model)
    UIUtil.SetObjectToUI(model, hand:GetChild("HeadHolder"))
  elseif useStaticCard and config.texture_path and "" ~= config.texture_path then
    local path = config.texture_path
    local model = ResourceManager.Instantiate(path)
    UIUtil.SetObjectToUI(model, hand:GetChild("HeadHolder"), nil, true)
  end
  hand:GetChild("NameTxt").text = config.des
  hand.onClick:Set(function()
    list.selectedIndex = index - 1
    local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
    dialogData.speak_head = tostring(config.id)
    PlotPlayEditorData.AddOrUpdateDialog(dialogData)
  end)
end

function PlotPlayEditorWindow.ClearSelectBtn(hand)
  local bgLoader = hand:GetChild("BgLoader")
  RTManager:ReleaseModelFromLoader(bgLoader)
  bgLoader.texture = nil
  hand:GetChild("CardHolder").displayObject:Dispose()
  hand:GetChild("BgHolder").displayObject:Dispose()
  hand:GetChild("HeadHolder").displayObject:Dispose()
end

function PlotPlayEditorWindow.InitBtn()
  uis.Main.JumpToFolderBtn.onClick:Set(function()
    CS.UnityEditor.EditorUtility.OpenWithDefaultApp(Application.dataPath .. "/Editor/StoryEditor/Excel/Story.xlsx")
  end)
  uis.Main.ExportLuaBtn.onClick:Set(function()
    TableData.ClearCache("BasePlotPart")
    TableData.ClearCache("BasePlotSection")
    TableData.ClearCache("BasePlotDialog")
    TableData.ClearCache("BasePlotWord")
    CS.DialogMgr.ExportCSVToLua()
  end)
  uis.Main.SaveToExcelBtn.onClick:Set(function()
    PlotPlayEditorMgr.SaveFile()
  end)
end

local tabTable = {
  {
    text = "文本",
    func = function()
      PlotPlayEditorWindow.UpdateDialogEdit(0)
    end
  },
  {
    text = "头像",
    func = function()
      PlotPlayEditorWindow.UpdateDialogEdit(1)
    end
  },
  {
    text = "立绘",
    func = function()
      PlotPlayEditorWindow.UpdateDialogEdit(2)
    end
  },
  {
    text = "效果",
    func = function()
      PlotPlayEditorWindow.UpdateDialogEdit(3)
    end
  },
  {
    text = "多媒体",
    func = function()
      PlotPlayEditorWindow.UpdateDialogEdit(4)
    end
  },
  {
    text = "CG",
    func = function()
      PlotPlayEditorWindow.UpdateDialogEdit(5)
    end
  },
  {
    text = "开启效果",
    func = function()
      PlotPlayEditorWindow.UpdateDialogEdit(6)
    end
  }
}

function PlotPlayEditorWindow.InitDialogEdit()
  local dialogEdit = uis.Main.DialogEdit
  local list = dialogEdit.TabList
  for i, v in ipairs(tabTable) do
    local tab = list:AddItemFromPool()
    tab:GetChild("title").text = v.text
    tab.onClick:Set(function()
      if tab.selected == false then
        list.selectedIndex = i - 1
        v.func()
      end
    end)
  end
  local cardList = dialogEdit.Card.CardList
  cardList:RemoveChildrenToPool()
  for i = 1, 4 do
    local card = cardList:AddItemFromPool()
    card:GetChild("ChooseCardBtn").onClick:Set(function()
      PlotPlayEditorWindow.UpdateSelectList(SELECT_RES_TYPE.CARD, i)
    end)
  end
  local headEdit = dialogEdit.Head
  headEdit.ChooseHeadBtn.onClick:Set(function()
    PlotPlayEditorWindow.UpdateSelectList(SELECT_RES_TYPE.HEAD)
  end)
end

function PlotPlayEditorWindow.UpdateDialogEdit(index)
  if selectDialogId then
    uis.Main.DialogEdit.root.visible = true
    uis.Main.DialogEdit.root.touchable = true
    if nil == index then
      index = curDialogEditIndex or 0
      uis.Main.DialogEdit.TabList.selectedIndex = index
    end
    curDialogEditIndex = index
    ChangeUIController(uis.Main.DialogEdit.root, "c1", index)
  else
    uis.Main.DialogEdit.root.touchable = false
    uis.Main.DialogEdit.root.visible = false
  end
  if 0 == index then
    PlotPlayEditorWindow.UpdateDialogText()
  elseif 1 == index then
    PlotPlayEditorWindow.UpdateDialogHead()
  elseif 2 == index then
    PlotPlayEditorWindow.UpdateDialogCard()
  elseif 3 == index then
    PlotPlayEditorWindow.UpdateDialogEffect()
  elseif 4 == index then
    PlotPlayEditorWindow.UpdateDialogAnimation()
  elseif 5 == index then
    PlotPlayEditorWindow.UpdateDialogCG()
  elseif 6 == index then
    PlotPlayEditorWindow.UpdateDialogOpen()
  end
  PlotPlayEditorWindow.UpdateEditComp()
end

function PlotPlayEditorWindow.UpdateDialogHead()
  local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
  if dialogData then
    local speak_head = dialogData.speak_head
    local head = uis.Main.DialogEdit.Head
    local list = head.ActionList
    list:RemoveChildrenToPool()
    list:ClearPool()
    local config = TableData.GetConfig(tonumber(speak_head), "BasePlotHead")
    if config and false == useStaticCard and config.spine_path and config.spine_path ~= "" then
      local path = config.spine_path
      local model = ResourceManager.Instantiate(path)
      SkeletonAnimationUtil.CreateMaterialOverride(model)
      UIUtil.SetObjectToUI(model, head.HeadHolder)
      local actions = Split(dialogData.speak_head_actions, "|")
      local info = PlotPlayMgr.GetSpineInfo(model)
      local url = UIUtil.GetResUrl("PlotPlayEditor:SelectButton")
      for _, v in pairs(info.Pose) do
        local hand = list:AddItemFromPool(url)
        hand:GetChild("title").text = v
        if table.contain(actions, v) then
          hand.selected = true
        else
          hand.selected = false
        end
        hand.onClick:Add(function()
          if hand.selected == true then
            table.insert(actions, v)
          else
            local _, k = table.contain(actions, v)
            table.remove(actions, k)
          end
          dialogData.speak_head_actions = table.concat(actions, "|")
          PlotPlayEditorData.AddOrUpdateDialog(dialogData)
        end)
      end
    elseif config and useStaticCard and config.texture_path and "" ~= config.texture_path then
      local path = config.texture_path
      local model = ResourceManager.Instantiate(path)
      UIUtil.SetObjectToUI(model, head.HeadHolder, nil, true)
    else
      head.HeadHolder:SetNativeObject(nil)
    end
    local speak_name = dialogData.speak_name
    local word
    if nil ~= speak_name and "" ~= speak_name then
      word = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetSpeakNameWordId(selectDialogId))
    else
      word = config and config.name()
    end
    uis.Main.DialogEdit.Head.NameTxt.text = word
    local id1 = PlotPlayEditorData.GetSpeakNameWordId(dialogData.id)
    uis.Main.DialogEdit.Head.NameTxt.onFocusOut:Set(function()
      if word == uis.Main.DialogEdit.Head.NameTxt.text then
        return
      end
      word = uis.Main.DialogEdit.Head.NameTxt.text
      if string.len(uis.Main.DialogEdit.Head.NameTxt.text) > 0 then
        PlotPlayEditorData.AddOrUpdateWord({
          id = id1,
          name_cn = uis.Main.DialogEdit.Head.NameTxt.text
        })
        dialogData.speak_name = string.format("T_S(%s)", id1)
      else
        dialogData.speak_name = ""
        PlotPlayEditorData.DeleteWord(id1)
      end
    end)
    local review_head = dialogData.review_head
    uis.Main.DialogEdit.Head.ReviewHeadTxt.text = review_head
    uis.Main.DialogEdit.Head.ReviewHeadTxt.onFocusOut:Set(function()
      local newTxt = uis.Main.DialogEdit.Head.ReviewHeadTxt.text
      if review_head == newTxt then
        return
      end
      if string.len(newTxt) > 0 then
        dialogData.review_head = newTxt
      else
        dialogData.review_head = ""
      end
    end)
    local saveBtn = head.SaveBtn
    saveBtn.onClick:Set(function()
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end)
    local clearBtn = head.ClearBtn
    clearBtn.onClick:Set(function()
      dialogData.speak_head = ""
      dialogData.speak_name = ""
      dialogData.review_head = ""
      PlotPlayEditorData.DeleteWord(id1)
      dialogData.speak_head_actions = ""
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end)
  end
end

function PlotPlayEditorWindow.UpdateDialogCard()
  local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
  if dialogData then
    local role_ids = Split(dialogData.role_ids, "|")
    local scale = Split(dialogData.scale, "|")
    local action = Split(dialogData.action, "|")
    local action_timeline = Split(dialogData.action_timeline, "|")
    local blink_timeline = Split(dialogData.blink_timeline, "|")
    local skin = Split(dialogData.skin, "|")
    local role_position = Split(dialogData.role_position, "|")
    local effect_in = Split(dialogData.effect_in, "|")
    local effect_in_param = Split(dialogData.effect_in_param, "|")
    local effect_out = Split(dialogData.effect_out, "|")
    local effect_out_param = Split(dialogData.effect_out_param, "|")
    local role_effect = Split(dialogData.role_effect, "|")
    local role_shake = Split(dialogData.role_shake, "|")
    local speak_role = Split(dialogData.speak_role, "|")
    local light_role = Split(dialogData.light_role, "|")
    local list = uis.Main.DialogEdit.Card.CardList
    for i = 1, 4 do
      if i <= list.numChildren then
        local card = list:GetChildAt(i - 1)
        if card then
          require("PlotPlayEditor_CardByName")
          card = GetPlotPlayEditor_CardUis(card)
          local roleId = role_ids[i] and tonumber(role_ids[i])
          if roleId then
            scale[i] = scale[i] or "10000"
            skin[i] = skin[i] or ""
            action[i] = action[i] or ""
            action_timeline[i] = action_timeline[i] or ""
            blink_timeline[i] = blink_timeline[i] or ""
            role_position[i] = role_position[i] or "0:0"
            effect_in[i] = effect_in[i] or PLOT_EFFECT_IN_ENUM.NONE[2]
            effect_in_param[i] = effect_in_param[i] or "0"
            effect_out[i] = effect_out[i] or PLOT_EFFECT_OUT_ENUM.NONE[2]
            effect_out_param[i] = effect_out_param[i] or "0"
            role_effect[i] = role_effect[i] or PLOT_ROLE_EFFECT_ENUM.NONE[2]
            role_shake[i] = role_shake[i] or ""
            speak_role[i] = speak_role[i] or PLOT_SPEAK_ROLE_ENUM.NO
            light_role[i] = light_role[i] or PLOT_CARD_LIGHT_ENUM.NO
            local items = {}
            local values = {}
            if useStaticCard then
              card.c1Ctr.selectedIndex = 1
            else
              card.c1Ctr.selectedIndex = 0
            end
            card.CardHolder.displayObject.touchable = true
            local config = TableData.GetConfig(roleId, "BasePlotRole")
            if false == useStaticCard and config.spine_path and "" ~= config.spine_path then
              local path = RES_PATH_PREFIX.NPC_SPINE .. config.spine_path
              local model = ResourceManager.Instantiate(path)
              UIUtil.SetObjectToUI(model, card.CardHolder, 5000)
              SkeletonAnimationUtil.SetSkin(model, "common")
              local info = PlotPlayMgr.GetSpineInfo(model)
              local skinList = card.CardSkin.SkinList
              if skinList then
                skinList:RemoveChildrenToPool()
                skinList:ClearPool()
                for _, v in pairs(info.Skin) do
                  local hand = skinList:AddItemFromPool()
                  hand:GetChild("title").text = v
                  if skin[i] == v then
                    hand.selected = true
                  else
                    hand.selected = false
                  end
                  hand.onClick:Add(function()
                    skin[i] = v
                    dialogData.skin = table.concat(skin, "|")
                    PlotPlayEditorData.AddOrUpdateDialog(dialogData)
                  end)
                end
              end
              local cardTimeline = card.CardTimeline
              local filePath = action_timeline[i]
              if "" ~= filePath then
                if string.find(filePath, "DialogAction") then
                  cardTimeline.c1Ctr.selectedIndex = 2
                  cardTimeline.c2Ctr.selectedIndex = 1
                else
                  cardTimeline.c2Ctr.selectedIndex = 0
                  cardTimeline.c1Ctr.selectedIndex = 1
                end
                cardTimeline.PathTxt.text = filePath
                cardTimeline.JumpBtn.onClick:Set(function()
                  LuaUtil.PingWithSelected(filePath)
                end)
              else
                cardTimeline.c2Ctr.selectedIndex = 0
                cardTimeline.c1Ctr.selectedIndex = 0
              end
              cardTimeline.LookBtn.onClick:Set(function()
                CS.DialogTimeline.OpenTimelineFile(filePath, cachedModel[roleId])
              end)
              cardTimeline.AddBtn.onClick:Set(function()
                PlotPlayEditorWindow.ShowPopAction(info, filePath, cachedModel[roleId])
              end)
              cardTimeline.DelBtn.onClick:Set(function()
                CS.DialogTimeline.DelTimelineFile(action_timeline[i])
                action_timeline[i] = ""
                dialogData.action_timeline = table.concat(action_timeline, "|")
                PlotPlayEditorData.AddOrUpdateDialog(dialogData)
              end)
              cardTimeline.SaveBtn.onClick:Set(function()
                CS.DialogTimeline.SavePlayableAsset(cachedModel[roleId], filePath)
              end)
              cardTimeline.CreateBtn.onClick:Set(function()
                local createPath = CS.DialogTimeline.CreateTimelineFile(cachedModel[roleId], selectDialogId .. "_" .. roleId, "DialogAction/" .. selectDialogId)
                action_timeline[i] = createPath
                dialogData.action_timeline = table.concat(action_timeline, "|")
                PlotPlayEditorData.AddOrUpdateDialog(dialogData)
              end)
              local templateList = cardTimeline.TemplateList
              local fileList = CS.DialogTimeline.GetFiles(CS.DialogTimeline.defaultFolderPath .. "ActionTemplate/" .. roleId)
              fileList = ListToTable(fileList)
              templateList:RemoveChildrenToPool()
              templateList:ClearPool()
              for _, v in ipairs(fileList) do
                v = string.gsub(v, "\\", "/")
                local btn = templateList:AddItemFromPool()
                if v == action_timeline[i] then
                  btn.selected = true
                end
                btn.text = "动作模板 " .. string.match(v, ".+_(.+)%.")
                btn.onClick:Set(function()
                  action_timeline[i] = v
                  dialogData.action_timeline = table.concat(action_timeline, "|")
                  PlotPlayEditorData.AddOrUpdateDialog(dialogData)
                end)
              end
              cardTimeline.AddTemplateBtn.onClick:Set(function()
                local createPath = CS.DialogTimeline.CreateTimelineFile(cachedModel[roleId], CS.DialogTimeline.GetNewActionTemplateName(roleId), "ActionTemplate/" .. roleId)
                action_timeline[i] = createPath
                dialogData.action_timeline = table.concat(action_timeline, "|")
                PlotPlayEditorData.AddOrUpdateDialog(dialogData)
              end)
              cardTimeline.EditTemplateBtn.onClick:Set(function()
                CS.DialogTimeline.OpenTimelineFile(filePath, cachedModel[roleId])
              end)
              cardTimeline.DelTemplateBtn.onClick:Set(function()
                CS.DialogTimeline.DelTimelineFile(action_timeline[i])
                action_timeline[i] = ""
                dialogData.action_timeline = table.concat(action_timeline, "|")
                PlotPlayEditorData.AddOrUpdateDialog(dialogData)
              end)
              cardTimeline.SaveTemplateBtn.onClick:Set(function()
                CS.DialogTimeline.SavePlayableAsset(cachedModel[roleId], filePath)
              end)
              local blinkFilePath = blink_timeline[i]
              local cardBlink = card.CardBlink
              local blinkTemplateList = cardBlink.BlinkTemplateList
              local blinkFileList = CS.DialogTimeline.GetFiles(CS.DialogTimeline.defaultFolderPath .. "BlinkTemplate/" .. roleId)
              blinkFileList = ListToTable(blinkFileList)
              blinkTemplateList:RemoveChildrenToPool()
              blinkTemplateList:ClearPool()
              for _, v in ipairs(blinkFileList) do
                v = string.gsub(v, "\\", "/")
                local btn = blinkTemplateList:AddItemFromPool()
                if v == blink_timeline[i] then
                  btn.selected = true
                end
                btn.text = "眨眼模板 " .. string.match(v, ".+_(.+)%.")
                btn.onClick:Set(function()
                  blink_timeline[i] = v
                  dialogData.blink_timeline = table.concat(blink_timeline, "|")
                  PlotPlayEditorData.AddOrUpdateDialog(dialogData)
                end)
              end
              cardBlink.BlinkAddBtn.onClick:Set(function()
                local createPath = CS.DialogTimeline.CreateTimelineFile(cachedModel[roleId], CS.DialogTimeline.GetNewBlinkTemplateName(roleId), "BlinkTemplate/" .. roleId)
                blink_timeline[i] = createPath
                dialogData.blink_timeline = table.concat(blink_timeline, "|")
                PlotPlayEditorData.AddOrUpdateDialog(dialogData)
              end)
              cardBlink.BlinkEditBtn.onClick:Set(function()
                CS.DialogTimeline.OpenTimelineFile(blinkFilePath, cachedModel[roleId])
              end)
              cardBlink.BlinkDelBtn.onClick:Set(function()
                CS.DialogTimeline.DelTimelineFile(blink_timeline[i])
                blink_timeline[i] = ""
                dialogData.blink_timeline = table.concat(blink_timeline, "|")
                PlotPlayEditorData.AddOrUpdateDialog(dialogData)
              end)
              cardBlink.BlinkSaveBtn.onClick:Set(function()
                CS.DialogTimeline.SavePlayableAsset(cachedModel[roleId], blinkFilePath)
              end)
              cardBlink.BlinkJumpBtn.onClick:Set(function()
                LuaUtil.PingWithSelected(blinkFilePath)
              end)
            elseif useStaticCard and config.texture_path and config.texture_path ~= "" then
              local path = RES_PATH_PREFIX.NPC_TEXTURE .. config.texture_path
              local model = ResourceManager.Instantiate(path)
              UIUtil.SetObjectToUI(model, card.CardHolder, 5000, nil, true)
            end
            items = {}
            values = {}
            for _, v in pairs(PLOT_EFFECT_IN_ENUM) do
              table.insert(items, v[1])
              table.insert(values, v[2])
            end
            local EffectInCBox = card.CardEffect.EffectInCBox
            EffectInCBox.items = items
            EffectInCBox.values = values
            EffectInCBox.value = effect_in[i]
            items = {}
            values = {}
            for i, v in pairs(PLOT_EFFECT_OUT_ENUM) do
              table.insert(items, v[1])
              table.insert(values, v[2])
            end
            local EffectOutCBox = card.CardEffect.EffectOutCBox
            EffectOutCBox.items = items
            EffectOutCBox.values = values
            EffectOutCBox.value = effect_out[i]
            items = {}
            values = {}
            for i, v in pairs(PLOT_ROLE_EFFECT_ENUM) do
              table.insert(items, v[1])
              table.insert(values, v[2])
            end
            local CardEffectCBox = card.CardEffect.CardEffectCBox
            CardEffectCBox.items = items
            CardEffectCBox.values = values
            CardEffectCBox.value = role_effect[i]
            card.NameTxt.text = config.name()
            local position = Split(role_position[i], ":")
            local PosXTxt = card.CardScaleAndPosition.PosXTxt
            local PosYTxt = card.CardScaleAndPosition.PosYTxt
            PosXTxt.text = position[1]
            PosYTxt.text = position[2]
            PosXTxt.onFocusOut:Set(function()
              position[1] = PosXTxt.text
              role_position[i] = table.concat(position, ":")
              dialogData.role_position = table.concat(role_position, "|")
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end)
            PosYTxt.onFocusOut:Set(function()
              position[2] = PosYTxt.text
              role_position[i] = table.concat(position, ":")
              dialogData.role_position = table.concat(role_position, "|")
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end)
            EffectInCBox.onChanged:Set(function()
              effect_in[i] = EffectInCBox.value
              dialogData.effect_in = table.concat(effect_in, "|")
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end)
            EffectOutCBox.onChanged:Set(function()
              effect_out[i] = EffectOutCBox.value
              dialogData.effect_out = table.concat(effect_out, "|")
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end)
            local InParamTxt = card.CardEffect.InParamTxt
            InParamTxt.text = effect_in_param[i]
            InParamTxt.onFocusOut:Set(function()
              effect_in_param[i] = InParamTxt.text
              dialogData.effect_in_param = table.concat(effect_in_param, "|")
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end)
            local OutParamTxt = card.CardEffect.OutParamTxt
            OutParamTxt.text = effect_out_param[i]
            OutParamTxt.onFocusOut:Set(function()
              effect_out_param[i] = OutParamTxt.text
              dialogData.effect_out_param = table.concat(effect_out_param, "|")
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end)
            local ScaleTxt = card.CardScaleAndPosition.ScaleTxt
            ScaleTxt.text = scale[i]
            ScaleTxt.onFocusOut:Set(function()
              if string.len(ScaleTxt.text) > 0 then
                scale[i] = ScaleTxt.text
                dialogData.scale = table.concat(scale, "|")
                PlotPlayEditorData.AddOrUpdateDialog(dialogData)
              end
            end)
            card.CardSpeak.IsSpeakerBtn.selected = speak_role[i] == PLOT_SPEAK_ROLE_ENUM.YES
            card.CardSpeak.IsLightBtn.selected = light_role[i] == PLOT_CARD_LIGHT_ENUM.YES
            items = {}
            values = {}
            for _, v in pairs(PLOT_ROLE_SHAKE_ENUM) do
              table.insert(items, v[1])
              table.insert(values, v[2])
            end
            local roleShake = Split(role_shake[i], ":")
            card.CardShake.ShakeCBox.items = items
            card.CardShake.ShakeCBox.values = values
            card.CardShake.ShakeCBox.value = roleShake[1] or PLOT_ROLE_SHAKE_ENUM.NONE[2]
            card.CardShake.ShakeDelayTxt.text = roleShake[2] or "0"
            card.CardShake.ShakeTimeTxt.text = roleShake[3] or "1000"
            local callback = function()
              if card.CardShake.ShakeCBox.value == PLOT_ROLE_SHAKE_ENUM.NONE[2] then
                if "" == role_shake[i] then
                  return
                end
                role_shake[i] = ""
                dialogData.role_shake = table.concat(role_shake, "|")
              else
                role_shake[i] = table.concat({
                  card.CardShake.ShakeCBox.value,
                  card.CardShake.ShakeDelayTxt.text,
                  card.CardShake.ShakeTimeTxt.text
                }, ":")
                dialogData.role_shake = table.concat(role_shake, "|")
              end
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end
            card.CardShake.ShakeCBox.onChanged:Set(callback)
            card.CardShake.ShakeDelayTxt.onFocusOut:Set(callback)
            card.CardShake.ShakeTimeTxt.onFocusOut:Set(callback)
            local clearBtn = card.ClearBtn
            clearBtn.onClick:Set(function()
              table.remove(role_ids, i)
              table.remove(scale, i)
              table.remove(action, i)
              table.remove(action_timeline, i)
              table.remove(blink_timeline, i)
              table.remove(skin, i)
              table.remove(role_position, i)
              table.remove(effect_in, i)
              table.remove(effect_in_param, i)
              table.remove(effect_out, i)
              table.remove(effect_out_param, i)
              table.remove(role_effect, i)
              table.remove(speak_role, i)
              table.remove(light_role, i)
              table.remove(role_shake, i)
              dialogData.role_ids = table.concat(role_ids, "|")
              dialogData.action = table.concat(action, "|")
              dialogData.action_timeline = table.concat(action_timeline, "|")
              dialogData.blink_timeline = table.concat(blink_timeline, "|")
              dialogData.skin = table.concat(skin, "|")
              dialogData.role_position = table.concat(role_position, "|")
              dialogData.effect_in = table.concat(effect_in, "|")
              dialogData.effect_in_param = table.concat(effect_in_param, "|")
              dialogData.effect_out = table.concat(effect_out, "|")
              dialogData.effect_out_param = table.concat(effect_out_param, "|")
              dialogData.role_ids = table.concat(role_ids, "|")
              dialogData.role_effect = table.concat(role_effect, "|")
              dialogData.speak_role = table.concat(speak_role, "|")
              dialogData.light_role = table.concat(light_role, "|")
              dialogData.role_shake = table.concat(role_shake, "|")
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end)
            local saveBtn = card.SaveBtn
            saveBtn.onClick:Set(function()
              role_position[i] = PosXTxt.text .. ":" .. PosYTxt.text
              speak_role[i] = card.CardSpeak.IsSpeakerBtn.selected and PLOT_SPEAK_ROLE_ENUM.YES or PLOT_SPEAK_ROLE_ENUM.NO
              light_role[i] = card.CardSpeak.IsLightBtn.selected and PLOT_CARD_LIGHT_ENUM.YES or PLOT_CARD_LIGHT_ENUM.NO
              dialogData.role_ids = table.concat(role_ids, "|")
              dialogData.scale = table.concat(scale, "|")
              dialogData.action = table.concat(action, "|")
              dialogData.role_position = table.concat(role_position, "|")
              dialogData.effect_in = table.concat(effect_in, "|")
              dialogData.effect_in_param = table.concat(effect_in_param, "|")
              dialogData.effect_out = table.concat(effect_out, "|")
              dialogData.effect_out_param = table.concat(effect_out_param, "|")
              dialogData.role_ids = table.concat(role_ids, "|")
              dialogData.role_effect = table.concat(role_effect, "|")
              dialogData.speak_role = table.concat(speak_role, "|")
              dialogData.light_role = table.concat(light_role, "|")
              dialogData.role_shake = table.concat(role_shake, "|")
              PlotPlayEditorData.AddOrUpdateDialog(dialogData)
            end)
          else
            card.c1Ctr.selectedIndex = 2
            card.CardHolder.displayObject.touchable = false
            card.NameTxt.text = ""
          end
        end
      end
    end
  end
end

local popAddAction

function PlotPlayEditorWindow.ShowPopAction(spineInfo, filePath, model)
  if nil == popAddAction then
    popAddAction = UIMgr:CreateComponent("PlotPlayEditor", "PopAddAction")
    contentPane:AddChild(popAddAction)
    popAddAction:SetSize(contentPane.width, contentPane.height)
    popAddAction:GetChild("TouchScreenBtn").onClick:Set(function()
      if popAddAction then
        popAddAction.visible = false
      end
    end)
  else
    popAddAction.visible = true
  end
  for i = 0, 20 do
    local list = popAddAction:GetChild(string.format("Action%dList", i))
    if list then
      list:RemoveChildrenToPool()
    end
    local changeList = popAddAction:GetChild(string.format("Action%dChangeList", i))
    if changeList then
      changeList:RemoveChildrenToPool()
    end
  end
  local pos = {}
  for i, v in pairs(spineInfo.Pose) do
    table.insert(pos, v)
  end
  table.sort(pos, function(a, b)
    return a < b
  end)
  for i, v in ipairs(pos) do
    local index = CS.DialogTimeline.GetTrackIndexByName(v)
    local list
    if string.find(v, "change_") then
      list = popAddAction:GetChild(string.format("Action%dChangeList", index))
    else
      list = popAddAction:GetChild(string.format("Action%dList", index))
    end
    if list then
      local btn = list:AddItemFromPool()
      btn.text = v
      btn.onClick:Set(function()
        CS.DialogTimeline.AddTrackClip(filePath, v, model)
      end)
    end
  end
end

function PlotPlayEditorWindow.UpdateDialogText()
  local dialogText = uis.Main.DialogEdit.Text
  if nil == selectDialogId then
    return
  end
  local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
  if dialogData then
    dialogText.IsSelfBtn.selected = dialogData.is_master == PLOT_IS_MASTER_ENUM.YES
    dialogText.IsSelfBtn.onChanged:Set(function()
      dialogData.is_master = dialogText.IsSelfBtn.selected and PLOT_IS_MASTER_ENUM.YES or PLOT_IS_MASTER_ENUM.NO
    end)
    dialogText.IsOSBtn.selected = dialogData.is_os == PLOT_IS_OS_ENUM.YES
    dialogText.IsOSBtn.onChanged:Set(function()
      dialogData.is_os = dialogText.IsOSBtn.selected and PLOT_IS_OS_ENUM.YES or PLOT_IS_OS_ENUM.NO
    end)
    local id1 = PlotPlayEditorData.GetTalkWordId(dialogData.id)
    dialogText.TalkWordTxt.text = PlotPlayEditorData.GetWord(id1) or ""
    dialogText.TalkWordTxt.onFocusOut:Set(function()
      if string.len(dialogText.TalkWordTxt.text) > 0 then
        PlotPlayEditorData.AddOrUpdateWord({
          id = id1,
          name_cn = dialogText.TalkWordTxt.text
        })
        dialogData.talk_text = string.format("T_S(%s)", id1)
      else
        dialogData.talk_text = ""
        PlotPlayEditorData.DeleteWord(id1)
      end
    end)
    local id2 = PlotPlayEditorData.GetExplainWordId(dialogData.id)
    dialogText.ExplainWordTxt.text = PlotPlayEditorData.GetWord(id2) or ""
    dialogText.ExplainWordTxt.onFocusOut:Set(function()
      if string.len(dialogText.ExplainWordTxt.text) > 0 then
        PlotPlayEditorData.AddOrUpdateWord({
          id = id2,
          name_cn = dialogText.ExplainWordTxt.text
        })
        dialogData.explain_text = string.format("T_S(%s)", id2)
      else
        dialogData.explain_text = ""
        PlotPlayEditorData.DeleteWord(id2)
      end
    end)
    local id6 = PlotPlayEditorData.GetExplainNameWordId(dialogData.id)
    dialogText.ExplainWordNameTxt.text = PlotPlayEditorData.GetWord(id6) or ""
    dialogText.ExplainWordNameTxt.onFocusOut:Set(function()
      if string.len(dialogText.ExplainWordNameTxt.text) > 0 then
        PlotPlayEditorData.AddOrUpdateWord({
          id = id6,
          name_cn = dialogText.ExplainWordNameTxt.text
        })
        dialogData.explain_name_text = string.format("T_S(%s)", id6)
      else
        dialogData.explain_name_text = ""
        PlotPlayEditorData.DeleteWord(id6)
      end
    end)
    local id3 = PlotPlayEditorData.GetNarratorWordId(dialogData.id)
    dialogText.NarratorWordTxt.text = PlotPlayEditorData.GetWord(id3) or ""
    dialogText.NarratorWordTxt.onFocusOut:Set(function()
      if string.len(dialogText.NarratorWordTxt.text) > 0 then
        PlotPlayEditorData.AddOrUpdateWord({
          id = id3,
          name_cn = dialogText.NarratorWordTxt.text
        })
        dialogData.narrator_text = string.format("T_S(%s)", id3)
      else
        dialogData.narrator_text = ""
        PlotPlayEditorData.DeleteWord(id3)
      end
    end)
    local id4 = PlotPlayEditorData.GetMiddleWordId(dialogData.id)
    dialogText.MiddleWordTxt.text = PlotPlayEditorData.GetWord(id4) or ""
    dialogText.MiddleWordTxt.onFocusOut:Set(function()
      if string.len(dialogText.MiddleWordTxt.text) > 0 then
        PlotPlayEditorData.AddOrUpdateWord({
          id = id4,
          name_cn = dialogText.MiddleWordTxt.text
        })
        dialogData.middle_text = string.format("T_S(%s)", id4)
      else
        dialogData.middle_text = ""
        PlotPlayEditorData.DeleteWord(id4)
      end
    end)
    local id5 = PlotPlayEditorData.GetOptionWordId(dialogData.id)
    local RefreshUpdateOption = function()
      local tempText, tempValue
      for i = 1, 4 do
        local text = dialogText["Option" .. i].OptionTxt.text
        if string.len(text) > 0 then
          tempText = tempText and tempText .. "|" .. text or text
          local value = dialogText["Option" .. i].JumpCBox.value
          tempValue = tempValue and tempValue .. "|" .. value or value
        end
      end
      tempText = tempText or ""
      if string.len(tempText) > 0 then
        PlotPlayEditorData.AddOrUpdateWord({id = id5, name_cn = tempText})
        dialogData.option_text = string.format("T_S(%s)", id5)
        tempValue = tempValue or ""
        dialogData.option_jump = tempValue
      else
        PlotPlayEditorData.DeleteWord(id5)
        dialogData.option_text = ""
        dialogData.option_jump = ""
      end
    end
    local optionTexts = Split(PlotPlayEditorData.GetWord(id5) or "", "|")
    for i = 1, 4 do
      if dialogText["Option" .. i] then
        dialogText["Option" .. i].OptionTxt.text = optionTexts[i]
      end
    end
    local outFunc = function()
      RefreshUpdateOption()
    end
    dialogText.Option1.OptionTxt.onFocusOut:Set(outFunc)
    dialogText.Option2.OptionTxt.onFocusOut:Set(outFunc)
    dialogText.Option3.OptionTxt.onFocusOut:Set(outFunc)
    dialogText.Option4.OptionTxt.onFocusOut:Set(outFunc)
    local items = {"未选择"}
    local values = {""}
    local sectionData = PlotPlayEditorData.GetSectionData(selectSectionId)
    local dialog_ids = Split(sectionData.dialog_ids, "|")
    for i, v in pairs(dialog_ids) do
      table.insert(items, v)
      table.insert(values, v)
    end
    table.insert(items, "结束")
    table.insert(values, "-1")
    dialogText.Option1.JumpCBox.items = items
    dialogText.Option1.JumpCBox.values = values
    dialogText.Option2.JumpCBox.items = items
    dialogText.Option2.JumpCBox.values = values
    dialogText.Option3.JumpCBox.items = items
    dialogText.Option3.JumpCBox.values = values
    dialogText.Option4.JumpCBox.items = items
    dialogText.Option4.JumpCBox.values = values
    local optionData = Split(dialogData.option_jump, "|")
    dialogText.Option1.JumpCBox.value = optionData[1]
    dialogText.Option2.JumpCBox.value = optionData[2]
    dialogText.Option3.JumpCBox.value = optionData[3]
    dialogText.Option4.JumpCBox.value = optionData[4]
    local option_jump_func = function()
      RefreshUpdateOption()
    end
    dialogText.Option1.JumpCBox.onChanged:Set(option_jump_func)
    dialogText.Option2.JumpCBox.onChanged:Set(option_jump_func)
    dialogText.Option3.JumpCBox.onChanged:Set(option_jump_func)
    dialogText.Option4.JumpCBox.onChanged:Set(option_jump_func)
    dialogText.SaveBtn.onClick:Set(function()
      RefreshUpdateOption()
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end)
  end
end

function PlotPlayEditorWindow.UpdateDialogEffect()
  local dialogEffect = uis.Main.DialogEdit.Effect
  local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
  if dialogData then
    local camera_move_effect = Split(dialogData.camera_move, "|")
    local camera_scale_effect = Split(dialogData.camera_scale, "|")
    local camera_shake_effect = Split(dialogData.camera_shake, "|")
    local top_effect = Split(dialogData.top_effect, "|")
    dialogEffect.TopEffectPathTxt.text = top_effect[1] or ""
    dialogEffect.TopEffectDelayTxt.text = top_effect[2] or "0"
    local callback0 = function()
      dialogData.top_effect = table.concat({
        dialogEffect.TopEffectPathTxt.text,
        dialogEffect.TopEffectDelayTxt.text
      }, "|")
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end
    dialogEffect.TopEffectPathTxt.onFocusOut:Set(callback0)
    dialogEffect.TopEffectDelayTxt.onFocusOut:Set(callback0)
    local items = {}
    local values = {}
    for _, v in pairs(PLOT_CAMERA_MOVE_ENUM) do
      table.insert(items, v[1])
      table.insert(values, v[2])
    end
    dialogEffect.CameraMoveCBox.items = items
    dialogEffect.CameraMoveCBox.values = values
    dialogEffect.CameraMoveCBox.value = camera_move_effect[1] or PLOT_CAMERA_MOVE_ENUM.NONE[2]
    dialogEffect.CameraMoveDelayTxt.text = camera_move_effect[2] or "0"
    dialogEffect.CameraMoveStartTxt.text = camera_move_effect[3] or "0"
    dialogEffect.CameraMoveTimeTxt.text = camera_move_effect[4] or "2000"
    local callback = function()
      if dialogEffect.CameraMoveCBox.value == PLOT_CAMERA_MOVE_ENUM.NONE[2] then
        if dialogData.camera_move == "" then
          return
        end
        dialogData.camera_move = ""
      else
        dialogData.camera_move = table.concat({
          dialogEffect.CameraMoveCBox.value,
          dialogEffect.CameraMoveDelayTxt.text,
          dialogEffect.CameraMoveStartTxt.text,
          dialogEffect.CameraMoveTimeTxt.text
        }, "|")
      end
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end
    dialogEffect.CameraMoveCBox.onChanged:Set(callback)
    dialogEffect.CameraMoveDelayTxt.onFocusOut:Set(callback)
    dialogEffect.CameraMoveStartTxt.onFocusOut:Set(callback)
    dialogEffect.CameraMoveTimeTxt.onFocusOut:Set(callback)
    items = {}
    values = {}
    for _, v in pairs(PLOT_CAMERA_SCALE_ENUM) do
      table.insert(items, v[1])
      table.insert(values, v[2])
    end
    dialogEffect.CameraScaleCBox.items = items
    dialogEffect.CameraScaleCBox.values = values
    dialogEffect.CameraScaleCBox.value = camera_scale_effect[1] or PLOT_CAMERA_SCALE_ENUM.NONE[2]
    dialogEffect.CameraScaleDelayTxt.text = camera_scale_effect[2] or "0"
    dialogEffect.CameraScaleStartTxt.text = camera_scale_effect[3] or "10000"
    dialogEffect.CameraScaleTimeTxt.text = camera_scale_effect[4] or "2000"
    local callback1 = function()
      if dialogEffect.CameraScaleCBox.value == PLOT_CAMERA_SCALE_ENUM.NONE[2] then
        if dialogData.camera_scale == "" then
          return
        end
        dialogData.camera_scale = ""
      else
        dialogData.camera_scale = table.concat({
          dialogEffect.CameraScaleCBox.value,
          dialogEffect.CameraScaleDelayTxt.text,
          dialogEffect.CameraScaleStartTxt.text,
          dialogEffect.CameraScaleTimeTxt.text
        }, "|")
      end
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end
    dialogEffect.CameraScaleCBox.onChanged:Set(callback1)
    dialogEffect.CameraScaleDelayTxt.onFocusOut:Set(callback1)
    dialogEffect.CameraScaleStartTxt.onFocusOut:Set(callback1)
    dialogEffect.CameraScaleTimeTxt.onFocusOut:Set(callback1)
    items = {}
    values = {}
    for _, v in pairs(PLOT_CAMERA_SHAKE_ENUM) do
      table.insert(items, v[1])
      table.insert(values, v[2])
    end
    dialogEffect.CameraShakeCBox.items = items
    dialogEffect.CameraShakeCBox.values = values
    dialogEffect.CameraShakeCBox.value = camera_shake_effect[1] or PLOT_CAMERA_SHAKE_ENUM.NONE[2]
    dialogEffect.CameraShakeDelayTxt.text = camera_shake_effect[2] or "0"
    dialogEffect.CameraShakeTimeTxt.text = camera_shake_effect[3] or "1000"
    local callback2 = function()
      if dialogEffect.CameraShakeCBox.value == PLOT_CAMERA_SHAKE_ENUM.NONE[2] then
        if dialogData.camera_shake == "" then
          return
        end
        dialogData.camera_shake = ""
      else
        dialogData.camera_shake = table.concat({
          dialogEffect.CameraShakeCBox.value,
          dialogEffect.CameraShakeDelayTxt.text,
          dialogEffect.CameraShakeTimeTxt.text
        }, "|")
      end
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end
    dialogEffect.CameraShakeCBox.onChanged:Set(callback2)
    dialogEffect.CameraShakeDelayTxt.onFocusOut:Set(callback2)
    dialogEffect.CameraShakeTimeTxt.onFocusOut:Set(callback2)
  end
end

function PlotPlayEditorWindow.UpdateDialogAnimation()
  local dialogAnimation = uis.Main.DialogEdit.Animation
  local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
  if dialogData then
    local animation_path = dialogData.animation_path
    dialogAnimation.AnimationUrlTxt.text = animation_path or ""
    local battle_script = dialogData.battle_script
    dialogAnimation.BattleScriptTxt.text = battle_script or ""
    local text_sound = dialogData.text_sound_path
    dialogAnimation.TextSoundTxt.text = text_sound or ""
    local env_sound = dialogData.env_sound
    dialogAnimation.EnvSoundTxt.text = env_sound or ""
    local special_sound = dialogData.special_sound
    dialogAnimation.SpecialSoundTxt.text = special_sound or ""
    local special_sound_delay = dialogData.special_sound_delay
    dialogAnimation.DelayTimeTxt.text = special_sound_delay or "0"
    dialogAnimation.AnimationUrlTxt.onFocusOut:Set(function()
      dialogData.animation_path = dialogAnimation.AnimationUrlTxt.text
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end)
    dialogAnimation.BattleScriptTxt.onFocusOut:Set(function()
      dialogData.battle_script = dialogAnimation.BattleScriptTxt.text
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end)
    dialogAnimation.EnvSoundTxt.onFocusOut:Set(function()
      dialogData.env_sound = dialogAnimation.EnvSoundTxt.text
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end)
    dialogAnimation.SpecialSoundTxt.onFocusOut:Set(function()
      dialogData.special_sound = dialogAnimation.SpecialSoundTxt.text
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end)
    dialogAnimation.DelayTimeTxt.onFocusOut:Set(function()
      dialogData.special_sound_delay = dialogAnimation.DelayTimeTxt.text
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end)
  end
end

function PlotPlayEditorWindow.UpdateDialogCG()
  local cg = uis.Main.DialogEdit.CG
  local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
  if dialogData then
    local id1 = PlotPlayEditorData.GetCGWordId(selectDialogId)
    cg.WordTxt.text = PlotPlayEditorData.GetWord(id1) or ""
    cg.WordTxt.onFocusOut:Set(function()
      if string.len(cg.WordTxt.text) > 0 then
        dialogData.cg_text = string.format("T_S(%s)", id1)
        PlotPlayEditorData.AddOrUpdateWord({
          id = id1,
          name_cn = cg.WordTxt.text
        })
      else
        dialogData.cg_text = ""
        PlotPlayEditorData.DeleteWord(id1)
      end
    end)
    local cg_position_scale = (dialogData.cg_position_scale == nil or dialogData.cg_position_scale == "") and "0:0:10000" or dialogData.cg_position_scale
    local info = Split(cg_position_scale, ":")
    local PosXTxt = cg.XTxt
    local PosYTxt = cg.YTxt
    local ScaleTxt = cg.ScaleTxt
    PosXTxt.text = info[1]
    PosYTxt.text = info[2]
    ScaleTxt.text = info[3]
    PosXTxt.onFocusOut:Set(function()
      if PosXTxt.text ~= "" then
        info[1] = PosXTxt.text
        dialogData.cg_position_scale = table.concat(info, ":")
        PlotPlayEditorData.AddOrUpdateDialog(dialogData)
      end
    end)
    PosYTxt.onFocusOut:Set(function()
      if PosYTxt.text ~= "" then
        info[2] = PosYTxt.text
        dialogData.cg_position_scale = table.concat(info, ":")
        PlotPlayEditorData.AddOrUpdateDialog(dialogData)
      end
    end)
    ScaleTxt.onFocusOut:Set(function()
      if ScaleTxt.text ~= "" then
        info[3] = ScaleTxt.text
        dialogData.cg_position_scale = table.concat(info, ":")
        PlotPlayEditorData.AddOrUpdateDialog(dialogData)
      end
    end)
  end
end

function PlotPlayEditorWindow.UpdateDialogOpen()
  local open = uis.Main.DialogEdit.Open
  local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
  if dialogData then
    local title1 = PlotPlayEditorData.GetOpenTitle1WordId(selectDialogId)
    open.Title1Txt.text = PlotPlayEditorData.GetWord(title1) or ""
    open.Title1Txt.onFocusOut:Set(function()
      if string.len(open.Title1Txt.text) > 0 then
        dialogData.open_title_1 = string.format("T_S(%s)", title1)
        PlotPlayEditorData.AddOrUpdateWord({
          id = title1,
          name_cn = open.Title1Txt.text
        })
      else
        dialogData.open_title_1 = ""
        PlotPlayEditorData.DeleteWord(title1)
      end
    end)
    local title2 = PlotPlayEditorData.GetOpenTitle2WordId(selectDialogId)
    open.Title2Txt.text = PlotPlayEditorData.GetWord(title2) or ""
    open.Title2Txt.onFocusOut:Set(function()
      if string.len(open.Title2Txt.text) > 0 then
        dialogData.open_title_2 = string.format("T_S(%s)", title2)
        PlotPlayEditorData.AddOrUpdateWord({
          id = title2,
          name_cn = open.Title2Txt.text
        })
      else
        dialogData.open_title_2 = ""
        PlotPlayEditorData.DeleteWord(title2)
      end
    end)
    local chooseBtn = open.ChooseBtn
    local clearBtn = open.ClearBtn
    chooseBtn.onClick:Set(function()
      PlotPlayEditorWindow.UpdateSelectList(SELECT_RES_TYPE.BACKGROUND)
    end)
    clearBtn.onClick:Set(function()
      local dialog = PlotPlayEditorData.GetDialogData(selectDialogId)
      dialog.open_bg_id = ""
      PlotPlayEditorData.AddOrUpdateDialog(dialog)
    end)
    local loader = open.BgLoader
    RTManager:ReleaseModelFromLoader(loader)
    loader.texture = nil
    if dialogData.open_bg_id and dialogData.open_bg_id ~= "" then
      local config = TableData.GetConfig(tonumber(dialogData.open_bg_id), "BasePlotPlayBG")
      if config.path then
        local texture = ResourceManager.LoadTexture(RES_PATH_PREFIX.SINGLE_TEXTURE .. config.path)
        UIUtil.SetLoaderTexture(loader, texture)
      elseif config.cg_path then
        local path = RES_PATH_PREFIX.PLOT_CG .. config.cg_path
        local cg = ResourceManager.Instantiate(path)
        RTManager:ShowModelToLoader(loader, cg)
        LuaUtil.SetLocalPos(cg, 0, 0, 0)
      end
    end
    local open_bg_move_effect = Split(dialogData.open_bg_move, "|")
    local open_bg_scale_effect = Split(dialogData.open_bg_scale, "|")
    local items = {}
    local values = {}
    for _, v in pairs(PLOT_CAMERA_MOVE_ENUM) do
      table.insert(items, v[1])
      table.insert(values, v[2])
    end
    open.BgMoveCBox.items = items
    open.BgMoveCBox.values = values
    open.BgMoveCBox.value = open_bg_move_effect[1] or PLOT_CAMERA_MOVE_ENUM.NONE[2]
    open.BgMoveDelayTxt.text = open_bg_move_effect[2] or "0"
    open.BgMoveStartTxt.text = open_bg_move_effect[3] or "0"
    open.BgMoveTimeTxt.text = open_bg_move_effect[4] or "2000"
    local callback = function()
      if open.BgMoveCBox.value == PLOT_CAMERA_MOVE_ENUM.NONE[2] then
        if dialogData.open_bg_move == "" then
          return
        end
        dialogData.open_bg_move = ""
      else
        dialogData.open_bg_move = table.concat({
          open.BgMoveCBox.value,
          open.BgMoveDelayTxt.text,
          open.BgMoveStartTxt.text,
          open.BgMoveTimeTxt.text
        }, "|")
      end
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end
    open.BgMoveCBox.onChanged:Set(callback)
    open.BgMoveDelayTxt.onFocusOut:Set(callback)
    open.BgMoveStartTxt.onFocusOut:Set(callback)
    open.BgMoveTimeTxt.onFocusOut:Set(callback)
    items = {}
    values = {}
    for _, v in pairs(PLOT_CAMERA_SCALE_ENUM) do
      table.insert(items, v[1])
      table.insert(values, v[2])
    end
    open.BgScaleCBox.items = items
    open.BgScaleCBox.values = values
    open.BgScaleCBox.value = open_bg_scale_effect[1] or PLOT_CAMERA_SCALE_ENUM.NONE[2]
    open.BgScaleDelayTxt.text = open_bg_scale_effect[2] or "0"
    open.BgScaleStartTxt.text = open_bg_scale_effect[3] or "10000"
    open.BgScaleTimeTxt.text = open_bg_scale_effect[4] or "2000"
    local callback1 = function()
      if open.BgScaleCBox.value == PLOT_CAMERA_SCALE_ENUM.NONE[2] then
        if dialogData.open_bg_scale == "" then
          return
        end
        dialogData.open_bg_scale = ""
      else
        dialogData.open_bg_scale = table.concat({
          open.BgScaleCBox.value,
          open.BgScaleDelayTxt.text,
          open.BgScaleStartTxt.text,
          open.BgScaleTimeTxt.text
        }, "|")
      end
      PlotPlayEditorData.AddOrUpdateDialog(dialogData)
    end
    open.BgScaleCBox.onChanged:Set(callback1)
    open.BgScaleDelayTxt.onFocusOut:Set(callback1)
    open.BgScaleStartTxt.onFocusOut:Set(callback1)
    open.BgScaleTimeTxt.onFocusOut:Set(callback1)
  end
end

local plotPlayWindow, plot_uis

function PlotPlayEditorWindow.UpdateEditComp()
  if nil == plotPlayWindow then
    UIMgr:LoadPackage("PlotPlay")
    plotPlayWindow = UIMgr:CreateObject("PlotPlay", "PlotPlayWindow")
    local parent = uis.Main.EditComp.root
    parent:AddChild(plotPlayWindow)
    local scale = parent.width / 1334
    plotPlayWindow:SetScale(scale, scale)
    require("PlotPlay_PlotPlayWindowByName")
    plot_uis = GetPlotPlay_PlotPlayWindowUis(plotPlayWindow)
  end
  if nil == selectDialogId then
    plotPlayWindow.visible = false
  else
    plotPlayWindow.visible = true
    PlotPlayEditorWindow.UpdatePlotPlay()
  end
end

local colorSpeak = Color(1, 1, 1, 1)
local colorNoSpeak = Color(0.7, 0.7, 0.7, 1)

function PlotPlayEditorWindow.UpdatePlotPlay()
  cachedModel = {}
  local sectionData = PlotPlayEditorData.GetSectionData(selectSectionId)
  local dialogData = PlotPlayEditorData.GetDialogData(selectDialogId)
  if dialogData then
    local role_ids = Split(dialogData.role_ids, "|")
    local scale = Split(dialogData.scale, "|")
    local action = Split(dialogData.action, "|")
    local skin = Split(dialogData.skin, "|")
    local action_timeline = Split(dialogData.action_timeline, "|")
    local blink_timeline = Split(dialogData.blink_timeline, "|")
    local role_position = Split(dialogData.role_position, "|")
    local effect_in = Split(dialogData.effect_in, "|")
    local effect_out = Split(dialogData.effect_out, "|")
    local role_effect = Split(dialogData.role_effect, "|")
    local speak_role = Split(dialogData.speak_role, "|")
    local light_role = Split(dialogData.light_role, "|")
    local text = dialogData.text
    local speak_head = dialogData.speak_head
    local speak_name = dialogData.speak_name
    local speak_head_actions = Split(dialogData.speak_head_actions, "|")
    local talkCom = plot_uis.Main.Talk
    talkCom.root.touchable = false
    plot_uis.Main.Talk.SkipBtn.visible = sectionData.skip == "1"
    local headName = ""
    local NpcHead = talkCom.TalkWord.NpcHead
    if speak_head and "" ~= speak_head then
      NpcHead.root.visible = true
      local headConfig = TableData.GetConfig(tonumber(speak_head), "BasePlotHead")
      if false == useStaticCard and headConfig.spine_path and "" ~= headConfig.spine_path then
        local head = ResourceManager.Instantiate(headConfig.spine_path)
        for i, v in ipairs(speak_head_actions) do
          SkeletonAnimationUtil.SetAnimation(head, i - 1, v, true)
        end
        SkeletonAnimationUtil.CreateMaterialOverride(head)
        UIUtil.SetObjectToUI(head, NpcHead.NpcHeadLoader.NpcHeadHolder)
      elseif useStaticCard and headConfig.texture_path and "" ~= headConfig.texture_path then
        local path = headConfig.texture_path
        local head = ResourceManager.Instantiate(path)
        UIUtil.SetObjectToUI(head, NpcHead.NpcHeadLoader.NpcHeadHolder, nil, true)
      end
      headName = headConfig.name()
    else
      NpcHead.root.visible = false
    end
    if speak_name and "" ~= speak_name then
      talkCom.TalkWord.NameTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetSpeakNameWordId(selectDialogId))
    else
      talkCom.TalkWord.NameTxt.text = headName
    end
    local middle_text = dialogData.middle_text
    if middle_text and string.len(middle_text) > 0 then
      talkCom.MiddleWord.WordTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetMiddleWordId(selectDialogId))
      talkCom.MiddleWord.root.visible = true
    else
      talkCom.MiddleWord.root.visible = false
    end
    local talk_text = dialogData.talk_text
    if talk_text and string.len(talk_text) > 0 then
      talkCom.TalkWord.WordTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetTalkWordId(selectDialogId))
      talkCom.TalkWord.root.visible = true
    else
      talkCom.TalkWord.root.visible = false
    end
    local narrator_text = dialogData.narrator_text
    if narrator_text and string.len(narrator_text) > 0 then
      talkCom.NarratorWord.WordTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetNarratorWordId(selectDialogId))
      talkCom.NarratorWord.root.visible = true
    else
      talkCom.NarratorWord.root.visible = false
    end
    local explain_text = dialogData.explain_text
    if explain_text and string.len(explain_text) > 0 then
      talkCom.ExplainWord.WordTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetExplainWordId(selectDialogId))
      talkCom.ExplainWord.root.visible = true
    else
      talkCom.ExplainWord.root.visible = false
    end
    local explain_name_text = dialogData.explain_name_text
    if explain_name_text and string.len(explain_name_text) > 0 then
      talkCom.ExplainWord.NameTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetExplainNameWordId(selectDialogId))
      talkCom.ExplainWord.root.visible = true
    else
      talkCom.ExplainWord.root.visible = false
    end
    local option_text = dialogData.option_text
    if option_text and string.len(option_text) > 0 then
      local optionTexts = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetOptionWordId(selectDialogId))
      talkCom.OptionGroup.root.visible = true
      local list = talkCom.OptionGroup.OptionList
      list:RemoveChildrenToPool()
      local optionList = Split(optionTexts, "|")
      for i, v in ipairs(optionList) do
        local hand = list:AddItemFromPool()
        hand:GetChild("Option"):GetChild("WordTxt").text = v
      end
    else
      talkCom.OptionGroup.root.visible = false
    end
    local cg_text = dialogData.cg_text
    local cgWord = talkCom.root:GetChild("CGWord")
    local cg_position_scale
    if cg_text and string.len(cg_text) > 0 then
      if cgWord then
        cgWord.visible = true
      else
        cgWord = UIMgr:CreateComponent("PlotPlay", "CGWord")
        talkCom.root:AddChild(cgWord)
        cgWord.name = "CGWord"
      end
      local cgText = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetCGWordId(selectDialogId))
      cgWord:GetChild("WordTxt").text = cgText
      cg_position_scale = Split((dialogData.cg_position_scale == nil or "" == dialogData.cg_position_scale) and "0:0:10000" or dialogData.cg_position_scale, ":")
      cgWord:SetXY(talkCom.root.width / 2 + tonumber(cg_position_scale[1]), talkCom.root.height / 2 + tonumber(cg_position_scale[2]))
      local cg_scale = tonumber(cg_position_scale[3]) / 10000
      cgWord:SetScale(cg_scale, cg_scale)
    elseif cgWord then
      cgWord.visible = false
    end
    if cgWord then
      if 5 == curDialogEditIndex then
        talkCom.root.touchable = true
        cgWord.draggable = true
      else
        talkCom.root.touchable = false
        cgWord.draggable = false
      end
      cgWord.onDragEnd:Set(function()
        cg_position_scale[1] = math.ceil(cgWord.x - talkCom.root.width / 2)
        cg_position_scale[2] = math.ceil(cgWord.y - talkCom.root.height / 2)
        dialogData.cg_position_scale = table.concat(cg_position_scale, ":")
        PlotPlayEditorData.AddOrUpdateDialog(dialogData)
      end)
    end
    local root = plot_uis.Main.BackGround.root
    if root.numChildren > 1 then
      local last = root:GetChildAt(root.numChildren - 2)
      root:RemoveChild(last, true)
    end
    local bgId
    if sectionData.bg_id and "" ~= sectionData.bg_id then
      bgId = sectionData.bg_id
    elseif dialogData.open_bg_id and "" ~= dialogData.open_bg_id then
      bgId = dialogData.open_bg_id
    end
    if bgId and "" ~= bgId then
      local background = UIMgr:CreateObject("CommonResource", "BackGround")
      local config = TableData.GetConfig(tonumber(bgId), "BasePlotPlayBG")
      if config.path then
        local texture = ResourceManager.LoadTexture(RES_PATH_PREFIX.SINGLE_TEXTURE .. config.path)
        UIUtil.SetLoaderTexture(background:GetChild("BackGroundLoader"), texture)
      elseif config.cg_path then
        local path = RES_PATH_PREFIX.PLOT_CG .. config.cg_path
        local cg = ResourceManager.Instantiate(path)
        RTManager:ShowModelToLoader(background:GetChild("BackGroundLoader"), cg)
        LuaUtil.SetLocalPos(cg, 0, 0, 0)
      end
      root:AddChildAt(background, 0)
      background:Center()
    end
    if dialogData.is_os == PLOT_IS_OS_ENUM.YES then
      plot_uis.Main.BackGround.OsMask.root.visible = true
    else
      plot_uis.Main.BackGround.OsMask.root.visible = false
    end
    local cardComTable = plot_uis.Main.Card
    cardComTable.root:RemoveChildren(0, -1, true)
    for i, roleId in ipairs(role_ids) do
      roleId = tonumber(roleId)
      local config = TableData.GetConfig(roleId, "BasePlotRole")
      local cardShow = UIMgr:CreateObject("PlotPlay", "CardShow")
      cardShow.height = cardShow.height * 2
      cardShow:SetPivot(0, 0.5)
      cardShow.pivotAsAnchor = true
      cardComTable.root:AddChild(cardShow)
      if 2 == curDialogEditIndex then
        cardShow.draggable = true
      else
        cardShow.draggable = false
      end
      local position = Split(role_position[i], ":")
      cardShow.onDragEnd:Set(function()
        position[1] = cardShow.x - cardComTable.root.width / 2 + cardShow.width / 2
        position[2] = -cardShow.y - cardComTable.root.height / 2
        role_position[i] = table.concat(position, ":")
        dialogData.role_position = table.concat(role_position, "|")
        PlotPlayEditorData.AddOrUpdateDialog(dialogData)
      end)
      cardShow:SetXY(cardComTable.root.width / 2 - cardShow.width / 2 + tonumber(position[1] or 0), -cardComTable.root.height / 2 - tonumber(position[2] or 0))
      local model
      if false == useStaticCard and config.spine_path and "" ~= config.spine_path then
        local path = RES_PATH_PREFIX.NPC_SPINE .. config.spine_path
        model = ResourceManager.Instantiate(path)
        UIUtil.SetObjectToUI(model, cardShow:GetChild("CardHolder"))
        cachedModel[roleId] = model
        if false == string.isEmptyOrNil(skin[i]) then
          SkeletonAnimationUtil.SetSkin(model, skin[i])
        end
        if action_timeline[i] then
          CS.DialogTimeline.SetTimeline(model, action_timeline[i], false)
        end
        if blink_timeline[i] then
          CS.DialogTimeline.SetTimeline(model, blink_timeline[i], false)
        end
        if 1 == light_role[i] then
          SkeletonAnimationUtil.TweenColor(model, colorSpeak, 0)
        else
          SkeletonAnimationUtil.TweenColor(model, colorNoSpeak, 0)
        end
      elseif useStaticCard and config.texture_path and "" ~= config.texture_path then
        local path = RES_PATH_PREFIX.NPC_TEXTURE .. config.texture_path
        model = ResourceManager.Instantiate(path)
        UIUtil.SetObjectToUI(model, cardShow:GetChild("CardHolder"), nil, true)
      end
      local tempScale = tonumber(scale[i] or 10000)
      if model then
        LuaUtil.SetScale(model, tempScale / 10000, tempScale / 10000, tempScale / 10000, true)
      end
    end
    local partStart = plot_uis.Main.PartStart
    if dialogData.open_title_1 then
      partStart.WordTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetOpenTitle1WordId(selectDialogId))
    end
    if dialogData.open_title_2 then
      partStart.TitleTxt.text = PlotPlayEditorData.GetWord(PlotPlayEditorData.GetOpenTitle2WordId(selectDialogId))
    end
    if 6 == curDialogEditIndex then
      plot_uis.Main.Card.root.visible = false
      plot_uis.Main.Talk.root.visible = false
      plot_uis.Main.PlotEffect.root.visible = false
      plot_uis.Main.PartStart.root.visible = true
    else
      plot_uis.Main.Card.root.visible = true
      plot_uis.Main.Talk.root.visible = true
      plot_uis.Main.PlotEffect.root.visible = true
      plot_uis.Main.PartStart.root.visible = false
    end
  end
end

function PlotPlayEditorWindow.DisplayDialog()
end

function PlotPlayEditorWindow.OnShown()
end

function PlotPlayEditorWindow.OnHide()
end

function PlotPlayEditorWindow.OnClose()
  popAddAction = nil
  cachedModel = {}
  uis = nil
  contentPane = nil
  plotPlayWindow = nil
  plot_uis = nil
end

function PlotPlayEditorWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.PlotPlayEditor.E_MSG_UPDATE then
    PlotPlayEditorWindow.UpdateInfo()
  end
end

return PlotPlayEditorWindow
