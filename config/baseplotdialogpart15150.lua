BasePlotDialogPart15150 = {
  [1030401001] = {
    id = 1030401001,
    middle_text = function()
      return T_S(10304010013)
    end,
    next_dialog = 1030401002,
    env_sound = 20008,
    open_title_1 = function()
      return T_S(10304010018)
    end,
    open_title_2 = function()
      return T_S(10304010019)
    end,
    open_bg_id = 90210058
  },
  [1030401002] = {
    id = 1030401002,
    middle_text = function()
      return T_S(10304010023)
    end,
    next_dialog = 1030401003,
    env_sound = 20008
  },
  [1030401003] = {
    id = 1030401003,
    talk_text = function()
      return T_S(10304010030)
    end,
    next_dialog = 1030401004,
    speak_name = function()
      return T_S(10304010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00054",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20008,
    review_head = "90120001"
  },
  [1030401004] = {
    id = 1030401004,
    talk_text = function()
      return T_S(10304010040)
    end,
    next_dialog = 1030401005,
    speak_name = function()
      return T_S(10304010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00065",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20008,
    review_head = "90120002"
  },
  [1030401005] = {
    id = 1030401005,
    talk_text = function()
      return T_S(10304010050)
    end,
    next_dialog = 1030401006,
    speak_name = function()
      return T_S(10304010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00081",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20008,
    review_head = "90120001"
  },
  [1030401006] = {
    id = 1030401006,
    talk_text = function()
      return T_S(10304010060)
    end,
    speak_name = function()
      return T_S(10304010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20008,
    review_head = "90120002"
  },
  [1030402001] = {
    id = 1030402001,
    talk_text = function()
      return T_S(10304020010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402001/1030402001_90110001.playable"
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
    next_dialog = 1030402002,
    speak_name = function()
      return T_S(10304020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00082",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1030402002] = {
    id = 1030402002,
    talk_text = function()
      return T_S(10304020020)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402002/1030402002_90110004.playable"
    },
    role_position = {"-150:-1160"},
    effect_in = {"2"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402003,
    speak_name = function()
      return T_S(10304020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00066",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1030402003] = {
    id = 1030402003,
    talk_text = function()
      return T_S(10304020030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402003/1030402003_90110004.playable"
    },
    role_position = {"-150:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402004,
    speak_name = function()
      return T_S(10304020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00067",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1030402004] = {
    id = 1030402004,
    talk_text = function()
      return T_S(10304020040)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402004/1030402004_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402004/1030402004_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1160", "260:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402005,
    speak_name = function()
      return T_S(10304020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00055",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1030402005] = {
    id = 1030402005,
    talk_text = function()
      return T_S(10304020050)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402005/1030402005_90110001.playable"
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
    next_dialog = 1030402006,
    speak_name = function()
      return T_S(10304020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00083",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1030402006] = {
    id = 1030402006,
    talk_text = function()
      return T_S(10304020060)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402006/1030402006_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402006/1030402006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"155:-1000", "-155:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "155"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402007,
    speak_name = function()
      return T_S(10304020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00058",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1030402007] = {
    id = 1030402007,
    talk_text = function()
      return T_S(10304020070)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402007/1030402007_90110003.playable"
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
    next_dialog = 1030402008,
    speak_name = function()
      return T_S(10304020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00056",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1030402008] = {
    id = 1030402008,
    talk_text = function()
      return T_S(10304020080)
    end,
    role_ids = {90110003},
    scale = {12000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402008/1030402008_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-45:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1030402010,
    env_sound = 20001
  },
  [1030402009] = {
    id = 1030402009,
    middle_text = function()
      return T_S(10304020093)
    end,
    next_dialog = 1030402031,
    env_sound = 20001
  },
  [1030402010] = {
    id = 1030402010,
    talk_text = function()
      return T_S(10304020100)
    end,
    is_master = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402010/1030402010_90110003.playable"
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
    light_role = {1},
    next_dialog = 1030402011,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00055",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  },
  [1030402011] = {
    id = 1030402011,
    talk_text = function()
      return T_S(10304020110)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402011/1030402011_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402012,
    speak_name = function()
      return T_S(10304020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1030402012] = {
    id = 1030402012,
    talk_text = function()
      return T_S(10304020120)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402012/1030402012_90110003.playable"
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
    next_dialog = 1030402013,
    speak_name = function()
      return T_S(10304020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00058",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1030402013] = {
    id = 1030402013,
    talk_text = function()
      return T_S(10304020130)
    end,
    is_master = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402013/1030402013_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1030402014,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00056",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  },
  [1030402014] = {
    id = 1030402014,
    talk_text = function()
      return T_S(10304020140)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402014/1030402014_90110004.playable"
    },
    role_position = {"-200:-1160"},
    effect_in = {"2"},
    effect_in_param = {"200"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402015,
    speak_name = function()
      return T_S(10304020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00068",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1030402015] = {
    id = 1030402015,
    talk_text = function()
      return T_S(10304020150)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402015/1030402015_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402015/1030402015_90110001.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-1160", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "210"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402016,
    speak_name = function()
      return T_S(10304020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00084",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1030402016] = {
    id = 1030402016,
    talk_text = function()
      return T_S(10304020160)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402016/1030402016_90110002.playable"
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
    next_dialog = 1030402017,
    speak_name = function()
      return T_S(10304020165)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1030402017] = {
    id = 1030402017,
    talk_text = function()
      return T_S(10304020170)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402017/1030402017_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"120:-980"},
    effect_in = {"3"},
    effect_in_param = {"200"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402018,
    speak_name = function()
      return T_S(10304020175)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1030402018] = {
    id = 1030402018,
    talk_text = function()
      return T_S(10304020180)
    end,
    role_ids = {90110003},
    scale = {13000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402018/1030402018_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-20:-1258"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1030402019,
    env_sound = 20001
  },
  [1030402019] = {
    id = 1030402019,
    talk_text = function()
      return T_S(10304020190)
    end,
    is_master = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402019/1030402019_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"0:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"3"},
    effect_out_param = {"220"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1030402020,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  },
  [1030402020] = {
    id = 1030402020,
    talk_text = function()
      return T_S(10304020200)
    end,
    next_dialog = 1030402021,
    camera_shake = {
      "1",
      "660",
      "1000"
    },
    env_sound = 20001
  },
  [1030402021] = {
    id = 1030402021,
    talk_text = function()
      return T_S(10304020210)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402021/1030402021_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"3"},
    effect_in_param = {"200"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402022,
    speak_name = function()
      return T_S(10304020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00085",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1030402022] = {
    id = 1030402022,
    talk_text = function()
      return T_S(10304020220)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402022/1030402022_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1030402023,
    speak_head = 90120010,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(10304020225)
    end,
    text_sound_path = "event:/voice_cn/story/M0012/M0012_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/M0012",
    env_sound = 20004,
    review_head = "90120001"
  },
  [1030402023] = {
    id = 1030402023,
    talk_text = function()
      return T_S(10304020230)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402023/1030402023_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402023/1030402023_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-1160", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"2", "3"},
    effect_in_param = {"240", "240"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 1},
    light_role = {1, 1},
    next_dialog = 1030402024,
    speak_name = function()
      return T_S(10304020235)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1030402024] = {
    id = 1030402024,
    talk_text = function()
      return T_S(10304020240)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402024/1030402024_90110003.playable"
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
    next_dialog = 1030402025,
    speak_name = function()
      return T_S(10304020245)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20004
  },
  [1030402025] = {
    id = 1030402025,
    talk_text = function()
      return T_S(10304020250)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402025/1030402025_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-50:-1000"},
    effect_in = {"2"},
    effect_in_param = {"270"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402026,
    speak_name = function()
      return T_S(10304020255)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00086",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20004
  },
  [1030402026] = {
    id = 1030402026,
    talk_text = function()
      return T_S(10304020260)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402026/1030402026_90110004.playable"
    },
    role_position = {"-100:-1160"},
    effect_in = {"2"},
    effect_in_param = {"200"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402027,
    speak_name = function()
      return T_S(10304020265)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00070",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20002
  },
  [1030402027] = {
    id = 1030402027,
    talk_text = function()
      return T_S(10304020270)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402027/1030402027_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402027/1030402027_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-1160", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402028,
    speak_name = function()
      return T_S(10304020275)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20002
  },
  [1030402028] = {
    id = 1030402028,
    talk_text = function()
      return T_S(10304020280)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402028/1030402028_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402028/1030402028_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-1160", "270:-1066"},
    role_shake = {"", "1:0:330"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402029,
    speak_name = function()
      return T_S(10304020285)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20002
  },
  [1030402029] = {
    id = 1030402029,
    talk_text = function()
      return T_S(10304020290)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402029/1030402029_90110003.playable"
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
    next_dialog = 1030402030,
    speak_name = function()
      return T_S(10304020295)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20002
  },
  [1030402030] = {
    id = 1030402030,
    middle_text = function()
      return T_S(10304020303)
    end,
    next_dialog = 1030402009,
    env_sound = 20002
  },
  [1030402031] = {
    id = 1030402031,
    talk_text = function()
      return T_S(10304020310)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402031/1030402031_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402032,
    speak_name = function()
      return T_S(10304020315)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00071",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20002
  },
  [1030402032] = {
    id = 1030402032,
    talk_text = function()
      return T_S(10304020320)
    end,
    next_dialog = 1030402033,
    env_sound = 20002
  },
  [1030402033] = {
    id = 1030402033,
    talk_text = function()
      return T_S(10304020330)
    end,
    next_dialog = 1030402034,
    env_sound = 20002
  },
  [1030402034] = {
    id = 1030402034,
    talk_text = function()
      return T_S(10304020340)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402034/1030402034_90110001.playable"
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
    next_dialog = 1030402035,
    speak_name = function()
      return T_S(10304020345)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00087",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1030402035] = {
    id = 1030402035,
    talk_text = function()
      return T_S(10304020350)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402035/1030402035_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402035/1030402035_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"155:-1000", "-135:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "155"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402036,
    speak_name = function()
      return T_S(10304020355)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00063",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20002
  },
  [1030402036] = {
    id = 1030402036,
    talk_text = function()
      return T_S(10304020360)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402036/1030402036_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"20:-980"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402037,
    speak_name = function()
      return T_S(10304020365)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20002
  },
  [1030402037] = {
    id = 1030402037,
    talk_text = function()
      return T_S(10304020370)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402037/1030402037_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402037/1030402037_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1160", "260:-980"},
    role_shake = {"", ""},
    effect_in = {"2", "0"},
    effect_in_param = {"200", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1030402038,
    speak_name = function()
      return T_S(10304020375)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00072",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20002
  },
  [1030402038] = {
    id = 1030402038,
    talk_text = function()
      return T_S(10304020380)
    end,
    is_master = 1,
    next_dialog = 1030402039,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00058",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1030402039] = {
    id = 1030402039,
    talk_text = function()
      return T_S(10304020390)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402039/1030402039_90110001.playable"
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
    next_dialog = 1030402040,
    speak_name = function()
      return T_S(10304020395)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00088_01",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1030402040] = {
    id = 1030402040,
    talk_text = function()
      return T_S(10304020400)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402040/1030402040_90110001.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402041,
    speak_name = function()
      return T_S(10304020405)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00088_02",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1030402041] = {
    id = 1030402041,
    talk_text = function()
      return T_S(10304020410)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402041/1030402041_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402041/1030402041_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"200:-1000", "-200:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "185"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402042,
    speak_name = function()
      return T_S(10304020415)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00064",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20002
  },
  [1030402042] = {
    id = 1030402042,
    talk_text = function()
      return T_S(10304020420)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402042/1030402042_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402042/1030402042_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"200:-1000", "-200:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1030402043,
    speak_name = function()
      return T_S(10304020425)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00089",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1030402043] = {
    id = 1030402043,
    talk_text = function()
      return T_S(10304020430)
    end,
    is_master = 1,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402043/1030402043_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402043/1030402043_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"200:-1000", "-200:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1030402044,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1030402044] = {
    id = 1030402044,
    talk_text = function()
      return T_S(10304020440)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402044/1030402044_90110004.playable"
    },
    role_position = {"-100:-1160"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030402045,
    speak_name = function()
      return T_S(10304020445)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00073",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20002
  },
  [1030402045] = {
    id = 1030402045,
    talk_text = function()
      return T_S(10304020450)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402045/1030402045_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402045/1030402045_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-300:-1160", "260:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402046,
    speak_name = function()
      return T_S(10304020455)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00063_01",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20002
  },
  [1030402046] = {
    id = 1030402046,
    talk_text = function()
      return T_S(10304020460)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402046/1030402046_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030402046/1030402046_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1160", "260:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1030402047,
    speak_name = function()
      return T_S(10304020465)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00063_02",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20002
  },
  [1030402047] = {
    id = 1030402047,
    talk_text = function()
      return T_S(10304020470)
    end,
    speak_name = function()
      return T_S(10304020475)
    end,
    env_sound = 20002,
    review_head = "90120001"
  }
}
