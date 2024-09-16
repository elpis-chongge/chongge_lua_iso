FriendMgr = {}

function FriendMgr.TryToOpenFriendWindow(jump)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_FRIEND) then
    if jump then
      JumpToWindow(WinResConfig.FriendWindow.name, nil, nil, function()
        if FriendData.init == true then
          UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.UPDATE_FRIEND_WINDOW)
        else
          FriendService.GetFriendsReq()
        end
      end)
    else
      OpenWindow(WinResConfig.FriendWindow.name, nil, function()
        if FriendData.init == true then
          UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.UPDATE_FRIEND_WINDOW)
        else
          FriendService.GetFriendsReq()
        end
      end)
    end
  end
end

function FriendMgr.OpenActorInfo(sender)
  ActorService.GetOtherDetailInfoReq(sender.uin, function(param)
    OpenWindow(WinResConfig.OtherPlayerInfoWindow.name, nil, param)
  end)
end
