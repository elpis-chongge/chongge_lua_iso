TeamService = {}

function TeamService.Init()
  Net.AddListener(Proto.MsgName.SetCardTeamRsp, TeamService.DealSetCardTeamRsp)
  Net.AddListener(Proto.MsgName.ChangeCardTeamNameRsp, TeamService.DealChangeCardTeamNameRsp)
end

function TeamService.SetCardTeamReq(teamId, cardIds, name)
  local msg = {}
  msg.teamId = teamId
  msg.cardIds = cardIds
  msg.name = name
  Net.Send(Proto.MsgName.SetCardTeamReq, msg)
end

function TeamService.DealSetCardTeamRsp(msg)
  TeamData.UpdateTeamInfo(msg.teamInfo)
  UIMgr:CloseWindow(WinResConfig.TeamEditWindow.name)
  UIMgr:SendWindowMessage(WinResConfig.TeamWindow.name, WindowMsgEnum.Team.TEAM_UPDATE)
end

function TeamService.ChangeCardTeamNameReq(teamId, name)
  local msg = {}
  msg.teamId = teamId
  msg.name = name
  Net.Send(Proto.MsgName.ChangeCardTeamNameReq, msg)
end

function TeamService.DealChangeCardTeamNameRsp(msg)
  TeamData.UpdateTeamInfo(msg.teamInfo)
  UIMgr:CloseWindow(WinResConfig.TeamRenameWindow.name)
  UIMgr:SendWindowMessage(WinResConfig.TeamWindow.name, WindowMsgEnum.Team.RENAME)
end

TeamService.Init()
