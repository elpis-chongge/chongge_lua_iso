BasePlotDialogPart5052 = {
  [1010205001] = {
    id = 1010205001,
    talk_text = function()
      return T_S(10102050010)
    end,
    scale = {10000},
    skin = {"common"},
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    next_dialog = 1010205002,
    env_sound = 20001
  },
  [1010205002] = {
    id = 1010205002,
    talk_text = function()
      return T_S(10102050020)
    end,
    scale = {10},
    speak_name = function()
      return T_S(10102050025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001,
    review_head = "90120001"
  },
  [1010206001] = {
    id = 1010206001,
    talk_text = function()
      return T_S(10102060010)
    end,
    next_dialog = 1010206002,
    speak_name = function()
      return T_S(10102060015)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001,
    review_head = "90120001"
  },
  [1010206002] = {
    id = 1010206002,
    talk_text = function()
      return T_S(10102060020)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206002/1010206002_90110001.playable"
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
    next_dialog = 1010206003,
    speak_name = function()
      return T_S(10102060025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1010206003] = {
    id = 1010206003,
    talk_text = function()
      return T_S(10102060030)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206003/1010206003_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"100:-999"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010206004,
    speak_name = function()
      return T_S(10102060035)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1010206004] = {
    id = 1010206004,
    talk_text = function()
      return T_S(10102060040)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206004/1010206004_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-999"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1010206005,
    env_sound = 20001
  },
  [1010206005] = {
    id = 1010206005,
    talk_text = function()
      return T_S(10102060050)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206005/1010206005_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206005/1010206005_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-999", "100:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "80"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010206006,
    speak_name = function()
      return T_S(10102060055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010206006] = {
    id = 1010206006,
    talk_text = function()
      return T_S(10102060060)
    end,
    is_master = 1,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206006/1010206006_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206006/1010206006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-999", "100:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1010206007,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  },
  [1010206007] = {
    id = 1010206007,
    talk_text = function()
      return T_S(10102060070)
    end,
    is_master = 1,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206007/1010206007_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206007/1010206007_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-999", "100:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1010206008,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  },
  [1010206008] = {
    id = 1010206008,
    talk_text = function()
      return T_S(10102060080)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206008/1010206008_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206008/1010206008_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-999", "100:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1010206009,
    speak_name = function()
      return T_S(10102060085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00009_01",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1010206009] = {
    id = 1010206009,
    talk_text = function()
      return T_S(10102060090)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206009/1010206009_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206009/1010206009_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-999", "100:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1010206010,
    speak_name = function()
      return T_S(10102060095)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00009_02",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1010206010] = {
    id = 1010206010,
    talk_text = function()
      return T_S(10102060100)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206010/1010206010_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206010/1010206010_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-999", "100:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010206015,
    speak_name = function()
      return T_S(10102060105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010206011] = {
    id = 1010206011,
    talk_text = function()
      return T_S(10102060110)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206011/1010206011_90110004.playable"
    },
    role_position = {"-100:-1165"},
    effect_in = {"2"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010206016,
    speak_name = function()
      return T_S(10102060115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00013_01",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1010206012] = {
    id = 1010206012,
    talk_text = function()
      return T_S(10102060120)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206012/1010206012_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"50:-1066"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010206013,
    speak_name = function()
      return T_S(10102060125)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010206013] = {
    id = 1010206013,
    talk_text = function()
      return T_S(10102060130)
    end,
    next_dialog = 1010206014,
    env_sound = 20001
  },
  [1010206014] = {
    id = 1010206014,
    talk_text = function()
      return T_S(10102060140)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  },
  [1010206015] = {
    id = 1010206015,
    talk_text = function()
      return T_S(10102060150)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206015/1010206015_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206015/1010206015_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-999", "100:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010206011,
    speak_name = function()
      return T_S(10102060155)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1010206016] = {
    id = 1010206016,
    talk_text = function()
      return T_S(10102060160)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010206016/1010206016_90110004.playable"
    },
    role_position = {"-100:-1165"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010206012,
    speak_name = function()
      return T_S(10102060165)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00013_02",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  }
}
