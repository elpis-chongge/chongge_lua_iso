BasePlotDialogPart515050 = {
  [2030201001] = {
    id = 2030201001,
    talk_text = function()
      return T_S(20302010010)
    end,
    next_dialog = 2030201002,
    env_sound = 20001,
    open_title_1 = function()
      return T_S(20302010018)
    end,
    open_title_2 = function()
      return T_S(20302010019)
    end
  },
  [2030201002] = {
    id = 2030201002,
    talk_text = function()
      return T_S(20302010020)
    end,
    next_dialog = 2030201003,
    env_sound = 20001
  },
  [2030201003] = {
    id = 2030201003,
    talk_text = function()
      return T_S(20302010030)
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
    next_dialog = 2030201004,
    speak_name = function()
      return T_S(20302010035)
    end,
    env_sound = 20001
  },
  [2030201004] = {
    id = 2030201004,
    talk_text = function()
      return T_S(20302010040)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030201005,
    speak_name = function()
      return T_S(20302010045)
    end,
    env_sound = 20001
  },
  [2030201005] = {
    id = 2030201005,
    talk_text = function()
      return T_S(20302010050)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030201006,
    env_sound = 20001
  },
  [2030201006] = {
    id = 2030201006,
    talk_text = function()
      return T_S(20302010060)
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
    next_dialog = 2030201007,
    speak_name = function()
      return T_S(20302010065)
    end,
    env_sound = 20001
  },
  [2030201007] = {
    id = 2030201007,
    talk_text = function()
      return T_S(20302010070)
    end,
    role_ids = {90110029},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110029/90110029_1.playable"
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
    next_dialog = 2030201008,
    speak_name = function()
      return T_S(20302010075)
    end,
    env_sound = 20001
  },
  [2030201008] = {
    id = 2030201008,
    talk_text = function()
      return T_S(20302010080)
    end,
    next_dialog = 2030201009,
    env_sound = 20001
  },
  [2030201009] = {
    id = 2030201009,
    talk_text = function()
      return T_S(20302010090)
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
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030201010,
    speak_name = function()
      return T_S(20302010095)
    end,
    env_sound = 20001
  },
  [2030201010] = {
    id = 2030201010,
    talk_text = function()
      return T_S(20302010100)
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
    next_dialog = 2030201011,
    speak_name = function()
      return T_S(20302010105)
    end,
    env_sound = 20001
  },
  [2030201011] = {
    id = 2030201011,
    talk_text = function()
      return T_S(20302010110)
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
    next_dialog = 2030201012,
    speak_name = function()
      return T_S(20302010115)
    end,
    env_sound = 20001
  },
  [2030201012] = {
    id = 2030201012,
    talk_text = function()
      return T_S(20302010120)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030201013,
    env_sound = 20001
  },
  [2030201013] = {
    id = 2030201013,
    talk_text = function()
      return T_S(20302010130)
    end,
    next_dialog = 2030201014,
    env_sound = 20001
  },
  [2030201014] = {
    id = 2030201014,
    talk_text = function()
      return T_S(20302010140)
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
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030201015,
    speak_name = function()
      return T_S(20302010145)
    end,
    env_sound = 20001
  },
  [2030201015] = {
    id = 2030201015,
    talk_text = function()
      return T_S(20302010150)
    end,
    is_os = 1,
    next_dialog = 2030201016,
    speak_name = function()
      return T_S(20302010155)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2030201016] = {
    id = 2030201016,
    talk_text = function()
      return T_S(20302010160)
    end,
    is_master = 1,
    is_os = 0,
    next_dialog = 2030201017,
    env_sound = 20001
  },
  [2030201017] = {
    id = 2030201017,
    talk_text = function()
      return T_S(20302010170)
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
    effect_in_param = {"150"},
    effect_out = {"2"},
    effect_out_param = {"180"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030201018,
    speak_name = function()
      return T_S(20302010175)
    end,
    env_sound = 20001
  },
  [2030201018] = {
    id = 2030201018,
    talk_text = function()
      return T_S(20302010180)
    end,
    next_dialog = 2030201019,
    env_sound = 20001
  },
  [2030201019] = {
    id = 2030201019,
    talk_text = function()
      return T_S(20302010190)
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
    next_dialog = 2030201020,
    speak_name = function()
      return T_S(20302010195)
    end,
    env_sound = 20001
  },
  [2030201020] = {
    id = 2030201020,
    talk_text = function()
      return T_S(20302010200)
    end,
    is_os = 1,
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
    next_dialog = 2030201021,
    speak_name = function()
      return T_S(20302010205)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2030201021] = {
    id = 2030201021,
    talk_text = function()
      return T_S(20302010210)
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
    next_dialog = 2030201022,
    speak_name = function()
      return T_S(20302010215)
    end,
    env_sound = 20001
  },
  [2030201022] = {
    id = 2030201022,
    talk_text = function()
      return T_S(20302010220)
    end,
    next_dialog = 2030201023,
    env_sound = 20001
  },
  [2030201023] = {
    id = 2030201023,
    talk_text = function()
      return T_S(20302010230)
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
    next_dialog = 2030201024,
    speak_name = function()
      return T_S(20302010235)
    end,
    env_sound = 20001
  },
  [2030201024] = {
    id = 2030201024,
    talk_text = function()
      return T_S(20302010240)
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
    next_dialog = 2030201025,
    speak_name = function()
      return T_S(20302010245)
    end,
    env_sound = 20001
  },
  [2030201025] = {
    id = 2030201025,
    talk_text = function()
      return T_S(20302010250)
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
    next_dialog = 2030201026,
    env_sound = 20001
  },
  [2030201026] = {
    id = 2030201026,
    talk_text = function()
      return T_S(20302010260)
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
    next_dialog = 2030201027,
    speak_name = function()
      return T_S(20302010265)
    end,
    env_sound = 20001
  },
  [2030201027] = {
    id = 2030201027,
    talk_text = function()
      return T_S(20302010270)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030201028,
    speak_name = function()
      return T_S(20302010275)
    end,
    env_sound = 20001
  },
  [2030201028] = {
    id = 2030201028,
    talk_text = function()
      return T_S(20302010280)
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
    next_dialog = 2030201029,
    speak_name = function()
      return T_S(20302010285)
    end,
    env_sound = 20001
  },
  [2030201029] = {
    id = 2030201029,
    talk_text = function()
      return T_S(20302010290)
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
    next_dialog = 2030201030,
    speak_name = function()
      return T_S(20302010295)
    end,
    env_sound = 20001
  },
  [2030201030] = {
    id = 2030201030,
    talk_text = function()
      return T_S(20302010300)
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
    next_dialog = 2030201031,
    speak_name = function()
      return T_S(20302010305)
    end,
    env_sound = 20001
  },
  [2030201031] = {
    id = 2030201031,
    talk_text = function()
      return T_S(20302010310)
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
    next_dialog = 2030201032,
    speak_name = function()
      return T_S(20302010315)
    end,
    env_sound = 20001
  },
  [2030201032] = {
    id = 2030201032,
    talk_text = function()
      return T_S(20302010320)
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
    speak_role = {0},
    light_role = {1},
    next_dialog = 2030201033,
    speak_name = function()
      return T_S(20302010325)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2030201033] = {
    id = 2030201033,
    talk_text = function()
      return T_S(20302010330)
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
    next_dialog = 2030201034,
    env_sound = 20001
  },
  [2030201034] = {
    id = 2030201034,
    talk_text = function()
      return T_S(20302010340)
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
    next_dialog = 2030201035,
    speak_name = function()
      return T_S(20302010345)
    end,
    env_sound = 20001
  },
  [2030201035] = {
    id = 2030201035,
    talk_text = function()
      return T_S(20302010350)
    end,
    role_ids = {90110028, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-282:-1122", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030201036,
    speak_name = function()
      return T_S(20302010355)
    end,
    env_sound = 20001
  },
  [2030201036] = {
    id = 2030201036,
    talk_text = function()
      return T_S(20302010360)
    end,
    role_ids = {90110028, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_2.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-282:-1122", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030201037,
    speak_name = function()
      return T_S(20302010365)
    end,
    env_sound = 20001
  },
  [2030201037] = {
    id = 2030201037,
    talk_text = function()
      return T_S(20302010370)
    end,
    is_master = 0,
    is_os = 1,
    role_ids = {90110028, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-282:-1122", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 2030201038,
    speak_name = function()
      return T_S(20302010375)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2030201038] = {
    id = 2030201038,
    talk_text = function()
      return T_S(20302010380)
    end,
    is_master = 1,
    role_ids = {90110028, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-282:-1122", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    env_sound = 20001
  },
  [2030202001] = {
    id = 2030202001,
    talk_text = function()
      return T_S(20302020010)
    end,
    next_dialog = 2030202002,
    speak_head = 90120025,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20302020015)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2030202002] = {
    id = 2030202002,
    talk_text = function()
      return T_S(20302020020)
    end,
    next_dialog = 2030202003,
    speak_head = 90120024,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20302020025)
    end,
    env_sound = 20001,
    review_head = "90210002"
  },
  [2030202003] = {
    id = 2030202003,
    talk_text = function()
      return T_S(20302020030)
    end,
    next_dialog = 2030202004,
    speak_head = 90120021,
    speak_name = function()
      return T_S(20302020035)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2030202004] = {
    id = 2030202004,
    talk_text = function()
      return T_S(20302020040)
    end,
    next_dialog = 2030202005,
    env_sound = 20001
  },
  [2030202005] = {
    id = 2030202005,
    talk_text = function()
      return T_S(20302020050)
    end,
    next_dialog = 2030202006,
    env_sound = 20001
  },
  [2030202006] = {
    id = 2030202006,
    talk_text = function()
      return T_S(20302020060)
    end,
    next_dialog = 2030202007,
    env_sound = 20001
  },
  [2030202007] = {
    id = 2030202007,
    talk_text = function()
      return T_S(20302020070)
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
    next_dialog = 2030202008,
    speak_name = function()
      return T_S(20302020075)
    end,
    env_sound = 20001
  },
  [2030202008] = {
    id = 2030202008,
    talk_text = function()
      return T_S(20302020080)
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
    next_dialog = 2030202009,
    env_sound = 20001
  },
  [2030202009] = {
    id = 2030202009,
    talk_text = function()
      return T_S(20302020090)
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
    next_dialog = 2030202010,
    speak_name = function()
      return T_S(20302020095)
    end,
    env_sound = 20001
  },
  [2030202010] = {
    id = 2030202010,
    talk_text = function()
      return T_S(20302020100)
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
    next_dialog = 2030202011,
    speak_name = function()
      return T_S(20302020105)
    end,
    env_sound = 20001
  },
  [2030202011] = {
    id = 2030202011,
    talk_text = function()
      return T_S(20302020110)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030202012,
    speak_name = function()
      return T_S(20302020115)
    end,
    env_sound = 20001
  },
  [2030202012] = {
    id = 2030202012,
    talk_text = function()
      return T_S(20302020120)
    end,
    next_dialog = 2030202013,
    env_sound = 20001
  },
  [2030202013] = {
    id = 2030202013,
    talk_text = function()
      return T_S(20302020130)
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
    next_dialog = 2030202014,
    speak_name = function()
      return T_S(20302020135)
    end,
    env_sound = 20001
  },
  [2030202014] = {
    id = 2030202014,
    talk_text = function()
      return T_S(20302020140)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030202014/2030202014_90110003.playable"
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
    next_dialog = 2030202015,
    env_sound = 20001
  },
  [2030202015] = {
    id = 2030202015,
    talk_text = function()
      return T_S(20302020150)
    end,
    next_dialog = 2030202016,
    speak_name = function()
      return T_S(20302020155)
    end,
    env_sound = 20001
  },
  [2030202016] = {
    id = 2030202016,
    talk_text = function()
      return T_S(20302020160)
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
    next_dialog = 2030202017,
    speak_name = function()
      return T_S(20302020165)
    end,
    env_sound = 20001
  },
  [2030202017] = {
    id = 2030202017,
    talk_text = function()
      return T_S(20302020170)
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
    next_dialog = 2030202018,
    speak_name = function()
      return T_S(20302020175)
    end,
    env_sound = 20001
  },
  [2030202018] = {
    id = 2030202018,
    talk_text = function()
      return T_S(20302020180)
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
    next_dialog = 2030202019,
    env_sound = 20001
  },
  [2030202019] = {
    id = 2030202019,
    talk_text = function()
      return T_S(20302020190)
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
    role_shake = {"1:0:1200"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030202020,
    speak_name = function()
      return T_S(20302020195)
    end,
    env_sound = 20001
  },
  [2030202020] = {
    id = 2030202020,
    talk_text = function()
      return T_S(20302020200)
    end,
    is_master = 1,
    next_dialog = 2030202021,
    env_sound = 20001
  },
  [2030202021] = {
    id = 2030202021,
    talk_text = function()
      return T_S(20302020210)
    end,
    next_dialog = 2030202022,
    env_sound = 20001
  },
  [2030202022] = {
    id = 2030202022,
    talk_text = function()
      return T_S(20302020220)
    end,
    next_dialog = 2030202023,
    env_sound = 20001
  },
  [2030202023] = {
    id = 2030202023,
    talk_text = function()
      return T_S(20302020230)
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
    next_dialog = 2030202024,
    speak_name = function()
      return T_S(20302020235)
    end,
    env_sound = 20001
  },
  [2030202024] = {
    id = 2030202024,
    talk_text = function()
      return T_S(20302020240)
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
    light_role = {0},
    next_dialog = 2030202025,
    env_sound = 20001
  },
  [2030202025] = {
    id = 2030202025,
    talk_text = function()
      return T_S(20302020250)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 2030202026,
    env_sound = 20001
  },
  [2030202026] = {
    id = 2030202026,
    talk_text = function()
      return T_S(20302020260)
    end,
    next_dialog = 2030202027,
    speak_head = 90120025,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20302020265)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2030202027] = {
    id = 2030202027,
    talk_text = function()
      return T_S(20302020270)
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
    next_dialog = 2030202028,
    speak_name = function()
      return T_S(20302020275)
    end,
    env_sound = 20001
  },
  [2030202028] = {
    id = 2030202028,
    talk_text = function()
      return T_S(20302020280)
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
    next_dialog = 2030202029,
    speak_name = function()
      return T_S(20302020285)
    end,
    env_sound = 20001
  },
  [2030202029] = {
    id = 2030202029,
    talk_text = function()
      return T_S(20302020290)
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
    next_dialog = 2030202030,
    env_sound = 20001
  },
  [2030202030] = {
    id = 2030202030,
    talk_text = function()
      return T_S(20302020300)
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
    next_dialog = 2030202031,
    speak_head = 90120025,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20302020305)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2030202031] = {
    id = 2030202031,
    talk_text = function()
      return T_S(20302020310)
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
    next_dialog = 2030202032,
    speak_name = function()
      return T_S(20302020315)
    end,
    env_sound = 20001
  },
  [2030202032] = {
    id = 2030202032,
    talk_text = function()
      return T_S(20302020320)
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
    next_dialog = 2030202033,
    env_sound = 20001
  },
  [2030202033] = {
    id = 2030202033,
    talk_text = function()
      return T_S(20302020330)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030202033/2030202033_90110028.playable"
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
    next_dialog = 2030202034,
    speak_name = function()
      return T_S(20302020335)
    end,
    env_sound = 20001
  },
  [2030202034] = {
    id = 2030202034,
    talk_text = function()
      return T_S(20302020340)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2030202035,
    env_sound = 20001
  },
  [2030202035] = {
    id = 2030202035,
    talk_text = function()
      return T_S(20302020350)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 1},
    light_role = {1, 1},
    next_dialog = 2030202036,
    speak_name = function()
      return T_S(20302020355)
    end,
    env_sound = 20001
  },
  [2030202036] = {
    id = 2030202036,
    talk_text = function()
      return T_S(20302020360)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20302020365)
    end,
    env_sound = 20001
  }
}
