BasePlotDialogPart20250 = {
  [1040601001] = {
    id = 1040601001,
    talk_text = function()
      return T_S(10406010010)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601001/1040601001_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"2"},
    effect_in_param = {"270"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040601002,
    speak_name = function()
      return T_S(10406010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00090",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20007,
    open_title_1 = function()
      return T_S(10406010018)
    end,
    open_title_2 = function()
      return T_S(10406010019)
    end
  },
  [1040601002] = {
    id = 1040601002,
    talk_text = function()
      return T_S(10406010020)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601002/1040601002_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601002/1040601002_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "240"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040601003,
    speak_name = function()
      return T_S(10406010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00089",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20007
  },
  [1040601003] = {
    id = 1040601003,
    talk_text = function()
      return T_S(10406010030)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601003/1040601003_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601003/1040601003_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040601004,
    speak_name = function()
      return T_S(10406010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00091",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20007
  },
  [1040601004] = {
    id = 1040601004,
    talk_text = function()
      return T_S(10406010040)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601004/1040601004_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"3"},
    effect_in_param = {"120"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040601005,
    speak_name = function()
      return T_S(10406010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0013/M0013_story_00017",
    text_sound_bank = "bank:/voice_cn/sty/M0013",
    env_sound = 20007
  },
  [1040601005] = {
    id = 1040601005,
    talk_text = function()
      return T_S(10406010050)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601005/1040601005_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"2"},
    effect_in_param = {"120"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040601006,
    speak_name = function()
      return T_S(10406010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00090",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20007
  },
  [1040601006] = {
    id = 1040601006,
    talk_text = function()
      return T_S(10406010060)
    end,
    is_master = 1,
    next_dialog = 1040601007,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00085",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1040601007] = {
    id = 1040601007,
    talk_text = function()
      return T_S(10406010070)
    end,
    is_master = 1,
    next_dialog = 1040601008,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00086",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1040601008] = {
    id = 1040601008,
    talk_text = function()
      return T_S(10406010080)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601008/1040601008_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"3"},
    effect_in_param = {"120"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040601009,
    speak_name = function()
      return T_S(10406010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0013/M0013_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/M0013",
    env_sound = 20007
  },
  [1040601009] = {
    id = 1040601009,
    talk_text = function()
      return T_S(10406010090)
    end,
    role_ids = {90110006, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601009/1040601009_90110006.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601009/1040601009_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1020", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "210"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040601010,
    speak_name = function()
      return T_S(10406010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00092",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20007
  },
  [1040601010] = {
    id = 1040601010,
    talk_text = function()
      return T_S(10406010100)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601010/1040601010_90110001.playable"
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
    next_dialog = 1040601011,
    speak_name = function()
      return T_S(10406010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00109",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  },
  [1040601011] = {
    id = 1040601011,
    talk_text = function()
      return T_S(10406010110)
    end,
    is_master = 1,
    scale = {10000},
    next_dialog = 1040601013,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00087",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1040601012] = {
    id = 1040601012,
    talk_text = function()
      return T_S(10406010120)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040601012/1040601012_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10406010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0013/M0013_story_00019",
    text_sound_bank = "bank:/voice_cn/sty/M0013",
    env_sound = 20007
  },
  [1040601013] = {
    id = 1040601013,
    talk_text = function()
      return T_S(10406010130)
    end,
    is_master = 1,
    next_dialog = 1040601012,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00088",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1040602001] = {
    id = 1040602001,
    talk_text = function()
      return T_S(10406020010)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602001/1040602001_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040602002,
    speak_name = function()
      return T_S(10406020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00114",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20005
  },
  [1040602002] = {
    id = 1040602002,
    talk_text = function()
      return T_S(10406020020)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602002/1040602002_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1040602003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00089",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20005
  },
  [1040602003] = {
    id = 1040602003,
    talk_text = function()
      return T_S(10406020030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602003/1040602003_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040602004,
    env_sound = 20005,
    special_sound = 23007
  },
  [1040602004] = {
    id = 1040602004,
    talk_text = function()
      return T_S(10406020040)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602004/1040602004_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040602005,
    speak_name = function()
      return T_S(10406020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00115",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20005
  },
  [1040602005] = {
    id = 1040602005,
    talk_text = function()
      return T_S(10406020050)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602005/1040602005_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040602006,
    speak_head = 90120024,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10406020055)
    end,
    text_sound_path = "event:/voice_cn/story/S0019/S0019_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0019",
    env_sound = 20005
  },
  [1040602006] = {
    id = 1040602006,
    talk_text = function()
      return T_S(10406020060)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602006/1040602006_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040602007,
    speak_head = 90120024,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10406020065)
    end,
    text_sound_path = "event:/voice_cn/story/S0019/S0019_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0019",
    env_sound = 20005
  },
  [1040602007] = {
    id = 1040602007,
    talk_text = function()
      return T_S(10406020070)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602007/1040602007_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040602008,
    speak_name = function()
      return T_S(10406020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00116",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20005
  },
  [1040602008] = {
    id = 1040602008,
    talk_text = function()
      return T_S(10406020080)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602008/1040602008_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040602015,
    speak_head = 90120024,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10406020085)
    end,
    text_sound_path = "event:/voice_cn/story/S0019/S0019_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0019",
    env_sound = 20005
  },
  [1040602009] = {
    id = 1040602009,
    talk_text = function()
      return T_S(10406020090)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602009/1040602009_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040602010,
    speak_name = function()
      return T_S(10406020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00117",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20005
  },
  [1040602010] = {
    id = 1040602010,
    talk_text = function()
      return T_S(10406020100)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602010/1040602010_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040602011,
    speak_head = 90120024,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10406020105)
    end,
    text_sound_path = "event:/voice_cn/story/S0019/S0019_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0019",
    env_sound = 20005
  },
  [1040602011] = {
    id = 1040602011,
    talk_text = function()
      return T_S(10406020110)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602011/1040602011_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040602012,
    speak_name = function()
      return T_S(10406020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00118",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20005
  },
  [1040602012] = {
    id = 1040602012,
    talk_text = function()
      return T_S(10406020120)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602012/1040602012_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1040602013,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00090",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20005
  },
  [1040602013] = {
    id = 1040602013,
    talk_text = function()
      return T_S(10406020130)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602013/1040602013_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040602014,
    speak_name = function()
      return T_S(10406020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00119",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20005
  },
  [1040602014] = {
    id = 1040602014,
    talk_text = function()
      return T_S(10406020140)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602014/1040602014_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    speak_head = 90120024,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10406020145)
    end,
    text_sound_path = "event:/voice_cn/story/S0019/S0019_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0019",
    env_sound = 20005
  },
  [1040602015] = {
    id = 1040602015,
    talk_text = function()
      return T_S(10406020150)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040602015/1040602015_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040602009,
    speak_head = 90120024,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10406020155)
    end,
    text_sound_path = "event:/voice_cn/story/S0019/S0019_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0019",
    env_sound = 20005
  }
}
