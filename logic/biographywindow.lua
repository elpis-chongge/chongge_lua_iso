require("Biography_BiographyByName")
BiographyWindow = {}
local uis, contentPane, curData
local animName = {
  "idle01",
  "idle01",
  "idle02"
}
local cirrusPrefab, maxLv, curFlowerIndex, flowerCom, curBtnPage, awardEffect, isChange
local posOff = {
  {0.4, 0.6},
  {-0.2, 0.35},
  {-0.44, 0.7},
  {0.39, 0.27},
  {0.04, 0.78},
  {0.21, 1.1},
  {0.45, 0.29},
  {-0.38, 0.6},
  {0.28, 0.38},
  {-0.29, 0.59},
  {0.01, 0.41},
  {0.01, -0.16},
  {-0.39, 0.6},
  {0.46, 0.89}
}
local curPlantInfo

function BiographyWindow.OnInit(com, id)
  uis = GetBiography_BiographyUis(com)
  uis.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_BIOGRAPHY)
  BiographyWindow.LoadSpine()
  BiographyWindow.Init(id)
  BiographyWindow.InitBtn()
end

function BiographyWindow.InitData()
  local data = TableData.GetTable("BaseBiography")
  local tb = {}
  for i, v in pairs(data) do
    table.insert(tb, v)
  end
  return tb
end

function BiographyWindow.LoadSpine()
  local path = "Assets/Art/Models/UI_spine/prefab/ui_spine_plant01_tengman/ui_spine_plant01_tengman.prefab"
  local obj = UIUtil.SetEffectToUI(path, uis.FullScreen.SpineHolder)
  LuaUtil.SetLocalPos(obj, 685, -960, 0)
  LuaUtil.SetScale(obj, 100, 100, 100)
  cirrusPrefab = obj
  awardEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/flower/FX_ui_flower_check.prefab", uis.FullScreen.EffectHolder)
  LuaUtil.SetScale(awardEffect, 22, 22, 22)
  SkeletonAnimationUtil.AddEvent(cirrusPrefab, BiographyWindow.PlayFlowerAnim)
end

function BiographyWindow.PlayFlowerAnim(track, event)
  local nameArr = Split(event.Data.Name, "_")
  if nameArr and 2 == #nameArr then
    local i = tonumber(nameArr[2])
    if i then
      local transform = cirrusPrefab.transform:Find("AutoCreate_ponit_hua_" .. LuaUtil.FormatNum(i, "00"))
      if nil == curPlantInfo then
        curPlantInfo = BiographyData.GetInfoByPlantId(curData.id)
      end
      if transform then
        SkeletonAnimationUtil.SetAnimation(transform.gameObject, 0, animName[curPlantInfo.flowers[curData.child_ids[i]]], false)
        if 14 == i and curFlowerIndex then
          awardEffect.gameObject:SetActive(true)
        end
      end
    end
  end
end

function BiographyWindow.UpdateFlower()
  curFlowerIndex = nil
  local width = 100
  curPlantInfo = BiographyData.GetInfoByPlantId(curData.id)
  for i = 1, 14 do
    local transform = cirrusPrefab.transform:Find("AutoCreate_ponit_hua_" .. LuaUtil.FormatNum(i, "00"))
    if transform then
      local com = BiographyWindow.GetFlowerBtn(i)
      com:SetPivot(0.5, 0.5)
      com:SetSize(width, width)
      uis.FullScreen.root:AddChild(com)
      com.displayObject.cachedTransform.position = transform.position
      local pos = com.displayObject.cachedTransform.localPosition
      com.displayObject.cachedTransform.localPosition = Vector3(pos.x - width / 2, pos.y + width / 2, pos.z)
      com.onClick:Set(function()
        if curPlantInfo and curPlantInfo.flowers[curData.child_ids[i]] and curPlantInfo.flowers[curData.child_ids[i]] == ProtoEnum.FLOWER_STATE.FS_OPEN and curFlowerIndex and curFlowerIndex == i then
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.FLOWER_ON_CLICK)
          BiographyService.RewardFlowerReq(curData.id, curData.child_ids[i])
        end
      end)
      if isChange then
        SkeletonAnimationUtil.SetAnimation(transform.gameObject, 0, animName[1], false)
      end
      if curPlantInfo and curPlantInfo.flowers[curData.child_ids[i]] and 0 ~= curPlantInfo.flowers[curData.child_ids[i]] and curPlantInfo.flowers[curData.child_ids[i]] == ProtoEnum.FLOWER_STATE.FS_OPEN and not curFlowerIndex then
        curFlowerIndex = i
        awardEffect.transform.position = transform.position
        LuaUtil.SetLocalPos(awardEffect.transform:Find("FX_ui_flower_check_grp").gameObject, posOff[i][1], posOff[i][2], 0)
      end
    end
  end
  if nil == curFlowerIndex and awardEffect then
    awardEffect.gameObject:SetActive(false)
  end
end

function BiographyWindow.GetFlowerBtn(index)
  if nil == flowerCom then
    flowerCom = {}
  end
  if nil == flowerCom[index] then
    flowerCom[index] = UIMgr:CreateObject("CommonResource", "TouchScreenBtn")
    flowerCom[index].alpha = 0
  end
  return flowerCom[index]
end

function BiographyWindow.Init(id)
  if id then
    curBtnPage = BiographyData.GetIndexByPlantId(id)
  end
  curBtnPage = curBtnPage or 1
  BiographyWindow.ShowPlantList()
  BiographyWindow.InitTaskInfo()
end

function BiographyWindow.InitTaskInfo()
  local taskData = TableData.GetConfig(BiographyData.plantInfo.dailyTask.taskId, "BaseTask")
  if taskData then
    UIUtil.SetText(uis.TaskBtn, taskData.name(), "NameTxt")
    local arr = GetConfigItemList(taskData.reward, true)
    if #arr > 0 then
      UIUtil.ShowItemFrame(arr[1].id, uis.TaskBtn:GetChild("Item"), arr[1].value, nil, function()
        if BiographyData.plantInfo.dailyTask.state ~= ProtoEnum.TASK_STATE.FINISHED then
          UIUtil.CommonItemClickCallback(arr[1].id, arr[1].type)
        end
      end)
    end
    maxLv = taskData.task_parameter[1]
    local GoToBtn = uis.TaskBtn:GetChild("GoToBtn")
    if GoToBtn and taskData.go_to_id then
      local featureData = TableData.GetConfig(taskData.go_to_id, "BaseFeature")
      if featureData then
        CurrencyReturnWindow.SetJumpFun(GoToBtn, featureData)
      end
    end
    BiographyWindow.RefreshTask()
  end
end

function BiographyWindow.ShowPlantList()
  curData = TableData.GetConfig(BiographyData.plantInfo.plantList[curBtnPage].plantId, "BaseBiography")
  isChange = true
  awardEffect.gameObject:SetActive(false)
  SkeletonAnimationUtil.SetAnimation(cirrusPrefab, 0, "begin", false, function()
    SkeletonAnimationUtil.SetAnimation(cirrusPrefab, 0, "idle", true)
  end)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.FLOWER_ENTER)
  BiographyWindow.UpdateFlower()
  BiographyWindow.ShowPageBtn()
  isChange = false
end

function BiographyWindow.ShowPageBtn()
  local len = #BiographyData.plantInfo.plantList
  uis.LeftBtn.visible = curBtnPage > 1
  uis.RightBtn.visible = len > curBtnPage
end

function BiographyWindow.RefreshTask()
  if BiographyData.plantInfo.dailyTask.state == ProtoEnum.TASK_STATE.FINISHED then
    ChangeUIController(uis.TaskBtn, "c1", 1)
    UIUtil.SetText(uis.TaskBtn, T(723, BiographyData.plantInfo.dailyTask.value, maxLv), "NameNumberTxt")
  elseif BiographyData.plantInfo.dailyTask.state == ProtoEnum.TASK_STATE.REWARD then
    ChangeUIController(uis.TaskBtn, "c1", 2)
  else
    UIUtil.SetText(uis.TaskBtn, T(888, BiographyData.plantInfo.dailyTask.value, maxLv), "NameNumberTxt")
    ChangeUIController(uis.TaskBtn, "c1", 0)
  end
  UIUtil.SetBtnText(uis.TaskBtn:GetChild("CompleteTips"), T(10912), T(10913))
end

function BiographyWindow.InitBtn()
  uis.TaskBtn.onClick:Set(function()
    if BiographyData.plantInfo.dailyTask.state == ProtoEnum.TASK_STATE.FINISHED then
      BiographyService.RewardPlantTaskReq(BiographyData.plantInfo.dailyTask.uid)
    end
  end)
  uis.LeftBtn.onClick:Set(function()
    curBtnPage = curBtnPage - 1
    if curBtnPage > 0 then
      BiographyWindow.ShowPlantList()
    end
  end)
  uis.RightBtn.onClick:Set(function()
    curBtnPage = curBtnPage + 1
    if #BiographyData.plantInfo.plantList >= curBtnPage then
      BiographyWindow.ShowPlantList()
    end
  end)
end

function BiographyWindow.PlayFlowerByIndex()
  local transform = cirrusPrefab.transform:Find("AutoCreate_ponit_hua_" .. LuaUtil.FormatNum(curFlowerIndex, "00"))
  if transform then
    SkeletonAnimationUtil.SetAnimation(transform.gameObject, 0, animName[3], false)
  end
end

function BiographyWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.CarnivalWindow.GET_FLOWER_TASK then
    BiographyWindow.RefreshTask()
  elseif msgId == WindowMsgEnum.CarnivalWindow.GET_FLOWER then
    BiographyWindow.PlayFlowerByIndex()
    BiographyWindow.UpdateFlower()
  elseif msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    BiographyService.GetPlantInfoReq(function()
      BiographyWindow.InitTaskInfo()
      FloatTipsUtil.ShowWarnTips(T(1058))
    end)
  end
end

function BiographyWindow.OnHide()
  for i = 1, 14 do
    local transform = cirrusPrefab.transform:Find("AutoCreate_ponit_hua_" .. LuaUtil.FormatNum(i, "00"))
    if transform then
      SkeletonAnimationUtil.SetAnimation(transform.gameObject, 0, animName[1], false)
    end
  end
  awardEffect.gameObject:SetActive(false)
end

function BiographyWindow.OnShow()
  SkeletonAnimationUtil.SetMix(cirrusPrefab, "begin", "idle", 0.5)
  SkeletonAnimationUtil.SetAnimation(cirrusPrefab, 0, "begin", false, function()
    SkeletonAnimationUtil.SetAnimation(cirrusPrefab, 0, "idle", true)
  end)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.FLOWER_ENTER)
end

function BiographyWindow.OnClose()
  curPlantInfo = nil
  ResourceManager.DestroyGameObject(cirrusPrefab, false)
  uis = nil
  contentPane = nil
  cirrusPrefab = nil
  curData = nil
  maxLv = nil
  curFlowerIndex = nil
  flowerCom = nil
end

return BiographyWindow
