require("DailyTask_DailyRewardListWindowByName")
local DailyRewardListWindow = {}
local uis, contentPane

function DailyRewardListWindow.ReInitData()
end

function DailyRewardListWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.DailyRewardListWindow.package, WinResConfig.DailyRewardListWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetDailyTask_DailyRewardListWindowUis(contentPane)
    DailyRewardListWindow.UpdateInfo()
    DailyRewardListWindow.InitBtn()
  end)
end

function DailyRewardListWindow.UpdateInfo()
  local dailyRewardList = DailyTaskData.GetDailyReward()
  local list = uis.Main.DailyRewardList1.RewardList
  list:RemoveChildrenToPool()
  local curDailyItem = DailyTaskData.GetDailyItem()
  for i, v in ipairs(dailyRewardList) do
    if v.isGot == false and curDailyItem >= v.config.unlock_points then
      v.sortIndex = 3
    elseif v.isGot == false then
      v.sortIndex = 2
    else
      v.sortIndex = 1
    end
  end
  table.sort(dailyRewardList, function(a, b)
    if a.sortIndex == b.sortIndex then
      return a.config.unlock_points < b.config.unlock_points
    else
      return a.sortIndex > b.sortIndex
    end
  end)
  
  function list.itemRenderer(index, item)
    local data = dailyRewardList[index + 1]
    item:GetChild("NumberTxt").text = data.config.unlock_points
    local rewardList = item:GetChild("RewardList")
    rewardList:RemoveChildrenToPool()
    local reward = data.config.reward
    
    function rewardList.itemRenderer(rewardIndex, rewardItem)
      local rewardStr = reward[rewardIndex + 1]
      rewardStr = Split(rewardStr, ":")
      local itemConfig = TableData.GetConfigByType(tonumber(rewardStr[1]), tonumber(rewardStr[2]))
      rewardItem:GetChild("ItemLoader").url = UIUtil.GetResUrl(itemConfig.icon)
      rewardItem:GetChild("NumberTxt").text = rewardStr[3]
      ChangeUIController(rewardItem, "c1", itemConfig.quality)
      if 1 == data.sortIndex then
        ChangeUIController(rewardItem, "c2", 1)
      else
        ChangeUIController(rewardItem, "c2", 0)
      end
      rewardItem.onClick:Set(function()
        UIUtil.CommonItemClickCallback(tonumber(rewardStr[2]), tonumber(rewardStr[1]))
      end)
    end
    
    rewardList.numItems = #reward
    local wordTxt = item:GetChild("WordTxt")
    if 1 == data.sortIndex then
      wordTxt.text = T(10916)
      ChangeUIController(item, "c1", 2)
    elseif 2 == data.sortIndex then
      wordTxt.text = T(10918)
      ChangeUIController(item, "c1", 0)
    elseif 3 == data.sortIndex then
      wordTxt.text = T(10917)
      ChangeUIController(item, "c1", 1)
    end
    item:GetChild("GetBtn").onClick:Set(function()
      DailyTaskService.CommonTaskRewardReq(data.config.type, data.config.id)
    end)
  end
  
  list.numItems = #dailyRewardList
end

function DailyRewardListWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(DailyRewardListWindow.Close)
  uis.Main.DailyRewardList1.CloseBtn.onClick:Set(DailyRewardListWindow.Close)
end

function DailyRewardListWindow.Close()
  UIMgr:CloseWindow(WinResConfig.DailyRewardListWindow.name)
end

function DailyRewardListWindow.OnClose()
  uis = nil
  contentPane = nil
end

function DailyRewardListWindow.HandleMessage(msgId)
  if msgId == WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE then
    DailyRewardListWindow.UpdateInfo()
  elseif msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    DailyTaskService.GetCommonTaskInfoReq(function()
      FloatTipsUtil.ShowWarnTips(T(1058))
    end)
  end
end

return DailyRewardListWindow
