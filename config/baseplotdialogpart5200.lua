BasePlotDialogPart5200 = {
  [1010501001] = {
    id = 1010501001,
    talk_text = function()
      return T_S(10105010010)
    end,
    next_dialog = 1010501002,
    speak_head = 90120017,
    speak_head_actions = {
      "angry",
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10105010015)
    end,
    text_sound_path = "event:/voice_cn/story/S0001/S0001__story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0001",
    env_sound = 20003
  },
  [1010501002] = {
    id = 1010501002,
    talk_text = function()
      return T_S(10105010020)
    end,
    next_dialog = 1010501003,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "angry",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10105010025)
    end,
    text_sound_path = "event:/voice_cn/story/S0002/S0002_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0002",
    env_sound = 20003
  },
  [1010501003] = {
    id = 1010501003,
    talk_text = function()
      return T_S(10105010030)
    end,
    speak_head = 90120013,
    speak_head_actions = {
      "idle",
      "angry",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10105010035)
    end,
    text_sound_path = "event:/voice_cn/story/S0002/S0002_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0002",
    env_sound = 20003
  },
  [1010502001] = {
    id = 1010502001,
    middle_text = function()
      return T_S(10105020013)
    end,
    next_dialog = 1010502002,
    env_sound = 20003
  },
  [1010502002] = {
    id = 1010502002,
    talk_text = function()
      return T_S(10105020020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502002/1010502002_90110003.playable"
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
    next_dialog = 1010502003,
    speak_name = function()
      return T_S(10105020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20003
  },
  [1010502003] = {
    id = 1010502003,
    talk_text = function()
      return T_S(10105020030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502003/1010502003_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010502004,
    speak_name = function()
      return T_S(10105020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00017",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20003
  },
  [1010502004] = {
    id = 1010502004,
    talk_text = function()
      return T_S(10105020040)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502004/1010502004_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502004/1010502004_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"230:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010502005,
    speak_name = function()
      return T_S(10105020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20003
  },
  [1010502005] = {
    id = 1010502005,
    talk_text = function()
      return T_S(10105020050)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502005/1010502005_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502005/1010502005_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"230:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1010502006,
    speak_name = function()
      return T_S(10105020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20003
  },
  [1010502006] = {
    id = 1010502006,
    talk_text = function()
      return T_S(10105020060)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502006/1010502006_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502006/1010502006_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"230:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010502007,
    speak_name = function()
      return T_S(10105020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20003
  },
  [1010502007] = {
    id = 1010502007,
    talk_text = function()
      return T_S(10105020070)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502007/1010502007_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502007/1010502007_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"230:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1010502008,
    speak_name = function()
      return T_S(10105020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00019",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20003
  },
  [1010502008] = {
    id = 1010502008,
    talk_text = function()
      return T_S(10105020080)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502008/1010502008_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502008/1010502008_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"230:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010502009,
    speak_name = function()
      return T_S(10105020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20003
  },
  [1010502009] = {
    id = 1010502009,
    talk_text = function()
      return T_S(10105020090)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502009/1010502009_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010502010,
    speak_name = function()
      return T_S(10105020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20003
  },
  [1010502010] = {
    id = 1010502010,
    talk_text = function()
      return T_S(10105020100)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502010/1010502010_90110003.playable"
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
    next_dialog = 1010502011,
    speak_name = function()
      return T_S(10105020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20003
  },
  [1010502011] = {
    id = 1010502011,
    talk_text = function()
      return T_S(10105020110)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502011/1010502011_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"0:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010502012,
    speak_name = function()
      return T_S(10105020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00024",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20003
  },
  [1010502012] = {
    id = 1010502012,
    talk_text = function()
      return T_S(10105020120)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502012/1010502012_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502012/1010502012_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"-270:-980", "250:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "240"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010502013,
    speak_name = function()
      return T_S(10105020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00020",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20003
  },
  [1010502013] = {
    id = 1010502013,
    talk_text = function()
      return T_S(10105020130)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010502013/1010502013_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010502014,
    speak_name = function()
      return T_S(10105020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00012_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20003
  },
  [1010502014] = {
    id = 1010502014,
    talk_text = function()
      return T_S(10105020140)
    end,
    is_master = 1,
    scale = {10000},
    skin = {"common"},
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    next_dialog = 1010502015,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20003
  },
  [1010502015] = {
    id = 1010502015,
    talk_text = function()
      return T_S(10105020150)
    end,
    is_master = 1,
    skin = {"common"},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20003
  }
}
