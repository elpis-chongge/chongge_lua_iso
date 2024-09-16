require("InitialLevelReward_InitialLevelRewardByName")
InitialLevelRewardWindow = {}
local uis, giftInfo, rewardLvData, lockLv, giftSpine, endIndex

function InitialLevelRewardWindow.OnInit(com)
  uis = GetInitialLevelReward_InitialLevelRewardUis(com)
  local rewardId = InitialLevelRewardWindow.GetCurRewardId()
  uis.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.LV_GIFT)
  if rewardId and giftInfo then
    rewardLvData = TableData.GetConfig(rewardId, "BaseGiftReward")
    local arr = GetConfigItemList(rewardLvData.condition)
    if arr[CONDITION_ENUM.LV] then
      lockLv = arr[CONDITION_ENUM.LV].value
      InitialLevelRewardWindow.LoadBgTexture()
      LeanTween.delayedCall(1, function()
        if uis then
          InitialLevelRewardWindow.InitInfo()
          PlayUITrans(uis.root, "in")
        end
      end)
    end
  end
end

function InitialLevelRewardWindow.Next()
  local rewardId = InitialLevelRewardWindow.GetCurRewardId()
  if rewardId and giftInfo then
    rewardLvData = TableData.GetConfig(rewardId, "BaseGiftReward")
    local arr = GetConfigItemList(rewardLvData.condition)
    if arr[CONDITION_ENUM.LV] then
      lockLv = arr[CONDITION_ENUM.LV].value
      InitialLevelRewardWindow.InitInfo()
    end
  end
end

function InitialLevelRewardWindow.GetCurRewardId()
  local data = CarnivalData.GetLvGiftData()
  if data and data.gift_reward_ids then
    giftInfo = ShopData.GetGiftInfoById(data.id)
    if giftInfo then
      for i = 1, #data.gift_reward_ids do
        if not table.contain(giftInfo.rewards, data.gift_reward_ids[i]) then
          endIndex = i == #data.gift_reward_ids
          return data.gift_reward_ids[i]
        end
      end
      endIndex = true
      return data.gift_reward_ids[#data.gift_reward_ids]
    end
  end
end

function InitialLevelRewardWindow.LoadBgTexture()
  if nil == giftSpine then
    giftSpine = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/FX_ui_LevelGift.prefab", uis.PicHolder)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TASK_LV_REWARD_IN)
    SkeletonAnimationUtil.SetAnimation(giftSpine.transform:GetChild(0).gameObject, 0, "in", false, 0, function()
    end)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/LevelUpGift/FX_ui_levelupgift.prefab", uis.EffectHolder)
  end
end

function InitialLevelRewardWindow.InitInfo()
  uis.LetterContent.TitleTxt.text = T(1076)
  
  function uis.LetterContent.WordList.itemRenderer(i, item)
    UIUtil.SetText(item, T(1077, ActorData.GetLevel()), "WordTxt")
  end
  
  uis.LetterContent.WordList.numItems = 1
  uis.LetterReward.ConditionWordTxt.text = T(1078, lockLv)
  uis.LetterReward.Word1Btn.onClick:Set(function()
    ShopService.GetGiftRewardReq(giftInfo.giftId, rewardLvData.id, function(msg)
      if #msg.goods > 0 then
        uis.LetterReward.root.alpha = endIndex and 1 or 0
        uis.LetterContent.root.alpha = endIndex and 1 or 0
        uis.LetterReward.root.touchable = false
        GetItemTips.Show(msg.goods, true, function()
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
          if endIndex then
            InitialLevelRewardWindow.Next()
            uis.LetterReward.root.touchable = true
          else
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TASK_LV_REWARD_OUT)
            SkeletonAnimationUtil.SetAnimation(giftSpine.transform:GetChild(0).gameObject, 0, "out", false, 0, function()
              LeanTween.delayedCall(1, function()
                if uis then
                  InitialLevelRewardWindow.Next()
                  PlayUITrans(uis.root, "Switch", function()
                    uis.LetterReward.root.touchable = true
                  end)
                end
              end)
              SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TASK_LV_REWARD_IN)
              SkeletonAnimationUtil.SetAnimation(giftSpine.transform:GetChild(0).gameObject, 0, "in", false, 0, function()
              end)
            end)
          end
        end)
      end
    end)
  end)
  UIUtil.SetText(uis.LetterReward.Word1Btn, T(332))
  uis.LetterReward.Word2.WordTxt.text = T(1079)
  
  function uis.LetterReward.ItemList.itemRenderer(i, item)
    InitialLevelRewardWindow.ShowOneReward(rewardLvData.rewards[i + 1], item)
  end
  
  uis.LetterReward.ItemList.numItems = #rewardLvData.rewards
  if ActorData.GetLevel() >= lockLv then
    if table.contain(giftInfo.rewards, rewardLvData.id) then
      ChangeController(uis.LetterReward.c1Ctr, 2)
    else
      ChangeController(uis.LetterReward.c1Ctr, 1)
    end
  else
    ChangeController(uis.LetterReward.c1Ctr, 0)
  end
end

function InitialLevelRewardWindow.ShowOneReward(reward, item)
  if item and reward then
    local arr = Split(reward, ":")
    if arr and 3 == #arr then
      if 2 == tonumber(arr[1]) then
        local cardFrame = item:GetChild("CardFrame")
        local loader = cardFrame:GetChild("ItemCardPic"):GetChild("ItemLoader")
        if loader then
          local data = TableData.GetConfig(tonumber(arr[2]), "BaseCard")
          if data then
            UIUtil.SetHeadByFaceId(data.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
            ChangeUIController(cardFrame, "c1", data.star - 1)
          end
        end
        ChangeUIController(item, "c1", 1)
      else
        local config = TableData.GetConfig(tonumber(arr[2]), "BaseItem")
        local itemFrame = item:GetChild("ItemFrame")
        local loader = itemFrame:GetChild("ItemLoader")
        if loader and config then
          loader.url = UIUtil.GetResUrl(config.icon)
          ChangeUIController(itemFrame, "c1", config.quality)
        end
        ChangeUIController(item, "c1", 0)
        local numberTxt = itemFrame:GetChild("NumberTxt")
        if numberTxt then
          numberTxt.text = arr[3]
        end
        itemFrame.onClick:Set(function()
          OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
            id = config.id
          })
        end)
      end
    end
  end
end

function InitialLevelRewardWindow.OnShow()
  PlayUITrans(uis.root, "in", nil)
end

function InitialLevelRewardWindow.HandleMessage(msgId, para)
end

function InitialLevelRewardWindow.OnClose()
  if giftSpine then
    ResourceManager.DestroyGameObject(giftSpine, false)
  end
  uis = nil
  giftInfo = nil
  rewardLvData = nil
  lockLv = nil
  giftSpine = nil
  endIndex = nil
end

return InitialLevelRewardWindow
