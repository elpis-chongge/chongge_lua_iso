GuildData = {simpleInfo = nil, signInInfo = nil}

function GuildData.GetGuildItemData(uin)
  for _, v in ipairs(GuildData.GuildInfo.members) do
    if v.uin == uin then
      return v
    end
  end
end

function GuildData.GetViceCaptainNum()
  local number = 0
  for _, v in ipairs(GuildData.GuildInfo.members) do
    if v.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER then
      number = number + 1
    end
  end
  return number
end

function GuildData.SetGuildSimpleInfo(simpleInfo)
  GuildData.simpleInfo = simpleInfo
end

function GuildData.GetGuildSimpleInfo()
  return GuildData.simpleInfo
end

function GuildData.GetGuildNoticeFromSimpleInfo()
  return GuildData.simpleInfo and GuildData.simpleInfo.notice
end

function GuildData.GetGuildRoleTypeFromSimpleInfo()
  return GuildData.simpleInfo and GuildData.simpleInfo.roleType
end

function GuildData.UpdateNotice(notice)
  if GuildData.simpleInfo then
    GuildData.simpleInfo.notice = notice
  end
  if GuildData.GuildInfo then
    GuildData.GuildInfo.info.notice = notice
  end
end

local trainData = {}
local detailsData

function GuildData.ClearTrainData()
  trainData = {}
  detailsData = nil
end

function GuildData.SaveTrainRankData(msg)
  trainData[msg.stageId] = msg.rankDataLst
end

function GuildData.GetTrainRankData(stageId)
  if stageId then
    return trainData[stageId]
  end
end

function GuildData.SaveTrainDetailsData(recordInfo)
  detailsData = recordInfo
end

function GuildData.GetDetailsData()
  return detailsData
end

function GuildData.Close()
end
