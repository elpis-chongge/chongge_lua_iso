require("RogueBuild01_LetterTipsWindowByName")
local RogueLetterTipsWindow = {}
local uis, contentPane, trendsData

function RogueLetterTipsWindow.ReInitData()
end

function RogueLetterTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueLetterTipsWindow.package, WinResConfig.RogueLetterTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_LetterTipsWindowUis(contentPane)
    local id = bridgeObj.argTable[1]
    trendsData = TableData.GetConfig(id, "BaseRogueTrends")
    RogueLetterTipsWindow.UpdateInfo()
    RogueLetterTipsWindow.InitBtn()
  end)
end

local allStory = {}

function RogueLetterTipsWindow.UpdateInfo()
  local tips = uis.Main.LetterRegion
  tips.TitleTxt.text = T(1380)
  if trendsData then
    local wordList = tips.WordList
    
    function wordList.itemRenderer(i, item)
      UIUtil.SetText(item, trendsData.des_detail())
    end
    
    wordList.numItems = 1
    local sotyData = TableData.GetConfig(trendsData.dialog_id, "BaseStorySimple")
    if sotyData then
      table.insert(allStory, sotyData)
      RogueLetterTipsWindow.GetAllStorySimple(sotyData)
      
      function tips.ChatList.itemRenderer(i, item)
        local index = i + 1
        UIUtil.SetText(item, allStory[index].role_name and allStory[index].role_name() or "", "NameTxt")
        UIUtil.SetText(item, allStory[index].remark and allStory[index].remark() or "", "WordTxt")
        local head = item:GetChild("Head")
        if allStory[index].role_head then
          head:GetChild("Bg"):GetChild("PicLoader").url = UIUtil.GetResUrl(allStory[index].role_head)
          head.visible = true
        else
          head.visible = false
        end
      end
      
      tips.ChatList.numItems = #allStory
    end
  end
end

function RogueLetterTipsWindow.GetAllStorySimple(sotyData)
  if sotyData and sotyData.next then
    local sotyData = TableData.GetConfig(sotyData.next, "BaseStorySimple")
    if sotyData then
      table.insert(allStory, sotyData)
      RogueLetterTipsWindow.GetAllStorySimple(sotyData)
    end
  end
end

function RogueLetterTipsWindow.ClickClose()
  UIMgr:CloseWindow(WinResConfig.RogueLetterTipsWindow.name)
end

function RogueLetterTipsWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(RogueLetterTipsWindow.ClickClose)
  uis.Main.TouchScreenBtn.onClick:Set(RogueLetterTipsWindow.ClickClose)
end

function RogueLetterTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueLetterTipsWindow
