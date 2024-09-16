require("InitialSign_InitialSignByName")
require("InitialSign_SignItemByName")
InitialSignWindow = {}
local sign, activateData, rewardData, signSceneCamera, item, bg, signInData, SceneRoot, signIndex

function InitialSignWindow.OnInit(com, data)
  sign = GetInitialSign_InitialSignUis(com)
  activateData = data
  signInData = SignData.activityData[activateData.id]
  InitialSignWindow.InitBtn()
  rewardData = SignData.GetSignData(tonumber(activateData.parameter))
  InitialSignWindow.Init()
end

function InitialSignWindow.Init()
  sign.SignTips.WordTxt.text = T(957)
  UIUtil.SetText(sign.root, T(1015), "NumberTxt")
  local signObj = GameObject.Find("Sign")
  InitialSignWindow.ShowSceneBg(true)
  if signObj then
    SceneRoot = signObj.transform:Find("SignRoot")
    if SceneRoot then
      SceneRoot = SceneRoot.gameObject
    end
    signSceneCamera = signObj.transform:Find("SignCamera")
    if signSceneCamera then
      local cameraTouchRotation = signSceneCamera:GetComponent(typeof(CS.TouchRotation))
      cameraTouchRotation.enable = false
      bg = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/NewGuyCheckin/FX_ui_NewGuycheckin_back.prefab", LAYER_NAME_ENUM.SIGN)
      bg.transform:SetParent(SceneRoot.transform)
      bg.transform.localPosition = Vector3(0, 0, -12.85)
      local background = LuaUtil.FindChild(bg.transform, "NewGuysCheckIn_background", true)
      if background then
        background.gameObject:SetActive(true)
      end
      local light = LuaUtil.FindChild(bg.transform, "qifen (3)", true)
      if light then
        light.gameObject:SetActive(true)
      end
      signSceneCamera = signSceneCamera.gameObject
      signSceneCamera.transform.localEulerAngles = Vector3(0, 180, 0)
    end
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SIGN_ENTER)
    item = {}
    local day = signInData.curDay
    if false == signInData.isTodaySignIn then
      day = signInData.curDay + 1
    end
    local ind = {
      9,
      8,
      7,
      6,
      5,
      4,
      3,
      2,
      1
    }
    local right = false
    local page = 1
    local len = 9
    if day < 5 then
      len = len - (5 - day)
      page = 1
    elseif day > 5 then
      len = len - (day - 5)
      right = true
    end
    local start = 9 - (len - 1)
    local tempDay, point
    for i = start, 9 do
      item[i] = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/NewGuyCheckin/paper_skin.prefab", LAYER_NAME_ENUM.SIGN)
      UIMgr:PlayAlphaChangeAnimIn(item[i])
      item[i].transform:SetParent(SceneRoot.transform)
      AnimatorHelper.SetAnimator(string.format("Assets/Art/Animation/Sign/paper_skin %s.controller", right and ind[page] or ind[i]), item[i])
      tempDay = right and 9 - ind[page] + start or page
      LuaUtil.ChangeTextureValue(item[i], "_NumberTex", string.format("Assets/Art/TextureSingle/Sign/NGCI_%d.png", tempDay))
      local arr = GetConfigItemList(rewardData[tempDay].reward, true)
      for ii = 1, #arr do
        point = item[i].transform:Find("Bone050"):Find("point" .. ii)
        if day > tempDay then
          LuaUtil.ChangeTextureValue(item[i], string.format("_Iocn%dTex", ii), string.format("Assets/Art/TextureSingle/Sign/%s.png", "21000003"))
          point.gameObject:SetActive(false)
        elseif tempDay == day and signInData.isTodaySignIn then
          LuaUtil.ChangeTextureValue(item[i], string.format("_Iocn%dTex", ii), string.format("Assets/Art/TextureSingle/Sign/%s.png", "21000003"))
          point.gameObject:SetActive(false)
          if sign then
            ChangeUIController(sign.root, "GetReward", 0)
          end
        else
          if tempDay == day then
            TimerUtil.setTimeout(0.7, function()
              if sign then
                ChangeUIController(sign.root, "GetReward", 1)
                PlayUITrans(sign.root, "Switch")
              end
            end)
          end
          if nil == signIndex then
            signIndex = i
          end
          local uiPanel = point:GetComponent(typeof(FairyGUI.UIPanel))
          local signItem = GetInitialSign_SignItemUis(uiPanel.ui)
          if signItem then
            UIUtil.SetIconById(signItem.ItemLoader, arr[ii].id)
            signItem.NumberTxt.text = arr[ii].value
          end
          point.gameObject:SetActive(true)
        end
      end
      page = page + 1
    end
    if SceneRoot then
      signSceneCamera:SetActive(true)
      SceneRoot:SetActive(true)
    end
    for i = start, 9 do
      point = LuaUtil.FindChild(item[i].transform, "point1", true)
      point:SetParent(item[i].transform)
      point.rotation = Quaternion(0, 0, 0, 0)
      point:SetParent(item[i].transform:Find("Bone050"))
      point = LuaUtil.FindChild(item[i].transform, "point2", true)
      point:SetParent(item[i].transform)
      point.rotation = Quaternion(0, 0, 0, 0)
      point:SetParent(item[i].transform:Find("Bone050"))
    end
    if day > 0 and day < 10 and signIndex then
      local mesh_paper = item[signIndex]
      local collider = mesh_paper.gameObject:GetOrAddComponent(typeof(CS.UnityEngine.BoxCollider))
      local size = 0.4
      collider.size = Vector3(size, size, size)
      local ce = mesh_paper.gameObject:GetOrAddComponent(typeof(CS.ClickEvent))
      
      function ce.clickFunc()
        if not UIMgr:IsWindowOpen(WinResConfig.CarnivalWindow.name) then
          return
        end
        if signInData.isTodaySignIn == false then
          SignService.ActivitySignInReq(activateData.id, function(rspMsg)
            FunctionQueueUtil.Remove("InitialSign9")
            GetItemTips.Show(rspMsg.rewards)
            InitialSignWindow.UpdateUI()
            ChangeUIController(sign.root, "GetReward", 0)
          end)
        end
      end
    end
  end
end

function InitialSignWindow.UpdateUI()
  signInData.isTodaySignIn = true
  signInData.curDay = signInData.curDay + 1
  if signIndex then
    for i = 1, 2 do
      local point = item[signIndex].transform:Find("Bone050"):Find("point" .. i)
      point.gameObject:SetActive(false)
      LuaUtil.ChangeTextureValue(item[signIndex], string.format("_Iocn%dTex", i), string.format("Assets/Art/TextureSingle/Sign/%s.png", "21000003"))
    end
  end
end

function InitialSignWindow.ShowSceneBg(bol)
  if SceneRoot then
    if bol then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SIGN_ENTER)
    end
    SceneRoot:SetActive(bol)
    if signSceneCamera then
      signSceneCamera.transform.localEulerAngles = Vector3(0, 180, 0)
      signSceneCamera.gameObject:SetActive(bol)
    end
    if signInData.isTodaySignIn == false then
      if bol then
        TimerUtil.setTimeout(0.7, function()
          if sign then
            ChangeUIController(sign.root, "GetReward", 1)
            PlayUITrans(sign.root, "Switch")
          end
        end)
      elseif sign then
        ChangeUIController(sign.root, "GetReward", 0)
      end
    end
  end
end

function InitialSignWindow.QuitHide()
  if signSceneCamera then
    signSceneCamera.gameObject:SetActive(false)
    signSceneCamera = nil
  end
  if item then
    for i, v in pairs(item) do
      ResourceManager.DestroyGameObject(v, false)
    end
    item = nil
  end
end

function InitialSignWindow.InitBtn()
  sign.RewardShowBtn.onClick:Set(function()
    if signInData then
      OpenWindow(WinResConfig.InitialSignRewardShowWindow.name, nil, {
        type = tonumber(activateData.parameter),
        signInData = signInData,
        id = activateData.id
      })
    end
  end)
  UIUtil.SetText(sign.RewardShowBtn, T(1327), "WordTxt")
end

function InitialSignWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
  elseif msgId == WindowMsgEnum.SignWindow.SHOW_INIT_SIGN and signSceneCamera then
    signSceneCamera.transform.localEulerAngles = Vector3(0, 180, 0)
    signSceneCamera.gameObject:SetActive(true)
  end
end

function InitialSignWindow.OnClose()
  InitialSignWindow.ShowSceneBg(false)
  SceneRoot = nil
  sign = nil
  InitialSignWindow.QuitHide()
  ResourceManager.DestroyGameObject(bg)
  bg = nil
  signInData = nil
end

return InitialSignWindow
