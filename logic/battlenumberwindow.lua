require("Arena_BattleNumberWindowByName")
local BattleNumberWindow = {}
local uis, contentPane, arg

function BattleNumberWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BattleNumberWindow.package, WinResConfig.BattleNumberWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetArena_BattleNumberWindowUis(contentPane)
    arg = bridgeObj.argTable[1]
    BattleNumberWindow.Init()
    BattleNumberWindow.InitBtn()
    BattleNumberWindow.InitTips()
  end)
end

function BattleNumberWindow.Init()
  if arg and arg.text then
    uis.Main.BattleNumber1.WordTxt.htmlObjAutolayout = true
    uis.Main.BattleNumber1.WordTxt.text = arg.text
  end
end

function BattleNumberWindow.InitTips()
  if arg and arg.arr then
    UIUtil.InitAssetsTips(uis.Main.BattleNumber1.AssetsTipsList, {
      arg.arr.id
    })
  end
end

function BattleNumberWindow.InitBtn()
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = function()
      if arg and arg.arr then
        if ActorData.GetItemCount(arg.arr.id) >= arg.arr.value then
          if arg.callBack then
            arg.callBack()
          end
        elseif arg.arr.id == COMMON_ITEM_ID.BIND_DIAMOND then
          OpenWindow(WinResConfig.MainOpalExchangeWindow.name)
          return
        else
          local itemConfig = TableData.GetConfig(arg.arr.id, "BaseItem")
          if itemConfig then
            FloatTipsUtil.ShowWarnTips(T(366, itemConfig.name()))
          end
        end
      end
    end
  }, {
    touchCallback = function()
      UIMgr:CloseWindow(WinResConfig.BattleNumberWindow.comName)
    end
  })
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BattleNumberWindow.comName)
  end)
end

function BattleNumberWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    BattleNumberWindow.InitTips()
  end
end

function BattleNumberWindow.OnClose()
  uis = nil
  contentPane = nil
  arg = nil
end

return BattleNumberWindow
