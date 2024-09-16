BasePlotDialogPart5000 = {
  [1010101001] = {
    id = 1010101001,
    talk_text = function()
      return T_S(10101010010)
    end,
    scale = {10000},
    skin = {"broken"},
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    next_dialog = 1010101002,
    env_sound = 20002
  },
  [1010101002] = {
    id = 1010101002,
    talk_text = function()
      return T_S(10101010020)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010101002/1010101002_90110001.playable"
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
    speak_role = {0},
    light_role = {1},
    next_dialog = 1010101003,
    env_sound = 20002
  },
  [1010101003] = {
    id = 1010101003,
    talk_text = function()
      return T_S(10101010030)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010101003/1010101003_90110001.playable"
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
    next_dialog = 1010101004,
    env_sound = 20002
  },
  [1010101004] = {
    id = 1010101004,
    talk_text = function()
      return T_S(10101010040)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010101004/1010101004_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010101005,
    speak_name = function()
      return T_S(10101010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1010101005] = {
    id = 1010101005,
    talk_text = function()
      return T_S(10101010050)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010101005/1010101005_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1010101006,
    env_sound = 20002
  },
  [1010101006] = {
    id = 1010101006,
    talk_text = function()
      return T_S(10101010060)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010101006/1010101006_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    env_sound = 20002
  },
  [1010102001] = {
    id = 1010102001,
    talk_text = function()
      return T_S(10101020010)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102001/1010102001_90110001.playable"
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
    speak_role = {0},
    light_role = {1},
    next_dialog = 1010102002,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1010102002] = {
    id = 1010102002,
    talk_text = function()
      return T_S(10101020020)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102002/1010102002_90110001.playable"
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
    next_dialog = 1010102003,
    speak_name = function()
      return T_S(10101020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1010102003] = {
    id = 1010102003,
    talk_text = function()
      return T_S(10101020030)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102003/1010102003_90110001.playable"
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
    next_dialog = 1010102004,
    speak_name = function()
      return T_S(10101020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1010102004] = {
    id = 1010102004,
    talk_text = function()
      return T_S(10101020040)
    end,
    is_master = 0,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102004/1010102004_90110001.playable"
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
    next_dialog = 1010102005,
    env_sound = 20002
  },
  [1010102005] = {
    id = 1010102005,
    talk_text = function()
      return T_S(10101020050)
    end,
    is_master = 1,
    is_os = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102005/1010102005_90110001.playable"
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
    next_dialog = 1010102006,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1010102006] = {
    id = 1010102006,
    talk_text = function()
      return T_S(10101020060)
    end,
    is_master = 0,
    is_os = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102006/1010102006_90110001.playable"
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
    next_dialog = 1010102007,
    env_sound = 20002
  },
  [1010102007] = {
    id = 1010102007,
    talk_text = function()
      return T_S(10101020070)
    end,
    role_ids = {90110001},
    scale = {13000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102007/1010102007_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1345"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010102015,
    speak_name = function()
      return T_S(10101020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00004_01",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1010102008] = {
    id = 1010102008,
    talk_text = function()
      return T_S(10101020080)
    end,
    role_ids = {90110001},
    scale = {18000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102008/1010102008_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1950"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1010102009,
    env_sound = 20002
  },
  [1010102009] = {
    id = 1010102009,
    talk_text = function()
      return T_S(10101020090)
    end,
    role_ids = {90110001},
    scale = {16000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102009/1010102009_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1725"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1010102010,
    env_sound = 20002
  },
  [1010102010] = {
    id = 1010102010,
    talk_text = function()
      return T_S(10101020100)
    end,
    role_ids = {90110001},
    scale = {23000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102010/1010102010_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-2550"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"200"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010102016,
    speak_name = function()
      return T_S(10101020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00005_01",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1010102015] = {
    id = 1010102015,
    talk_text = function()
      return T_S(10101020150)
    end,
    role_ids = {90110001},
    scale = {18000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102015/1010102015_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1950"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010102008,
    speak_name = function()
      return T_S(10101020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00004_02",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1010102016] = {
    id = 1010102016,
    talk_text = function()
      return T_S(10101020160)
    end,
    role_ids = {90110001},
    scale = {23000},
    skin = {"broken"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010102016/1010102016_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-2550"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10101020165)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00005_02",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  }
}
