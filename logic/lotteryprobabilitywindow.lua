require("Lottery_ProbabilityWindowByName")
local LotteryProbabilityWindow = {}
local uis, contentPane, gachaId, jumpTb

function LotteryProbabilityWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryProbabilityWindow.package, WinResConfig.LotteryProbabilityWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLottery_ProbabilityWindowUis(contentPane)
    gachaId = bridgeObj.argTable[1]
    LotteryProbabilityWindow.InitBtn()
    LotteryProbabilityWindow.InitList()
  end)
end

function LotteryProbabilityWindow.InitList()
  local data = TableData.GetConfig(gachaId, "BaseGacha")
  if data then
    local c = UIMgr:CreateObject("Lottery", "P_Word")
    local arr = Split(data.content[1], ",")
    if 3 == #arr then
      UIUtil.SetText(c, T(tonumber(arr[2])), "TitleTxt")
      local word = Split(arr[3], ":")
      local list = c:GetChild("WordList")
      
      function list.itemRenderer(i, item)
        UIUtil.SetText(item, T(tonumber(word[i + 1])), "WordTxt")
      end
      
      list.numItems = #word
      list:ResizeToFit()
    end
    uis.Main.ProbabilityList:AddChild(c)
    local a = UIMgr:CreateObject("Lottery", "P_A")
    arr = Split(data.content[2], ",")
    if 3 == #arr then
      LotteryProbabilityWindow.SetTitle(a:GetChild("P_Title"), T(tonumber(arr[3])), tonumber(arr[2]))
    end
    LotteryProbabilityWindow.SetCardList(a:GetChild("InfoList"), data.content)
    uis.Main.ProbabilityList:AddChild(a)
    LotteryProbabilityWindow.SetBUPTitle(data.content)
    LotteryProbabilityWindow.SetBTitle(data.content)
  end
end

function LotteryProbabilityWindow.SetBUPTitle(content)
  local b = UIMgr:CreateObject("Lottery", "P_B")
  local arr = Split(content[5], ",")
  if 3 == #arr then
    LotteryProbabilityWindow.SetTitle(b:GetChild("P_Title"), T(tonumber(arr[3])), tonumber(arr[2]))
  end
  if content[6] and content[7] then
    LotteryProbabilityWindow.SetCardBList(b:GetChild("HeadList"), content[6], content[7])
  end
  uis.Main.ProbabilityList:AddChild(b)
end

function LotteryProbabilityWindow.SetBTitle(content)
  for i = 8, #content, 2 do
    local b = UIMgr:CreateObject("Lottery", "P_B")
    local arr = Split(content[i], ",")
    if 3 == #arr then
      LotteryProbabilityWindow.SetTitle(b:GetChild("P_Title"), T(tonumber(arr[3])), tonumber(arr[2]))
    end
    if content[i + 1] then
      LotteryProbabilityWindow.SetCardBList(b:GetChild("HeadList"), content[i + 1])
    end
    uis.Main.ProbabilityList:AddChild(b)
  end
end

function LotteryProbabilityWindow.SetTitle(title, str, star)
  title:GetChild("WordTxt").text = str
  ChangeUIController(title, nil, star)
end

function LotteryProbabilityWindow.SetCardBList(list, content, upStr)
  local cardIds = Split(content, ":")
  local upId = {}
  if upStr then
    upId = Split(upStr, ":")
  end
  
  function list.itemRenderer(i, tips)
    local data = TableData.GetConfig(tonumber(cardIds[i + 1]), "BaseCard")
    if data then
      UIUtil.SetHeadByFaceId(data.fashion_id, tips:GetChild("CardPic"):GetChild("CardPicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
      tips:GetChild("NameTxt").text = data.name()
      local element = tips:GetChild("Element")
      if element then
        ChangeUIController(element, nil, data.element_type[1])
      end
      local occupation = tips:GetChild("Occupation")
      if occupation then
        ChangeUIController(occupation, nil, data.type - 1)
        ChangeUIController(occupation, "c2", 1)
      end
      ChangeUIController(tips, "c1", data.star - 1)
      UIUtil.ShowElementList(tips:GetChild("ElementList"), data)
      local starList = tips:GetChild("StarList")
      if starList then
        UIUtil.ShowStarList(starList, data, {
          star = data.star
        })
      end
      tips.onClick:Set(function()
        OpenWindow(WinResConfig.CardPreviewWindow.name, nil, data.id)
      end)
      if upId[i + 1] then
        local wordId = tonumber(upId[i + 1])
        if wordId and 0 ~= wordId then
          ChangeUIController(tips, "c2", 1)
          UIUtil.SetText(tips, T(wordId), "WordTxt")
        else
          ChangeUIController(tips, "c2", 0)
        end
      else
        ChangeUIController(tips, "c2", 0)
      end
    end
  end
  
  list.numItems = #cardIds
  LeanTween.delayedCall(0.1, function()
    if uis and not list.isDisposed then
      list:ResizeToFit()
    end
  end)
end

function LotteryProbabilityWindow.SetCardList(list, content)
  local cardIds = Split(content[3], ":")
  local strs = Split(content[4], ":")
  local tips, wordId
  if #strs == #cardIds then
    function list.itemRenderer(i, item)
      local data = TableData.GetConfig(tonumber(cardIds[i + 1]), "BaseCard")
      
      if data then
        tips = item:GetChild("P_CardInfo1")
        UIUtil.SetHeadByFaceId(data.fashion_id, tips:GetChild("CardPic"):GetChild("CardPicLoader"))
        tips:GetChild("CardNameTxt").text = data.name()
        local element = tips:GetChild("Element")
        if element then
          ChangeUIController(element, nil, data.element_type[1])
        end
        local occupation = tips:GetChild("Occupation")
        if occupation then
          ChangeUIController(occupation, nil, data.type - 1)
          ChangeUIController(occupation, "c2", 1)
        end
        local quality = tips:GetChild("Quality1_1")
        if quality then
          ChangeUIController(quality, nil, data.star - 1)
        end
        UIUtil.ShowElementList(tips:GetChild("ElementList"), data)
        local starList = tips:GetChild("StarList")
        if starList then
          UIUtil.ShowStarList(starList, data, {
            star = data.star
          })
        end
        quality = tips:GetChild("Quality1_2")
        if quality then
          ChangeUIController(quality, nil, data.star - 1)
        end
        wordId = tonumber(strs[i + 1])
        if wordId and 0 ~= wordId then
          ChangeUIController(item, nil, 1)
          item:GetChild("WordTxt").text = T(wordId)
        else
          ChangeUIController(item, nil, 0)
        end
        item.onClick:Set(function()
          OpenWindow(WinResConfig.CardPreviewWindow.name, nil, data.id)
        end)
      end
    end
    
    list.numItems = #cardIds
  end
end

function LotteryProbabilityWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.LotteryProbabilityWindow.name, uis.Main.CurrencyReturn)
  UIUtil.SetText(uis.Main.ProbabilityLookBtn, T(1506), "WordTxt")
  uis.Main.ProbabilityLookBtn.onClick:Set(function()
    OpenWindow(WinResConfig.LotteryTokenExplainWindow.name)
  end)
end

function LotteryProbabilityWindow.HandleMessage(msgId, para)
end

function LotteryProbabilityWindow.OnClose()
  uis = nil
  contentPane = nil
  gachaId = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return LotteryProbabilityWindow
