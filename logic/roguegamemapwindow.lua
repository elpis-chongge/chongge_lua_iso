require("RogueBuild01_InsideMapWindowByName")
local RogueGameMapWindow = {}
local uis, contentPane, rogueNodes, nodeObjs, chapterIdCache, scrollingTweenId
local RELATION_STATE = {
  NOT_OPEN = 0,
  UNDERWAY = 1,
  COMPLETE = 2,
  CLOSED = 3,
  SELECTABLE = 4
}
local SelectNode = function(index)
  for i, v in ipairs(nodeObjs) do
    ChangeUIController(v.gobj, "c3", i == index and 1 or 0)
  end
end
local HighlightOrGrayed = function(line, highlight)
  if highlight then
    CS.LineRendererHelper.SetLineColor(line, 1, 1, 1, 1)
  else
    CS.LineRendererHelper.SetLineColor(line, 0.588, 0.588, 0.588, 1)
  end
end
local Highlight = function(fromNode, toNode, highlight)
  local lines = fromNode.lines
  if type(toNode) == "table" and type(highlight) == "boolean" then
    if lines then
      HighlightOrGrayed(lines[toNode.id], highlight)
    end
  elseif type(toNode) == "boolean" and type(highlight) == "nil" and lines then
    for _, line in pairs(lines) do
      HighlightOrGrayed(line, highlight)
    end
  end
end
local ChangeRelationState = function(fromNode, toNode, state_enum)
  local fromNodeObj = fromNode.nodeObj
  local children = fromNode.children
  local numChildren = children and #children
  local toNodeObj = toNode.nodeObj
  local parents = toNode.parents
  local numParents = parents and #parents
  if state_enum == RELATION_STATE.NOT_OPEN then
    Highlight(fromNode, toNode, false)
  elseif state_enum == RELATION_STATE.UNDERWAY then
    Highlight(fromNode, toNode, true)
  elseif state_enum == RELATION_STATE.COMPLETE then
    Highlight(fromNode, toNode, true)
  elseif state_enum == RELATION_STATE.CLOSED then
    Highlight(fromNode, toNode, false)
  elseif state_enum == RELATION_STATE.SELECTABLE then
    Highlight(fromNode, toNode, true)
  end
  if numChildren then
    local i = table.keyof(children, toNode.id, "id")
    local startPoint = fromNodeObj:GetChild(string.format("Right%s_%s", numChildren, i))
    ChangeUIController(startPoint, "c1", state_enum)
  end
  if numParents then
    local i = table.keyof(parents, fromNode.id, "id")
    local endPoint = toNodeObj:GetChild(string.format("Light%s_%s", numParents, i))
    ChangeUIController(endPoint, "c1", state_enum)
  end
end
local UpdateNodeStates = function()
  if nodeObjs then
    local chapterInfo = RogueGameData.GetChapterInfo()
    local curNode = chapterInfo.curNode
    local finishedNodeIdList = chapterInfo.finishedNodeIds
    local curNodeIsNil = nil == curNode or not _G.next(curNode)
    for _, v in ipairs(nodeObjs) do
      local gobj, node = v.gobj, v.node
      if not curNodeIsNil then
        local curNodeId = curNode.nodeId
        local curNodeLayer = RogueGameMgr.GetNodeLayer(curNodeId)
        local finished = RogueGameMgr.IsCurrentNodeFinished()
        if curNodeLayer < node.layer then
          if 1 == node.layer - curNodeLayer then
            local isChild = RogueGameMgr.IsParentChildRelationship(node.id, curNodeId)
            if isChild then
              ChangeUIController(gobj, "c2", finished and 4 or 0)
            else
              ChangeUIController(gobj, "c2", 3)
            end
            UIUtil.SetText(gobj, T(20450), "TipsTxt")
          else
            local reachable = RogueGameMgr.IsReachable(curNode.nodeId, node.id)
            ChangeUIController(gobj, "c2", reachable and 0 or 3)
          end
        elseif curNodeLayer > node.layer then
          if table.keyof(finishedNodeIdList, node.id) then
            ChangeUIController(gobj, "c2", 2)
          else
            ChangeUIController(gobj, "c2", 3)
          end
        elseif node.id == curNode.nodeId then
          ChangeUIController(gobj, "c2", finished and 2 or 1)
          UIUtil.SetText(gobj, T(20451), "TipsTxt")
          if finished then
            ChangeUIController(gobj, "c3", 0)
          else
            ChangeUIController(gobj, "c3", UIMgr:IsWindowOpen(WinResConfig.RogueGameNodeHandleWindow.name) and 1 or 0)
          end
        else
          ChangeUIController(gobj, "c2", 3)
        end
      else
        local latestLayer = RogueGameMgr.GetLatestNodeLayer()
        if latestLayer < node.layer then
          local isNextLayer = 1 == node.layer - latestLayer
          ChangeUIController(gobj, "c2", isNextLayer and 4 or 0)
          UIUtil.SetText(gobj, T(20450), "TipsTxt")
        elseif latestLayer > node.layer then
          if table.keyof(finishedNodeIdList, node.id) then
            ChangeUIController(gobj, "c2", 2)
          else
            ChangeUIController(gobj, "c2", 3)
          end
        end
      end
    end
    for _, v in ipairs(nodeObjs) do
      local node = v.node
      if not curNodeIsNil then
        local parents = node.parents
        local curNodeLayer = RogueGameMgr.GetNodeLayer(curNode.nodeId)
        if curNodeLayer >= node.layer then
          local finished = table.keyof(finishedNodeIdList, node.id)
          if finished then
            if parents then
              for _, parent in ipairs(parents) do
                local parentFinished = table.keyof(finishedNodeIdList, parent.id)
                ChangeRelationState(parent, node, parentFinished and RELATION_STATE.COMPLETE or RELATION_STATE.CLOSED)
              end
            end
          elseif parents then
            local isCurNode = curNode.nodeId == node.id
            for _, parent in ipairs(parents) do
              local parentFinished = table.keyof(finishedNodeIdList, parent.id)
              ChangeRelationState(parent, node, parentFinished and isCurNode and RELATION_STATE.UNDERWAY or RELATION_STATE.CLOSED)
            end
          end
        elseif RogueGameMgr.IsReachable(curNode.nodeId, node.id) then
          for _, parent in ipairs(parents) do
            if parent.id == curNode.nodeId then
              local state = RogueGameMgr.IsCurrentNodeFinished() and RELATION_STATE.SELECTABLE or RELATION_STATE.NOT_OPEN
              ChangeRelationState(parent, node, state)
            else
              for _, child in ipairs(parent.children) do
                ChangeRelationState(parent, child, RogueGameMgr.IsReachable(curNode.nodeId, parent.id) and RELATION_STATE.NOT_OPEN or RELATION_STATE.CLOSED)
              end
            end
          end
        elseif parents then
          for _, parent in ipairs(parents) do
            ChangeRelationState(parent, node, RELATION_STATE.CLOSED)
          end
        end
      else
        local children = node.children
        if children then
          for _, child in ipairs(children) do
            ChangeRelationState(node, child, RELATION_STATE.NOT_OPEN)
          end
        end
      end
    end
  end
end
local UpdateLayerState = function()
  local parent = uis.Main.Layer
  local chapterInfo = RogueGameData.GetChapterInfo()
  local layerIndex = chapterInfo.layerIndex
  local triggerHideLayer = chapterInfo.triggerHideLayer
  parent.c1Ctr.selectedIndex = layerIndex - 1
  parent.c2Ctr.selectedIndex = triggerHideLayer and 1 or 0
  for i = 1, 5 do
    local dot = parent.root:GetChild(string.format("Dot%s", i))
    if i < layerIndex then
      ChangeUIController(dot, "c1", 0)
    elseif i > layerIndex then
      ChangeUIController(dot, "c1", 2)
    else
      ChangeUIController(dot, "c1", 1)
      UIUtil.SetText(dot, TableData.GetConfig(chapterInfo.chapterId, "BaseRogueChapter").name(), "WordTxt")
    end
  end
  if triggerHideLayer then
    local dot = parent.root:GetChild("DotSp")
    if layerIndex > 6 then
      ChangeUIController(dot, "c1", 0)
    elseif layerIndex < 6 then
      ChangeUIController(dot, "c1", 2)
    else
      ChangeUIController(dot, "c1", 1)
      UIUtil.SetText(dot, TableData.GetConfig(chapterInfo.chapterId, "BaseRogueChapter").name(), "WordTxt")
    end
  end
end
local Local2WorldPosition = function(obj, localPosition)
  local stageCam = StageCamera.main
  local screenPos = obj:LocalToGlobal(localPosition)
  return stageCam:ScreenToWorldPoint(Vector3(screenPos.x, Screen.height - screenPos.y, -stageCam.transform.position.z))
end
local ObjCenter2WorldPosition = function(gobj)
  return Local2WorldPosition(gobj, Vector2(gobj.width * 0.5, gobj.height * 0.5))
end
local NODE_CONTAINER_NAME = "ROGUE_NODES_ROOT"
local GenNodes = function(nodes)
  nodeObjs = {}
  local list = uis.Main.MapList.MapList
  local container = list:GetChild(NODE_CONTAINER_NAME)
  if not container then
    container = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Component)
    container.displayObject.gameObject.name = NODE_CONTAINER_NAME
    container.name = NODE_CONTAINER_NAME
    list:AddChild(container)
  end
  local maxLayer = -1
  for _, node in ipairs(nodes) do
    maxLayer = math.max(maxLayer, node.layer)
  end
  container.size = Vector2(maxLayer * RogueGameDefine.NODE_WIDTH + (maxLayer - 1) * (RogueGameDefine.NODE_GAP_X - RogueGameDefine.NODE_WIDTH) + RogueGameDefine.PADDING_X * 2, RogueGameDefine.MAX_HEIGHT)
  container:RemoveChildren(0, -1, true)
  local chapterInfo = RogueGameData.GetChapterInfo()
  local themeInfo = RogueGameData.GetThemeInfo()
  local themeConf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
  local difficultyConf = RogueMgr.GetDifficultyData(themeConf.group_id, themeInfo.curDifficultyLevel)
  for _, node in ipairs(nodes) do
    local conf = node.conf
    local nodeType = conf.type
    local resname
    if nodeType == RogueGameNodeType.BATTLE_NORMAL then
      resname = "InsideMapEvent_Battle1"
    elseif nodeType == RogueGameNodeType.BATTLE_ENCOUNTER then
      resname = "InsideMapEvent_Battle2"
    elseif nodeType == RogueGameNodeType.BATTLE_BOSS then
      resname = "InsideMapEvent_Battle3"
    elseif nodeType == RogueGameNodeType.SUPPLY then
      resname = "InsideMapEvent_Camp"
    elseif nodeType == RogueGameNodeType.SHOP then
      resname = "InsideMapEvent_Shop"
    elseif nodeType == RogueGameNodeType.EVENT then
      resname = "InsideMapEvent_Plot"
    end
    local nodeObj = UIMgr:CreateObject("RogueBuild01", resname)
    container:AddChild(nodeObj)
    node.nodeObj = nodeObj
    table.insert(nodeObjs, {gobj = nodeObj, node = node})
    local objIndex = #nodeObjs
    local subname = string.format("%s %s", difficultyConf.name(), T(20465 + chapterInfo.layerIndex))
    UIUtil.SetText(nodeObj, subname, "WordTxt")
    UIUtil.SetText(nodeObj, conf.name(), "NameTxt")
    nodeObj:SetXY(node.__x, node.__y - 0.5 * RogueGameDefine.NODE_HEIGHT)
    local numParents = node.parents and #node.parents or 0
    local numChildren = node.children and #node.children or 0
    ChangeUIController(nodeObj, "Light1", 1 == numParents and 1 or 0)
    ChangeUIController(nodeObj, "Light2", 2 == numParents and 1 or 0)
    ChangeUIController(nodeObj, "Light3", 3 == numParents and 1 or 0)
    ChangeUIController(nodeObj, "Right1", 1 == numChildren and 1 or 0)
    ChangeUIController(nodeObj, "Right2", 2 == numChildren and 1 or 0)
    ChangeUIController(nodeObj, "Right3", 3 == numChildren and 1 or 0)
    nodeObj.onClick:Set(function()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
      RogueGameMgr.PrepareHandleNode(node.id, function()
        SelectNode(objIndex)
      end, function()
        SelectNode(-1)
      end)
    end)
  end
  for _, v in ipairs(nodeObjs) do
    local node = v.node
    local nodeObj = v.gobj
    local children = node.children
    local numChildren = children and #children or 0
    if numChildren > 0 then
      for i = 1, numChildren do
        local child = children[i]
        local startPoint = nodeObj:GetChild(string.format("Right%s_%s", numChildren, i))
        local childParents, childNodeObj = child.parents, child.nodeObj
        local numParents = #childParents
        local j = table.keyof(childParents, node.id, "id")
        local endPoint = childNodeObj:GetChild(string.format("Light%s_%s", numParents, j))
        if nodeObj.y == childNodeObj.y and startPoint.y ~= endPoint.y then
          local diff = endPoint.y - startPoint.y
          for k = 1, numChildren do
            local point = nodeObj:GetChild(string.format("Right%s_%s", numChildren, k))
            point.y = point.y + diff
          end
        end
      end
    end
  end
  for _, v in ipairs(nodeObjs) do
    local node = v.node
    local nodeObj = v.gobj
    local children = node.children
    local numChildren = children and #children or 0
    if numChildren > 0 then
      for i = 1, numChildren do
        local child = children[i]
        local line = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Rogue/line.prefab")
        local lineRenderer = line:GetComponent(typeof(CS.UnityEngine.LineRenderer))
        lineRenderer.useWorldSpace = false
        lineRenderer.startWidth = 0.4
        lineRenderer.endWidth = 0.4
        local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
        local debug_name = string.format("%s->%s", node.id, child.id)
        container:AddChild(holder)
        local wrapper = UIUtil.SetObjectToUI(line, holder)
        wrapper.gameObject.name = debug_name
        line.name = debug_name
        line.transform.localPosition = Vector3.zero
        node.lines = node.lines or {}
        node.lines[child.id] = line
        local startPoint = nodeObj:GetChild(string.format("Right%s_%s", numChildren, i))
        local childParents, childNodeObj = child.parents, child.nodeObj
        local j = table.keyof(childParents, node.id, "id")
        local numParents = #childParents
        local endPoint = childNodeObj:GetChild(string.format("Light%s_%s", numParents, j))
        local p0 = startPoint:TransformPoint(Vector2(startPoint.width * 0.5, startPoint.height * 0.5), container)
        local p1 = endPoint:TransformPoint(Vector2(endPoint.width * 0.5, endPoint.height * 0.5), container)
        local screenCenter = (p0 + p1) * 0.5
        holder:SetXY(screenCenter.x, screenCenter.y)
        local center = Local2WorldPosition(container, screenCenter)
        local matrix = line.transform.worldToLocalMatrix
        local scale = Vector3(matrix.m00, matrix.m11, matrix.m22)
        local diff_start = ObjCenter2WorldPosition(startPoint) - center
        local startPosition = Vector3(diff_start.x * scale.x, diff_start.y * scale.y, diff_start.z * scale.z)
        local diff_end = ObjCenter2WorldPosition(endPoint) - center
        local endPosition = Vector3(diff_end.x * scale.x, diff_end.y * scale.y, diff_end.z * scale.z)
        local diff = endPosition - startPosition
        local startOffset = Vector3(diff.x * 0.585, 0, 0)
        local endOffset = Vector3(-diff.x * 0.585, 0, 0)
        CS.LineRendererHelper.DrawCurve(line, startPosition, startPosition + startOffset, endPosition + endOffset, endPosition, 20)
      end
    end
  end
end
local BgItemRenderer = function(i, gcmp)
end
local OnScrollCallback = function()
  local bglist = uis.Main.BgList
  local child = bglist:GetChildAt(0)
  local bgWidth = child.width
  local maplist = uis.Main.MapList.MapList
  local maxX = bgWidth - bglist.width
  bglist.container.x = -maplist.scrollPane.percX * maxX
end
local UpdateNodes = function()
  local bglist = uis.Main.BgList
  local chapterInfo = RogueGameData.GetChapterInfo()
  local conf = TableData.GetConfig(chapterInfo.chapterId, "BaseRogueChapter")
  bglist.defaultItem = UIUtil.GetResUrl(conf.back_ground)
  bglist.itemRenderer = BgItemRenderer
  bglist:RemoveChildrenToPool()
  bglist.numItems = 1
  rogueNodes = RogueGameMgr.BuildNodes(chapterInfo.chapterId)
  GenNodes(rogueNodes)
  local maplist = uis.Main.MapList.MapList
  maplist.scrollPane.onScroll:Set(OnScrollCallback)
  chapterIdCache = chapterInfo.chapterId
end
local ScrollToLatestNode = function(anim)
  local list = uis.Main.MapList.MapList
  local scrollpane = list.scrollPane
  local chapterInfo = RogueGameData.GetChapterInfo()
  local curNode = chapterInfo.curNode
  if curNode then
    local nodeId = curNode.nodeId
    local nodeInfo = RogueGameMgr.GetNodeInfo(nodeId)
    local x
    if curNode.finished and nodeInfo.children then
      local child = nodeInfo.children[1]
      x = child.__x
    else
      x = nodeInfo.__x
    end
    if scrollingTweenId then
      LeanTween.cancel(scrollingTweenId)
    end
    x = x - RogueGameDefine.PADDING_X
    if anim then
      scrollingTweenId = LeanTween.value(scrollpane.posX, x, 0.45):setEase(LeanTweenType.easeInOutQuad):setOnUpdate(function(value)
        scrollpane.posX = value
        OnScrollCallback()
      end).id
    else
      scrollpane:SetPosX(x, false)
    end
  else
    scrollpane:SetPosX(0, false)
  end
end
local DisplayGuideIfNecessary = function()
  if UIMgr:IsWindowOpen(WinResConfig.RogueGameStartWindow.name) then
    return
  end
  local data = TableData.GetConfig(FEATURE_ENUM.ROGUE_GAME_MAP, "BaseFeature")
  if data.auto_open_caption and GuideData.CanShowCaption(data.id) then
    uis.Main.root.touchable = false
    LeanTween.delayedCall(0.25, function()
      uis.Main.FunctionDetailsBtn.onClick:Call()
      uis.Main.root.touchable = true
    end)
    GuideData.SaveCaptionOpen(data.id)
  end
end

function RogueGameMapWindow.ReInitData()
end

function RogueGameMapWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameMapWindow.package, WinResConfig.RogueGameMapWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideMapWindowUis(contentPane)
    local openStartWindow = bridgeObj.argTable[1]
    if openStartWindow then
      uis.Main.root.visible = false
      OpenWindow(WinResConfig.RogueGameStartWindow.name)
      bridgeObj.argTable[1] = false
    elseif RogueGameMgr.__display_battle_node_rewards then
      RogueGameMgr.__display_battle_node_rewards = false
      if RogueGameMgr.DisplayCurrentNodeRewardsIfNecessary() then
        uis.Main.root.visible = false
      end
    end
    RogueGameMapWindow.UpdateInfo()
    RogueGameMapWindow.InitBtn()
  end)
end

function RogueGameMapWindow.UpdateInfo()
  local chapterInfo = RogueGameData.GetChapterInfo()
  if nil == chapterIdCache or chapterIdCache ~= chapterInfo.chapterId then
    UpdateNodes()
  end
  UpdateLayerState()
  UpdateNodeStates()
  ScrollToLatestNode(RogueGameMgr.__node_change_anim)
  RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root)
  RogueGameMgr.UI_SetAssetList(uis.Main.AssetsList)
  RogueGameMgr.UI_SetFunctionDetailsBtn(FEATURE_ENUM.ROGUE_GAME_MAP, uis.Main.FunctionDetailsBtn, uis.Main.root, true)
end

function RogueGameMapWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueGameMapWindow.name)
  end)
end

function RogueGameMapWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.RogueGameMapWindow.name) then
    local chapterInfo = RogueGameData.GetChapterInfo()
    if nil == chapterIdCache or chapterIdCache ~= chapterInfo.chapterId then
      UpdateNodes()
    end
    UpdateLayerState()
    UpdateNodeStates()
    ScrollToLatestNode(RogueGameMgr.__node_change_anim)
    RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root)
  end
end

function RogueGameMapWindow.OnClose()
  uis.Main.MapList.MapList:RemoveChildren(0, -1, true)
  uis = nil
  contentPane = nil
  chapterIdCache = nil
  nodeObjs = nil
  rogueNodes = nil
  if scrollingTweenId then
    LeanTween.cancel(scrollingTweenId)
  end
  scrollingTweenId = nil
end

function RogueGameMapWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    uis.Main.AssetsList.numItems = 2
  elseif msgId == WindowMsgEnum.RogueGame.START_GAME then
    uis.Main.root.visible = true
    DisplayGuideIfNecessary()
  elseif msgId == WindowMsgEnum.RogueGame.EXIT_REWARD_PANEL then
    uis.Main.root.visible = true
  end
end

return RogueGameMapWindow
