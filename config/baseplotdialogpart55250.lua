BasePlotDialogPart55250 = {
  [1110601001] = {
    id = 1110601001,
    talk_text = function()
      return T_S(11106010010)
    end,
    next_dialog = 1110601002,
    env_sound = 20003,
    open_title_1 = function()
      return T_S(11106010018)
    end,
    open_title_2 = function()
      return T_S(11106010019)
    end
  },
  [1110601002] = {
    id = 1110601002,
    talk_text = function()
      return T_S(11106010020)
    end,
    is_master = 1,
    next_dialog = 1110601003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00496",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110601003] = {
    id = 1110601003,
    talk_text = function()
      return T_S(11106010030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601004,
    speak_name = function()
      return T_S(11106010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00420",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110601004] = {
    id = 1110601004,
    talk_text = function()
      return T_S(11106010040)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-308:-1165", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110601005,
    speak_name = function()
      return T_S(11106010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00346",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110601005] = {
    id = 1110601005,
    talk_text = function()
      return T_S(11106010050)
    end,
    next_dialog = 1110601006,
    env_sound = 20003
  },
  [1110601006] = {
    id = 1110601006,
    talk_text = function()
      return T_S(11106010060)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601007,
    speak_name = function()
      return T_S(11106010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00327",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110601007] = {
    id = 1110601007,
    talk_text = function()
      return T_S(11106010070)
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
    next_dialog = 1110601008,
    speak_name = function()
      return T_S(11106010075)
    end,
    env_sound = 20003,
    review_head = "90210001"
  },
  [1110601008] = {
    id = 1110601008,
    talk_text = function()
      return T_S(11106010080)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1066", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110601009,
    speak_name = function()
      return T_S(11106010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00551",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110601009] = {
    id = 1110601009,
    talk_text = function()
      return T_S(11106010090)
    end,
    next_dialog = 1110601010,
    env_sound = 20003
  },
  [1110601010] = {
    id = 1110601010,
    talk_text = function()
      return T_S(11106010100)
    end,
    next_dialog = 1110601011,
    speak_head = 90120036,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010105)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110601011] = {
    id = 1110601011,
    talk_text = function()
      return T_S(11106010110)
    end,
    next_dialog = 1110601012,
    env_sound = 20003
  },
  [1110601012] = {
    id = 1110601012,
    talk_text = function()
      return T_S(11106010120)
    end,
    next_dialog = 1110601013,
    speak_head = 90120038,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010125)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20003
  },
  [1110601013] = {
    id = 1110601013,
    talk_text = function()
      return T_S(11106010130)
    end,
    next_dialog = 1110601014,
    speak_head = 90120024,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010135)
    end,
    text_sound_path = "event:/voice_cn/story/S0088/S0088_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0088",
    env_sound = 20003
  },
  [1110601014] = {
    id = 1110601014,
    talk_text = function()
      return T_S(11106010140)
    end,
    next_dialog = 1110601015,
    env_sound = 20003
  },
  [1110601015] = {
    id = 1110601015,
    talk_text = function()
      return T_S(11106010150)
    end,
    next_dialog = 1110601016,
    env_sound = 20003
  },
  [1110601016] = {
    id = 1110601016,
    talk_text = function()
      return T_S(11106010160)
    end,
    next_dialog = 1110601017,
    env_sound = 20003,
    special_sound = 23016,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_SomeSwords.prefab",
      "0"
    }
  },
  [1110601017] = {
    id = 1110601017,
    talk_text = function()
      return T_S(11106010170)
    end,
    next_dialog = 1110601018,
    speak_head = 90120038,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010175)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20003
  },
  [1110601018] = {
    id = 1110601018,
    talk_text = function()
      return T_S(11106010180)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601019,
    speak_name = function()
      return T_S(11106010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00347",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110601019] = {
    id = 1110601019,
    talk_text = function()
      return T_S(11106010190)
    end,
    next_dialog = 1110601020,
    env_sound = 20003
  },
  [1110601020] = {
    id = 1110601020,
    talk_text = function()
      return T_S(11106010200)
    end,
    next_dialog = 1110601021,
    speak_head = 90120047,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0026/M0026_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/M0026",
    env_sound = 20003
  },
  [1110601021] = {
    id = 1110601021,
    talk_text = function()
      return T_S(11106010210)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601022,
    speak_name = function()
      return T_S(11106010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00552",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110601022] = {
    id = 1110601022,
    talk_text = function()
      return T_S(11106010220)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110601023,
    speak_name = function()
      return T_S(11106010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00328",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110601023] = {
    id = 1110601023,
    talk_text = function()
      return T_S(11106010230)
    end,
    next_dialog = 1110601024,
    env_sound = 20003
  },
  [1110601024] = {
    id = 1110601024,
    talk_text = function()
      return T_S(11106010240)
    end,
    next_dialog = 1110601025,
    env_sound = 20003
  },
  [1110601025] = {
    id = 1110601025,
    talk_text = function()
      return T_S(11106010250)
    end,
    is_master = 1,
    next_dialog = 1110601026,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00497",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110601026] = {
    id = 1110601026,
    talk_text = function()
      return T_S(11106010260)
    end,
    next_dialog = 1110601027,
    env_sound = 20003
  },
  [1110601027] = {
    id = 1110601027,
    talk_text = function()
      return T_S(11106010270)
    end,
    next_dialog = 1110601028,
    speak_head = 90120046,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0025/M0025_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/M0025",
    env_sound = 20003
  },
  [1110601028] = {
    id = 1110601028,
    talk_text = function()
      return T_S(11106010280)
    end,
    next_dialog = 1110601029,
    env_sound = 20003
  },
  [1110601029] = {
    id = 1110601029,
    talk_text = function()
      return T_S(11106010290)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601030,
    speak_name = function()
      return T_S(11106010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00553",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110601030] = {
    id = 1110601030,
    talk_text = function()
      return T_S(11106010300)
    end,
    is_master = 1,
    next_dialog = 1110601031,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00498",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110601031] = {
    id = 1110601031,
    talk_text = function()
      return T_S(11106010310)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601032,
    speak_name = function()
      return T_S(11106010315)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00076",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20003
  },
  [1110601032] = {
    id = 1110601032,
    talk_text = function()
      return T_S(11106010320)
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
    next_dialog = 1110601033,
    speak_head = 90120045,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110601033] = {
    id = 1110601033,
    talk_text = function()
      return T_S(11106010330)
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
    next_dialog = 1110601034,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00499",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110601034] = {
    id = 1110601034,
    talk_text = function()
      return T_S(11106010340)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601035,
    speak_name = function()
      return T_S(11106010345)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00077",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20003
  },
  [1110601035] = {
    id = 1110601035,
    talk_text = function()
      return T_S(11106010350)
    end,
    next_dialog = 1110601036,
    env_sound = 20003
  },
  [1110601036] = {
    id = 1110601036,
    talk_text = function()
      return T_S(11106010360)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601037,
    speak_name = function()
      return T_S(11106010365)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00078",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20003
  },
  [1110601037] = {
    id = 1110601037,
    talk_text = function()
      return T_S(11106010370)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1110601038,
    speak_head = 90120038,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010375)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20003
  },
  [1110601038] = {
    id = 1110601038,
    talk_text = function()
      return T_S(11106010380)
    end,
    next_dialog = 1110601039,
    speak_head = 90120045,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010385)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110601039] = {
    id = 1110601039,
    talk_text = function()
      return T_S(11106010390)
    end,
    next_dialog = 1110601040,
    speak_head = 90120038,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010395)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20003
  },
  [1110601040] = {
    id = 1110601040,
    talk_text = function()
      return T_S(11106010400)
    end,
    next_dialog = 1110601041,
    speak_head = 90120036,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010405)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110601041] = {
    id = 1110601041,
    talk_text = function()
      return T_S(11106010410)
    end,
    next_dialog = 1110601042,
    speak_head = 90120024,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010415)
    end,
    text_sound_path = "event:/voice_cn/story/S0088/S0088_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0088",
    env_sound = 20003
  },
  [1110601042] = {
    id = 1110601042,
    talk_text = function()
      return T_S(11106010420)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110601043,
    speak_name = function()
      return T_S(11106010425)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00329",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110601043] = {
    id = 1110601043,
    talk_text = function()
      return T_S(11106010430)
    end,
    next_dialog = 1110601044,
    speak_head = 90120025,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010435)
    end,
    text_sound_path = "event:/voice_cn/story/S0086/S0086_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0086",
    env_sound = 20003
  },
  [1110601044] = {
    id = 1110601044,
    talk_text = function()
      return T_S(11106010440)
    end,
    next_dialog = 1110601045,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010445)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20003
  },
  [1110601045] = {
    id = 1110601045,
    talk_text = function()
      return T_S(11106010450)
    end,
    next_dialog = 1110601046,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010455)
    end,
    text_sound_path = "event:/voice_cn/story/S0086/S0086_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0086",
    env_sound = 20003
  },
  [1110601046] = {
    id = 1110601046,
    talk_text = function()
      return T_S(11106010460)
    end,
    next_dialog = 1110601047,
    speak_head = 90120040,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010465)
    end,
    text_sound_path = "event:/voice_cn/story/S0094/S0094_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0094",
    env_sound = 20003
  },
  [1110601047] = {
    id = 1110601047,
    talk_text = function()
      return T_S(11106010470)
    end,
    next_dialog = 1110601048,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010475)
    end,
    text_sound_path = "event:/voice_cn/story/S0086/S0086_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0086",
    env_sound = 20003
  },
  [1110601048] = {
    id = 1110601048,
    talk_text = function()
      return T_S(11106010480)
    end,
    next_dialog = 1110601049,
    speak_head = 90120036,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010485)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110601049] = {
    id = 1110601049,
    talk_text = function()
      return T_S(11106010490)
    end,
    next_dialog = 1110601050,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010495)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20003
  },
  [1110601050] = {
    id = 1110601050,
    talk_text = function()
      return T_S(11106010500)
    end,
    next_dialog = 1110601051,
    speak_head = 90120036,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010505)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110601051] = {
    id = 1110601051,
    talk_text = function()
      return T_S(11106010510)
    end,
    next_dialog = 1110601052,
    speak_head = 90120038,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106010515)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20003
  },
  [1110601052] = {
    id = 1110601052,
    talk_text = function()
      return T_S(11106010520)
    end,
    next_dialog = 1110601053,
    speak_head = 90120040,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010525)
    end,
    text_sound_path = "event:/voice_cn/story/S0094/S0094_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0094",
    env_sound = 20003
  },
  [1110601053] = {
    id = 1110601053,
    talk_text = function()
      return T_S(11106010530)
    end,
    next_dialog = 1110601054,
    speak_head = 90120036,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106010535)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110601054] = {
    id = 1110601054,
    talk_text = function()
      return T_S(11106010540)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110601054/1110601054_90110009.playable"
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
    next_dialog = 1110601055,
    speak_name = function()
      return T_S(11106010545)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00215",
    text_sound_bank = "bank:/voice_cn/sty/M0015_3",
    env_sound = 20003
  },
  [1110601055] = {
    id = 1110601055,
    talk_text = function()
      return T_S(11106010550)
    end,
    role_ids = {90110009, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1080", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(11106010555)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00554",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110602001] = {
    id = 1110602001,
    talk_text = function()
      return T_S(11106020010)
    end,
    next_dialog = 1110602002,
    env_sound = 20003
  },
  [1110602002] = {
    id = 1110602002,
    talk_text = function()
      return T_S(11106020020)
    end,
    next_dialog = 1110602003,
    env_sound = 20003
  },
  [1110602003] = {
    id = 1110602003,
    talk_text = function()
      return T_S(11106020030)
    end,
    next_dialog = 1110602004,
    env_sound = 20003
  },
  [1110602004] = {
    id = 1110602004,
    talk_text = function()
      return T_S(11106020040)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110602005,
    speak_name = function()
      return T_S(11106020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00555",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110602005] = {
    id = 1110602005,
    talk_text = function()
      return T_S(11106020050)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110602006,
    speak_name = function()
      return T_S(11106020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00330",
    text_sound_bank = "bank:/voice_cn/sty/M0002_4",
    env_sound = 20003
  },
  [1110602006] = {
    id = 1110602006,
    talk_text = function()
      return T_S(11106020060)
    end,
    next_dialog = 1110602007,
    speak_head = 90120046,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0025/M0025_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/M0025",
    env_sound = 20003
  },
  [1110602007] = {
    id = 1110602007,
    talk_text = function()
      return T_S(11106020070)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110602008,
    speak_name = function()
      return T_S(11106020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00079",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20003
  },
  [1110602008] = {
    id = 1110602008,
    talk_text = function()
      return T_S(11106020080)
    end,
    next_dialog = 1110602009,
    env_sound = 20003
  },
  [1110602009] = {
    id = 1110602009,
    talk_text = function()
      return T_S(11106020090)
    end,
    next_dialog = 1110602010,
    env_sound = 20003
  },
  [1110602010] = {
    id = 1110602010,
    talk_text = function()
      return T_S(11106020100)
    end,
    next_dialog = 1110602011,
    env_sound = 20003
  },
  [1110602011] = {
    id = 1110602011,
    talk_text = function()
      return T_S(11106020110)
    end,
    next_dialog = 1110602012,
    speak_head = 90120045,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110602012] = {
    id = 1110602012,
    talk_text = function()
      return T_S(11106020120)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
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
    next_dialog = 1110602013,
    speak_name = function()
      return T_S(11106020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00348",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110602013] = {
    id = 1110602013,
    talk_text = function()
      return T_S(11106020130)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1000", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110602014,
    speak_name = function()
      return T_S(11106020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00421",
    text_sound_bank = "bank:/voice_cn/sty/M0004_5",
    env_sound = 20003
  },
  [1110602014] = {
    id = 1110602014,
    talk_text = function()
      return T_S(11106020140)
    end,
    is_master = 1,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1000", "238:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1110602015,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00500",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110602015] = {
    id = 1110602015,
    talk_text = function()
      return T_S(11106020150)
    end,
    next_dialog = 1110602016,
    speak_head = 90120047,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0026/M0026_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/M0026",
    env_sound = 20003
  },
  [1110602016] = {
    id = 1110602016,
    talk_text = function()
      return T_S(11106020160)
    end,
    next_dialog = 1110602017,
    env_sound = 20003
  },
  [1110602017] = {
    id = 1110602017,
    talk_text = function()
      return T_S(11106020170)
    end,
    next_dialog = 1110602018,
    speak_head = 90120024,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106020175)
    end,
    text_sound_path = "event:/voice_cn/story/S0088/S0088_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0088",
    env_sound = 20003
  },
  [1110602018] = {
    id = 1110602018,
    talk_text = function()
      return T_S(11106020180)
    end,
    next_dialog = 1110602019,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106020185)
    end,
    text_sound_path = "event:/voice_cn/story/S0092/S0092_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/S0092",
    env_sound = 20003
  },
  [1110602019] = {
    id = 1110602019,
    talk_text = function()
      return T_S(11106020190)
    end,
    next_dialog = 1110602020,
    env_sound = 20003
  },
  [1110602020] = {
    id = 1110602020,
    talk_text = function()
      return T_S(11106020200)
    end,
    next_dialog = 1110602021,
    speak_head = 90120024,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11106020205)
    end,
    text_sound_path = "event:/voice_cn/story/S0088/S0088_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0088",
    env_sound = 20003
  },
  [1110602021] = {
    id = 1110602021,
    talk_text = function()
      return T_S(11106020210)
    end,
    next_dialog = 1110602022,
    env_sound = 20003
  },
  [1110602022] = {
    id = 1110602022,
    talk_text = function()
      return T_S(11106020220)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110602023,
    speak_name = function()
      return T_S(11106020225)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00080",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20003
  },
  [1110602023] = {
    id = 1110602023,
    talk_text = function()
      return T_S(11106020230)
    end,
    next_dialog = 1110602024,
    env_sound = 20003
  },
  [1110602024] = {
    id = 1110602024,
    talk_text = function()
      return T_S(11106020240)
    end,
    next_dialog = 1110602025,
    speak_head = 90120045,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106020245)
    end,
    text_sound_path = "event:/voice_cn/story/M0024/M0024_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/M0024",
    env_sound = 20003
  },
  [1110602025] = {
    id = 1110602025,
    talk_text = function()
      return T_S(11106020250)
    end,
    next_dialog = 1110602026,
    env_sound = 20003
  },
  [1110602026] = {
    id = 1110602026,
    talk_text = function()
      return T_S(11106020260)
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
    role_shake = {"2:0:1100"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110602027,
    speak_name = function()
      return T_S(11106020265)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00081",
    text_sound_bank = "bank:/voice_cn/sty/M0019_1",
    env_sound = 20003
  },
  [1110602027] = {
    id = 1110602027,
    talk_text = function()
      return T_S(11106020270)
    end,
    next_dialog = 1110602028,
    env_sound = 20003
  },
  [1110602028] = {
    id = 1110602028,
    talk_text = function()
      return T_S(11106020280)
    end,
    next_dialog = 1110602029,
    speak_head = 90120036,
    speak_head_actions = {"idle"},
    speak_name = function()
      return T_S(11106020285)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110602029] = {
    id = 1110602029,
    talk_text = function()
      return T_S(11106020290)
    end,
    next_dialog = 1110602030,
    speak_head = 90120022,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106020295)
    end,
    text_sound_path = "event:/voice_cn/story/S0093/S0093_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0093",
    env_sound = 20003
  },
  [1110602030] = {
    id = 1110602030,
    talk_text = function()
      return T_S(11106020300)
    end,
    next_dialog = 1110602031,
    speak_head = 90120036,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106020305)
    end,
    text_sound_path = "event:/voice_cn/story/S0087/S0087_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/S0087",
    env_sound = 20003
  },
  [1110602031] = {
    id = 1110602031,
    talk_text = function()
      return T_S(11106020310)
    end,
    next_dialog = 1110602032,
    env_sound = 20003
  },
  [1110602032] = {
    id = 1110602032,
    talk_text = function()
      return T_S(11106020320)
    end,
    next_dialog = 1110602033,
    speak_head = 90120040,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11106020325)
    end,
    text_sound_path = "event:/voice_cn/story/S0094/S0094_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0094",
    env_sound = 20003
  },
  [1110602033] = {
    id = 1110602033,
    talk_text = function()
      return T_S(11106020330)
    end,
    next_dialog = 1110602034,
    env_sound = 20003
  },
  [1110602034] = {
    id = 1110602034,
    talk_text = function()
      return T_S(11106020340)
    end,
    next_dialog = 1110602035,
    env_sound = 20003
  },
  [1110602035] = {
    id = 1110602035,
    talk_text = function()
      return T_S(11106020350)
    end,
    next_dialog = 1110602036,
    env_sound = 20003
  },
  [1110602036] = {
    id = 1110602036,
    talk_text = function()
      return T_S(11106020360)
    end,
    is_master = 1,
    next_dialog = 1110602037,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00501",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110602037] = {
    id = 1110602037,
    talk_text = function()
      return T_S(11106020370)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110602037/1110602037_90110001.playable"
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
    next_dialog = 1110602038,
    speak_name = function()
      return T_S(11106020375)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00349",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110602038] = {
    id = 1110602038,
    talk_text = function()
      return T_S(11106020380)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1110602039,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00502",
    text_sound_bank = "bank:/voice_cn/sty/M0000_5",
    env_sound = 20003
  },
  [1110602039] = {
    id = 1110602039,
    talk_text = function()
      return T_S(11106020390)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1110602040,
    speak_name = function()
      return T_S(11106020395)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00350",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  },
  [1110602040] = {
    id = 1110602040,
    talk_text = function()
      return T_S(11106020400)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1000", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1110602041,
    speak_name = function()
      return T_S(11106020405)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00556",
    text_sound_bank = "bank:/voice_cn/sty/M0003_6",
    env_sound = 20003
  },
  [1110602041] = {
    id = 1110602041,
    talk_text = function()
      return T_S(11106020410)
    end,
    next_dialog = 1110602042,
    env_sound = 20003
  },
  [1110602042] = {
    id = 1110602042,
    talk_text = function()
      return T_S(11106020420)
    end,
    next_dialog = 1110602043,
    camera_shake = {
      "3",
      "0",
      "1500"
    },
    env_sound = 20003
  },
  [1110602043] = {
    id = 1110602043,
    talk_text = function()
      return T_S(11106020430)
    end,
    next_dialog = 1110602044,
    env_sound = 20003
  },
  [1110602044] = {
    id = 1110602044,
    talk_text = function()
      return T_S(11106020440)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1110602044/1110602044_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11106020445)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00351",
    text_sound_bank = "bank:/voice_cn/sty/M0001_4",
    env_sound = 20003
  }
}
