BasePlotDialogPart40151 = {
  [1080403001] = {
    id = 1080403001,
    talk_text = function()
      return T_S(10804030010)
    end,
    next_dialog = 1080403002,
    speak_head = 90120033,
    speak_head_actions = {
      "talk",
      "idle",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10804030015)
    end,
    text_sound_path = "event:/voice_cn/story/S0039/S0039_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0039",
    env_sound = 20004
  },
  [1080403002] = {
    id = 1080403002,
    talk_text = function()
      return T_S(10804030020)
    end,
    next_dialog = 1080403003,
    env_sound = 20004
  },
  [1080403003] = {
    id = 1080403003,
    talk_text = function()
      return T_S(10804030030)
    end,
    next_dialog = 1080403004,
    camera_shake = {
      "1",
      "0",
      "1000"
    },
    env_sound = 20004,
    special_sound = 23014,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_SingleSword.prefab",
      "0"
    }
  },
  [1080403004] = {
    id = 1080403004,
    talk_text = function()
      return T_S(10804030040)
    end,
    next_dialog = 1080403005,
    speak_head = 90120033,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804030045)
    end,
    text_sound_path = "event:/voice_cn/story/S0039/S0039_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0039",
    env_sound = 20004
  },
  [1080403005] = {
    id = 1080403005,
    talk_text = function()
      return T_S(10804030050)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403005/1080403005_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080403006,
    speak_name = function()
      return T_S(10804030055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00255",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20004
  },
  [1080403006] = {
    id = 1080403006,
    talk_text = function()
      return T_S(10804030060)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403006/1080403006_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403006/1080403006_90110001.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-1160", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080403007,
    speak_name = function()
      return T_S(10804030065)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00246",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20004
  },
  [1080403007] = {
    id = 1080403007,
    talk_text = function()
      return T_S(10804030070)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403007/1080403007_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403007/1080403007_90110001.playable"
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080403008,
    speak_name = function()
      return T_S(10804030075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00256",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20004
  },
  [1080403008] = {
    id = 1080403008,
    talk_text = function()
      return T_S(10804030080)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403008/1080403008_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403008/1080403008_90110001.playable"
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
    next_dialog = 1080403009,
    speak_head = 90120033,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804030085)
    end,
    text_sound_path = "event:/voice_cn/story/S0039/S0039_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0039",
    env_sound = 20004
  },
  [1080403009] = {
    id = 1080403009,
    talk_text = function()
      return T_S(10804030090)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403009/1080403009_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403009/1080403009_90110001.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-1160", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080403010,
    speak_name = function()
      return T_S(10804030095)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00247",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20004
  },
  [1080403010] = {
    id = 1080403010,
    talk_text = function()
      return T_S(10804030100)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403010/1080403010_90110002.playable"
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
    next_dialog = 1080403011,
    speak_name = function()
      return T_S(10804030105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00182",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20004
  },
  [1080403011] = {
    id = 1080403011,
    talk_text = function()
      return T_S(10804030110)
    end,
    next_dialog = 1080403012,
    env_sound = 20004
  },
  [1080403012] = {
    id = 1080403012,
    talk_text = function()
      return T_S(10804030120)
    end,
    next_dialog = 1080403013,
    speak_head = 90120033,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804030125)
    end,
    text_sound_path = "event:/voice_cn/story/S0039/S0039_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0039",
    env_sound = 20004
  },
  [1080403013] = {
    id = 1080403013,
    talk_text = function()
      return T_S(10804030130)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403013/1080403013_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403013/1080403013_90110001.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-1160", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080403014,
    speak_name = function()
      return T_S(10804030135)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00248",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20004
  },
  [1080403014] = {
    id = 1080403014,
    talk_text = function()
      return T_S(10804030140)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403014/1080403014_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403014/1080403014_90110001.playable"
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
    next_dialog = 1080403015,
    env_sound = 20004
  },
  [1080403015] = {
    id = 1080403015,
    talk_text = function()
      return T_S(10804030150)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403015/1080403015_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403015/1080403015_90110001.playable"
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
    next_dialog = 1080403016,
    speak_head = 90120033,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804030155)
    end,
    text_sound_path = "event:/voice_cn/story/S0039/S0039_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0039",
    env_sound = 20004
  },
  [1080403016] = {
    id = 1080403016,
    talk_text = function()
      return T_S(10804030160)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403016/1080403016_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403016/1080403016_90110001.playable"
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
    next_dialog = 1080403017,
    speak_head = 90120033,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804030165)
    end,
    text_sound_path = "event:/voice_cn/story/S0039/S0039_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0039",
    env_sound = 20004
  },
  [1080403017] = {
    id = 1080403017,
    talk_text = function()
      return T_S(10804030170)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403017/1080403017_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403017/1080403017_90110001.playable"
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
    next_dialog = 1080403018,
    speak_head = 90120033,
    speak_head_actions = {
      "blink",
      "talk",
      "idle"
    },
    speak_name = function()
      return T_S(10804030175)
    end,
    text_sound_path = "event:/voice_cn/story/S0039/S0039_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0039",
    env_sound = 20004
  },
  [1080403018] = {
    id = 1080403018,
    talk_text = function()
      return T_S(10804030180)
    end,
    next_dialog = 1080403019,
    env_sound = 20004
  },
  [1080403019] = {
    id = 1080403019,
    talk_text = function()
      return T_S(10804030190)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403019/1080403019_90110002.playable"
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
    next_dialog = 1080403020,
    speak_name = function()
      return T_S(10804030195)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00183",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20004
  },
  [1080403020] = {
    id = 1080403020,
    talk_text = function()
      return T_S(10804030200)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403020/1080403020_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080403020/1080403020_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10804030205)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00249",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20004
  },
  [1080404001] = {
    id = 1080404001,
    talk_text = function()
      return T_S(10804040010)
    end,
    scale = {10000},
    next_dialog = 1080404002,
    env_sound = 20003
  },
  [1080404002] = {
    id = 1080404002,
    talk_text = function()
      return T_S(10804040020)
    end,
    scale = {10000},
    next_dialog = 1080404003,
    env_sound = 20003
  },
  [1080404003] = {
    id = 1080404003,
    talk_text = function()
      return T_S(10804040030)
    end,
    next_dialog = 1080404004,
    speak_head = 90120023,
    speak_head_actions = {
      "talk",
      "idle",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10804040035)
    end,
    text_sound_path = "event:/voice_cn/story/S0040/S0040_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0040",
    env_sound = 20003
  },
  [1080404004] = {
    id = 1080404004,
    talk_text = function()
      return T_S(10804040040)
    end,
    next_dialog = 1080404005,
    env_sound = 20003
  },
  [1080404005] = {
    id = 1080404005,
    talk_text = function()
      return T_S(10804040050)
    end,
    next_dialog = 1080404006,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10804040055)
    end,
    text_sound_path = "event:/voice_cn/story/S0036/S0036_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0036",
    env_sound = 20003
  },
  [1080404006] = {
    id = 1080404006,
    talk_text = function()
      return T_S(10804040060)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080404006/1080404006_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10804040065)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00028",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20003
  }
}
