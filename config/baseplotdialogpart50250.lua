BasePlotDialogPart50250 = {
  [1100601001] = {
    id = 1100601001,
    talk_text = function()
      return T_S(11006010010)
    end,
    is_master = 0,
    next_dialog = 1100601009,
    speak_name = function()
      return T_S(11006010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00355",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001,
    review_head = "90120001",
    open_title_1 = function()
      return T_S(11006010018)
    end,
    open_title_2 = function()
      return T_S(11006010019)
    end
  },
  [1100601002] = {
    id = 1100601002,
    talk_text = function()
      return T_S(11006010020)
    end,
    role_ids = {90110004},
    scale = {10000, 10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601002/1100601002_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100601003,
    speak_name = function()
      return T_S(11006010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00350",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20001
  },
  [1100601003] = {
    id = 1100601003,
    talk_text = function()
      return T_S(11006010030)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601003/1100601003_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601003/1100601003_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-321:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "210"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100601011,
    speak_name = function()
      return T_S(11006010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00465",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20001
  },
  [1100601009] = {
    id = 1100601009,
    talk_text = function()
      return T_S(11006010090)
    end,
    next_dialog = 1100601010,
    env_sound = 20001
  },
  [1100601010] = {
    id = 1100601010,
    talk_text = function()
      return T_S(11006010100)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601010/1100601010_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100601002,
    speak_name = function()
      return T_S(11006010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00349",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20001
  },
  [1100601011] = {
    id = 1100601011,
    talk_text = function()
      return T_S(11006010110)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601011/1100601011_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601011/1100601011_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-321:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100601012,
    speak_name = function()
      return T_S(11006010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00466",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20001
  },
  [1100601012] = {
    id = 1100601012,
    talk_text = function()
      return T_S(11006010120)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601012/1100601012_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100601013,
    speak_name = function()
      return T_S(11006010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00028",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601013] = {
    id = 1100601013,
    talk_text = function()
      return T_S(11006010130)
    end,
    is_master = 0,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601013/1100601013_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100601014,
    env_sound = 20001
  },
  [1100601014] = {
    id = 1100601014,
    talk_text = function()
      return T_S(11006010140)
    end,
    next_dialog = 1100601015,
    env_sound = 20001
  },
  [1100601015] = {
    id = 1100601015,
    talk_text = function()
      return T_S(11006010150)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601015/1100601015_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100601016,
    speak_name = function()
      return T_S(11006010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00029_01",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601016] = {
    id = 1100601016,
    talk_text = function()
      return T_S(11006010160)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601016/1100601016_90110005.playable"
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
    next_dialog = 1100601017,
    speak_name = function()
      return T_S(11006010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00029_02",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601017] = {
    id = 1100601017,
    talk_text = function()
      return T_S(11006010170)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601017/1100601017_90110005.playable"
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
    next_dialog = 1100601018,
    env_sound = 20001
  },
  [1100601018] = {
    id = 1100601018,
    talk_text = function()
      return T_S(11006010180)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601018/1100601018_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601018/1100601018_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100601019,
    speak_name = function()
      return T_S(11006010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00351",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20001
  },
  [1100601019] = {
    id = 1100601019,
    talk_text = function()
      return T_S(11006010190)
    end,
    is_master = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601019/1100601019_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601019/1100601019_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601020,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00356",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  },
  [1100601020] = {
    id = 1100601020,
    talk_text = function()
      return T_S(11006010200)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601020/1100601020_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601020/1100601020_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100601021,
    speak_name = function()
      return T_S(11006010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00030",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601021] = {
    id = 1100601021,
    talk_text = function()
      return T_S(11006010210)
    end,
    is_master = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601021/1100601021_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601021/1100601021_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601022,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00357",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  },
  [1100601022] = {
    id = 1100601022,
    talk_text = function()
      return T_S(11006010220)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601022/1100601022_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601022/1100601022_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100601023,
    speak_name = function()
      return T_S(11006010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00031",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601023] = {
    id = 1100601023,
    talk_text = function()
      return T_S(11006010230)
    end,
    is_os = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601023/1100601023_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601023/1100601023_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100601024,
    speak_name = function()
      return T_S(11006010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00352",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20001
  },
  [1100601024] = {
    id = 1100601024,
    talk_text = function()
      return T_S(11006010240)
    end,
    is_master = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601024/1100601024_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601024/1100601024_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601025,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00358",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  },
  [1100601025] = {
    id = 1100601025,
    talk_text = function()
      return T_S(11006010250)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601025/1100601025_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601025/1100601025_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100601026,
    speak_name = function()
      return T_S(11006010255)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00032",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601026] = {
    id = 1100601026,
    talk_text = function()
      return T_S(11006010260)
    end,
    is_master = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601026/1100601026_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601026/1100601026_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601027,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00359",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  },
  [1100601027] = {
    id = 1100601027,
    talk_text = function()
      return T_S(11006010270)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601027/1100601027_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601027/1100601027_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100601028,
    speak_name = function()
      return T_S(11006010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00033",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601028] = {
    id = 1100601028,
    talk_text = function()
      return T_S(11006010280)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601028/1100601028_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601028/1100601028_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100601029,
    speak_name = function()
      return T_S(11006010285)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00353",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20001
  },
  [1100601029] = {
    id = 1100601029,
    talk_text = function()
      return T_S(11006010290)
    end,
    is_master = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601029/1100601029_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601029/1100601029_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601030,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00360",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  },
  [1100601030] = {
    id = 1100601030,
    talk_text = function()
      return T_S(11006010300)
    end,
    is_master = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601030/1100601030_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601030/1100601030_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601031,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00361",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  },
  [1100601031] = {
    id = 1100601031,
    talk_text = function()
      return T_S(11006010310)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601031/1100601031_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601031/1100601031_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100601032,
    speak_name = function()
      return T_S(11006010315)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00034",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601032] = {
    id = 1100601032,
    talk_text = function()
      return T_S(11006010320)
    end,
    is_os = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601032/1100601032_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601032/1100601032_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100601033,
    speak_name = function()
      return T_S(11006010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00354",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20001
  },
  [1100601033] = {
    id = 1100601033,
    talk_text = function()
      return T_S(11006010330)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601033/1100601033_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601033/1100601033_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100601034,
    speak_name = function()
      return T_S(11006010335)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00035",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601034] = {
    id = 1100601034,
    talk_text = function()
      return T_S(11006010340)
    end,
    is_master = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601034/1100601034_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601034/1100601034_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601035,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00362",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  },
  [1100601035] = {
    id = 1100601035,
    talk_text = function()
      return T_S(11006010350)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601035/1100601035_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601035/1100601035_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100601036,
    speak_name = function()
      return T_S(11006010355)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00036",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100601036] = {
    id = 1100601036,
    talk_text = function()
      return T_S(11006010360)
    end,
    is_master = 1,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601036/1100601036_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601036/1100601036_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601037,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00363",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  },
  [1100601037] = {
    id = 1100601037,
    talk_text = function()
      return T_S(11006010370)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601037/1100601037_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601037/1100601037_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1100601038,
    env_sound = 20001
  },
  [1100601038] = {
    id = 1100601038,
    talk_text = function()
      return T_S(11006010380)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601038/1100601038_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100601038/1100601038_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(11006010385)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00037",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20001
  },
  [1100602001] = {
    id = 1100602001,
    talk_text = function()
      return T_S(11006020010)
    end,
    next_dialog = 1100602002,
    env_sound = 20001
  },
  [1100602002] = {
    id = 1100602002,
    talk_text = function()
      return T_S(11006020020)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100602002/1100602002_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100602003,
    speak_name = function()
      return T_S(11006020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00355",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20001
  },
  [1100602003] = {
    id = 1100602003,
    talk_text = function()
      return T_S(11006020030)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100602003/1100602003_90110004.playable"
    },
    role_position = {"-52:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00364",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20001
  }
}
