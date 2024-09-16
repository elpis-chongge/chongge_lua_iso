require("RogueBuild01_InsidePlotEndWindowByName")
local RogueGameEndingWindow = {}
local uis, contentPane, endingId, callback
local CATION_FADE_SPEED = 1.05
local CATION_FADE_DURATION = 1
local CATION_SCROLL_SPEED = 27
local START_SCROLL_DELAY = 10
local stories
local elapse = 0
local cation_fade_speed_scale = 1
local cation_scroll_speed_scale = 1
local CATION_FADE_SPEEDUP_FACTOR = 50
local CATION_SCROLL_SPEEDUP_FACTOR = 50
local complete, lastIndex = 0

local function ScrollCaption()
  local list = uis.Main.WordList
  local row = #stories
  local duration = row * CATION_FADE_DURATION
  local fadespeed = CATION_FADE_SPEED * cation_fade_speed_scale
  local scrollspeed = CATION_SCROLL_SPEED * cation_scroll_speed_scale
  elapse = elapse + Time.deltaTime * fadespeed
  if elapse > START_SCROLL_DELAY then
    local posY = list.scrollPane.posY
    posY = posY + Time.deltaTime * scrollspeed
    list.scrollPane.posY = posY
  end
  local index, frac = math.modf(elapse / duration * (row - 1))
  for i = lastIndex, index do
    local val = i == index and frac or 1
    if i + 1 > 0 and row >= i + 1 then
      stories[i + 1].alpha = val
    end
  end
  list:RefreshVirtualList()
  lastIndex = index
  if list.scrollPane.isBottomMost and row <= index then
    complete = true
    uis.Main.TouchScreenBtn.visible = false
    uis.Main.c2Ctr.selectedIndex = 1
    UpdateManager.RemoveUpdateHandler(ScrollCaption)
  end
end

function RogueGameEndingWindow.ReInitData()
end

function RogueGameEndingWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameEndingWindow.package, WinResConfig.RogueGameEndingWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsidePlotEndWindowUis(contentPane)
    endingId = bridgeObj.argTable[1]
    callback = bridgeObj.argTable[2]
    RogueGameEndingWindow.UpdateInfo()
    RogueGameEndingWindow.InitBtn()
  end)
end

function RogueGameEndingWindow.UpdateInfo()
  local conf = TableData.GetConfig(endingId, "BaseRogueEnding")
  local story_id = conf.story_id
  local path = conf.back_ground
  local texture = ResourceManager.LoadTexture(path)
  UIUtil.SetLoaderTexture(uis.Main.PicLoader, texture)
  local effect = ResourceManager.Instantiate(conf.effect_path)
  UIUtil.SetObjectToUI(effect, uis.Main.Effect1Holder)
  local transform = effect.transform
  for i = 1, transform.childCount do
    local child = transform:GetChild(i - 1)
    child.gameObject:SetActive(true)
  end
  LuaUtil.PlayEffect(effect)
  stories = {}
  while type(story_id) == "number" do
    local storyConf = TableData.GetConfig(story_id, "BaseStorySimple")
    if storyConf then
      table.insert(stories, {story_id = story_id, alpha = 0})
      story_id = storyConf.next
    else
      story_id = nil
    end
  end
  local list = uis.Main.WordList
  list:SetVirtual()
  
  function list.itemRenderer(i, gcmp)
    local item = stories[i + 1]
    if complete then
      gcmp.alpha = 1
    else
      gcmp.alpha = item.alpha or 0
    end
    local storyConf = TableData.GetConfig(item.story_id, "BaseStorySimple")
    UIUtil.SetText(gcmp, storyConf.remark(), "WordTxt")
  end
  
  complete = false
  elapse = 0
  lastIndex = 0
  cation_fade_speed_scale = 1
  cation_scroll_speed_scale = 1
  local numItems = #stories
  list.numItems = numItems
  list.scrollPane.onScroll:Add(function()
    if not complete then
      return
    end
    uis.Main.c2Ctr.selectedIndex = list.scrollPane.isBottomMost and 1 or 0
  end)
  UIUtil.SetText(uis.Main.CloseBtn, T(20472), "WordTxt")
  UpdateManager.AddUpdateHandler(ScrollCaption)
end

function RogueGameEndingWindow.InitBtn()
  local gesture = LongPressGesture.GetLongPressGesture(uis.Main.TouchScreenBtn)
  gesture.trigger = 0.1
  gesture.onBegin:Set(function()
    cation_fade_speed_scale = 6 * cation_fade_speed_scale
    cation_scroll_speed_scale = 6 * cation_scroll_speed_scale
  end)
  gesture.onEnd:Set(function()
    cation_fade_speed_scale = 1
    cation_scroll_speed_scale = 1
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function(content)
    if content.inputEvent.isDoubleClick then
      gesture.onBegin:Set(nil)
      gesture.onEnd:Set(nil)
      cation_fade_speed_scale = CATION_FADE_SPEEDUP_FACTOR * cation_fade_speed_scale
      cation_scroll_speed_scale = CATION_SCROLL_SPEEDUP_FACTOR * cation_scroll_speed_scale
      uis.Main.TouchScreenBtn.onClick:Set(nil)
    end
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    if callback then
      callback()
    end
    UIMgr:CloseWindow(WinResConfig.RogueGameEndingWindow.name)
  end)
end

function RogueGameEndingWindow.OnClose()
  uis = nil
  contentPane = nil
  UpdateManager.RemoveUpdateHandler(ScrollCaption)
end

return RogueGameEndingWindow
