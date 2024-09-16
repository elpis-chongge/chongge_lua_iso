local PlayerPrefsUtil = {}
local PlayerPrefs = CS.UnityEngine.PlayerPrefs
PLAYER_PREF_ENUM = {
  CARD_TYPE = "CARD_TYPE",
  GUILD_LEVEL = "GUILD_LEVEL",
  GUILD_LIMIT_LEVEL = "GUILD_LIMIT_LEVEL",
  TEMP_ACCOUNT = "TEMP_ACCOUNT",
  TEMP_PASSWORD = "TEMP_PASSWORD",
  NEW_SEASON = "NEW_SEASON",
  ARENA_DAY = "ARENA_DAY",
  NOTICE_NEW = "NOTICE_NEW",
  BADGE_ALL_NEW = "BADGE_ALL_NEW",
  BADGE_SHOW_TYPE = "BADGE_SHOW_TYPE",
  PASSPORT_LEVEL = "PASSPORT_LEVEL",
  PROLOGUE_COMPLETE = "PROLOGUE_COMPLETE",
  PASSPORT_NEW = "PASSPORT_NEW",
  SHOP_RECOMMEND_NEW = "SHOP_RECOMMEND_NEW",
  CARD_JUMP = "CARD_JUMP",
  LOTTERY_EXCHANGE = "LOTTERY_EXCHANGE",
  ONE_GIFT_DAY = "ONE_GIFT_DAY",
  PASSPORT_ACTIVITY_NEW = "PASSPORT_ACTIVITY_NEW",
  PASSPORT_ACTIVITY_LEVEL = "PASSPORT_ACTIVITY_LEVEL",
  UI_HIGH_FPS_ENABLE = "UI_HIGH_FPS_ENABLE",
  ANNOUNCEMENT_ALWAYS_ENABLE = "ANNOUNCEMENT_ALWAYS_ENABLE",
  SCREEN_ADAPT_RATIO = UIMgr.ScreenAdaptRatioKey,
  HOME_LOOK_ROLE = "HOME_LOOK_ROLE",
  WEATHER_SHOW_TYPE = "WEATHER_SHOW_TYPE",
  HOME_ROLE_TEXT_ENABLE = "HOME_ROLE_TEXT_ENABLE",
  LANGUAGE = "LANGUAGE",
  LANGUAGE_VOICE = "LANGUAGE_VOICE_NEW",
  SHOW_SPINE_LIGHT = "SHOW_SPINE_LIGHT",
  BATTLE_BUFF_ENABLE = "BATTLE_BUFF_ENABLE",
  BATTLE_BLOOD_ENABLE = "BATTLE_BLOOD_ENABLE",
  BATTLE_HP_PER_ENABLE = "BATTLE_HP_PER_ENABLE",
  MESSAGE_BAR_ENABLE = "MESSAGE_BAR_ENABLE",
  NORMAL_HURT_NUMBER = "NORMAL_HURT_NUMBER",
  BATTLE_BURST_CARD_SHOW = "BATTLE_BURST_CARD_SHOW",
  BATTLE_BURST_ANIM_SHOW = "BATTLE_BURST_ANIM_SHOW",
  SFX_ENABLE = "SFX_ENABLE",
  MUSIC_ENABLE = "MUSIC_ENABLE",
  VOICE_ENABLE = "VOICE_ENABLE",
  SFX_VOLUME = "SFX_VOLUME",
  MUSIC_VOLUME = "MUSIC_VOLUME",
  VOICE_VOLUME = "VOICE_VOLUME",
  BATTLE_TIMELINE_BURST_CARD = "BATTLE_TIMELINE_BURST_CARD",
  BATTLE_TIMELINE_SPECIAL = "BATTLE_TIMELINE_SPECIAL",
  BATTLE_TIMELINE_BADGE = "BATTLE_TIMELINE_BADGE",
  BATTLE_TIMELINE_DEATH = "BATTLE_TIMELINE_DEATH",
  BATTLE_TIMELINE_MANUALLY_SKILL = "BATTLE_TIMELINE_MANUALLY_SKILL",
  GUIDE_NOTE = "GUIDE_NOTE",
  GUIDE_PICTURE = "GUIDE_PICTURE",
  ABYSS_EXPLORE_DEFAULT_CHR = "ABYSS_EXPLORE_DEFAULT_CHR",
  ABYSS_ACTIVITY_BANNER_STATE = "ABYSS_ACTIVITY_BANNER_STATE",
  ABYSS_MINIMAP_ZOOM_SCALE = "ABYSS_MINIMAP_ZOOM_SCALE",
  ABYSS_SHOP_INSPECTED_ITEMS = "ABYSS_SHOP_INSPECTED_ITEMS",
  ABYSS_REGION_UNLOCK_RECORDS = "ABYSS_REGION_UNLOCK_RECORDS",
  ABYSS_MAP_FLAGS_RECORDS = "ABYSS_MAP_FLAGS_RECORDS",
  ABYSS_BRANCH_ACTIVITY_RECORDS = "ABYSS_BRANCH_ACTIVITY_RECORDS",
  ABYSS_TREASURE_RECORDS = "ABYSS_TREASURE_RECORDS",
  ABYSS_GUIDE_BOSS_CHALLENGE = "ABYSS_GUIDE_BOSS_CHALLENGE",
  ABYSS_GUIDE_EXPEDITION = "ABYSS_GUIDE_EXPEDITION",
  ABYSS_GUIDE_BUILDING = "ABYSS_GUIDE_BUILDING",
  ABYSS_GUIDE_ROGUE = "ABYSS_GUIDE_ROGUE",
  ABYSS_GUIDE_FROSTDUNGEON = "ABYSS_GUIDE_FROSTDUNGEON",
  EXPEDITION_BUFF_RECORD = "EXPEDITION_BUFF_RECORD",
  EXPEDITION_STAGE_RECORD = "EXPEDITION_STAGE_RECORD",
  DAILY_STAGE_NEW = "DAILY_STAGE_NEW",
  PLOT_ANIM_CHAPTER_OPEN = "PLOT_ANIM_CHAPTER_OPEN",
  TOWER_CHAPTER_OPEN = "TOWER_CHAPTER_OPEN",
  BATTLE_AUTO_SKILL = "BATTLE_AUTO_SKILL",
  BATTLE_SPEED = "BATTLE_SPEED",
  BATTLE_AUTO_MANUALLY_SKILL = "BATTLE_AUTO_MANUALLY_SKILL",
  TASK_GROW_REWARD_PHASE = "TASK_GROW_REWARD_PHASE",
  GUIDE_CAPTION_OPEN = "GUIDE_CAPTION_OPEN",
  FORMATION_CARD_COUNT = "FORMATION_CARD_COUNT",
  RAID_BOSS_PLAYER_RANK = "RAID_BOSS_PLAYER_RANK",
  RAID_BOSS_HAS_CHALLENGE_COUNT = "RAID_BOSS_HAS_CHALLENGE_COUNT",
  RAID_BOSS_SEASON_RECORD = "RAID_BOSS_SEASON_RECORD",
  RAID_BOSS_DEADLINE = "RAID_BOSS_DEADLINE",
  ROGUE_GAME_TREASURE = "ROGUE_GAME_TREASURE",
  ROGUE_GAME_HALIDOM = "ROGUE_GAME_HALIDOM",
  ROGUE_DIFFICULTY_LEVEL = "ROGUE_DIFFICULTY_LEVEL",
  ROGUE_LOCK_LEVEL = "ROGUE_LOCK_LEVEL",
  ACTIVIVTY_DUNGEON_DAY = "ACTIVIVTY_DUNGEON_DAY",
  IOS_REVIEW = "IOS_REVIEW",
  GUILD_WAR_TODAY_HAS_FIGHT_COUNT = "GUILD_WAR_TODAY_HAS_FIGHT_COUNT",
  GUILD_WAR_DAILY_ENTRANCE = "GUILD_WAR_DAILY_ENTRANCE"
}
PLAYER_PREF_SAVED_INFO = {
  CARD_TYPE = {bindPlayer = 1},
  GUILD_LEVEL = {savedServer = 1, bindPlayer = 1},
  GUILD_LIMIT_LEVEL = {savedServer = 1, bindPlayer = 1},
  TEMP_ACCOUNT = {},
  TEMP_PASSWORD = {},
  NEW_SEASON = {savedServer = 1, bindPlayer = 1},
  ARENA_DAY = {savedServer = 1, bindPlayer = 1},
  NOTICE_NEW = {bindPlayer = 1},
  BADGE_ALL_NEW = {bindPlayer = 1, savedServer = 1},
  BADGE_SHOW_TYPE = {bindPlayer = 1},
  PASSPORT_LEVEL = {savedServer = 1, bindPlayer = 1},
  PROLOGUE_COMPLETE = {bindAccount = 1},
  PASSPORT_NEW = {bindPlayer = 1},
  SHOP_RECOMMEND_NEW = {bindPlayer = 1},
  CARD_JUMP = {bindPlayer = 1},
  LOTTERY_EXCHANGE = {bindPlayer = 1},
  PASSPORT_ACTIVITY_LEVEL = {savedServer = 1, bindPlayer = 1},
  PASSPORT_ACTIVITY_NEW = {bindPlayer = 1},
  ONE_GIFT_DAY = {savedServer = 1, bindPlayer = 1},
  UI_HIGH_FPS_ENABLE = {
    savedServer = 1,
    bindPlayer = 1,
    opType = 4
  },
  ANNOUNCEMENT_ALWAYS_ENABLE = {
    savedServer = 1,
    bindPlayer = 1,
    opType = 5
  },
  SHOW_SPINE_LIGHT = {savedServer = 1, bindPlayer = 1},
  SCREEN_ADAPT_RATIO = {},
  WEATHER_SHOW_TYPE = {savedServer = 1, bindPlayer = 1},
  HOME_LOOK_ROLE = {savedServer = 1, bindPlayer = 1},
  HOME_ROLE_TEXT_ENABLE = {savedServer = 1, bindPlayer = 1},
  LANGUAGE = {},
  LANGUAGE_VOICE = {},
  BATTLE_BUFF_ENABLE = {
    savedServer = 1,
    bindPlayer = 1,
    opType = 10
  },
  BATTLE_BLOOD_ENABLE = {
    savedServer = 1,
    bindPlayer = 1,
    opType = 11
  },
  BATTLE_HP_PER_ENABLE = {savedServer = 1, bindPlayer = 1},
  MESSAGE_BAR_ENABLE = {savedServer = 1, bindPlayer = 1},
  NORMAL_HURT_NUMBER = {
    savedServer = 1,
    bindPlayer = 1,
    opType = 12
  },
  BATTLE_BURST_CARD_SHOW = {savedServer = 1, bindPlayer = 1},
  BATTLE_BURST_ANIM_SHOW = {savedServer = 1, bindPlayer = 1},
  SFX_ENABLE = {
    savedServer = 1,
    bindPlayer = 1,
    opType = 7
  },
  MUSIC_ENABLE = {
    savedServer = 1,
    bindPlayer = 1,
    opType = 8
  },
  VOICE_ENABLE = {
    savedServer = 1,
    bindPlayer = 1,
    opType = 9
  },
  SFX_VOLUME = {savedServer = 1, bindPlayer = 1},
  MUSIC_VOLUME = {savedServer = 1, bindPlayer = 1},
  VOICE_VOLUME = {savedServer = 1, bindPlayer = 1},
  BATTLE_TIMELINE_BURST_CARD = {bindPlayer = 1},
  BATTLE_TIMELINE_SPECIAL = {bindPlayer = 1},
  BATTLE_TIMELINE_BADGE = {bindPlayer = 1},
  BATTLE_TIMELINE_DEATH = {bindPlayer = 1},
  BATTLE_TIMELINE_MANUALLY_SKILL = {bindPlayer = 1},
  GUIDE_NOTE = {bindPlayer = 1},
  GUIDE_PICTURE = {bindPlayer = 1},
  DAILY_STAGE_NEW = {savedServer = 1, bindPlayer = 1},
  PLOT_ANIM_CHAPTER_OPEN = {savedServer = 1, bindPlayer = 1},
  TOWER_CHAPTER_OPEN = {savedServer = 1, bindPlayer = 1},
  BATTLE_AUTO_SKILL = {savedServer = 1, bindPlayer = 1},
  BATTLE_AUTO_MANUALLY_SKILL = {savedServer = 1, bindPlayer = 1},
  BATTLE_SPEED = {savedServer = 1, bindPlayer = 1},
  ABYSS_EXPLORE_DEFAULT_CHR = {bindPlayer = 1},
  ABYSS_ACTIVITY_BANNER_STATE = {bindPlayer = 1},
  ABYSS_MINIMAP_ZOOM_SCALE = {bindPlayer = 1},
  ABYSS_SHOP_INSPECTED_ITEMS = {bindPlayer = 1},
  ABYSS_REGION_UNLOCK_RECORDS = {bindPlayer = 1},
  ABYSS_MAP_FLAGS_RECORDS = {bindPlayer = 1},
  ABYSS_BRANCH_ACTIVITY_RECORDS = {bindPlayer = 1},
  ABYSS_TREASURE_RECORDS = {bindPlayer = 1},
  ABYSS_GUIDE_BOSS_CHALLENGE = {savedServer = 1, bindPlayer = 1},
  ABYSS_GUIDE_EXPEDITION = {savedServer = 1, bindPlayer = 1},
  ABYSS_GUIDE_BUILDING = {savedServer = 1, bindPlayer = 1},
  ABYSS_GUIDE_ROGUE = {savedServer = 1, bindPlayer = 1},
  ABYSS_GUIDE_FROSTDUNGEON = {savedServer = 1, bindPlayer = 1},
  EXPEDITION_BUFF_RECORD = {bindPlayer = 1},
  EXPEDITION_STAGE_RECORD = {bindPlayer = 1},
  TASK_GROW_REWARD_PHASE = {savedServer = 1, bindPlayer = 1},
  GUIDE_CAPTION_OPEN = {savedServer = 1, bindPlayer = 1},
  FORMATION_CARD_COUNT = {savedServer = 1, bindPlayer = 1},
  RAID_BOSS_PLAYER_RANK = {savedServer = 1, bindPlayer = 1},
  RAID_BOSS_HAS_CHALLENGE_COUNT = {bindPlayer = 1},
  RAID_BOSS_SEASON_RECORD = {bindPlayer = 1},
  RAID_BOSS_DEADLINE = {bindPlayer = 1},
  ROGUE_GAME_TREASURE = {bindPlayer = 1},
  ROGUE_GAME_HALIDOM = {bindPlayer = 1},
  ROGUE_DIFFICULTY_LEVEL = {bindPlayer = 1},
  ROGUE_LOCK_LEVEL = {savedServer = 1, bindPlayer = 1},
  ACTIVIVTY_DUNGEON_DAY = {savedServer = 1, bindPlayer = 1},
  IOS_REVIEW = {savedServer = 1, bindPlayer = 1},
  GUILD_WAR_DAILY_ENTRANCE = {bindPlayer = 1}
}
PLAYER_PREF_DEFAULT_VALUE = {
  UI_HIGH_FPS_ENABLE = GetDefaultPlatformFPSLevel(),
  ANNOUNCEMENT_ALWAYS_ENABLE = 1,
  SHOW_SPINE_LIGHT = 1,
  HOME_LOOK_ROLE = "",
  HOME_ROLE_TEXT_ENABLE = 1,
  BADGE_ALL_NEW = "",
  NEW_SEASON = 0,
  ARENA_DAY = 0,
  PLOT_ANIM_CHAPTER_OPEN = 0,
  TOWER_CHAPTER_OPEN = 0,
  SCREEN_ADAPT_RATIO = GetDefaultScreenAdaptRatio(),
  WEATHER_SHOW_TYPE = 0,
  BADGE_SHOW_TYPE = 1,
  LOTTERY_EXCHANGE = 0,
  ONE_GIFT_DAY = 0,
  BATTLE_BUFF_ENABLE = 1,
  BATTLE_BLOOD_ENABLE = 1,
  BATTLE_HP_PER_ENABLE = 0,
  MESSAGE_BAR_ENABLE = 0,
  NORMAL_HURT_NUMBER = 0,
  BATTLE_BURST_CARD_SHOW = 1,
  BATTLE_BURST_ANIM_SHOW = 1,
  SFX_ENABLE = 1,
  MUSIC_ENABLE = 1,
  VOICE_ENABLE = 1,
  GUILD_LEVEL = 0,
  GUILD_LIMIT_LEVEL = 0,
  SFX_VOLUME = 100,
  MUSIC_VOLUME = 100,
  VOICE_VOLUME = 100,
  BATTLE_TIMELINE_BURST_CARD = 1,
  BATTLE_TIMELINE_SPECIAL = 1,
  BATTLE_TIMELINE_BADGE = 1,
  BATTLE_TIMELINE_DEATH = 1,
  BATTLE_TIMELINE_MANUALLY_SKILL = 1,
  SHOP_RECOMMEND_NEW = "",
  GUIDE_NOTE = "",
  GUIDE_PICTURE = "",
  PASSPORT_LEVEL = "",
  DAILY_STAGE_NEW = "",
  PASSPORT_NEW = 0,
  PASSPORT_ACTIVITY_LEVEL = "",
  PASSPORT_ACTIVITY_NEW = 0,
  PROLOGUE_COMPLETE = "",
  CARD_JUMP = "",
  BATTLE_AUTO_SKILL = 0,
  BATTLE_AUTO_MANUALLY_SKILL = 0,
  BATTLE_SPEED = 2,
  TASK_GROW_REWARD_PHASE = 0,
  GUIDE_CAPTION_OPEN = "",
  FORMATION_CARD_COUNT = 0,
  ROGUE_DIFFICULTY_LEVEL = -1,
  ROGUE_LOCK_LEVEL = 0,
  IOS_REVIEW = 0
}
local SetAccountString = function(key, value)
  local account = LoginData.openId
  PlayerPrefs.SetString(FormatOpenId(key), value)
end
local GetAccountString = function(key, default)
  return PlayerPrefs.GetString(FormatOpenId(key), default)
end
local SetPlayerString = function(key, value)
  PlayerPrefs.SetString(FormatUin(key), value)
end
local GetPlayerString = function(key, default)
  return PlayerPrefs.GetString(FormatUin(key), default)
end
local SetGlobalString = function(key, value)
  PlayerPrefs.SetString(key, value)
end
local GetGlobalString = function(key, default)
  return PlayerPrefs.GetString(key, default)
end

function PlayerPrefsUtil.SetInt(key, value, extraKey)
  PlayerPrefsUtil.SetString(key, value, extraKey)
end

function PlayerPrefsUtil.GetInt(key, default, extraKey)
  return tonumber(PlayerPrefsUtil.GetString(key, default, extraKey))
end

function PlayerPrefsUtil.SetString(key, value, extraKey)
  local savedInfo = PLAYER_PREF_SAVED_INFO[key]
  local fullKey = extraKey and key .. "_" .. extraKey or key
  if savedInfo and 1 == savedInfo.bindPlayer then
    SetPlayerString(fullKey, value)
    SettingUtil.UpdateSetting(fullKey, value, 1 == savedInfo.savedServer, savedInfo.opType)
  elseif savedInfo and 1 == savedInfo.bindAccount then
    SetAccountString(fullKey, value)
    SettingUtil.UpdateSetting(fullKey, value, 1 == savedInfo.savedServer, savedInfo.opType)
  else
    SetGlobalString(fullKey, value)
    SettingUtil.UpdateSetting(fullKey, value)
  end
end

function PlayerPrefsUtil.GetString(key, default, extraKey)
  local savedInfo = PLAYER_PREF_SAVED_INFO[key]
  default = default or PLAYER_PREF_DEFAULT_VALUE[key]
  local fullKey = extraKey and key .. "_" .. extraKey or key
  if savedInfo and 1 == savedInfo.bindPlayer then
    return GetPlayerString(fullKey, tostring(default or 0))
  elseif savedInfo and 1 == savedInfo.bindAccount then
    return GetAccountString(fullKey, tostring(default or 0))
  else
    return GetGlobalString(fullKey, tostring(default or 0))
  end
end

function PlayerPrefsUtil.SetFloat(key, value)
  PlayerPrefsUtil.SetString(key, value)
end

function PlayerPrefsUtil.GetFloat(key, default)
  return tonumber(PlayerPrefsUtil.GetString(key, default))
end

return PlayerPrefsUtil
