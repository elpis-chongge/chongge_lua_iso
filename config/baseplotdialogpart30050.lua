BasePlotDialogPart30050 = {
  [1060201001] = {
    id = 1060201001,
    talk_text = function()
      return T_S(10602010010)
    end,
    next_dialog = 1060201002,
    env_sound = 20009,
    open_title_1 = function()
      return T_S(10602010018)
    end,
    open_title_2 = function()
      return T_S(10602010019)
    end
  },
  [1060201002] = {
    id = 1060201002,
    talk_text = function()
      return T_S(10602010020)
    end,
    next_dialog = 1060201046,
    env_sound = 20009
  },
  [1060201003] = {
    id = 1060201003,
    talk_text = function()
      return T_S(10602010030)
    end,
    next_dialog = 1060201004,
    speak_name = function()
      return T_S(10602010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00025",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009,
    review_head = "90120001"
  },
  [1060201004] = {
    id = 1060201004,
    talk_text = function()
      return T_S(10602010040)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201004/1060201004_90110002.playable"
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
    next_dialog = 1060201005,
    speak_name = function()
      return T_S(10602010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00127",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201005] = {
    id = 1060201005,
    talk_text = function()
      return T_S(10602010050)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201005/1060201005_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201005/1060201005_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_1.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201006,
    speak_name = function()
      return T_S(10602010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201006] = {
    id = 1060201006,
    talk_text = function()
      return T_S(10602010060)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201006/1060201006_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201006/1060201006_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201007,
    speak_name = function()
      return T_S(10602010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00128",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201007] = {
    id = 1060201007,
    talk_text = function()
      return T_S(10602010070)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201007/1060201007_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201007/1060201007_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201008,
    speak_name = function()
      return T_S(10602010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00027",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201008] = {
    id = 1060201008,
    talk_text = function()
      return T_S(10602010080)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201008/1060201008_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201008/1060201008_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-360:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201009,
    speak_name = function()
      return T_S(10602010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00129",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201009] = {
    id = 1060201009,
    talk_text = function()
      return T_S(10602010090)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201009/1060201009_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201009/1060201009_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201010,
    speak_name = function()
      return T_S(10602010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00028",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201010] = {
    id = 1060201010,
    talk_text = function()
      return T_S(10602010100)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201010/1060201010_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201010/1060201010_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201011,
    speak_name = function()
      return T_S(10602010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00130",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201011] = {
    id = 1060201011,
    talk_text = function()
      return T_S(10602010110)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201011/1060201011_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201011/1060201011_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201047,
    speak_name = function()
      return T_S(10602010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00029_01",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201012] = {
    id = 1060201012,
    talk_text = function()
      return T_S(10602010120)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201012/1060201012_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201012/1060201012_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201013,
    speak_name = function()
      return T_S(10602010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00131",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201013] = {
    id = 1060201013,
    talk_text = function()
      return T_S(10602010130)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201013/1060201013_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201013/1060201013_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201014,
    env_sound = 20009
  },
  [1060201014] = {
    id = 1060201014,
    talk_text = function()
      return T_S(10602010140)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201014/1060201014_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201014/1060201014_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201015,
    speak_name = function()
      return T_S(10602010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00030",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201015] = {
    id = 1060201015,
    talk_text = function()
      return T_S(10602010150)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201015/1060201015_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201015/1060201015_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201016,
    env_sound = 20009
  },
  [1060201016] = {
    id = 1060201016,
    talk_text = function()
      return T_S(10602010160)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201016/1060201016_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201016/1060201016_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201017,
    speak_name = function()
      return T_S(10602010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00132",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201017] = {
    id = 1060201017,
    talk_text = function()
      return T_S(10602010170)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201017/1060201017_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201017/1060201017_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201048,
    env_sound = 20009
  },
  [1060201018] = {
    id = 1060201018,
    talk_text = function()
      return T_S(10602010180)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201018/1060201018_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201018/1060201018_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201019,
    speak_name = function()
      return T_S(10602010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00133",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201019] = {
    id = 1060201019,
    talk_text = function()
      return T_S(10602010190)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201019/1060201019_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201019/1060201019_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201049,
    speak_name = function()
      return T_S(10602010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00031",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201020] = {
    id = 1060201020,
    talk_text = function()
      return T_S(10602010200)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201020/1060201020_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201020/1060201020_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201021,
    speak_name = function()
      return T_S(10602010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00134",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201021] = {
    id = 1060201021,
    talk_text = function()
      return T_S(10602010210)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201021/1060201021_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201021/1060201021_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201022,
    speak_name = function()
      return T_S(10602010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00033",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201022] = {
    id = 1060201022,
    talk_text = function()
      return T_S(10602010220)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201022/1060201022_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201022/1060201022_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201050,
    speak_name = function()
      return T_S(10602010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00034",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201023] = {
    id = 1060201023,
    talk_text = function()
      return T_S(10602010230)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201023/1060201023_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201023/1060201023_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201051,
    speak_name = function()
      return T_S(10602010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00135",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201024] = {
    id = 1060201024,
    talk_text = function()
      return T_S(10602010240)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201024/1060201024_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201024/1060201024_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201052,
    speak_name = function()
      return T_S(10602010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00036",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201025] = {
    id = 1060201025,
    talk_text = function()
      return T_S(10602010250)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201025/1060201025_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201025/1060201025_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201026,
    env_sound = 20009
  },
  [1060201026] = {
    id = 1060201026,
    talk_text = function()
      return T_S(10602010260)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201026/1060201026_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201026/1060201026_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201027,
    speak_name = function()
      return T_S(10602010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00038",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201027] = {
    id = 1060201027,
    talk_text = function()
      return T_S(10602010270)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201027/1060201027_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201027/1060201027_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201028,
    speak_name = function()
      return T_S(10602010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00137",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201028] = {
    id = 1060201028,
    talk_text = function()
      return T_S(10602010280)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201028/1060201028_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201028/1060201028_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201053,
    speak_name = function()
      return T_S(10602010285)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00039",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201029] = {
    id = 1060201029,
    talk_text = function()
      return T_S(10602010290)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201029/1060201029_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201029/1060201029_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201030,
    env_sound = 20009
  },
  [1060201030] = {
    id = 1060201030,
    talk_text = function()
      return T_S(10602010300)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201030/1060201030_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201030/1060201030_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201031,
    env_sound = 20009
  },
  [1060201031] = {
    id = 1060201031,
    talk_text = function()
      return T_S(10602010310)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201031/1060201031_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201031/1060201031_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201032,
    env_sound = 20009
  },
  [1060201032] = {
    id = 1060201032,
    talk_text = function()
      return T_S(10602010320)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201032/1060201032_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201032/1060201032_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201033,
    speak_name = function()
      return T_S(10602010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00041",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201033] = {
    id = 1060201033,
    talk_text = function()
      return T_S(10602010330)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201033/1060201033_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201033/1060201033_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201034,
    speak_name = function()
      return T_S(10602010335)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00138",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201034] = {
    id = 1060201034,
    talk_text = function()
      return T_S(10602010340)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201034/1060201034_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201034/1060201034_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201035,
    speak_name = function()
      return T_S(10602010345)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00139",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201035] = {
    id = 1060201035,
    talk_text = function()
      return T_S(10602010350)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201035/1060201035_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201035/1060201035_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201036,
    env_sound = 20009
  },
  [1060201036] = {
    id = 1060201036,
    talk_text = function()
      return T_S(10602010360)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201036/1060201036_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201036/1060201036_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201037,
    speak_name = function()
      return T_S(10602010365)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00140",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201037] = {
    id = 1060201037,
    talk_text = function()
      return T_S(10602010370)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201037/1060201037_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201037/1060201037_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201054,
    speak_name = function()
      return T_S(10602010375)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00042",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201038] = {
    id = 1060201038,
    talk_text = function()
      return T_S(10602010380)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201038/1060201038_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201038/1060201038_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_1.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201039,
    env_sound = 20009
  },
  [1060201039] = {
    id = 1060201039,
    talk_text = function()
      return T_S(10602010390)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201039/1060201039_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201039/1060201039_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201040,
    speak_name = function()
      return T_S(10602010395)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00044",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201040] = {
    id = 1060201040,
    talk_text = function()
      return T_S(10602010400)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201040/1060201040_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201040/1060201040_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201041,
    speak_name = function()
      return T_S(10602010405)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00045",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201041] = {
    id = 1060201041,
    talk_text = function()
      return T_S(10602010410)
    end,
    is_os = 0,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201041/1060201041_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201041/1060201041_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1060201042,
    env_sound = 20009
  },
  [1060201042] = {
    id = 1060201042,
    talk_text = function()
      return T_S(10602010420)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201042/1060201042_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201042/1060201042_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201043,
    speak_name = function()
      return T_S(10602010425)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00046",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201043] = {
    id = 1060201043,
    talk_text = function()
      return T_S(10602010430)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201043/1060201043_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201043/1060201043_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201044,
    env_sound = 20009
  },
  [1060201044] = {
    id = 1060201044,
    talk_text = function()
      return T_S(10602010440)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201044/1060201044_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201044/1060201044_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201045,
    speak_name = function()
      return T_S(10602010445)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00141",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201045] = {
    id = 1060201045,
    talk_text = function()
      return T_S(10602010450)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201045/1060201045_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201045/1060201045_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10602010455)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00047",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201046] = {
    id = 1060201046,
    talk_text = function()
      return T_S(10602010460)
    end,
    next_dialog = 1060201003,
    env_sound = 20009
  },
  [1060201047] = {
    id = 1060201047,
    talk_text = function()
      return T_S(10602010470)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201047/1060201047_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201047/1060201047_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201012,
    speak_name = function()
      return T_S(10602010475)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00029_02",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201048] = {
    id = 1060201048,
    talk_text = function()
      return T_S(10602010480)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201048/1060201048_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201048/1060201048_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060201018,
    env_sound = 20009
  },
  [1060201049] = {
    id = 1060201049,
    talk_text = function()
      return T_S(10602010490)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201049/1060201049_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201049/1060201049_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201020,
    speak_name = function()
      return T_S(10602010495)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00032",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201050] = {
    id = 1060201050,
    talk_text = function()
      return T_S(10602010500)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201050/1060201050_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201050/1060201050_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201023,
    speak_name = function()
      return T_S(10602010505)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00035",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201051] = {
    id = 1060201051,
    talk_text = function()
      return T_S(10602010510)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201051/1060201051_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201051/1060201051_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060201024,
    speak_name = function()
      return T_S(10602010515)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00136",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20009
  },
  [1060201052] = {
    id = 1060201052,
    talk_text = function()
      return T_S(10602010520)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201052/1060201052_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201052/1060201052_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201025,
    speak_name = function()
      return T_S(10602010525)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00037",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201053] = {
    id = 1060201053,
    talk_text = function()
      return T_S(10602010530)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201053/1060201053_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201053/1060201053_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-200:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201029,
    speak_name = function()
      return T_S(10602010535)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00040",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201054] = {
    id = 1060201054,
    talk_text = function()
      return T_S(10602010540)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201054/1060201054_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201054/1060201054_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201055,
    speak_name = function()
      return T_S(10602010545)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00043_01",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060201055] = {
    id = 1060201055,
    talk_text = function()
      return T_S(10602010550)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201055/1060201055_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060201055/1060201055_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_1.playable"
    },
    role_position = {"200:-1066", "-50:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060201038,
    speak_name = function()
      return T_S(10602010555)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00043_02",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20009
  },
  [1060202001] = {
    id = 1060202001,
    talk_text = function()
      return T_S(10602020010)
    end,
    next_dialog = 1060202002,
    env_sound = 20002
  },
  [1060202002] = {
    id = 1060202002,
    talk_text = function()
      return T_S(10602020020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202002/1060202002_90110003.playable"
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
    next_dialog = 1060202003,
    speak_name = function()
      return T_S(10602020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00175",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20002
  },
  [1060202003] = {
    id = 1060202003,
    talk_text = function()
      return T_S(10602020030)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202003/1060202003_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202003/1060202003_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"1:0:1100", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "240"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060202004,
    speak_name = function()
      return T_S(10602020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00172",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20002
  },
  [1060202004] = {
    id = 1060202004,
    talk_text = function()
      return T_S(10602020040)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202004/1060202004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202004/1060202004_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060202005,
    speak_name = function()
      return T_S(10602020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00176",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20002
  },
  [1060202005] = {
    id = 1060202005,
    talk_text = function()
      return T_S(10602020050)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202005/1060202005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202005/1060202005_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060202006,
    speak_name = function()
      return T_S(10602020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00173",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20002
  },
  [1060202006] = {
    id = 1060202006,
    talk_text = function()
      return T_S(10602020060)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202006/1060202006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202006/1060202006_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060202007,
    speak_name = function()
      return T_S(10602020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00177",
    text_sound_bank = "bank:/voice_cn/sty/M0003_2",
    env_sound = 20002
  },
  [1060202007] = {
    id = 1060202007,
    talk_text = function()
      return T_S(10602020070)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202007/1060202007_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060202007/1060202007_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "0:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"2", "2"},
    effect_out_param = {"200", "360"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10602020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00174",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20002
  }
}
