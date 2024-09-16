BasePlotDialogPart25050 = {
  [1050201001] = {
    id = 1050201001,
    talk_text = function()
      return T_S(10502010010)
    end,
    scale = {10000},
    next_dialog = 1050201002,
    env_sound = 20002
  },
  [1050201002] = {
    id = 1050201002,
    talk_text = function()
      return T_S(10502010020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201002/1050201002_90110003.playable"
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
    next_dialog = 1050201003,
    speak_name = function()
      return T_S(10502010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00125",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20002
  },
  [1050201003] = {
    id = 1050201003,
    talk_text = function()
      return T_S(10502010030)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201003/1050201003_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201003/1050201003_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "210"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050201004,
    speak_name = function()
      return T_S(10502010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00137",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20002
  },
  [1050201004] = {
    id = 1050201004,
    talk_text = function()
      return T_S(10502010040)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201004/1050201004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201004/1050201004_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1050201005,
    speak_name = function()
      return T_S(10502010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00126",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20002
  },
  [1050201005] = {
    id = 1050201005,
    talk_text = function()
      return T_S(10502010050)
    end,
    next_dialog = 1050201006,
    speak_name = function()
      return T_S(10502010055)
    end,
    env_sound = 20002,
    review_head = "90120001"
  },
  [1050201006] = {
    id = 1050201006,
    talk_text = function()
      return T_S(10502010060)
    end,
    next_dialog = 1050201007,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10502010065)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050201007] = {
    id = 1050201007,
    talk_text = function()
      return T_S(10502010070)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201007/1050201007_90110002.playable"
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
    next_dialog = 1050201008,
    speak_name = function()
      return T_S(10502010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00111",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20002
  },
  [1050201008] = {
    id = 1050201008,
    talk_text = function()
      return T_S(10502010080)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201008/1050201008_90110002.playable"
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
    next_dialog = 1050201009,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10502010085)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050201009] = {
    id = 1050201009,
    talk_text = function()
      return T_S(10502010090)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201009/1050201009_90110002.playable"
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
    next_dialog = 1050201010,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10502010095)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050201010] = {
    id = 1050201010,
    talk_text = function()
      return T_S(10502010100)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201010/1050201010_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201010/1050201010_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "210"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050201011,
    speak_name = function()
      return T_S(10502010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00138",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20002
  },
  [1050201011] = {
    id = 1050201011,
    talk_text = function()
      return T_S(10502010110)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201011/1050201011_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201011/1050201011_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1050201012,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10502010115)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050201012] = {
    id = 1050201012,
    talk_text = function()
      return T_S(10502010120)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201012/1050201012_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201012/1050201012_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1050201013,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10502010125)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050201013] = {
    id = 1050201013,
    talk_text = function()
      return T_S(10502010130)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201013/1050201013_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201013/1050201013_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1050201014,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10502010135)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050201014] = {
    id = 1050201014,
    talk_text = function()
      return T_S(10502010140)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201014/1050201014_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201014/1050201014_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1050201015,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10502010145)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050201015] = {
    id = 1050201015,
    talk_text = function()
      return T_S(10502010150)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201015/1050201015_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201015/1050201015_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1050201016,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10502010155)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050201016] = {
    id = 1050201016,
    talk_text = function()
      return T_S(10502010160)
    end,
    next_dialog = 1050201017,
    env_sound = 20002
  },
  [1050201017] = {
    id = 1050201017,
    talk_text = function()
      return T_S(10502010170)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201017/1050201017_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1050201018,
    speak_name = function()
      return T_S(10502010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00127",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20002
  },
  [1050201018] = {
    id = 1050201018,
    talk_text = function()
      return T_S(10502010180)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050201018/1050201018_90110003.playable"
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
    speak_role = {0},
    light_role = {0},
    speak_head = 90120008,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10502010185)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20002
  },
  [1050202001] = {
    id = 1050202001,
    talk_text = function()
      return T_S(10502020010)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202001/1050202001_90110003.playable"
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
    next_dialog = 1050202002,
    speak_name = function()
      return T_S(10502020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00128",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20005
  },
  [1050202002] = {
    id = 1050202002,
    talk_text = function()
      return T_S(10502020020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202002/1050202002_90110003.playable"
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1050202003,
    speak_head = 90120008,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10502020025)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20005
  },
  [1050202003] = {
    id = 1050202003,
    talk_text = function()
      return T_S(10502020030)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202003/1050202003_90110003.playable"
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
    next_dialog = 1050202004,
    speak_name = function()
      return T_S(10502020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00129",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20005
  },
  [1050202004] = {
    id = 1050202004,
    talk_text = function()
      return T_S(10502020040)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202004/1050202004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202004/1050202004_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-310:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050202005,
    speak_name = function()
      return T_S(10502020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00112",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20005
  },
  [1050202005] = {
    id = 1050202005,
    talk_text = function()
      return T_S(10502020050)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202005/1050202005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202005/1050202005_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-310:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1050202006,
    speak_name = function()
      return T_S(10502020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00130",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20005
  },
  [1050202006] = {
    id = 1050202006,
    talk_text = function()
      return T_S(10502020060)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202006/1050202006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202006/1050202006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-310:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050202007,
    speak_name = function()
      return T_S(10502020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00113",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20005
  },
  [1050202007] = {
    id = 1050202007,
    talk_text = function()
      return T_S(10502020070)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202007/1050202007_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202007/1050202007_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-310:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1050202008,
    speak_name = function()
      return T_S(10502020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00131",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20005
  },
  [1050202008] = {
    id = 1050202008,
    talk_text = function()
      return T_S(10502020080)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202008/1050202008_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202008/1050202008_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-310:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050202009,
    speak_name = function()
      return T_S(10502020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00114",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20005
  },
  [1050202009] = {
    id = 1050202009,
    talk_text = function()
      return T_S(10502020090)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202009/1050202009_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050202009/1050202009_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-310:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    speak_head = 90120008,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10502020095)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20005
  }
}
