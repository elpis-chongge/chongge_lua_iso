BasePlotDialogPart510150 = {
  [2020401001] = {
    id = 2020401001,
    talk_text = function()
      return T_S(20204010010)
    end,
    next_dialog = 2020401002,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010015)
    end,
    env_sound = 20002,
    open_title_1 = function()
      return T_S(20204010018)
    end,
    open_title_2 = function()
      return T_S(20204010019)
    end
  },
  [2020401002] = {
    id = 2020401002,
    talk_text = function()
      return T_S(20204010020)
    end,
    next_dialog = 2020401003,
    speak_head = 90120057,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010025)
    end,
    env_sound = 20002
  },
  [2020401003] = {
    id = 2020401003,
    talk_text = function()
      return T_S(20204010030)
    end,
    next_dialog = 2020401004,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010035)
    end,
    env_sound = 20002
  },
  [2020401004] = {
    id = 2020401004,
    talk_text = function()
      return T_S(20204010040)
    end,
    next_dialog = 2020401005,
    speak_head = 90120057,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010045)
    end,
    env_sound = 20002
  },
  [2020401005] = {
    id = 2020401005,
    talk_text = function()
      return T_S(20204010050)
    end,
    next_dialog = 2020401006,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010055)
    end,
    env_sound = 20002
  },
  [2020401006] = {
    id = 2020401006,
    talk_text = function()
      return T_S(20204010060)
    end,
    next_dialog = 2020401007,
    speak_head = 90120057,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010065)
    end,
    env_sound = 20002
  },
  [2020401007] = {
    id = 2020401007,
    talk_text = function()
      return T_S(20204010070)
    end,
    next_dialog = 2020401008,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010075)
    end,
    env_sound = 20002
  },
  [2020401008] = {
    id = 2020401008,
    talk_text = function()
      return T_S(20204010080)
    end,
    next_dialog = 2020401009,
    speak_head = 90120057,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010085)
    end,
    env_sound = 20002
  },
  [2020401009] = {
    id = 2020401009,
    talk_text = function()
      return T_S(20204010090)
    end,
    next_dialog = 2020401010,
    speak_head = 90120058,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010095)
    end,
    env_sound = 20002
  },
  [2020401010] = {
    id = 2020401010,
    talk_text = function()
      return T_S(20204010100)
    end,
    speak_head = 90120057,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20204010105)
    end,
    env_sound = 20002
  },
  [2020402001] = {
    id = 2020402001,
    talk_text = function()
      return T_S(20204020010)
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
    next_dialog = 2020402002,
    speak_name = function()
      return T_S(20204020015)
    end,
    env_sound = 20001
  },
  [2020402002] = {
    id = 2020402002,
    talk_text = function()
      return T_S(20204020020)
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
    next_dialog = 2020402003,
    speak_name = function()
      return T_S(20204020025)
    end,
    env_sound = 20001
  },
  [2020402003] = {
    id = 2020402003,
    talk_text = function()
      return T_S(20204020030)
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
    effect_out = {"2", "0"},
    effect_out_param = {"200", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020402004,
    speak_name = function()
      return T_S(20204020035)
    end,
    env_sound = 20001
  },
  [2020402004] = {
    id = 2020402004,
    talk_text = function()
      return T_S(20204020040)
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
    next_dialog = 2020402005,
    speak_name = function()
      return T_S(20204020045)
    end,
    env_sound = 20001
  },
  [2020402005] = {
    id = 2020402005,
    talk_text = function()
      return T_S(20204020050)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020402006,
    speak_name = function()
      return T_S(20204020055)
    end,
    env_sound = 20001
  },
  [2020402006] = {
    id = 2020402006,
    talk_text = function()
      return T_S(20204020060)
    end,
    is_master = 1,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020402007,
    env_sound = 20001
  },
  [2020402007] = {
    id = 2020402007,
    talk_text = function()
      return T_S(20204020070)
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
    next_dialog = 2020402008,
    speak_name = function()
      return T_S(20204020075)
    end,
    env_sound = 20001
  },
  [2020402008] = {
    id = 2020402008,
    talk_text = function()
      return T_S(20204020080)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_4.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020402009,
    speak_name = function()
      return T_S(20204020085)
    end,
    env_sound = 20001
  },
  [2020402009] = {
    id = 2020402009,
    talk_text = function()
      return T_S(20204020090)
    end,
    role_ids = {90110023, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-998", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020402010,
    speak_name = function()
      return T_S(20204020095)
    end,
    env_sound = 20001
  },
  [2020402010] = {
    id = 2020402010,
    talk_text = function()
      return T_S(20204020100)
    end,
    role_ids = {90110023, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-998", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020402011,
    speak_name = function()
      return T_S(20204020105)
    end,
    env_sound = 20001
  },
  [2020402011] = {
    id = 2020402011,
    talk_text = function()
      return T_S(20204020110)
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
    next_dialog = 2020402012,
    speak_name = function()
      return T_S(20204020115)
    end,
    env_sound = 20001
  },
  [2020402012] = {
    id = 2020402012,
    talk_text = function()
      return T_S(20204020120)
    end,
    role_ids = {90110023, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-998", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020402013,
    speak_name = function()
      return T_S(20204020125)
    end,
    env_sound = 20001
  },
  [2020402013] = {
    id = 2020402013,
    talk_text = function()
      return T_S(20204020130)
    end,
    role_ids = {90110023, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-998", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020402014,
    speak_name = function()
      return T_S(20204020135)
    end,
    env_sound = 20001
  },
  [2020402014] = {
    id = 2020402014,
    talk_text = function()
      return T_S(20204020140)
    end,
    role_ids = {90110023, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-998", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020402015,
    env_sound = 20001
  },
  [2020402015] = {
    id = 2020402015,
    talk_text = function()
      return T_S(20204020150)
    end,
    is_master = 1,
    role_ids = {90110023, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-998", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2020402016,
    env_sound = 20001
  },
  [2020402016] = {
    id = 2020402016,
    talk_text = function()
      return T_S(20204020160)
    end,
    role_ids = {90110023, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-998", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020402017,
    speak_name = function()
      return T_S(20204020165)
    end,
    env_sound = 20001
  },
  [2020402017] = {
    id = 2020402017,
    talk_text = function()
      return T_S(20204020170)
    end,
    is_master = 1,
    role_ids = {90110023, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-998", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 2020402018,
    env_sound = 20001
  },
  [2020402018] = {
    id = 2020402018,
    talk_text = function()
      return T_S(20204020180)
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
    next_dialog = 2020402019,
    speak_name = function()
      return T_S(20204020185)
    end,
    env_sound = 20001
  },
  [2020402019] = {
    id = 2020402019,
    talk_text = function()
      return T_S(20204020190)
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
    next_dialog = 2020402020,
    env_sound = 20001
  },
  [2020402020] = {
    id = 2020402020,
    talk_text = function()
      return T_S(20204020200)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2020402020/2020402020_90110002.playable"
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
    next_dialog = 2020402021,
    speak_name = function()
      return T_S(20204020205)
    end,
    env_sound = 20001
  },
  [2020402021] = {
    id = 2020402021,
    talk_text = function()
      return T_S(20204020210)
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
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2020402022,
    speak_name = function()
      return T_S(20204020215)
    end,
    env_sound = 20001
  },
  [2020402022] = {
    id = 2020402022,
    talk_text = function()
      return T_S(20204020220)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2020402023,
    speak_name = function()
      return T_S(20204020225)
    end,
    env_sound = 20001
  },
  [2020402023] = {
    id = 2020402023,
    talk_text = function()
      return T_S(20204020230)
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
    effect_out = {"3"},
    effect_out_param = {"180"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020402024,
    speak_name = function()
      return T_S(20204020235)
    end,
    env_sound = 20001
  },
  [2020402024] = {
    id = 2020402024,
    talk_text = function()
      return T_S(20204020240)
    end,
    next_dialog = 2020402025,
    env_sound = 20001
  },
  [2020402025] = {
    id = 2020402025,
    talk_text = function()
      return T_S(20204020250)
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
    effect_in = {"2"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2020402026,
    speak_name = function()
      return T_S(20204020255)
    end,
    env_sound = 20001
  },
  [2020402026] = {
    id = 2020402026,
    talk_text = function()
      return T_S(20204020260)
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
