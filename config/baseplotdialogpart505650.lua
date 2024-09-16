BasePlotDialogPart505650 = {
  [2011401001] = {
    id = 2011401001,
    talk_text = function()
      return T_S(20114010010)
    end,
    next_dialog = 2011401002,
    speak_name = function()
      return T_S(20114010015)
    end,
    camera_shake = {
      "1",
      "0",
      "1600"
    },
    env_sound = 20006,
    review_head = "90120001",
    open_title_1 = function()
      return T_S(20114010018)
    end,
    open_title_2 = function()
      return T_S(20114010019)
    end,
    top_effect = {"", "0"}
  },
  [2011401002] = {
    id = 2011401002,
    talk_text = function()
      return T_S(20114010020)
    end,
    next_dialog = 2011401003,
    env_sound = 20006
  },
  [2011401003] = {
    id = 2011401003,
    talk_text = function()
      return T_S(20114010030)
    end,
    is_master = 1,
    next_dialog = 2011401004,
    env_sound = 20006
  },
  [2011401004] = {
    id = 2011401004,
    talk_text = function()
      return T_S(20114010040)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011401004/2011401004_90110020.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2011401005,
    speak_name = function()
      return T_S(20114010045)
    end,
    env_sound = 20006
  },
  [2011401005] = {
    id = 2011401005,
    talk_text = function()
      return T_S(20114010050)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2011401006,
    env_sound = 20006
  },
  [2011401006] = {
    id = 2011401006,
    talk_text = function()
      return T_S(20114010060)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011401006/2011401006_90110020.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2011401007,
    speak_name = function()
      return T_S(20114010065)
    end,
    env_sound = 20006
  },
  [2011401007] = {
    id = 2011401007,
    talk_text = function()
      return T_S(20114010070)
    end,
    is_master = 1,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2011401008,
    env_sound = 20006
  },
  [2011401008] = {
    id = 2011401008,
    talk_text = function()
      return T_S(20114010080)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011401008/2011401008_90110020.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2011401009,
    env_sound = 20006
  },
  [2011401009] = {
    id = 2011401009,
    talk_text = function()
      return T_S(20114010090)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011401010,
    speak_name = function()
      return T_S(20114010095)
    end,
    env_sound = 20006
  },
  [2011401010] = {
    id = 2011401010,
    talk_text = function()
      return T_S(20114010100)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011401011,
    env_sound = 20006
  },
  [2011401011] = {
    id = 2011401011,
    talk_text = function()
      return T_S(20114010110)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011401012,
    speak_name = function()
      return T_S(20114010115)
    end,
    env_sound = 20006
  },
  [2011401012] = {
    id = 2011401012,
    talk_text = function()
      return T_S(20114010120)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011401013,
    speak_name = function()
      return T_S(20114010125)
    end,
    env_sound = 20006
  },
  [2011401013] = {
    id = 2011401013,
    talk_text = function()
      return T_S(20114010130)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011401014,
    speak_name = function()
      return T_S(20114010135)
    end,
    env_sound = 20006
  },
  [2011401014] = {
    id = 2011401014,
    talk_text = function()
      return T_S(20114010140)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011401015,
    speak_name = function()
      return T_S(20114010145)
    end,
    env_sound = 20006
  },
  [2011401015] = {
    id = 2011401015,
    talk_text = function()
      return T_S(20114010150)
    end,
    next_dialog = 2011401016,
    env_sound = 20006
  },
  [2011401016] = {
    id = 2011401016,
    talk_text = function()
      return T_S(20114010160)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2011401017,
    speak_name = function()
      return T_S(20114010165)
    end,
    env_sound = 20006
  },
  [2011401017] = {
    id = 2011401017,
    talk_text = function()
      return T_S(20114010170)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2011401018,
    speak_name = function()
      return T_S(20114010175)
    end,
    env_sound = 20006
  },
  [2011401018] = {
    id = 2011401018,
    talk_text = function()
      return T_S(20114010180)
    end,
    is_master = 1,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2011401019,
    env_sound = 20006
  },
  [2011401019] = {
    id = 2011401019,
    talk_text = function()
      return T_S(20114010190)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011401020,
    speak_name = function()
      return T_S(20114010195)
    end,
    env_sound = 20006
  },
  [2011401020] = {
    id = 2011401020,
    talk_text = function()
      return T_S(20114010200)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011401021,
    speak_name = function()
      return T_S(20114010205)
    end,
    env_sound = 20006
  },
  [2011401021] = {
    id = 2011401021,
    talk_text = function()
      return T_S(20114010210)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011401022,
    env_sound = 20006
  },
  [2011401022] = {
    id = 2011401022,
    talk_text = function()
      return T_S(20114010220)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011401023,
    speak_name = function()
      return T_S(20114010225)
    end,
    env_sound = 20006
  },
  [2011401023] = {
    id = 2011401023,
    talk_text = function()
      return T_S(20114010230)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    env_sound = 20006
  },
  [2011402001] = {
    id = 2011402001,
    talk_text = function()
      return T_S(20114020010)
    end,
    next_dialog = 2011402002,
    env_sound = 20002
  },
  [2011402002] = {
    id = 2011402002,
    talk_text = function()
      return T_S(20114020020)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402003,
    speak_name = function()
      return T_S(20114020025)
    end,
    env_sound = 20002
  },
  [2011402003] = {
    id = 2011402003,
    talk_text = function()
      return T_S(20114020030)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011402004,
    speak_name = function()
      return T_S(20114020035)
    end,
    env_sound = 20002
  },
  [2011402004] = {
    id = 2011402004,
    talk_text = function()
      return T_S(20114020040)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402005,
    env_sound = 20002
  },
  [2011402005] = {
    id = 2011402005,
    talk_text = function()
      return T_S(20114020050)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402006,
    env_sound = 20002
  },
  [2011402006] = {
    id = 2011402006,
    talk_text = function()
      return T_S(20114020060)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402007,
    env_sound = 20002
  },
  [2011402007] = {
    id = 2011402007,
    talk_text = function()
      return T_S(20114020070)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402008,
    speak_name = function()
      return T_S(20114020075)
    end,
    env_sound = 20002
  },
  [2011402008] = {
    id = 2011402008,
    talk_text = function()
      return T_S(20114020080)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402009,
    speak_name = function()
      return T_S(20114020085)
    end,
    env_sound = 20002
  },
  [2011402009] = {
    id = 2011402009,
    talk_text = function()
      return T_S(20114020090)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402010,
    env_sound = 20002
  },
  [2011402010] = {
    id = 2011402010,
    talk_text = function()
      return T_S(20114020100)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011402010/2011402010_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402011,
    speak_name = function()
      return T_S(20114020105)
    end,
    env_sound = 20002
  },
  [2011402011] = {
    id = 2011402011,
    talk_text = function()
      return T_S(20114020110)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402012,
    env_sound = 20002
  },
  [2011402012] = {
    id = 2011402012,
    talk_text = function()
      return T_S(20114020120)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402013,
    speak_name = function()
      return T_S(20114020125)
    end,
    env_sound = 20002
  },
  [2011402013] = {
    id = 2011402013,
    talk_text = function()
      return T_S(20114020130)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402014,
    env_sound = 20002
  },
  [2011402014] = {
    id = 2011402014,
    talk_text = function()
      return T_S(20114020140)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011402015,
    speak_name = function()
      return T_S(20114020145)
    end,
    env_sound = 20002
  },
  [2011402015] = {
    id = 2011402015,
    talk_text = function()
      return T_S(20114020150)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 12000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-1187"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402016,
    env_sound = 20002
  },
  [2011402016] = {
    id = 2011402016,
    talk_text = function()
      return T_S(20114020160)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 12000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-1187"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 2011402017,
    env_sound = 20002
  },
  [2011402017] = {
    id = 2011402017,
    talk_text = function()
      return T_S(20114020170)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 12000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011402017/2011402017_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-1187"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402018,
    env_sound = 20002
  },
  [2011402018] = {
    id = 2011402018,
    talk_text = function()
      return T_S(20114020180)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 12000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-1187"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402019,
    speak_name = function()
      return T_S(20114020185)
    end,
    env_sound = 20002
  },
  [2011402019] = {
    id = 2011402019,
    talk_text = function()
      return T_S(20114020190)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011402020,
    speak_name = function()
      return T_S(20114020195)
    end,
    env_sound = 20002
  },
  [2011402020] = {
    id = 2011402020,
    talk_text = function()
      return T_S(20114020200)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011402020/2011402020_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402021,
    env_sound = 20002
  },
  [2011402021] = {
    id = 2011402021,
    talk_text = function()
      return T_S(20114020210)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402022,
    env_sound = 20002
  },
  [2011402022] = {
    id = 2011402022,
    talk_text = function()
      return T_S(20114020220)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011402022/2011402022_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402023,
    speak_name = function()
      return T_S(20114020225)
    end,
    env_sound = 20002
  },
  [2011402023] = {
    id = 2011402023,
    talk_text = function()
      return T_S(20114020230)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011402023/2011402023_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402024,
    speak_name = function()
      return T_S(20114020235)
    end,
    env_sound = 20002
  },
  [2011402024] = {
    id = 2011402024,
    talk_text = function()
      return T_S(20114020240)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011402025,
    speak_name = function()
      return T_S(20114020245)
    end,
    env_sound = 20002
  },
  [2011402025] = {
    id = 2011402025,
    talk_text = function()
      return T_S(20114020250)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011402025/2011402025_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402026,
    speak_name = function()
      return T_S(20114020255)
    end,
    env_sound = 20002
  },
  [2011402026] = {
    id = 2011402026,
    talk_text = function()
      return T_S(20114020260)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402027,
    env_sound = 20002
  },
  [2011402027] = {
    id = 2011402027,
    talk_text = function()
      return T_S(20114020270)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402028,
    speak_name = function()
      return T_S(20114020275)
    end,
    env_sound = 20002
  },
  [2011402028] = {
    id = 2011402028,
    talk_text = function()
      return T_S(20114020280)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402029,
    env_sound = 20002
  },
  [2011402029] = {
    id = 2011402029,
    talk_text = function()
      return T_S(20114020290)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011402030,
    speak_name = function()
      return T_S(20114020295)
    end,
    env_sound = 20002
  },
  [2011402030] = {
    id = 2011402030,
    talk_text = function()
      return T_S(20114020300)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402031,
    env_sound = 20002
  },
  [2011402031] = {
    id = 2011402031,
    talk_text = function()
      return T_S(20114020310)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402032,
    speak_name = function()
      return T_S(20114020315)
    end,
    env_sound = 20002
  },
  [2011402032] = {
    id = 2011402032,
    talk_text = function()
      return T_S(20114020320)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402033,
    env_sound = 20002
  },
  [2011402033] = {
    id = 2011402033,
    talk_text = function()
      return T_S(20114020330)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2011402034,
    speak_name = function()
      return T_S(20114020335)
    end,
    env_sound = 20002
  },
  [2011402034] = {
    id = 2011402034,
    talk_text = function()
      return T_S(20114020340)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011402034/2011402034_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402035,
    speak_name = function()
      return T_S(20114020345)
    end,
    env_sound = 20002
  },
  [2011402035] = {
    id = 2011402035,
    talk_text = function()
      return T_S(20114020350)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2011402036,
    env_sound = 20002
  },
  [2011402036] = {
    id = 2011402036,
    talk_text = function()
      return T_S(20114020360)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2011402036/2011402036_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2011402037,
    speak_name = function()
      return T_S(20114020365)
    end,
    env_sound = 20002
  },
  [2011402037] = {
    id = 2011402037,
    talk_text = function()
      return T_S(20114020370)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-1077", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    env_sound = 20002
  }
}
