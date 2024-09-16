require("GMCommand_GMByName")
local GMPopup = {}
local uis, contentPane

function GMPopup.ReInitData()
end

function GMPopup.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.GMPopup.package, WinResConfig.GMPopup.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGMCommand_GMUis(contentPane)
    GMPopup.UpdateInfo()
    GMPopup.InitBtn()
  end)
end

function GMPopup.UpdateInfo()
  uis.Title1Txt.text = "指令输入"
  uis.Title2Txt.text = "指令选择"
  UIUtil.SetText(uis.SureBtn, "发送", "WordTxt")
  uis.OtherList:RemoveChildrenToPool()
  local btnList = {
    {
      name = "战斗测试",
      onClick = GMPopup.ClickBattleTest
    }
  }
  for i, v in ipairs(btnList) do
    local btn = uis.OtherList:AddItemFromPool()
    UIUtil.SetText(btn, v.name)
    btn.onClick:Add(v.onClick)
  end
end

function GMPopup.ClickBattleTest()
  ld("Battle", function()
    if BattleMgr.isTestBalance == true then
      _G.BattleTestBalance = nil
      package.loaded.BattleTestBalance = nil
      require("BattleTestBalance")
      BattleMgr.isBattleServer = true
      StartTest()
      return
    else
      _G.BattleDataTest = nil
      package.loaded.BattleDataTest = nil
      require("BattleDataTest")
      if true == TestNvsN then
        StartTest()
        return
      end
    end
    BattleMgr.InitBattle()
    UIMgr:CloseWindow(WinResConfig.GMPopup.name)
  end)
end

function GMPopup.ActorGmReq(command, params)
  local msg = {}
  msg.params = params
  msg.command = command
  Net.Send(Proto.MsgName.ActorGmReq, msg)
end

function GMPopup.InitBtn()
  uis.SureBtn.onClick:Set(function()
    local str = uis.WordTxt.text
    local gmList = Split(str, "|")
    for i, gm in ipairs(gmList) do
      local strSplit = Split(gm, ",")
      if #strSplit > 0 then
        local prefix = strSplit[1]
        if not string.find(prefix, "abyss") then
          local params = {}
          for i = 2, #strSplit do
            table.insert(params, strSplit[i])
          end
          GMPopup.ActorGmReq(strSplit[1], params)
        elseif AbyssExploreMgr and AbyssExploreMgr.Exists() then
          local module = "AbyssExploreLocalTestSupport"
          local result, o = pcall(require, module)
          if result and o and type(o.LocalTest) == "function" then
            o.LocalTest(strSplit)
          end
        end
      end
    end
  end)
end

function GMPopup.OnShown()
end

function GMPopup.OnHide()
end

function GMPopup.OnClose()
  uis = nil
  contentPane = nil
end

function GMPopup.HandleMessage(msgId, para)
end

return GMPopup
