BasePlotDialogPart50001 = {
  [1100103001] = {
    id = 1100103001,
    talk_text = function()
      return T_S(11001030010)
    end,
    next_dialog = 1100103002,
    env_sound = 20008
  },
  [1100103002] = {
    id = 1100103002,
    talk_text = function()
      return T_S(11001030020)
    end,
    next_dialog = 1100103003,
    env_sound = 20008
  },
  [1100103003] = {
    id = 1100103003,
    talk_text = function()
      return T_S(11001030030)
    end,
    next_dialog = 1100103004,
    speak_head = 90120043,
    speak_head_actions = {
      "idle",
      "talk",
      "blink"
    },
    speak_name = function()
      return T_S(11001030035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00442_01",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20008
  },
  [1100103004] = {
    id = 1100103004,
    talk_text = function()
      return T_S(11001030040)
    end,
    next_dialog = 1100103005,
    speak_head = 90120043,
    speak_head_actions = {
      "idle",
      "talk",
      "blink"
    },
    speak_name = function()
      return T_S(11001030045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00442_02",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20008
  },
  [1100103005] = {
    id = 1100103005,
    talk_text = function()
      return T_S(11001030050)
    end,
    next_dialog = 1100103006,
    speak_head = 90120043,
    speak_head_actions = {
      "idle",
      "talk",
      "blink"
    },
    speak_name = function()
      return T_S(11001030055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00442_03",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20008
  },
  [1100103006] = {
    id = 1100103006,
    cg_text = function()
      return T_S(11001030067)
    end,
    cg_position_scale = "-90:-50:8400",
    next_dialog = 1100103007,
    speak_name = function()
      return T_S(11001030065)
    end,
    text_sound_path = "event:/voice_cn/story/M0007/M0007_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/M0007",
    env_sound = 20008,
    review_head = "90120003"
  },
  [1100103007] = {
    id = 1100103007,
    talk_text = function()
      return T_S(11001030070)
    end,
    env_sound = 20008
  },
  [1100104001] = {
    id = 1100104001,
    talk_text = function()
      return T_S(11001040010)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100104001/1100104001_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100104002,
    speak_name = function()
      return T_S(11001040015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00443",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20005
  },
  [1100104002] = {
    id = 1100104002,
    talk_text = function()
      return T_S(11001040020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100104002/1100104002_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100104003,
    speak_name = function()
      return T_S(11001040025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00444",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20005
  },
  [1100104003] = {
    id = 1100104003,
    talk_text = function()
      return T_S(11001040030)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100104003/1100104003_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100104004,
    speak_name = function()
      return T_S(11001040035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00445",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20005
  },
  [1100104004] = {
    id = 1100104004,
    talk_text = function()
      return T_S(11001040040)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100104004/1100104004_90110003.playable"
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
    next_dialog = 1100104005,
    speak_name = function()
      return T_S(11001040045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00446",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20005
  },
  [1100104005] = {
    id = 1100104005,
    talk_text = function()
      return T_S(11001040050)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100104005/1100104005_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"1:300:1500"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100104006,
    env_sound = 20005
  },
  [1100104006] = {
    id = 1100104006,
    talk_text = function()
      return T_S(11001040060)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100104006/1100104006_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100104007,
    env_sound = 20005
  },
  [1100104007] = {
    id = 1100104007,
    talk_text = function()
      return T_S(11001040070)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100104007/1100104007_90110003.playable"
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
    speak_name = function()
      return T_S(11001040075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00447",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20005
  }
}
