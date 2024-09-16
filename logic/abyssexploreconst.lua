AbyssExploreEventID = {
  POSITIVE = 1,
  BRANCH = 2,
  DAILY_RANDOM = 3,
  BUILDING = 4,
  BUILDING_RANDOM = 5,
  OBSTACLE = 6,
  ILLUSTRATIONS_BGM = 7,
  ILLUSTRATIONS_MONSTER = 8,
  DAILY_RANDOM_NEWBIE = 9,
  BRANCH_ACTIVITY = 10,
  EXPEDITION_BUILDING = 11,
  CHALLENGE_BOSS = 12,
  ROGUELIKE = 13,
  PORTAL = 14,
  FROST_DUNGEON = 15,
  GUILD_WAR_ENTRANCE = 16,
  VIEW_ONLY = 17,
  EXPLORE_AFK = 18
}
AbyssExploreSubEventID = {
  BATTLE = 1,
  DIALOGUE = 2,
  TREASURE = 3,
  INDICATE = 4
}
AbyssExploreBranchNodeType = {
  BATTLE = 1,
  DIALOGUE = 2,
  GAIN = 3
}
AbyssExploreStoryType = {
  Branch = 1,
  Random_Moving = 2,
  Random_Building = 3
}
AbyssExploreStoryItemType = {
  BATTLE_TEXT = 1,
  DIALOGUE = 2,
  OPTION = 3,
  VOICEOVER = 4,
  BATTLE = 5,
  WEATHER = 6,
  GAIN = 7,
  COST = 8,
  SPLITTERS = 9527,
  END_BTN = 9999
}
AbyssExploreMsgEnum = {
  MAP_INIT_COMPLETE = 101,
  MAP_ENTERED = 102,
  EVENT_UPDATE = 201,
  EVENT_CREATE = 202,
  EVENT_COMPLETE = 203,
  EVENT_DELETE = 204,
  EVENT_FOCUS = 205,
  EVENT_UNFOCUS = 206,
  EVENT_TRACK = 207,
  EVENT_FOCUS_PATH_INFO = 208,
  EVENT_BRANCH_PATH_INFO = 209,
  EVENT_WIN_CLOSE = 210,
  EVENT_OVERLAP = 211,
  EVENT_RES_LOADED = 212,
  HANDLE_EVENT = 220,
  HANDLE_EVENT_NO_POS = 221,
  HANDLE_CUR_LOCATION_EVENT = 222,
  PATHFIND_SUCCESS = 301,
  PATHFIND_FAILURE = 302,
  PATHFIND_FAILURE_UNLOCK_REGION = 303,
  TRIGGER_BATTLE = 401,
  TRIGGER_DIALOGUE = 402,
  TRIGGER_TREASURE = 403,
  TRIGGER_INDICATE = 404,
  TRIGGER_BRANCH = 405,
  TRIGGER_UNPASSABLE = 406,
  TRIGGER_EVENT = 499,
  BRANCH_START_ACK = 450,
  BRANCH_COMPLETE = 451,
  BRANCH_TRACK = 452,
  BATTLE_START = 501,
  BATTLE_COMPLETE = 502,
  CHA_INIT = 601,
  CHA_CHANGE = 602,
  CHA_MOVING = 603,
  CHA_MOVE_NEXT = 604,
  CHA_REACH_DST = 605,
  CHA_CONVEY = 606,
  CHA_START_MOVING = 610,
  CHA_STOP_MOVING = 611,
  REGION_CHANGE = 701,
  REGION_UNLOCK = 702,
  REGION_UNLOCK_ACK = 703,
  ACTIVITY_REFRESH = 801,
  UPDATE_PLAYER_INFO = 1001,
  RESET_CAMERA = 1101,
  ENABLE_RESET_CAM_BUTTON = 1201,
  CLICK_CHR = 1301,
  ILLUSTRATION_GET = 1401,
  ILLUSTRATION_ACK = 1402,
  POPUP_EVENT_TIPS = 1501,
  COLLECT_EVENTS = 1601,
  CAMERA_POSITION_CHANGED = 1701,
  GOTO_EVENT = 2000,
  GOTO_BOSS_CHALLENGE = 2001
}
AbyssPathfindingType = {
  Positive = 1000,
  Navigation_Event = 2000,
  Navigation_Branch = 3000,
  NearestPositionPath = 5000
}
AbyssExploreSettings = {
  Map = {
    ppu = 100,
    width = 5888,
    height = 5120,
    sortingOrder = -100,
    size = Vector2(63.68, 47.66),
    origin = Vector2(968.16, 976.17)
  },
  FOW = {sortingOrder = 20},
  CHR = {
    sortingOrder = 10,
    eulerAngles = Vector3(-0.01, 0, 0),
    scale = 0.175 * Vector3.one,
    layer = 25,
    centerOffset = Vector3(0, -0.056, 0)
  },
  Spine = {
    sortingOrder = 10,
    eulerAngles = Vector3(-0.01, 0, 0),
    scale = 0.125 * Vector3.one,
    centerOffset = Vector3(0, -0.05, 0)
  },
  Pic = {
    sortingOrder = 10,
    eulerAngles = Vector3(-0.01, 0, 0),
    scale = Vector3.one * 0.625
  },
  MainCam = {
    depth = -1,
    cullingMask = -33,
    eulerAngles = Vector3(-0.01, 0, 0),
    orthographicSize = 5,
    offsetZ = -10
  },
  SceneProps = {sortingOrdering = 10}
}
AbyssSceneResTag = {
  DEFAULT = 0,
  BIGGER = 1,
  REGION_FOG_1 = 2,
  REGION_FOG_2 = 4,
  REGION_FOG_3 = 8,
  REGION_FOG_4 = 16,
  REGION_FOG_5 = 32,
  REGION_FOG_6 = 64,
  REGION_FOG_7 = 128,
  REGION_FOG_8 = 256
}
AbyssRegionTagLookup = {
  [1] = AbyssSceneResTag.REGION_FOG_1,
  [2] = AbyssSceneResTag.REGION_FOG_2,
  [3] = AbyssSceneResTag.REGION_FOG_3,
  [4] = AbyssSceneResTag.REGION_FOG_4,
  [5] = AbyssSceneResTag.REGION_FOG_5,
  [6] = AbyssSceneResTag.REGION_FOG_6,
  [7] = AbyssSceneResTag.REGION_FOG_7,
  [8] = AbyssSceneResTag.REGION_FOG_8
}
AbyssTideDungeon = {
  Water = ProtoEnum.SCENE_TYPE.MANOR_WATER,
  Fire = ProtoEnum.SCENE_TYPE.MANOR_FIR,
  Wood = ProtoEnum.SCENE_TYPE.MANOR_WOOD
}
