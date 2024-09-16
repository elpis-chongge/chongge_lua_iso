require("InitialSign_InitialSignAutoWindowByName")
require("InitialSign_SignItemByName")
local InitialSignAutoWindow = {}
local uis, contentPane, item, bg, signInData, SceneRoot, signIndex, signSceneCamera, rewardData

function InitialSignAutoWindow.ReInitData()
end

function InitialSignAutoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.InitialSignAutoWindow.package, WinResConfig.InitialSignAutoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetInitialSign_InitialSignAutoWindowUis(contentPane)
    InitialSignAutoWindow.InitBtn()
    TimerUtil.setTimeout(0.05, function()
      InitialSignAutoWindow.UpdateInfo()
    end)
  end)
end

function InitialSignAutoWindow.UpdateInfo()
  UIUtil.SetText(uis.Main.root, T(1015), "WordTxt")
  local activateData = TableData.GetConfig(ACTIVITY_ID.INITIAL_SIGN, "BaseActivity")
  signInData = SignData.activityData[activateData.id]
  if activateData and activateData.parameter and signInData then
    rewardData = SignData.GetSignData(tonumber(activateData.parameter))
    local signObj = GameObject.Find("Sign")
    if signObj then
      SceneRoot = signObj.transform:Find("SignRoot")
      if SceneRoot then
        SceneRoot = SceneRoot.gameObject
      end
      signSceneCamera = signObj.transform:Find("SignCamera")
      if signSceneCamera then
        signSceneCamera = signSceneCamera.gameObject:GetComponent(typeof(CS.UnityEngine.Camera))
        local cameraTouchRotation = signSceneCamera:GetComponent(typeof(CS.TouchRotation))
        cameraTouchRotation.enable = false
        bg = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/NewGuyCheckin/FX_ui_NewGuycheckin_back.prefab", LAYER_NAME_ENUM.SIGN)
        bg.transform:SetParent(SceneRoot.transform)
        bg.transform.localPosition = Vector3(0, 0, -12.85)
        local background = LuaUtil.FindChild(bg.transform, "NewGuysCheckIn_background", true)
        if background then
          background.gameObject:SetActive(false)
        end
        local light = LuaUtil.FindChild(bg.transform, "qifen (3)", true)
        if light then
          light.gameObject:SetActive(false)
        end
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
            TimerUtil.setTimeout(0.7, function()
              if uis then
                ChangeUIController(uis.Main.root, "GetReward", 0)
              end
            end)
          else
            if tempDay == day then
              TimerUtil.setTimeout(0.7, function()
                if uis then
                  ChangeUIController(uis.Main.root, "GetReward", 1)
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
        signSceneCamera.gameObject:SetActive(true)
        SceneRoot:SetActive(true)
        LuaUtil.SetCameraTargetTextureToLoader(signSceneCamera, uis.Main.BgLoader)
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
      uis.Main.TouchScreenBtn.onClick:Set(function()
        if UIMgr:IsWindowOpen(WinResConfig.InitialSignAutoWindow.name) then
          if signInData.isTodaySignIn == false then
            SignService.ActivitySignInReq(activateData.id, function(msg)
              GetItemTips.Show(msg.rewards, nil, function()
                UIMgr:CloseWindow(WinResConfig.InitialSignAutoWindow.name)
              end)
              InitialSignAutoWindow.UpdateUI()
            end)
          elseif signInData.isTodaySignIn then
            UIMgr:CloseWindow(WinResConfig.InitialSignAutoWindow.name)
          end
        end
      end)
    end
  end
end

function InitialSignAutoWindow.UpdateUI()
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

function InitialSignAutoWindow.QuitDestroy()
  if signSceneCamera then
    signSceneCamera.targetTexture = nil
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

function InitialSignAutoWindow.InitBtn()
end

function InitialSignAutoWindow.OnClose()
  uis = nil
  contentPane = nil
  SceneRoot = nil
  InitialSignAutoWindow.QuitDestroy()
  ResourceManager.DestroyGameObject(bg)
  bg = nil
  signInData = nil
  FunctionQueueUtil.SetFunEnd("InitialSign9")
end

return InitialSignAutoWindow
