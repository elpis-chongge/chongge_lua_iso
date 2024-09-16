BasePlotDialogPart504950 = {
  [2010001001] = {
    id = 2010001001,
    talk_text = function()
      return T_S(20100010010)
    end,
    next_dialog = 2010001003,
    env_sound = 20002
  },
  [2010001003] = {
    id = 2010001003,
    talk_text = function()
      return T_S(20100010030)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001003/2010001003_90110003.playable"
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
    next_dialog = 2010001004,
    speak_name = function()
      return T_S(20100010035)
    end,
    env_sound = 20002
  },
  [2010001004] = {
    id = 2010001004,
    talk_text = function()
      return T_S(20100010040)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001004/2010001004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001004/2010001004_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2010001005,
    speak_name = function()
      return T_S(20100010045)
    end,
    env_sound = 20002
  },
  [2010001005] = {
    id = 2010001005,
    talk_text = function()
      return T_S(20100010050)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001005/2010001005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001005/2010001005_90110002.playable"
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
    next_dialog = 2010001006,
    speak_name = function()
      return T_S(20100010055)
    end,
    env_sound = 20002
  },
  [2010001006] = {
    id = 2010001006,
    talk_text = function()
      return T_S(20100010060)
    end,
    is_master = 1,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001006/2010001006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001006/2010001006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "250"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010001007,
    env_sound = 20002
  },
  [2010001007] = {
    id = 2010001007,
    talk_text = function()
      return T_S(20100010070)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001007/2010001007_90110003.playable"
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
    next_dialog = 2010001008,
    speak_name = function()
      return T_S(20100010075)
    end,
    env_sound = 20002
  },
  [2010001008] = {
    id = 2010001008,
    talk_text = function()
      return T_S(20100010080)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001008/2010001008_90110003.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 2010001009,
    speak_name = function()
      return T_S(20100010085)
    end,
    env_sound = 20002
  },
  [2010001009] = {
    id = 2010001009,
    talk_text = function()
      return T_S(20100010090)
    end,
    is_master = 1,
    scale = {10000},
    next_dialog = 2010001010,
    env_sound = 20002
  },
  [2010001010] = {
    id = 2010001010,
    talk_text = function()
      return T_S(20100010100)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001010/2010001010_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2010001011,
    speak_name = function()
      return T_S(20100010105)
    end,
    env_sound = 20002
  },
  [2010001011] = {
    id = 2010001011,
    talk_text = function()
      return T_S(20100010110)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001011/2010001011_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001011/2010001011_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"222:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2010001012,
    speak_name = function()
      return T_S(20100010115)
    end,
    env_sound = 20002
  },
  [2010001012] = {
    id = 2010001012,
    talk_text = function()
      return T_S(20100010120)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001012/2010001012_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001012/2010001012_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"222:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2010001013,
    speak_name = function()
      return T_S(20100010125)
    end,
    env_sound = 20002
  },
  [2010001013] = {
    id = 2010001013,
    talk_text = function()
      return T_S(20100010130)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001013/2010001013_90110001.playable"
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
    next_dialog = 2010001014,
    speak_name = function()
      return T_S(20100010135)
    end,
    env_sound = 20002
  },
  [2010001014] = {
    id = 2010001014,
    talk_text = function()
      return T_S(20100010140)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001014/2010001014_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-1066"},
    effect_in = {"3"},
    effect_in_param = {"240"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2010001015,
    speak_name = function()
      return T_S(20100010145)
    end,
    env_sound = 20002
  },
  [2010001015] = {
    id = 2010001015,
    talk_text = function()
      return T_S(20100010150)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001015/2010001015_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001015/2010001015_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
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
    next_dialog = 2010001016,
    speak_name = function()
      return T_S(20100010155)
    end,
    env_sound = 20002
  },
  [2010001016] = {
    id = 2010001016,
    talk_text = function()
      return T_S(20100010160)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001016/2010001016_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2010001017,
    speak_name = function()
      return T_S(20100010165)
    end,
    env_sound = 20002
  },
  [2010001017] = {
    id = 2010001017,
    talk_text = function()
      return T_S(20100010170)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001017/2010001017_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2010001018,
    env_sound = 20002
  },
  [2010001018] = {
    id = 2010001018,
    talk_text = function()
      return T_S(20100010180)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001018/2010001018_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001018/2010001018_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
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
    next_dialog = 2010001019,
    speak_name = function()
      return T_S(20100010185)
    end,
    env_sound = 20002
  },
  [2010001019] = {
    id = 2010001019,
    talk_text = function()
      return T_S(20100010190)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001019/2010001019_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001019/2010001019_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
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
    next_dialog = 2010001020,
    speak_name = function()
      return T_S(20100010195)
    end,
    env_sound = 20002
  },
  [2010001020] = {
    id = 2010001020,
    talk_text = function()
      return T_S(20100010200)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001020/2010001020_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001020/2010001020_90110003.playable"
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
    next_dialog = 2010001021,
    speak_name = function()
      return T_S(20100010205)
    end,
    env_sound = 20002
  },
  [2010001021] = {
    id = 2010001021,
    talk_text = function()
      return T_S(20100010210)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001021/2010001021_90110001.playable"
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
    next_dialog = 2010001022,
    speak_name = function()
      return T_S(20100010215)
    end,
    env_sound = 20002
  },
  [2010001022] = {
    id = 2010001022,
    talk_text = function()
      return T_S(20100010220)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001022/2010001022_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001022/2010001022_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1000", "242:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2010001023,
    speak_name = function()
      return T_S(20100010225)
    end,
    env_sound = 20002
  },
  [2010001023] = {
    id = 2010001023,
    talk_text = function()
      return T_S(20100010230)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010001023/2010001023_90110002.playable"
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
      return T_S(20100010235)
    end,
    env_sound = 20002
  }
}
