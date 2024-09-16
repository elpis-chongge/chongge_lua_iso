require("BossDungeonWater_BossDungeonWindowByName")
local BossDungeonWaterWindow = {}
local uis, contentPane, chapterId, jumpTb

function BossDungeonWaterWindow.ReInitData()
end

function BossDungeonWaterWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BossDungeonWaterWindow.package, WinResConfig.BossDungeonWaterWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBossDungeonWater_BossDungeonWindowUis(contentPane)
    chapterId = bridgeObj.argTable[1]
    BossDungeonWaterWindow.UpdateInfo()
    BossDungeonWaterWindow.InitBtn()
  end)
end

function BossDungeonWaterWindow.UpdateInfo()
  UIUtil.SetHolderCenter(uis.Main.BossMain.BackGround.BackGroundHolder)
  local fire = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Bosschallenge/FX_ui_bosschallengeop_water.prefab", uis.Main.BossMain.BackGround.BackGroundHolder)
  local grp = LuaUtil.FindChild(fire.transform, "control_grp", true)
  if chapterId and #chapterId > 0 then
    local btn = {
      uis.Main.BossMain.Enter1Btn,
      uis.Main.BossMain.Enter2Btn
    }
    local trans = uis.Main.root:GetTransition("out1")
    for i = 1, #chapterId do
      btn[i].onClick:Set(function()
        if trans then
          trans:ClearHooks()
          trans:SetHook("Sign", function()
            BossDungeonMgr.playInAnim = true
            BossDungeonMgr.OpenBossBattleWindow(chapterId[i])
          end)
          trans:Play()
        end
      end)
    end
  end
end

function BossDungeonWaterWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.BossDungeonWaterWindow.name, uis.Main.BossMain.CurrencyReturn, FEATURE_ENUM.ADVENTURE_BOSS)
end

function BossDungeonWaterWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  chapterId = nil
end

return BossDungeonWaterWindow
