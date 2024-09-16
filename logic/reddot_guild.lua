RedDotGuild = {}

function RedDotGuild.HomeTaskRed()
  return RedDotGuild.CanSign() or RedDotGuild.CanVote() or RedDotGuild.CanAuditJoin()
end

function RedDotGuild.CanAuditJoin()
  if GuildData.GuildInfo and GuildData.GuildInfo.applicants and #GuildData.GuildInfo.applicants > 0 then
    local itemData = GuildData.GetGuildItemData(ActorData.GetUin())
    if itemData and (itemData.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER or itemData.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER) then
      return true
    end
  end
end

function RedDotGuild.CanSign()
  if GuildData.GuildInfo and GuildData.GuildInfo.info and GuildData.GuildInfo.info.guildUid and GuildData.signInInfo and GuildData.signInInfo.isTodaySignIn == false then
    return true
  end
end

function RedDotGuild.CanVote()
  if GuildData.GuildInfo and GuildData.GuildInfo.info and GuildData.GuildInfo.info.impeaching and 0 == GuildData.GuildInfo.impeachInfo.myVote then
    local itemData = GuildData.GetGuildItemData(ActorData.GetUin())
    if itemData and itemData.roleType ~= ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
      return true
    end
  end
end
