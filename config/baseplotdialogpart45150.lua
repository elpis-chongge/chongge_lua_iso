BasePlotDialogPart45150 = {
  [1090401001] = {
    id = 1090401001,
    talk_text = function()
      return T_S(10904010010)
    end,
    is_os = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401001/1090401001_90110003.playable"
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
    next_dialog = 1090401030,
    speak_name = function()
      return T_S(10904010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00332",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007,
    open_title_1 = function()
      return T_S(10904010018)
    end,
    open_title_2 = function()
      return T_S(10904010019)
    end
  },
  [1090401002] = {
    id = 1090401002,
    talk_text = function()
      return T_S(10904010020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401002/1090401002_90110003.playable"
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
    next_dialog = 1090401003,
    env_sound = 20007
  },
  [1090401003] = {
    id = 1090401003,
    talk_text = function()
      return T_S(10904010030)
    end,
    is_os = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401003/1090401003_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"3"},
    effect_out_param = {"350"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090401004,
    speak_name = function()
      return T_S(10904010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00335",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1090401004] = {
    id = 1090401004,
    talk_text = function()
      return T_S(10904010040)
    end,
    next_dialog = 1090401005,
    speak_name = function()
      return T_S(10904010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00046",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1090401005] = {
    id = 1090401005,
    talk_text = function()
      return T_S(10904010050)
    end,
    next_dialog = 1090401006,
    speak_name = function()
      return T_S(10904010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00047",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1090401006] = {
    id = 1090401006,
    talk_text = function()
      return T_S(10904010060)
    end,
    next_dialog = 1090401007,
    speak_name = function()
      return T_S(10904010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00336",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007,
    review_head = "90120003"
  },
  [1090401007] = {
    id = 1090401007,
    talk_text = function()
      return T_S(10904010070)
    end,
    role_ids = {90110015},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401007/1090401007_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-200:-1100"},
    effect_in = {"2"},
    effect_in_param = {"270"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {0},
    next_dialog = 1090401008,
    speak_name = function()
      return T_S(10904010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00048",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20007
  },
  [1090401008] = {
    id = 1090401008,
    talk_text = function()
      return T_S(10904010080)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401008/1090401008_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401008/1090401008_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "50:-980"},
    role_shake = {"2:0:1380", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090401009,
    env_sound = 20007,
    force_auto = 1,
    special_sound = 23009
  },
  [1090401009] = {
    id = 1090401009,
    talk_text = function()
      return T_S(10904010090)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401009/1090401009_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401009/1090401009_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "50:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401010,
    speak_name = function()
      return T_S(10904010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00049",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20007
  },
  [1090401010] = {
    id = 1090401010,
    talk_text = function()
      return T_S(10904010100)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401010/1090401010_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401010/1090401010_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401011,
    speak_name = function()
      return T_S(10904010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00337",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1090401011] = {
    id = 1090401011,
    talk_text = function()
      return T_S(10904010110)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401011/1090401011_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401011/1090401011_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401012,
    speak_name = function()
      return T_S(10904010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00338",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401012] = {
    id = 1090401012,
    talk_text = function()
      return T_S(10904010120)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401012/1090401012_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401012/1090401012_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401013,
    speak_name = function()
      return T_S(10904010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00339",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401013] = {
    id = 1090401013,
    talk_text = function()
      return T_S(10904010130)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401013/1090401013_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401013/1090401013_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401014,
    speak_name = function()
      return T_S(10904010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00049_01",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401014] = {
    id = 1090401014,
    talk_text = function()
      return T_S(10904010140)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401014/1090401014_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401014/1090401014_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401015,
    speak_name = function()
      return T_S(10904010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00340",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401015] = {
    id = 1090401015,
    talk_text = function()
      return T_S(10904010150)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401015/1090401015_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401015/1090401015_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401016,
    speak_name = function()
      return T_S(10904010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00050",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401016] = {
    id = 1090401016,
    talk_text = function()
      return T_S(10904010160)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401016/1090401016_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401016/1090401016_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401017,
    speak_name = function()
      return T_S(10904010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00341",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401017] = {
    id = 1090401017,
    talk_text = function()
      return T_S(10904010170)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401017/1090401017_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401017/1090401017_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "50:-980"},
    role_shake = {"2:0:1200", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090401018,
    camera_shake = {
      "1",
      "0",
      "1000"
    },
    env_sound = 20008,
    force_auto = 1,
    special_sound = 23009
  },
  [1090401018] = {
    id = 1090401018,
    talk_text = function()
      return T_S(10904010180)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401018/1090401018_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401018/1090401018_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "50:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401019,
    speak_name = function()
      return T_S(10904010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00051",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401019] = {
    id = 1090401019,
    talk_text = function()
      return T_S(10904010190)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401019/1090401019_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401019/1090401019_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "50:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401020,
    speak_name = function()
      return T_S(10904010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00052",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401020] = {
    id = 1090401020,
    talk_text = function()
      return T_S(10904010200)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401020/1090401020_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401020/1090401020_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401021,
    speak_name = function()
      return T_S(10904010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00342",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401021] = {
    id = 1090401021,
    talk_text = function()
      return T_S(10904010210)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401021/1090401021_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401021/1090401021_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401022,
    speak_name = function()
      return T_S(10904010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00343",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401022] = {
    id = 1090401022,
    talk_text = function()
      return T_S(10904010220)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401022/1090401022_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401022/1090401022_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401023,
    speak_name = function()
      return T_S(10904010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00053",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401023] = {
    id = 1090401023,
    talk_text = function()
      return T_S(10904010230)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401023/1090401023_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401023/1090401023_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401024,
    speak_name = function()
      return T_S(10904010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00054",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401024] = {
    id = 1090401024,
    talk_text = function()
      return T_S(10904010240)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401024/1090401024_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401024/1090401024_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401025,
    speak_name = function()
      return T_S(10904010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00344",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401025] = {
    id = 1090401025,
    talk_text = function()
      return T_S(10904010250)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401025/1090401025_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401025/1090401025_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401026,
    speak_name = function()
      return T_S(10904010255)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00055",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401026] = {
    id = 1090401026,
    talk_text = function()
      return T_S(10904010260)
    end,
    is_os = 1,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401026/1090401026_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401026/1090401026_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401027,
    speak_name = function()
      return T_S(10904010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00345",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401027] = {
    id = 1090401027,
    talk_text = function()
      return T_S(10904010270)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401027/1090401027_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401027/1090401027_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090401028,
    speak_name = function()
      return T_S(10904010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00056",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401028] = {
    id = 1090401028,
    talk_text = function()
      return T_S(10904010280)
    end,
    role_ids = {90110015, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401028/1090401028_90110015.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401028/1090401028_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-1100", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "350"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090401029,
    speak_name = function()
      return T_S(10904010285)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00346",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090401029] = {
    id = 1090401029,
    talk_text = function()
      return T_S(10904010290)
    end,
    role_ids = {90110015},
    scale = {10000, 10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401029/1090401029_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-1100"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"3"},
    effect_out_param = {"350"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10904010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090401030] = {
    id = 1090401030,
    talk_text = function()
      return T_S(10904010300)
    end,
    is_os = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401030/1090401030_90110003.playable"
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
    next_dialog = 1090401031,
    speak_name = function()
      return T_S(10904010305)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00333",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1090401031] = {
    id = 1090401031,
    talk_text = function()
      return T_S(10904010310)
    end,
    is_os = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090401031/1090401031_90110003.playable"
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
    next_dialog = 1090401002,
    speak_name = function()
      return T_S(10904010315)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00334",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1090402001] = {
    id = 1090402001,
    talk_text = function()
      return T_S(10904020010)
    end,
    role_ids = {90110003, 90110015},
    scale = {7500, 7500},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402001/1090402001_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402001/1090402001_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"370:-750", "120:-820"},
    role_shake = {"", ""},
    effect_in = {"3", "3"},
    effect_in_param = {"180", "240"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090402002,
    env_sound = 20008
  },
  [1090402002] = {
    id = 1090402002,
    talk_text = function()
      return T_S(10904020020)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402002/1090402002_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402002/1090402002_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090402003,
    speak_name = function()
      return T_S(10904020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00347",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090402003] = {
    id = 1090402003,
    talk_text = function()
      return T_S(10904020030)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402003/1090402003_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402003/1090402003_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090402004,
    speak_name = function()
      return T_S(10904020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00348",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090402004] = {
    id = 1090402004,
    talk_text = function()
      return T_S(10904020040)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402004/1090402004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402004/1090402004_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090402005,
    speak_name = function()
      return T_S(10904020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00058_01",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090402005] = {
    id = 1090402005,
    talk_text = function()
      return T_S(10904020050)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402005/1090402005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402005/1090402005_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090402006,
    speak_name = function()
      return T_S(10904020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00349",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090402006] = {
    id = 1090402006,
    talk_text = function()
      return T_S(10904020060)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402006/1090402006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402006/1090402006_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090402007,
    env_sound = 20008
  },
  [1090402007] = {
    id = 1090402007,
    talk_text = function()
      return T_S(10904020070)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402007/1090402007_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402007/1090402007_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090402008,
    speak_name = function()
      return T_S(10904020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00350",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090402008] = {
    id = 1090402008,
    talk_text = function()
      return T_S(10904020080)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402008/1090402008_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402008/1090402008_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090402009,
    speak_name = function()
      return T_S(10904020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00351",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090402009] = {
    id = 1090402009,
    talk_text = function()
      return T_S(10904020090)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402009/1090402009_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402009/1090402009_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090402010,
    speak_name = function()
      return T_S(10904020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090402010] = {
    id = 1090402010,
    talk_text = function()
      return T_S(10904020100)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402010/1090402010_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402010/1090402010_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"50:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090402011,
    speak_name = function()
      return T_S(10904020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00352",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090402011] = {
    id = 1090402011,
    talk_text = function()
      return T_S(10904020110)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402011/1090402011_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402011/1090402011_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"50:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090402012,
    speak_name = function()
      return T_S(10904020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090402012] = {
    id = 1090402012,
    talk_text = function()
      return T_S(10904020120)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402012/1090402012_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402012/1090402012_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"50:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090402014,
    env_sound = 20008
  },
  [1090402013] = {
    id = 1090402013,
    talk_text = function()
      return T_S(10904020130)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402013/1090402013_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402013/1090402013_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10904020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00058_02",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  },
  [1090402014] = {
    id = 1090402014,
    talk_text = function()
      return T_S(10904020140)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402014/1090402014_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402014/1090402014_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090402015,
    speak_name = function()
      return T_S(10904020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00353",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20008
  },
  [1090402015] = {
    id = 1090402015,
    talk_text = function()
      return T_S(10904020150)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402015/1090402015_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090402015/1090402015_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10904020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20008
  }
}
