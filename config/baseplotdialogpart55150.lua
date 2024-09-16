BasePlotDialogPart55150 = {
  [1110401001] = {
    id = 1110401001,
    talk_text = function()
      return T_S(11104010010)
    end,
    next_dialog = 1110401002,
    env_sound = 20001,
    open_title_1 = function()
      return T_S(11104010018)
    end,
    open_title_2 = function()
      return T_S(11104010019)
    end
  },
  [1110401002] = {
    id = 1110401002,
    talk_text = function()
      return T_S(11104010020)
    end,
    next_dialog = 1110401003,
    speak_name = function()
      return T_S(11104010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00315",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20001,
    review_head = "90210001"
  },
  [1110401003] = {
    id = 1110401003,
    talk_text = function()
      return T_S(11104010030)
    end,
    next_dialog = 1110401004,
    camera_shake = {
      "2",
      "0",
      "1100"
    },
    env_sound = 20001
  },
  [1110401004] = {
    id = 1110401004,
    talk_text = function()
      return T_S(11104010040)
    end,
    next_dialog = 1110401005,
    speak_name = function()
      return T_S(11104010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00529",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001,
    review_head = "90210002"
  },
  [1110401005] = {
    id = 1110401005,
    talk_text = function()
      return T_S(11104010050)
    end,
    next_dialog = 1110401006,
    speak_name = function()
      return T_S(11104010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00331",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20001,
    review_head = "90210001"
  },
  [1110401006] = {
    id = 1110401006,
    talk_text = function()
      return T_S(11104010060)
    end,
    next_dialog = 1110401007,
    speak_name = function()
      return T_S(11104010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00316",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20001,
    review_head = "90210002"
  },
  [1110401007] = {
    id = 1110401007,
    talk_text = function()
      return T_S(11104010070)
    end,
    env_sound = 20001
  },
  [1110402001] = {
    id = 1110402001,
    talk_text = function()
      return T_S(11104020010)
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
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110402002,
    speak_name = function()
      return T_S(11104020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00406",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110402002] = {
    id = 1110402002,
    talk_text = function()
      return T_S(11104020020)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110402002/1110402002_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"232:-1165", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110402003,
    speak_name = function()
      return T_S(11104020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00317",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20001
  },
  [1110402003] = {
    id = 1110402003,
    talk_text = function()
      return T_S(11104020030)
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
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"232:-1165", "-120:-1066"},
    role_shake = {"2:0:1100", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110402004,
    env_sound = 20001
  },
  [1110402004] = {
    id = 1110402004,
    talk_text = function()
      return T_S(11104020040)
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
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"232:-1165", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110402005,
    speak_name = function()
      return T_S(11104020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00407",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110402005] = {
    id = 1110402005,
    talk_text = function()
      return T_S(11104020050)
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
    next_dialog = 1110402006,
    speak_name = function()
      return T_S(11104020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00530",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110402006] = {
    id = 1110402006,
    talk_text = function()
      return T_S(11104020060)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110402006/1110402006_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110402007,
    speak_name = function()
      return T_S(11104020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00332",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20001
  },
  [1110402007] = {
    id = 1110402007,
    talk_text = function()
      return T_S(11104020070)
    end,
    next_dialog = 1110402008,
    env_sound = 20001
  },
  [1110402008] = {
    id = 1110402008,
    talk_text = function()
      return T_S(11104020080)
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
    next_dialog = 1110402009,
    speak_name = function()
      return T_S(11104020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00199",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20001
  },
  [1110402009] = {
    id = 1110402009,
    talk_text = function()
      return T_S(11104020090)
    end,
    is_master = 1,
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
    next_dialog = 1110402010,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00480",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20001
  },
  [1110402010] = {
    id = 1110402010,
    talk_text = function()
      return T_S(11104020100)
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
    next_dialog = 1110402011,
    env_sound = 20001
  },
  [1110402011] = {
    id = 1110402011,
    talk_text = function()
      return T_S(11104020110)
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
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1080", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110402012,
    speak_name = function()
      return T_S(11104020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00408",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110402012] = {
    id = 1110402012,
    talk_text = function()
      return T_S(11104020120)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110402012/1110402012_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110402012/1110402012_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110402013,
    speak_name = function()
      return T_S(11104020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00333",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20001
  },
  [1110402013] = {
    id = 1110402013,
    talk_text = function()
      return T_S(11104020130)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110402014,
    speak_name = function()
      return T_S(11104020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00318",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20001
  },
  [1110402014] = {
    id = 1110402014,
    talk_text = function()
      return T_S(11104020140)
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
    next_dialog = 1110402015,
    speak_name = function()
      return T_S(11104020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00409",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110402015] = {
    id = 1110402015,
    talk_text = function()
      return T_S(11104020150)
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
    next_dialog = 1110402016,
    speak_name = function()
      return T_S(11104020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00531",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110402016] = {
    id = 1110402016,
    talk_text = function()
      return T_S(11104020160)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110402017,
    speak_name = function()
      return T_S(11104020165)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00200",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20001
  },
  [1110402017] = {
    id = 1110402017,
    talk_text = function()
      return T_S(11104020170)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110402018,
    speak_name = function()
      return T_S(11104020175)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00319",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20001
  },
  [1110402018] = {
    id = 1110402018,
    talk_text = function()
      return T_S(11104020180)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110402019,
    speak_name = function()
      return T_S(11104020185)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00334",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20001
  },
  [1110402019] = {
    id = 1110402019,
    talk_text = function()
      return T_S(11104020190)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110402020,
    speak_name = function()
      return T_S(11104020195)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00532",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110402020] = {
    id = 1110402020,
    talk_text = function()
      return T_S(11104020200)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110402021,
    speak_name = function()
      return T_S(11104020205)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00201",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20001
  },
  [1110402021] = {
    id = 1110402021,
    talk_text = function()
      return T_S(11104020210)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110402022,
    speak_name = function()
      return T_S(11104020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00044",
    text_sound_bank = "bank:/voice_cn/sty/M0016_1",
    env_sound = 20001
  },
  [1110402022] = {
    id = 1110402022,
    talk_text = function()
      return T_S(11104020220)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110402023,
    speak_name = function()
      return T_S(11104020225)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00202",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20001
  },
  [1110402023] = {
    id = 1110402023,
    talk_text = function()
      return T_S(11104020230)
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
    next_dialog = 1110402024,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00481",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20001
  },
  [1110402024] = {
    id = 1110402024,
    talk_text = function()
      return T_S(11104020240)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110402025,
    speak_name = function()
      return T_S(11104020245)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00203",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20001
  },
  [1110402025] = {
    id = 1110402025,
    talk_text = function()
      return T_S(11104020250)
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
    next_dialog = 1110402026,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00482",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20001
  },
  [1110402026] = {
    id = 1110402026,
    talk_text = function()
      return T_S(11104020260)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1110402027,
    speak_name = function()
      return T_S(11104020265)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00204",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20001
  },
  [1110402027] = {
    id = 1110402027,
    talk_text = function()
      return T_S(11104020270)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110402028,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00483",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20001
  },
  [1110402028] = {
    id = 1110402028,
    talk_text = function()
      return T_S(11104020280)
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
    next_dialog = 1110402029,
    speak_name = function()
      return T_S(11104020285)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00335",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20001
  },
  [1110402029] = {
    id = 1110402029,
    talk_text = function()
      return T_S(11104020290)
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
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110402030,
    speak_name = function()
      return T_S(11104020295)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00533",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20001
  },
  [1110402030] = {
    id = 1110402030,
    talk_text = function()
      return T_S(11104020300)
    end,
    role_ids = {90110009, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1080", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 1},
    light_role = {1, 1},
    next_dialog = 1110402031,
    speak_name = function()
      return T_S(11104020305)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00320",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20001
  },
  [1110402031] = {
    id = 1110402031,
    talk_text = function()
      return T_S(11104020310)
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
    next_dialog = 1110402032,
    speak_name = function()
      return T_S(11104020315)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00410",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20001
  },
  [1110402032] = {
    id = 1110402032,
    talk_text = function()
      return T_S(11104020320)
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
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00484",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20001
  }
}
