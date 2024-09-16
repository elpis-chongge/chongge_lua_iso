BasePlotDialogPart510301 = {
  [2020703001] = {
    id = 2020703001,
    talk_text = function()
      return T_S(20207030010)
    end,
    cg_position_scale = "-108:-191:10000",
    next_dialog = 2020703002,
    env_sound = 20006
  },
  [2020703002] = {
    id = 2020703002,
    cg_text = function()
      return T_S(20207030027)
    end,
    cg_position_scale = "-141:-232:8400",
    next_dialog = 2020703003,
    env_sound = 20006
  },
  [2020703003] = {
    id = 2020703003,
    talk_text = function()
      return T_S(20207030030)
    end,
    next_dialog = 2020703004,
    env_sound = 20006
  },
  [2020703004] = {
    id = 2020703004,
    talk_text = function()
      return T_S(20207030040)
    end,
    next_dialog = 2020703005,
    speak_name = function()
      return T_S(20207030045)
    end,
    camera_shake = {
      "3",
      "0",
      "1800"
    },
    env_sound = 20006,
    review_head = "90210001"
  },
  [2020703005] = {
    id = 2020703005,
    talk_text = function()
      return T_S(20207030050)
    end,
    next_dialog = 2020703006,
    env_sound = 20006
  },
  [2020703006] = {
    id = 2020703006,
    talk_text = function()
      return T_S(20207030060)
    end,
    next_dialog = 2020703007,
    speak_name = function()
      return T_S(20207030065)
    end,
    env_sound = 20006,
    review_head = "90210001"
  },
  [2020703007] = {
    id = 2020703007,
    cg_text = function()
      return T_S(20207030077)
    end,
    cg_position_scale = "-248:-218:8400",
    next_dialog = 2020703008,
    env_sound = 20006
  },
  [2020703008] = {
    id = 2020703008,
    talk_text = function()
      return T_S(20207030080)
    end,
    next_dialog = 2020703009,
    env_sound = 20006
  },
  [2020703009] = {
    id = 2020703009,
    talk_text = function()
      return T_S(20207030090)
    end,
    is_master = 1,
    next_dialog = 2020703010,
    env_sound = 20006
  },
  [2020703010] = {
    id = 2020703010,
    cg_text = function()
      return T_S(20207030107)
    end,
    cg_position_scale = "-112:-219:7400",
    next_dialog = 2020703011,
    env_sound = 20006
  },
  [2020703011] = {
    id = 2020703011,
    talk_text = function()
      return T_S(20207030110)
    end,
    is_master = 1,
    next_dialog = 2020703012,
    env_sound = 20006
  },
  [2020703012] = {
    id = 2020703012,
    cg_text = function()
      return T_S(20207030127)
    end,
    cg_position_scale = "180:-152:8400",
    next_dialog = 2020703013,
    env_sound = 20006
  },
  [2020703013] = {
    id = 2020703013,
    talk_text = function()
      return T_S(20207030130)
    end,
    speak_head = 90120041,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20207030135)
    end,
    env_sound = 20006
  },
  [2020704001] = {
    id = 2020704001,
    talk_text = function()
      return T_S(20207040010)
    end,
    next_dialog = 2020704002,
    env_sound = 20007
  },
  [2020704002] = {
    id = 2020704002,
    talk_text = function()
      return T_S(20207040020)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020704003,
    speak_name = function()
      return T_S(20207040025)
    end,
    env_sound = 20007
  },
  [2020704003] = {
    id = 2020704003,
    talk_text = function()
      return T_S(20207040030)
    end,
    is_master = 1,
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
    light_role = {1},
    next_dialog = 2020704004,
    env_sound = 20007
  },
  [2020704004] = {
    id = 2020704004,
    talk_text = function()
      return T_S(20207040040)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020704005,
    speak_name = function()
      return T_S(20207040045)
    end,
    env_sound = 20007
  },
  [2020704005] = {
    id = 2020704005,
    talk_text = function()
      return T_S(20207040050)
    end,
    is_master = 1,
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020704006,
    env_sound = 20007
  },
  [2020704006] = {
    id = 2020704006,
    talk_text = function()
      return T_S(20207040060)
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
    next_dialog = 2020704007,
    speak_name = function()
      return T_S(20207040065)
    end,
    env_sound = 20007
  },
  [2020704007] = {
    id = 2020704007,
    talk_text = function()
      return T_S(20207040070)
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
    next_dialog = 2020704008,
    env_sound = 20007
  },
  [2020704008] = {
    id = 2020704008,
    talk_text = function()
      return T_S(20207040080)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020704009,
    speak_name = function()
      return T_S(20207040085)
    end,
    env_sound = 20007
  },
  [2020704009] = {
    id = 2020704009,
    talk_text = function()
      return T_S(20207040090)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020704010,
    speak_name = function()
      return T_S(20207040095)
    end,
    env_sound = 20007
  },
  [2020704010] = {
    id = 2020704010,
    talk_text = function()
      return T_S(20207040100)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020704011,
    speak_name = function()
      return T_S(20207040105)
    end,
    env_sound = 20007
  },
  [2020704011] = {
    id = 2020704011,
    talk_text = function()
      return T_S(20207040110)
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
    next_dialog = 2020704012,
    speak_name = function()
      return T_S(20207040115)
    end,
    env_sound = 20007
  },
  [2020704012] = {
    id = 2020704012,
    talk_text = function()
      return T_S(20207040120)
    end,
    role_ids = {90110001, 90110024},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-270:-1000", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020704013,
    speak_name = function()
      return T_S(20207040125)
    end,
    env_sound = 20007
  },
  [2020704013] = {
    id = 2020704013,
    talk_text = function()
      return T_S(20207040130)
    end,
    role_ids = {90110001, 90110024},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-270:-1000", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020704014,
    speak_name = function()
      return T_S(20207040135)
    end,
    env_sound = 20007
  },
  [2020704014] = {
    id = 2020704014,
    talk_text = function()
      return T_S(20207040140)
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
    next_dialog = 2020704015,
    speak_name = function()
      return T_S(20207040145)
    end,
    env_sound = 20007
  },
  [2020704015] = {
    id = 2020704015,
    talk_text = function()
      return T_S(20207040150)
    end,
    is_master = 1,
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
    light_role = {1},
    next_dialog = 2020704016,
    env_sound = 20007
  },
  [2020704016] = {
    id = 2020704016,
    talk_text = function()
      return T_S(20207040160)
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
    next_dialog = 2020704017,
    speak_name = function()
      return T_S(20207040165)
    end,
    env_sound = 20007
  },
  [2020704017] = {
    id = 2020704017,
    talk_text = function()
      return T_S(20207040170)
    end,
    role_ids = {90110001, 90110024},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-270:-1000", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020704018,
    speak_name = function()
      return T_S(20207040175)
    end,
    env_sound = 20007
  },
  [2020704018] = {
    id = 2020704018,
    talk_text = function()
      return T_S(20207040180)
    end,
    role_ids = {90110001, 90110024},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-270:-1000", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020704019,
    speak_name = function()
      return T_S(20207040185)
    end,
    env_sound = 20007
  },
  [2020704019] = {
    id = 2020704019,
    talk_text = function()
      return T_S(20207040190)
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
    next_dialog = 2020704020,
    speak_name = function()
      return T_S(20207040195)
    end,
    env_sound = 20007
  },
  [2020704020] = {
    id = 2020704020,
    talk_text = function()
      return T_S(20207040200)
    end,
    is_master = 1,
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
    speak_role = {0},
    light_role = {1},
    next_dialog = 2020704021,
    env_sound = 20007
  },
  [2020704021] = {
    id = 2020704021,
    talk_text = function()
      return T_S(20207040210)
    end,
    next_dialog = 2020704022,
    env_sound = 20007
  },
  [2020704022] = {
    id = 2020704022,
    talk_text = function()
      return T_S(20207040220)
    end,
    next_dialog = 2020704023,
    env_sound = 20007
  },
  [2020704023] = {
    id = 2020704023,
    talk_text = function()
      return T_S(20207040230)
    end,
    is_master = 1,
    env_sound = 20007
  }
}
