BasePlotDialogPart5350 = {
  [1010801001] = {
    id = 1010801001,
    talk_text = function()
      return T_S(10108010010)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801001/1010801001_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"0:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010801002,
    speak_name = function()
      return T_S(10108010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00043",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001,
    open_title_1 = function()
      return T_S(10108010018)
    end,
    open_title_2 = function()
      return T_S(10108010019)
    end
  },
  [1010801002] = {
    id = 1010801002,
    talk_text = function()
      return T_S(10108010020)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801002/1010801002_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801002/1010801002_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"260:-980", "-270:-999"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010801003,
    speak_name = function()
      return T_S(10108010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00025",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1010801003] = {
    id = 1010801003,
    talk_text = function()
      return T_S(10108010030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801003/1010801003_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010801004,
    speak_name = function()
      return T_S(10108010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00043",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1010801004] = {
    id = 1010801004,
    talk_text = function()
      return T_S(10108010040)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801004/1010801004_90110002.playable"
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
    next_dialog = 1010801005,
    speak_name = function()
      return T_S(10108010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00021_02",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010801005] = {
    id = 1010801005,
    talk_text = function()
      return T_S(10108010050)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801005/1010801005_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"2"},
    effect_in_param = {"280"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010801006,
    speak_name = function()
      return T_S(10108010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00044",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1010801006] = {
    id = 1010801006,
    talk_text = function()
      return T_S(10108010060)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801006/1010801006_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801006/1010801006_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1160", "270:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "300"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010801007,
    speak_name = function()
      return T_S(10108010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00044",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1010801007] = {
    id = 1010801007,
    talk_text = function()
      return T_S(10108010070)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801007/1010801007_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-999"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010801008,
    speak_name = function()
      return T_S(10108010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1010801008] = {
    id = 1010801008,
    talk_text = function()
      return T_S(10108010080)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801008/1010801008_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801008/1010801008_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-145:-999", "145:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010801016,
    speak_name = function()
      return T_S(10108010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010801009] = {
    id = 1010801009,
    talk_text = function()
      return T_S(10108010090)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801009/1010801009_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801009/1010801009_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-145:-1000", "145:-1066"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1010801010,
    speak_name = function()
      return T_S(10108010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00027",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1010801010] = {
    id = 1010801010,
    talk_text = function()
      return T_S(10108010100)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801010/1010801010_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"0:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"3"},
    effect_out_param = {"400"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010801011,
    speak_name = function()
      return T_S(10108010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00046",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1010801011] = {
    id = 1010801011,
    talk_text = function()
      return T_S(10108010110)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801011/1010801011_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"2"},
    effect_in_param = {"400"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010801012,
    speak_name = function()
      return T_S(10108010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00045",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1010801012] = {
    id = 1010801012,
    talk_text = function()
      return T_S(10108010120)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801012/1010801012_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801012/1010801012_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-185:-999", "185:-1066"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010801013,
    speak_name = function()
      return T_S(10108010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00022_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010801013] = {
    id = 1010801013,
    talk_text = function()
      return T_S(10108010130)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801013/1010801013_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801013/1010801013_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-185:-999", "185:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010801014,
    speak_name = function()
      return T_S(10108010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010801014] = {
    id = 1010801014,
    talk_text = function()
      return T_S(10108010140)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801014/1010801014_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"2"},
    effect_in_param = {"300"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010801015,
    speak_name = function()
      return T_S(10108010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00046",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1010801015] = {
    id = 1010801015,
    talk_text = function()
      return T_S(10108010150)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801015/1010801015_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801015/1010801015_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-1160", "280:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "300"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010801017,
    speak_name = function()
      return T_S(10108010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00024",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010801016] = {
    id = 1010801016,
    talk_text = function()
      return T_S(10108010160)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801016/1010801016_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"0:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010801009,
    speak_name = function()
      return T_S(10108010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00045",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1010801017] = {
    id = 1010801017,
    talk_text = function()
      return T_S(10108010170)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801017/1010801017_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010801017/1010801017_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-1160", "280:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(10108010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00047",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1010802001] = {
    id = 1010802001,
    talk_text = function()
      return T_S(10108020010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010802001/1010802001_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-999"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010802002,
    speak_name = function()
      return T_S(10108020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00028",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1010802002] = {
    id = 1010802002,
    talk_text = function()
      return T_S(10108020020)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010802002/1010802002_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-999"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1010802003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1010802003] = {
    id = 1010802003,
    talk_text = function()
      return T_S(10108020030)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010802003/1010802003_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-999"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1010802004,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00027",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1010802004] = {
    id = 1010802004,
    talk_text = function()
      return T_S(10108020040)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010802004/1010802004_90110001.playable"
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
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10108020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00029",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  }
}
