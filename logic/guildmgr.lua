GuildMgr = {}
GuildEnum = {
  ACTIVE_ID = 70010313,
  GUILD_LEVEL_UP_ID = 7007010,
  MAX_LEVEL_ID = 70010314,
  RENAME_NAME_ID = 70010311,
  CREATION_GUILD = 70010301
}

function GuildMgr.SortByRoleType(tb)
  local t = {}
  if GuildData.myRoleType == nil then
    local itemData = GuildData.GetGuildItemData(ActorData.GetUin())
    if itemData then
      GuildData.myRoleType = itemData.roleType
    end
  end
  if tb then
    local tempSortA, tempSortB
    local uin = ActorData.GetUin()
    table.sort(tb, function(a, b)
      if a.roleType == b.roleType then
        if a.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER then
          if a.level == b.level then
            return a.uin < b.uin
          else
            return a.level > b.level
          end
        else
          tempSortA = a.isOnline and 0 or 1
          tempSortB = b.isOnline and 0 or 1
          if tempSortA == tempSortB then
            if 1 == tempSortB then
              if a.activeStamp == b.activeStamp then
                return a.uin < b.uin
              else
                return a.activeStamp > b.activeStamp
              end
            elseif a.level == b.level then
              return a.uin < b.uin
            else
              return a.level > b.level
            end
          else
            return tempSortA < tempSortB
          end
        end
      else
        return a.roleType < b.roleType
      end
    end)
    for i, v in pairs(tb) do
      table.insert(t, v)
    end
  end
  if #t < 5 then
    for i = #t, 4 do
      table.insert(t, {})
    end
  end
  return t
end

function GuildMgr.SortByGuildId(tb)
  local t = {}
  if tb then
    table.sort(tb, function(a, b)
      return a.guildUid < b.guildUid
    end)
    for i, v in pairs(tb) do
      table.insert(t, v)
    end
  end
  return t
end

function GuildMgr.GetDownTime(time)
  return time - LoginData.GetCurServerTime()
end

function GuildMgr.FormatTime(time)
  time = math.floor(time)
  if time <= 60 then
    return T(289)
  end
  local hours, minutes, seconds
  hours = math.floor(time / 3600)
  time = time % 3600
  minutes = math.floor(time / 60)
  seconds = time % 60
  if hours > 0 then
    local day = math.floor(hours / 24)
    hours = hours % 24
    if 0 == day then
      return T(280, hours)
    else
      return T(279, day)
    end
  else
    return T(281, math.max(minutes, 1))
  end
end

function GuildMgr.GetServiceId()
  if GuildData.GuildInfo then
    return GuildData.GuildInfo.serviceId
  end
end

function GuildMgr.UpdateApplyJoin()
  GuildService.GetMyGuildInfoReq(true, nil)
end

function GuildMgr.UpdateGuildSign()
  GuildService.GetActorSignInReq()
end
