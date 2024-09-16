BasePlotDialogPart30200 = {
  [1060501001] = {
    id = 1060501001,
    talk_text = function()
      return T_S(10605010010)
    end,
    next_dialog = 1060501002,
    env_sound = 20002,
    open_title_1 = function()
      return T_S(10605010018)
    end,
    open_title_2 = function()
      return T_S(10605010019)
    end
  },
  [1060501002] = {
    id = 1060501002,
    talk_text = function()
      return T_S(10605010020)
    end,
    next_dialog = 1060501016,
    env_sound = 20002
  },
  [1060501003] = {
    id = 1060501003,
    talk_text = function()
      return T_S(10605010030)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501003/1060501003_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501004,
    speak_name = function()
      return T_S(10605010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00149",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20002
  },
  [1060501004] = {
    id = 1060501004,
    talk_text = function()
      return T_S(10605010040)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501004/1060501004_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501018,
    speak_name = function()
      return T_S(10605010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20002
  },
  [1060501005] = {
    id = 1060501005,
    talk_text = function()
      return T_S(10605010050)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501005/1060501005_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-180:-980"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501019,
    speak_name = function()
      return T_S(10605010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00203",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20002
  },
  [1060501006] = {
    id = 1060501006,
    talk_text = function()
      return T_S(10605010060)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501006/1060501006_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"150:-1080"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501021,
    speak_name = function()
      return T_S(10605010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00065",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20002
  },
  [1060501007] = {
    id = 1060501007,
    talk_text = function()
      return T_S(10605010070)
    end,
    next_dialog = 1060501008,
    env_sound = 20002
  },
  [1060501008] = {
    id = 1060501008,
    talk_text = function()
      return T_S(10605010080)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501008/1060501008_90110001.playable"
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
    next_dialog = 1060501009,
    speak_name = function()
      return T_S(10605010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00187",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20002
  },
  [1060501009] = {
    id = 1060501009,
    talk_text = function()
      return T_S(10605010090)
    end,
    role_ids = {90110001, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501009/1060501009_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501009/1060501009_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"270:-1000", "-270:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"3", "0"},
    effect_out_param = {"180", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060501010,
    speak_name = function()
      return T_S(10605010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20002
  },
  [1060501010] = {
    id = 1060501010,
    talk_text = function()
      return T_S(10605010100)
    end,
    is_master = 1,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501010/1060501010_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1060501011,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00186",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20002
  },
  [1060501011] = {
    id = 1060501011,
    talk_text = function()
      return T_S(10605010110)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501011/1060501011_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501012,
    speak_name = function()
      return T_S(10605010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20002
  },
  [1060501012] = {
    id = 1060501012,
    talk_text = function()
      return T_S(10605010120)
    end,
    is_master = 1,
    role_ids = {90110007},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501012/1060501012_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-800"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1060501013,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00187",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20002
  },
  [1060501013] = {
    id = 1060501013,
    talk_text = function()
      return T_S(10605010130)
    end,
    role_ids = {90110007},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501013/1060501013_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-800"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501014,
    speak_name = function()
      return T_S(10605010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20002
  },
  [1060501014] = {
    id = 1060501014,
    talk_text = function()
      return T_S(10605010140)
    end,
    role_ids = {90110007, 90110002},
    scale = {12000, 9000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501014/1060501014_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501014/1060501014_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-180:-800", "280:-960"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060501015,
    speak_name = function()
      return T_S(10605010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00150",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20002
  },
  [1060501015] = {
    id = 1060501015,
    talk_text = function()
      return T_S(10605010150)
    end,
    is_master = 1,
    role_ids = {90110007, 90110002},
    scale = {9000, 9000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501015/1060501015_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501015/1060501015_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-660", "280:-960"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"3", "3"},
    effect_out_param = {"240", "180"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00188",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20002
  },
  [1060501016] = {
    id = 1060501016,
    talk_text = function()
      return T_S(10605010160)
    end,
    next_dialog = 1060501017,
    env_sound = 20002
  },
  [1060501017] = {
    id = 1060501017,
    talk_text = function()
      return T_S(10605010170)
    end,
    next_dialog = 1060501003,
    env_sound = 20002
  },
  [1060501018] = {
    id = 1060501018,
    talk_text = function()
      return T_S(10605010180)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501018/1060501018_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501005,
    speak_name = function()
      return T_S(10605010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00058",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20002
  },
  [1060501019] = {
    id = 1060501019,
    talk_text = function()
      return T_S(10605010190)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501019/1060501019_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-180:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501020,
    speak_name = function()
      return T_S(10605010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00204",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20002
  },
  [1060501020] = {
    id = 1060501020,
    talk_text = function()
      return T_S(10605010200)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501020/1060501020_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-180:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501006,
    speak_name = function()
      return T_S(10605010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00205",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20002
  },
  [1060501021] = {
    id = 1060501021,
    talk_text = function()
      return T_S(10605010210)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060501021/1060501021_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"150:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060501007,
    speak_name = function()
      return T_S(10605010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00066",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20002
  },
  [1060502001] = {
    id = 1060502001,
    talk_text = function()
      return T_S(10605020010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502001/1060502001_90110001.playable"
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
    next_dialog = 1060502002,
    speak_name = function()
      return T_S(10605020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00188",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  },
  [1060502002] = {
    id = 1060502002,
    talk_text = function()
      return T_S(10605020020)
    end,
    next_dialog = 1060502003,
    speak_head = 90120008,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10605020025)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00021",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502003] = {
    id = 1060502003,
    talk_text = function()
      return T_S(10605020030)
    end,
    next_dialog = 1060502033,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020035)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502004] = {
    id = 1060502004,
    talk_text = function()
      return T_S(10605020040)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502004/1060502004_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060502005,
    speak_name = function()
      return T_S(10605020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20007
  },
  [1060502005] = {
    id = 1060502005,
    talk_text = function()
      return T_S(10605020050)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502005/1060502005_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1060502006,
    speak_head = 90120008,
    speak_head_actions = {
      "idle",
      "talk",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10605020055)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00024",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502006] = {
    id = 1060502006,
    talk_text = function()
      return T_S(10605020060)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502006/1060502006_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1060502034,
    speak_head = 90120008,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10605020065)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00025",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502007] = {
    id = 1060502007,
    talk_text = function()
      return T_S(10605020070)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502007/1060502007_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060502008,
    speak_name = function()
      return T_S(10605020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00063",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20007
  },
  [1060502008] = {
    id = 1060502008,
    talk_text = function()
      return T_S(10605020080)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502008/1060502008_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502008/1060502008_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-200:-700", "180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "210"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060502009,
    speak_name = function()
      return T_S(10605020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00189",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  },
  [1060502009] = {
    id = 1060502009,
    talk_text = function()
      return T_S(10605020090)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502009/1060502009_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502009/1060502009_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-200:-700", "180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060502010,
    speak_name = function()
      return T_S(10605020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00064",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20007
  },
  [1060502010] = {
    id = 1060502010,
    talk_text = function()
      return T_S(10605020100)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502010/1060502010_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502010/1060502010_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-200:-700", "180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1060502011,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020105)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00027",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502011] = {
    id = 1060502011,
    talk_text = function()
      return T_S(10605020110)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502011/1060502011_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502011/1060502011_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-200:-700", "180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"2", "0"},
    effect_out_param = {"200", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1060502012,
    speak_name = function()
      return T_S(10605020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00065",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20007
  },
  [1060502012] = {
    id = 1060502012,
    talk_text = function()
      return T_S(10605020120)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502012/1060502012_90110001.playable"
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
    light_role = {0},
    next_dialog = 1060502013,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020125)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00028",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502013] = {
    id = 1060502013,
    talk_text = function()
      return T_S(10605020130)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502013/1060502013_90110001.playable"
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
    next_dialog = 1060502014,
    speak_name = function()
      return T_S(10605020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00190",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  },
  [1060502014] = {
    id = 1060502014,
    talk_text = function()
      return T_S(10605020140)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502014/1060502014_90110001.playable"
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
    light_role = {0},
    next_dialog = 1060502015,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020145)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00029",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502015] = {
    id = 1060502015,
    talk_text = function()
      return T_S(10605020150)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502015/1060502015_90110001.playable"
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
    next_dialog = 1060502016,
    speak_name = function()
      return T_S(10605020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00191",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  },
  [1060502016] = {
    id = 1060502016,
    talk_text = function()
      return T_S(10605020160)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502016/1060502016_90110001.playable"
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
    next_dialog = 1060502017,
    speak_name = function()
      return T_S(10605020165)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00192",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  },
  [1060502017] = {
    id = 1060502017,
    talk_text = function()
      return T_S(10605020170)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502017/1060502017_90110001.playable"
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
    next_dialog = 1060502018,
    speak_name = function()
      return T_S(10605020175)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00193",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  },
  [1060502018] = {
    id = 1060502018,
    talk_text = function()
      return T_S(10605020180)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502018/1060502018_90110001.playable"
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
    light_role = {0},
    next_dialog = 1060502035,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020185)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00030",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502019] = {
    id = 1060502019,
    talk_text = function()
      return T_S(10605020190)
    end,
    is_master = 1,
    next_dialog = 1060502036,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00189",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20007
  },
  [1060502020] = {
    id = 1060502020,
    talk_text = function()
      return T_S(10605020200)
    end,
    next_dialog = 1060502021,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020205)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00032",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502021] = {
    id = 1060502021,
    talk_text = function()
      return T_S(10605020210)
    end,
    is_master = 1,
    next_dialog = 1060502022,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00191",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20007
  },
  [1060502022] = {
    id = 1060502022,
    talk_text = function()
      return T_S(10605020220)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502022/1060502022_90110009.playable"
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
    next_dialog = 1060502023,
    speak_name = function()
      return T_S(10605020225)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00067",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20007
  },
  [1060502023] = {
    id = 1060502023,
    talk_text = function()
      return T_S(10605020230)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502023/1060502023_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1060502024,
    speak_name = function()
      return T_S(10605020235)
    end,
    env_sound = 20007,
    review_head = "90120001:90120002:90120003"
  },
  [1060502024] = {
    id = 1060502024,
    talk_text = function()
      return T_S(10605020240)
    end,
    next_dialog = 1060502025,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020245)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00033",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502025] = {
    id = 1060502025,
    talk_text = function()
      return T_S(10605020250)
    end,
    next_dialog = 1060502026,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020255)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00034",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502026] = {
    id = 1060502026,
    talk_text = function()
      return T_S(10605020260)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502026/1060502026_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060502027,
    speak_name = function()
      return T_S(10605020265)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00066",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20007
  },
  [1060502027] = {
    id = 1060502027,
    talk_text = function()
      return T_S(10605020270)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502027/1060502027_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1060502028,
    speak_name = function()
      return T_S(10605020275)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00067",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20007
  },
  [1060502028] = {
    id = 1060502028,
    talk_text = function()
      return T_S(10605020280)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502028/1060502028_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502028/1060502028_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-200:-700", "180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "210"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060502037,
    speak_name = function()
      return T_S(10605020285)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00194",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  },
  [1060502029] = {
    id = 1060502029,
    talk_text = function()
      return T_S(10605020290)
    end,
    is_master = 1,
    next_dialog = 1060502030,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00192",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20007
  },
  [1060502030] = {
    id = 1060502030,
    talk_text = function()
      return T_S(10605020300)
    end,
    next_dialog = 1060502031,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020305)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00035",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502031] = {
    id = 1060502031,
    talk_text = function()
      return T_S(10605020310)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502031/1060502031_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"3"},
    effect_in_param = {"200"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1060502032,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020315)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00036",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502032] = {
    id = 1060502032,
    talk_text = function()
      return T_S(10605020320)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502032/1060502032_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10605020325)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00068",
    text_sound_bank = "bank:/voice_cn/sty/M0017",
    env_sound = 20007
  },
  [1060502033] = {
    id = 1060502033,
    talk_text = function()
      return T_S(10605020330)
    end,
    next_dialog = 1060502004,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020335)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502034] = {
    id = 1060502034,
    talk_text = function()
      return T_S(10605020340)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502034/1060502034_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1060502007,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020345)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502035] = {
    id = 1060502035,
    talk_text = function()
      return T_S(10605020350)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502035/1060502035_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1060502019,
    speak_head = 90120008,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10605020355)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00031",
    text_sound_bank = "bank:/voice_cn/sty/S0020",
    env_sound = 20007
  },
  [1060502036] = {
    id = 1060502036,
    talk_text = function()
      return T_S(10605020360)
    end,
    is_master = 1,
    next_dialog = 1060502020,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00190",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20007
  },
  [1060502037] = {
    id = 1060502037,
    talk_text = function()
      return T_S(10605020370)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502037/1060502037_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1060502037/1060502037_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-200:-700", "180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1060502029,
    speak_name = function()
      return T_S(10605020375)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00195",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20007
  }
}
