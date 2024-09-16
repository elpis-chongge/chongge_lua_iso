BasePlotDialogPart55201 = {
  [1110503001] = {
    id = 1110503001,
    talk_text = function()
      return T_S(11105030010)
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
    next_dialog = 1110503002,
    speak_name = function()
      return T_S(11105030015)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00068",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110503002] = {
    id = 1110503002,
    talk_text = function()
      return T_S(11105030020)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110503003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00489",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110503003] = {
    id = 1110503003,
    talk_text = function()
      return T_S(11105030030)
    end,
    next_dialog = 1110503004,
    env_sound = 20003
  },
  [1110503004] = {
    id = 1110503004,
    talk_text = function()
      return T_S(11105030040)
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
    next_dialog = 1110503005,
    speak_name = function()
      return T_S(11105030045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00546",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110503005] = {
    id = 1110503005,
    talk_text = function()
      return T_S(11105030050)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110503006,
    speak_name = function()
      return T_S(11105030055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00324",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110503006] = {
    id = 1110503006,
    talk_text = function()
      return T_S(11105030060)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110503007,
    speak_head = 90120022,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11105030065)
    end,
    text_sound_path = "event:/voice_cn/story/S0093/S0093_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0093",
    env_sound = 20003
  },
  [1110503007] = {
    id = 1110503007,
    talk_text = function()
      return T_S(11105030070)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110503008,
    speak_head = 90120036,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030075)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110503008] = {
    id = 1110503008,
    talk_text = function()
      return T_S(11105030080)
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
    next_dialog = 1110503009,
    speak_name = function()
      return T_S(11105030085)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00069",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110503009] = {
    id = 1110503009,
    talk_text = function()
      return T_S(11105030090)
    end,
    role_ids = {90110012, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-291:-1158", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110503010,
    speak_name = function()
      return T_S(11105030095)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00416",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110503010] = {
    id = 1110503010,
    talk_text = function()
      return T_S(11105030100)
    end,
    role_ids = {90110012, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-291:-1158", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110503011,
    speak_head = 90120036,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030105)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110503011] = {
    id = 1110503011,
    talk_text = function()
      return T_S(11105030110)
    end,
    role_ids = {90110012, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-291:-1158", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110503012,
    speak_name = function()
      return T_S(11105030115)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00070",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110503012] = {
    id = 1110503012,
    talk_text = function()
      return T_S(11105030120)
    end,
    role_ids = {90110012, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-291:-1158", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110503013,
    speak_head = 90120036,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11105030125)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110503013] = {
    id = 1110503013,
    talk_text = function()
      return T_S(11105030130)
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
    next_dialog = 1110503014,
    speak_name = function()
      return T_S(11105030135)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00212",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110503014] = {
    id = 1110503014,
    talk_text = function()
      return T_S(11105030140)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110503015,
    speak_head = 90120036,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030145)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110503015] = {
    id = 1110503015,
    talk_text = function()
      return T_S(11105030150)
    end,
    role_ids = {90110009, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1080", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110503016,
    speak_name = function()
      return T_S(11105030155)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00547",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110503016] = {
    id = 1110503016,
    talk_text = function()
      return T_S(11105030160)
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
    next_dialog = 1110503017,
    speak_name = function()
      return T_S(11105030165)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00325",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110503017] = {
    id = 1110503017,
    talk_text = function()
      return T_S(11105030170)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110503018,
    speak_name = function()
      return T_S(11105030175)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00341",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110503018] = {
    id = 1110503018,
    talk_text = function()
      return T_S(11105030180)
    end,
    next_dialog = 1110503019,
    env_sound = 20003
  },
  [1110503019] = {
    id = 1110503019,
    talk_text = function()
      return T_S(11105030190)
    end,
    next_dialog = 1110503020,
    speak_head = 90120047,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030195)
    end,
    text_sound_path = "event:/voice_cn/story/M0026/M0026_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/M0026",
    env_sound = 20003
  },
  [1110503020] = {
    id = 1110503020,
    talk_text = function()
      return T_S(11105030200)
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
    next_dialog = 1110503021,
    speak_name = function()
      return T_S(11105030205)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00342",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110503021] = {
    id = 1110503021,
    talk_text = function()
      return T_S(11105030210)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1000", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110503022,
    speak_name = function()
      return T_S(11105030215)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00417",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110503022] = {
    id = 1110503022,
    talk_text = function()
      return T_S(11105030220)
    end,
    next_dialog = 1110503023,
    speak_head = 90120045,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030225)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110503023] = {
    id = 1110503023,
    talk_text = function()
      return T_S(11105030230)
    end,
    next_dialog = 1110503024,
    speak_head = 90120046,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030235)
    end,
    text_sound_path = "event:/voice_cn/story/M0025/M0025_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0025",
    env_sound = 20003
  },
  [1110503024] = {
    id = 1110503024,
    talk_text = function()
      return T_S(11105030240)
    end,
    next_dialog = 1110503025,
    speak_head = 90120047,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030245)
    end,
    text_sound_path = "event:/voice_cn/story/M0026/M0026_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0026",
    env_sound = 20003
  },
  [1110503025] = {
    id = 1110503025,
    talk_text = function()
      return T_S(11105030250)
    end,
    is_master = 1,
    next_dialog = 1110503026,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00490",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110503026] = {
    id = 1110503026,
    talk_text = function()
      return T_S(11105030260)
    end,
    next_dialog = 1110503027,
    speak_head = 90120047,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030265)
    end,
    text_sound_path = "event:/voice_cn/story/M0026/M0026_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/M0026",
    env_sound = 20003
  },
  [1110503027] = {
    id = 1110503027,
    talk_text = function()
      return T_S(11105030270)
    end,
    next_dialog = 1110503028,
    speak_head = 90120045,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030275)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110503028] = {
    id = 1110503028,
    talk_text = function()
      return T_S(11105030280)
    end,
    next_dialog = 1110503029,
    speak_head = 90120046,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030285)
    end,
    text_sound_path = "event:/voice_cn/story/M0025/M0025_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/M0025",
    env_sound = 20003
  },
  [1110503029] = {
    id = 1110503029,
    talk_text = function()
      return T_S(11105030290)
    end,
    is_master = 1,
    next_dialog = 1110503030,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00491",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110503030] = {
    id = 1110503030,
    talk_text = function()
      return T_S(11105030300)
    end,
    next_dialog = 1110503031,
    speak_head = 90120045,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030305)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110503031] = {
    id = 1110503031,
    talk_text = function()
      return T_S(11105030310)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110503032,
    speak_name = function()
      return T_S(11105030315)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00071",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110503032] = {
    id = 1110503032,
    talk_text = function()
      return T_S(11105030320)
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
    role_position = {"-270:-1000", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110503033,
    speak_name = function()
      return T_S(11105030325)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00343",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110503033] = {
    id = 1110503033,
    talk_text = function()
      return T_S(11105030330)
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
    role_position = {"-270:-1000", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110503034,
    speak_name = function()
      return T_S(11105030335)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00548",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110503034] = {
    id = 1110503034,
    talk_text = function()
      return T_S(11105030340)
    end,
    is_master = 1,
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
    role_position = {"-270:-1000", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110503035,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00492",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110503035] = {
    id = 1110503035,
    talk_text = function()
      return T_S(11105030350)
    end,
    next_dialog = 1110503036,
    speak_head = 90120045,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11105030355)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110503036] = {
    id = 1110503036,
    talk_text = function()
      return T_S(11105030360)
    end,
    next_dialog = 1110503037,
    env_sound = 20003
  },
  [1110503037] = {
    id = 1110503037,
    talk_text = function()
      return T_S(11105030370)
    end,
    is_master = 1,
    next_dialog = 1110503038,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00493",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110503038] = {
    id = 1110503038,
    talk_text = function()
      return T_S(11105030380)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110503039,
    speak_name = function()
      return T_S(11105030385)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00072",
    text_sound_bank = "bank:/voice_cn/sty/M0014_1",
    env_sound = 20003
  },
  [1110503039] = {
    id = 1110503039,
    talk_text = function()
      return T_S(11105030390)
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
    next_dialog = 1110503040,
    speak_name = function()
      return T_S(11105030395)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00213",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110503040] = {
    id = 1110503040,
    talk_text = function()
      return T_S(11105030400)
    end,
    role_ids = {90110009, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110503041,
    speak_name = function()
      return T_S(11105030405)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00344",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110503041] = {
    id = 1110503041,
    talk_text = function()
      return T_S(11105030410)
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
    next_dialog = 1110503042,
    speak_name = function()
      return T_S(11105030415)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00326",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110503042] = {
    id = 1110503042,
    talk_text = function()
      return T_S(11105030420)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1066", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110503043,
    speak_name = function()
      return T_S(11105030425)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00549",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110503043] = {
    id = 1110503043,
    talk_text = function()
      return T_S(11105030430)
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
    next_dialog = 1110503044,
    speak_name = function()
      return T_S(11105030435)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00418",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110503044] = {
    id = 1110503044,
    talk_text = function()
      return T_S(11105030440)
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
    light_role = {0},
    next_dialog = 1110503045,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00494",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110503045] = {
    id = 1110503045,
    talk_text = function()
      return T_S(11105030450)
    end,
    is_master = 1,
    next_dialog = 1110503046,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00495",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110503046] = {
    id = 1110503046,
    talk_text = function()
      return T_S(11105030460)
    end,
    speak_name = function()
      return T_S(11105030465)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00345",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003,
    review_head = "90210001"
  }
}
