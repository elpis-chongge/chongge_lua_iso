require("Message_OpalExchangeWindowByName")
local OpalExchangeWindow = {}
local uis, contentPane, num, closeFun, itemInfo, wordId

function OpalExchangeWindow.ReInitData()
end

function OpalExchangeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.OpalExchangeWindow.package, WinResConfig.OpalExchangeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_OpalExchangeWindowUis(contentPane)
    num = bridgeObj.argTable[1] or 1
    closeFun = bridgeObj.argTable[2]
    wordId = bridgeObj.argTable[3] or 990
    OpalExchangeWindow.UpdateInfo()
    OpalExchangeWindow.InitBtn()
  end)
end

function OpalExchangeWindow.UpdateInfo()
  local addArr = GetDiamondConvertValue()
  if addArr and addArr.value and wordId then
    uis.Main.Rename1.WordTxt.text = T(wordId, num, num * addArr.value)
  end
  UIUtil.SetIconById(uis.Main.Rename1.Pic1Loader, COMMON_ITEM_ID.RECHARGE_DIAMOND)
  UIUtil.SetIconById(uis.Main.Rename1.Pic2Loader, COMMON_ITEM_ID.BIND_DIAMOND)
end

function OpalExchangeWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.OpalExchangeWindow.name)
end

function OpalExchangeWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(OpalExchangeWindow.CloseWindow)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_Opal.BtnGroup.root, {
    touchCallback = function()
      itemInfo = ActorData.GetItemInfoById(COMMON_ITEM_ID.RECHARGE_DIAMOND)
      if nil == itemInfo or itemInfo.count < num then
        OpenWindow(WinResConfig.DiamondWindow.name, nil, true)
        return
      end
      ld("Bag", function()
        BagService.UseItemReq(itemInfo.itemUid, num, nil, function(msg)
          if closeFun then
            closeFun()
          else
            GetItemTips.Show(msg.items)
          end
          OpalExchangeWindow.CloseWindow()
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GACHA)
        end)
      end)
    end
  }, {
    touchCallback = OpalExchangeWindow.CloseWindow
  })
end

function OpalExchangeWindow.OnClose()
  uis = nil
  contentPane = nil
  num = nil
  closeFun = nil
  itemInfo = nil
  wordId = nil
end

return OpalExchangeWindow
