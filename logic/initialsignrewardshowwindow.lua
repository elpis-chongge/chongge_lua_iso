require("InitialSign_RewardShowWindowByName")
local InitialSignRewardShowWindow = {}
local uis, contentPane, msg

function InitialSignRewardShowWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.InitialSignRewardShowWindow.package, WinResConfig.InitialSignRewardShowWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetInitialSign_RewardShowWindowUis(contentPane)
    msg = bridgeObj.argTable[1]
    InitialSignRewardShowWindow.Init()
    InitialSignRewardShowWindow.InitBtn()
  end)
end

function InitialSignRewardShowWindow.Init()
  local rewardData = SignData.GetSignData(msg.type)
  local list = uis.Main.RewardShowList.RewardList
  local day = msg.signInData.curDay
  if msg.signInData.isTodaySignIn == false then
    day = msg.signInData.curDay + 1
  end
  local dayStr = ""
  
  function list.itemRenderer(i, item)
    local data = rewardData[i + 1]
    local tips = item:GetChild("ShowItemTips")
    tips.alpha = 0
    local index = 1
    dayStr = LuaUtil.FormatNum(data.day, "00")
    UIUtil.SetText(tips, dayStr, "DayTxt")
    UIUtil.SetText(tips, dayStr, "Day1Txt")
    UIUtil.SetText(tips, T(755), "WordTxt")
    item.onClick:Clear()
    if day > data.day then
      ChangeUIController(tips, "c1", 2)
    elseif day == data.day then
      if msg.signInData.isTodaySignIn then
        ChangeUIController(tips, "c1", 2)
      else
        ChangeUIController(tips, "c1", 1)
        item.onClick:Set(function()
          SignService.ActivitySignInReq(msg.id, function(rspMsg)
            FunctionQueueUtil.Remove("InitialSign9")
            GetItemTips.Show(rspMsg.rewards)
            msg.signInData.isTodaySignIn = true
            msg.signInData.curDay = msg.signInData.curDay + 1
            InitialSignRewardShowWindow.Init()
            InitialSignWindow.UpdateUI()
          end)
        end)
      end
    else
      ChangeUIController(tips, "c1", 0)
      index = 0
    end
    InitialSignRewardShowWindow.ShowReward(tips:GetChild("ItemList"), data.reward, index)
    PlayUITrans(item, "in", nil, i * 0.05)
    TimerUtil.setTimeout(i * 0.05, function()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TASK_LIST_IN)
    end)
  end
  
  list.numItems = #rewardData
  if day > 5 then
    list:ScrollToView(8)
  end
end

function InitialSignRewardShowWindow.ShowReward(list, reward, index)
  local arr = GetConfigItemList(reward, true)
  
  function list.itemRenderer(i, item)
    UIUtil.SetIconById(item:GetChild("ItemLoader"), arr[i + 1].id)
    UIUtil.SetText(item, arr[i + 1].value, "NumberTxt")
    ChangeUIController(item, "c1", index)
    item.onClick:Set(function()
      UIUtil.CommonItemClickCallback(arr[i + 1].id, arr[i + 1].type)
    end)
  end
  
  list.numItems = #arr
end

function InitialSignRewardShowWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.InitialSignRewardShowWindow.name)
  end)
end

function InitialSignRewardShowWindow.HandleMessage(msgId, para)
end

function InitialSignRewardShowWindow.OnClose()
  uis = nil
  contentPane = nil
  UIMgr:SendWindowMessage(WinResConfig.CarnivalWindow.name, WindowMsgEnum.SignWindow.SHOW_INIT_SIGN)
end

return InitialSignRewardShowWindow
