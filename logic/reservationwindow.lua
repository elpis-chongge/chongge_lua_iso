require("Reservation_ReservationWindowByName")
local ReservationWindow = {}
local uis, contentPane

function ReservationWindow.ReInitData()
end

function ReservationWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ReservationWindow.package, WinResConfig.ReservationWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetReservation_ReservationWindowUis(contentPane)
    ReservationWindow.UpdateInfo()
    ReservationWindow.InitBtn()
  end)
end

function ReservationWindow.GetStamp(stamp)
  local arrTime = TimeUtil.FormatDate("%H-%M-%S", stamp)
  local time = Split(arrTime, "-")
  local h, m, s
  local rh = 5
  local offNum = 0
  if time and 3 == #time then
    h = tonumber(time[1])
    m = tonumber(time[2])
    s = tonumber(time[3])
    if rh < h then
      offNum = (h - rh) * 3600
      if m > 0 then
        offNum = offNum + m * 60
      end
      offNum = offNum + s
    elseif h == rh then
      if m > 0 then
        offNum = offNum + m * 60
      end
      offNum = offNum + s
    elseif rh > h then
      offNum = (24 - (rh - h)) * 3600
      local mTime = 0
      if m > 0 then
        mTime = mTime + m * 60
      end
      mTime = mTime + s
      offNum = offNum + mTime
    end
  end
  return stamp - offNum
end

function ReservationWindow.UpdateInfo()
  local tips = uis.Main.Tips
  local data = SignData.GetReservationData()
  if data and 2 == #data.gift_reward_ids then
    local giftInfo = ShopData.GetGiftInfoById(data.id)
    if giftInfo then
      local teamStamp = ReservationWindow.GetStamp(giftInfo.getStamp)
      local time = math.floor(LoginData.GetCurServerTime() - teamStamp)
      tips.Lock.WordTxt.text = T(1466)
      if time > 0 then
        local hours = math.floor(time / 3600)
        local day = math.floor(hours / 24)
        if day >= 1 then
          tips.Lock.WordTxt.text = T(1467)
        end
      end
      local oneDayId = data.gift_reward_ids[1]
      local threeDayId = data.gift_reward_ids[2]
      UIUtil.SetText(tips.GetBtn, T(1385))
      tips.GetBtn.onClick:Set(function()
        ShopService.GetGiftRewardReq(giftInfo.giftId, threeDayId, function(msg)
          GetItemTips.Show(msg.goods, true, function()
            if ShopData.canRewards and table.contain(ShopData.canRewards, oneDayId) then
              ShopService.GetGiftRewardReq(giftInfo.giftId, oneDayId, function(msg)
                GetItemTips.Show(msg.goods, true)
                UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.CLOSE_RESERVATION_GIFT)
                ReservationWindow.TouchClose()
              end)
            end
          end)
          UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.CLOSE_RESERVATION_GIFT)
          local showBol = SignData.CanShowReservation()
          if not showBol then
            ReservationWindow.TouchClose()
          end
        end)
      end)
      local rewardData = TableData.GetConfig(threeDayId, "BaseGiftReward")
      if rewardData then
        local arr = GetConfigItemList(rewardData.rewards, true)
        if arr[1] then
          tips.CardLookBtn.onClick:Set(function()
            UIUtil.OpenPreviewTips(arr[1].id, arr[1].type)
          end)
        end
      end
      if ShopData.canRewards and table.contain(ShopData.canRewards, threeDayId) then
        ChangeController(tips.c2Ctr, 1)
      else
        ChangeController(tips.c2Ctr, 0)
      end
      tips.RewardGetBtn.onClick:Set(function()
        if ShopData.canRewards and table.contain(ShopData.canRewards, oneDayId) then
          ShopService.GetGiftRewardReq(giftInfo.giftId, oneDayId, function(msg)
            GetItemTips.Show(msg.goods, true)
            UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.CLOSE_RESERVATION_GIFT)
            if uis then
              ChangeController(tips.c1Ctr, 1)
            end
          end)
        end
      end)
      ChangeController(tips.c1Ctr, table.contain(giftInfo.rewards, oneDayId) and 1 or 0)
    end
  end
end

function ReservationWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.ReservationWindow.name)
end

function ReservationWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(ReservationWindow.TouchClose)
  uis.Main.Tips.CloseBtn.onClick:Add(ReservationWindow.TouchClose)
end

function ReservationWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ReservationWindow
