BasePlotDialogPart5102 = {
  [1010305001] = {
    id = 1010305001,
    talk_text = function()
      return T_S(10103050010)
    end,
    role_ids = {90110015},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010305001/1010305001_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"0:-1100"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010305002,
    speak_name = function()
      return T_S(10103050015)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20006
  },
  [1010305002] = {
    id = 1010305002,
    talk_text = function()
      return T_S(10103050020)
    end,
    role_ids = {90110015, 90110016},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010305002/1010305002_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010305002/1010305002_90110016.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110016/90110016_0.playable"
    },
    role_position = {"-300:-1100", "300:-1130"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1010305003,
    env_sound = 20006
  },
  [1010305003] = {
    id = 1010305003,
    talk_text = function()
      return T_S(10103050030)
    end,
    role_ids = {90110015, 90110016},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010305003/1010305003_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010305003/1010305003_90110016.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110016/90110016_0.playable"
    },
    role_position = {"-300:-1100", "300:-1130"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010305004,
    speak_name = function()
      return T_S(10103050035)
    end,
    text_sound_path = "event:/voice_cn/story/M0005/M0005_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0005",
    env_sound = 20006
  },
  [1010305004] = {
    id = 1010305004,
    talk_text = function()
      return T_S(10103050040)
    end,
    role_ids = {90110015, 90110016},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010305004/1010305004_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010305004/1010305004_90110016.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110016/90110016_0.playable"
    },
    role_position = {"-300:-1100", "300:-1130"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010305005,
    speak_name = function()
      return T_S(10103050045)
    end,
    text_sound_path = "event:/voice_cn/story/M0005/M0005_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/M0005",
    env_sound = 20006
  },
  [1010305005] = {
    id = 1010305005,
    talk_text = function()
      return T_S(10103050050)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010305005/1010305005_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-50:-981"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    speak_name = function()
      return T_S(10103050055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20006,
    review_head = "90120001"
  }
}
