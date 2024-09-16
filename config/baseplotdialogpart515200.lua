BasePlotDialogPart515200 = {
  [2030501001] = {
    id = 2030501001,
    talk_text = function()
      return T_S(20305010010)
    end,
    next_dialog = 2030501002,
    camera_shake = {
      "2",
      "0",
      "1350"
    },
    env_sound = 20001,
    open_title_1 = function()
      return T_S(20305010018)
    end,
    open_title_2 = function()
      return T_S(20305010019)
    end,
    top_effect = {"", "0"}
  },
  [2030501002] = {
    id = 2030501002,
    talk_text = function()
      return T_S(20305010020)
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
    next_dialog = 2030501003,
    speak_name = function()
      return T_S(20305010025)
    end,
    env_sound = 20001
  },
  [2030501003] = {
    id = 2030501003,
    talk_text = function()
      return T_S(20305010030)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501004,
    speak_name = function()
      return T_S(20305010035)
    end,
    env_sound = 20001
  },
  [2030501004] = {
    id = 2030501004,
    talk_text = function()
      return T_S(20305010040)
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
    next_dialog = 2030501005,
    speak_name = function()
      return T_S(20305010045)
    end,
    env_sound = 20001
  },
  [2030501005] = {
    id = 2030501005,
    talk_text = function()
      return T_S(20305010050)
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
    next_dialog = 2030501006,
    env_sound = 20001
  },
  [2030501006] = {
    id = 2030501006,
    talk_text = function()
      return T_S(20305010060)
    end,
    is_master = 1,
    next_dialog = 2030501007,
    env_sound = 20001
  },
  [2030501007] = {
    id = 2030501007,
    talk_text = function()
      return T_S(20305010070)
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
    next_dialog = 2030501008,
    speak_name = function()
      return T_S(20305010075)
    end,
    env_sound = 20001
  },
  [2030501008] = {
    id = 2030501008,
    talk_text = function()
      return T_S(20305010080)
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
    next_dialog = 2030501009,
    env_sound = 20001
  },
  [2030501009] = {
    id = 2030501009,
    talk_text = function()
      return T_S(20305010090)
    end,
    role_ids = {90110029, 90110028},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-888", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501010,
    speak_name = function()
      return T_S(20305010095)
    end,
    env_sound = 20001
  },
  [2030501010] = {
    id = 2030501010,
    talk_text = function()
      return T_S(20305010100)
    end,
    role_ids = {90110029, 90110028},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-888", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501011,
    speak_name = function()
      return T_S(20305010105)
    end,
    env_sound = 20001
  },
  [2030501011] = {
    id = 2030501011,
    talk_text = function()
      return T_S(20305010110)
    end,
    role_ids = {90110029, 90110028},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-888", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030501012,
    env_sound = 20001
  },
  [2030501012] = {
    id = 2030501012,
    talk_text = function()
      return T_S(20305010120)
    end,
    is_master = 1,
    role_ids = {90110029, 90110028},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-888", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030501013,
    env_sound = 20001
  },
  [2030501013] = {
    id = 2030501013,
    talk_text = function()
      return T_S(20305010130)
    end,
    role_ids = {90110029, 90110028},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-888", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501014,
    speak_name = function()
      return T_S(20305010135)
    end,
    env_sound = 20001
  },
  [2030501014] = {
    id = 2030501014,
    talk_text = function()
      return T_S(20305010140)
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
    next_dialog = 2030501015,
    speak_name = function()
      return T_S(20305010145)
    end,
    env_sound = 20001
  },
  [2030501015] = {
    id = 2030501015,
    talk_text = function()
      return T_S(20305010150)
    end,
    role_ids = {90110003, 90110029},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-300:-980", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501016,
    speak_name = function()
      return T_S(20305010155)
    end,
    env_sound = 20001
  },
  [2030501016] = {
    id = 2030501016,
    talk_text = function()
      return T_S(20305010160)
    end,
    next_dialog = 2030501017,
    env_sound = 20001
  },
  [2030501017] = {
    id = 2030501017,
    talk_text = function()
      return T_S(20305010170)
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
    next_dialog = 2030501018,
    speak_name = function()
      return T_S(20305010175)
    end,
    env_sound = 20001
  },
  [2030501018] = {
    id = 2030501018,
    talk_text = function()
      return T_S(20305010180)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501019,
    speak_name = function()
      return T_S(20305010185)
    end,
    env_sound = 20001
  },
  [2030501019] = {
    id = 2030501019,
    talk_text = function()
      return T_S(20305010190)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030501020,
    env_sound = 20001
  },
  [2030501020] = {
    id = 2030501020,
    talk_text = function()
      return T_S(20305010200)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501021,
    speak_name = function()
      return T_S(20305010205)
    end,
    env_sound = 20001
  },
  [2030501021] = {
    id = 2030501021,
    talk_text = function()
      return T_S(20305010210)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501022,
    speak_name = function()
      return T_S(20305010215)
    end,
    env_sound = 20001
  },
  [2030501022] = {
    id = 2030501022,
    talk_text = function()
      return T_S(20305010220)
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
    next_dialog = 2030501023,
    speak_name = function()
      return T_S(20305010225)
    end,
    env_sound = 20001
  },
  [2030501023] = {
    id = 2030501023,
    talk_text = function()
      return T_S(20305010230)
    end,
    is_os = 1,
    role_ids = {90110001, 90110028},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-1000", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501024,
    speak_name = function()
      return T_S(20305010235)
    end,
    env_sound = 20001
  },
  [2030501024] = {
    id = 2030501024,
    talk_text = function()
      return T_S(20305010240)
    end,
    is_master = 1,
    is_os = 1,
    role_ids = {90110001, 90110028},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-1000", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030501025,
    env_sound = 20001
  },
  [2030501025] = {
    id = 2030501025,
    talk_text = function()
      return T_S(20305010250)
    end,
    role_ids = {90110001, 90110028},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-1000", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"3", "0"},
    effect_out_param = {"150", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030501026,
    env_sound = 20001
  },
  [2030501026] = {
    id = 2030501026,
    talk_text = function()
      return T_S(20305010260)
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
    next_dialog = 2030501027,
    speak_name = function()
      return T_S(20305010265)
    end,
    env_sound = 20001
  },
  [2030501027] = {
    id = 2030501027,
    talk_text = function()
      return T_S(20305010270)
    end,
    is_master = 1,
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030501028,
    env_sound = 20001
  },
  [2030501028] = {
    id = 2030501028,
    talk_text = function()
      return T_S(20305010280)
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
    next_dialog = 2030501029,
    speak_name = function()
      return T_S(20305010285)
    end,
    env_sound = 20001
  },
  [2030501029] = {
    id = 2030501029,
    talk_text = function()
      return T_S(20305010290)
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
    next_dialog = 2030501030,
    env_sound = 20001
  },
  [2030501030] = {
    id = 2030501030,
    talk_text = function()
      return T_S(20305010300)
    end,
    next_dialog = 2030501031,
    env_sound = 20001
  },
  [2030501031] = {
    id = 2030501031,
    talk_text = function()
      return T_S(20305010310)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501032,
    speak_name = function()
      return T_S(20305010315)
    end,
    env_sound = 20001
  },
  [2030501032] = {
    id = 2030501032,
    talk_text = function()
      return T_S(20305010320)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501033,
    speak_name = function()
      return T_S(20305010325)
    end,
    env_sound = 20001
  },
  [2030501033] = {
    id = 2030501033,
    talk_text = function()
      return T_S(20305010330)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501034,
    speak_name = function()
      return T_S(20305010335)
    end,
    env_sound = 20001
  },
  [2030501034] = {
    id = 2030501034,
    talk_text = function()
      return T_S(20305010340)
    end,
    is_os = 1,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_2.playable"
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
    next_dialog = 2030501035,
    speak_name = function()
      return T_S(20305010345)
    end,
    env_sound = 20001
  },
  [2030501035] = {
    id = 2030501035,
    talk_text = function()
      return T_S(20305010350)
    end,
    is_master = 1,
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030501036,
    env_sound = 20001
  },
  [2030501036] = {
    id = 2030501036,
    talk_text = function()
      return T_S(20305010360)
    end,
    is_os = 1,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_4.playable"
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
    next_dialog = 2030501037,
    speak_name = function()
      return T_S(20305010365)
    end,
    env_sound = 20001
  },
  [2030501037] = {
    id = 2030501037,
    talk_text = function()
      return T_S(20305010370)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030501037/2030501037_90110003.playable"
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
    next_dialog = 2030501038,
    speak_name = function()
      return T_S(20305010375)
    end,
    env_sound = 20001
  },
  [2030501038] = {
    id = 2030501038,
    talk_text = function()
      return T_S(20305010380)
    end,
    next_dialog = 2030501039,
    env_sound = 20001
  },
  [2030501039] = {
    id = 2030501039,
    talk_text = function()
      return T_S(20305010390)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501040,
    speak_name = function()
      return T_S(20305010395)
    end,
    env_sound = 20001
  },
  [2030501040] = {
    id = 2030501040,
    talk_text = function()
      return T_S(20305010400)
    end,
    is_master = 1,
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030501041,
    env_sound = 20001
  },
  [2030501041] = {
    id = 2030501041,
    talk_text = function()
      return T_S(20305010410)
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
    next_dialog = 2030501042,
    env_sound = 20001
  },
  [2030501042] = {
    id = 2030501042,
    talk_text = function()
      return T_S(20305010420)
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
    next_dialog = 2030501043,
    speak_name = function()
      return T_S(20305010425)
    end,
    env_sound = 20001
  },
  [2030501043] = {
    id = 2030501043,
    talk_text = function()
      return T_S(20305010430)
    end,
    is_master = 1,
    is_os = 0,
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
    next_dialog = 2030501044,
    env_sound = 20001
  },
  [2030501044] = {
    id = 2030501044,
    talk_text = function()
      return T_S(20305010440)
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
    next_dialog = 2030501045,
    env_sound = 20001
  },
  [2030501045] = {
    id = 2030501045,
    talk_text = function()
      return T_S(20305010450)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501046,
    speak_name = function()
      return T_S(20305010455)
    end,
    env_sound = 20001
  },
  [2030501046] = {
    id = 2030501046,
    talk_text = function()
      return T_S(20305010460)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501047,
    speak_name = function()
      return T_S(20305010465)
    end,
    env_sound = 20001
  },
  [2030501047] = {
    id = 2030501047,
    talk_text = function()
      return T_S(20305010470)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501048,
    speak_name = function()
      return T_S(20305010475)
    end,
    env_sound = 20001
  },
  [2030501048] = {
    id = 2030501048,
    talk_text = function()
      return T_S(20305010480)
    end,
    next_dialog = 2030501049,
    env_sound = 20001
  },
  [2030501049] = {
    id = 2030501049,
    talk_text = function()
      return T_S(20305010490)
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
    next_dialog = 2030501050,
    speak_name = function()
      return T_S(20305010495)
    end,
    env_sound = 20001
  },
  [2030501050] = {
    id = 2030501050,
    talk_text = function()
      return T_S(20305010500)
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
    next_dialog = 2030501051,
    env_sound = 20001
  },
  [2030501051] = {
    id = 2030501051,
    talk_text = function()
      return T_S(20305010510)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501052,
    speak_name = function()
      return T_S(20305010515)
    end,
    env_sound = 20001
  },
  [2030501052] = {
    id = 2030501052,
    talk_text = function()
      return T_S(20305010520)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501053,
    speak_name = function()
      return T_S(20305010525)
    end,
    env_sound = 20001
  },
  [2030501053] = {
    id = 2030501053,
    talk_text = function()
      return T_S(20305010530)
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501054,
    speak_name = function()
      return T_S(20305010535)
    end,
    env_sound = 20001
  },
  [2030501054] = {
    id = 2030501054,
    talk_text = function()
      return T_S(20305010540)
    end,
    role_ids = {90110029, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030501054/2030501054_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-888", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501055,
    speak_name = function()
      return T_S(20305010545)
    end,
    env_sound = 20001
  },
  [2030501055] = {
    id = 2030501055,
    talk_text = function()
      return T_S(20305010550)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501056,
    speak_name = function()
      return T_S(20305010555)
    end,
    env_sound = 20001
  },
  [2030501056] = {
    id = 2030501056,
    talk_text = function()
      return T_S(20305010560)
    end,
    is_master = 1,
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030501057,
    env_sound = 20001
  },
  [2030501057] = {
    id = 2030501057,
    talk_text = function()
      return T_S(20305010570)
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
    next_dialog = 2030501058,
    speak_name = function()
      return T_S(20305010575)
    end,
    env_sound = 20001
  },
  [2030501058] = {
    id = 2030501058,
    talk_text = function()
      return T_S(20305010580)
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
    next_dialog = 2030501059,
    env_sound = 20001
  },
  [2030501059] = {
    id = 2030501059,
    talk_text = function()
      return T_S(20305010590)
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
    next_dialog = 2030501060,
    env_sound = 20001
  },
  [2030501060] = {
    id = 2030501060,
    talk_text = function()
      return T_S(20305010600)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501061,
    speak_name = function()
      return T_S(20305010605)
    end,
    env_sound = 20001
  },
  [2030501061] = {
    id = 2030501061,
    talk_text = function()
      return T_S(20305010610)
    end,
    next_dialog = 2030501062,
    env_sound = 20001
  },
  [2030501062] = {
    id = 2030501062,
    talk_text = function()
      return T_S(20305010620)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030501062/2030501062_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501063,
    speak_name = function()
      return T_S(20305010625)
    end,
    env_sound = 20001
  },
  [2030501063] = {
    id = 2030501063,
    talk_text = function()
      return T_S(20305010630)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "3"},
    effect_out_param = {"0", "180"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501064,
    speak_name = function()
      return T_S(20305010635)
    end,
    env_sound = 20001
  },
  [2030501064] = {
    id = 2030501064,
    talk_text = function()
      return T_S(20305010640)
    end,
    next_dialog = 2030501065,
    env_sound = 20001
  },
  [2030501065] = {
    id = 2030501065,
    talk_text = function()
      return T_S(20305010650)
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
    next_dialog = 2030501066,
    speak_name = function()
      return T_S(20305010655)
    end,
    env_sound = 20001
  },
  [2030501066] = {
    id = 2030501066,
    talk_text = function()
      return T_S(20305010660)
    end,
    next_dialog = 2030501067,
    env_sound = 20001
  },
  [2030501067] = {
    id = 2030501067,
    talk_text = function()
      return T_S(20305010670)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501068,
    speak_name = function()
      return T_S(20305010675)
    end,
    env_sound = 20001
  },
  [2030501068] = {
    id = 2030501068,
    talk_text = function()
      return T_S(20305010680)
    end,
    is_master = 1,
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030501069,
    env_sound = 20001
  },
  [2030501069] = {
    id = 2030501069,
    talk_text = function()
      return T_S(20305010690)
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
    next_dialog = 2030501070,
    env_sound = 20001
  },
  [2030501070] = {
    id = 2030501070,
    talk_text = function()
      return T_S(20305010700)
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
    next_dialog = 2030501071,
    env_sound = 20001
  },
  [2030501071] = {
    id = 2030501071,
    talk_text = function()
      return T_S(20305010710)
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
    next_dialog = 2030501072,
    speak_name = function()
      return T_S(20305010715)
    end,
    env_sound = 20001
  },
  [2030501072] = {
    id = 2030501072,
    talk_text = function()
      return T_S(20305010720)
    end,
    is_master = 1,
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030501073,
    env_sound = 20001
  },
  [2030501073] = {
    id = 2030501073,
    talk_text = function()
      return T_S(20305010730)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030501074,
    env_sound = 20001
  },
  [2030501074] = {
    id = 2030501074,
    talk_text = function()
      return T_S(20305010740)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501075,
    speak_name = function()
      return T_S(20305010745)
    end,
    env_sound = 20001
  },
  [2030501075] = {
    id = 2030501075,
    talk_text = function()
      return T_S(20305010750)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501076,
    speak_name = function()
      return T_S(20305010755)
    end,
    env_sound = 20001
  },
  [2030501076] = {
    id = 2030501076,
    talk_text = function()
      return T_S(20305010760)
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
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501077,
    speak_name = function()
      return T_S(20305010765)
    end,
    env_sound = 20001
  },
  [2030501077] = {
    id = 2030501077,
    talk_text = function()
      return T_S(20305010770)
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
    next_dialog = 2030501078,
    speak_name = function()
      return T_S(20305010775)
    end,
    env_sound = 20001
  },
  [2030501078] = {
    id = 2030501078,
    talk_text = function()
      return T_S(20305010780)
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
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501079,
    speak_name = function()
      return T_S(20305010785)
    end,
    env_sound = 20001
  },
  [2030501079] = {
    id = 2030501079,
    talk_text = function()
      return T_S(20305010790)
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501080,
    speak_name = function()
      return T_S(20305010795)
    end,
    env_sound = 20001
  },
  [2030501080] = {
    id = 2030501080,
    talk_text = function()
      return T_S(20305010800)
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
    next_dialog = 2030501081,
    speak_name = function()
      return T_S(20305010805)
    end,
    env_sound = 20001
  },
  [2030501081] = {
    id = 2030501081,
    talk_text = function()
      return T_S(20305010810)
    end,
    next_dialog = 2030501082,
    env_sound = 20001
  },
  [2030501082] = {
    id = 2030501082,
    talk_text = function()
      return T_S(20305010820)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 2030501083,
    env_sound = 20001
  },
  [2030501083] = {
    id = 2030501083,
    talk_text = function()
      return T_S(20305010830)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501084,
    speak_name = function()
      return T_S(20305010835)
    end,
    env_sound = 20001
  },
  [2030501084] = {
    id = 2030501084,
    talk_text = function()
      return T_S(20305010840)
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
    next_dialog = 2030501085,
    env_sound = 20001
  },
  [2030501085] = {
    id = 2030501085,
    talk_text = function()
      return T_S(20305010850)
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
    next_dialog = 2030501086,
    speak_name = function()
      return T_S(20305010855)
    end,
    env_sound = 20001
  },
  [2030501086] = {
    id = 2030501086,
    talk_text = function()
      return T_S(20305010860)
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
    next_dialog = 2030501087,
    speak_name = function()
      return T_S(20305010865)
    end,
    env_sound = 20001
  },
  [2030501087] = {
    id = 2030501087,
    talk_text = function()
      return T_S(20305010870)
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
    next_dialog = 2030501088,
    env_sound = 20001
  },
  [2030501088] = {
    id = 2030501088,
    talk_text = function()
      return T_S(20305010880)
    end,
    is_os = 1,
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030501089,
    speak_name = function()
      return T_S(20305010885)
    end,
    env_sound = 20001
  },
  [2030501089] = {
    id = 2030501089,
    talk_text = function()
      return T_S(20305010890)
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
    next_dialog = 2030501090,
    env_sound = 20001
  },
  [2030501090] = {
    id = 2030501090,
    talk_text = function()
      return T_S(20305010900)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501091,
    speak_name = function()
      return T_S(20305010905)
    end,
    env_sound = 20001
  },
  [2030501091] = {
    id = 2030501091,
    talk_text = function()
      return T_S(20305010910)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_4.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501092,
    speak_name = function()
      return T_S(20305010915)
    end,
    env_sound = 20001
  },
  [2030501092] = {
    id = 2030501092,
    talk_text = function()
      return T_S(20305010920)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_5.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501093,
    speak_name = function()
      return T_S(20305010925)
    end,
    env_sound = 20001
  },
  [2030501093] = {
    id = 2030501093,
    talk_text = function()
      return T_S(20305010930)
    end,
    is_master = 1,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030501094,
    env_sound = 20001
  },
  [2030501094] = {
    id = 2030501094,
    talk_text = function()
      return T_S(20305010940)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501095,
    speak_name = function()
      return T_S(20305010945)
    end,
    env_sound = 20001
  },
  [2030501095] = {
    id = 2030501095,
    talk_text = function()
      return T_S(20305010950)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030501096,
    env_sound = 20001
  },
  [2030501096] = {
    id = 2030501096,
    talk_text = function()
      return T_S(20305010960)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030501097,
    speak_name = function()
      return T_S(20305010965)
    end,
    env_sound = 20001
  },
  [2030501097] = {
    id = 2030501097,
    talk_text = function()
      return T_S(20305010970)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030501098,
    speak_name = function()
      return T_S(20305010975)
    end,
    env_sound = 20001
  },
  [2030501098] = {
    id = 2030501098,
    talk_text = function()
      return T_S(20305010980)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030501099,
    env_sound = 20001
  },
  [2030501099] = {
    id = 2030501099,
    talk_text = function()
      return T_S(20305010990)
    end,
    role_ids = {90110028, 90110029},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable"
    },
    role_position = {"-282:-1122", "270:-888"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(20305010995)
    end,
    env_sound = 20001
  }
}
