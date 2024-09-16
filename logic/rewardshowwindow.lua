require("Message_RewardShowWindowByName")
local RewardShowWindow = {}
local contain = table.contain
local uis, contentPane, info

function RewardShowWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RewardShowWindow.package, WinResConfig.RewardShowWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_RewardShowWindowUis(contentPane)
    info = bridgeObj.argTable[1]
    RewardShowWindow.InitBtn()
    RewardShowWindow.Init()
  end)
end

function RewardShowWindow.Init()
  if info.reward then
    local arr = GetConfigItemList(info.reward, true)
    local item
    for i, v in pairs(arr) do
      item = UIMgr:CreateObject("CommonResource", "ItemFrame")
      UIUtil.ShowItemFrame(v.id, item, v.value)
      uis.Main.RewardShow1.ItemList:AddChild(item)
    end
  end
  if info.titleText then
    uis.Main.RewardShow1.c1Ctr.selectedIndex = info.titleText and 1 or 0
    uis.Main.RewardShow1.WordTxt.text = info.titleText
  end
end

function RewardShowWindow.InitBtn()
  if info.rewardChapterId and info.sceneType then
    UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
      touchCallback = function()
        AdventureService.FetchSceneChapterRewardReq(info.rewardChapterId, info.sceneType)
        UIMgr:CloseWindow(WinResConfig.RewardShowWindow.name)
        if info.closeFun then
          info.closeFun()
        end
      end,
      titleText = T(332),
      subTitleText = T(333)
    })
  else
    uis.Main.TouchScreenBtn.onClick:Set(function()
      UIMgr:CloseWindow(WinResConfig.RewardShowWindow.name)
    end)
    UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
      touchCallback = function()
        UIMgr:CloseWindow(WinResConfig.RewardShowWindow.name)
      end
    })
  end
end

function RewardShowWindow.HandleMessage(msgId, para)
end

function RewardShowWindow.OnClose()
  uis = nil
  contentPane = nil
  info = nil
end

return RewardShowWindow
