BasePlotDialogPart40200 = {
  [1080501001] = {
    id = 1080501001,
    talk_text = function()
      return T_S(10805010010)
    end,
    next_dialog = 1080501002,
    env_sound = 20007,
    open_title_1 = function()
      return T_S(10805010018)
    end,
    open_title_2 = function()
      return T_S(10805010019)
    end
  },
  [1080501002] = {
    id = 1080501002,
    talk_text = function()
      return T_S(10805010020)
    end,
    next_dialog = 1080501003,
    env_sound = 20007
  },
  [1080501003] = {
    id = 1080501003,
    talk_text = function()
      return T_S(10805010030)
    end,
    next_dialog = 1080501004,
    env_sound = 20007
  },
  [1080501004] = {
    id = 1080501004,
    talk_text = function()
      return T_S(10805010040)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501004/1080501004_90110003.playable"
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
    next_dialog = 1080501005,
    speak_name = function()
      return T_S(10805010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00300",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20007
  },
  [1080501005] = {
    id = 1080501005,
    talk_text = function()
      return T_S(10805010050)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501005/1080501005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501005/1080501005_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501006,
    speak_name = function()
      return T_S(10805010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00268",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080501006] = {
    id = 1080501006,
    talk_text = function()
      return T_S(10805010060)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501006/1080501006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501006/1080501006_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080501007,
    speak_name = function()
      return T_S(10805010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00301",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1080501007] = {
    id = 1080501007,
    talk_text = function()
      return T_S(10805010070)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501007/1080501007_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501007/1080501007_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501008,
    speak_name = function()
      return T_S(10805010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00269",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080501008] = {
    id = 1080501008,
    talk_text = function()
      return T_S(10805010080)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501008/1080501008_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501008/1080501008_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080501009,
    speak_name = function()
      return T_S(10805010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00302",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1080501009] = {
    id = 1080501009,
    talk_text = function()
      return T_S(10805010090)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501009/1080501009_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501009/1080501009_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501010,
    speak_name = function()
      return T_S(10805010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00270",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080501010] = {
    id = 1080501010,
    talk_text = function()
      return T_S(10805010100)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501010/1080501010_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501010/1080501010_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080501011,
    speak_name = function()
      return T_S(10805010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00303",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1080501011] = {
    id = 1080501011,
    talk_text = function()
      return T_S(10805010110)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501011/1080501011_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501011/1080501011_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080501012,
    speak_name = function()
      return T_S(10805010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00304",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1080501012] = {
    id = 1080501012,
    talk_text = function()
      return T_S(10805010120)
    end,
    is_master = 1,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501012/1080501012_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501012/1080501012_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1080501013,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00298",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20007
  },
  [1080501013] = {
    id = 1080501013,
    talk_text = function()
      return T_S(10805010130)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501013/1080501013_90110001.playable"
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
    next_dialog = 1080501014,
    speak_name = function()
      return T_S(10805010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00256",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20007
  },
  [1080501014] = {
    id = 1080501014,
    talk_text = function()
      return T_S(10805010140)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501014/1080501014_90110001.playable"
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
    next_dialog = 1080501032,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00299",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20007
  },
  [1080501015] = {
    id = 1080501015,
    talk_text = function()
      return T_S(10805010150)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501015/1080501015_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501015/1080501015_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501016,
    speak_name = function()
      return T_S(10805010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00273",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080501016] = {
    id = 1080501016,
    talk_text = function()
      return T_S(10805010160)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501016/1080501016_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501016/1080501016_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      ""
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501017,
    speak_name = function()
      return T_S(10805010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00274",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080501017] = {
    id = 1080501017,
    talk_text = function()
      return T_S(10805010170)
    end,
    next_dialog = 1080501018,
    camera_shake = {
      "2",
      "0",
      "800"
    },
    env_sound = 20007
  },
  [1080501018] = {
    id = 1080501018,
    talk_text = function()
      return T_S(10805010180)
    end,
    next_dialog = 1080501019,
    env_sound = 20003
  },
  [1080501019] = {
    id = 1080501019,
    talk_text = function()
      return T_S(10805010190)
    end,
    next_dialog = 1080501020,
    speak_head = 90120023,
    speak_head_actions = {
      "talk",
      "angry",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10805010195)
    end,
    text_sound_path = "event:/voice_cn/story/S0042/S0042_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0042",
    env_sound = 20003
  },
  [1080501020] = {
    id = 1080501020,
    talk_text = function()
      return T_S(10805010200)
    end,
    next_dialog = 1080501021,
    env_sound = 20003
  },
  [1080501021] = {
    id = 1080501021,
    talk_text = function()
      return T_S(10805010210)
    end,
    next_dialog = 1080501022,
    camera_shake = {
      "3",
      "0",
      "1200"
    },
    env_sound = 20003
  },
  [1080501022] = {
    id = 1080501022,
    talk_text = function()
      return T_S(10805010220)
    end,
    next_dialog = 1080501025,
    env_sound = 20003
  },
  [1080501025] = {
    id = 1080501025,
    talk_text = function()
      return T_S(10805010250)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501025/1080501025_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080501026,
    speak_name = function()
      return T_S(10805010255)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00043",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20003
  },
  [1080501026] = {
    id = 1080501026,
    talk_text = function()
      return T_S(10805010260)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501026/1080501026_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"3"},
    effect_in_param = {"210"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080501027,
    speak_name = function()
      return T_S(10805010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00305",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1080501027] = {
    id = 1080501027,
    talk_text = function()
      return T_S(10805010270)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501027/1080501027_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"2:0:1200"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080501028,
    speak_name = function()
      return T_S(10805010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00306",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1080501028] = {
    id = 1080501028,
    talk_text = function()
      return T_S(10805010280)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501028/1080501028_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501028/1080501028_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501029,
    speak_name = function()
      return T_S(10805010285)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00186",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20003
  },
  [1080501029] = {
    id = 1080501029,
    talk_text = function()
      return T_S(10805010290)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501029/1080501029_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080501030,
    speak_name = function()
      return T_S(10805010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00275",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1080501030] = {
    id = 1080501030,
    next_dialog = 1080501037,
    camera_shake = {
      "3",
      "0",
      "1500"
    },
    env_sound = 20003,
    special_sound = 23002
  },
  [1080501032] = {
    id = 1080501032,
    talk_text = function()
      return T_S(10805010320)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501032/1080501032_90110001.playable"
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
    next_dialog = 1080501033,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00300",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20007
  },
  [1080501033] = {
    id = 1080501033,
    talk_text = function()
      return T_S(10805010330)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501033/1080501033_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501033/1080501033_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "210"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501034,
    speak_name = function()
      return T_S(10805010335)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00271",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080501034] = {
    id = 1080501034,
    talk_text = function()
      return T_S(10805010340)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501034/1080501034_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501034/1080501034_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1000", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501015,
    speak_name = function()
      return T_S(10805010345)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00272",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080501037] = {
    id = 1080501037,
    talk_text = function()
      return T_S(10805010370)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501037/1080501037_90110003.playable"
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
    next_dialog = 1080501038,
    speak_name = function()
      return T_S(10805010375)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00307",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1080501038] = {
    id = 1080501038,
    talk_text = function()
      return T_S(10805010380)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501038/1080501038_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501038/1080501038_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501039,
    speak_name = function()
      return T_S(10805010385)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00276",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1080501039] = {
    id = 1080501039,
    talk_text = function()
      return T_S(10805010390)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501039/1080501039_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501039/1080501039_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080501040,
    speak_name = function()
      return T_S(10805010395)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00308",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1080501040] = {
    id = 1080501040,
    talk_text = function()
      return T_S(10805010400)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501040/1080501040_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501040/1080501040_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501041,
    speak_name = function()
      return T_S(10805010405)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00277",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1080501041] = {
    id = 1080501041,
    talk_text = function()
      return T_S(10805010410)
    end,
    is_os = 1,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501041/1080501041_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501041/1080501041_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501042,
    speak_name = function()
      return T_S(10805010415)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00278",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1080501042] = {
    id = 1080501042,
    talk_text = function()
      return T_S(10805010420)
    end,
    is_master = 1,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501042/1080501042_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501042/1080501042_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"240:-980", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 1},
    next_dialog = 1080501043,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00301",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20003
  },
  [1080501043] = {
    id = 1080501043,
    talk_text = function()
      return T_S(10805010430)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501043/1080501043_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080501044,
    speak_name = function()
      return T_S(10805010435)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00044",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20003
  },
  [1080501044] = {
    id = 1080501044,
    talk_text = function()
      return T_S(10805010440)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501044/1080501044_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080501045,
    speak_name = function()
      return T_S(10805010445)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00045",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20003
  },
  [1080501045] = {
    id = 1080501045,
    talk_text = function()
      return T_S(10805010450)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501045/1080501045_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501045/1080501045_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-318:-1033", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501046,
    speak_name = function()
      return T_S(10805010455)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00309",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1080501046] = {
    id = 1080501046,
    talk_text = function()
      return T_S(10805010460)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501046/1080501046_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501046/1080501046_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-318:-1033", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"2", "0"},
    effect_out_param = {"350", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501047,
    speak_name = function()
      return T_S(10805010465)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00310",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1080501047] = {
    id = 1080501047,
    talk_text = function()
      return T_S(10805010470)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501047/1080501047_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"240:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1080501048,
    env_sound = 20003
  },
  [1080501048] = {
    id = 1080501048,
    talk_text = function()
      return T_S(10805010480)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501048/1080501048_90110003.playable"
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
    next_dialog = 1080501049,
    speak_name = function()
      return T_S(10805010485)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00311",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1080501049] = {
    id = 1080501049,
    talk_text = function()
      return T_S(10805010490)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501049/1080501049_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501049/1080501049_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501050,
    speak_name = function()
      return T_S(10805010495)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00187",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20003
  },
  [1080501050] = {
    id = 1080501050,
    talk_text = function()
      return T_S(10805010500)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501050/1080501050_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501050/1080501050_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080501051,
    speak_name = function()
      return T_S(10805010505)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00188",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20003
  },
  [1080501051] = {
    id = 1080501051,
    talk_text = function()
      return T_S(10805010510)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501051/1080501051_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080501052,
    speak_name = function()
      return T_S(10805010515)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00279",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1080501052] = {
    id = 1080501052,
    talk_text = function()
      return T_S(10805010520)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080501052/1080501052_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00302",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20003
  },
  [1080502001] = {
    id = 1080502001,
    talk_text = function()
      return T_S(10805020010)
    end,
    role_ids = {90110017},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502001/1080502001_90110017.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable"
    },
    role_position = {"-13:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080502002,
    speak_name = function()
      return T_S(10805020015)
    end,
    text_sound_path = "event:/voice_cn/story/S0043/S0043_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0043",
    env_sound = 20003
  },
  [1080502002] = {
    id = 1080502002,
    talk_text = function()
      return T_S(10805020020)
    end,
    role_ids = {90110017, 90110018},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502002/1080502002_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502002/1080502002_90110018.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110018/90110018_0.playable"
    },
    role_position = {"-285:-980", "270:-1155"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080502003,
    speak_name = function()
      return T_S(10805020025)
    end,
    text_sound_path = "event:/voice_cn/story/S0041/S0041_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0041",
    env_sound = 20003
  },
  [1080502003] = {
    id = 1080502003,
    talk_text = function()
      return T_S(10805020030)
    end,
    role_ids = {90110017, 90110018},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502003/1080502003_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502003/1080502003_90110018.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110018/90110018_0.playable"
    },
    role_position = {"-285:-980", "270:-1155"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1080502004,
    speak_name = function()
      return T_S(10805020035)
    end,
    text_sound_path = "event:/voice_cn/story/S0043/S0043_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0043",
    env_sound = 20003
  },
  [1080502004] = {
    id = 1080502004,
    talk_text = function()
      return T_S(10805020040)
    end,
    role_ids = {90110017, 90110018},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502004/1080502004_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502004/1080502004_90110018.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110018/90110018_0.playable"
    },
    role_position = {"-285:-980", "270:-1155"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080502005,
    speak_name = function()
      return T_S(10805020045)
    end,
    text_sound_path = "event:/voice_cn/story/S0041/S0041_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0041",
    env_sound = 20003
  },
  [1080502005] = {
    id = 1080502005,
    talk_text = function()
      return T_S(10805020050)
    end,
    role_ids = {90110017, 90110018},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502005/1080502005_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080502005/1080502005_90110018.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110018/90110018_0.playable"
    },
    role_position = {"-285:-980", "270:-1155"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10805020055)
    end,
    text_sound_path = "event:/voice_cn/story/S0041/S0041_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0041",
    env_sound = 20003
  }
}
