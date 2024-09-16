RedDotFriend = {}

function RedDotFriend.HaveAddFriendSeat()
  local list = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.FRIEND)
  return #list < FriendData.GetFriendMaxNumber()
end

function RedDotFriend.HaveAddFriendRequest()
  local list = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.APPLIED)
  return #list > 0
end
