BasePlotDialogPart515400 = {
  [2030901001] = {
    id = 2030901001,
    talk_text = function()
      return T_S(20309010010)
    end,
    scale = {10000},
    next_dialog = 2030901002,
    speak_name = function()
      return T_S(20309010015)
    end,
    camera_shake = {
      "2",
      "0",
      "1500"
    },
    env_sound = 20002,
    review_head = "90210001",
    open_title_1 = function()
      return T_S(20309010018)
    end,
    open_title_2 = function()
      return T_S(20309010019)
    end
  },
  [2030901002] = {
    id = 2030901002,
    talk_text = function()
      return T_S(20309010020)
    end,
    next_dialog = 2030901003,
    env_sound = 20002
  },
  [2030901003] = {
    id = 2030901003,
    talk_text = function()
      return T_S(20309010030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901004,
    speak_name = function()
      return T_S(20309010035)
    end,
    env_sound = 20002
  },
  [2030901004] = {
    id = 2030901004,
    talk_text = function()
      return T_S(20309010040)
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
      "",
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
    next_dialog = 2030901005,
    speak_name = function()
      return T_S(20309010045)
    end,
    env_sound = 20002
  },
  [2030901005] = {
    id = 2030901005,
    talk_text = function()
      return T_S(20309010050)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030901005/2030901005_90110002.playable"
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
    next_dialog = 2030901006,
    speak_name = function()
      return T_S(20309010055)
    end,
    env_sound = 20002
  },
  [2030901006] = {
    id = 2030901006,
    talk_text = function()
      return T_S(20309010060)
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
    next_dialog = 2030901007,
    camera_shake = {
      "3",
      "0",
      "1500"
    },
    env_sound = 20002
  },
  [2030901007] = {
    id = 2030901007,
    talk_text = function()
      return T_S(20309010070)
    end,
    role_ids = {90110002, 90110028},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030901007/2030901007_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-1066", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "210"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030901008,
    speak_name = function()
      return T_S(20309010075)
    end,
    env_sound = 20002
  },
  [2030901008] = {
    id = 2030901008,
    talk_text = function()
      return T_S(20309010080)
    end,
    next_dialog = 2030901009,
    camera_shake = {
      "2",
      "0",
      "2000"
    },
    env_sound = 20002
  },
  [2030901009] = {
    id = 2030901009,
    talk_text = function()
      return T_S(20309010090)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030901009/2030901009_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"1:0:1200"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901010,
    speak_name = function()
      return T_S(20309010095)
    end,
    env_sound = 20002
  },
  [2030901010] = {
    id = 2030901010,
    talk_text = function()
      return T_S(20309010100)
    end,
    next_dialog = 2030901011,
    env_sound = 20002
  },
  [2030901011] = {
    id = 2030901011,
    talk_text = function()
      return T_S(20309010110)
    end,
    role_ids = {90110029},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"0:-888"},
    role_shake = {"1:0:1200"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901012,
    speak_name = function()
      return T_S(20309010115)
    end,
    env_sound = 20002
  },
  [2030901012] = {
    id = 2030901012,
    talk_text = function()
      return T_S(20309010120)
    end,
    role_ids = {90110029},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"0:-888"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030901013,
    env_sound = 20002
  },
  [2030901013] = {
    id = 2030901013,
    talk_text = function()
      return T_S(20309010130)
    end,
    role_ids = {90110029, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-888", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030901014,
    speak_name = function()
      return T_S(20309010135)
    end,
    env_sound = 20002
  },
  [2030901014] = {
    id = 2030901014,
    talk_text = function()
      return T_S(20309010140)
    end,
    role_ids = {90110029, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-888", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"3", "1"},
    effect_out_param = {"180", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030901015,
    speak_name = function()
      return T_S(20309010145)
    end,
    env_sound = 20002
  },
  [2030901015] = {
    id = 2030901015,
    talk_text = function()
      return T_S(20309010150)
    end,
    next_dialog = 2030901016,
    env_sound = 20002
  },
  [2030901016] = {
    id = 2030901016,
    talk_text = function()
      return T_S(20309010160)
    end,
    role_ids = {90110029},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"0:-888"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901017,
    speak_name = function()
      return T_S(20309010165)
    end,
    env_sound = 20002
  },
  [2030901017] = {
    id = 2030901017,
    talk_text = function()
      return T_S(20309010170)
    end,
    is_master = 1,
    role_ids = {90110029},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"0:-888"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2030901018,
    env_sound = 20002
  },
  [2030901018] = {
    id = 2030901018,
    talk_text = function()
      return T_S(20309010180)
    end,
    role_ids = {90110029, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-888", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030901019,
    speak_name = function()
      return T_S(20309010185)
    end,
    env_sound = 20002
  },
  [2030901019] = {
    id = 2030901019,
    talk_text = function()
      return T_S(20309010190)
    end,
    is_master = 1,
    role_ids = {90110029, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-888", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 2030901020,
    env_sound = 20002
  },
  [2030901020] = {
    id = 2030901020,
    talk_text = function()
      return T_S(20309010200)
    end,
    next_dialog = 2030901021,
    env_sound = 20002
  },
  [2030901021] = {
    id = 2030901021,
    talk_text = function()
      return T_S(20309010210)
    end,
    next_dialog = 2030901022,
    speak_name = function()
      return T_S(20309010215)
    end,
    env_sound = 20002,
    review_head = "90210001"
  },
  [2030901022] = {
    id = 2030901022,
    talk_text = function()
      return T_S(20309010220)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901023,
    speak_name = function()
      return T_S(20309010225)
    end,
    env_sound = 20002
  },
  [2030901023] = {
    id = 2030901023,
    talk_text = function()
      return T_S(20309010230)
    end,
    next_dialog = 2030901024,
    env_sound = 20002
  },
  [2030901024] = {
    id = 2030901024,
    talk_text = function()
      return T_S(20309010240)
    end,
    role_ids = {90110029, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-888", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030901025,
    speak_name = function()
      return T_S(20309010245)
    end,
    env_sound = 20002
  },
  [2030901025] = {
    id = 2030901025,
    talk_text = function()
      return T_S(20309010250)
    end,
    role_ids = {90110029, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-888", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030901026,
    speak_name = function()
      return T_S(20309010255)
    end,
    env_sound = 20002
  },
  [2030901026] = {
    id = 2030901026,
    talk_text = function()
      return T_S(20309010260)
    end,
    next_dialog = 2030901027,
    env_sound = 20002
  },
  [2030901027] = {
    id = 2030901027,
    talk_text = function()
      return T_S(20309010270)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901028,
    speak_name = function()
      return T_S(20309010275)
    end,
    env_sound = 20002
  },
  [2030901028] = {
    id = 2030901028,
    talk_text = function()
      return T_S(20309010280)
    end,
    is_master = 1,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030901029,
    env_sound = 20002
  },
  [2030901029] = {
    id = 2030901029,
    talk_text = function()
      return T_S(20309010290)
    end,
    role_ids = {90110028, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"260:-1122", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030901030,
    speak_name = function()
      return T_S(20309010295)
    end,
    env_sound = 20002
  },
  [2030901030] = {
    id = 2030901030,
    talk_text = function()
      return T_S(20309010300)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030901030/2030901030_90110003.playable"
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
    next_dialog = 2030901031,
    speak_name = function()
      return T_S(20309010305)
    end,
    env_sound = 20002
  },
  [2030901031] = {
    id = 2030901031,
    talk_text = function()
      return T_S(20309010310)
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
    next_dialog = 2030901032,
    speak_name = function()
      return T_S(20309010315)
    end,
    env_sound = 20002
  },
  [2030901032] = {
    id = 2030901032,
    talk_text = function()
      return T_S(20309010320)
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
    next_dialog = 2030901033,
    speak_name = function()
      return T_S(20309010325)
    end,
    env_sound = 20002
  },
  [2030901033] = {
    id = 2030901033,
    talk_text = function()
      return T_S(20309010330)
    end,
    next_dialog = 2030901034,
    env_sound = 20002
  },
  [2030901034] = {
    id = 2030901034,
    talk_text = function()
      return T_S(20309010340)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901035,
    speak_name = function()
      return T_S(20309010345)
    end,
    env_sound = 20002
  },
  [2030901035] = {
    id = 2030901035,
    talk_text = function()
      return T_S(20309010350)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030901036,
    env_sound = 20002
  },
  [2030901036] = {
    id = 2030901036,
    talk_text = function()
      return T_S(20309010360)
    end,
    is_master = 1,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2030901037,
    env_sound = 20002
  },
  [2030901037] = {
    id = 2030901037,
    talk_text = function()
      return T_S(20309010370)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_2.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901038,
    speak_name = function()
      return T_S(20309010375)
    end,
    env_sound = 20002
  },
  [2030901038] = {
    id = 2030901038,
    talk_text = function()
      return T_S(20309010380)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030901038/2030901038_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 1},
    light_role = {1, 1},
    next_dialog = 2030901039,
    speak_name = function()
      return T_S(20309010385)
    end,
    env_sound = 20002
  },
  [2030901039] = {
    id = 2030901039,
    talk_text = function()
      return T_S(20309010390)
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
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030901040,
    env_sound = 20002
  },
  [2030901040] = {
    id = 2030901040,
    talk_text = function()
      return T_S(20309010400)
    end,
    is_master = 1,
    next_dialog = 2030901041,
    env_sound = 20002
  },
  [2030901041] = {
    id = 2030901041,
    talk_text = function()
      return T_S(20309010410)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901042,
    speak_name = function()
      return T_S(20309010415)
    end,
    env_sound = 20002
  },
  [2030901042] = {
    id = 2030901042,
    talk_text = function()
      return T_S(20309010420)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901043,
    speak_name = function()
      return T_S(20309010425)
    end,
    env_sound = 20002
  },
  [2030901043] = {
    id = 2030901043,
    talk_text = function()
      return T_S(20309010430)
    end,
    is_master = 1,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2030901044,
    env_sound = 20002
  },
  [2030901044] = {
    id = 2030901044,
    talk_text = function()
      return T_S(20309010440)
    end,
    is_os = 1,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901045,
    speak_name = function()
      return T_S(20309010445)
    end,
    env_sound = 20002
  },
  [2030901045] = {
    id = 2030901045,
    talk_text = function()
      return T_S(20309010450)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-12:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030901046,
    env_sound = 20002
  },
  [2030901046] = {
    id = 2030901046,
    talk_text = function()
      return T_S(20309010460)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 2030901047,
    env_sound = 20002
  },
  [2030901047] = {
    id = 2030901047,
    talk_text = function()
      return T_S(20309010470)
    end,
    next_dialog = 2030901048,
    env_sound = 20002
  },
  [2030901048] = {
    id = 2030901048,
    talk_text = function()
      return T_S(20309010480)
    end,
    role_ids = {90110029},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"0:-888"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030901049,
    speak_name = function()
      return T_S(20309010485)
    end,
    env_sound = 20002
  },
  [2030901049] = {
    id = 2030901049,
    talk_text = function()
      return T_S(20309010490)
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
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030901050,
    speak_name = function()
      return T_S(20309010495)
    end,
    env_sound = 20002
  },
  [2030901050] = {
    id = 2030901050,
    talk_text = function()
      return T_S(20309010500)
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
    role_position = {"120:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030901051,
    env_sound = 20002
  },
  [2030901051] = {
    id = 2030901051,
    talk_text = function()
      return T_S(20309010510)
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
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030901052,
    speak_name = function()
      return T_S(20309010515)
    end,
    env_sound = 20002
  },
  [2030901052] = {
    id = 2030901052,
    talk_text = function()
      return T_S(20309010520)
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
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030901053,
    speak_name = function()
      return T_S(20309010525)
    end,
    env_sound = 20002
  },
  [2030901053] = {
    id = 2030901053,
    talk_text = function()
      return T_S(20309010530)
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
    role_position = {"240:-980", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030901054,
    speak_name = function()
      return T_S(20309010535)
    end,
    env_sound = 20002
  },
  [2030901054] = {
    id = 2030901054,
    talk_text = function()
      return T_S(20309010540)
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
    next_dialog = 2030901055,
    speak_name = function()
      return T_S(20309010545)
    end,
    env_sound = 20002
  },
  [2030901055] = {
    id = 2030901055,
    talk_text = function()
      return T_S(20309010550)
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
    light_role = {1},
    env_sound = 20002
  },
  [2030902001] = {
    id = 2030902001,
    talk_text = function()
      return T_S(20309020010)
    end,
    next_dialog = 2030902002,
    env_sound = 20002
  },
  [2030902002] = {
    id = 2030902002,
    talk_text = function()
      return T_S(20309020020)
    end,
    next_dialog = 2030902003,
    env_sound = 20002
  },
  [2030902003] = {
    id = 2030902003,
    talk_text = function()
      return T_S(20309020030)
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
    next_dialog = 2030902004,
    speak_name = function()
      return T_S(20309020035)
    end,
    env_sound = 20002
  },
  [2030902004] = {
    id = 2030902004,
    talk_text = function()
      return T_S(20309020040)
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
    next_dialog = 2030902005,
    speak_name = function()
      return T_S(20309020045)
    end,
    env_sound = 20002
  },
  [2030902005] = {
    id = 2030902005,
    talk_text = function()
      return T_S(20309020050)
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030902006,
    speak_name = function()
      return T_S(20309020055)
    end,
    env_sound = 20002
  },
  [2030902006] = {
    id = 2030902006,
    talk_text = function()
      return T_S(20309020060)
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
    next_dialog = 2030902007,
    speak_name = function()
      return T_S(20309020065)
    end,
    env_sound = 20002
  },
  [2030902007] = {
    id = 2030902007,
    talk_text = function()
      return T_S(20309020070)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030902008,
    env_sound = 20002
  },
  [2030902008] = {
    id = 2030902008,
    talk_text = function()
      return T_S(20309020080)
    end,
    next_dialog = 2030902009,
    camera_shake = {
      "2",
      "0",
      "1600"
    },
    env_sound = 20002
  },
  [2030902009] = {
    id = 2030902009,
    talk_text = function()
      return T_S(20309020090)
    end,
    speak_head = 90120043,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(20309020095)
    end,
    env_sound = 20002
  }
}
