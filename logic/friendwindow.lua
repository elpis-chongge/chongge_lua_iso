require("Friend_FriendWindowByName")
local FriendWindow = {}
local uis, contentPane
local FRIEND_WINDOW_TAB = {
  FRIEND = 1,
  APPLICANT = 2,
  BLOCK = 3
}
local FRIEND_LIST_TYPE = {
  FRIEND = 1,
  APPLICANT = 2,
  BLOCK = 3,
  SEARCH = 4
}
local OPERATION_TYPE = {NORMAL = 1, DELETE = 2}
local curSelectTabIndex, curOperationType, curFriendListType, curRelationInfoList, lastRelationInfoList, jumpTb, playAnim

function FriendWindow.ReInitData()
end

function FriendWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FriendWindow.package, WinResConfig.FriendWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetFriend_FriendWindowUis(contentPane)
    curOperationType = OPERATION_TYPE.NORMAL
    FriendWindow.UpdateDeleteBtnState()
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_FRIEND)
    FriendWindow.InitBtn()
    local callbackAfterShow = bridgeObj.argTable[1]
    if callbackAfterShow then
      callbackAfterShow()
    end
  end)
end

function FriendWindow.UpdateInfo()
  local friendRelationList = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.FRIEND)
  if #friendRelationList > 0 then
    curSelectTabIndex = FRIEND_WINDOW_TAB.FRIEND
  else
    curSelectTabIndex = FRIEND_WINDOW_TAB.APPLICANT
  end
  FriendWindow.UpdateTab()
end

function FriendWindow.RenderFriend()
  local friendList = uis.Main.FriendList
  friendList:RemoveChildrenToPool()
  for index, v in ipairs(curRelationInfoList) do
    local relationInfo = curRelationInfoList[index]
    if nil == relationInfo then
      return
    end
    local item = friendList:AddItemFromPool()
    local friendInfoItem = item:GetChild("FriendInfo")
    if true == playAnim then
      friendInfoItem.alpha = 0
      PlayUITrans(item, "up", nil, (index - 1) * 0.08)
    else
      friendInfoItem.alpha = 1
    end
    FriendWindow.UpdateFriendShowControl(friendInfoItem, relationInfo)
    local actorMirrorInfo = FriendData.GetActorMirrorByUid(relationInfo.targetUin)
    if nil == actorMirrorInfo then
      return
    end
    UIUtil.ShowPlayerHead(actorMirrorInfo, friendInfoItem:GetChild("Head"), function()
      FriendMgr.OpenActorInfo(actorMirrorInfo)
    end)
    friendInfoItem:GetChild("NameTxt").text = actorMirrorInfo.name
    friendInfoItem:GetChild("LevelTxt").text = T(11006, actorMirrorInfo.level)
    friendInfoItem:GetChild("GuildTxt").text = actorMirrorInfo.guildName or ""
    local online = friendInfoItem:GetChild("OnLine")
    local onlineTxt = online:GetChild("OnLineTxt")
    if true == actorMirrorInfo.isOnline then
      ChangeUIController(online, "c1", 1)
    else
      ChangeUIController(online, "c1", 0)
      onlineTxt.text = T(10115, TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - actorMirrorInfo.lastLoginStamp))
    end
    local addBtn = friendInfoItem:GetChild("AddBtn")
    local delBtn = friendInfoItem:GetChild("DelBtn")
    local refuseBtn = friendInfoItem:GetChild("RefuseBtn")
    local taggingtxt = friendInfoItem:GetChild("TaggingTxt")
    taggingtxt.text = ""
    if curFriendListType == FRIEND_LIST_TYPE.FRIEND then
      if relationInfo.remark and "" ~= relationInfo.remark then
        taggingtxt.text = T(10151, relationInfo.remark)
      end
      delBtn.onClick:Set(function()
        MessageBox.Show(T(10148), {
          touchCallback = function()
            FriendService.DeleteRelationReq(relationInfo.targetUin)
          end
        }, {})
      end)
    elseif curFriendListType == FRIEND_LIST_TYPE.SEARCH then
      addBtn.onClick:Set(function()
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_FRIEND, false, actorMirrorInfo.level) == false then
          FloatTipsUtil.ShowWarnTips(T(10146))
          return
        end
        FriendService.ApplyAddFriendReq(relationInfo.targetUin)
      end)
    elseif curFriendListType == FRIEND_LIST_TYPE.APPLICANT then
      addBtn.onClick:Set(function()
        FriendService.AgreeFriendApplyReq(relationInfo.targetUin)
      end)
      refuseBtn.onClick:Set(function()
        FriendService.DisagreeFriendReq(relationInfo.targetUin)
      end)
    elseif curFriendListType == FRIEND_LIST_TYPE.BLOCK then
      delBtn.onClick:Set(function()
        FriendService.DeleteRelationReq(relationInfo.targetUin)
      end)
    end
  end
end

function FriendWindow.UpdateFriendShowControl(item, relationInfo)
  if curFriendListType == FRIEND_LIST_TYPE.FRIEND or curFriendListType == FRIEND_LIST_TYPE.BLOCK then
    if curOperationType == OPERATION_TYPE.NORMAL then
      ChangeUIController(item, "c1", 0)
    elseif curOperationType == OPERATION_TYPE.DELETE then
      ChangeUIController(item, "c1", 1)
    end
  elseif curFriendListType == FRIEND_LIST_TYPE.APPLICANT then
    ChangeUIController(item, "c1", 3)
  elseif curFriendListType == FRIEND_LIST_TYPE.SEARCH then
    if relationInfo.state == ProtoEnum.RELATION_STATE.FRIEND then
      ChangeUIController(item, "c1", 0)
    else
      ChangeUIController(item, "c1", 2)
    end
  end
end

function FriendWindow.UpdateTab()
  local tabInfoList = {
    {
      tabIndex = FRIEND_WINDOW_TAB.FRIEND,
      c1Index = 0,
      title = 10123,
      subTitle = 10124,
      friendListType = FRIEND_LIST_TYPE.FRIEND
    },
    {
      tabIndex = FRIEND_WINDOW_TAB.APPLICANT,
      c1Index = 1,
      title = 10125,
      subTitle = 10126,
      friendListType = FRIEND_LIST_TYPE.APPLICANT,
      redDotFunc = function(btn)
        RedDotMgr.AddNode({
          windowName = WinResConfig.FriendWindow.name,
          com = btn,
          visibleFunc = function()
            return RedDotFriend.HaveAddFriendRequest()
          end,
          dataType = RED_DOT_DATA_TYPE.FRIEND
        })
      end
    },
    {
      tabIndex = FRIEND_WINDOW_TAB.BLOCK,
      c1Index = 2,
      title = 10127,
      subTitle = 10128,
      friendListType = FRIEND_LIST_TYPE.BLOCK
    }
  }
  local tabList = uis.Main.TabRegion.TabList
  tabList:RemoveChildrenToPool()
  for i, v in ipairs(tabInfoList) do
    local item = tabList:AddItemFromPool()
    ChangeUIController(item, "c1", v.c1Index)
    UIUtil.SetBtnText(item, T(v.title), T(v.subTitle))
    item.soundFmod = SOUND_EVENT_ENUM.TAB_TAG1
    item.onClick:Set(function()
      if tabList.selectedIndex ~= i - 1 then
        playAnim = true
        uis.Main.c1Ctr.selectedIndex = v.c1Index
        tabList.selectedIndex = i - 1
        curSelectTabIndex = v.tabIndex
        curFriendListType = v.friendListType
        curOperationType = OPERATION_TYPE.NORMAL
        FriendWindow.UpdateDeleteBtnState()
        FriendWindow.ClearSearchText()
        FriendWindow.UpdateFriendList()
        playAnim = false
      end
    end)
    if v.tabIndex == curSelectTabIndex then
      item.onClick:Call()
    end
    if v.redDotFunc then
      v.redDotFunc(item)
    else
      RedDotMgr.RemoveOneNode(WinResConfig.FriendWindow.name, item)
    end
  end
end

function FriendWindow.SetCurRelationInfoList()
  local emptyWordId
  if curFriendListType == FRIEND_LIST_TYPE.FRIEND then
    curRelationInfoList = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.FRIEND)
    table.sort(curRelationInfoList, function(a, b)
      local actorA = FriendData.GetActorMirrorByUid(a.targetUin)
      local actorB = FriendData.GetActorMirrorByUid(b.targetUin)
      if actorA.isOnline == true and actorB.isOnline == false then
        return true
      elseif actorA.isOnline == false and actorB.isOnline == true then
        return false
      else
        return actorA.lastLoginStamp > actorB.lastLoginStamp
      end
    end)
    FriendWindow.UpdateFriendNum()
    emptyWordId = 10129
  elseif curFriendListType == FRIEND_LIST_TYPE.APPLICANT then
    curRelationInfoList = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.APPLIED)
    emptyWordId = 10130
  elseif curFriendListType == FRIEND_LIST_TYPE.BLOCK then
    curRelationInfoList = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.BLOCK)
    FriendWindow.UpdateBlockNum()
    emptyWordId = 10131
  elseif curFriendListType == FRIEND_LIST_TYPE.SEARCH then
    curRelationInfoList = FriendData.GetCurSearchResult()
  end
  return emptyWordId
end

function FriendWindow.UpdateWord()
  local emptyWordId = FriendWindow.SetCurRelationInfoList()
  if #curRelationInfoList <= 0 then
    uis.Main.c2Ctr.selectedIndex = 1
    if emptyWordId then
      uis.Main.Empty.TipsTxt.text = T(emptyWordId)
    end
    uis.Main.c3Ctr.selectedIndex = 0
  else
    uis.Main.c2Ctr.selectedIndex = 0
    if #curRelationInfoList >= 1 and curFriendListType == FRIEND_LIST_TYPE.APPLICANT then
      uis.Main.c3Ctr.selectedIndex = 1
    else
      uis.Main.c3Ctr.selectedIndex = 0
    end
  end
end

function FriendWindow.UpdateFriendList()
  FriendWindow.UpdateWord()
  FriendWindow.RenderFriend()
  lastRelationInfoList = SimpleCopy(curRelationInfoList)
end

function FriendWindow.UpdateFriendNum()
  local deleteBtn = uis.Main.DelNumberBtn
  UIUtil.SetText(deleteBtn, T(10134, #curRelationInfoList, FriendData.GetFriendMaxNumber()), "NumberTxt")
end

function FriendWindow.UpdateBlockNum()
  local deleteBtn = uis.Main.DelNumberBtn
  UIUtil.SetText(deleteBtn, T(10135, #curRelationInfoList, FriendData.GetBlockMaxNumber()), "NumberTxt")
end

function FriendWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.FriendWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_FRIEND)
  local searchBtn = uis.Main.Search.SearchBtn
  UIUtil.SetBtnText(searchBtn, T(10132))
  searchBtn.onClick:Add(FriendWindow.ClickSearchBtn)
  local deleteBtn = uis.Main.DelNumberBtn
  deleteBtn.onClick:Add(FriendWindow.ClickDeleteBtn)
  local agreeBtn = uis.Main.AgreeBtn
  UIUtil.SetBtnText(agreeBtn, T(259), T(258))
  agreeBtn.onClick:Add(FriendWindow.ClickAgreeBtn)
  local refuseBtn = uis.Main.RefuseBtn
  UIUtil.SetBtnText(refuseBtn, T(261), T(260))
  refuseBtn.onClick:Add(FriendWindow.ClickRefuseBtn)
  local searchTxt = uis.Main.Search.WordTxt
  if searchTxt then
    searchTxt.promptText = T(10156)
    searchTxt.onFocusOut:Set(function()
      searchTxt.text = SensitiveWordsUtil.FilterWord(searchTxt.text)
    end)
  end
end

function FriendWindow.UpdateDeleteBtnState()
  local deleteBtn = uis.Main.DelNumberBtn
  if curOperationType == OPERATION_TYPE.DELETE then
    deleteBtn.selected = true
  else
    deleteBtn.selected = false
  end
end

function FriendWindow.ClickSearchBtn()
  local searchWord = uis.Main.Search.WordTxt.text
  searchWord = string.gsub(searchWord, " ", "")
  if string.len(searchWord) <= 0 then
    FloatTipsUtil.ShowWarnTips(T(10133))
    return
  end
  FriendService.SearchTargetReq(searchWord)
end

function FriendWindow.ClickAgreeBtn()
  FriendService.AgreeFriendApplyReq(0)
end

function FriendWindow.ClickRefuseBtn()
  FriendService.DisagreeFriendReq(0)
end

function FriendWindow.ClickDeleteBtn()
  if curOperationType == OPERATION_TYPE.NORMAL then
    curOperationType = OPERATION_TYPE.DELETE
  elseif curOperationType == OPERATION_TYPE.DELETE then
    curOperationType = OPERATION_TYPE.NORMAL
  end
  FriendWindow.UpdateDeleteBtnState()
  FriendWindow.UpdateFriendList()
end

function FriendWindow.ClearSearchText()
  uis.Main.Search.WordTxt.text = ""
end

local IsContain = function(targetUin)
  for i, v in pairs(curRelationInfoList) do
    if v.targetUin == targetUin then
      return true
    end
  end
end

function FriendWindow.RefreshListAnim()
  local friendList = uis.Main.FriendList
  local deleteIndex = 1
  local startIndex
  for index = 1, friendList.numChildren do
    local relationInfo = lastRelationInfoList[index]
    if nil == relationInfo then
      return
    end
    if not IsContain(relationInfo.targetUin) then
      local item = friendList:GetChildAt(index - 1)
      if nil == startIndex then
        startIndex = index
      end
      deleteIndex = index
      friendList.touchable = false
      PlayUITrans(item, "delete", function()
        if deleteIndex == index then
          local timeIndex = 0
          local endIndex = 1
          lastRelationInfoList = SimpleCopy(curRelationInfoList)
          if startIndex >= friendList.numChildren then
            friendList:RemoveChildToPoolAt(startIndex - 1)
            friendList.touchable = true
          else
            for i = startIndex + 1, friendList.numChildren do
              local upItem = friendList:GetChildAt(i - 1)
              if upItem.visible then
                endIndex = i
                TimerUtil.setTimeout(timeIndex * 0.08, function()
                  upItem:TweenMoveY(upItem.y - (upItem.height + friendList.lineGap), 0.25):SetEase(EaseType.QuadOut):OnComplete(function()
                    if i == endIndex then
                      friendList:RemoveChildToPoolAt(startIndex - 1)
                      friendList.touchable = true
                    end
                  end)
                end)
                timeIndex = timeIndex + 1
              end
            end
          end
        end
      end, (index - 1) * 0.08)
    end
  end
end

function FriendWindow.OnShown()
end

function FriendWindow.OnHide()
end

function FriendWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.FriendWindow.name)
  curSelectTabIndex = nil
  curOperationType = nil
  curRelationInfoList = nil
  uis = nil
  contentPane = nil
  lastRelationInfoList = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

function FriendWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.FRIEND.UPDATE_FRIEND_WINDOW then
    FriendWindow.UpdateInfo()
  elseif msgId == WindowMsgEnum.FRIEND.SEARCH then
    curFriendListType = FRIEND_LIST_TYPE.SEARCH
    FriendWindow.UpdateFriendList()
  elseif msgId == WindowMsgEnum.FRIEND.UPDATE_LIST then
    FriendWindow.UpdateFriendList()
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.FriendWindow.name)
  elseif msgId == WindowMsgEnum.FRIEND.DELETE then
    FriendWindow.UpdateWord()
    if para then
      FriendWindow.RefreshListAnim()
    else
      uis.Main.FriendList.touchable = false
      LeanTween.delayedCall(0.3, function()
        uis.Main.FriendList.touchable = true
        FriendWindow.RefreshListAnim()
      end)
    end
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.FriendWindow.name)
  end
end

return FriendWindow
