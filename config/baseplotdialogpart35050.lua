BasePlotDialogPart35050 = {
  [1070201001] = {
    id = 1070201001,
    next_dialog = 1070201002,
    camera_shake = {
      "3",
      "0",
      "1800"
    },
    env_sound = 20004,
    open_title_1 = function()
      return T_S(10702010018)
    end,
    open_title_2 = function()
      return T_S(10702010019)
    end,
    force_auto = 1,
    special_sound = 23016,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_SomeSwords.prefab",
      "0"
    }
  },
  [1070201002] = {
    id = 1070201002,
    talk_text = function()
      return T_S(10702010020)
    end,
    next_dialog = 1070201003,
    env_sound = 20004
  },
  [1070201003] = {
    id = 1070201003,
    talk_text = function()
      return T_S(10702010030)
    end,
    next_dialog = 1070201041,
    env_sound = 20004
  },
  [1070201004] = {
    id = 1070201004,
    talk_text = function()
      return T_S(10702010040)
    end,
    is_os = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201004/1070201004_90110003.playable"
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
    next_dialog = 1070201005,
    speak_name = function()
      return T_S(10702010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00212",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1070201005] = {
    id = 1070201005,
    talk_text = function()
      return T_S(10702010050)
    end,
    next_dialog = 1070201006,
    camera_shake = {
      "2",
      "0",
      "800"
    },
    env_sound = 20004,
    force_auto = 1,
    special_sound = 23021
  },
  [1070201006] = {
    id = 1070201006,
    talk_text = function()
      return T_S(10702010060)
    end,
    next_dialog = 1070201007,
    env_sound = 20004
  },
  [1070201007] = {
    id = 1070201007,
    talk_text = function()
      return T_S(10702010070)
    end,
    is_os = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201007/1070201007_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1070201008,
    speak_name = function()
      return T_S(10702010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00213",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1070201008] = {
    id = 1070201008,
    talk_text = function()
      return T_S(10702010080)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201008/1070201008_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1070201009,
    speak_name = function()
      return T_S(10702010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00029",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201009] = {
    id = 1070201009,
    talk_text = function()
      return T_S(10702010090)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201009/1070201009_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1070201010,
    speak_name = function()
      return T_S(10702010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00030",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201010] = {
    id = 1070201010,
    talk_text = function()
      return T_S(10702010100)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201010/1070201010_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1070201011,
    speak_name = function()
      return T_S(10702010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00156",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20004
  },
  [1070201011] = {
    id = 1070201011,
    talk_text = function()
      return T_S(10702010110)
    end,
    next_dialog = 1070201012,
    env_sound = 20004
  },
  [1070201012] = {
    id = 1070201012,
    talk_text = function()
      return T_S(10702010120)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201012/1070201012_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201012/1070201012_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-333:-1033", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"2", "3"},
    effect_in_param = {"180", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1070201013,
    speak_name = function()
      return T_S(10702010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00214",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1070201013] = {
    id = 1070201013,
    talk_text = function()
      return T_S(10702010130)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201013/1070201013_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201013/1070201013_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-333:-1033", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1070201014,
    speak_name = function()
      return T_S(10702010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00031",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201014] = {
    id = 1070201014,
    talk_text = function()
      return T_S(10702010140)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201014/1070201014_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201014/1070201014_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-333:-1033", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1070201040,
    speak_name = function()
      return T_S(10702010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00032",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201015] = {
    id = 1070201015,
    talk_text = function()
      return T_S(10702010150)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201015/1070201015_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201015/1070201015_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-158:-1033", "240:-980"},
    role_shake = {"", "3:600:1200"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1070201016,
    env_sound = 20004
  },
  [1070201016] = {
    id = 1070201016,
    talk_text = function()
      return T_S(10702010160)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201016/1070201016_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201016/1070201016_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-158:-1033", "240:-980"},
    role_shake = {"", "3:0:1700"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1070201017,
    speak_name = function()
      return T_S(10702010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00215",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1070201017] = {
    id = 1070201017,
    talk_text = function()
      return T_S(10702010170)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201017/1070201017_90110001.playable"
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
    next_dialog = 1070201018,
    speak_name = function()
      return T_S(10702010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00200",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20004
  },
  [1070201018] = {
    id = 1070201018,
    talk_text = function()
      return T_S(10702010180)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201018/1070201018_90110001.playable"
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
    light_role = {1},
    next_dialog = 1070201019,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00197_01",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20004
  },
  [1070201019] = {
    id = 1070201019,
    talk_text = function()
      return T_S(10702010190)
    end,
    is_master = 1,
    next_dialog = 1070201020,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00197_02",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20004
  },
  [1070201020] = {
    id = 1070201020,
    talk_text = function()
      return T_S(10702010200)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201020/1070201020_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201020/1070201020_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-233:-1033", "170:-980"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1070201042,
    speak_name = function()
      return T_S(10702010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00034",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201021] = {
    id = 1070201021,
    talk_text = function()
      return T_S(10702010210)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201021/1070201021_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201021/1070201021_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-233:-1033", "170:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1070201022,
    speak_name = function()
      return T_S(10702010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00036",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201022] = {
    id = 1070201022,
    talk_text = function()
      return T_S(10702010220)
    end,
    next_dialog = 1070201023,
    env_sound = 20004
  },
  [1070201023] = {
    id = 1070201023,
    talk_text = function()
      return T_S(10702010230)
    end,
    is_master = 1,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201023/1070201023_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1070201024,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00198",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20004
  },
  [1070201024] = {
    id = 1070201024,
    talk_text = function()
      return T_S(10702010240)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201024/1070201024_90110009.playable"
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
    next_dialog = 1070201025,
    speak_name = function()
      return T_S(10702010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00073",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1070201025] = {
    id = 1070201025,
    talk_text = function()
      return T_S(10702010250)
    end,
    is_master = 1,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201025/1070201025_90110009.playable"
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
    light_role = {1},
    next_dialog = 1070201026,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00199",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20004
  },
  [1070201026] = {
    id = 1070201026,
    talk_text = function()
      return T_S(10702010260)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201026/1070201026_90110009.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1070201027,
    speak_name = function()
      return T_S(10702010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00074",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20004
  },
  [1070201027] = {
    id = 1070201027,
    talk_text = function()
      return T_S(10702010270)
    end,
    is_master = 1,
    next_dialog = 1070201028,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00200",
    text_sound_bank = "bank:/voice_cn/sty/M0000_2",
    env_sound = 20004
  },
  [1070201028] = {
    id = 1070201028,
    talk_text = function()
      return T_S(10702010280)
    end,
    next_dialog = 1070201029,
    env_sound = 20004
  },
  [1070201029] = {
    id = 1070201029,
    talk_text = function()
      return T_S(10702010290)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201029/1070201029_90110011.playable"
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
    next_dialog = 1070201043,
    speak_name = function()
      return T_S(10702010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00037",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201030] = {
    id = 1070201030,
    talk_text = function()
      return T_S(10702010300)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201030/1070201030_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1070201031,
    speak_name = function()
      return T_S(10702010305)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00039",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201031] = {
    id = 1070201031,
    talk_text = function()
      return T_S(10702010310)
    end,
    next_dialog = 1070201032,
    camera_shake = {
      "1",
      "0",
      "1000"
    },
    env_sound = 20004
  },
  [1070201032] = {
    id = 1070201032,
    talk_text = function()
      return T_S(10702010320)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201032/1070201032_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"1:500:1200"},
    effect_in = {"2"},
    effect_in_param = {"240"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1070201033,
    speak_name = function()
      return T_S(10702010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00216",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1070201033] = {
    id = 1070201033,
    talk_text = function()
      return T_S(10702010330)
    end,
    is_master = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201033/1070201033_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1070201034,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00201",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20004
  },
  [1070201034] = {
    id = 1070201034,
    talk_text = function()
      return T_S(10702010340)
    end,
    is_master = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201034/1070201034_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1070201035,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00202",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20004
  },
  [1070201035] = {
    id = 1070201035,
    talk_text = function()
      return T_S(10702010350)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201035/1070201035_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201035/1070201035_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-150:-980", "120:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1070201036,
    speak_name = function()
      return T_S(10702010355)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00217",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1070201036] = {
    id = 1070201036,
    talk_text = function()
      return T_S(10702010360)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201036/1070201036_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201036/1070201036_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-150:-980", "120:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1070201037,
    speak_name = function()
      return T_S(10702010365)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00157",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20004
  },
  [1070201037] = {
    id = 1070201037,
    talk_text = function()
      return T_S(10702010370)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201037/1070201037_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1070201038,
    speak_name = function()
      return T_S(10702010375)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00040",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201038] = {
    id = 1070201038,
    talk_text = function()
      return T_S(10702010380)
    end,
    next_dialog = 1070201039,
    env_sound = 20004
  },
  [1070201039] = {
    id = 1070201039,
    talk_text = function()
      return T_S(10702010390)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00203",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20004
  },
  [1070201040] = {
    id = 1070201040,
    talk_text = function()
      return T_S(10702010400)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201040/1070201040_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201040/1070201040_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-333:-1033", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1070201015,
    speak_name = function()
      return T_S(10702010405)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00033",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201041] = {
    id = 1070201041,
    talk_text = function()
      return T_S(10702010410)
    end,
    next_dialog = 1070201004,
    env_sound = 20004
  },
  [1070201042] = {
    id = 1070201042,
    talk_text = function()
      return T_S(10702010420)
    end,
    role_ids = {90110011, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201042/1070201042_90110011.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201042/1070201042_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-233:-1033", "170:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1070201021,
    speak_name = function()
      return T_S(10702010425)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00035",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070201043] = {
    id = 1070201043,
    talk_text = function()
      return T_S(10702010430)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070201043/1070201043_90110011.playable"
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
    next_dialog = 1070201030,
    speak_name = function()
      return T_S(10702010435)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00038",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004
  },
  [1070202001] = {
    id = 1070202001,
    talk_text = function()
      return T_S(10702020010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202001/1070202001_90110001.playable"
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
    next_dialog = 1070202002,
    speak_name = function()
      return T_S(10702020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00201",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20008
  },
  [1070202002] = {
    id = 1070202002,
    talk_text = function()
      return T_S(10702020020)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202002/1070202002_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202002/1070202002_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1000", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1070202019,
    speak_name = function()
      return T_S(10702020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00158",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20008
  },
  [1070202003] = {
    id = 1070202003,
    talk_text = function()
      return T_S(10702020030)
    end,
    is_master = 0,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202003/1070202003_90110009.playable"
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
    next_dialog = 1070202020,
    speak_name = function()
      return T_S(10702020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00075",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20008
  },
  [1070202004] = {
    id = 1070202004,
    talk_text = function()
      return T_S(10702020040)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202004/1070202004_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202004/1070202004_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-1080", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1070202005,
    speak_name = function()
      return T_S(10702020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00220",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20008
  },
  [1070202005] = {
    id = 1070202005,
    talk_text = function()
      return T_S(10702020050)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202005/1070202005_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202005/1070202005_90110004.playable"
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
    next_dialog = 1070202021,
    speak_name = function()
      return T_S(10702020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00221",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20008
  },
  [1070202006] = {
    id = 1070202006,
    talk_text = function()
      return T_S(10702020060)
    end,
    is_master = 1,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202006/1070202006_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202006/1070202006_90110004.playable"
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
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1070202007,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00204",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202007] = {
    id = 1070202007,
    talk_text = function()
      return T_S(10702020070)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202007/1070202007_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202007/1070202007_90110004.playable"
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
    next_dialog = 1070202008,
    speak_name = function()
      return T_S(10702020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00223",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20008
  },
  [1070202008] = {
    id = 1070202008,
    talk_text = function()
      return T_S(10702020080)
    end,
    is_master = 1,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202008/1070202008_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202008/1070202008_90110004.playable"
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
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1070202022,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00205",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202009] = {
    id = 1070202009,
    talk_text = function()
      return T_S(10702020090)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202009/1070202009_90110001.playable"
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
    next_dialog = 1070202010,
    speak_name = function()
      return T_S(10702020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00202",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20008
  },
  [1070202010] = {
    id = 1070202010,
    talk_text = function()
      return T_S(10702020100)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202010/1070202010_90110001.playable"
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
    next_dialog = 1070202011,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00207",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202011] = {
    id = 1070202011,
    talk_text = function()
      return T_S(10702020110)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202011/1070202011_90110001.playable"
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
    next_dialog = 1070202023,
    speak_name = function()
      return T_S(10702020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00203",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20008
  },
  [1070202012] = {
    id = 1070202012,
    talk_text = function()
      return T_S(10702020120)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202012/1070202012_90110001.playable"
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
    next_dialog = 1070202013,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00208",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202013] = {
    id = 1070202013,
    talk_text = function()
      return T_S(10702020130)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202013/1070202013_90110001.playable"
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
    next_dialog = 1070202014,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00209",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202014] = {
    id = 1070202014,
    talk_text = function()
      return T_S(10702020140)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202014/1070202014_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1070202015,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00210",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202015] = {
    id = 1070202015,
    talk_text = function()
      return T_S(10702020150)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202015/1070202015_90110009.playable"
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
    next_dialog = 1070202016,
    speak_name = function()
      return T_S(10702020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00077",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20008
  },
  [1070202016] = {
    id = 1070202016,
    talk_text = function()
      return T_S(10702020160)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202016/1070202016_90110009.playable"
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
    next_dialog = 1070202017,
    speak_name = function()
      return T_S(10702020165)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00078",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20008
  },
  [1070202017] = {
    id = 1070202017,
    talk_text = function()
      return T_S(10702020170)
    end,
    is_master = 1,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202017/1070202017_90110009.playable"
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
    light_role = {1},
    next_dialog = 1070202018,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00211",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202018] = {
    id = 1070202018,
    talk_text = function()
      return T_S(10702020180)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00212",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202019] = {
    id = 1070202019,
    talk_text = function()
      return T_S(10702020190)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202019/1070202019_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202019/1070202019_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1000", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1070202003,
    speak_name = function()
      return T_S(10702020195)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00159",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20008
  },
  [1070202020] = {
    id = 1070202020,
    talk_text = function()
      return T_S(10702020200)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202020/1070202020_90110009.playable"
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
    next_dialog = 1070202004,
    speak_name = function()
      return T_S(10702020205)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00076",
    text_sound_bank = "bank:/voice_cn/sty/M0015_1",
    env_sound = 20008
  },
  [1070202021] = {
    id = 1070202021,
    talk_text = function()
      return T_S(10702020210)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202021/1070202021_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202021/1070202021_90110004.playable"
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
    next_dialog = 1070202006,
    speak_name = function()
      return T_S(10702020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00222",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20008
  },
  [1070202022] = {
    id = 1070202022,
    talk_text = function()
      return T_S(10702020220)
    end,
    is_master = 1,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202022/1070202022_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202022/1070202022_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"270:-1080", "-300:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1070202009,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00206",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20008
  },
  [1070202023] = {
    id = 1070202023,
    talk_text = function()
      return T_S(10702020230)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1070202023/1070202023_90110001.playable"
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
    next_dialog = 1070202012,
    speak_name = function()
      return T_S(10702020235)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00204",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20008
  }
}
