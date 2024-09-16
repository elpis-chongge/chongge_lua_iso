BasePlotDialogPart55350 = {
  [1110801001] = {
    id = 1110801001,
    talk_text = function()
      return T_S(11108010010)
    end,
    next_dialog = 1110801002,
    env_sound = 20001,
    open_title_1 = function()
      return T_S(11108010018)
    end,
    open_title_2 = function()
      return T_S(11108010019)
    end
  },
  [1110801002] = {
    id = 1110801002,
    talk_text = function()
      return T_S(11108010020)
    end,
    next_dialog = 1110801003,
    speak_head = 90120043,
    speak_head_actions = {
      "talk",
      "idle",
      "blink"
    },
    speak_name = function()
      return T_S(11108010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00568",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110801003] = {
    id = 1110801003,
    talk_text = function()
      return T_S(11108010030)
    end,
    next_dialog = 1110801004,
    env_sound = 20001
  },
  [1110801004] = {
    id = 1110801004,
    talk_text = function()
      return T_S(11108010040)
    end,
    next_dialog = 1110801005,
    speak_head = 90120043,
    speak_head_actions = {
      "talk",
      "angry",
      "blink",
      "idle"
    },
    speak_name = function()
      return T_S(11108010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00569",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110801005] = {
    id = 1110801005,
    talk_text = function()
      return T_S(11108010050)
    end,
    next_dialog = 1110801006,
    env_sound = 20001
  },
  [1110801006] = {
    id = 1110801006,
    talk_text = function()
      return T_S(11108010060)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110801006/1110801006_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11108010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00570",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802001] = {
    id = 1110802001,
    talk_text = function()
      return T_S(11108020010)
    end,
    next_dialog = 1110802002,
    speak_head = 90120024,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11108020015)
    end,
    text_sound_path = "event:/voice_cn/story/S0088/S0088_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0088",
    env_sound = 20001
  },
  [1110802002] = {
    id = 1110802002,
    talk_text = function()
      return T_S(11108020020)
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
    next_dialog = 1110802003,
    speak_name = function()
      return T_S(11108020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00571",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802003] = {
    id = 1110802003,
    talk_text = function()
      return T_S(11108020030)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110802004,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11108020035)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20001
  },
  [1110802004] = {
    id = 1110802004,
    talk_text = function()
      return T_S(11108020040)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110802004/1110802004_90110003.playable"
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
    next_dialog = 1110802005,
    speak_name = function()
      return T_S(11108020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00572",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802005] = {
    id = 1110802005,
    talk_text = function()
      return T_S(11108020050)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110802006,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11108020055)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00017",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20001
  },
  [1110802006] = {
    id = 1110802006,
    talk_text = function()
      return T_S(11108020060)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110802007,
    speak_name = function()
      return T_S(11108020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00573",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802007] = {
    id = 1110802007,
    talk_text = function()
      return T_S(11108020070)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110802007/1110802007_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110802008,
    speak_name = function()
      return T_S(11108020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00431",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110802008] = {
    id = 1110802008,
    talk_text = function()
      return T_S(11108020080)
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
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110802009,
    env_sound = 20001
  },
  [1110802009] = {
    id = 1110802009,
    talk_text = function()
      return T_S(11108020090)
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
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110802010,
    speak_name = function()
      return T_S(11108020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00432",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110802010] = {
    id = 1110802010,
    talk_text = function()
      return T_S(11108020100)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110802010/1110802010_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110802011,
    speak_name = function()
      return T_S(11108020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00574",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802011] = {
    id = 1110802011,
    talk_text = function()
      return T_S(11108020110)
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
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110802012,
    speak_head = 90120024,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11108020115)
    end,
    text_sound_path = "event:/voice_cn/story/S0088/S0088_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/S0088",
    env_sound = 20001
  },
  [1110802012] = {
    id = 1110802012,
    talk_text = function()
      return T_S(11108020120)
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
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110802013,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11108020125)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20001
  },
  [1110802013] = {
    id = 1110802013,
    talk_text = function()
      return T_S(11108020130)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110802013/1110802013_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110802013/1110802013_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110802014,
    speak_name = function()
      return T_S(11108020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00575",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802014] = {
    id = 1110802014,
    talk_text = function()
      return T_S(11108020140)
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
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110802015,
    env_sound = 20001
  },
  [1110802015] = {
    id = 1110802015,
    talk_text = function()
      return T_S(11108020150)
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
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110802016,
    speak_name = function()
      return T_S(11108020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00433",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110802016] = {
    id = 1110802016,
    talk_text = function()
      return T_S(11108020160)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110802016/1110802016_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110802017,
    speak_name = function()
      return T_S(11108020165)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00576",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802017] = {
    id = 1110802017,
    talk_text = function()
      return T_S(11108020170)
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
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110802018,
    speak_name = function()
      return T_S(11108020175)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00434",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110802018] = {
    id = 1110802018,
    talk_text = function()
      return T_S(11108020180)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110802018/1110802018_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110802019,
    speak_name = function()
      return T_S(11108020185)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00577",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802019] = {
    id = 1110802019,
    talk_text = function()
      return T_S(11108020190)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110802019/1110802019_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110802020,
    speak_name = function()
      return T_S(11108020195)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00578",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110802020] = {
    id = 1110802020,
    talk_text = function()
      return T_S(11108020200)
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
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110802021,
    speak_name = function()
      return T_S(11108020205)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00435",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110802021] = {
    id = 1110802021,
    talk_text = function()
      return T_S(11108020210)
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
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(11108020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00579",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  }
}
