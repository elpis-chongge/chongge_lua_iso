BasePlotDialogPart40101 = {
  [1080303001] = {
    id = 1080303001,
    talk_text = function()
      return T_S(10803030010)
    end,
    next_dialog = 1080303002,
    speak_head = 90120014,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10803030015)
    end,
    text_sound_path = "event:/voice_cn/story/S0035/S0035_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0035",
    env_sound = 20006
  },
  [1080303002] = {
    id = 1080303002,
    talk_text = function()
      return T_S(10803030020)
    end,
    next_dialog = 1080303003,
    speak_head = 90120014,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10803030025)
    end,
    text_sound_path = "event:/voice_cn/story/S0035/S0035_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0035",
    env_sound = 20006
  },
  [1080303003] = {
    id = 1080303003,
    talk_text = function()
      return T_S(10803030030)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303003/1080303003_90110003.playable"
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
    next_dialog = 1080303004,
    speak_name = function()
      return T_S(10803030035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00284",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20006
  },
  [1080303004] = {
    id = 1080303004,
    talk_text = function()
      return T_S(10803030040)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303004/1080303004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303004/1080303004_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"240:-980", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080303005,
    speak_name = function()
      return T_S(10803030045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00177",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20006
  },
  [1080303005] = {
    id = 1080303005,
    talk_text = function()
      return T_S(10803030050)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303005/1080303005_90110009.playable"
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
    next_dialog = 1080303006,
    speak_name = function()
      return T_S(10803030055)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00134",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20006
  },
  [1080303006] = {
    id = 1080303006,
    talk_text = function()
      return T_S(10803030060)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303006/1080303006_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1080303007,
    speak_head = 90120014,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10803030065)
    end,
    text_sound_path = "event:/voice_cn/story/S0035/S0035_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0035",
    env_sound = 20006
  },
  [1080303007] = {
    id = 1080303007,
    talk_text = function()
      return T_S(10803030070)
    end,
    next_dialog = 1080303008,
    camera_shake = {
      "3",
      "0",
      "1600"
    },
    env_sound = 20006,
    force_auto = 1,
    special_sound = 23017,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_SingleBlunt.prefab",
      "0"
    }
  },
  [1080303008] = {
    id = 1080303008,
    talk_text = function()
      return T_S(10803030080)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303008/1080303008_90110009.playable"
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
    next_dialog = 1080303009,
    speak_name = function()
      return T_S(10803030085)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00135",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20006
  },
  [1080303009] = {
    id = 1080303009,
    talk_text = function()
      return T_S(10803030090)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303009/1080303009_90110009.playable"
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
    next_dialog = 1080303010,
    speak_head = 90120014,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10803030095)
    end,
    text_sound_path = "event:/voice_cn/story/S0035/S0035_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0035",
    env_sound = 20006
  },
  [1080303010] = {
    id = 1080303010,
    talk_text = function()
      return T_S(10803030100)
    end,
    role_ids = {90110009, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303010/1080303010_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303010/1080303010_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1080", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080303011,
    speak_name = function()
      return T_S(10803030105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00285",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20006
  },
  [1080303011] = {
    id = 1080303011,
    talk_text = function()
      return T_S(10803030110)
    end,
    role_ids = {90110009, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303011/1080303011_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303011/1080303011_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1080", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080303012,
    speak_name = function()
      return T_S(10803030115)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00136",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20006
  },
  [1080303012] = {
    id = 1080303012,
    talk_text = function()
      return T_S(10803030120)
    end,
    role_ids = {90110010},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303012/1080303012_90110010.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"0:-958"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080303013,
    speak_name = function()
      return T_S(10803030125)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00030",
    text_sound_bank = "bank:/voice_cn/sty/M0016",
    env_sound = 20006
  },
  [1080303013] = {
    id = 1080303013,
    talk_text = function()
      return T_S(10803030130)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303013/1080303013_90110001.playable"
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
    next_dialog = 1080303014,
    speak_name = function()
      return T_S(10803030135)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00239",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20006
  },
  [1080303014] = {
    id = 1080303014,
    talk_text = function()
      return T_S(10803030140)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303014/1080303014_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303014/1080303014_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080303021,
    speak_name = function()
      return T_S(10803030145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00246",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20006
  },
  [1080303015] = {
    id = 1080303015,
    talk_text = function()
      return T_S(10803030150)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303015/1080303015_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303015/1080303015_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      ""
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080303016,
    speak_name = function()
      return T_S(10803030155)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00240",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20006
  },
  [1080303016] = {
    id = 1080303016,
    talk_text = function()
      return T_S(10803030160)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303016/1080303016_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303016/1080303016_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      ""
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080303017,
    speak_name = function()
      return T_S(10803030165)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00248",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20006
  },
  [1080303017] = {
    id = 1080303017,
    talk_text = function()
      return T_S(10803030170)
    end,
    is_master = 1,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303017/1080303017_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303017/1080303017_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      ""
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1080303022,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00276_01",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20006
  },
  [1080303018] = {
    id = 1080303018,
    talk_text = function()
      return T_S(10803030180)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303018/1080303018_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303018/1080303018_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      ""
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080303019,
    speak_name = function()
      return T_S(10803030185)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00241",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20006
  },
  [1080303019] = {
    id = 1080303019,
    talk_text = function()
      return T_S(10803030190)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303019/1080303019_90110003.playable"
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
    next_dialog = 1080303020,
    speak_name = function()
      return T_S(10803030195)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00286",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20006
  },
  [1080303020] = {
    id = 1080303020,
    talk_text = function()
      return T_S(10803030200)
    end,
    is_master = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303020/1080303020_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00278",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20006
  },
  [1080303021] = {
    id = 1080303021,
    talk_text = function()
      return T_S(10803030210)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303021/1080303021_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303021/1080303021_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      ""
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080303015,
    speak_name = function()
      return T_S(10803030215)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00247",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20006
  },
  [1080303022] = {
    id = 1080303022,
    talk_text = function()
      return T_S(10803030220)
    end,
    is_master = 1,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303022/1080303022_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080303022/1080303022_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      ""
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1080303018,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00277",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20006
  },
  [1080304001] = {
    id = 1080304001,
    talk_text = function()
      return T_S(10803040010)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304001/1080304001_90110013.playable"
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
    next_dialog = 1080304002,
    speak_name = function()
      return T_S(10803040015)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20006
  },
  [1080304002] = {
    id = 1080304002,
    talk_text = function()
      return T_S(10803040020)
    end,
    role_ids = {90110013, 90110011},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304002/1080304002_90110013.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304002/1080304002_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"270:-1220", "-318:-1033"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "210"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080304003,
    speak_name = function()
      return T_S(10803040025)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00041",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20006
  },
  [1080304003] = {
    id = 1080304003,
    talk_text = function()
      return T_S(10803040030)
    end,
    role_ids = {90110013, 90110011},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304003/1080304003_90110013.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304003/1080304003_90110011.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"270:-1220", "-318:-1033"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "2"},
    effect_out_param = {"0", "320"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080304004,
    speak_name = function()
      return T_S(10803040035)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20006
  },
  [1080304004] = {
    id = 1080304004,
    talk_text = function()
      return T_S(10803040040)
    end,
    is_os = 1,
    role_ids = {90110013},
    scale = {10000, 10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304004/1080304004_90110013.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080304005,
    speak_name = function()
      return T_S(10803040045)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20006
  },
  [1080304005] = {
    id = 1080304005,
    talk_text = function()
      return T_S(10803040050)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304005/1080304005_90110013.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1080304006,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10803040055)
    end,
    text_sound_path = "event:/voice_cn/story/S0035/S0035_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0035",
    env_sound = 20006
  },
  [1080304006] = {
    id = 1080304006,
    talk_text = function()
      return T_S(10803040060)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304006/1080304006_90110013.playable"
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
    next_dialog = 1080304007,
    speak_name = function()
      return T_S(10803040065)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20006
  },
  [1080304007] = {
    id = 1080304007,
    talk_text = function()
      return T_S(10803040070)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304007/1080304007_90110013.playable"
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
    next_dialog = 1080304008,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10803040075)
    end,
    text_sound_path = "event:/voice_cn/story/S0035/S0035_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0035",
    env_sound = 20006
  },
  [1080304008] = {
    id = 1080304008,
    talk_text = function()
      return T_S(10803040080)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304008/1080304008_90110013.playable"
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
    next_dialog = 1080304009,
    speak_name = function()
      return T_S(10803040085)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20006
  },
  [1080304009] = {
    id = 1080304009,
    talk_text = function()
      return T_S(10803040090)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304009/1080304009_90110013.playable"
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
    next_dialog = 1080304010,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10803040095)
    end,
    text_sound_path = "event:/voice_cn/story/S0035/S0035_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0035",
    env_sound = 20006
  },
  [1080304010] = {
    id = 1080304010,
    talk_text = function()
      return T_S(10803040100)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080304010/1080304010_90110013.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10803040105)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20006
  }
}
