local get_weekly_dungeon_msg = {}
local GetTideDungeonInfoReq = function(param, rspCallback)
  local sceneTypes = get_weekly_dungeon_msg.sceneTypes
  sceneTypes = sceneTypes or {}
  table.clear(sceneTypes)
  if "table" == type(param) then
    for _, v in pairs(param) do
      table.insert(sceneTypes, v)
    end
  elseif type(param) == "number" then
    table.insert(sceneTypes, param)
  else
    return
  end
  get_weekly_dungeon_msg.sceneTypes = sceneTypes
  Net.Send(Proto.MsgName.GetSceneInfoReq, get_weekly_dungeon_msg, rspCallback)
end
local GetTideDungeonInfoRsp = function(msg)
  local refresh = false
  for i, v in pairs(msg.sceneInfos) do
    if table.keyof(AbyssTideDungeon, v.sceneType) then
      refresh = true
      TideDungeonData.SetTideDungeonInfo(v)
    end
  end
  if refresh then
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.TIDE_DUNGEON_REFRESH)
  end
end
local GetTideDungeonRewardReq = function(stageId, rspCallback)
  Net.Send(Proto.MsgName.FetchSceneStageRewardReq, {stageId = stageId}, rspCallback)
end
local GetTideDungeonRewardRsp = function(msg)
  GetItemTips.Show(msg.rewards, true)
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetSceneInfoRsp, GetTideDungeonInfoRsp)
  Net.AddListener(Proto.MsgName.FetchSceneStageRewardRsp, GetTideDungeonRewardRsp)
end
Init()
return {GetTideDungeonInfoReq = GetTideDungeonInfoReq, GetTideDungeonRewardReq = GetTideDungeonRewardReq}
