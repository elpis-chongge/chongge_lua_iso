require("Tower_WordContentWindowByName")
local TowerWordContentWindow = {}
local uis, contentPane, chapterData

function TowerWordContentWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TowerWordContentWindow.package, WinResConfig.TowerWordContentWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTower_WordContentWindowUis(contentPane)
    local id = bridgeObj.argTable[1]
    chapterData = TableData.GetConfig(id, "BaseChapter")
    TowerWordContentWindow.InitBtn()
    if chapterData then
      TowerWordContentWindow.Init()
    end
  end)
end

function TowerWordContentWindow.Init()
  uis.Main.NameTxt.text = chapterData.name()
  
  function uis.Main.WordList.itemRenderer(i, item)
    UIUtil.SetText(item, chapterData.des(), "WordTxt")
  end
  
  uis.Main.WordList.numItems = 1
end

function TowerWordContentWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.TowerWordContentWindow.name)
  end)
end

function TowerWordContentWindow.OnClose()
  uis = nil
  contentPane = nil
  chapterData = nil
end

return TowerWordContentWindow
