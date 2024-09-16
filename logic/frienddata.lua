FriendData = {}

function FriendData.InitFriendData()
  FriendData.init = false
  FriendData.cachedRelationInfoList = {}
  FriendData.cachedUid2Target = {}
  FriendData.cachedTargetUin2State = {}
  FriendData.cachedSearchResult = nil
end

local AddRelation = function(relationInfo)
  if FriendData.cachedRelationInfoList[relationInfo.state] == nil then
    FriendData.cachedRelationInfoList[relationInfo.state] = {}
  end
  table.insert(FriendData.cachedRelationInfoList[relationInfo.state], relationInfo)
  FriendData.cachedTargetUin2State[relationInfo.targetUin] = relationInfo.state
end

function FriendData.UpdateRelationInfo(relationInfo)
  local preState = FriendData.cachedTargetUin2State[relationInfo.targetUin]
  if preState then
    local relationList = FriendData.cachedRelationInfoList[preState]
    if relationInfo.state == ProtoEnum.RELATION_STATE.DELETE then
      for i, v in ipairs(relationList) do
        if v.targetUin == relationInfo.targetUin then
          table.remove(relationList, i)
          FriendData.cachedTargetUin2State[relationInfo.targetUin] = nil
          break
        end
      end
    elseif relationInfo.state ~= preState then
      for i, v in ipairs(relationList) do
        if v.targetUin == relationInfo.targetUin then
          table.remove(relationList, i)
          break
        end
      end
      AddRelation(relationInfo)
    elseif relationInfo.state == preState then
      for i, v in ipairs(relationList) do
        if v.targetUin == relationInfo.targetUin then
          relationList[i] = relationInfo
          break
        end
      end
    end
  else
    AddRelation(relationInfo)
  end
end

function FriendData.GetRelationState(uin)
  return FriendData.cachedTargetUin2State[uin]
end

function FriendData.UpdateTarget(target)
  FriendData.cachedUid2Target[target.uin] = target
end

function FriendData.DeleteApplication(targetUin)
  local preState = FriendData.GetRelationState(targetUin)
  if preState == ProtoEnum.RELATION_STATE.APPLIED then
    local list = FriendData.cachedRelationInfoList[preState]
    if list then
      for i, v in ipairs(list) do
        if v.targetUin == targetUin then
          table.remove(list, i)
          break
        end
      end
    end
    FriendData.cachedUid2Target[targetUin] = nil
    FriendData.cachedTargetUin2State[targetUin] = nil
  end
end

function FriendData.GetActorMirrorByUid(uid)
  return FriendData.cachedUid2Target[uid]
end

function FriendData.SaveFriends(msg)
  for i, v in ipairs(msg.relations) do
    FriendData.UpdateRelationInfo(v)
  end
  for i, v in ipairs(msg.targetInfos) do
    FriendData.UpdateTarget(v)
  end
  FriendData.init = true
end

function FriendData.GetRelationList(state)
  return FriendData.cachedRelationInfoList[state] or {}
end

function FriendData.GetCurSearchResult()
  return FriendData.cachedSearchResult or {}
end

function FriendData.SaveSearchResult(msg)
  FriendData.cachedSearchResult = msg.infos
  for _, v in ipairs(msg.targetInfos) do
    FriendData.UpdateTarget(v)
  end
end

function FriendData.DeleteSearchResult(targetUin)
  if 0 == targetUin then
    FriendData.cachedSearchResult = nil
    return
  end
  if FriendData.cachedSearchResult then
    for i, v in ipairs(FriendData.cachedSearchResult) do
      if v.targetUin == targetUin then
        table.remove(FriendData.cachedSearchResult, i)
        return
      end
    end
  end
end

function FriendData.GetFriendMaxNumber()
  return TableData.GetConfig(70010701, "BaseFixed").int_value
end

function FriendData.GetAppliedMaxNumber()
  return TableData.GetConfig(70010702, "BaseFixed").int_value
end

function FriendData.GetBlockMaxNumber()
  return TableData.GetConfig(70010703, "BaseFixed").int_value
end

function FriendData.IsActorBlock(uin)
  if FriendData.cachedRelationInfoList then
    local blockList = FriendData.cachedRelationInfoList[ProtoEnum.RELATION_STATE.BLOCK] or {}
    for i, v in ipairs(blockList) do
      if v.targetUin == uin then
        return true
      end
    end
  end
  return false
end
