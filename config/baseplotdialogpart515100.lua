BasePlotDialogPart515100 = {
  [2030301001] = {
    id = 2030301001,
    talk_text = function()
      return T_S(20303010010)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030301002,
    speak_name = function()
      return T_S(20303010015)
    end,
    env_sound = 20002,
    open_title_1 = function()
      return T_S(20303010018)
    end,
    open_title_2 = function()
      return T_S(20303010019)
    end
  },
  [2030301002] = {
    id = 2030301002,
    talk_text = function()
      return T_S(20303010020)
    end,
    next_dialog = 2030301003,
    env_sound = 20002
  },
  [2030301003] = {
    id = 2030301003,
    talk_text = function()
      return T_S(20303010030)
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
    next_dialog = 2030301004,
    speak_name = function()
      return T_S(20303010035)
    end,
    env_sound = 20002
  },
  [2030301004] = {
    id = 2030301004,
    talk_text = function()
      return T_S(20303010040)
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
    effect_in_param = {"0", "120"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030301005,
    speak_name = function()
      return T_S(20303010045)
    end,
    env_sound = 20002
  },
  [2030301005] = {
    id = 2030301005,
    talk_text = function()
      return T_S(20303010050)
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
    next_dialog = 2030301006,
    speak_name = function()
      return T_S(20303010055)
    end,
    env_sound = 20002
  },
  [2030301006] = {
    id = 2030301006,
    talk_text = function()
      return T_S(20303010060)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030301006/2030301006_90110003.playable"
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
    next_dialog = 2030301007,
    speak_name = function()
      return T_S(20303010065)
    end,
    env_sound = 20002
  },
  [2030301007] = {
    id = 2030301007,
    talk_text = function()
      return T_S(20303010070)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030301008,
    speak_name = function()
      return T_S(20303010075)
    end,
    env_sound = 20002
  },
  [2030301008] = {
    id = 2030301008,
    talk_text = function()
      return T_S(20303010080)
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
    next_dialog = 2030301009,
    speak_name = function()
      return T_S(20303010085)
    end,
    env_sound = 20002
  },
  [2030301009] = {
    id = 2030301009,
    talk_text = function()
      return T_S(20303010090)
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
    light_role = {1},
    next_dialog = 2030301010,
    env_sound = 20002
  },
  [2030301010] = {
    id = 2030301010,
    talk_text = function()
      return T_S(20303010100)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030301011,
    speak_name = function()
      return T_S(20303010105)
    end,
    env_sound = 20002
  },
  [2030301011] = {
    id = 2030301011,
    talk_text = function()
      return T_S(20303010110)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030301012,
    speak_name = function()
      return T_S(20303010115)
    end,
    env_sound = 20002
  },
  [2030301012] = {
    id = 2030301012,
    talk_text = function()
      return T_S(20303010120)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030301012/2030301012_90110002.playable"
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
    next_dialog = 2030301013,
    speak_name = function()
      return T_S(20303010125)
    end,
    env_sound = 20002
  },
  [2030301013] = {
    id = 2030301013,
    talk_text = function()
      return T_S(20303010130)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030301013/2030301013_90110003.playable"
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
    next_dialog = 2030301014,
    speak_name = function()
      return T_S(20303010135)
    end,
    env_sound = 20002
  },
  [2030301014] = {
    id = 2030301014,
    talk_text = function()
      return T_S(20303010140)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030301014/2030301014_90110001.playable"
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
    next_dialog = 2030301015,
    speak_name = function()
      return T_S(20303010145)
    end,
    env_sound = 20002
  },
  [2030301015] = {
    id = 2030301015,
    talk_text = function()
      return T_S(20303010150)
    end,
    next_dialog = 2030301016,
    env_sound = 20002
  },
  [2030301016] = {
    id = 2030301016,
    talk_text = function()
      return T_S(20303010160)
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
    effect_in = {"1", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030301017,
    speak_name = function()
      return T_S(20303010165)
    end,
    env_sound = 20002
  },
  [2030301017] = {
    id = 2030301017,
    talk_text = function()
      return T_S(20303010170)
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
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030301018,
    speak_name = function()
      return T_S(20303010175)
    end,
    env_sound = 20002
  },
  [2030301018] = {
    id = 2030301018,
    talk_text = function()
      return T_S(20303010180)
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
    next_dialog = 2030301019,
    speak_name = function()
      return T_S(20303010185)
    end,
    env_sound = 20002
  },
  [2030301019] = {
    id = 2030301019,
    talk_text = function()
      return T_S(20303010190)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030301019/2030301019_90110003.playable"
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
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030301020,
    speak_name = function()
      return T_S(20303010195)
    end,
    env_sound = 20002
  },
  [2030301020] = {
    id = 2030301020,
    talk_text = function()
      return T_S(20303010200)
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
    next_dialog = 2030301021,
    speak_name = function()
      return T_S(20303010205)
    end,
    env_sound = 20002
  },
  [2030301021] = {
    id = 2030301021,
    talk_text = function()
      return T_S(20303010210)
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
    next_dialog = 2030301022,
    speak_name = function()
      return T_S(20303010215)
    end,
    env_sound = 20002
  },
  [2030301022] = {
    id = 2030301022,
    talk_text = function()
      return T_S(20303010220)
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
    speak_name = function()
      return T_S(20303010225)
    end,
    env_sound = 20002
  },
  [2030302001] = {
    id = 2030302001,
    talk_text = function()
      return T_S(20303020010)
    end,
    next_dialog = 2030302002,
    env_sound = 20005
  },
  [2030302002] = {
    id = 2030302002,
    talk_text = function()
      return T_S(20303020020)
    end,
    next_dialog = 2030302003,
    env_sound = 20005
  },
  [2030302003] = {
    id = 2030302003,
    talk_text = function()
      return T_S(20303020030)
    end,
    next_dialog = 2030302004,
    env_sound = 20005
  },
  [2030302004] = {
    id = 2030302004,
    talk_text = function()
      return T_S(20303020040)
    end,
    next_dialog = 2030302005,
    env_sound = 20005
  },
  [2030302005] = {
    id = 2030302005,
    talk_text = function()
      return T_S(20303020050)
    end,
    is_master = 1,
    next_dialog = 2030302006,
    env_sound = 20005
  },
  [2030302006] = {
    id = 2030302006,
    talk_text = function()
      return T_S(20303020060)
    end,
    next_dialog = 2030302007,
    env_sound = 20005
  },
  [2030302007] = {
    id = 2030302007,
    talk_text = function()
      return T_S(20303020070)
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
    next_dialog = 2030302008,
    speak_name = function()
      return T_S(20303020075)
    end,
    env_sound = 20005
  },
  [2030302008] = {
    id = 2030302008,
    talk_text = function()
      return T_S(20303020080)
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
    next_dialog = 2030302009,
    env_sound = 20005
  },
  [2030302009] = {
    id = 2030302009,
    talk_text = function()
      return T_S(20303020090)
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
    next_dialog = 2030302010,
    env_sound = 20005
  },
  [2030302010] = {
    id = 2030302010,
    talk_text = function()
      return T_S(20303020100)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030302011,
    speak_name = function()
      return T_S(20303020105)
    end,
    env_sound = 20005
  },
  [2030302011] = {
    id = 2030302011,
    talk_text = function()
      return T_S(20303020110)
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
    next_dialog = 2030302012,
    env_sound = 20005
  },
  [2030302012] = {
    id = 2030302012,
    talk_text = function()
      return T_S(20303020120)
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
    next_dialog = 2030302013,
    env_sound = 20005
  },
  [2030302013] = {
    id = 2030302013,
    talk_text = function()
      return T_S(20303020130)
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
    next_dialog = 2030302014,
    env_sound = 20005
  },
  [2030302014] = {
    id = 2030302014,
    talk_text = function()
      return T_S(20303020140)
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
    next_dialog = 2030302015,
    speak_name = function()
      return T_S(20303020145)
    end,
    env_sound = 20005
  },
  [2030302015] = {
    id = 2030302015,
    talk_text = function()
      return T_S(20303020150)
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
    next_dialog = 2030302016,
    env_sound = 20005
  },
  [2030302016] = {
    id = 2030302016,
    talk_text = function()
      return T_S(20303020160)
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
    role_shake = {"1:0:1100"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030302017,
    speak_name = function()
      return T_S(20303020165)
    end,
    env_sound = 20005
  },
  [2030302017] = {
    id = 2030302017,
    talk_text = function()
      return T_S(20303020170)
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
    next_dialog = 2030302018,
    env_sound = 20005
  },
  [2030302018] = {
    id = 2030302018,
    talk_text = function()
      return T_S(20303020180)
    end,
    next_dialog = 2030302019,
    env_sound = 20005
  },
  [2030302019] = {
    id = 2030302019,
    talk_text = function()
      return T_S(20303020190)
    end,
    next_dialog = 2030302020,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020195)
    end,
    env_sound = 20005
  },
  [2030302020] = {
    id = 2030302020,
    talk_text = function()
      return T_S(20303020200)
    end,
    next_dialog = 2030302021,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020205)
    end,
    env_sound = 20005
  },
  [2030302021] = {
    id = 2030302021,
    talk_text = function()
      return T_S(20303020210)
    end,
    next_dialog = 2030302022,
    speak_head = 90120044,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020215)
    end,
    env_sound = 20005
  },
  [2030302022] = {
    id = 2030302022,
    talk_text = function()
      return T_S(20303020220)
    end,
    next_dialog = 2030302023,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020225)
    end,
    env_sound = 20005
  },
  [2030302023] = {
    id = 2030302023,
    talk_text = function()
      return T_S(20303020230)
    end,
    next_dialog = 2030302024,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020235)
    end,
    env_sound = 20005
  },
  [2030302024] = {
    id = 2030302024,
    talk_text = function()
      return T_S(20303020240)
    end,
    next_dialog = 2030302025,
    speak_head = 90120044,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020245)
    end,
    env_sound = 20005
  },
  [2030302025] = {
    id = 2030302025,
    talk_text = function()
      return T_S(20303020250)
    end,
    next_dialog = 2030302026,
    speak_head = 90120042,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020255)
    end,
    env_sound = 20005
  },
  [2030302026] = {
    id = 2030302026,
    talk_text = function()
      return T_S(20303020260)
    end,
    next_dialog = 2030302027,
    env_sound = 20005
  },
  [2030302027] = {
    id = 2030302027,
    talk_text = function()
      return T_S(20303020270)
    end,
    next_dialog = 2030302028,
    env_sound = 20005
  },
  [2030302028] = {
    id = 2030302028,
    talk_text = function()
      return T_S(20303020280)
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
    next_dialog = 2030302029,
    speak_name = function()
      return T_S(20303020285)
    end,
    env_sound = 20005
  },
  [2030302029] = {
    id = 2030302029,
    talk_text = function()
      return T_S(20303020290)
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
    next_dialog = 2030302030,
    env_sound = 20005
  },
  [2030302030] = {
    id = 2030302030,
    talk_text = function()
      return T_S(20303020300)
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
    next_dialog = 2030302031,
    env_sound = 20005
  },
  [2030302031] = {
    id = 2030302031,
    talk_text = function()
      return T_S(20303020310)
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
    next_dialog = 2030302032,
    speak_name = function()
      return T_S(20303020315)
    end,
    env_sound = 20005
  },
  [2030302032] = {
    id = 2030302032,
    talk_text = function()
      return T_S(20303020320)
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
    next_dialog = 2030302033,
    env_sound = 20005
  },
  [2030302033] = {
    id = 2030302033,
    talk_text = function()
      return T_S(20303020330)
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
    next_dialog = 2030302034,
    speak_name = function()
      return T_S(20303020335)
    end,
    env_sound = 20005
  },
  [2030302034] = {
    id = 2030302034,
    talk_text = function()
      return T_S(20303020340)
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
    next_dialog = 2030302035,
    env_sound = 20005
  },
  [2030302035] = {
    id = 2030302035,
    talk_text = function()
      return T_S(20303020350)
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
    next_dialog = 2030302036,
    env_sound = 20005
  },
  [2030302036] = {
    id = 2030302036,
    talk_text = function()
      return T_S(20303020360)
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
    next_dialog = 2030302037,
    speak_name = function()
      return T_S(20303020365)
    end,
    env_sound = 20005
  },
  [2030302037] = {
    id = 2030302037,
    talk_text = function()
      return T_S(20303020370)
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
    next_dialog = 2030302038,
    env_sound = 20005
  },
  [2030302038] = {
    id = 2030302038,
    talk_text = function()
      return T_S(20303020380)
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
    next_dialog = 2030302039,
    speak_name = function()
      return T_S(20303020385)
    end,
    env_sound = 20005
  },
  [2030302039] = {
    id = 2030302039,
    talk_text = function()
      return T_S(20303020390)
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
    next_dialog = 2030302040,
    env_sound = 20005
  },
  [2030302040] = {
    id = 2030302040,
    talk_text = function()
      return T_S(20303020400)
    end,
    is_os = 1,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_1.playable"
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
    next_dialog = 2030302041,
    speak_name = function()
      return T_S(20303020405)
    end,
    env_sound = 20005
  },
  [2030302041] = {
    id = 2030302041,
    talk_text = function()
      return T_S(20303020410)
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
    next_dialog = 2030302042,
    env_sound = 20005
  },
  [2030302042] = {
    id = 2030302042,
    talk_text = function()
      return T_S(20303020420)
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
    next_dialog = 2030302043,
    env_sound = 20005
  },
  [2030302043] = {
    id = 2030302043,
    talk_text = function()
      return T_S(20303020430)
    end,
    role_ids = {90110028},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_5.playable"
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
    next_dialog = 2030302044,
    env_sound = 20005
  },
  [2030302044] = {
    id = 2030302044,
    talk_text = function()
      return T_S(20303020440)
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
    next_dialog = 2030302045,
    env_sound = 20005
  },
  [2030302045] = {
    id = 2030302045,
    talk_text = function()
      return T_S(20303020450)
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
    next_dialog = 2030302046,
    speak_name = function()
      return T_S(20303020455)
    end,
    env_sound = 20005
  },
  [2030302046] = {
    id = 2030302046,
    talk_text = function()
      return T_S(20303020460)
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
    next_dialog = 2030302047,
    env_sound = 20005
  },
  [2030302047] = {
    id = 2030302047,
    talk_text = function()
      return T_S(20303020470)
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
    next_dialog = 2030302048,
    env_sound = 20005
  },
  [2030302048] = {
    id = 2030302048,
    talk_text = function()
      return T_S(20303020480)
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
    next_dialog = 2030302049,
    speak_name = function()
      return T_S(20303020485)
    end,
    env_sound = 20005
  },
  [2030302049] = {
    id = 2030302049,
    talk_text = function()
      return T_S(20303020490)
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
    next_dialog = 2030302050,
    env_sound = 20005
  },
  [2030302050] = {
    id = 2030302050,
    talk_text = function()
      return T_S(20303020500)
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
    next_dialog = 2030302051,
    env_sound = 20005
  },
  [2030302051] = {
    id = 2030302051,
    talk_text = function()
      return T_S(20303020510)
    end,
    next_dialog = 2030302052,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020515)
    end,
    env_sound = 20005
  },
  [2030302052] = {
    id = 2030302052,
    talk_text = function()
      return T_S(20303020520)
    end,
    next_dialog = 2030302053,
    speak_head = 90120044,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020525)
    end,
    env_sound = 20005
  },
  [2030302053] = {
    id = 2030302053,
    talk_text = function()
      return T_S(20303020530)
    end,
    next_dialog = 2030302054,
    speak_head = 90120042,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020535)
    end,
    env_sound = 20005
  },
  [2030302054] = {
    id = 2030302054,
    talk_text = function()
      return T_S(20303020540)
    end,
    next_dialog = 2030302055,
    env_sound = 20005
  },
  [2030302055] = {
    id = 2030302055,
    talk_text = function()
      return T_S(20303020550)
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
    next_dialog = 2030302056,
    speak_name = function()
      return T_S(20303020555)
    end,
    env_sound = 20005
  },
  [2030302056] = {
    id = 2030302056,
    talk_text = function()
      return T_S(20303020560)
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
    next_dialog = 2030302057,
    env_sound = 20005
  },
  [2030302057] = {
    id = 2030302057,
    talk_text = function()
      return T_S(20303020570)
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
    next_dialog = 2030302058,
    speak_name = function()
      return T_S(20303020575)
    end,
    env_sound = 20005
  },
  [2030302058] = {
    id = 2030302058,
    talk_text = function()
      return T_S(20303020580)
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
    next_dialog = 2030302059,
    env_sound = 20005
  },
  [2030302059] = {
    id = 2030302059,
    talk_text = function()
      return T_S(20303020590)
    end,
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2030302060,
    speak_name = function()
      return T_S(20303020595)
    end,
    env_sound = 20005
  },
  [2030302060] = {
    id = 2030302060,
    talk_text = function()
      return T_S(20303020600)
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
    next_dialog = 2030302061,
    env_sound = 20005
  },
  [2030302061] = {
    id = 2030302061,
    talk_text = function()
      return T_S(20303020610)
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
    next_dialog = 2030302062,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20303020615)
    end,
    camera_shake = {
      "1",
      "0",
      "1200"
    },
    env_sound = 20005
  },
  [2030302062] = {
    id = 2030302062,
    talk_text = function()
      return T_S(20303020620)
    end,
    next_dialog = 2030302063,
    env_sound = 20005
  },
  [2030302063] = {
    id = 2030302063,
    talk_text = function()
      return T_S(20303020630)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030302063/2030302063_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030302063/2030302063_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-195:-980", "165:-1066"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030302064,
    speak_name = function()
      return T_S(20303020635)
    end,
    env_sound = 20005
  },
  [2030302064] = {
    id = 2030302064,
    talk_text = function()
      return T_S(20303020640)
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
    role_position = {"-195:-980", "165:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030302065,
    env_sound = 20005
  },
  [2030302065] = {
    id = 2030302065,
    talk_text = function()
      return T_S(20303020650)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030302065/2030302065_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2030302065/2030302065_90110002.playable"
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
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030302066,
    env_sound = 20005
  },
  [2030302066] = {
    id = 2030302066,
    talk_text = function()
      return T_S(20303020660)
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
    next_dialog = 2030302067,
    speak_name = function()
      return T_S(20303020665)
    end,
    env_sound = 20005
  },
  [2030302067] = {
    id = 2030302067,
    talk_text = function()
      return T_S(20303020670)
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
    next_dialog = 2030302068,
    speak_name = function()
      return T_S(20303020675)
    end,
    env_sound = 20005
  },
  [2030302068] = {
    id = 2030302068,
    talk_text = function()
      return T_S(20303020680)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030302069,
    env_sound = 20005
  },
  [2030302069] = {
    id = 2030302069,
    talk_text = function()
      return T_S(20303020690)
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
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030302070,
    env_sound = 20005
  },
  [2030302070] = {
    id = 2030302070,
    talk_text = function()
      return T_S(20303020700)
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
    role_position = {"-100:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030302071,
    speak_name = function()
      return T_S(20303020705)
    end,
    env_sound = 20005
  },
  [2030302071] = {
    id = 2030302071,
    talk_text = function()
      return T_S(20303020710)
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
    role_position = {"-100:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030302072,
    speak_name = function()
      return T_S(20303020715)
    end,
    env_sound = 20005
  },
  [2030302072] = {
    id = 2030302072,
    talk_text = function()
      return T_S(20303020720)
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
    role_position = {"-100:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2030302073,
    env_sound = 20005
  },
  [2030302073] = {
    id = 2030302073,
    talk_text = function()
      return T_S(20303020730)
    end,
    role_ids = {90110004},
    scale = {10000, 10000},
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
    next_dialog = 2030302074,
    speak_name = function()
      return T_S(20303020735)
    end,
    env_sound = 20005
  },
  [2030302074] = {
    id = 2030302074,
    talk_text = function()
      return T_S(20303020740)
    end,
    is_master = 0,
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
    next_dialog = 2030302075,
    speak_name = function()
      return T_S(20303020745)
    end,
    env_sound = 20005
  },
  [2030302075] = {
    id = 2030302075,
    talk_text = function()
      return T_S(20303020750)
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
    next_dialog = 2030302076,
    env_sound = 20005
  },
  [2030302076] = {
    id = 2030302076,
    talk_text = function()
      return T_S(20303020760)
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
    next_dialog = 2030302077,
    speak_name = function()
      return T_S(20303020765)
    end,
    env_sound = 20005
  },
  [2030302077] = {
    id = 2030302077,
    talk_text = function()
      return T_S(20303020770)
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
    next_dialog = 2030302078,
    env_sound = 20005
  },
  [2030302078] = {
    id = 2030302078,
    talk_text = function()
      return T_S(20303020780)
    end,
    role_ids = {90110028, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-282:-1122", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2030302079,
    speak_name = function()
      return T_S(20303020785)
    end,
    env_sound = 20005
  },
  [2030302079] = {
    id = 2030302079,
    talk_text = function()
      return T_S(20303020790)
    end,
    role_ids = {90110028, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110028/90110028_0.playable",
      ""
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110028/90110028_0.playable",
      ""
    },
    role_position = {"-282:-1122", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "180"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2030302080,
    speak_name = function()
      return T_S(20303020795)
    end,
    env_sound = 20005
  },
  [2030302080] = {
    id = 2030302080,
    talk_text = function()
      return T_S(20303020800)
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
    next_dialog = 2030302081,
    speak_name = function()
      return T_S(20303020805)
    end,
    env_sound = 20005
  },
  [2030302081] = {
    id = 2030302081,
    talk_text = function()
      return T_S(20303020810)
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
    next_dialog = 2030302082,
    env_sound = 20005
  },
  [2030302082] = {
    id = 2030302082,
    talk_text = function()
      return T_S(20303020820)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20303020825)
    end,
    env_sound = 20005
  }
}
