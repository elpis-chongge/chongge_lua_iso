BasePlotDialogPart25250 = {
  [1050601001] = {
    id = 1050601001,
    talk_text = function()
      return T_S(10506010010)
    end,
    next_dialog = 1050601002,
    camera_shake = {
      "3",
      "0",
      "1800"
    },
    env_sound = 20004,
    open_title_1 = function()
      return T_S(10506010018)
    end,
    open_title_2 = function()
      return T_S(10506010019)
    end,
    force_auto = 1,
    special_sound = 23026
  },
  [1050601002] = {
    id = 1050601002,
    talk_text = function()
      return T_S(10506010020)
    end,
    next_dialog = 1050601003,
    camera_shake = {
      "2",
      "0",
      "1200"
    },
    env_sound = 20004
  },
  [1050601003] = {
    id = 1050601003,
    talk_text = function()
      return T_S(10506010030)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601003/1050601003_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1050601004,
    speak_name = function()
      return T_S(10506010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/M0014",
    env_sound = 20004
  },
  [1050601004] = {
    id = 1050601004,
    talk_text = function()
      return T_S(10506010040)
    end,
    role_ids = {90110009, 90110012},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601004/1050601004_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601004/1050601004_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"270:-1080", "-295:-1158"},
    role_shake = {"", ""},
    effect_in = {"3", "0"},
    effect_in_param = {"240", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1050601016,
    speak_name = function()
      return T_S(10506010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1050601005] = {
    id = 1050601005,
    talk_text = function()
      return T_S(10506010050)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601005/1050601005_90110012.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601005/1050601005_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-295:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1050601006,
    speak_head = 90120032,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10506010055)
    end,
    text_sound_path = "event:/voice_cn/story/S0022/S0022_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0022",
    env_sound = 20004
  },
  [1050601006] = {
    id = 1050601006,
    talk_text = function()
      return T_S(10506010060)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601006/1050601006_90110012.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601006/1050601006_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-295:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1050601007,
    speak_name = function()
      return T_S(10506010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00019",
    text_sound_bank = "bank:/voice_cn/sty/M0014",
    env_sound = 20004
  },
  [1050601007] = {
    id = 1050601007,
    talk_text = function()
      return T_S(10506010070)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601007/1050601007_90110012.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601007/1050601007_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-295:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1050601008,
    speak_head = 90120032,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10506010075)
    end,
    text_sound_path = "event:/voice_cn/story/S0022/S0022_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0022",
    env_sound = 20004
  },
  [1050601008] = {
    id = 1050601008,
    talk_text = function()
      return T_S(10506010080)
    end,
    next_dialog = 1050601009,
    env_sound = 20004
  },
  [1050601009] = {
    id = 1050601009,
    talk_text = function()
      return T_S(10506010090)
    end,
    is_master = 1,
    next_dialog = 1050601017,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00123",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20004
  },
  [1050601010] = {
    id = 1050601010,
    talk_text = function()
      return T_S(10506010100)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601010/1050601010_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1050601011,
    speak_name = function()
      return T_S(10506010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1050601011] = {
    id = 1050601011,
    talk_text = function()
      return T_S(10506010110)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601011/1050601011_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1050601012,
    speak_name = function()
      return T_S(10506010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1050601012] = {
    id = 1050601012,
    talk_text = function()
      return T_S(10506010120)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601012/1050601012_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1050601018,
    env_sound = 20004
  },
  [1050601013] = {
    id = 1050601013,
    talk_text = function()
      return T_S(10506010130)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601013/1050601013_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601013/1050601013_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-1080", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "240"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050601014,
    speak_name = function()
      return T_S(10506010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00173",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20004
  },
  [1050601014] = {
    id = 1050601014,
    talk_text = function()
      return T_S(10506010140)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601014/1050601014_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601014/1050601014_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"270:-1080", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050601015,
    speak_name = function()
      return T_S(10506010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00174",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20004
  },
  [1050601015] = {
    id = 1050601015,
    talk_text = function()
      return T_S(10506010150)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601015/1050601015_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601015/1050601015_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"270:-1080", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "2"},
    effect_out_param = {"0", "320"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10506010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00175",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20004
  },
  [1050601016] = {
    id = 1050601016,
    talk_text = function()
      return T_S(10506010160)
    end,
    role_ids = {90110009, 90110012},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601016/1050601016_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601016/1050601016_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"270:-1080", "-295:-1158"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1050601005,
    speak_name = function()
      return T_S(10506010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1050601017] = {
    id = 1050601017,
    talk_text = function()
      return T_S(10506010170)
    end,
    is_master = 1,
    next_dialog = 1050601010,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00124",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20004
  },
  [1050601018] = {
    id = 1050601018,
    talk_text = function()
      return T_S(10506010180)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050601018/1050601018_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1050601013,
    env_sound = 20004
  },
  [1050602001] = {
    id = 1050602001,
    talk_text = function()
      return T_S(10506020010)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602001/1050602001_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1050602002,
    speak_name = function()
      return T_S(10506020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1050602002] = {
    id = 1050602002,
    talk_text = function()
      return T_S(10506020020)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602002/1050602002_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602002/1050602002_90110010.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "240"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050602010,
    speak_name = function()
      return T_S(10506020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/M0016",
    env_sound = 20004
  },
  [1050602003] = {
    id = 1050602003,
    talk_text = function()
      return T_S(10506020030)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602003/1050602003_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1050602004,
    speak_name = function()
      return T_S(10506020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00020",
    text_sound_bank = "bank:/voice_cn/sty/M0014",
    env_sound = 20004
  },
  [1050602004] = {
    id = 1050602004,
    talk_text = function()
      return T_S(10506020040)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602004/1050602004_90110012.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602004/1050602004_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-295:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "210"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050602005,
    speak_name = function()
      return T_S(10506020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1050602005] = {
    id = 1050602005,
    talk_text = function()
      return T_S(10506020050)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602005/1050602005_90110012.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602005/1050602005_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-295:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1050602011,
    speak_name = function()
      return T_S(10506020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00021",
    text_sound_bank = "bank:/voice_cn/sty/M0014",
    env_sound = 20004
  },
  [1050602006] = {
    id = 1050602006,
    talk_text = function()
      return T_S(10506020060)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602006/1050602006_90110012.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602006/1050602006_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-295:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "480"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050602007,
    speak_name = function()
      return T_S(10506020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1050602007] = {
    id = 1050602007,
    talk_text = function()
      return T_S(10506020070)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602007/1050602007_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1050602008,
    env_sound = 20004
  },
  [1050602008] = {
    id = 1050602008,
    talk_text = function()
      return T_S(10506020080)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602008/1050602008_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1050602009,
    env_sound = 20004
  },
  [1050602009] = {
    id = 1050602009,
    talk_text = function()
      return T_S(10506020090)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602009/1050602009_90110012.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1050602012,
    speak_name = function()
      return T_S(10506020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/M0014",
    env_sound = 20004
  },
  [1050602010] = {
    id = 1050602010,
    talk_text = function()
      return T_S(10506020100)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602010/1050602010_90110009.playable",
      ""
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050602003,
    speak_name = function()
      return T_S(10506020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0016",
    env_sound = 20004
  },
  [1050602011] = {
    id = 1050602011,
    talk_text = function()
      return T_S(10506020110)
    end,
    role_ids = {90110012, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602011/1050602011_90110012.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050602011/1050602011_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-295:-1158", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1050602006,
    speak_name = function()
      return T_S(10506020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/M0014",
    env_sound = 20004
  },
  [1050602012] = {
    id = 1050602012,
    talk_text = function()
      return T_S(10506020120)
    end,
    speak_head = 90120032,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10506020125)
    end,
    text_sound_path = "event:/voice_cn/story/S0022/S0022_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0022",
    env_sound = 20004
  }
}
