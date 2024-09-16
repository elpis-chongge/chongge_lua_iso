require("BossDungeonWood_BossDungeonWindowByName")
local BossDungeonWoodWindow = {}
local uis, contentPane, chapterId, jumpTb

function BossDungeonWoodWindow.ReInitData()
end

function BossDungeonWoodWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BossDungeonWoodWindow.package, WinResConfig.BossDungeonWoodWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBossDungeonWood_BossDungeonWindowUis(contentPane)
    chapterId = bridgeObj.argTable[1]
    BossDungeonWoodWindow.UpdateInfo()
    BossDungeonWoodWindow.InitBtn()
  end)
end

function BossDungeonWoodWindow.UpdateInfo()
  UIUtil.SetHolderCenter(uis.Main.BossMain.BackGround.BackGroundHolder)
  local fire = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Bosschallenge/FX_ui_bosschallengeop_wood.prefab", uis.Main.BossMain.BackGround.BackGroundHolder)
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

function BossDungeonWoodWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.BossDungeonWoodWindow.name, uis.Main.BossMain.CurrencyReturn, FEATURE_ENUM.ADVENTURE_BOSS)
end

function BossDungeonWoodWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  chapterId = nil
end

return BossDungeonWoodWindow
