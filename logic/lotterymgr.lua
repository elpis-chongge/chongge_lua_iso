LotteryMgr = {}

function LotteryMgr.SetCardTips(cardTips, data)
  if data then
    cardTips:GetChild("NameTxt").text = data.name()
    cardTips:GetChild("CVTxt").text = data.cv_name()
    local element = cardTips:GetChild("Element")
    if element then
      ChangeUIController(element, nil, data.element_type[1])
    end
    local occupation = cardTips:GetChild("Occupation")
    if occupation then
      ChangeUIController(occupation, nil, data.type - 1)
      ChangeUIController(occupation, "c2", 1)
    end
    local starList = cardTips:GetChild("StarList")
    
    function starList.itemRenderer()
    end
    
    starList.numItems = data.star
  end
end

function LotteryMgr.GetGachaNumber(data)
  local n = 0
  if LotteryData.Info.totalGachaCount and data then
    for i, v in pairs(data.gacha_mode) do
      if LotteryData.Info.totalGachaCount[v] then
        local modeData = TableData.GetConfig(v, "BaseGachaMode")
        if modeData then
          n = n + LotteryData.Info.totalGachaCount[v] * modeData.gacha_time
        end
      end
    end
  end
  return n
end

function LotteryMgr.ShowReview()
  if SDKManager.UseSDK and Application.platform == RuntimePlatform.IPhonePlayer then
    local flag = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.IOS_REVIEW, PLAYER_PREF_DEFAULT_VALUE.IOS_REVIEW)
    if flag == PLAYER_PREF_DEFAULT_VALUE.IOS_REVIEW then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.IOS_REVIEW, 1)
      SDKManager:AppReviewSDK(LoginData.GetSDKServerId(), ActorData.GetName(), Application.version, ActorData.GetUin(), ActorData.GetLevel())
    end
  end
end
