BasePlotDialogPart50050 = {
  [1100201001] = {
    id = 1100201001,
    talk_text = function()
      return T_S(11002010010)
    end,
    next_dialog = 1100201002,
    env_sound = 20005,
    open_title_1 = function()
      return T_S(11002010018)
    end,
    open_title_2 = function()
      return T_S(11002010019)
    end
  },
  [1100201002] = {
    id = 1100201002,
    talk_text = function()
      return T_S(11002010020)
    end,
    next_dialog = 1100201003,
    env_sound = 20005
  },
  [1100201003] = {
    id = 1100201003,
    talk_text = function()
      return T_S(11002010030)
    end,
    is_os = 1,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201003/1100201003_90110002.playable"
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
    next_dialog = 1100201004,
    speak_name = function()
      return T_S(11002010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00247_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20005
  },
  [1100201004] = {
    id = 1100201004,
    talk_text = function()
      return T_S(11002010040)
    end,
    is_os = 1,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201004/1100201004_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100201005,
    speak_name = function()
      return T_S(11002010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00247_02",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20005
  },
  [1100201005] = {
    id = 1100201005,
    talk_text = function()
      return T_S(11002010050)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201005/1100201005_90110002.playable"
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
    next_dialog = 1100201007,
    env_sound = 20005
  },
  [1100201006] = {
    id = 1100201006,
    talk_text = function()
      return T_S(11002010060)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201006/1100201006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201020,
    env_sound = 20005
  },
  [1100201007] = {
    id = 1100201007,
    cg_text = function()
      return T_S(11002010077)
    end,
    role_ids = {90110002},
    cg_position_scale = "550:-150:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201007/1100201007_90110002.playable"
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
    next_dialog = 1100201008,
    speak_name = function()
      return T_S(11002010075)
    end,
    text_sound_path = "event:/voice_cn/story/S0067/S0067_story_00001_01",
    text_sound_bank = "bank:/voice_cn/sty/S0067",
    env_sound = 20005,
    review_head = "90210001"
  },
  [1100201008] = {
    id = 1100201008,
    cg_text = function()
      return T_S(11002010087)
    end,
    role_ids = {90110002},
    cg_position_scale = "360:-110:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201008/1100201008_90110002.playable"
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
    next_dialog = 1100201009,
    speak_name = function()
      return T_S(11002010085)
    end,
    text_sound_path = "event:/voice_cn/story/S0067/S0067_story_00001_02",
    text_sound_bank = "bank:/voice_cn/sty/S0067",
    env_sound = 20005,
    review_head = "90210001"
  },
  [1100201009] = {
    id = 1100201009,
    cg_text = function()
      return T_S(11002010097)
    end,
    role_ids = {90110002},
    cg_position_scale = "-660:-130:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201009/1100201009_90110002.playable"
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
    next_dialog = 1100201010,
    speak_name = function()
      return T_S(11002010095)
    end,
    text_sound_path = "event:/voice_cn/story/S0068/S0068_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0068",
    env_sound = 20005,
    review_head = "90210002"
  },
  [1100201010] = {
    id = 1100201010,
    cg_text = function()
      return T_S(11002010107)
    end,
    role_ids = {90110002},
    cg_position_scale = "440:-140:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201010/1100201010_90110002.playable"
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
    next_dialog = 1100201011,
    speak_name = function()
      return T_S(11002010105)
    end,
    text_sound_path = "event:/voice_cn/story/S0067/S0067_story_00002_01",
    text_sound_bank = "bank:/voice_cn/sty/S0067",
    env_sound = 20005,
    review_head = "90210001"
  },
  [1100201011] = {
    id = 1100201011,
    cg_text = function()
      return T_S(11002010117)
    end,
    role_ids = {90110002},
    cg_position_scale = "520:-100:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201011/1100201011_90110002.playable"
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
    next_dialog = 1100201012,
    speak_name = function()
      return T_S(11002010115)
    end,
    text_sound_path = "event:/voice_cn/story/S0067/S0067_story_00002_02",
    text_sound_bank = "bank:/voice_cn/sty/S0067",
    env_sound = 20005,
    review_head = "90210001"
  },
  [1100201012] = {
    id = 1100201012,
    cg_text = function()
      return T_S(11002010127)
    end,
    role_ids = {90110002},
    cg_position_scale = "-660:-130:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201012/1100201012_90110002.playable"
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
    next_dialog = 1100201013,
    speak_name = function()
      return T_S(11002010125)
    end,
    text_sound_path = "event:/voice_cn/story/S0068/S0068_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0068",
    env_sound = 20005,
    review_head = "90210002"
  },
  [1100201013] = {
    id = 1100201013,
    talk_text = function()
      return T_S(11002010130)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201013/1100201013_90110002.playable"
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
    next_dialog = 1100201014,
    env_sound = 20005
  },
  [1100201014] = {
    id = 1100201014,
    cg_text = function()
      return T_S(11002010147)
    end,
    role_ids = {90110002},
    cg_position_scale = "-520:-170:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201014/1100201014_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201015,
    speak_name = function()
      return T_S(11002010145)
    end,
    text_sound_path = "event:/voice_cn/story/S0068/S0068_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0068",
    env_sound = 20005,
    review_head = "90210002"
  },
  [1100201015] = {
    id = 1100201015,
    cg_text = function()
      return T_S(11002010157)
    end,
    role_ids = {90110002},
    cg_position_scale = "170:-145:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201015/1100201015_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201016,
    speak_name = function()
      return T_S(11002010155)
    end,
    text_sound_path = "event:/voice_cn/story/S0068/S0068_story_00004_01",
    text_sound_bank = "bank:/voice_cn/sty/S0068",
    env_sound = 20005,
    review_head = "90210002"
  },
  [1100201016] = {
    id = 1100201016,
    cg_text = function()
      return T_S(11002010167)
    end,
    role_ids = {90110002},
    cg_position_scale = "-380:-120:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201016/1100201016_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201017,
    speak_name = function()
      return T_S(11002010165)
    end,
    text_sound_path = "event:/voice_cn/story/S0068/S0068_story_00004_02",
    text_sound_bank = "bank:/voice_cn/sty/S0068",
    env_sound = 20005,
    review_head = "90210002"
  },
  [1100201017] = {
    id = 1100201017,
    cg_text = function()
      return T_S(11002010177)
    end,
    role_ids = {90110002},
    cg_position_scale = "140:-95:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201017/1100201017_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201018,
    speak_name = function()
      return T_S(11002010175)
    end,
    text_sound_path = "event:/voice_cn/story/S0068/S0068_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0068",
    env_sound = 20005,
    review_head = "90210002"
  },
  [1100201018] = {
    id = 1100201018,
    cg_text = function()
      return T_S(11002010187)
    end,
    role_ids = {90110002},
    cg_position_scale = "-580:-70:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201018/1100201018_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201019,
    speak_name = function()
      return T_S(11002010185)
    end,
    text_sound_path = "event:/voice_cn/story/S0068/S0068_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0068",
    env_sound = 20005,
    review_head = "90210002"
  },
  [1100201019] = {
    id = 1100201019,
    talk_text = function()
      return T_S(11002010190)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201019/1100201019_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201006,
    env_sound = 20005
  },
  [1100201020] = {
    id = 1100201020,
    talk_text = function()
      return T_S(11002010200)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201020/1100201020_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100201021,
    speak_name = function()
      return T_S(11002010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00248",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20005
  },
  [1100201021] = {
    id = 1100201021,
    talk_text = function()
      return T_S(11002010210)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201021/1100201021_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100201022,
    speak_name = function()
      return T_S(11002010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00249",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20005
  },
  [1100201022] = {
    id = 1100201022,
    talk_text = function()
      return T_S(11002010220)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201022/1100201022_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_1.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201023,
    env_sound = 20005
  },
  [1100201023] = {
    id = 1100201023,
    talk_text = function()
      return T_S(11002010230)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201023/1100201023_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100201024,
    speak_name = function()
      return T_S(11002010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00250",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20005
  },
  [1100201024] = {
    id = 1100201024,
    talk_text = function()
      return T_S(11002010240)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201024/1100201024_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100201025,
    env_sound = 20005
  },
  [1100201025] = {
    id = 1100201025,
    talk_text = function()
      return T_S(11002010250)
    end,
    scale = {10000},
    next_dialog = 1100201027,
    env_sound = 20005
  },
  [1100201027] = {
    id = 1100201027,
    talk_text = function()
      return T_S(11002010270)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201027/1100201027_90110002.playable"
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
    next_dialog = 1100201028,
    speak_name = function()
      return T_S(11002010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00251",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20005
  },
  [1100201028] = {
    id = 1100201028,
    talk_text = function()
      return T_S(11002010280)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201028/1100201028_90110002.playable"
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
    next_dialog = 1100201029,
    env_sound = 20005
  },
  [1100201029] = {
    id = 1100201029,
    talk_text = function()
      return T_S(11002010290)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201029/1100201029_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100201030,
    speak_name = function()
      return T_S(11002010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00252",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20005,
    review_head = "90210001"
  },
  [1100201030] = {
    id = 1100201030,
    cg_text = function()
      return T_S(11002010307)
    end,
    role_ids = {90110002},
    cg_position_scale = "300:0:8200",
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201030/1100201030_90110002.playable"
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
    next_dialog = 1100201031,
    speak_name = function()
      return T_S(11002010305)
    end,
    text_sound_path = "event:/voice_cn/story/S0068/S0068_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0068",
    env_sound = 20003,
    review_head = "90210002"
  },
  [1100201031] = {
    id = 1100201031,
    talk_text = function()
      return T_S(11002010310)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201031/1100201031_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100201032,
    speak_name = function()
      return T_S(11002010315)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00253_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100201032] = {
    id = 1100201032,
    talk_text = function()
      return T_S(11002010320)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201032/1100201032_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100201033,
    speak_name = function()
      return T_S(11002010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00253_02",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100201033] = {
    id = 1100201033,
    talk_text = function()
      return T_S(11002010330)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201033/1100201033_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100201034,
    speak_name = function()
      return T_S(11002010335)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00253_03",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100201034] = {
    id = 1100201034,
    talk_text = function()
      return T_S(11002010340)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100201034/1100201034_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    env_sound = 20003
  },
  [1100202001] = {
    id = 1100202001,
    talk_text = function()
      return T_S(11002020010)
    end,
    is_master = 0,
    next_dialog = 1100202002,
    env_sound = 20003
  },
  [1100202002] = {
    id = 1100202002,
    talk_text = function()
      return T_S(11002020020)
    end,
    next_dialog = 1100202003,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00255_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202003] = {
    id = 1100202003,
    talk_text = function()
      return T_S(11002020030)
    end,
    next_dialog = 1100202004,
    speak_head = 90120042,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(11002020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00255_02",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202004] = {
    id = 1100202004,
    talk_text = function()
      return T_S(11002020040)
    end,
    next_dialog = 1100202005,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00256",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202005] = {
    id = 1100202005,
    talk_text = function()
      return T_S(11002020050)
    end,
    next_dialog = 1100202006,
    env_sound = 20003
  },
  [1100202006] = {
    id = 1100202006,
    talk_text = function()
      return T_S(11002020060)
    end,
    next_dialog = 1100202007,
    env_sound = 20003
  },
  [1100202007] = {
    id = 1100202007,
    talk_text = function()
      return T_S(11002020070)
    end,
    next_dialog = 1100202008,
    env_sound = 20003
  },
  [1100202008] = {
    id = 1100202008,
    talk_text = function()
      return T_S(11002020080)
    end,
    next_dialog = 1100202009,
    env_sound = 20003
  },
  [1100202009] = {
    id = 1100202009,
    talk_text = function()
      return T_S(11002020090)
    end,
    next_dialog = 1100202010,
    env_sound = 20003
  },
  [1100202010] = {
    id = 1100202010,
    talk_text = function()
      return T_S(11002020100)
    end,
    next_dialog = 1100202011,
    env_sound = 20003
  },
  [1100202011] = {
    id = 1100202011,
    talk_text = function()
      return T_S(11002020110)
    end,
    next_dialog = 1100202012,
    env_sound = 20003
  },
  [1100202012] = {
    id = 1100202012,
    talk_text = function()
      return T_S(11002020120)
    end,
    is_os = 1,
    next_dialog = 1100202013,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00257",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202013] = {
    id = 1100202013,
    talk_text = function()
      return T_S(11002020130)
    end,
    is_os = 0,
    next_dialog = 1100202014,
    env_sound = 20003,
    special_sound = 23025
  },
  [1100202014] = {
    id = 1100202014,
    talk_text = function()
      return T_S(11002020140)
    end,
    next_dialog = 1100202015,
    env_sound = 20003
  },
  [1100202015] = {
    id = 1100202015,
    talk_text = function()
      return T_S(11002020150)
    end,
    next_dialog = 1100202016,
    env_sound = 20003
  },
  [1100202016] = {
    id = 1100202016,
    talk_text = function()
      return T_S(11002020160)
    end,
    next_dialog = 1100202017,
    env_sound = 20003,
    special_sound = 23026
  },
  [1100202017] = {
    id = 1100202017,
    talk_text = function()
      return T_S(11002020170)
    end,
    next_dialog = 1100202018,
    env_sound = 20003
  },
  [1100202018] = {
    id = 1100202018,
    talk_text = function()
      return T_S(11002020180)
    end,
    next_dialog = 1100202019,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020185)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00258_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202019] = {
    id = 1100202019,
    talk_text = function()
      return T_S(11002020190)
    end,
    next_dialog = 1100202020,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020195)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00258_02",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202020] = {
    id = 1100202020,
    talk_text = function()
      return T_S(11002020200)
    end,
    next_dialog = 1100202021,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020205)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00258_03",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202021] = {
    id = 1100202021,
    talk_text = function()
      return T_S(11002020210)
    end,
    next_dialog = 1100202022,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(11002020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00258_04",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202022] = {
    id = 1100202022,
    talk_text = function()
      return T_S(11002020220)
    end,
    next_dialog = 1100202023,
    env_sound = 20003
  },
  [1100202023] = {
    id = 1100202023,
    talk_text = function()
      return T_S(11002020230)
    end,
    next_dialog = 1100202024,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(11002020235)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00259",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202024] = {
    id = 1100202024,
    talk_text = function()
      return T_S(11002020240)
    end,
    next_dialog = 1100202025,
    env_sound = 20003
  },
  [1100202025] = {
    id = 1100202025,
    talk_text = function()
      return T_S(11002020250)
    end,
    next_dialog = 1100202026,
    env_sound = 20003
  },
  [1100202026] = {
    id = 1100202026,
    talk_text = function()
      return T_S(11002020260)
    end,
    next_dialog = 1100202027,
    speak_head = 90120042,
    speak_head_actions = {
      "talk",
      "idle",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(11002020265)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00260",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202027] = {
    id = 1100202027,
    talk_text = function()
      return T_S(11002020270)
    end,
    next_dialog = 1100202028,
    env_sound = 20003
  },
  [1100202028] = {
    id = 1100202028,
    talk_text = function()
      return T_S(11002020280)
    end,
    next_dialog = 1100202029,
    env_sound = 20003
  },
  [1100202029] = {
    id = 1100202029,
    talk_text = function()
      return T_S(11002020290)
    end,
    next_dialog = 1100202030,
    env_sound = 20003
  },
  [1100202030] = {
    id = 1100202030,
    talk_text = function()
      return T_S(11002020300)
    end,
    next_dialog = 1100202031,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020305)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00261",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202031] = {
    id = 1100202031,
    talk_text = function()
      return T_S(11002020310)
    end,
    next_dialog = 1100202032,
    env_sound = 20003
  },
  [1100202032] = {
    id = 1100202032,
    talk_text = function()
      return T_S(11002020320)
    end,
    next_dialog = 1100202033,
    env_sound = 20003
  },
  [1100202033] = {
    id = 1100202033,
    talk_text = function()
      return T_S(11002020330)
    end,
    next_dialog = 1100202034,
    env_sound = 20003
  },
  [1100202034] = {
    id = 1100202034,
    talk_text = function()
      return T_S(11002020340)
    end,
    next_dialog = 1100202035,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(11002020345)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00262_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202035] = {
    id = 1100202035,
    talk_text = function()
      return T_S(11002020350)
    end,
    next_dialog = 1100202036,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(11002020355)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00262_02",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202036] = {
    id = 1100202036,
    talk_text = function()
      return T_S(11002020360)
    end,
    next_dialog = 1100202037,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "angry",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020365)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00262_03",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202037] = {
    id = 1100202037,
    talk_text = function()
      return T_S(11002020370)
    end,
    next_dialog = 1100202038,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(11002020375)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00262_04",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202038] = {
    id = 1100202038,
    talk_text = function()
      return T_S(11002020380)
    end,
    next_dialog = 1100202039,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "blink"
    },
    speak_name = function()
      return T_S(11002020385)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00263",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202039] = {
    id = 1100202039,
    talk_text = function()
      return T_S(11002020390)
    end,
    next_dialog = 1100202040,
    env_sound = 20003,
    special_sound = 23027
  },
  [1100202040] = {
    id = 1100202040,
    talk_text = function()
      return T_S(11002020400)
    end,
    next_dialog = 1100202041,
    env_sound = 20003
  },
  [1100202041] = {
    id = 1100202041,
    talk_text = function()
      return T_S(11002020410)
    end,
    next_dialog = 1100202042,
    env_sound = 20003
  },
  [1100202042] = {
    id = 1100202042,
    talk_text = function()
      return T_S(11002020420)
    end,
    next_dialog = 1100202043,
    env_sound = 20003
  },
  [1100202043] = {
    id = 1100202043,
    talk_text = function()
      return T_S(11002020430)
    end,
    next_dialog = 1100202044,
    speak_head = 90120042,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(11002020435)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00264",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100202044] = {
    id = 1100202044,
    talk_text = function()
      return T_S(11002020440)
    end,
    next_dialog = 1100202045,
    env_sound = 20003,
    special_sound = 23025
  },
  [1100202045] = {
    id = 1100202045,
    talk_text = function()
      return T_S(11002020450)
    end,
    next_dialog = 1100202046,
    env_sound = 20003
  },
  [1100202046] = {
    id = 1100202046,
    talk_text = function()
      return T_S(11002020460)
    end,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002020465)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00265",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  }
}
