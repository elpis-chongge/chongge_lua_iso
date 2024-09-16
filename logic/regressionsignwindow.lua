require("RegressionSign_SignWindowByName")
local RegressionSignWindow = {}
local uis, contentPane, signData, data

function RegressionSignWindow.ReInitData()
end

function RegressionSignWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RegressionSignWindow.package, WinResConfig.RegressionSignWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRegressionSign_SignWindowUis(contentPane)
    data = bridgeObj.argTable[1]
    if data then
      uis.Main.Sign1.Pic1Loader.url = data.picUrl
      signData = SignData.GetSignData(data.activityCheckInType)
      RegressionSignWindow.UpdateInfo()
      UIUtil.SetText(uis.Main.Sign1.root, T(566, TimeUtil.FormatDate("%Y/%m/%d %H:%M", data.baseInfo.endStamp)), "TimeTxt")
    end
    RegressionSignWindow.InitBtn()
  end)
end

function RegressionSignWindow.UpdateInfo()
  local selectedIndex = 0
  local list = uis.Main.Sign1.Module1.RewardList
  
  function list.itemRenderer(i, item)
    RegressionSignWindow.ShowReward(signData[i + 1].reward, item:GetChild("ItemList"))
    ChangeUIController(item, "c2", 1 == #signData[i + 1].reward and 0 or 1)
    RegressionSignWindow.SetDayTips(item:GetChild("ColorTips"), LuaUtil.FormatNum(signData[i + 1].day, "00"))
    RegressionSignWindow.SetDayTips(item:GetChild("GreenTips"), LuaUtil.FormatNum(signData[i + 1].day, "00"))
    if signData[i + 1].day <= data.signDay then
      ChangeUIController(item, "c1", 2)
      UIUtil.SetBtnText(item, T(944), T(945))
    elseif signData[i + 1].day <= data.returnDay then
      selectedIndex = i
      ChangeUIController(item, "c1", 1)
    elseif signData[i + 1].day > data.returnDay then
      ChangeUIController(item, "c1", 0)
    end
  end
  
  list.numItems = #signData
  list:ScrollToView(selectedIndex)
  if data.returnDay > data.signDay then
    list.onClick:Set(function()
      if LoginData.GetCurServerTime() >= data.baseInfo.endStamp then
        FloatTipsUtil.ShowWarnTips(T(1618))
        RegressionSignWindow.CloseWindow()
        return
      end
      SignService.ActivityReturnSignInReq(data.returnDay, function(msg)
        GetItemTips.Show(msg.rewards, nil, function()
          RegressionSignWindow.CloseWindow()
        end)
        data.signDay = msg.returnAct.signDay
      end)
    end)
  end
end

function RegressionSignWindow.ShowReward(reward, list)
  local arr = GetConfigItemList(reward, true)
  
  function list.itemRenderer(i, item)
    UIUtil.ShowItemFrame(arr[i + 1].id, item, arr[i + 1].value)
  end
  
  list.numItems = #arr
end

function RegressionSignWindow.SetDayTips(item, day)
  UIUtil.SetText(item, day, "NumberTxt")
  UIUtil.SetText(item, day, "NumberDecTxt")
end

function RegressionSignWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(RegressionSignWindow.CloseWindow)
  uis.Main.Sign1.Close1Btn.onClick:Set(RegressionSignWindow.CloseWindow)
end

function RegressionSignWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.RegressionSignWindow.name)
end

function RegressionSignWindow.OnClose()
  uis = nil
  contentPane = nil
  if data then
    FunctionQueueUtil.SetFunEnd(tostring(data.baseInfo.activityId))
  end
  data = nil
  signData = nil
end

return RegressionSignWindow
