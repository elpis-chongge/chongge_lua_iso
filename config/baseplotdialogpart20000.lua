BasePlotDialogPart20000 = {
  [1040101001] = {
    id = 1040101001,
    next_dialog = 1040101002,
    camera_shake = {
      "2",
      "0",
      "1800"
    },
    env_sound = 20001,
    special_sound = 23016
  },
  [1040101002] = {
    id = 1040101002,
    talk_text = function()
      return T_S(10401010020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101002/1040101002_90110003.playable"
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
    next_dialog = 1040101003,
    speak_name = function()
      return T_S(10401010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00064",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040101003] = {
    id = 1040101003,
    talk_text = function()
      return T_S(10401010030)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101003/1040101003_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101003/1040101003_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "220"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040101004,
    speak_name = function()
      return T_S(10401010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00090",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1040101004] = {
    id = 1040101004,
    talk_text = function()
      return T_S(10401010040)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101004/1040101004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101004/1040101004_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040101005,
    speak_name = function()
      return T_S(10401010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00065",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040101005] = {
    id = 1040101005,
    talk_text = function()
      return T_S(10401010050)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101005/1040101005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101005/1040101005_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-0:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040101006,
    speak_name = function()
      return T_S(10401010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00091",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1040101006] = {
    id = 1040101006,
    talk_text = function()
      return T_S(10401010060)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101006/1040101006_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101006/1040101006_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-320:-1160", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"2", "3"},
    effect_in_param = {"200", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040101007,
    speak_name = function()
      return T_S(10401010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00065",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1040101007] = {
    id = 1040101007,
    talk_text = function()
      return T_S(10401010070)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101007/1040101007_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040101007/1040101007_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-320:-1160", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(10401010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00074",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1040102001] = {
    id = 1040102001,
    talk_text = function()
      return T_S(10401020010)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102001/1040102001_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"30:-980"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040102002,
    speak_name = function()
      return T_S(10401020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00066",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040102002] = {
    id = 1040102002,
    talk_text = function()
      return T_S(10401020020)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102002/1040102002_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102002/1040102002_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"250:-980", "-320:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040102003,
    speak_name = function()
      return T_S(10401020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00075",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1040102003] = {
    id = 1040102003,
    talk_text = function()
      return T_S(10401020030)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102003/1040102003_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102003/1040102003_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"250:-980", "-320:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040102004,
    speak_name = function()
      return T_S(10401020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00067",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040102004] = {
    id = 1040102004,
    talk_text = function()
      return T_S(10401020040)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102004/1040102004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102004/1040102004_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"250:-980", "-320:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040102005,
    speak_name = function()
      return T_S(10401020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00076",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1040102005] = {
    id = 1040102005,
    talk_text = function()
      return T_S(10401020050)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102005/1040102005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102005/1040102005_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"250:-980", "-320:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040102006,
    speak_name = function()
      return T_S(10401020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00077",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20001
  },
  [1040102006] = {
    id = 1040102006,
    talk_text = function()
      return T_S(10401020060)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102006/1040102006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102006/1040102006_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"250:-980", "-320:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040102007,
    speak_name = function()
      return T_S(10401020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00068",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040102007] = {
    id = 1040102007,
    talk_text = function()
      return T_S(10401020070)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102007/1040102007_90110002.playable"
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
    next_dialog = 1040102008,
    speak_name = function()
      return T_S(10401020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00065_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1040102008] = {
    id = 1040102008,
    talk_text = function()
      return T_S(10401020080)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102008/1040102008_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040102009,
    speak_name = function()
      return T_S(10401020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00066",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1040102009] = {
    id = 1040102009,
    talk_text = function()
      return T_S(10401020090)
    end,
    next_dialog = 1040102010,
    speak_head = 90120010,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(10401020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0012/M0012_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/M0012",
    env_sound = 20001,
    review_head = "90120001"
  },
  [1040102010] = {
    id = 1040102010,
    talk_text = function()
      return T_S(10401020100)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040102010/1040102010_90110001.playable"
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
    next_dialog = 1040102011,
    speak_name = function()
      return T_S(10401020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00092",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1040102011] = {
    id = 1040102011,
    talk_text = function()
      return T_S(10401020110)
    end,
    env_sound = 20001,
    special_sound = 23007
  }
}
