require("InitialEnergy_InitialEnergyByName")
InitialEnergyWindow = {}
local uis, rewards
local UpdateRedDot = function()
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
end
local RewardItemRenderer = function(i, gcmp)
  local rewardConf = rewards[i]
  local rewardId = rewardConf.id
  UIUtil.SetText(gcmp, rewardConf.name(), "NameTxt")
  UIUtil.SetText(gcmp, rewardConf.remark(), "TimeTxt")
  local inTime = DailySupplyMgr.InTime(rewardId)
  local alreadyGot = DailySupplyMgr.AlreadyGot(rewardId)
  local energyPic = gcmp:GetChild("EnergyPic")
  local picLoader = energyPic:GetChild("PicLoader")
  picLoader.url = UIUtil.GetResUrl(rewardConf.icon)
  local pimg = gcmp:GetChild("PointImage")
  if pimg then
    pimg.visible = inTime
  end
  if inTime then
    uis.WordTxt.text = rewardConf.des()
  end
  local energyNumber = gcmp:GetChild("EnergyNumber")
  UIUtil.SetText(energyNumber, T(20348, Split(rewardConf.reward[1], ":")[3]), "NumberTxt")
  if alreadyGot then
    local holder = energyPic:GetChild("EffectHolder")
    if holder.displayObject ~= nil then
      holder:SetNativeObject(nil)
    end
    ChangeUIController(gcmp, "c1", 3)
    ChangeUIController(energyNumber, "c1", 3)
    UIUtil.SetText(gcmp:GetChild("EnergyGet"), T(20253), "WordTxt")
  elseif inTime then
    local holder = energyPic:GetChild("EffectHolder")
    if holder.displayObject == holder.shape or holder.displayObject == nil then
      local eff = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_strength_get.prefab", holder, 1)
      eff.transform.localPosition = Vector3.zero
      LuaUtil.PlayEffect(eff)
      holder.sortingOrder = picLoader.sortingOrder + 1
    end
    ChangeUIController(gcmp, "c1", 2)
    ChangeUIController(energyNumber, "c1", 2)
    UIUtil.SetText(gcmp:GetChild("EnergyNow"), T(20254), "WordTxt")
    gcmp.onClick:Set(function()
      if DailySupplyMgr.AlreadyGot(rewardId) then
        FloatTipsUtil.ShowWarnTips(T(20301))
        return
      end
      DailySupplyService.RewardSupplyReq(rewardId, false, UpdateRedDot)
    end)
  else
    local holder = energyPic:GetChild("EffectHolder")
    if holder.displayObject ~= nil then
      holder:SetNativeObject(nil)
    end
    gcmp.onClick:Clear()
    ChangeUIController(gcmp, "c1", 0)
    ChangeUIController(energyNumber, "c1", 0)
  end
end
local CompareById_ASC = function(x, y)
  return x.id < y.id
end
local InitPanel = function()
  local bg = TableData.GetConfig(11104, "BaseFeature").back_ground
  uis.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(bg)
  local configTbl = TableData.GetTable("BaseActivityVitGet")
  rewards = {}
  for i, v in pairs(configTbl) do
    table.insert(rewards, v)
  end
  table.sort(rewards, CompareById_ASC)
  local num = #rewards
  for i = 1, num do
    RewardItemRenderer(i, uis.root:GetChild(string.format("EnergyTips%s", i)))
  end
end
local timer
local StartRewardGetCheckTimer = function()
  timer = TimerUtil.setInterval(1, -1, function()
    local num = #rewards
    for i = 1, num do
      RewardItemRenderer(i, uis.root:GetChild(string.format("EnergyTips%s", i)))
    end
  end)
end

function InitialEnergyWindow.OnInit(com, param)
  uis = GetInitialEnergy_InitialEnergyUis(com)
  InitPanel()
  StartRewardGetCheckTimer()
end

function InitialEnergyWindow.OnShow()
end

function InitialEnergyWindow.OnHide()
end

function InitialEnergyWindow.OnClose()
  uis = nil
  rewards = nil
  if timer then
    timer:stop()
  end
  timer = nil
end

function InitialEnergyWindow.HandleMessage(msgId, param)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    DailySupplyService.GetSupplyInfoReq()
  end
end
