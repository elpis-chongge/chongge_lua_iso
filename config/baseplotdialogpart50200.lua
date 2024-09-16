BasePlotDialogPart50200 = {
  [1100501001] = {
    id = 1100501001,
    talk_text = function()
      return T_S(11005010010)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501001/1100501001_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501002,
    speak_name = function()
      return T_S(11005010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00333",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20007,
    open_title_1 = function()
      return T_S(11005010018)
    end,
    open_title_2 = function()
      return T_S(11005010019)
    end
  },
  [1100501002] = {
    id = 1100501002,
    talk_text = function()
      return T_S(11005010020)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501002/1100501002_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501002/1100501002_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-321:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501003,
    speak_name = function()
      return T_S(11005010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00448",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20007
  },
  [1100501003] = {
    id = 1100501003,
    talk_text = function()
      return T_S(11005010030)
    end,
    is_master = 1,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501003/1100501003_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501003/1100501003_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-321:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1100501004,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00334_04",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  },
  [1100501004] = {
    id = 1100501004,
    talk_text = function()
      return T_S(11005010040)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501004/1100501004_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501004/1100501004_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"180:-1066", "-180:-1000"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100501117,
    speak_name = function()
      return T_S(11005010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00266_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20007
  },
  [1100501005] = {
    id = 1100501005,
    talk_text = function()
      return T_S(11005010050)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501005/1100501005_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501005/1100501005_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"180:-1066", "-180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501006,
    speak_name = function()
      return T_S(11005010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00291",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20007
  },
  [1100501006] = {
    id = 1100501006,
    talk_text = function()
      return T_S(11005010060)
    end,
    next_dialog = 1100501007,
    env_sound = 20007
  },
  [1100501007] = {
    id = 1100501007,
    talk_text = function()
      return T_S(11005010070)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501007/1100501007_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501118,
    speak_name = function()
      return T_S(11005010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20007
  },
  [1100501008] = {
    id = 1100501008,
    talk_text = function()
      return T_S(11005010080)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501008/1100501008_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501009,
    speak_name = function()
      return T_S(11005010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00334",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20007
  },
  [1100501009] = {
    id = 1100501009,
    talk_text = function()
      return T_S(11005010090)
    end,
    role_ids = {90110004, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501009/1100501009_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501009/1100501009_90110009.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-321:-1160", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501010,
    speak_name = function()
      return T_S(11005010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00157",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20007
  },
  [1100501010] = {
    id = 1100501010,
    talk_text = function()
      return T_S(11005010100)
    end,
    role_ids = {90110004, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501010/1100501010_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501010/1100501010_90110009.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-321:-1160", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501011,
    speak_name = function()
      return T_S(11005010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00158",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20007
  },
  [1100501011] = {
    id = 1100501011,
    talk_text = function()
      return T_S(11005010110)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501011/1100501011_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501012,
    speak_name = function()
      return T_S(11005010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20007
  },
  [1100501012] = {
    id = 1100501012,
    talk_text = function()
      return T_S(11005010120)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501012/1100501012_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_1.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501013,
    speak_name = function()
      return T_S(11005010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00159",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20007
  },
  [1100501013] = {
    id = 1100501013,
    talk_text = function()
      return T_S(11005010130)
    end,
    role_ids = {90110009, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501013/1100501013_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501013/1100501013_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1080", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501133,
    speak_name = function()
      return T_S(11005010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00449",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20007
  },
  [1100501014] = {
    id = 1100501014,
    talk_text = function()
      return T_S(11005010140)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501014/1100501014_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501015,
    speak_name = function()
      return T_S(11005010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00266_03",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20007
  },
  [1100501015] = {
    id = 1100501015,
    talk_text = function()
      return T_S(11005010150)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501015/1100501015_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501016,
    speak_name = function()
      return T_S(11005010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20007
  },
  [1100501016] = {
    id = 1100501016,
    talk_text = function()
      return T_S(11005010160)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501016/1100501016_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501017,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11005010165)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20007
  },
  [1100501017] = {
    id = 1100501017,
    talk_text = function()
      return T_S(11005010170)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501017/1100501017_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501018,
    speak_name = function()
      return T_S(11005010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20007
  },
  [1100501018] = {
    id = 1100501018,
    talk_text = function()
      return T_S(11005010180)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501018/1100501018_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501019,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11005010185)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00017",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20007
  },
  [1100501019] = {
    id = 1100501019,
    talk_text = function()
      return T_S(11005010190)
    end,
    next_dialog = 1100501020,
    camera_shake = {
      "2",
      "0",
      "2000"
    },
    env_sound = 20007,
    force_auto = 1,
    special_sound = 23023
  },
  [1100501020] = {
    id = 1100501020,
    talk_text = function()
      return T_S(11005010200)
    end,
    next_dialog = 1100501022,
    env_sound = 20003
  },
  [1100501021] = {
    id = 1100501021,
    talk_text = function()
      return T_S(11005010210)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501021/1100501021_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1100501042,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00336",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20003
  },
  [1100501022] = {
    id = 1100501022,
    talk_text = function()
      return T_S(11005010220)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501022/1100501022_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501023,
    speak_name = function()
      return T_S(11005010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00451",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20003
  },
  [1100501023] = {
    id = 1100501023,
    talk_text = function()
      return T_S(11005010230)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501023/1100501023_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501024,
    env_sound = 20003
  },
  [1100501024] = {
    id = 1100501024,
    talk_text = function()
      return T_S(11005010240)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501024/1100501024_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501025,
    speak_name = function()
      return T_S(11005010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00452",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20003
  },
  [1100501025] = {
    id = 1100501025,
    talk_text = function()
      return T_S(11005010250)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501025/1100501025_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501025/1100501025_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501026,
    speak_name = function()
      return T_S(11005010255)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00266_04",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100501026] = {
    id = 1100501026,
    talk_text = function()
      return T_S(11005010260)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501026/1100501026_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501027,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11005010265)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20003
  },
  [1100501027] = {
    id = 1100501027,
    talk_text = function()
      return T_S(11005010270)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501027/1100501027_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501028,
    speak_name = function()
      return T_S(11005010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20003
  },
  [1100501028] = {
    id = 1100501028,
    talk_text = function()
      return T_S(11005010280)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501028/1100501028_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501029,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11005010285)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00019",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20003
  },
  [1100501029] = {
    id = 1100501029,
    talk_text = function()
      return T_S(11005010290)
    end,
    next_dialog = 1100501030,
    camera_shake = {
      "1",
      "0",
      "2400"
    },
    env_sound = 20003
  },
  [1100501030] = {
    id = 1100501030,
    talk_text = function()
      return T_S(11005010300)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501030/1100501030_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501031,
    speak_name = function()
      return T_S(11005010305)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00453",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20003
  },
  [1100501031] = {
    id = 1100501031,
    talk_text = function()
      return T_S(11005010310)
    end,
    next_dialog = 1100501032,
    camera_shake = {
      "1",
      "0",
      "1800"
    },
    env_sound = 20003
  },
  [1100501032] = {
    id = 1100501032,
    talk_text = function()
      return T_S(11005010320)
    end,
    next_dialog = 1100501033,
    env_sound = 20003
  },
  [1100501033] = {
    id = 1100501033,
    talk_text = function()
      return T_S(11005010330)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501033/1100501033_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501034,
    speak_name = function()
      return T_S(11005010335)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00454",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20003
  },
  [1100501034] = {
    id = 1100501034,
    talk_text = function()
      return T_S(11005010340)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501034/1100501034_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501034/1100501034_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501035,
    speak_name = function()
      return T_S(11005010345)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00267",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100501035] = {
    id = 1100501035,
    talk_text = function()
      return T_S(11005010350)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501035/1100501035_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501036,
    speak_name = function()
      return T_S(11005010355)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00292",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20003
  },
  [1100501036] = {
    id = 1100501036,
    talk_text = function()
      return T_S(11005010360)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501036/1100501036_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501036/1100501036_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1000", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501037,
    speak_name = function()
      return T_S(11005010365)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00455",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20003
  },
  [1100501037] = {
    id = 1100501037,
    talk_text = function()
      return T_S(11005010370)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501037/1100501037_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501037/1100501037_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-120:-1000", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100501038,
    speak_name = function()
      return T_S(11005010375)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00293",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20003
  },
  [1100501038] = {
    id = 1100501038,
    talk_text = function()
      return T_S(11005010380)
    end,
    next_dialog = 1100501039,
    env_sound = 20003
  },
  [1100501039] = {
    id = 1100501039,
    talk_text = function()
      return T_S(11005010390)
    end,
    next_dialog = 1100501040,
    env_sound = 20003
  },
  [1100501040] = {
    id = 1100501040,
    talk_text = function()
      return T_S(11005010400)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501040/1100501040_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501041,
    speak_name = function()
      return T_S(11005010405)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00335",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20003
  },
  [1100501041] = {
    id = 1100501041,
    talk_text = function()
      return T_S(11005010410)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501041/1100501041_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1100501021,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00335",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20003
  },
  [1100501042] = {
    id = 1100501042,
    talk_text = function()
      return T_S(11005010420)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501042/1100501042_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501043,
    speak_name = function()
      return T_S(11005010425)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00336",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20003
  },
  [1100501043] = {
    id = 1100501043,
    talk_text = function()
      return T_S(11005010430)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501043/1100501043_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1100501044,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00337",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20003
  },
  [1100501044] = {
    id = 1100501044,
    talk_text = function()
      return T_S(11005010440)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501044/1100501044_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1100501045,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00338",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20003
  },
  [1100501045] = {
    id = 1100501045,
    talk_text = function()
      return T_S(11005010450)
    end,
    next_dialog = 1100501046,
    camera_shake = {
      "3",
      "0",
      "2000"
    },
    env_sound = 20004
  },
  [1100501046] = {
    id = 1100501046,
    talk_text = function()
      return T_S(11005010460)
    end,
    next_dialog = 1100501047,
    env_sound = 20004
  },
  [1100501047] = {
    id = 1100501047,
    talk_text = function()
      return T_S(11005010470)
    end,
    next_dialog = 1100501048,
    env_sound = 20004
  },
  [1100501048] = {
    id = 1100501048,
    talk_text = function()
      return T_S(11005010480)
    end,
    next_dialog = 1100501049,
    env_sound = 20004,
    special_sound = 23019
  },
  [1100501049] = {
    id = 1100501049,
    talk_text = function()
      return T_S(11005010490)
    end,
    next_dialog = 1100501050,
    camera_shake = {
      "3",
      "0",
      "2400"
    },
    env_sound = 20004
  },
  [1100501050] = {
    id = 1100501050,
    talk_text = function()
      return T_S(11005010500)
    end,
    next_dialog = 1100501051,
    env_sound = 20004
  },
  [1100501051] = {
    id = 1100501051,
    talk_text = function()
      return T_S(11005010510)
    end,
    next_dialog = 1100501052,
    env_sound = 20004
  },
  [1100501052] = {
    id = 1100501052,
    talk_text = function()
      return T_S(11005010520)
    end,
    next_dialog = 1100501053,
    env_sound = 20004
  },
  [1100501053] = {
    id = 1100501053,
    talk_text = function()
      return T_S(11005010530)
    end,
    next_dialog = 1100501054,
    camera_shake = {
      "1",
      "0",
      "2400"
    },
    env_sound = 20004
  },
  [1100501054] = {
    id = 1100501054,
    talk_text = function()
      return T_S(11005010540)
    end,
    next_dialog = 1100501055,
    env_sound = 20004
  },
  [1100501055] = {
    id = 1100501055,
    talk_text = function()
      return T_S(11005010550)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501055/1100501055_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"1:0:900"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501056,
    speak_name = function()
      return T_S(11005010555)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00456",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20004
  },
  [1100501056] = {
    id = 1100501056,
    talk_text = function()
      return T_S(11005010560)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501056/1100501056_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"2:0:1500"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501057,
    speak_name = function()
      return T_S(11005010565)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00457",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20004
  },
  [1100501057] = {
    id = 1100501057,
    talk_text = function()
      return T_S(11005010570)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501057/1100501057_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501058,
    speak_name = function()
      return T_S(11005010575)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00458",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20004
  },
  [1100501058] = {
    id = 1100501058,
    talk_text = function()
      return T_S(11005010580)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501058/1100501058_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501058/1100501058_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501059,
    speak_name = function()
      return T_S(11005010585)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00294",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20004
  },
  [1100501059] = {
    id = 1100501059,
    talk_text = function()
      return T_S(11005010590)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501059/1100501059_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501059/1100501059_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1100501060,
    env_sound = 20004
  },
  [1100501060] = {
    id = 1100501060,
    talk_text = function()
      return T_S(11005010600)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501060/1100501060_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501060/1100501060_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1100501061,
    env_sound = 20004
  },
  [1100501061] = {
    id = 1100501061,
    talk_text = function()
      return T_S(11005010610)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501061/1100501061_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501061/1100501061_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501062,
    speak_name = function()
      return T_S(11005010615)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00295",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20004
  },
  [1100501062] = {
    id = 1100501062,
    talk_text = function()
      return T_S(11005010620)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501062/1100501062_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"3"},
    effect_in_param = {"270"},
    effect_out = {"2"},
    effect_out_param = {"270"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501063,
    speak_name = function()
      return T_S(11005010625)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00160",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20004
  },
  [1100501063] = {
    id = 1100501063,
    talk_text = function()
      return T_S(11005010630)
    end,
    scale = {10000},
    next_dialog = 1100501064,
    env_sound = 20004
  },
  [1100501064] = {
    id = 1100501064,
    talk_text = function()
      return T_S(11005010640)
    end,
    role_ids = {90110010},
    scale = {10000, 10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501064/1100501064_90110010.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"0:-958"},
    effect_in = {"3"},
    effect_in_param = {"270"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501065,
    speak_name = function()
      return T_S(11005010645)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00032",
    text_sound_bank = "bank:/voice_cn/sty/M0016",
    env_sound = 20004
  },
  [1100501065] = {
    id = 1100501065,
    talk_text = function()
      return T_S(11005010650)
    end,
    role_ids = {90110010, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501065/1100501065_90110010.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501065/1100501065_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-958", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501066,
    speak_name = function()
      return T_S(11005010655)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00295_01",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20004
  },
  [1100501066] = {
    id = 1100501066,
    talk_text = function()
      return T_S(11005010660)
    end,
    is_master = 1,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501066/1100501066_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1100501067,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00339",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501067] = {
    id = 1100501067,
    talk_text = function()
      return T_S(11005010670)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501067/1100501067_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501067/1100501067_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-1080", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501068,
    speak_name = function()
      return T_S(11005010675)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00337",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100501068] = {
    id = 1100501068,
    talk_text = function()
      return T_S(11005010680)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501068/1100501068_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501068/1100501068_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"270:-1080", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100501069,
    speak_name = function()
      return T_S(11005010685)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00161",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20004
  },
  [1100501069] = {
    id = 1100501069,
    talk_text = function()
      return T_S(11005010690)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501069/1100501069_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501069/1100501069_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"270:-1080", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501070,
    speak_name = function()
      return T_S(11005010695)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00338",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100501070] = {
    id = 1100501070,
    talk_text = function()
      return T_S(11005010700)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501070/1100501070_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501070/1100501070_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"270:-1080", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100501071,
    speak_name = function()
      return T_S(11005010705)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00162",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20004
  },
  [1100501071] = {
    id = 1100501071,
    talk_text = function()
      return T_S(11005010710)
    end,
    is_master = 1,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501071/1100501071_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501071/1100501071_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"270:-1080", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1100501072,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00340",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501072] = {
    id = 1100501072,
    talk_text = function()
      return T_S(11005010720)
    end,
    is_master = 1,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501072/1100501072_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501072/1100501072_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1080", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 1},
    next_dialog = 1100501073,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00341",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501073] = {
    id = 1100501073,
    talk_text = function()
      return T_S(11005010730)
    end,
    next_dialog = 1100501074,
    env_sound = 20004
  },
  [1100501074] = {
    id = 1100501074,
    talk_text = function()
      return T_S(11005010740)
    end,
    next_dialog = 1100501075,
    env_sound = 20004
  },
  [1100501075] = {
    id = 1100501075,
    talk_text = function()
      return T_S(11005010750)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501075/1100501075_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501076,
    speak_name = function()
      return T_S(11005010755)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00073",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1100501076] = {
    id = 1100501076,
    talk_text = function()
      return T_S(11005010760)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501076/1100501076_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501077,
    speak_name = function()
      return T_S(11005010765)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00074",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1100501077] = {
    id = 1100501077,
    talk_text = function()
      return T_S(11005010770)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501077/1100501077_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501078,
    env_sound = 20004
  },
  [1100501078] = {
    id = 1100501078,
    talk_text = function()
      return T_S(11005010780)
    end,
    next_dialog = 1100501079,
    speak_head = 90120013,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(11005010785)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00020",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20004
  },
  [1100501079] = {
    id = 1100501079,
    talk_text = function()
      return T_S(11005010790)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501079/1100501079_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    role_shake = {"2:0:1500"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501080,
    speak_name = function()
      return T_S(11005010795)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00063",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1100501080] = {
    id = 1100501080,
    talk_text = function()
      return T_S(11005010800)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501080/1100501080_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501081,
    speak_name = function()
      return T_S(11005010805)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00064",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1100501081] = {
    id = 1100501081,
    talk_text = function()
      return T_S(11005010810)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501081/1100501081_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501082,
    speak_name = function()
      return T_S(11005010815)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00065",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1100501082] = {
    id = 1100501082,
    talk_text = function()
      return T_S(11005010820)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501082/1100501082_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501083,
    speak_head = 90120013,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(11005010825)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00021",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20004
  },
  [1100501083] = {
    id = 1100501083,
    talk_text = function()
      return T_S(11005010830)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501083/1100501083_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501084,
    env_sound = 20004
  },
  [1100501084] = {
    id = 1100501084,
    talk_text = function()
      return T_S(11005010840)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501084/1100501084_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501085,
    speak_head = 90120013,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(11005010845)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20004
  },
  [1100501085] = {
    id = 1100501085,
    talk_text = function()
      return T_S(11005010850)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501085/1100501085_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501086,
    speak_name = function()
      return T_S(11005010855)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00066_01",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1100501086] = {
    id = 1100501086,
    talk_text = function()
      return T_S(11005010860)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501086/1100501086_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501087,
    speak_name = function()
      return T_S(11005010865)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00066_02",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1100501087] = {
    id = 1100501087,
    talk_text = function()
      return T_S(11005010870)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501087/1100501087_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501088,
    env_sound = 20004
  },
  [1100501088] = {
    id = 1100501088,
    talk_text = function()
      return T_S(11005010880)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501088/1100501088_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501089,
    speak_name = function()
      return T_S(11005010885)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00067",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1100501089] = {
    id = 1100501089,
    talk_text = function()
      return T_S(11005010890)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501089/1100501089_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501090,
    speak_head = 90120013,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(11005010895)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00023_01",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20004
  },
  [1100501090] = {
    id = 1100501090,
    talk_text = function()
      return T_S(11005010900)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501090/1100501090_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501091,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11005010905)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00023_02",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20004
  },
  [1100501091] = {
    id = 1100501091,
    talk_text = function()
      return T_S(11005010910)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501091/1100501091_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501092,
    speak_name = function()
      return T_S(11005010915)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00068",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1100501092] = {
    id = 1100501092,
    talk_text = function()
      return T_S(11005010920)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501092/1100501092_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501093,
    speak_name = function()
      return T_S(11005010925)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00069",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1100501093] = {
    id = 1100501093,
    talk_text = function()
      return T_S(11005010930)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501093/1100501093_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501094,
    speak_head = 90120013,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(11005010935)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00024",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20004
  },
  [1100501094] = {
    id = 1100501094,
    talk_text = function()
      return T_S(11005010940)
    end,
    next_dialog = 1100501095,
    env_sound = 20004
  },
  [1100501095] = {
    id = 1100501095,
    talk_text = function()
      return T_S(11005010950)
    end,
    next_dialog = 1100501096,
    speak_name = function()
      return T_S(11005010955)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00070",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004,
    review_head = "90120001"
  },
  [1100501096] = {
    id = 1100501096,
    talk_text = function()
      return T_S(11005010960)
    end,
    next_dialog = 1100501097,
    env_sound = 20004
  },
  [1100501097] = {
    id = 1100501097,
    talk_text = function()
      return T_S(11005010970)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501097/1100501097_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"70:-980"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501098,
    speak_name = function()
      return T_S(11005010975)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00459",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20004
  },
  [1100501098] = {
    id = 1100501098,
    talk_text = function()
      return T_S(11005010980)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501098/1100501098_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501098/1100501098_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"240:-980", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501099,
    speak_name = function()
      return T_S(11005010985)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00339",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100501099] = {
    id = 1100501099,
    talk_text = function()
      return T_S(11005010990)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501099/1100501099_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501099/1100501099_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501100,
    speak_name = function()
      return T_S(11005010995)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00340",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100501100] = {
    id = 1100501100,
    talk_text = function()
      return T_S(11005011000)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501100/1100501100_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501100/1100501100_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100501134,
    speak_name = function()
      return T_S(11005011005)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00460",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20004
  },
  [1100501101] = {
    id = 1100501101,
    talk_text = function()
      return T_S(11005011010)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501101/1100501101_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501101/1100501101_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501102,
    speak_name = function()
      return T_S(11005011015)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00341",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100501102] = {
    id = 1100501102,
    talk_text = function()
      return T_S(11005011020)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501102/1100501102_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501102/1100501102_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501103,
    speak_name = function()
      return T_S(11005011025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00342",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100501103] = {
    id = 1100501103,
    talk_text = function()
      return T_S(11005011030)
    end,
    is_master = 1,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501103/1100501103_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501103/1100501103_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1100501104,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00342",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501104] = {
    id = 1100501104,
    talk_text = function()
      return T_S(11005011040)
    end,
    is_master = 1,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501104/1100501104_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501104/1100501104_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1100501105,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00343",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501105] = {
    id = 1100501105,
    talk_text = function()
      return T_S(11005011050)
    end,
    next_dialog = 1100501106,
    env_sound = 20004
  },
  [1100501106] = {
    id = 1100501106,
    talk_text = function()
      return T_S(11005011060)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501106/1100501106_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501107,
    speak_name = function()
      return T_S(11005011065)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00075",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1100501107] = {
    id = 1100501107,
    talk_text = function()
      return T_S(11005011070)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501107/1100501107_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501108,
    speak_name = function()
      return T_S(11005011075)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00076",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1100501108] = {
    id = 1100501108,
    talk_text = function()
      return T_S(11005011080)
    end,
    is_master = 1,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501108/1100501108_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501109,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00344",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501109] = {
    id = 1100501109,
    talk_text = function()
      return T_S(11005011090)
    end,
    next_dialog = 1100501110,
    env_sound = 20004
  },
  [1100501110] = {
    id = 1100501110,
    talk_text = function()
      return T_S(11005011100)
    end,
    is_master = 1,
    next_dialog = 1100501111,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00345",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501111] = {
    id = 1100501111,
    talk_text = function()
      return T_S(11005011110)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501111/1100501111_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"3"},
    effect_out_param = {"320"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501112,
    speak_name = function()
      return T_S(11005011115)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00077",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1100501112] = {
    id = 1100501112,
    talk_text = function()
      return T_S(11005011120)
    end,
    next_dialog = 1100501113,
    env_sound = 20004
  },
  [1100501113] = {
    id = 1100501113,
    talk_text = function()
      return T_S(11005011130)
    end,
    is_master = 1,
    next_dialog = 1100501114,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00346",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501114] = {
    id = 1100501114,
    talk_text = function()
      return T_S(11005011140)
    end,
    next_dialog = 1100501115,
    camera_shake = {
      "2",
      "0",
      "1200"
    },
    env_sound = 20004
  },
  [1100501115] = {
    id = 1100501115,
    talk_text = function()
      return T_S(11005011150)
    end,
    next_dialog = 1100501116,
    env_sound = 20004
  },
  [1100501116] = {
    id = 1100501116,
    talk_text = function()
      return T_S(11005011160)
    end,
    next_dialog = 1100501135,
    env_sound = 20004
  },
  [1100501117] = {
    id = 1100501117,
    talk_text = function()
      return T_S(11005011170)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501117/1100501117_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501117/1100501117_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"180:-1066", "-180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100501005,
    speak_name = function()
      return T_S(11005011175)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00266_02",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20007
  },
  [1100501118] = {
    id = 1100501118,
    talk_text = function()
      return T_S(11005011180)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501118/1100501118_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501008,
    speak_name = function()
      return T_S(11005011185)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00058",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20007
  },
  [1100501119] = {
    id = 1100501119,
    talk_text = function()
      return T_S(11005011190)
    end,
    is_master = 1,
    next_dialog = 1100501120,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00347",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501120] = {
    id = 1100501120,
    talk_text = function()
      return T_S(11005011200)
    end,
    next_dialog = 1100501121,
    env_sound = 20004
  },
  [1100501121] = {
    id = 1100501121,
    talk_text = function()
      return T_S(11005011210)
    end,
    is_master = 1,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501121/1100501121_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    role_shake = {"2:0:900"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501122,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00348",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501122] = {
    id = 1100501122,
    talk_text = function()
      return T_S(11005011220)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501122/1100501122_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501123,
    speak_name = function()
      return T_S(11005011225)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00078",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1100501123] = {
    id = 1100501123,
    talk_text = function()
      return T_S(11005011230)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501123/1100501123_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"3"},
    effect_out_param = {"270"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501124,
    speak_name = function()
      return T_S(11005011235)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00079",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1100501124] = {
    id = 1100501124,
    talk_text = function()
      return T_S(11005011240)
    end,
    next_dialog = 1100501125,
    env_sound = 20004
  },
  [1100501125] = {
    id = 1100501125,
    talk_text = function()
      return T_S(11005011250)
    end,
    next_dialog = 1100501126,
    env_sound = 20004
  },
  [1100501126] = {
    id = 1100501126,
    talk_text = function()
      return T_S(11005011260)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501126/1100501126_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501127,
    speak_name = function()
      return T_S(11005011265)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00268",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20004
  },
  [1100501127] = {
    id = 1100501127,
    talk_text = function()
      return T_S(11005011270)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501127/1100501127_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501127/1100501127_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-1066", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501128,
    speak_name = function()
      return T_S(11005011275)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00343_01",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100501128] = {
    id = 1100501128,
    talk_text = function()
      return T_S(11005011280)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501128/1100501128_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501128/1100501128_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      ""
    },
    role_position = {"270:-1066", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501129,
    speak_name = function()
      return T_S(11005011285)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00343_02",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100501129] = {
    id = 1100501129,
    talk_text = function()
      return T_S(11005011290)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501129/1100501129_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501130,
    env_sound = 20004
  },
  [1100501130] = {
    id = 1100501130,
    talk_text = function()
      return T_S(11005011300)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501130/1100501130_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100501131,
    env_sound = 20004
  },
  [1100501131] = {
    id = 1100501131,
    talk_text = function()
      return T_S(11005011310)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501131/1100501131_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100501132,
    speak_name = function()
      return T_S(11005011315)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00080",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1100501132] = {
    id = 1100501132,
    talk_text = function()
      return T_S(11005011320)
    end,
    is_master = 1,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501132/1100501132_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00349",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100501133] = {
    id = 1100501133,
    talk_text = function()
      return T_S(11005011330)
    end,
    role_ids = {90110009, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501133/1100501133_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501133/1100501133_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1080", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100501014,
    speak_name = function()
      return T_S(11005011335)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00450",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20007
  },
  [1100501134] = {
    id = 1100501134,
    talk_text = function()
      return T_S(11005011340)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501134/1100501134_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100501134/1100501134_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1100501101,
    speak_name = function()
      return T_S(11005011345)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00461",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20004
  },
  [1100501135] = {
    id = 1100501135,
    talk_text = function()
      return T_S(11005011350)
    end,
    next_dialog = 1100501119,
    env_sound = 20004
  },
  [1100502001] = {
    id = 1100502001,
    talk_text = function()
      return T_S(11005020010)
    end,
    next_dialog = 1100502002,
    env_sound = 20004,
    special_sound = 23020,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_Scuffle.prefab",
      "0"
    }
  },
  [1100502002] = {
    id = 1100502002,
    talk_text = function()
      return T_S(11005020020)
    end,
    env_sound = 20004
  }
}
