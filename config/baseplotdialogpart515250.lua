BasePlotDialogPart515250 = {
  [2030601001] = {
    id = 2030601001,
    talk_text = function()
      return T_S(20306010010)
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
    next_dialog = 2030601002,
    speak_name = function()
      return T_S(20306010015)
    end,
    env_sound = 20006,
    open_title_1 = function()
      return T_S(20306010018)
    end,
    open_title_2 = function()
      return T_S(20306010019)
    end
  },
  [2030601002] = {
    id = 2030601002,
    talk_text = function()
      return T_S(20306010020)
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
    next_dialog = 2030601003,
    speak_name = function()
      return T_S(20306010025)
    end,
    env_sound = 20006
  },
  [2030601003] = {
    id = 2030601003,
    talk_text = function()
      return T_S(20306010030)
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
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030601004,
    speak_name = function()
      return T_S(20306010035)
    end,
    env_sound = 20006
  },
  [2030601004] = {
    id = 2030601004,
    talk_text = function()
      return T_S(20306010040)
    end,
    next_dialog = 2030601005,
    env_sound = 20006
  },
  [2030601005] = {
    id = 2030601005,
    talk_text = function()
      return T_S(20306010050)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_1.playable"
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
    next_dialog = 2030601006,
    speak_name = function()
      return T_S(20306010055)
    end,
    env_sound = 20006
  },
  [2030601006] = {
    id = 2030601006,
    talk_text = function()
      return T_S(20306010060)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030601007,
    env_sound = 20006
  },
  [2030601007] = {
    id = 2030601007,
    talk_text = function()
      return T_S(20306010070)
    end,
    next_dialog = 2030601008,
    env_sound = 20006
  },
  [2030601008] = {
    id = 2030601008,
    talk_text = function()
      return T_S(20306010080)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030601008/2030601008_90110001.playable"
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
    next_dialog = 2030601009,
    speak_name = function()
      return T_S(20306010085)
    end,
    env_sound = 20006
  },
  [2030601009] = {
    id = 2030601009,
    talk_text = function()
      return T_S(20306010090)
    end,
    next_dialog = 2030601010,
    env_sound = 20006
  },
  [2030601010] = {
    id = 2030601010,
    talk_text = function()
      return T_S(20306010100)
    end,
    is_master = 1,
    next_dialog = 2030601011,
    env_sound = 20006
  },
  [2030601011] = {
    id = 2030601011,
    talk_text = function()
      return T_S(20306010110)
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
    next_dialog = 2030601012,
    speak_name = function()
      return T_S(20306010115)
    end,
    env_sound = 20006
  },
  [2030601012] = {
    id = 2030601012,
    talk_text = function()
      return T_S(20306010120)
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
    next_dialog = 2030601013,
    speak_name = function()
      return T_S(20306010125)
    end,
    env_sound = 20006
  },
  [2030601013] = {
    id = 2030601013,
    talk_text = function()
      return T_S(20306010130)
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
    next_dialog = 2030601014,
    speak_name = function()
      return T_S(20306010135)
    end,
    env_sound = 20006
  },
  [2030601014] = {
    id = 2030601014,
    talk_text = function()
      return T_S(20306010140)
    end,
    next_dialog = 2030601015,
    env_sound = 20006
  },
  [2030601015] = {
    id = 2030601015,
    talk_text = function()
      return T_S(20306010150)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030601016,
    speak_name = function()
      return T_S(20306010155)
    end,
    env_sound = 20006
  },
  [2030601016] = {
    id = 2030601016,
    talk_text = function()
      return T_S(20306010160)
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
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030601017,
    speak_name = function()
      return T_S(20306010165)
    end,
    env_sound = 20006
  },
  [2030601017] = {
    id = 2030601017,
    talk_text = function()
      return T_S(20306010170)
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
    effect_out = {"2", "0"},
    effect_out_param = {"180", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030601018,
    env_sound = 20006
  },
  [2030601018] = {
    id = 2030601018,
    talk_text = function()
      return T_S(20306010180)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030601019,
    speak_name = function()
      return T_S(20306010185)
    end,
    env_sound = 20006
  },
  [2030601019] = {
    id = 2030601019,
    talk_text = function()
      return T_S(20306010190)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030601020,
    speak_name = function()
      return T_S(20306010195)
    end,
    env_sound = 20006
  },
  [2030601020] = {
    id = 2030601020,
    talk_text = function()
      return T_S(20306010200)
    end,
    role_ids = {90110029, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-888", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030601021,
    speak_name = function()
      return T_S(20306010205)
    end,
    env_sound = 20006
  },
  [2030601021] = {
    id = 2030601021,
    talk_text = function()
      return T_S(20306010210)
    end,
    role_ids = {90110029, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-888", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030601022,
    speak_name = function()
      return T_S(20306010215)
    end,
    env_sound = 20006
  },
  [2030601022] = {
    id = 2030601022,
    talk_text = function()
      return T_S(20306010220)
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
    next_dialog = 2030601023,
    speak_name = function()
      return T_S(20306010225)
    end,
    env_sound = 20006
  },
  [2030601023] = {
    id = 2030601023,
    talk_text = function()
      return T_S(20306010230)
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
    effect_in = {"3", "0"},
    effect_in_param = {"150", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030601024,
    speak_name = function()
      return T_S(20306010235)
    end,
    env_sound = 20006
  },
  [2030601024] = {
    id = 2030601024,
    talk_text = function()
      return T_S(20306010240)
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
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030601025,
    speak_name = function()
      return T_S(20306010245)
    end,
    env_sound = 20006
  },
  [2030601025] = {
    id = 2030601025,
    talk_text = function()
      return T_S(20306010250)
    end,
    next_dialog = 2030601026,
    env_sound = 20006
  },
  [2030601026] = {
    id = 2030601026,
    talk_text = function()
      return T_S(20306010260)
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
    next_dialog = 2030601027,
    speak_name = function()
      return T_S(20306010265)
    end,
    env_sound = 20006
  },
  [2030601027] = {
    id = 2030601027,
    talk_text = function()
      return T_S(20306010270)
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
    next_dialog = 2030601028,
    env_sound = 20006
  },
  [2030601028] = {
    id = 2030601028,
    talk_text = function()
      return T_S(20306010280)
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
    next_dialog = 2030601029,
    speak_name = function()
      return T_S(20306010285)
    end,
    env_sound = 20006
  },
  [2030601029] = {
    id = 2030601029,
    talk_text = function()
      return T_S(20306010290)
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
    next_dialog = 2030601030,
    speak_name = function()
      return T_S(20306010295)
    end,
    env_sound = 20006
  },
  [2030601030] = {
    id = 2030601030,
    talk_text = function()
      return T_S(20306010300)
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
    next_dialog = 2030601031,
    env_sound = 20006
  },
  [2030601031] = {
    id = 2030601031,
    talk_text = function()
      return T_S(20306010310)
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
    next_dialog = 2030601032,
    speak_name = function()
      return T_S(20306010315)
    end,
    env_sound = 20006
  },
  [2030601032] = {
    id = 2030601032,
    talk_text = function()
      return T_S(20306010320)
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
    next_dialog = 2030601033,
    env_sound = 20006
  },
  [2030601033] = {
    id = 2030601033,
    talk_text = function()
      return T_S(20306010330)
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
    next_dialog = 2030601034,
    env_sound = 20006
  },
  [2030601034] = {
    id = 2030601034,
    talk_text = function()
      return T_S(20306010340)
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
    next_dialog = 2030601035,
    speak_name = function()
      return T_S(20306010345)
    end,
    env_sound = 20006
  },
  [2030601035] = {
    id = 2030601035,
    talk_text = function()
      return T_S(20306010350)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"-282:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030601036,
    env_sound = 20006
  },
  [2030601036] = {
    id = 2030601036,
    talk_text = function()
      return T_S(20306010360)
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
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030601037,
    speak_name = function()
      return T_S(20306010365)
    end,
    env_sound = 20006
  },
  [2030601037] = {
    id = 2030601037,
    talk_text = function()
      return T_S(20306010370)
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
    next_dialog = 2030601038,
    speak_name = function()
      return T_S(20306010375)
    end,
    env_sound = 20006
  },
  [2030601038] = {
    id = 2030601038,
    talk_text = function()
      return T_S(20306010380)
    end,
    is_master = 1,
    is_os = 1,
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
    next_dialog = 2030601039,
    env_sound = 20006
  },
  [2030601039] = {
    id = 2030601039,
    talk_text = function()
      return T_S(20306010390)
    end,
    is_os = 1,
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
    next_dialog = 2030601040,
    speak_name = function()
      return T_S(20306010395)
    end,
    env_sound = 20006
  },
  [2030601040] = {
    id = 2030601040,
    talk_text = function()
      return T_S(20306010400)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030601041,
    speak_name = function()
      return T_S(20306010405)
    end,
    env_sound = 20006
  },
  [2030601041] = {
    id = 2030601041,
    talk_text = function()
      return T_S(20306010410)
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
    next_dialog = 2030601042,
    speak_name = function()
      return T_S(20306010415)
    end,
    env_sound = 20006
  },
  [2030601042] = {
    id = 2030601042,
    talk_text = function()
      return T_S(20306010420)
    end,
    is_master = 1,
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2030601043,
    env_sound = 20006
  },
  [2030601043] = {
    id = 2030601043,
    talk_text = function()
      return T_S(20306010430)
    end,
    is_master = 1,
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2030601044,
    env_sound = 20006
  },
  [2030601044] = {
    id = 2030601044,
    talk_text = function()
      return T_S(20306010440)
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
    next_dialog = 2030601045,
    speak_name = function()
      return T_S(20306010445)
    end,
    env_sound = 20006
  },
  [2030601045] = {
    id = 2030601045,
    talk_text = function()
      return T_S(20306010450)
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
    next_dialog = 2030601046,
    speak_name = function()
      return T_S(20306010455)
    end,
    env_sound = 20006
  },
  [2030601046] = {
    id = 2030601046,
    talk_text = function()
      return T_S(20306010460)
    end,
    is_master = 1,
    next_dialog = 2030601047,
    env_sound = 20006
  },
  [2030601047] = {
    id = 2030601047,
    talk_text = function()
      return T_S(20306010470)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030601047/2030601047_90110004.playable"
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
    next_dialog = 2030601048,
    speak_name = function()
      return T_S(20306010475)
    end,
    env_sound = 20006
  },
  [2030601048] = {
    id = 2030601048,
    talk_text = function()
      return T_S(20306010480)
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
    next_dialog = 2030601049,
    speak_name = function()
      return T_S(20306010485)
    end,
    env_sound = 20006
  },
  [2030601049] = {
    id = 2030601049,
    talk_text = function()
      return T_S(20306010490)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    env_sound = 20006
  },
  [2030602001] = {
    id = 2030602001,
    talk_text = function()
      return T_S(20306020010)
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
    next_dialog = 2030602002,
    speak_name = function()
      return T_S(20306020015)
    end,
    env_sound = 20003
  },
  [2030602002] = {
    id = 2030602002,
    talk_text = function()
      return T_S(20306020020)
    end,
    role_ids = {90110029, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110029/90110029_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-888", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030602003,
    speak_name = function()
      return T_S(20306020025)
    end,
    env_sound = 20003
  },
  [2030602003] = {
    id = 2030602003,
    talk_text = function()
      return T_S(20306020030)
    end,
    is_master = 0,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030602003/2030602003_90110002.playable"
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
    next_dialog = 2030602004,
    speak_name = function()
      return T_S(20306020035)
    end,
    env_sound = 20003
  },
  [2030602004] = {
    id = 2030602004,
    talk_text = function()
      return T_S(20306020040)
    end,
    role_ids = {90110002, 90110028},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable"
    },
    role_position = {"270:-1066", "-282:-1122"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030602005,
    speak_name = function()
      return T_S(20306020045)
    end,
    env_sound = 20003
  },
  [2030602005] = {
    id = 2030602005,
    talk_text = function()
      return T_S(20306020050)
    end,
    next_dialog = 2030602006,
    env_sound = 20003
  },
  [2030602006] = {
    id = 2030602006,
    talk_text = function()
      return T_S(20306020060)
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
    next_dialog = 2030602007,
    speak_name = function()
      return T_S(20306020065)
    end,
    env_sound = 20003
  },
  [2030602007] = {
    id = 2030602007,
    talk_text = function()
      return T_S(20306020070)
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
    next_dialog = 2030602008,
    speak_name = function()
      return T_S(20306020075)
    end,
    env_sound = 20003
  },
  [2030602008] = {
    id = 2030602008,
    talk_text = function()
      return T_S(20306020080)
    end,
    is_master = 1,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030602009,
    env_sound = 20003
  },
  [2030602009] = {
    id = 2030602009,
    talk_text = function()
      return T_S(20306020090)
    end,
    is_master = 0,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030602010,
    camera_shake = {
      "1",
      "0",
      "1200"
    },
    env_sound = 20003
  },
  [2030602010] = {
    id = 2030602010,
    talk_text = function()
      return T_S(20306020100)
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
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030602011,
    speak_name = function()
      return T_S(20306020105)
    end,
    env_sound = 20003
  },
  [2030602011] = {
    id = 2030602011,
    talk_text = function()
      return T_S(20306020110)
    end,
    next_dialog = 2030602012,
    env_sound = 20003
  },
  [2030602012] = {
    id = 2030602012,
    talk_text = function()
      return T_S(20306020120)
    end,
    next_dialog = 2030602013,
    env_sound = 20003
  },
  [2030602013] = {
    id = 2030602013,
    talk_text = function()
      return T_S(20306020130)
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
    next_dialog = 2030602014,
    speak_name = function()
      return T_S(20306020135)
    end,
    env_sound = 20003
  },
  [2030602014] = {
    id = 2030602014,
    talk_text = function()
      return T_S(20306020140)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2030602015,
    env_sound = 20003
  },
  [2030602015] = {
    id = 2030602015,
    talk_text = function()
      return T_S(20306020150)
    end,
    next_dialog = 2030602016,
    env_sound = 20003
  },
  [2030602016] = {
    id = 2030602016,
    talk_text = function()
      return T_S(20306020160)
    end,
    is_os = 1,
    next_dialog = 2030602017,
    speak_name = function()
      return T_S(20306020165)
    end,
    env_sound = 20003,
    review_head = "90210001"
  },
  [2030602017] = {
    id = 2030602017,
    talk_text = function()
      return T_S(20306020170)
    end,
    is_master = 1,
    next_dialog = 2030602018,
    env_sound = 20003
  },
  [2030602018] = {
    id = 2030602018,
    talk_text = function()
      return T_S(20306020180)
    end,
    next_dialog = 2030602019,
    env_sound = 20003
  },
  [2030602019] = {
    id = 2030602019,
    talk_text = function()
      return T_S(20306020190)
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
    next_dialog = 2030602020,
    speak_name = function()
      return T_S(20306020195)
    end,
    env_sound = 20003
  },
  [2030602020] = {
    id = 2030602020,
    talk_text = function()
      return T_S(20306020200)
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
    next_dialog = 2030602021,
    speak_name = function()
      return T_S(20306020205)
    end,
    env_sound = 20003
  },
  [2030602021] = {
    id = 2030602021,
    talk_text = function()
      return T_S(20306020210)
    end,
    is_master = 1,
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
    effect_out = {"3", "0"},
    effect_out_param = {"180", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030602022,
    env_sound = 20003
  },
  [2030602022] = {
    id = 2030602022,
    talk_text = function()
      return T_S(20306020220)
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
    role_position = {"-270:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030602023,
    env_sound = 20003
  },
  [2030602023] = {
    id = 2030602023,
    talk_text = function()
      return T_S(20306020230)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030602024,
    speak_name = function()
      return T_S(20306020235)
    end,
    env_sound = 20003
  },
  [2030602024] = {
    id = 2030602024,
    talk_text = function()
      return T_S(20306020240)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030602025,
    env_sound = 20003
  },
  [2030602025] = {
    id = 2030602025,
    talk_text = function()
      return T_S(20306020250)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030602025/2030602025_90110001.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030602026,
    speak_name = function()
      return T_S(20306020255)
    end,
    env_sound = 20003
  },
  [2030602026] = {
    id = 2030602026,
    talk_text = function()
      return T_S(20306020260)
    end,
    next_dialog = 2030602027,
    env_sound = 20003
  },
  [2030602027] = {
    id = 2030602027,
    talk_text = function()
      return T_S(20306020270)
    end,
    is_os = 1,
    next_dialog = 2030602028,
    speak_name = function()
      return T_S(20306020275)
    end,
    env_sound = 20003,
    review_head = "90210001"
  },
  [2030602028] = {
    id = 2030602028,
    talk_text = function()
      return T_S(20306020280)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 2030602029,
    env_sound = 20003
  },
  [2030602029] = {
    id = 2030602029,
    talk_text = function()
      return T_S(20306020290)
    end,
    next_dialog = 2030602030,
    env_sound = 20003
  },
  [2030602030] = {
    id = 2030602030,
    talk_text = function()
      return T_S(20306020300)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030602030/2030602030_90110001.playable"
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
    next_dialog = 2030602031,
    speak_name = function()
      return T_S(20306020305)
    end,
    env_sound = 20003
  },
  [2030602031] = {
    id = 2030602031,
    talk_text = function()
      return T_S(20306020310)
    end,
    is_os = 1,
    next_dialog = 2030602032,
    speak_name = function()
      return T_S(20306020315)
    end,
    env_sound = 20003,
    review_head = "90210001"
  },
  [2030602032] = {
    id = 2030602032,
    talk_text = function()
      return T_S(20306020320)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 2030602033,
    env_sound = 20003
  },
  [2030602033] = {
    id = 2030602033,
    talk_text = function()
      return T_S(20306020330)
    end,
    is_os = 1,
    next_dialog = 2030602034,
    speak_name = function()
      return T_S(20306020335)
    end,
    env_sound = 20003,
    review_head = "90210001"
  },
  [2030602034] = {
    id = 2030602034,
    talk_text = function()
      return T_S(20306020340)
    end,
    next_dialog = 2030602035,
    env_sound = 20003
  },
  [2030602035] = {
    id = 2030602035,
    talk_text = function()
      return T_S(20306020350)
    end,
    is_master = 1,
    next_dialog = 2030602036,
    env_sound = 20003
  },
  [2030602036] = {
    id = 2030602036,
    talk_text = function()
      return T_S(20306020360)
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
    next_dialog = 2030602037,
    speak_name = function()
      return T_S(20306020365)
    end,
    env_sound = 20003
  },
  [2030602037] = {
    id = 2030602037,
    talk_text = function()
      return T_S(20306020370)
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
    role_shake = {"1:0:1100"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030602038,
    env_sound = 20003
  },
  [2030602038] = {
    id = 2030602038,
    talk_text = function()
      return T_S(20306020380)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030602039,
    speak_name = function()
      return T_S(20306020385)
    end,
    env_sound = 20003
  },
  [2030602039] = {
    id = 2030602039,
    talk_text = function()
      return T_S(20306020390)
    end,
    is_os = 1,
    next_dialog = 2030602040,
    speak_name = function()
      return T_S(20306020395)
    end,
    env_sound = 20003,
    review_head = "90210001"
  },
  [2030602040] = {
    id = 2030602040,
    talk_text = function()
      return T_S(20306020400)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 2030602041,
    env_sound = 20003
  },
  [2030602041] = {
    id = 2030602041,
    talk_text = function()
      return T_S(20306020410)
    end,
    next_dialog = 2030602042,
    env_sound = 20003
  },
  [2030602042] = {
    id = 2030602042,
    talk_text = function()
      return T_S(20306020420)
    end,
    is_master = 1,
    next_dialog = 2030602043,
    env_sound = 20003
  },
  [2030602043] = {
    id = 2030602043,
    talk_text = function()
      return T_S(20306020430)
    end,
    env_sound = 20003
  }
}
