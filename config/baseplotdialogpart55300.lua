BasePlotDialogPart55300 = {
  [1110701001] = {
    id = 1110701001,
    talk_text = function()
      return T_S(11107010010)
    end,
    next_dialog = 1110701002,
    camera_shake = {
      "3",
      "0",
      "1500"
    },
    env_sound = 20003,
    open_title_1 = function()
      return T_S(11107010018)
    end,
    open_title_2 = function()
      return T_S(11107010019)
    end
  },
  [1110701002] = {
    id = 1110701002,
    talk_text = function()
      return T_S(11107010020)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701002/1110701002_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701003,
    speak_name = function()
      return T_S(11107010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00352",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110701003] = {
    id = 1110701003,
    talk_text = function()
      return T_S(11107010030)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701004,
    env_sound = 20003
  },
  [1110701004] = {
    id = 1110701004,
    talk_text = function()
      return T_S(11107010040)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701005,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00503",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701005] = {
    id = 1110701005,
    talk_text = function()
      return T_S(11107010050)
    end,
    next_dialog = 1110701006,
    env_sound = 20003
  },
  [1110701006] = {
    id = 1110701006,
    talk_text = function()
      return T_S(11107010060)
    end,
    is_master = 1,
    next_dialog = 1110701007,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00504",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701007] = {
    id = 1110701007,
    talk_text = function()
      return T_S(11107010070)
    end,
    next_dialog = 1110701008,
    env_sound = 20003
  },
  [1110701008] = {
    id = 1110701008,
    talk_text = function()
      return T_S(11107010080)
    end,
    next_dialog = 1110701009,
    speak_head = 90120046,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11107010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0025/M0025_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/M0025",
    env_sound = 20003
  },
  [1110701009] = {
    id = 1110701009,
    talk_text = function()
      return T_S(11107010090)
    end,
    next_dialog = 1110701010,
    env_sound = 20003
  },
  [1110701010] = {
    id = 1110701010,
    talk_text = function()
      return T_S(11107010100)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701011,
    speak_name = function()
      return T_S(11107010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00082",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20003
  },
  [1110701011] = {
    id = 1110701011,
    talk_text = function()
      return T_S(11107010110)
    end,
    role_ids = {90110005, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701011/1110701011_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-318:-985", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701012,
    speak_name = function()
      return T_S(11107010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00557",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701012] = {
    id = 1110701012,
    talk_text = function()
      return T_S(11107010120)
    end,
    role_ids = {90110005, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-318:-985", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110701013,
    env_sound = 20003
  },
  [1110701013] = {
    id = 1110701013,
    talk_text = function()
      return T_S(11107010130)
    end,
    is_master = 1,
    next_dialog = 1110701014,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00505",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701014] = {
    id = 1110701014,
    talk_text = function()
      return T_S(11107010140)
    end,
    next_dialog = 1110701015,
    env_sound = 20003
  },
  [1110701015] = {
    id = 1110701015,
    talk_text = function()
      return T_S(11107010150)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701016,
    speak_name = function()
      return T_S(11107010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00422",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110701016] = {
    id = 1110701016,
    talk_text = function()
      return T_S(11107010160)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701017,
    env_sound = 20003
  },
  [1110701017] = {
    id = 1110701017,
    talk_text = function()
      return T_S(11107010170)
    end,
    next_dialog = 1110701018,
    camera_shake = {
      "2",
      "0",
      "1500"
    },
    env_sound = 20003,
    top_effect = {"", "0"}
  },
  [1110701018] = {
    id = 1110701018,
    talk_text = function()
      return T_S(11107010180)
    end,
    next_dialog = 1110701019,
    speak_head = 90120024,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11107010185)
    end,
    text_sound_path = "event:/voice_cn/story/S0088/S0088_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0088",
    env_sound = 20003
  },
  [1110701019] = {
    id = 1110701019,
    talk_text = function()
      return T_S(11107010190)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
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
    next_dialog = 1110701020,
    speak_name = function()
      return T_S(11107010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00558",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701020] = {
    id = 1110701020,
    talk_text = function()
      return T_S(11107010200)
    end,
    next_dialog = 1110701021,
    env_sound = 20003
  },
  [1110701021] = {
    id = 1110701021,
    talk_text = function()
      return T_S(11107010210)
    end,
    next_dialog = 1110701022,
    speak_head = 90120047,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0026/M0026_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/M0026",
    env_sound = 20003
  },
  [1110701022] = {
    id = 1110701022,
    talk_text = function()
      return T_S(11107010220)
    end,
    next_dialog = 1110701023,
    speak_head = 90120045,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11107010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110701023] = {
    id = 1110701023,
    talk_text = function()
      return T_S(11107010230)
    end,
    next_dialog = 1110701024,
    env_sound = 20003
  },
  [1110701024] = {
    id = 1110701024,
    talk_text = function()
      return T_S(11107010240)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701025,
    speak_name = function()
      return T_S(11107010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00073",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701025] = {
    id = 1110701025,
    talk_text = function()
      return T_S(11107010250)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-291:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701026,
    speak_name = function()
      return T_S(11107010255)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00216",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110701026] = {
    id = 1110701026,
    talk_text = function()
      return T_S(11107010260)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-291:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110701027,
    speak_name = function()
      return T_S(11107010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00074",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701027] = {
    id = 1110701027,
    talk_text = function()
      return T_S(11107010270)
    end,
    is_master = 1,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-291:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1110701028,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00506",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701028] = {
    id = 1110701028,
    talk_text = function()
      return T_S(11107010280)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701029,
    speak_name = function()
      return T_S(11107010285)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00423",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110701029] = {
    id = 1110701029,
    talk_text = function()
      return T_S(11107010290)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-308:-1165", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701030,
    speak_name = function()
      return T_S(11107010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00331",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110701030] = {
    id = 1110701030,
    talk_text = function()
      return T_S(11107010300)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701031,
    speak_name = function()
      return T_S(11107010305)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00075",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701031] = {
    id = 1110701031,
    talk_text = function()
      return T_S(11107010310)
    end,
    next_dialog = 1110701032,
    camera_shake = {
      "3",
      "0",
      "1500"
    },
    env_sound = 20003
  },
  [1110701032] = {
    id = 1110701032,
    talk_text = function()
      return T_S(11107010320)
    end,
    next_dialog = 1110701033,
    env_sound = 20003
  },
  [1110701033] = {
    id = 1110701033,
    talk_text = function()
      return T_S(11107010330)
    end,
    next_dialog = 1110701034,
    speak_head = 90120014,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11107010335)
    end,
    text_sound_path = "event:/voice_cn/story/S0095/S0095_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0095",
    env_sound = 20003
  },
  [1110701034] = {
    id = 1110701034,
    talk_text = function()
      return T_S(11107010340)
    end,
    next_dialog = 1110701035,
    speak_head = 90120014,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107010345)
    end,
    text_sound_path = "event:/voice_cn/story/S0095/S0095_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0095",
    env_sound = 20003
  },
  [1110701035] = {
    id = 1110701035,
    talk_text = function()
      return T_S(11107010350)
    end,
    next_dialog = 1110701036,
    env_sound = 20003
  },
  [1110701036] = {
    id = 1110701036,
    talk_text = function()
      return T_S(11107010360)
    end,
    next_dialog = 1110701037,
    speak_head = 90120018,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11107010365)
    end,
    text_sound_path = "event:/voice_cn/story/S0096/S0096_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0096",
    env_sound = 20003
  },
  [1110701037] = {
    id = 1110701037,
    talk_text = function()
      return T_S(11107010370)
    end,
    role_ids = {90110022},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701037/1110701037_90110022.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110022/90110022_0.playable"
    },
    role_position = {"0:-1099"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701038,
    speak_name = function()
      return T_S(11107010375)
    end,
    text_sound_path = "event:/voice_cn/story/M0022/M0022_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/M0022",
    env_sound = 20003
  },
  [1110701038] = {
    id = 1110701038,
    talk_text = function()
      return T_S(11107010380)
    end,
    role_ids = {90110022, 90110012},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110022/90110022_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110022/90110022_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"270:-1099", "-318:-1158"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701039,
    speak_name = function()
      return T_S(11107010385)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00076",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701039] = {
    id = 1110701039,
    talk_text = function()
      return T_S(11107010390)
    end,
    role_ids = {90110022, 90110012},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110022/90110022_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110022/90110022_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"270:-1099", "-318:-1158"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110701040,
    speak_head = 90120015,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11107010395)
    end,
    text_sound_path = "event:/voice_cn/story/S0097/S0097_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0097",
    env_sound = 20003
  },
  [1110701040] = {
    id = 1110701040,
    talk_text = function()
      return T_S(11107010400)
    end,
    role_ids = {90110022, 90110012},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701040/1110701040_90110022.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110022/90110022_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"270:-1099", "-318:-1158"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110701041,
    speak_name = function()
      return T_S(11107010405)
    end,
    text_sound_path = "event:/voice_cn/story/M0022/M0022_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/M0022",
    env_sound = 20003
  },
  [1110701041] = {
    id = 1110701041,
    talk_text = function()
      return T_S(11107010410)
    end,
    next_dialog = 1110701042,
    env_sound = 20003
  },
  [1110701042] = {
    id = 1110701042,
    talk_text = function()
      return T_S(11107010420)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701043,
    speak_name = function()
      return T_S(11107010425)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00077",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701043] = {
    id = 1110701043,
    talk_text = function()
      return T_S(11107010430)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-291:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701044,
    speak_name = function()
      return T_S(11107010435)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00217",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110701044] = {
    id = 1110701044,
    talk_text = function()
      return T_S(11107010440)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-291:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110701045,
    speak_name = function()
      return T_S(11107010445)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00078",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701045] = {
    id = 1110701045,
    talk_text = function()
      return T_S(11107010450)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701045/1110701045_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701046,
    speak_name = function()
      return T_S(11107010455)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00353",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110701046] = {
    id = 1110701046,
    talk_text = function()
      return T_S(11107010460)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701047,
    speak_name = function()
      return T_S(11107010465)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00079",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701047] = {
    id = 1110701047,
    talk_text = function()
      return T_S(11107010470)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701048,
    env_sound = 20003
  },
  [1110701048] = {
    id = 1110701048,
    talk_text = function()
      return T_S(11107010480)
    end,
    is_master = 1,
    is_os = 1,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701049,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00507",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701049] = {
    id = 1110701049,
    talk_text = function()
      return T_S(11107010490)
    end,
    is_master = 1,
    is_os = 1,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701050,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00508",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701050] = {
    id = 1110701050,
    talk_text = function()
      return T_S(11107010500)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701050/1110701050_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-291:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701051,
    speak_name = function()
      return T_S(11107010505)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00218",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110701051] = {
    id = 1110701051,
    talk_text = function()
      return T_S(11107010510)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
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
    next_dialog = 1110701052,
    speak_name = function()
      return T_S(11107010515)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00559",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701052] = {
    id = 1110701052,
    talk_text = function()
      return T_S(11107010520)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-300:-980", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701053,
    speak_name = function()
      return T_S(11107010525)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00424",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110701053] = {
    id = 1110701053,
    talk_text = function()
      return T_S(11107010530)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701053/1110701053_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-300:-980", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110701054,
    speak_name = function()
      return T_S(11107010535)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00560",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701054] = {
    id = 1110701054,
    talk_text = function()
      return T_S(11107010540)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701055,
    speak_name = function()
      return T_S(11107010545)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00080",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701055] = {
    id = 1110701055,
    talk_text = function()
      return T_S(11107010550)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701056,
    speak_name = function()
      return T_S(11107010555)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00081",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701056] = {
    id = 1110701056,
    talk_text = function()
      return T_S(11107010560)
    end,
    is_master = 1,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1110701057,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00509",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701057] = {
    id = 1110701057,
    talk_text = function()
      return T_S(11107010570)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701058,
    speak_name = function()
      return T_S(11107010575)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00082",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701058] = {
    id = 1110701058,
    talk_text = function()
      return T_S(11107010580)
    end,
    is_master = 1,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1110701059,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00510",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701059] = {
    id = 1110701059,
    talk_text = function()
      return T_S(11107010590)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701059/1110701059_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701060,
    speak_name = function()
      return T_S(11107010595)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00083",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701060] = {
    id = 1110701060,
    talk_text = function()
      return T_S(11107010600)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701061,
    speak_name = function()
      return T_S(11107010605)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00425",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110701061] = {
    id = 1110701061,
    talk_text = function()
      return T_S(11107010610)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1110701062,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00511",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701062] = {
    id = 1110701062,
    talk_text = function()
      return T_S(11107010620)
    end,
    next_dialog = 1110701063,
    env_sound = 20003
  },
  [1110701063] = {
    id = 1110701063,
    talk_text = function()
      return T_S(11107010630)
    end,
    is_master = 1,
    next_dialog = 1110701064,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00512",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701064] = {
    id = 1110701064,
    talk_text = function()
      return T_S(11107010640)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701064/1110701064_90110003.playable"
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
    next_dialog = 1110701065,
    speak_name = function()
      return T_S(11107010645)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00561",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701065] = {
    id = 1110701065,
    talk_text = function()
      return T_S(11107010650)
    end,
    next_dialog = 1110701066,
    env_sound = 20003
  },
  [1110701066] = {
    id = 1110701066,
    talk_text = function()
      return T_S(11107010660)
    end,
    is_master = 1,
    next_dialog = 1110701067,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00513",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701067] = {
    id = 1110701067,
    talk_text = function()
      return T_S(11107010670)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701068,
    speak_name = function()
      return T_S(11107010675)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00354",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110701068] = {
    id = 1110701068,
    talk_text = function()
      return T_S(11107010680)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1000", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701069,
    speak_name = function()
      return T_S(11107010685)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00332",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110701069] = {
    id = 1110701069,
    talk_text = function()
      return T_S(11107010690)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701070,
    speak_name = function()
      return T_S(11107010695)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00426",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110701070] = {
    id = 1110701070,
    talk_text = function()
      return T_S(11107010700)
    end,
    next_dialog = 1110701071,
    camera_shake = {
      "2",
      "0",
      "1200"
    },
    env_sound = 20003
  },
  [1110701071] = {
    id = 1110701071,
    next_dialog = 1110701072,
    env_sound = 20003,
    force_auto = 1,
    special_sound = 23016,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_SomeSwords.prefab",
      "0"
    }
  },
  [1110701072] = {
    id = 1110701072,
    talk_text = function()
      return T_S(11107010720)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
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
    next_dialog = 1110701073,
    speak_name = function()
      return T_S(11107010725)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00562",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701073] = {
    id = 1110701073,
    talk_text = function()
      return T_S(11107010730)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701074,
    speak_name = function()
      return T_S(11107010735)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00333",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110701074] = {
    id = 1110701074,
    next_dialog = 1110701075,
    env_sound = 20003,
    force_auto = 1,
    special_sound = 23015,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_DoubleSwords.prefab",
      "0"
    }
  },
  [1110701075] = {
    id = 1110701075,
    talk_text = function()
      return T_S(11107010750)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701076,
    speak_name = function()
      return T_S(11107010755)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00355",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110701076] = {
    id = 1110701076,
    talk_text = function()
      return T_S(11107010760)
    end,
    next_dialog = 1110701077,
    camera_shake = {
      "3",
      "0",
      "1200"
    },
    env_sound = 20003
  },
  [1110701077] = {
    id = 1110701077,
    talk_text = function()
      return T_S(11107010770)
    end,
    next_dialog = 1110701078,
    env_sound = 20003
  },
  [1110701078] = {
    id = 1110701078,
    talk_text = function()
      return T_S(11107010780)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-71:-1158"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701079,
    speak_name = function()
      return T_S(11107010785)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00084",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701079] = {
    id = 1110701079,
    talk_text = function()
      return T_S(11107010790)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"50:-1080"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701080,
    speak_name = function()
      return T_S(11107010795)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00219",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110701080] = {
    id = 1110701080,
    talk_text = function()
      return T_S(11107010800)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"270:-1080", "-270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701081,
    speak_name = function()
      return T_S(11107010805)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00045",
    text_sound_bank = "bank:/voice_cn/sty/M0016_1",
    env_sound = 20003
  },
  [1110701081] = {
    id = 1110701081,
    talk_text = function()
      return T_S(11107010810)
    end,
    is_master = 1,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"270:-1080", "-270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110701082,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00514",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701082] = {
    id = 1110701082,
    talk_text = function()
      return T_S(11107010820)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"270:-1080", "-270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110701083,
    speak_name = function()
      return T_S(11107010825)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00220",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110701083] = {
    id = 1110701083,
    talk_text = function()
      return T_S(11107010830)
    end,
    next_dialog = 1110701084,
    camera_shake = {
      "2",
      "0",
      "1500"
    },
    env_sound = 20003
  },
  [1110701084] = {
    id = 1110701084,
    talk_text = function()
      return T_S(11107010840)
    end,
    next_dialog = 1110701085,
    env_sound = 20003
  },
  [1110701085] = {
    id = 1110701085,
    talk_text = function()
      return T_S(11107010850)
    end,
    next_dialog = 1110701086,
    speak_head = 90120015,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107010855)
    end,
    text_sound_path = "event:/voice_cn/story/S0097/S0097_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0097",
    env_sound = 20003
  },
  [1110701086] = {
    id = 1110701086,
    talk_text = function()
      return T_S(11107010860)
    end,
    next_dialog = 1110701087,
    speak_head = 90120017,
    speak_head_actions = {"idle", "talk"},
    text_sound_path = "event:/voice_cn/story/S0098/S0098_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0098",
    env_sound = 20003
  },
  [1110701087] = {
    id = 1110701087,
    next_dialog = 1110701088,
    env_sound = 20003,
    force_auto = 1,
    special_sound = 23020,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_Scuffle.prefab",
      "0"
    }
  },
  [1110701088] = {
    id = 1110701088,
    talk_text = function()
      return T_S(11107010880)
    end,
    next_dialog = 1110701089,
    env_sound = 20003
  },
  [1110701089] = {
    id = 1110701089,
    talk_text = function()
      return T_S(11107010890)
    end,
    next_dialog = 1110701090,
    env_sound = 20003
  },
  [1110701090] = {
    id = 1110701090,
    talk_text = function()
      return T_S(11107010900)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
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
    next_dialog = 1110701091,
    speak_name = function()
      return T_S(11107010905)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00563",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701091] = {
    id = 1110701091,
    talk_text = function()
      return T_S(11107010910)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701092,
    speak_name = function()
      return T_S(11107010915)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00356",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110701092] = {
    id = 1110701092,
    talk_text = function()
      return T_S(11107010920)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110701093,
    speak_name = function()
      return T_S(11107010925)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00564",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701093] = {
    id = 1110701093,
    talk_text = function()
      return T_S(11107010930)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701094,
    speak_name = function()
      return T_S(11107010935)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00357",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110701094] = {
    id = 1110701094,
    talk_text = function()
      return T_S(11107010940)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701095,
    speak_name = function()
      return T_S(11107010945)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00334",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110701095] = {
    id = 1110701095,
    talk_text = function()
      return T_S(11107010950)
    end,
    next_dialog = 1110701096,
    camera_shake = {
      "2",
      "0",
      "1500"
    },
    env_sound = 20003,
    top_effect = {"", "0"}
  },
  [1110701096] = {
    id = 1110701096,
    talk_text = function()
      return T_S(11107010960)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701097,
    speak_name = function()
      return T_S(11107010965)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00085",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701097] = {
    id = 1110701097,
    talk_text = function()
      return T_S(11107010970)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701098,
    env_sound = 20003
  },
  [1110701098] = {
    id = 1110701098,
    talk_text = function()
      return T_S(11107010980)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701099,
    speak_name = function()
      return T_S(11107010985)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00086",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701099] = {
    id = 1110701099,
    talk_text = function()
      return T_S(11107010990)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701100,
    speak_head = 90120032,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107010995)
    end,
    text_sound_path = "event:/voice_cn/story/S0099/S0099_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0099",
    env_sound = 20003
  },
  [1110701100] = {
    id = 1110701100,
    talk_text = function()
      return T_S(11107011000)
    end,
    next_dialog = 1110701101,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00515",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701101] = {
    id = 1110701101,
    talk_text = function()
      return T_S(11107011010)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701102,
    speak_name = function()
      return T_S(11107011015)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00221",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110701102] = {
    id = 1110701102,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701103,
    camera_shake = {
      "3",
      "0",
      "1200"
    },
    env_sound = 20003,
    force_auto = 1,
    top_effect = {"", "0"}
  },
  [1110701103] = {
    id = 1110701103,
    talk_text = function()
      return T_S(11107011030)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"270:-1080", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701104,
    speak_name = function()
      return T_S(11107011035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00427",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110701104] = {
    id = 1110701104,
    talk_text = function()
      return T_S(11107011040)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"270:-1080", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110701105,
    speak_name = function()
      return T_S(11107011045)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00222",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110701105] = {
    id = 1110701105,
    talk_text = function()
      return T_S(11107011050)
    end,
    next_dialog = 1110701106,
    env_sound = 20003
  },
  [1110701106] = {
    id = 1110701106,
    next_dialog = 1110701131,
    env_sound = 20003,
    force_auto = 1,
    special_sound = 23019,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_MagicDiffusion.prefab",
      "0"
    }
  },
  [1110701107] = {
    id = 1110701107,
    talk_text = function()
      return T_S(11107011070)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701108,
    speak_name = function()
      return T_S(11107011075)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00087",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701108] = {
    id = 1110701108,
    talk_text = function()
      return T_S(11107011080)
    end,
    next_dialog = 1110701109,
    camera_shake = {
      "3",
      "0",
      "1500"
    },
    env_sound = 20003
  },
  [1110701109] = {
    id = 1110701109,
    talk_text = function()
      return T_S(11107011090)
    end,
    next_dialog = 1110701110,
    env_sound = 20003
  },
  [1110701110] = {
    id = 1110701110,
    talk_text = function()
      return T_S(11107011100)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701110/1110701110_90110003.playable"
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
    next_dialog = 1110701111,
    speak_name = function()
      return T_S(11107011105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00565",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110701111] = {
    id = 1110701111,
    talk_text = function()
      return T_S(11107011110)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-300:-980", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701112,
    speak_name = function()
      return T_S(11107011115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00428",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110701112] = {
    id = 1110701112,
    talk_text = function()
      return T_S(11107011120)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701113,
    speak_name = function()
      return T_S(11107011125)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00335",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110701113] = {
    id = 1110701113,
    talk_text = function()
      return T_S(11107011130)
    end,
    next_dialog = 1110701114,
    env_sound = 20003
  },
  [1110701114] = {
    id = 1110701114,
    talk_text = function()
      return T_S(11107011140)
    end,
    next_dialog = 1110701115,
    speak_head = 90120015,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107011145)
    end,
    text_sound_path = "event:/voice_cn/story/S0097/S0097_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0097",
    env_sound = 20003
  },
  [1110701115] = {
    id = 1110701115,
    talk_text = function()
      return T_S(11107011150)
    end,
    next_dialog = 1110701116,
    speak_head = 90120025,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107011155)
    end,
    text_sound_path = "event:/voice_cn/story/S0086/S0086_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0086",
    env_sound = 20003
  },
  [1110701116] = {
    id = 1110701116,
    talk_text = function()
      return T_S(11107011160)
    end,
    next_dialog = 1110701117,
    speak_head = 90120024,
    speak_name = function()
      return T_S(11107011165)
    end,
    text_sound_path = "event:/voice_cn/story/S0088/S0088_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0088",
    env_sound = 20003
  },
  [1110701117] = {
    id = 1110701117,
    talk_text = function()
      return T_S(11107011170)
    end,
    next_dialog = 1110701118,
    speak_head = 90120040,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107011175)
    end,
    text_sound_path = "event:/voice_cn/story/S0094/S0094_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0094",
    env_sound = 20003
  },
  [1110701118] = {
    id = 1110701118,
    talk_text = function()
      return T_S(11107011180)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701119,
    speak_name = function()
      return T_S(11107011185)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00083",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20003
  },
  [1110701119] = {
    id = 1110701119,
    talk_text = function()
      return T_S(11107011190)
    end,
    next_dialog = 1110701120,
    speak_head = 90120047,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107011195)
    end,
    text_sound_path = "event:/voice_cn/story/M0026/M0026_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/M0026",
    env_sound = 20003
  },
  [1110701120] = {
    id = 1110701120,
    talk_text = function()
      return T_S(11107011200)
    end,
    next_dialog = 1110701121,
    speak_head = 90120046,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107011205)
    end,
    text_sound_path = "event:/voice_cn/story/M0025/M0025_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/M0025",
    env_sound = 20003
  },
  [1110701121] = {
    id = 1110701121,
    talk_text = function()
      return T_S(11107011210)
    end,
    next_dialog = 1110701122,
    env_sound = 20003
  },
  [1110701122] = {
    id = 1110701122,
    talk_text = function()
      return T_S(11107011220)
    end,
    next_dialog = 1110701123,
    env_sound = 20003
  },
  [1110701123] = {
    id = 1110701123,
    talk_text = function()
      return T_S(11107011230)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701124,
    speak_name = function()
      return T_S(11107011235)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00088",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701124] = {
    id = 1110701124,
    talk_text = function()
      return T_S(11107011240)
    end,
    is_master = 1,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1110701125,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00516",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701125] = {
    id = 1110701125,
    talk_text = function()
      return T_S(11107011250)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110701126,
    env_sound = 20003
  },
  [1110701126] = {
    id = 1110701126,
    talk_text = function()
      return T_S(11107011260)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701126/1110701126_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110701127,
    speak_name = function()
      return T_S(11107011265)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00089",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701127] = {
    id = 1110701127,
    talk_text = function()
      return T_S(11107011270)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701127/1110701127_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"258:-1158", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110701128,
    speak_name = function()
      return T_S(11107011275)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00223",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110701128] = {
    id = 1110701128,
    talk_text = function()
      return T_S(11107011280)
    end,
    is_master = 1,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"258:-1158", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110701129,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00517",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110701129] = {
    id = 1110701129,
    talk_text = function()
      return T_S(11107011290)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701129/1110701129_90110012.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"258:-1158", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110701130,
    speak_name = function()
      return T_S(11107011295)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00090",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110701130] = {
    id = 1110701130,
    talk_text = function()
      return T_S(11107011300)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110701130/1110701130_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11107011305)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00429",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110701131] = {
    id = 1110701131,
    talk_text = function()
      return T_S(11107011310)
    end,
    next_dialog = 1110701107,
    env_sound = 20003
  },
  [1110702001] = {
    id = 1110702001,
    talk_text = function()
      return T_S(11107020010)
    end,
    next_dialog = 1110702002,
    env_sound = 20007
  },
  [1110702002] = {
    id = 1110702002,
    talk_text = function()
      return T_S(11107020020)
    end,
    next_dialog = 1110702003,
    speak_head = 90120015,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11107020025)
    end,
    text_sound_path = "event:/voice_cn/story/S0097/S0097_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0097",
    env_sound = 20007
  },
  [1110702003] = {
    id = 1110702003,
    talk_text = function()
      return T_S(11107020030)
    end,
    next_dialog = 1110702004,
    speak_head = 90120017,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107020035)
    end,
    text_sound_path = "event:/voice_cn/story/S0098/S0098_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0098",
    env_sound = 20007
  },
  [1110702004] = {
    id = 1110702004,
    talk_text = function()
      return T_S(11107020040)
    end,
    next_dialog = 1110702005,
    speak_head = 90120038,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107020045)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20007
  },
  [1110702005] = {
    id = 1110702005,
    talk_text = function()
      return T_S(11107020050)
    end,
    next_dialog = 1110702006,
    speak_head = 90120040,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107020055)
    end,
    text_sound_path = "event:/voice_cn/story/S0094/S0094_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0094",
    env_sound = 20007
  },
  [1110702006] = {
    id = 1110702006,
    next_dialog = 1110702007,
    camera_shake = {
      "1",
      "0",
      "1000"
    },
    env_sound = 20007,
    force_auto = 1,
    special_sound = 23013
  },
  [1110702007] = {
    id = 1110702007,
    talk_text = function()
      return T_S(11107020070)
    end,
    next_dialog = 1110702008,
    speak_head = 90120040,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11107020075)
    end,
    text_sound_path = "event:/voice_cn/story/S0094/S0094_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0094",
    env_sound = 20007
  },
  [1110702008] = {
    id = 1110702008,
    talk_text = function()
      return T_S(11107020080)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110702009,
    speak_name = function()
      return T_S(11107020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00430",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20007
  },
  [1110702009] = {
    id = 1110702009,
    talk_text = function()
      return T_S(11107020090)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1165", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110702010,
    speak_name = function()
      return T_S(11107020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00566",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20007
  },
  [1110702010] = {
    id = 1110702010,
    talk_text = function()
      return T_S(11107020100)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110702011,
    speak_name = function()
      return T_S(11107020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00358",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20007
  },
  [1110702011] = {
    id = 1110702011,
    talk_text = function()
      return T_S(11107020110)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"150:-1000", "-180:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110702012,
    speak_name = function()
      return T_S(11107020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00567",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20007
  },
  [1110702012] = {
    id = 1110702012,
    talk_text = function()
      return T_S(11107020120)
    end,
    next_dialog = 1110702013,
    env_sound = 20007
  },
  [1110702013] = {
    id = 1110702013,
    talk_text = function()
      return T_S(11107020130)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110702014,
    speak_name = function()
      return T_S(11107020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00336",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20007
  },
  [1110702014] = {
    id = 1110702014,
    talk_text = function()
      return T_S(11107020140)
    end,
    is_master = 1,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00518",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20007
  }
}
