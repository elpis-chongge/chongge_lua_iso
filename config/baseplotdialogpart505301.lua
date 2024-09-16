BasePlotDialogPart505301 = {
  [2010703001] = {
    id = 2010703001,
    talk_text = function()
      return T_S(20107030010)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2010703002,
    speak_name = function()
      return T_S(20107030015)
    end,
    env_sound = 20001
  },
  [2010703002] = {
    id = 2010703002,
    talk_text = function()
      return T_S(20107030020)
    end,
    next_dialog = 2010703003,
    env_sound = 20001
  },
  [2010703003] = {
    id = 2010703003,
    talk_text = function()
      return T_S(20107030030)
    end,
    next_dialog = 2010703004,
    env_sound = 20001
  },
  [2010703004] = {
    id = 2010703004,
    talk_text = function()
      return T_S(20107030040)
    end,
    is_master = 1,
    next_dialog = 2010703005,
    env_sound = 20001
  },
  [2010703005] = {
    id = 2010703005,
    talk_text = function()
      return T_S(20107030050)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703005/2010703005_90110020.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"0:-1077"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2010703006,
    speak_name = function()
      return T_S(20107030055)
    end,
    env_sound = 20001
  },
  [2010703006] = {
    id = 2010703006,
    talk_text = function()
      return T_S(20107030060)
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
    next_dialog = 2010703007,
    env_sound = 20001
  },
  [2010703007] = {
    id = 2010703007,
    talk_text = function()
      return T_S(20107030070)
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
    next_dialog = 2010703008,
    speak_name = function()
      return T_S(20107030075)
    end,
    env_sound = 20001
  },
  [2010703008] = {
    id = 2010703008,
    talk_text = function()
      return T_S(20107030080)
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
    next_dialog = 2010703009,
    env_sound = 20001
  },
  [2010703009] = {
    id = 2010703009,
    talk_text = function()
      return T_S(20107030090)
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
    next_dialog = 2010703010,
    env_sound = 20001
  },
  [2010703010] = {
    id = 2010703010,
    talk_text = function()
      return T_S(20107030100)
    end,
    is_master = 0,
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
    next_dialog = 2010703011,
    speak_name = function()
      return T_S(20107030105)
    end,
    env_sound = 20001
  },
  [2010703011] = {
    id = 2010703011,
    talk_text = function()
      return T_S(20107030110)
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
    effect_out = {"0", "2"},
    effect_out_param = {"0", "180"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703012,
    env_sound = 20001
  },
  [2010703012] = {
    id = 2010703012,
    talk_text = function()
      return T_S(20107030120)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703012/2010703012_90110020.playable"
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
    next_dialog = 2010703013,
    speak_name = function()
      return T_S(20107030125)
    end,
    env_sound = 20001
  },
  [2010703013] = {
    id = 2010703013,
    talk_text = function()
      return T_S(20107030130)
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
    next_dialog = 2010703014,
    env_sound = 20001
  },
  [2010703014] = {
    id = 2010703014,
    talk_text = function()
      return T_S(20107030140)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703014/2010703014_90110020.playable"
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
    next_dialog = 2010703015,
    speak_name = function()
      return T_S(20107030145)
    end,
    env_sound = 20001
  },
  [2010703015] = {
    id = 2010703015,
    talk_text = function()
      return T_S(20107030150)
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
    next_dialog = 2010703016,
    env_sound = 20001
  },
  [2010703016] = {
    id = 2010703016,
    talk_text = function()
      return T_S(20107030160)
    end,
    role_ids = {90110020},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703016/2010703016_90110020.playable"
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
    next_dialog = 2010703017,
    speak_name = function()
      return T_S(20107030165)
    end,
    env_sound = 20001
  },
  [2010703017] = {
    id = 2010703017,
    talk_text = function()
      return T_S(20107030170)
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
    next_dialog = 2010703018,
    speak_name = function()
      return T_S(20107030175)
    end,
    env_sound = 20001
  },
  [2010703018] = {
    id = 2010703018,
    talk_text = function()
      return T_S(20107030180)
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
    next_dialog = 2010703019,
    env_sound = 20001
  },
  [2010703019] = {
    id = 2010703019,
    talk_text = function()
      return T_S(20107030190)
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
    next_dialog = 2010703020,
    env_sound = 20001
  },
  [2010703020] = {
    id = 2010703020,
    talk_text = function()
      return T_S(20107030200)
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
    next_dialog = 2010703021,
    env_sound = 20001
  },
  [2010703021] = {
    id = 2010703021,
    talk_text = function()
      return T_S(20107030210)
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
    next_dialog = 2010703022,
    env_sound = 20001
  },
  [2010703022] = {
    id = 2010703022,
    talk_text = function()
      return T_S(20107030220)
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
    next_dialog = 2010703023,
    speak_name = function()
      return T_S(20107030225)
    end,
    env_sound = 20001
  },
  [2010703023] = {
    id = 2010703023,
    talk_text = function()
      return T_S(20107030230)
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
    next_dialog = 2010703024,
    env_sound = 20001
  },
  [2010703024] = {
    id = 2010703024,
    talk_text = function()
      return T_S(20107030240)
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
    next_dialog = 2010703025,
    env_sound = 20001
  },
  [2010703025] = {
    id = 2010703025,
    talk_text = function()
      return T_S(20107030250)
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
    next_dialog = 2010703026,
    env_sound = 20001
  },
  [2010703026] = {
    id = 2010703026,
    talk_text = function()
      return T_S(20107030260)
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
    next_dialog = 2010703027,
    speak_name = function()
      return T_S(20107030265)
    end,
    env_sound = 20001
  },
  [2010703027] = {
    id = 2010703027,
    talk_text = function()
      return T_S(20107030270)
    end,
    role_ids = {90110020},
    scale = {8000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"270:-888"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2010703028,
    env_sound = 20001
  },
  [2010703028] = {
    id = 2010703028,
    talk_text = function()
      return T_S(20107030280)
    end,
    role_ids = {90110020},
    scale = {8000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703028/2010703028_90110020.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable"
    },
    role_position = {"270:-888"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2010703029,
    speak_name = function()
      return T_S(20107030285)
    end,
    env_sound = 20001
  },
  [2010703029] = {
    id = 2010703029,
    talk_text = function()
      return T_S(20107030290)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2010703030,
    speak_name = function()
      return T_S(20107030295)
    end,
    env_sound = 20001
  },
  [2010703030] = {
    id = 2010703030,
    talk_text = function()
      return T_S(20107030300)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-120:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703031,
    env_sound = 20001
  },
  [2010703031] = {
    id = 2010703031,
    talk_text = function()
      return T_S(20107030310)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-120:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703032,
    env_sound = 20001
  },
  [2010703032] = {
    id = 2010703032,
    talk_text = function()
      return T_S(20107030320)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703032/2010703032_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-120:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2010703033,
    speak_name = function()
      return T_S(20107030325)
    end,
    env_sound = 20001
  },
  [2010703033] = {
    id = 2010703033,
    talk_text = function()
      return T_S(20107030330)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-120:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703034,
    env_sound = 20001
  },
  [2010703034] = {
    id = 2010703034,
    talk_text = function()
      return T_S(20107030340)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-270:-987"},
    role_shake = {"", "2:0:1200"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703035,
    env_sound = 20001
  },
  [2010703035] = {
    id = 2010703035,
    talk_text = function()
      return T_S(20107030350)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703036,
    env_sound = 20001
  },
  [2010703036] = {
    id = 2010703036,
    talk_text = function()
      return T_S(20107030360)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703037,
    env_sound = 20001
  },
  [2010703037] = {
    id = 2010703037,
    talk_text = function()
      return T_S(20107030370)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703038,
    env_sound = 20001
  },
  [2010703038] = {
    id = 2010703038,
    talk_text = function()
      return T_S(20107030380)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2010703039,
    speak_name = function()
      return T_S(20107030385)
    end,
    env_sound = 20001
  },
  [2010703039] = {
    id = 2010703039,
    talk_text = function()
      return T_S(20107030390)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-150:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2010703040,
    speak_name = function()
      return T_S(20107030395)
    end,
    env_sound = 20001
  },
  [2010703040] = {
    id = 2010703040,
    talk_text = function()
      return T_S(20107030400)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-150:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703041,
    env_sound = 20001
  },
  [2010703041] = {
    id = 2010703041,
    talk_text = function()
      return T_S(20107030410)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-150:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703042,
    env_sound = 20001
  },
  [2010703042] = {
    id = 2010703042,
    talk_text = function()
      return T_S(20107030420)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-150:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703043,
    env_sound = 20001
  },
  [2010703043] = {
    id = 2010703043,
    talk_text = function()
      return T_S(20107030430)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703043/2010703043_90110019.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"270:-888", "-150:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2010703044,
    speak_name = function()
      return T_S(20107030435)
    end,
    env_sound = 20001
  },
  [2010703044] = {
    id = 2010703044,
    talk_text = function()
      return T_S(20107030440)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"330:-888", "50:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703045,
    env_sound = 20001
  },
  [2010703045] = {
    id = 2010703045,
    talk_text = function()
      return T_S(20107030450)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703045/2010703045_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"330:-888", "50:-797"},
    role_shake = {"1:0:1200", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2010703046,
    speak_name = function()
      return T_S(20107030455)
    end,
    env_sound = 20001
  },
  [2010703046] = {
    id = 2010703046,
    talk_text = function()
      return T_S(20107030460)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703046/2010703046_90110019.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"330:-888", "50:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703047,
    env_sound = 20001
  },
  [2010703047] = {
    id = 2010703047,
    talk_text = function()
      return T_S(20107030470)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703047/2010703047_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"330:-888", "50:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2010703048,
    speak_name = function()
      return T_S(20107030475)
    end,
    env_sound = 20001
  },
  [2010703048] = {
    id = 2010703048,
    talk_text = function()
      return T_S(20107030480)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"330:-888", "50:-797"},
    role_shake = {"1:0:1100", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703049,
    env_sound = 20001
  },
  [2010703049] = {
    id = 2010703049,
    talk_text = function()
      return T_S(20107030490)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 8000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703049/2010703049_90110020.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"330:-888", "50:-797"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2010703050,
    speak_name = function()
      return T_S(20107030495)
    end,
    env_sound = 20001
  },
  [2010703050] = {
    id = 2010703050,
    talk_text = function()
      return T_S(20107030500)
    end,
    role_ids = {90110020, 90110019},
    scale = {8000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"330:-888", "-270:-987"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703051,
    env_sound = 20001
  },
  [2010703051] = {
    id = 2010703051,
    talk_text = function()
      return T_S(20107030510)
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
    next_dialog = 2010703052,
    env_sound = 20001
  },
  [2010703052] = {
    id = 2010703052,
    talk_text = function()
      return T_S(20107030520)
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
    next_dialog = 2010703053,
    env_sound = 20001
  },
  [2010703053] = {
    id = 2010703053,
    talk_text = function()
      return T_S(20107030530)
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
    next_dialog = 2010703054,
    speak_name = function()
      return T_S(20107030535)
    end,
    env_sound = 20001
  },
  [2010703054] = {
    id = 2010703054,
    talk_text = function()
      return T_S(20107030540)
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
    next_dialog = 2010703055,
    speak_name = function()
      return T_S(20107030545)
    end,
    env_sound = 20001
  },
  [2010703055] = {
    id = 2010703055,
    talk_text = function()
      return T_S(20107030550)
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
    next_dialog = 2010703056,
    env_sound = 20001
  },
  [2010703056] = {
    id = 2010703056,
    talk_text = function()
      return T_S(20107030560)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703056/2010703056_90110020.playable",
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
    next_dialog = 2010703057,
    speak_name = function()
      return T_S(20107030565)
    end,
    env_sound = 20001
  },
  [2010703057] = {
    id = 2010703057,
    talk_text = function()
      return T_S(20107030570)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703057/2010703057_90110020.playable",
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
    next_dialog = 2010703058,
    speak_name = function()
      return T_S(20107030575)
    end,
    env_sound = 20001
  },
  [2010703058] = {
    id = 2010703058,
    talk_text = function()
      return T_S(20107030580)
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
    next_dialog = 2010703059,
    speak_name = function()
      return T_S(20107030585)
    end,
    env_sound = 20001
  },
  [2010703059] = {
    id = 2010703059,
    talk_text = function()
      return T_S(20107030590)
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
    next_dialog = 2010703060,
    env_sound = 20001
  },
  [2010703060] = {
    id = 2010703060,
    talk_text = function()
      return T_S(20107030600)
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
    next_dialog = 2010703061,
    speak_name = function()
      return T_S(20107030605)
    end,
    env_sound = 20001
  },
  [2010703061] = {
    id = 2010703061,
    talk_text = function()
      return T_S(20107030610)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703061/2010703061_90110020.playable",
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
    next_dialog = 2010703062,
    speak_name = function()
      return T_S(20107030615)
    end,
    env_sound = 20001
  },
  [2010703062] = {
    id = 2010703062,
    talk_text = function()
      return T_S(20107030620)
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
    next_dialog = 2010703063,
    speak_name = function()
      return T_S(20107030625)
    end,
    env_sound = 20001
  },
  [2010703063] = {
    id = 2010703063,
    talk_text = function()
      return T_S(20107030630)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703063/2010703063_90110020.playable",
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
    next_dialog = 2010703064,
    speak_name = function()
      return T_S(20107030635)
    end,
    env_sound = 20001
  },
  [2010703064] = {
    id = 2010703064,
    talk_text = function()
      return T_S(20107030640)
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
    next_dialog = 2010703065,
    env_sound = 20001
  },
  [2010703065] = {
    id = 2010703065,
    talk_text = function()
      return T_S(20107030650)
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
    next_dialog = 2010703066,
    speak_name = function()
      return T_S(20107030655)
    end,
    env_sound = 20001
  },
  [2010703066] = {
    id = 2010703066,
    talk_text = function()
      return T_S(20107030660)
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
    next_dialog = 2010703067,
    env_sound = 20001
  },
  [2010703067] = {
    id = 2010703067,
    talk_text = function()
      return T_S(20107030670)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703067/2010703067_90110019.playable"
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
    next_dialog = 2010703068,
    env_sound = 20001
  },
  [2010703068] = {
    id = 2010703068,
    talk_text = function()
      return T_S(20107030680)
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
    next_dialog = 2010703069,
    speak_name = function()
      return T_S(20107030685)
    end,
    env_sound = 20001
  },
  [2010703069] = {
    id = 2010703069,
    talk_text = function()
      return T_S(20107030690)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703069/2010703069_90110020.playable",
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
    next_dialog = 2010703070,
    speak_name = function()
      return T_S(20107030695)
    end,
    env_sound = 20001
  },
  [2010703070] = {
    id = 2010703070,
    talk_text = function()
      return T_S(20107030700)
    end,
    is_master = 1,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110020/90110020_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703070/2010703070_90110019.playable"
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
    next_dialog = 2010703071,
    env_sound = 20001
  },
  [2010703071] = {
    id = 2010703071,
    talk_text = function()
      return T_S(20107030710)
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
    next_dialog = 2010703072,
    speak_name = function()
      return T_S(20107030715)
    end,
    env_sound = 20001
  },
  [2010703072] = {
    id = 2010703072,
    talk_text = function()
      return T_S(20107030720)
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
    next_dialog = 2010703073,
    env_sound = 20001
  },
  [2010703073] = {
    id = 2010703073,
    talk_text = function()
      return T_S(20107030730)
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
    next_dialog = 2010703074,
    speak_name = function()
      return T_S(20107030735)
    end,
    env_sound = 20001
  },
  [2010703074] = {
    id = 2010703074,
    talk_text = function()
      return T_S(20107030740)
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
    next_dialog = 2010703075,
    env_sound = 20001
  },
  [2010703075] = {
    id = 2010703075,
    talk_text = function()
      return T_S(20107030750)
    end,
    role_ids = {90110020, 90110019},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703075/2010703075_90110020.playable",
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
    next_dialog = 2010703076,
    speak_name = function()
      return T_S(20107030755)
    end,
    env_sound = 20001
  },
  [2010703076] = {
    id = 2010703076,
    talk_text = function()
      return T_S(20107030760)
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
    effect_out = {"3", "0"},
    effect_out_param = {"180", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2010703077,
    env_sound = 20001
  },
  [2010703077] = {
    id = 2010703077,
    talk_text = function()
      return T_S(20107030770)
    end,
    role_ids = {90110019},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703077/2010703077_90110019.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"-135:-987"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2010703078,
    speak_name = function()
      return T_S(20107030775)
    end,
    env_sound = 20001
  },
  [2010703078] = {
    id = 2010703078,
    talk_text = function()
      return T_S(20107030780)
    end,
    is_master = 1,
    role_ids = {90110019},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110019/90110019_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"0:-987"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2010703079,
    env_sound = 20001
  },
  [2010703079] = {
    id = 2010703079,
    talk_text = function()
      return T_S(20107030790)
    end,
    role_ids = {90110019},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2010703079/2010703079_90110019.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110019/90110019_0.playable"
    },
    role_position = {"0:-987"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20107030795)
    end,
    env_sound = 20001
  }
}
