BasePlotDialogPart510000 = {
  [2020101001] = {
    id = 2020101001,
    talk_text = function()
      return T_S(20201010010)
    end,
    scale = {10000},
    next_dialog = 2020101002,
    speak_head = 90120022,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20201010015)
    end,
    env_sound = 20006
  },
  [2020101002] = {
    id = 2020101002,
    talk_text = function()
      return T_S(20201010020)
    end,
    next_dialog = 2020101003,
    speak_name = function()
      return T_S(20201010025)
    end,
    env_sound = 20006,
    review_head = "90210001"
  },
  [2020101003] = {
    id = 2020101003,
    talk_text = function()
      return T_S(20201010030)
    end,
    next_dialog = 2020101004,
    env_sound = 20006
  },
  [2020101004] = {
    id = 2020101004,
    talk_text = function()
      return T_S(20201010040)
    end,
    next_dialog = 2020101005,
    speak_head = 90120022,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20201010045)
    end,
    env_sound = 20006
  },
  [2020101005] = {
    id = 2020101005,
    talk_text = function()
      return T_S(20201010050)
    end,
    is_master = 1,
    next_dialog = 2020101006,
    env_sound = 20006
  },
  [2020101006] = {
    id = 2020101006,
    talk_text = function()
      return T_S(20201010060)
    end,
    next_dialog = 2020101007,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20201010065)
    end,
    env_sound = 20006
  },
  [2020101007] = {
    id = 2020101007,
    talk_text = function()
      return T_S(20201010070)
    end,
    next_dialog = 2020101008,
    env_sound = 20006
  },
  [2020101008] = {
    id = 2020101008,
    talk_text = function()
      return T_S(20201010080)
    end,
    is_master = 1,
    next_dialog = 2020101009,
    env_sound = 20006
  },
  [2020101009] = {
    id = 2020101009,
    talk_text = function()
      return T_S(20201010090)
    end,
    next_dialog = 2020101010,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20201010095)
    end,
    env_sound = 20006
  },
  [2020101010] = {
    id = 2020101010,
    talk_text = function()
      return T_S(20201010100)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 2020101011,
    env_sound = 20006
  },
  [2020101011] = {
    id = 2020101011,
    talk_text = function()
      return T_S(20201010110)
    end,
    is_master = 1,
    next_dialog = 2020101012,
    env_sound = 20006
  },
  [2020101012] = {
    id = 2020101012,
    talk_text = function()
      return T_S(20201010120)
    end,
    next_dialog = 2020101013,
    env_sound = 20006
  },
  [2020101013] = {
    id = 2020101013,
    talk_text = function()
      return T_S(20201010130)
    end,
    next_dialog = 2020101014,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20201010135)
    end,
    env_sound = 20006
  },
  [2020101014] = {
    id = 2020101014,
    talk_text = function()
      return T_S(20201010140)
    end,
    next_dialog = 2020101015,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20201010145)
    end,
    env_sound = 20006
  },
  [2020101015] = {
    id = 2020101015,
    talk_text = function()
      return T_S(20201010150)
    end,
    next_dialog = 2020101016,
    env_sound = 20006
  },
  [2020101016] = {
    id = 2020101016,
    talk_text = function()
      return T_S(20201010160)
    end,
    is_master = 1,
    next_dialog = 2020101017,
    env_sound = 20006
  },
  [2020101017] = {
    id = 2020101017,
    talk_text = function()
      return T_S(20201010170)
    end,
    next_dialog = 2020101018,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20201010175)
    end,
    env_sound = 20006
  },
  [2020101018] = {
    id = 2020101018,
    talk_text = function()
      return T_S(20201010180)
    end,
    next_dialog = 2020101019,
    camera_shake = {
      "2",
      "0",
      "1200"
    },
    env_sound = 20006
  },
  [2020101019] = {
    id = 2020101019,
    talk_text = function()
      return T_S(20201010190)
    end,
    next_dialog = 2020101020,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20201010195)
    end,
    env_sound = 20006
  },
  [2020101020] = {
    id = 2020101020,
    talk_text = function()
      return T_S(20201010200)
    end,
    next_dialog = 2020101021,
    env_sound = 20006
  },
  [2020101021] = {
    id = 2020101021,
    talk_text = function()
      return T_S(20201010210)
    end,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020101022,
    speak_name = function()
      return T_S(20201010215)
    end,
    env_sound = 20006
  },
  [2020101022] = {
    id = 2020101022,
    talk_text = function()
      return T_S(20201010220)
    end,
    is_master = 1,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2020101023,
    env_sound = 20006
  },
  [2020101023] = {
    id = 2020101023,
    talk_text = function()
      return T_S(20201010230)
    end,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020101024,
    speak_name = function()
      return T_S(20201010235)
    end,
    env_sound = 20006
  },
  [2020101024] = {
    id = 2020101024,
    talk_text = function()
      return T_S(20201010240)
    end,
    is_master = 1,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2020101025,
    env_sound = 20006
  },
  [2020101025] = {
    id = 2020101025,
    talk_text = function()
      return T_S(20201010250)
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
    next_dialog = 2020101026,
    speak_name = function()
      return T_S(20201010255)
    end,
    env_sound = 20006
  },
  [2020101026] = {
    id = 2020101026,
    talk_text = function()
      return T_S(20201010260)
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
    next_dialog = 2020101027,
    env_sound = 20006
  },
  [2020101027] = {
    id = 2020101027,
    talk_text = function()
      return T_S(20201010270)
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
    next_dialog = 2020101028,
    speak_name = function()
      return T_S(20201010275)
    end,
    env_sound = 20006
  },
  [2020101028] = {
    id = 2020101028,
    talk_text = function()
      return T_S(20201010280)
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
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020101029,
    speak_name = function()
      return T_S(20201010285)
    end,
    env_sound = 20006
  },
  [2020101029] = {
    id = 2020101029,
    talk_text = function()
      return T_S(20201010290)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020101029/2020101029_90110003.playable",
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020101030,
    speak_name = function()
      return T_S(20201010295)
    end,
    env_sound = 20006
  },
  [2020101030] = {
    id = 2020101030,
    talk_text = function()
      return T_S(20201010300)
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
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020101031,
    speak_name = function()
      return T_S(20201010305)
    end,
    env_sound = 20006
  },
  [2020101031] = {
    id = 2020101031,
    talk_text = function()
      return T_S(20201010310)
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020101032,
    speak_name = function()
      return T_S(20201010315)
    end,
    env_sound = 20006
  },
  [2020101032] = {
    id = 2020101032,
    talk_text = function()
      return T_S(20201010320)
    end,
    is_master = 1,
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
    next_dialog = 2020101033,
    env_sound = 20006
  },
  [2020101033] = {
    id = 2020101033,
    talk_text = function()
      return T_S(20201010330)
    end,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020101034,
    speak_name = function()
      return T_S(20201010335)
    end,
    env_sound = 20006
  },
  [2020101034] = {
    id = 2020101034,
    talk_text = function()
      return T_S(20201010340)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"2", "0"},
    effect_out_param = {"210", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020101035,
    speak_name = function()
      return T_S(20201010345)
    end,
    env_sound = 20006
  },
  [2020101035] = {
    id = 2020101035,
    talk_text = function()
      return T_S(20201010350)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20201010355)
    end,
    env_sound = 20006
  },
  [2020102001] = {
    id = 2020102001,
    talk_text = function()
      return T_S(20201020010)
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
    next_dialog = 2020102002,
    speak_name = function()
      return T_S(20201020015)
    end,
    env_sound = 20001
  },
  [2020102002] = {
    id = 2020102002,
    talk_text = function()
      return T_S(20201020020)
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
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020102003,
    speak_name = function()
      return T_S(20201020025)
    end,
    env_sound = 20001
  },
  [2020102003] = {
    id = 2020102003,
    talk_text = function()
      return T_S(20201020030)
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
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020102004,
    speak_name = function()
      return T_S(20201020035)
    end,
    env_sound = 20001
  },
  [2020102004] = {
    id = 2020102004,
    talk_text = function()
      return T_S(20201020040)
    end,
    next_dialog = 2020102005,
    env_sound = 20001
  },
  [2020102005] = {
    id = 2020102005,
    talk_text = function()
      return T_S(20201020050)
    end,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020102006,
    speak_name = function()
      return T_S(20201020055)
    end,
    env_sound = 20001
  },
  [2020102006] = {
    id = 2020102006,
    talk_text = function()
      return T_S(20201020060)
    end,
    role_ids = {90110024, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1077", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020102007,
    speak_name = function()
      return T_S(20201020065)
    end,
    env_sound = 20001
  },
  [2020102007] = {
    id = 2020102007,
    talk_text = function()
      return T_S(20201020070)
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
    next_dialog = 2020102008,
    speak_name = function()
      return T_S(20201020075)
    end,
    env_sound = 20001
  },
  [2020102008] = {
    id = 2020102008,
    talk_text = function()
      return T_S(20201020080)
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
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020102009,
    speak_name = function()
      return T_S(20201020085)
    end,
    env_sound = 20001
  },
  [2020102009] = {
    id = 2020102009,
    talk_text = function()
      return T_S(20201020090)
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
    speak_name = function()
      return T_S(20201020095)
    end,
    env_sound = 20001
  }
}
