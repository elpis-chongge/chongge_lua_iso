BasePlotDialogPart40000 = {
  [1080101001] = {
    id = 1080101001,
    talk_text = function()
      return T_S(10801010010)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101001/1080101001_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080101002,
    speak_name = function()
      return T_S(10801010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00235",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080101002] = {
    id = 1080101002,
    talk_text = function()
      return T_S(10801010020)
    end,
    role_ids = {90110004, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101002/1080101002_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101002/1080101002_90110009.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-300:-1160", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080101003,
    speak_name = function()
      return T_S(10801010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00098",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20007
  },
  [1080101003] = {
    id = 1080101003,
    talk_text = function()
      return T_S(10801010030)
    end,
    is_master = 1,
    role_ids = {90110004, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101003/1080101003_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101003/1080101003_90110009.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-300:-1160", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1080101004,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00243",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20007
  },
  [1080101004] = {
    id = 1080101004,
    talk_text = function()
      return T_S(10801010040)
    end,
    next_dialog = 1080101005,
    env_sound = 20007
  },
  [1080101005] = {
    id = 1080101005,
    talk_text = function()
      return T_S(10801010050)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101005/1080101005_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080101006,
    speak_name = function()
      return T_S(10801010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00236",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080101006] = {
    id = 1080101006,
    talk_text = function()
      return T_S(10801010060)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101006/1080101006_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1080101007,
    speak_head = 90120033,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10801010065)
    end,
    text_sound_path = "event:/voice_cn/story/S0030/S0030_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0030",
    env_sound = 20007
  },
  [1080101007] = {
    id = 1080101007,
    talk_text = function()
      return T_S(10801010070)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101007/1080101007_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080101008,
    speak_name = function()
      return T_S(10801010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00237",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080101008] = {
    id = 1080101008,
    talk_text = function()
      return T_S(10801010080)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101008/1080101008_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1080101009,
    speak_head = 90120033,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10801010085)
    end,
    text_sound_path = "event:/voice_cn/story/S0030/S0030_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0030",
    env_sound = 20007
  },
  [1080101009] = {
    id = 1080101009,
    talk_text = function()
      return T_S(10801010090)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101009/1080101009_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101009/1080101009_90110001.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-1160", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080101010,
    speak_name = function()
      return T_S(10801010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00220",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20007
  },
  [1080101010] = {
    id = 1080101010,
    talk_text = function()
      return T_S(10801010100)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101010/1080101010_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101010/1080101010_90110001.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-1160", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1080101011,
    speak_head = 90120033,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10801010105)
    end,
    text_sound_path = "event:/voice_cn/story/S0030/S0030_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0030",
    env_sound = 20007
  },
  [1080101011] = {
    id = 1080101011,
    talk_text = function()
      return T_S(10801010110)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101011/1080101011_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080101011/1080101011_90110001.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-1160", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    speak_head = 90120033,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10801010115)
    end,
    text_sound_path = "event:/voice_cn/story/S0030/S0030_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0030",
    env_sound = 20007
  },
  [1080102001] = {
    id = 1080102001,
    talk_text = function()
      return T_S(10801020010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102001/1080102001_90110001.playable"
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
    next_dialog = 1080102002,
    speak_name = function()
      return T_S(10801020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00221",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20007
  },
  [1080102002] = {
    id = 1080102002,
    talk_text = function()
      return T_S(10801020020)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102002/1080102002_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102002/1080102002_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080102003,
    speak_name = function()
      return T_S(10801020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00251",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20007
  },
  [1080102003] = {
    id = 1080102003,
    talk_text = function()
      return T_S(10801020030)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102003/1080102003_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102003/1080102003_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080102004,
    speak_name = function()
      return T_S(10801020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00222",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20007
  },
  [1080102004] = {
    id = 1080102004,
    talk_text = function()
      return T_S(10801020040)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102004/1080102004_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102004/1080102004_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080102005,
    speak_name = function()
      return T_S(10801020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00252",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20007
  },
  [1080102005] = {
    id = 1080102005,
    talk_text = function()
      return T_S(10801020050)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102005/1080102005_90110002.playable"
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
    next_dialog = 1080102006,
    speak_name = function()
      return T_S(10801020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00169",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20007
  },
  [1080102006] = {
    id = 1080102006,
    talk_text = function()
      return T_S(10801020060)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102006/1080102006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102006/1080102006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"2", "0"},
    effect_in_param = {"180", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080102007,
    speak_name = function()
      return T_S(10801020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00253",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20007
  },
  [1080102007] = {
    id = 1080102007,
    talk_text = function()
      return T_S(10801020070)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102007/1080102007_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102007/1080102007_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080102008,
    speak_name = function()
      return T_S(10801020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00170",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20007
  },
  [1080102008] = {
    id = 1080102008,
    talk_text = function()
      return T_S(10801020080)
    end,
    is_master = 1,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102008/1080102008_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080102008/1080102008_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00244",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20007
  }
}
