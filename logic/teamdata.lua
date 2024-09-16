TeamData = {}

function TeamData.GetTeamInfoById(teamId)
  local teamList = ActorData.GetAllTeam()
  for _, v in pairs(teamList) do
    if v.teamId == teamId then
      return v
    end
  end
end

function TeamData.IsCardInTeam(cardId, teamId, teamInfo)
  teamInfo = teamInfo or TeamData.GetTeamInfoById(teamId)
  if nil == teamInfo then
    return false
  end
  for index, v in ipairs(teamInfo.cardIds) do
    if v == cardId then
      return true, index
    end
  end
  return false
end

function TeamData.GetTeamCardLimitNum()
  return TableData.GetConfig(70010008, "BaseFixed").int_value
end

function TeamData.UpdateTeamInfo(teamInfo)
  local teamList = ActorData.GetAllTeam()
  for i, v in pairs(teamList) do
    if v.teamId == teamInfo.teamId then
      teamList[i] = teamInfo
      return
    end
  end
  table.insert(teamList, teamInfo)
end

function TeamData.GetTeamNameById(teamId)
  local teamInfo = TeamData.GetTeamInfoById(teamId)
  if teamInfo then
    return teamInfo.name
  else
    return T(10043, teamId)
  end
end

function TeamData.HaveSameName(teamName)
  if nil == teamName then
    return false
  end
  for teamId = 1, 4 do
    local name = TeamData.GetTeamNameById(teamId)
    if name == teamName then
      return true
    end
  end
  return false
end
