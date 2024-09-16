BasePlotDialogPart100 = {
  [1000301001] = {
    id = 1000301001,
    talk_text = function()
      return T_S(10003010010)
    end,
    next_dialog = 1000301002,
    env_sound = 20007
  },
  [1000301002] = {
    id = 1000301002,
    talk_text = function()
      return T_S(10003010020)
    end,
    is_master = 1,
    next_dialog = 1000301003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00387",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  },
  [1000301003] = {
    id = 1000301003,
    talk_text = function()
      return T_S(10003010030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301003/1000301003_90110004.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1000301004,
    speak_name = function()
      return T_S(10003010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00372",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20007
  },
  [1000301004] = {
    id = 1000301004,
    talk_text = function()
      return T_S(10003010040)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301004/1000301004_90110004.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1000301005,
    speak_name = function()
      return T_S(10003010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00373",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20007
  },
  [1000301005] = {
    id = 1000301005,
    talk_text = function()
      return T_S(10003010050)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301005/1000301005_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301005/1000301005_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1000301006,
    speak_name = function()
      return T_S(10003010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00274",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20007
  },
  [1000301006] = {
    id = 1000301006,
    talk_text = function()
      return T_S(10003010060)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301006/1000301006_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301006/1000301006_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1000301007,
    speak_name = function()
      return T_S(10003010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00301",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20007
  },
  [1000301007] = {
    id = 1000301007,
    talk_text = function()
      return T_S(10003010070)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301007/1000301007_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1000301008,
    speak_name = function()
      return T_S(10003010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00470",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20007
  },
  [1000301008] = {
    id = 1000301008,
    talk_text = function()
      return T_S(10003010080)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301008/1000301008_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301008/1000301008_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1000301009,
    speak_name = function()
      return T_S(10003010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00275",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20007
  },
  [1000301009] = {
    id = 1000301009,
    talk_text = function()
      return T_S(10003010090)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301009/1000301009_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301009/1000301009_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1000301010,
    speak_name = function()
      return T_S(10003010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00471",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20007
  },
  [1000301010] = {
    id = 1000301010,
    talk_text = function()
      return T_S(10003010100)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301010/1000301010_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1000301010/1000301010_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1000301011,
    speak_name = function()
      return T_S(10003010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00275_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20007
  },
  [1000301011] = {
    id = 1000301011,
    talk_text = function()
      return T_S(10003010110)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00388",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  }
}
