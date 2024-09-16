BasePlotDialogPart20151 = {
  [1040403001] = {
    id = 1040403001,
    talk_text = function()
      return T_S(10404030010)
    end,
    next_dialog = 1040403002,
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10404030015)
    end,
    text_sound_path = "event:/voice_cn/story/S0017/S0017_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0017",
    env_sound = 20004
  },
  [1040403002] = {
    id = 1040403002,
    talk_text = function()
      return T_S(10404030020)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403002/1040403002_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040403003,
    speak_name = function()
      return T_S(10404030025)
    end,
    text_sound_path = "event:/voice_cn/story/M0013/M0013_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/M0013",
    env_sound = 20004
  },
  [1040403003] = {
    id = 1040403003,
    talk_text = function()
      return T_S(10404030030)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403003/1040403003_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040403004,
    speak_head = 90120040,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10404030035)
    end,
    text_sound_path = "event:/voice_cn/story/S0018/S0018_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0018",
    env_sound = 20004
  },
  [1040403004] = {
    id = 1040403004,
    talk_text = function()
      return T_S(10404030040)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403004/1040403004_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040403005,
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10404030045)
    end,
    text_sound_path = "event:/voice_cn/story/S0017/S0017_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0017",
    env_sound = 20004
  },
  [1040403005] = {
    id = 1040403005,
    talk_text = function()
      return T_S(10404030050)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403005/1040403005_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1040403007,
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10404030055)
    end,
    text_sound_path = "event:/voice_cn/story/S0017/S0017_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0017",
    env_sound = 20004
  },
  [1040403007] = {
    id = 1040403007,
    role_ids = {90110006, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403007/1040403007_90110006.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403007/1040403007_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"200:-1020", "-200:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1040403008,
    camera_shake = {
      "2",
      "0",
      "2000"
    },
    env_sound = 20004,
    force_auto = 1,
    special_sound = 23015,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_DoubleSwords.prefab",
      "0"
    }
  },
  [1040403008] = {
    id = 1040403008,
    talk_text = function()
      return T_S(10404030080)
    end,
    role_ids = {90110002, 90110006},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403008/1040403008_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403008/1040403008_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_1.playable"
    },
    role_position = {"-200:-1066", "200:-1020"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040403009,
    speak_name = function()
      return T_S(10404030085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00079",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1040403009] = {
    id = 1040403009,
    talk_text = function()
      return T_S(10404030090)
    end,
    role_ids = {90110002, 90110006},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403009/1040403009_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403009/1040403009_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"-200:-1066", "200:-1020"},
    role_shake = {"", ""},
    effect_in = {"3", "3"},
    effect_in_param = {"120", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040403010,
    speak_name = function()
      return T_S(10404030095)
    end,
    text_sound_path = "event:/voice_cn/story/M0013/M0013_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/M0013",
    env_sound = 20004
  },
  [1040403010] = {
    id = 1040403010,
    talk_text = function()
      return T_S(10404030100)
    end,
    role_ids = {90110002, 90110006},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403010/1040403010_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403010/1040403010_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"-200:-1066", "200:-1020"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040403011,
    speak_name = function()
      return T_S(10404030105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00080",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1040403011] = {
    id = 1040403011,
    talk_text = function()
      return T_S(10404030110)
    end,
    role_ids = {90110002, 90110006},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403011/1040403011_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403011/1040403011_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"-200:-1066", "200:-1020"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040403012,
    speak_name = function()
      return T_S(10404030115)
    end,
    text_sound_path = "event:/voice_cn/story/M0013/M0013_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/M0013",
    env_sound = 20004
  },
  [1040403012] = {
    id = 1040403012,
    talk_text = function()
      return T_S(10404030120)
    end,
    role_ids = {90110002, 90110006},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403012/1040403012_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403012/1040403012_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"-200:-1066", "200:-1020"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "420"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040403013,
    speak_name = function()
      return T_S(10404030125)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00081",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1040403013] = {
    id = 1040403013,
    talk_text = function()
      return T_S(10404030130)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403013/1040403013_90110002.playable"
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
    next_dialog = 1040403014,
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10404030135)
    end,
    text_sound_path = "event:/voice_cn/story/S0017/S0017_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0017",
    env_sound = 20004
  },
  [1040403014] = {
    id = 1040403014,
    talk_text = function()
      return T_S(10404030140)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403014/1040403014_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"2"},
    effect_out_param = {"200"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040403015,
    speak_name = function()
      return T_S(10404030145)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00082",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1040403015] = {
    id = 1040403015,
    next_dialog = 1040403016,
    camera_shake = {
      "3",
      "0",
      "1800"
    },
    env_sound = 20004,
    force_auto = 1,
    special_sound = 23016,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_SomeSwords.prefab",
      "0"
    }
  },
  [1040403016] = {
    id = 1040403016,
    talk_text = function()
      return T_S(10404030160)
    end,
    next_dialog = 1040403017,
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10404030165)
    end,
    text_sound_path = "event:/voice_cn/story/S0017/S0017_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0017",
    env_sound = 20004
  },
  [1040403017] = {
    id = 1040403017,
    talk_text = function()
      return T_S(10404030170)
    end,
    is_master = 1,
    next_dialog = 1040403018,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00082",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20004
  },
  [1040403018] = {
    id = 1040403018,
    talk_text = function()
      return T_S(10404030180)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403018/1040403018_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-120:-1066"},
    effect_in = {"2"},
    effect_in_param = {"240"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040403019,
    speak_name = function()
      return T_S(10404030185)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00083",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1040403019] = {
    id = 1040403019,
    talk_text = function()
      return T_S(10404030190)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403019/1040403019_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403019/1040403019_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1066", "250:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040403020,
    speak_name = function()
      return T_S(10404030195)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00111",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20004
  },
  [1040403020] = {
    id = 1040403020,
    talk_text = function()
      return T_S(10404030200)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403020/1040403020_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403020/1040403020_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      ""
    },
    role_position = {"-270:-1066", "250:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040403021,
    speak_name = function()
      return T_S(10404030205)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00084",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1040403021] = {
    id = 1040403021,
    talk_text = function()
      return T_S(10404030210)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403021/1040403021_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040403021/1040403021_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      ""
    },
    role_position = {"-270:-1066", "250:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10404030215)
    end,
    text_sound_path = "event:/voice_cn/story/S0017/S0017_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0017",
    env_sound = 20004
  }
}
