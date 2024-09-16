BasePlotDialogPart510501 = {
  [2021103001] = {
    id = 2021103001,
    talk_text = function()
      return T_S(20211030010)
    end,
    next_dialog = 2021103002,
    speak_head = 90120058,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030015)
    end,
    env_sound = 20001
  },
  [2021103002] = {
    id = 2021103002,
    talk_text = function()
      return T_S(20211030020)
    end,
    next_dialog = 2021103003,
    env_sound = 20001
  },
  [2021103003] = {
    id = 2021103003,
    talk_text = function()
      return T_S(20211030030)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    role_shake = {"2:0:1500"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2021103004,
    speak_name = function()
      return T_S(20211030035)
    end,
    env_sound = 20001
  },
  [2021103004] = {
    id = 2021103004,
    talk_text = function()
      return T_S(20211030040)
    end,
    next_dialog = 2021103005,
    env_sound = 20001
  },
  [2021103005] = {
    id = 2021103005,
    talk_text = function()
      return T_S(20211030050)
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
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2021103006,
    speak_name = function()
      return T_S(20211030055)
    end,
    env_sound = 20001
  },
  [2021103006] = {
    id = 2021103006,
    talk_text = function()
      return T_S(20211030060)
    end,
    role_ids = {90110001, 90110023},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"150:-1000", "-150:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "120"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2021103007,
    speak_name = function()
      return T_S(20211030065)
    end,
    env_sound = 20001
  },
  [2021103007] = {
    id = 2021103007,
    talk_text = function()
      return T_S(20211030070)
    end,
    next_dialog = 2021103008,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20211030075)
    end,
    env_sound = 20001
  },
  [2021103008] = {
    id = 2021103008,
    talk_text = function()
      return T_S(20211030080)
    end,
    next_dialog = 2021103009,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20211030085)
    end,
    env_sound = 20001
  },
  [2021103009] = {
    id = 2021103009,
    talk_text = function()
      return T_S(20211030090)
    end,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_1.playable"
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
    next_dialog = 2021103010,
    speak_name = function()
      return T_S(20211030095)
    end,
    env_sound = 20001
  },
  [2021103010] = {
    id = 2021103010,
    talk_text = function()
      return T_S(20211030100)
    end,
    role_ids = {90110024, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-1077", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2021103011,
    speak_name = function()
      return T_S(20211030105)
    end,
    env_sound = 20001
  },
  [2021103011] = {
    id = 2021103011,
    talk_text = function()
      return T_S(20211030110)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2021103011/2021103011_90110003.playable"
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
    next_dialog = 2021103012,
    speak_name = function()
      return T_S(20211030115)
    end,
    env_sound = 20001
  },
  [2021103012] = {
    id = 2021103012,
    talk_text = function()
      return T_S(20211030120)
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
    next_dialog = 2021103013,
    speak_head = 90120058,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030125)
    end,
    env_sound = 20001
  },
  [2021103013] = {
    id = 2021103013,
    talk_text = function()
      return T_S(20211030130)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2021103013/2021103013_90110003.playable"
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
    next_dialog = 2021103014,
    speak_name = function()
      return T_S(20211030135)
    end,
    env_sound = 20001
  },
  [2021103014] = {
    id = 2021103014,
    talk_text = function()
      return T_S(20211030140)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103015,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030145)
    end,
    env_sound = 20001
  },
  [2021103015] = {
    id = 2021103015,
    talk_text = function()
      return T_S(20211030150)
    end,
    next_dialog = 2021103016,
    env_sound = 20001
  },
  [2021103016] = {
    id = 2021103016,
    talk_text = function()
      return T_S(20211030160)
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
    next_dialog = 2021103017,
    speak_name = function()
      return T_S(20211030165)
    end,
    env_sound = 20001
  },
  [2021103017] = {
    id = 2021103017,
    talk_text = function()
      return T_S(20211030170)
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
    next_dialog = 2021103018,
    env_sound = 20001
  },
  [2021103018] = {
    id = 2021103018,
    talk_text = function()
      return T_S(20211030180)
    end,
    next_dialog = 2021103019,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030185)
    end,
    env_sound = 20001
  },
  [2021103019] = {
    id = 2021103019,
    talk_text = function()
      return T_S(20211030190)
    end,
    next_dialog = 2021103020,
    env_sound = 20001
  },
  [2021103020] = {
    id = 2021103020,
    talk_text = function()
      return T_S(20211030200)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2021103021,
    speak_name = function()
      return T_S(20211030205)
    end,
    env_sound = 20001
  },
  [2021103021] = {
    id = 2021103021,
    talk_text = function()
      return T_S(20211030210)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2021103022,
    speak_name = function()
      return T_S(20211030215)
    end,
    env_sound = 20001
  },
  [2021103022] = {
    id = 2021103022,
    talk_text = function()
      return T_S(20211030220)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103023,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030225)
    end,
    env_sound = 20001
  },
  [2021103023] = {
    id = 2021103023,
    talk_text = function()
      return T_S(20211030230)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2021103024,
    speak_name = function()
      return T_S(20211030235)
    end,
    env_sound = 20001
  },
  [2021103024] = {
    id = 2021103024,
    talk_text = function()
      return T_S(20211030240)
    end,
    is_master = 1,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103025,
    env_sound = 20001
  },
  [2021103025] = {
    id = 2021103025,
    talk_text = function()
      return T_S(20211030250)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2021103026,
    speak_name = function()
      return T_S(20211030255)
    end,
    env_sound = 20001
  },
  [2021103026] = {
    id = 2021103026,
    talk_text = function()
      return T_S(20211030260)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103027,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030265)
    end,
    env_sound = 20001
  },
  [2021103027] = {
    id = 2021103027,
    talk_text = function()
      return T_S(20211030270)
    end,
    is_master = 1,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103028,
    env_sound = 20001
  },
  [2021103028] = {
    id = 2021103028,
    talk_text = function()
      return T_S(20211030280)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103029,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030285)
    end,
    env_sound = 20001
  },
  [2021103029] = {
    id = 2021103029,
    talk_text = function()
      return T_S(20211030290)
    end,
    is_master = 1,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-998", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103030,
    env_sound = 20001
  },
  [2021103030] = {
    id = 2021103030,
    talk_text = function()
      return T_S(20211030300)
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
    next_dialog = 2021103031,
    speak_name = function()
      return T_S(20211030305)
    end,
    env_sound = 20001
  },
  [2021103031] = {
    id = 2021103031,
    talk_text = function()
      return T_S(20211030310)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2021103031/2021103031_90110004.playable"
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
    next_dialog = 2021103032,
    speak_name = function()
      return T_S(20211030315)
    end,
    env_sound = 20001
  },
  [2021103032] = {
    id = 2021103032,
    talk_text = function()
      return T_S(20211030320)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2021103033,
    speak_name = function()
      return T_S(20211030325)
    end,
    env_sound = 20001
  },
  [2021103033] = {
    id = 2021103033,
    talk_text = function()
      return T_S(20211030330)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103034,
    env_sound = 20001
  },
  [2021103034] = {
    id = 2021103034,
    talk_text = function()
      return T_S(20211030340)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103035,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030345)
    end,
    env_sound = 20001
  },
  [2021103035] = {
    id = 2021103035,
    talk_text = function()
      return T_S(20211030350)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2021103036,
    speak_name = function()
      return T_S(20211030355)
    end,
    env_sound = 20001
  },
  [2021103036] = {
    id = 2021103036,
    talk_text = function()
      return T_S(20211030360)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103037,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030365)
    end,
    env_sound = 20001
  },
  [2021103037] = {
    id = 2021103037,
    talk_text = function()
      return T_S(20211030370)
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
    next_dialog = 2021103038,
    speak_name = function()
      return T_S(20211030375)
    end,
    env_sound = 20001
  },
  [2021103038] = {
    id = 2021103038,
    talk_text = function()
      return T_S(20211030380)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103039,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030385)
    end,
    env_sound = 20001
  },
  [2021103039] = {
    id = 2021103039,
    talk_text = function()
      return T_S(20211030390)
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
    next_dialog = 2021103040,
    speak_name = function()
      return T_S(20211030395)
    end,
    env_sound = 20001
  },
  [2021103040] = {
    id = 2021103040,
    talk_text = function()
      return T_S(20211030400)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103041,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030405)
    end,
    env_sound = 20001
  },
  [2021103041] = {
    id = 2021103041,
    talk_text = function()
      return T_S(20211030410)
    end,
    role_ids = {90110002},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2021103042,
    speak_name = function()
      return T_S(20211030415)
    end,
    env_sound = 20001
  },
  [2021103042] = {
    id = 2021103042,
    talk_text = function()
      return T_S(20211030420)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1066", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2021103043,
    speak_name = function()
      return T_S(20211030425)
    end,
    env_sound = 20001
  },
  [2021103043] = {
    id = 2021103043,
    talk_text = function()
      return T_S(20211030430)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1066", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2021103044,
    speak_name = function()
      return T_S(20211030435)
    end,
    env_sound = 20001
  },
  [2021103044] = {
    id = 2021103044,
    talk_text = function()
      return T_S(20211030440)
    end,
    next_dialog = 2021103045,
    env_sound = 20001
  },
  [2021103045] = {
    id = 2021103045,
    talk_text = function()
      return T_S(20211030450)
    end,
    next_dialog = 2021103046,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030455)
    end,
    env_sound = 20001
  },
  [2021103046] = {
    id = 2021103046,
    talk_text = function()
      return T_S(20211030460)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2021103047,
    speak_name = function()
      return T_S(20211030465)
    end,
    env_sound = 20001
  },
  [2021103047] = {
    id = 2021103047,
    talk_text = function()
      return T_S(20211030470)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-998", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2021103048,
    speak_name = function()
      return T_S(20211030475)
    end,
    env_sound = 20001
  },
  [2021103048] = {
    id = 2021103048,
    talk_text = function()
      return T_S(20211030480)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-998", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103049,
    env_sound = 20001
  },
  [2021103049] = {
    id = 2021103049,
    talk_text = function()
      return T_S(20211030490)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-998", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2021103050,
    speak_name = function()
      return T_S(20211030495)
    end,
    env_sound = 20001
  },
  [2021103050] = {
    id = 2021103050,
    talk_text = function()
      return T_S(20211030500)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-998", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2021103051,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030505)
    end,
    env_sound = 20001
  },
  [2021103051] = {
    id = 2021103051,
    talk_text = function()
      return T_S(20211030510)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-998", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2021103052,
    speak_name = function()
      return T_S(20211030515)
    end,
    env_sound = 20001
  },
  [2021103052] = {
    id = 2021103052,
    talk_text = function()
      return T_S(20211030520)
    end,
    role_ids = {90110023, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2021103052/2021103052_90110023.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-998", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "180"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2021103053,
    speak_name = function()
      return T_S(20211030525)
    end,
    env_sound = 20001
  },
  [2021103053] = {
    id = 2021103053,
    talk_text = function()
      return T_S(20211030530)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103054,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030535)
    end,
    env_sound = 20001
  },
  [2021103054] = {
    id = 2021103054,
    talk_text = function()
      return T_S(20211030540)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2021103054/2021103054_90110023.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2021103055,
    speak_name = function()
      return T_S(20211030545)
    end,
    env_sound = 20001
  },
  [2021103055] = {
    id = 2021103055,
    talk_text = function()
      return T_S(20211030550)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103056,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030555)
    end,
    env_sound = 20001
  },
  [2021103056] = {
    id = 2021103056,
    talk_text = function()
      return T_S(20211030560)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2021103057,
    env_sound = 20001
  },
  [2021103057] = {
    id = 2021103057,
    talk_text = function()
      return T_S(20211030570)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103058,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030575)
    end,
    env_sound = 20001
  },
  [2021103058] = {
    id = 2021103058,
    talk_text = function()
      return T_S(20211030580)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2021103059,
    env_sound = 20001
  },
  [2021103059] = {
    id = 2021103059,
    talk_text = function()
      return T_S(20211030590)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103060,
    speak_head = 90120057,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20211030595)
    end,
    env_sound = 20001
  },
  [2021103060] = {
    id = 2021103060,
    talk_text = function()
      return T_S(20211030600)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2021103061,
    env_sound = 20001
  },
  [2021103061] = {
    id = 2021103061,
    talk_text = function()
      return T_S(20211030610)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103062,
    speak_head = 90120057,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20211030615)
    end,
    env_sound = 20001
  },
  [2021103062] = {
    id = 2021103062,
    talk_text = function()
      return T_S(20211030620)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2021103063,
    env_sound = 20001
  },
  [2021103063] = {
    id = 2021103063,
    talk_text = function()
      return T_S(20211030630)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    role_shake = {"2:0:1600"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20211030635)
    end,
    env_sound = 20001
  }
}
