BasePlotDialogPart510302 = {
  [2020705001] = {
    id = 2020705001,
    talk_text = function()
      return T_S(20207050010)
    end,
    next_dialog = 2020705002,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050015)
    end,
    env_sound = 20001
  },
  [2020705002] = {
    id = 2020705002,
    talk_text = function()
      return T_S(20207050020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020705002/2020705002_90110003.playable"
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
    next_dialog = 2020705003,
    speak_name = function()
      return T_S(20207050025)
    end,
    env_sound = 20001
  },
  [2020705003] = {
    id = 2020705003,
    talk_text = function()
      return T_S(20207050030)
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
    next_dialog = 2020705004,
    speak_name = function()
      return T_S(20207050035)
    end,
    env_sound = 20001
  },
  [2020705004] = {
    id = 2020705004,
    talk_text = function()
      return T_S(20207050040)
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
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020705005,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050045)
    end,
    env_sound = 20001
  },
  [2020705005] = {
    id = 2020705005,
    talk_text = function()
      return T_S(20207050050)
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
    next_dialog = 2020705006,
    speak_name = function()
      return T_S(20207050055)
    end,
    env_sound = 20001
  },
  [2020705006] = {
    id = 2020705006,
    talk_text = function()
      return T_S(20207050060)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705007,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050065)
    end,
    env_sound = 20001
  },
  [2020705007] = {
    id = 2020705007,
    talk_text = function()
      return T_S(20207050070)
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
    next_dialog = 2020705008,
    speak_name = function()
      return T_S(20207050075)
    end,
    env_sound = 20001
  },
  [2020705008] = {
    id = 2020705008,
    talk_text = function()
      return T_S(20207050080)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705009,
    speak_head = 90120058,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20207050085)
    end,
    env_sound = 20001
  },
  [2020705009] = {
    id = 2020705009,
    talk_text = function()
      return T_S(20207050090)
    end,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_3.playable"
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
    next_dialog = 2020705010,
    speak_name = function()
      return T_S(20207050095)
    end,
    env_sound = 20001
  },
  [2020705010] = {
    id = 2020705010,
    talk_text = function()
      return T_S(20207050100)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705011,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050105)
    end,
    env_sound = 20001
  },
  [2020705011] = {
    id = 2020705011,
    talk_text = function()
      return T_S(20207050110)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705012,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050115)
    end,
    env_sound = 20001
  },
  [2020705012] = {
    id = 2020705012,
    talk_text = function()
      return T_S(20207050120)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705013,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050125)
    end,
    env_sound = 20001
  },
  [2020705013] = {
    id = 2020705013,
    talk_text = function()
      return T_S(20207050130)
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
    next_dialog = 2020705014,
    speak_name = function()
      return T_S(20207050135)
    end,
    env_sound = 20001
  },
  [2020705014] = {
    id = 2020705014,
    talk_text = function()
      return T_S(20207050140)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705015,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050145)
    end,
    env_sound = 20001
  },
  [2020705015] = {
    id = 2020705015,
    talk_text = function()
      return T_S(20207050150)
    end,
    role_ids = {90110024, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020705015/2020705015_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1077", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020705016,
    speak_name = function()
      return T_S(20207050155)
    end,
    env_sound = 20001
  },
  [2020705016] = {
    id = 2020705016,
    talk_text = function()
      return T_S(20207050160)
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
    role_position = {"270:-1077", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020705017,
    speak_name = function()
      return T_S(20207050165)
    end,
    env_sound = 20001
  },
  [2020705017] = {
    id = 2020705017,
    talk_text = function()
      return T_S(20207050170)
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
    role_position = {"270:-1077", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020705018,
    speak_name = function()
      return T_S(20207050175)
    end,
    env_sound = 20001
  },
  [2020705018] = {
    id = 2020705018,
    talk_text = function()
      return T_S(20207050180)
    end,
    is_os = 1,
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
    role_position = {"270:-1077", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020705019,
    speak_name = function()
      return T_S(20207050185)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2020705019] = {
    id = 2020705019,
    talk_text = function()
      return T_S(20207050190)
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
    role_position = {"270:-1077", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020705020,
    speak_name = function()
      return T_S(20207050195)
    end,
    env_sound = 20001
  },
  [2020705020] = {
    id = 2020705020,
    talk_text = function()
      return T_S(20207050200)
    end,
    is_master = 1,
    next_dialog = 2020705021,
    env_sound = 20001
  },
  [2020705021] = {
    id = 2020705021,
    talk_text = function()
      return T_S(20207050210)
    end,
    next_dialog = 2020705022,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050215)
    end,
    env_sound = 20001
  },
  [2020705022] = {
    id = 2020705022,
    talk_text = function()
      return T_S(20207050220)
    end,
    is_master = 1,
    next_dialog = 2020705023,
    env_sound = 20001
  },
  [2020705023] = {
    id = 2020705023,
    talk_text = function()
      return T_S(20207050230)
    end,
    is_master = 1,
    next_dialog = 2020705024,
    env_sound = 20001
  },
  [2020705024] = {
    id = 2020705024,
    talk_text = function()
      return T_S(20207050240)
    end,
    next_dialog = 2020705025,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050245)
    end,
    env_sound = 20001
  },
  [2020705025] = {
    id = 2020705025,
    talk_text = function()
      return T_S(20207050250)
    end,
    next_dialog = 2020705026,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050255)
    end,
    env_sound = 20001
  },
  [2020705026] = {
    id = 2020705026,
    talk_text = function()
      return T_S(20207050260)
    end,
    is_master = 1,
    next_dialog = 2020705027,
    env_sound = 20001
  },
  [2020705027] = {
    id = 2020705027,
    talk_text = function()
      return T_S(20207050270)
    end,
    next_dialog = 2020705028,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050275)
    end,
    env_sound = 20001
  },
  [2020705028] = {
    id = 2020705028,
    talk_text = function()
      return T_S(20207050280)
    end,
    next_dialog = 2020705029,
    env_sound = 20001
  },
  [2020705029] = {
    id = 2020705029,
    talk_text = function()
      return T_S(20207050290)
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
    next_dialog = 2020705030,
    speak_name = function()
      return T_S(20207050295)
    end,
    env_sound = 20001
  },
  [2020705030] = {
    id = 2020705030,
    talk_text = function()
      return T_S(20207050300)
    end,
    role_ids = {90110003, 90110024},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-300:-980", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020705031,
    speak_name = function()
      return T_S(20207050305)
    end,
    env_sound = 20001
  },
  [2020705031] = {
    id = 2020705031,
    talk_text = function()
      return T_S(20207050310)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020705032,
    speak_name = function()
      return T_S(20207050315)
    end,
    env_sound = 20001
  },
  [2020705032] = {
    id = 2020705032,
    talk_text = function()
      return T_S(20207050320)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020705033,
    speak_name = function()
      return T_S(20207050325)
    end,
    env_sound = 20001
  },
  [2020705033] = {
    id = 2020705033,
    talk_text = function()
      return T_S(20207050330)
    end,
    is_master = 1,
    next_dialog = 2020705034,
    env_sound = 20001
  },
  [2020705034] = {
    id = 2020705034,
    talk_text = function()
      return T_S(20207050340)
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
    next_dialog = 2020705035,
    speak_name = function()
      return T_S(20207050345)
    end,
    env_sound = 20001
  },
  [2020705035] = {
    id = 2020705035,
    talk_text = function()
      return T_S(20207050350)
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
    next_dialog = 2020705036,
    speak_name = function()
      return T_S(20207050355)
    end,
    env_sound = 20001
  },
  [2020705036] = {
    id = 2020705036,
    talk_text = function()
      return T_S(20207050360)
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
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020705037,
    speak_name = function()
      return T_S(20207050365)
    end,
    env_sound = 20001
  },
  [2020705037] = {
    id = 2020705037,
    talk_text = function()
      return T_S(20207050370)
    end,
    next_dialog = 2020705038,
    speak_head = 90120058,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20207050375)
    end,
    env_sound = 20001
  },
  [2020705038] = {
    id = 2020705038,
    talk_text = function()
      return T_S(20207050380)
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
    next_dialog = 2020705039,
    speak_name = function()
      return T_S(20207050385)
    end,
    env_sound = 20001
  },
  [2020705039] = {
    id = 2020705039,
    talk_text = function()
      return T_S(20207050390)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705040,
    speak_name = function()
      return T_S(20207050395)
    end,
    env_sound = 20001,
    review_head = "90210001"
  },
  [2020705040] = {
    id = 2020705040,
    talk_text = function()
      return T_S(20207050400)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020705041,
    speak_name = function()
      return T_S(20207050405)
    end,
    env_sound = 20001
  },
  [2020705041] = {
    id = 2020705041,
    talk_text = function()
      return T_S(20207050410)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020705041/2020705041_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1165", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020705042,
    speak_name = function()
      return T_S(20207050415)
    end,
    env_sound = 20001
  },
  [2020705042] = {
    id = 2020705042,
    talk_text = function()
      return T_S(20207050420)
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
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1165", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020705043,
    speak_head = 90120058,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20207050425)
    end,
    env_sound = 20001
  },
  [2020705043] = {
    id = 2020705043,
    talk_text = function()
      return T_S(20207050430)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020705043/2020705043_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1165", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020705044,
    speak_name = function()
      return T_S(20207050435)
    end,
    env_sound = 20001
  },
  [2020705044] = {
    id = 2020705044,
    talk_text = function()
      return T_S(20207050440)
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
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1165", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020705045,
    speak_name = function()
      return T_S(20207050445)
    end,
    env_sound = 20001
  },
  [2020705045] = {
    id = 2020705045,
    talk_text = function()
      return T_S(20207050450)
    end,
    role_ids = {90110024},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_3.playable"
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
    next_dialog = 2020705046,
    speak_name = function()
      return T_S(20207050455)
    end,
    env_sound = 20001
  },
  [2020705046] = {
    id = 2020705046,
    talk_text = function()
      return T_S(20207050460)
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
    next_dialog = 2020705047,
    speak_name = function()
      return T_S(20207050465)
    end,
    env_sound = 20001
  },
  [2020705047] = {
    id = 2020705047,
    talk_text = function()
      return T_S(20207050470)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705048,
    speak_head = 90120058,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20207050475)
    end,
    env_sound = 20001
  },
  [2020705048] = {
    id = 2020705048,
    talk_text = function()
      return T_S(20207050480)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020705049,
    speak_name = function()
      return T_S(20207050485)
    end,
    env_sound = 20001
  },
  [2020705049] = {
    id = 2020705049,
    talk_text = function()
      return T_S(20207050490)
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
    light_role = {0},
    next_dialog = 2020705050,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050495)
    end,
    env_sound = 20001
  },
  [2020705050] = {
    id = 2020705050,
    talk_text = function()
      return T_S(20207050500)
    end,
    next_dialog = 2020705051,
    env_sound = 20001
  },
  [2020705051] = {
    id = 2020705051,
    talk_text = function()
      return T_S(20207050510)
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
    next_dialog = 2020705052,
    speak_name = function()
      return T_S(20207050515)
    end,
    env_sound = 20001
  },
  [2020705052] = {
    id = 2020705052,
    talk_text = function()
      return T_S(20207050520)
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020705053,
    speak_name = function()
      return T_S(20207050525)
    end,
    env_sound = 20001
  },
  [2020705053] = {
    id = 2020705053,
    talk_text = function()
      return T_S(20207050530)
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
    next_dialog = 2020705054,
    speak_name = function()
      return T_S(20207050535)
    end,
    env_sound = 20001
  },
  [2020705054] = {
    id = 2020705054,
    talk_text = function()
      return T_S(20207050540)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2020705055,
    speak_head = 90120058,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20207050545)
    end,
    env_sound = 20001
  },
  [2020705055] = {
    id = 2020705055,
    talk_text = function()
      return T_S(20207050550)
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
    light_role = {0},
    next_dialog = 2020705056,
    env_sound = 20001
  },
  [2020705056] = {
    id = 2020705056,
    talk_text = function()
      return T_S(20207050560)
    end,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20207050565)
    end,
    env_sound = 20001
  },
  [2020706001] = {
    id = 2020706001,
    talk_text = function()
      return T_S(20207060010)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020706002,
    speak_name = function()
      return T_S(20207060015)
    end,
    env_sound = 20001
  },
  [2020706002] = {
    id = 2020706002,
    talk_text = function()
      return T_S(20207060020)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2020706003,
    env_sound = 20001
  },
  [2020706003] = {
    id = 2020706003,
    talk_text = function()
      return T_S(20207060030)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020706004,
    speak_name = function()
      return T_S(20207060035)
    end,
    env_sound = 20001
  },
  [2020706004] = {
    id = 2020706004,
    talk_text = function()
      return T_S(20207060040)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2020706005,
    env_sound = 20001
  },
  [2020706005] = {
    id = 2020706005,
    talk_text = function()
      return T_S(20207060050)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020706006,
    speak_name = function()
      return T_S(20207060055)
    end,
    env_sound = 20001
  },
  [2020706006] = {
    id = 2020706006,
    talk_text = function()
      return T_S(20207060060)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2020706007,
    env_sound = 20001
  },
  [2020706007] = {
    id = 2020706007,
    talk_text = function()
      return T_S(20207060070)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020706008,
    speak_name = function()
      return T_S(20207060075)
    end,
    env_sound = 20001
  },
  [2020706008] = {
    id = 2020706008,
    talk_text = function()
      return T_S(20207060080)
    end,
    role_ids = {90110003, 90110024},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-300:-980", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020706009,
    speak_name = function()
      return T_S(20207060085)
    end,
    env_sound = 20001
  },
  [2020706009] = {
    id = 2020706009,
    talk_text = function()
      return T_S(20207060090)
    end,
    role_ids = {90110003, 90110024},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-300:-980", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020706010,
    speak_name = function()
      return T_S(20207060095)
    end,
    env_sound = 20001
  },
  [2020706010] = {
    id = 2020706010,
    talk_text = function()
      return T_S(20207060100)
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
    next_dialog = 2020706011,
    speak_name = function()
      return T_S(20207060105)
    end,
    env_sound = 20001
  },
  [2020706011] = {
    id = 2020706011,
    talk_text = function()
      return T_S(20207060110)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020706012,
    speak_name = function()
      return T_S(20207060115)
    end,
    env_sound = 20001
  },
  [2020706012] = {
    id = 2020706012,
    talk_text = function()
      return T_S(20207060120)
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
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020706013,
    speak_name = function()
      return T_S(20207060125)
    end,
    env_sound = 20001
  },
  [2020706013] = {
    id = 2020706013,
    talk_text = function()
      return T_S(20207060130)
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
    next_dialog = 2020706014,
    speak_name = function()
      return T_S(20207060135)
    end,
    env_sound = 20001
  },
  [2020706014] = {
    id = 2020706014,
    talk_text = function()
      return T_S(20207060140)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-308:-1165", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020706015,
    speak_name = function()
      return T_S(20207060145)
    end,
    env_sound = 20001
  },
  [2020706015] = {
    id = 2020706015,
    talk_text = function()
      return T_S(20207060150)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-308:-1165", "270:-1000"},
    role_shake = {"2:500:1500", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"2", "0"},
    effect_out_param = {"210", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020706016,
    speak_name = function()
      return T_S(20207060155)
    end,
    env_sound = 20001
  },
  [2020706016] = {
    id = 2020706016,
    talk_text = function()
      return T_S(20207060160)
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
    next_dialog = 2020706017,
    env_sound = 20001
  },
  [2020706017] = {
    id = 2020706017,
    talk_text = function()
      return T_S(20207060170)
    end,
    next_dialog = 2020706018,
    speak_head = 90120044,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20207060175)
    end,
    env_sound = 20001
  },
  [2020706018] = {
    id = 2020706018,
    talk_text = function()
      return T_S(20207060180)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020706018/2020706018_90110003.playable"
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
    next_dialog = 2020706019,
    speak_name = function()
      return T_S(20207060185)
    end,
    env_sound = 20001
  },
  [2020706019] = {
    id = 2020706019,
    talk_text = function()
      return T_S(20207060190)
    end,
    role_ids = {90110003, 90110024},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110024/90110024_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110024/90110024_0.playable"
    },
    role_position = {"-300:-980", "270:-1077"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020706020,
    speak_name = function()
      return T_S(20207060195)
    end,
    env_sound = 20001
  },
  [2020706020] = {
    id = 2020706020,
    talk_text = function()
      return T_S(20207060200)
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
    next_dialog = 2020706021,
    speak_name = function()
      return T_S(20207060205)
    end,
    env_sound = 20001
  },
  [2020706021] = {
    id = 2020706021,
    talk_text = function()
      return T_S(20207060210)
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
    next_dialog = 2020706022,
    env_sound = 20001
  },
  [2020706022] = {
    id = 2020706022,
    talk_text = function()
      return T_S(20207060220)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020706022/2020706022_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    role_shake = {"2:0:1100"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20207060225)
    end,
    env_sound = 20001
  }
}
