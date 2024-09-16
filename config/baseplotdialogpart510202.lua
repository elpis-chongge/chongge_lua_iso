BasePlotDialogPart510202 = {
  [2020505001] = {
    id = 2020505001,
    talk_text = function()
      return T_S(20205050010)
    end,
    is_master = 1,
    next_dialog = 2020505002,
    env_sound = 20002
  },
  [2020505002] = {
    id = 2020505002,
    talk_text = function()
      return T_S(20205050020)
    end,
    next_dialog = 2020505003,
    env_sound = 20002
  },
  [2020505003] = {
    id = 2020505003,
    talk_text = function()
      return T_S(20205050030)
    end,
    is_master = 1,
    next_dialog = 2020505004,
    env_sound = 20002
  },
  [2020505004] = {
    id = 2020505004,
    talk_text = function()
      return T_S(20205050040)
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
    next_dialog = 2020505005,
    speak_name = function()
      return T_S(20205050045)
    end,
    env_sound = 20002
  },
  [2020505005] = {
    id = 2020505005,
    talk_text = function()
      return T_S(20205050050)
    end,
    role_ids = {90110023, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020505005/2020505005_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-998", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020505006,
    speak_name = function()
      return T_S(20205050055)
    end,
    env_sound = 20002
  },
  [2020505006] = {
    id = 2020505006,
    talk_text = function()
      return T_S(20205050060)
    end,
    role_ids = {90110023, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-998", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020505007,
    speak_name = function()
      return T_S(20205050065)
    end,
    env_sound = 20002
  },
  [2020505007] = {
    id = 2020505007,
    talk_text = function()
      return T_S(20205050070)
    end,
    role_ids = {90110023, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020505007/2020505007_90110023.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-998", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020505008,
    speak_name = function()
      return T_S(20205050075)
    end,
    env_sound = 20002
  },
  [2020505008] = {
    id = 2020505008,
    talk_text = function()
      return T_S(20205050080)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020505009,
    speak_name = function()
      return T_S(20205050085)
    end,
    env_sound = 20002
  },
  [2020505009] = {
    id = 2020505009,
    talk_text = function()
      return T_S(20205050090)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_4.playable"
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
    next_dialog = 2020505010,
    speak_name = function()
      return T_S(20205050095)
    end,
    env_sound = 20002
  },
  [2020505010] = {
    id = 2020505010,
    talk_text = function()
      return T_S(20205050100)
    end,
    role_ids = {90110023, 90110024},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-270:-998", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020505011,
    speak_name = function()
      return T_S(20205050105)
    end,
    env_sound = 20002
  },
  [2020505011] = {
    id = 2020505011,
    talk_text = function()
      return T_S(20205050110)
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
    next_dialog = 2020505012,
    speak_name = function()
      return T_S(20205050115)
    end,
    env_sound = 20002
  },
  [2020505012] = {
    id = 2020505012,
    talk_text = function()
      return T_S(20205050120)
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
    next_dialog = 2020505013,
    speak_name = function()
      return T_S(20205050125)
    end,
    env_sound = 20002
  },
  [2020505013] = {
    id = 2020505013,
    talk_text = function()
      return T_S(20205050130)
    end,
    is_master = 1,
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
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020505014,
    env_sound = 20002
  },
  [2020505014] = {
    id = 2020505014,
    talk_text = function()
      return T_S(20205050140)
    end,
    role_ids = {90110023, 90110024},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-270:-998", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020505015,
    speak_name = function()
      return T_S(20205050145)
    end,
    env_sound = 20002
  },
  [2020505015] = {
    id = 2020505015,
    talk_text = function()
      return T_S(20205050150)
    end,
    role_ids = {90110023, 90110024},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_4.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-270:-998", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020505016,
    speak_name = function()
      return T_S(20205050155)
    end,
    env_sound = 20002
  },
  [2020505016] = {
    id = 2020505016,
    talk_text = function()
      return T_S(20205050160)
    end,
    role_ids = {90110023, 90110024},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-270:-998", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020505017,
    speak_name = function()
      return T_S(20205050165)
    end,
    env_sound = 20002
  },
  [2020505017] = {
    id = 2020505017,
    talk_text = function()
      return T_S(20205050170)
    end,
    role_ids = {90110023, 90110024},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-380:-998", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020505018,
    speak_name = function()
      return T_S(20205050175)
    end,
    env_sound = 20002
  },
  [2020505018] = {
    id = 2020505018,
    talk_text = function()
      return T_S(20205050180)
    end,
    role_ids = {90110023, 90110024},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-380:-998", "120:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020505019,
    speak_name = function()
      return T_S(20205050185)
    end,
    env_sound = 20002
  },
  [2020505019] = {
    id = 2020505019,
    talk_text = function()
      return T_S(20205050190)
    end,
    next_dialog = 2020505020,
    env_sound = 20002
  },
  [2020505020] = {
    id = 2020505020,
    talk_text = function()
      return T_S(20205050200)
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
    next_dialog = 2020505021,
    speak_name = function()
      return T_S(20205050205)
    end,
    env_sound = 20002
  },
  [2020505021] = {
    id = 2020505021,
    talk_text = function()
      return T_S(20205050210)
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
    next_dialog = 2020505022,
    speak_name = function()
      return T_S(20205050215)
    end,
    env_sound = 20002
  },
  [2020505022] = {
    id = 2020505022,
    talk_text = function()
      return T_S(20205050220)
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
    next_dialog = 2020505023,
    speak_name = function()
      return T_S(20205050225)
    end,
    env_sound = 20002
  },
  [2020505023] = {
    id = 2020505023,
    talk_text = function()
      return T_S(20205050230)
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
    next_dialog = 2020505024,
    env_sound = 20002
  },
  [2020505024] = {
    id = 2020505024,
    talk_text = function()
      return T_S(20205050240)
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
      return T_S(20205050245)
    end,
    env_sound = 20002
  },
  [2020506001] = {
    id = 2020506001,
    talk_text = function()
      return T_S(20205060010)
    end,
    next_dialog = 2020506002,
    env_sound = 20001
  },
  [2020506002] = {
    id = 2020506002,
    talk_text = function()
      return T_S(20205060020)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020506003,
    speak_name = function()
      return T_S(20205060025)
    end,
    env_sound = 20001
  },
  [2020506003] = {
    id = 2020506003,
    talk_text = function()
      return T_S(20205060030)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020506004,
    speak_name = function()
      return T_S(20205060035)
    end,
    env_sound = 20001
  },
  [2020506004] = {
    id = 2020506004,
    talk_text = function()
      return T_S(20205060040)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506005,
    speak_name = function()
      return T_S(20205060045)
    end,
    env_sound = 20001
  },
  [2020506005] = {
    id = 2020506005,
    talk_text = function()
      return T_S(20205060050)
    end,
    role_ids = {90110024, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_2.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-1077", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020506006,
    speak_name = function()
      return T_S(20205060055)
    end,
    env_sound = 20001
  },
  [2020506006] = {
    id = 2020506006,
    talk_text = function()
      return T_S(20205060060)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506007,
    speak_name = function()
      return T_S(20205060065)
    end,
    env_sound = 20001
  },
  [2020506007] = {
    id = 2020506007,
    talk_text = function()
      return T_S(20205060070)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020506008,
    speak_name = function()
      return T_S(20205060075)
    end,
    env_sound = 20001
  },
  [2020506008] = {
    id = 2020506008,
    talk_text = function()
      return T_S(20205060080)
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
    next_dialog = 2020506009,
    speak_name = function()
      return T_S(20205060085)
    end,
    env_sound = 20001
  },
  [2020506009] = {
    id = 2020506009,
    talk_text = function()
      return T_S(20205060090)
    end,
    next_dialog = 2020506010,
    env_sound = 20001
  },
  [2020506010] = {
    id = 2020506010,
    talk_text = function()
      return T_S(20205060100)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_4.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020506011,
    speak_name = function()
      return T_S(20205060105)
    end,
    env_sound = 20001
  },
  [2020506011] = {
    id = 2020506011,
    talk_text = function()
      return T_S(20205060110)
    end,
    next_dialog = 2020506012,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20205060115)
    end,
    env_sound = 20001
  },
  [2020506012] = {
    id = 2020506012,
    talk_text = function()
      return T_S(20205060120)
    end,
    next_dialog = 2020506013,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20205060125)
    end,
    env_sound = 20001
  },
  [2020506013] = {
    id = 2020506013,
    talk_text = function()
      return T_S(20205060130)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020506014,
    speak_name = function()
      return T_S(20205060135)
    end,
    env_sound = 20001
  },
  [2020506014] = {
    id = 2020506014,
    talk_text = function()
      return T_S(20205060140)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506015,
    speak_name = function()
      return T_S(20205060145)
    end,
    env_sound = 20001
  },
  [2020506015] = {
    id = 2020506015,
    talk_text = function()
      return T_S(20205060150)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020506016,
    speak_name = function()
      return T_S(20205060155)
    end,
    env_sound = 20001
  },
  [2020506016] = {
    id = 2020506016,
    talk_text = function()
      return T_S(20205060160)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506017,
    speak_name = function()
      return T_S(20205060165)
    end,
    env_sound = 20001
  },
  [2020506017] = {
    id = 2020506017,
    talk_text = function()
      return T_S(20205060170)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020506018,
    speak_name = function()
      return T_S(20205060175)
    end,
    env_sound = 20001
  },
  [2020506018] = {
    id = 2020506018,
    talk_text = function()
      return T_S(20205060180)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506019,
    speak_name = function()
      return T_S(20205060185)
    end,
    env_sound = 20001
  },
  [2020506019] = {
    id = 2020506019,
    talk_text = function()
      return T_S(20205060190)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020506020,
    speak_name = function()
      return T_S(20205060195)
    end,
    env_sound = 20001
  },
  [2020506020] = {
    id = 2020506020,
    talk_text = function()
      return T_S(20205060200)
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
    next_dialog = 2020506021,
    speak_name = function()
      return T_S(20205060205)
    end,
    env_sound = 20001
  },
  [2020506021] = {
    id = 2020506021,
    talk_text = function()
      return T_S(20205060210)
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
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506022,
    speak_name = function()
      return T_S(20205060215)
    end,
    env_sound = 20001
  },
  [2020506022] = {
    id = 2020506022,
    talk_text = function()
      return T_S(20205060220)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506023,
    speak_name = function()
      return T_S(20205060225)
    end,
    env_sound = 20001
  },
  [2020506023] = {
    id = 2020506023,
    talk_text = function()
      return T_S(20205060230)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020506024,
    speak_name = function()
      return T_S(20205060235)
    end,
    env_sound = 20001
  },
  [2020506024] = {
    id = 2020506024,
    talk_text = function()
      return T_S(20205060240)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506025,
    speak_name = function()
      return T_S(20205060245)
    end,
    env_sound = 20001
  },
  [2020506025] = {
    id = 2020506025,
    talk_text = function()
      return T_S(20205060250)
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
    next_dialog = 2020506026,
    speak_name = function()
      return T_S(20205060255)
    end,
    env_sound = 20001
  },
  [2020506026] = {
    id = 2020506026,
    talk_text = function()
      return T_S(20205060260)
    end,
    role_ids = {90110003, 90110023},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"-300:-980", "270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020506027,
    speak_name = function()
      return T_S(20205060265)
    end,
    env_sound = 20001
  },
  [2020506027] = {
    id = 2020506027,
    talk_text = function()
      return T_S(20205060270)
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
    next_dialog = 2020506028,
    speak_name = function()
      return T_S(20205060275)
    end,
    env_sound = 20001
  },
  [2020506028] = {
    id = 2020506028,
    talk_text = function()
      return T_S(20205060280)
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
    env_sound = 20001
  }
}
