BasePlotDialogPart55000 = {
  [1110101001] = {
    id = 1110101001,
    talk_text = function()
      return T_S(11101010010)
    end,
    next_dialog = 1110101002,
    camera_scale = {
      "2",
      "0",
      "10500",
      "5000"
    },
    env_sound = 20001
  },
  [1110101002] = {
    id = 1110101002,
    talk_text = function()
      return T_S(11101010020)
    end,
    next_dialog = 1110101003,
    env_sound = 20001
  },
  [1110101003] = {
    id = 1110101003,
    talk_text = function()
      return T_S(11101010030)
    end,
    env_sound = 20001
  },
  [1110102001] = {
    id = 1110102001,
    talk_text = function()
      return T_S(11101020010)
    end,
    next_dialog = 1110102002,
    env_sound = 20001
  },
  [1110102002] = {
    id = 1110102002,
    talk_text = function()
      return T_S(11101020020)
    end,
    next_dialog = 1110102003,
    speak_head = 90120053,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11101020025)
    end,
    text_sound_path = "event:/voice_cn/story/S0074/S0074_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0074",
    env_sound = 20001
  },
  [1110102003] = {
    id = 1110102003,
    talk_text = function()
      return T_S(11101020030)
    end,
    next_dialog = 1110102004,
    env_sound = 20001
  },
  [1110102004] = {
    id = 1110102004,
    talk_text = function()
      return T_S(11101020040)
    end,
    next_dialog = 1110102005,
    speak_head = 90120053,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11101020045)
    end,
    text_sound_path = "event:/voice_cn/story/S0074/S0074_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0074",
    env_sound = 20001
  },
  [1110102005] = {
    id = 1110102005,
    talk_text = function()
      return T_S(11101020050)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110102005/1110102005_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"2"},
    effect_in_param = {"200"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110102006,
    speak_name = function()
      return T_S(11101020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00291",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20001
  },
  [1110102006] = {
    id = 1110102006,
    talk_text = function()
      return T_S(11101020060)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110102007,
    env_sound = 20001
  },
  [1110102007] = {
    id = 1110102007,
    talk_text = function()
      return T_S(11101020070)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110102008,
    speak_head = 90120053,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11101020075)
    end,
    text_sound_path = "event:/voice_cn/story/S0074/S0074_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0074",
    env_sound = 20001
  },
  [1110102008] = {
    id = 1110102008,
    talk_text = function()
      return T_S(11101020080)
    end,
    next_dialog = 1110102009,
    env_sound = 20001
  },
  [1110102009] = {
    id = 1110102009,
    talk_text = function()
      return T_S(11101020090)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110102009/1110102009_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"3"},
    effect_in_param = {"200"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110102010,
    speak_name = function()
      return T_S(11101020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00041",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20001
  },
  [1110102010] = {
    id = 1110102010,
    talk_text = function()
      return T_S(11101020100)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110102011,
    speak_head = 90120053,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11101020105)
    end,
    text_sound_path = "event:/voice_cn/story/S0074/S0074_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0074",
    env_sound = 20001
  },
  [1110102011] = {
    id = 1110102011,
    talk_text = function()
      return T_S(11101020110)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110102011/1110102011_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110102012,
    speak_name = function()
      return T_S(11101020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00042",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20001
  },
  [1110102012] = {
    id = 1110102012,
    talk_text = function()
      return T_S(11101020120)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110102013,
    speak_head = 90120053,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11101020125)
    end,
    text_sound_path = "event:/voice_cn/story/S0074/S0074_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0074",
    env_sound = 20001
  },
  [1110102013] = {
    id = 1110102013,
    talk_text = function()
      return T_S(11101020130)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110102014,
    env_sound = 20001
  },
  [1110102014] = {
    id = 1110102014,
    talk_text = function()
      return T_S(11101020140)
    end,
    is_master = 1,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110102015,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00421",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20001
  },
  [1110102015] = {
    id = 1110102015,
    talk_text = function()
      return T_S(11101020150)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"2"},
    effect_out_param = {"200"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110102016,
    env_sound = 20001
  },
  [1110102016] = {
    id = 1110102016,
    talk_text = function()
      return T_S(11101020160)
    end,
    speak_head = 90120053,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11101020165)
    end,
    text_sound_path = "event:/voice_cn/story/S0074/S0074_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0074",
    env_sound = 20001
  }
}
