BasePlotDialogPart45151 = {
  [1090403001] = {
    id = 1090403001,
    talk_text = function()
      return T_S(10904030010)
    end,
    next_dialog = 1090403002,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030015)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403002] = {
    id = 1090403002,
    talk_text = function()
      return T_S(10904030020)
    end,
    next_dialog = 1090403003,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030025)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403003] = {
    id = 1090403003,
    talk_text = function()
      return T_S(10904030030)
    end,
    next_dialog = 1090403004,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030035)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403004] = {
    id = 1090403004,
    talk_text = function()
      return T_S(10904030040)
    end,
    next_dialog = 1090403005,
    speak_head = 90120035,
    speak_head_actions = {
      "smile",
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030045)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403005] = {
    id = 1090403005,
    talk_text = function()
      return T_S(10904030050)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403005/1090403005_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"3"},
    effect_in_param = {"270"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090403006,
    speak_name = function()
      return T_S(10904030055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00354",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403006] = {
    id = 1090403006,
    talk_text = function()
      return T_S(10904030060)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403006/1090403006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403006/1090403006_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403007,
    speak_name = function()
      return T_S(10904030065)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403007] = {
    id = 1090403007,
    talk_text = function()
      return T_S(10904030070)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403007/1090403007_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403007/1090403007_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403008,
    speak_name = function()
      return T_S(10904030075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00355",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403008] = {
    id = 1090403008,
    talk_text = function()
      return T_S(10904030080)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403008/1090403008_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403008/1090403008_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403009,
    speak_name = function()
      return T_S(10904030085)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00063",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403009] = {
    id = 1090403009,
    talk_text = function()
      return T_S(10904030090)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403009/1090403009_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403009/1090403009_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403010,
    speak_name = function()
      return T_S(10904030095)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00356",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403010] = {
    id = 1090403010,
    talk_text = function()
      return T_S(10904030100)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403010/1090403010_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403010/1090403010_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403011,
    speak_name = function()
      return T_S(10904030105)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00064",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403011] = {
    id = 1090403011,
    talk_text = function()
      return T_S(10904030110)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403011/1090403011_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403011/1090403011_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403012,
    speak_name = function()
      return T_S(10904030115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00357",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403012] = {
    id = 1090403012,
    talk_text = function()
      return T_S(10904030120)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403012/1090403012_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403012/1090403012_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403013,
    env_sound = 20003
  },
  [1090403013] = {
    id = 1090403013,
    talk_text = function()
      return T_S(10904030130)
    end,
    next_dialog = 1090403014,
    speak_head = 90120036,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10904030135)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403014] = {
    id = 1090403014,
    talk_text = function()
      return T_S(10904030140)
    end,
    next_dialog = 1090403015,
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10904030145)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403015] = {
    id = 1090403015,
    talk_text = function()
      return T_S(10904030150)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403015/1090403015_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403015/1090403015_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"1", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403016,
    speak_name = function()
      return T_S(10904030155)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00065",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403016] = {
    id = 1090403016,
    talk_text = function()
      return T_S(10904030160)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403016/1090403016_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403016/1090403016_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403017,
    speak_name = function()
      return T_S(10904030165)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00358",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403017] = {
    id = 1090403017,
    talk_text = function()
      return T_S(10904030170)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403017/1090403017_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403017/1090403017_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403018,
    speak_name = function()
      return T_S(10904030175)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00359",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403018] = {
    id = 1090403018,
    talk_text = function()
      return T_S(10904030180)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403018/1090403018_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403018/1090403018_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403019,
    env_sound = 20003
  },
  [1090403019] = {
    id = 1090403019,
    talk_text = function()
      return T_S(10904030190)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403019/1090403019_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403019/1090403019_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", "1:0:1066"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403020,
    speak_name = function()
      return T_S(10904030195)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00066",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403020] = {
    id = 1090403020,
    next_dialog = 1090403021,
    camera_shake = {
      "2",
      "0",
      "1000"
    },
    env_sound = 20003,
    special_sound = 23021
  },
  [1090403021] = {
    id = 1090403021,
    talk_text = function()
      return T_S(10904030210)
    end,
    next_dialog = 1090403022,
    env_sound = 20003
  },
  [1090403022] = {
    id = 1090403022,
    talk_text = function()
      return T_S(10904030220)
    end,
    next_dialog = 1090403023,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10904030225)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403023] = {
    id = 1090403023,
    talk_text = function()
      return T_S(10904030230)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403023/1090403023_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403023/1090403023_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"1", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403024,
    speak_name = function()
      return T_S(10904030235)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00360",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403024] = {
    id = 1090403024,
    talk_text = function()
      return T_S(10904030240)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403024/1090403024_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403024/1090403024_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403025,
    speak_name = function()
      return T_S(10904030245)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00067",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403025] = {
    id = 1090403025,
    talk_text = function()
      return T_S(10904030250)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403025/1090403025_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403025/1090403025_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-50:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403026,
    speak_name = function()
      return T_S(10904030255)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00361",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403026] = {
    id = 1090403026,
    talk_text = function()
      return T_S(10904030260)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403026/1090403026_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403026/1090403026_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-50:-980", "250:-1100"},
    role_shake = {"", "1:0:1066"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403027,
    env_sound = 20003,
    special_sound = 23009
  },
  [1090403027] = {
    id = 1090403027,
    talk_text = function()
      return T_S(10904030270)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403027/1090403027_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403027/1090403027_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-50:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403028,
    speak_name = function()
      return T_S(10904030275)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00362",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403028] = {
    id = 1090403028,
    talk_text = function()
      return T_S(10904030280)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403028/1090403028_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403028/1090403028_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-50:-980", "250:-1100"},
    role_shake = {"", "2:0:1066"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403029,
    env_sound = 20003,
    special_sound = 23009
  },
  [1090403029] = {
    id = 1090403029,
    talk_text = function()
      return T_S(10904030290)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403029/1090403029_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403029/1090403029_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-50:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403030,
    speak_name = function()
      return T_S(10904030295)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00068",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403030] = {
    id = 1090403030,
    talk_text = function()
      return T_S(10904030300)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403030/1090403030_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403030/1090403030_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-50:-980", "250:-1100"},
    role_shake = {"", "2:0:1066"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403031,
    env_sound = 20003,
    special_sound = 23009
  },
  [1090403031] = {
    id = 1090403031,
    talk_text = function()
      return T_S(10904030310)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403031/1090403031_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403031/1090403031_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-50:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403032,
    speak_name = function()
      return T_S(10904030315)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00363",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403032] = {
    id = 1090403032,
    talk_text = function()
      return T_S(10904030320)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403032/1090403032_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403032/1090403032_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403033,
    speak_name = function()
      return T_S(10904030325)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00069",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403033] = {
    id = 1090403033,
    talk_text = function()
      return T_S(10904030330)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403033/1090403033_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403033/1090403033_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403034,
    speak_name = function()
      return T_S(10904030335)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00364",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403034] = {
    id = 1090403034,
    talk_text = function()
      return T_S(10904030340)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403034/1090403034_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403034/1090403034_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403035,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10904030345)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403035] = {
    id = 1090403035,
    talk_text = function()
      return T_S(10904030350)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403035/1090403035_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403035/1090403035_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403036,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "smile",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030355)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403036] = {
    id = 1090403036,
    talk_text = function()
      return T_S(10904030360)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403036/1090403036_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403036/1090403036_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403037,
    speak_name = function()
      return T_S(10904030365)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00365",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403037] = {
    id = 1090403037,
    talk_text = function()
      return T_S(10904030370)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403037/1090403037_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403037/1090403037_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403100,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10904030375)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403038] = {
    id = 1090403038,
    talk_text = function()
      return T_S(10904030380)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403038/1090403038_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403038/1090403038_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403039,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030385)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403039] = {
    id = 1090403039,
    talk_text = function()
      return T_S(10904030390)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403039/1090403039_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403039/1090403039_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403040,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030395)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403040] = {
    id = 1090403040,
    talk_text = function()
      return T_S(10904030400)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403040/1090403040_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403040/1090403040_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403041,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030405)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403041] = {
    id = 1090403041,
    talk_text = function()
      return T_S(10904030410)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403041/1090403041_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403041/1090403041_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403042,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10904030415)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00017",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403042] = {
    id = 1090403042,
    talk_text = function()
      return T_S(10904030420)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403042/1090403042_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403042/1090403042_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403043,
    speak_name = function()
      return T_S(10904030425)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00366",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403043] = {
    id = 1090403043,
    talk_text = function()
      return T_S(10904030430)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403043/1090403043_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403043/1090403043_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403044,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10904030435)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403044] = {
    id = 1090403044,
    talk_text = function()
      return T_S(10904030440)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403044/1090403044_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403044/1090403044_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403045,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10904030445)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00019",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403045] = {
    id = 1090403045,
    talk_text = function()
      return T_S(10904030450)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403045/1090403045_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403045/1090403045_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403046,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030455)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403046] = {
    id = 1090403046,
    talk_text = function()
      return T_S(10904030460)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403046/1090403046_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403046/1090403046_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403047,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030465)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00020",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403047] = {
    id = 1090403047,
    talk_text = function()
      return T_S(10904030470)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403047/1090403047_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403047/1090403047_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403048,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10904030475)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00021",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403048] = {
    id = 1090403048,
    talk_text = function()
      return T_S(10904030480)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403048/1090403048_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403048/1090403048_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "50:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403049,
    speak_name = function()
      return T_S(10904030485)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00070",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403049] = {
    id = 1090403049,
    talk_text = function()
      return T_S(10904030490)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403049/1090403049_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403049/1090403049_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "50:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403050,
    speak_name = function()
      return T_S(10904030495)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00367",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403050] = {
    id = 1090403050,
    talk_text = function()
      return T_S(10904030500)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403050/1090403050_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403050/1090403050_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "50:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403051,
    speak_name = function()
      return T_S(10904030505)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00070_01",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403051] = {
    id = 1090403051,
    talk_text = function()
      return T_S(10904030510)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403051/1090403051_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403051/1090403051_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "50:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403052,
    speak_name = function()
      return T_S(10904030515)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00368",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403052] = {
    id = 1090403052,
    talk_text = function()
      return T_S(10904030520)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403052/1090403052_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403052/1090403052_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "50:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403053,
    speak_name = function()
      return T_S(10904030525)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00071",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403053] = {
    id = 1090403053,
    talk_text = function()
      return T_S(10904030530)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403053/1090403053_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403053/1090403053_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "50:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403101,
    speak_name = function()
      return T_S(10904030535)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00369",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403054] = {
    id = 1090403054,
    talk_text = function()
      return T_S(10904030540)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403054/1090403054_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403054/1090403054_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403055,
    speak_name = function()
      return T_S(10904030545)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00371",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403055] = {
    id = 1090403055,
    talk_text = function()
      return T_S(10904030550)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403055/1090403055_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403055/1090403055_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403102,
    speak_name = function()
      return T_S(10904030555)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00372",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403056] = {
    id = 1090403056,
    talk_text = function()
      return T_S(10904030560)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403056/1090403056_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403056/1090403056_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403057,
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10904030565)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403057] = {
    id = 1090403057,
    talk_text = function()
      return T_S(10904030570)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403057/1090403057_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403057/1090403057_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403058,
    speak_name = function()
      return T_S(10904030575)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00375",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403058] = {
    id = 1090403058,
    talk_text = function()
      return T_S(10904030580)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403058/1090403058_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403058/1090403058_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403059,
    speak_name = function()
      return T_S(10904030585)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00376",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403059] = {
    id = 1090403059,
    talk_text = function()
      return T_S(10904030590)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403059/1090403059_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403059/1090403059_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"3", "3"},
    effect_out_param = {"350", "200"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403060,
    speak_name = function()
      return T_S(10904030595)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00072",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403060] = {
    id = 1090403060,
    talk_text = function()
      return T_S(10904030600)
    end,
    next_dialog = 1090403061,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030605)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403061] = {
    id = 1090403061,
    talk_text = function()
      return T_S(10904030610)
    end,
    next_dialog = 1090403062,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030615)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403062] = {
    id = 1090403062,
    talk_text = function()
      return T_S(10904030620)
    end,
    next_dialog = 1090403063,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030625)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00024",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403063] = {
    id = 1090403063,
    talk_text = function()
      return T_S(10904030630)
    end,
    next_dialog = 1090403064,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10904030635)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00025",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403064] = {
    id = 1090403064,
    talk_text = function()
      return T_S(10904030640)
    end,
    next_dialog = 1090403065,
    camera_shake = {
      "2",
      "0",
      "2000"
    },
    env_sound = 20003
  },
  [1090403065] = {
    id = 1090403065,
    talk_text = function()
      return T_S(10904030650)
    end,
    is_os = 1,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403065/1090403065_90110003.playable"
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
    next_dialog = 1090403066,
    speak_name = function()
      return T_S(10904030655)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00377",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403066] = {
    id = 1090403066,
    talk_text = function()
      return T_S(10904030660)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403066/1090403066_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403066/1090403066_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", "3:500:1500"},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "420"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403067,
    speak_name = function()
      return T_S(10904030665)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00073",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403067] = {
    id = 1090403067,
    talk_text = function()
      return T_S(10904030670)
    end,
    next_dialog = 1090403068,
    env_sound = 20003,
    special_sound = 23017
  },
  [1090403068] = {
    id = 1090403068,
    talk_text = function()
      return T_S(10904030680)
    end,
    next_dialog = 1090403069,
    env_sound = 20003
  },
  [1090403069] = {
    id = 1090403069,
    talk_text = function()
      return T_S(10904030690)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403069/1090403069_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403069/1090403069_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403070,
    speak_name = function()
      return T_S(10904030695)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00074",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403070] = {
    id = 1090403070,
    talk_text = function()
      return T_S(10904030700)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403070/1090403070_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403070/1090403070_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403071,
    speak_name = function()
      return T_S(10904030705)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00378",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403071] = {
    id = 1090403071,
    talk_text = function()
      return T_S(10904030710)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403071/1090403071_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403071/1090403071_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403072,
    speak_name = function()
      return T_S(10904030715)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00075",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403072] = {
    id = 1090403072,
    talk_text = function()
      return T_S(10904030720)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403072/1090403072_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403072/1090403072_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403073,
    speak_name = function()
      return T_S(10904030725)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00379",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403073] = {
    id = 1090403073,
    talk_text = function()
      return T_S(10904030730)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403073/1090403073_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403073/1090403073_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403074,
    speak_name = function()
      return T_S(10904030735)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00076",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403074] = {
    id = 1090403074,
    talk_text = function()
      return T_S(10904030740)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403074/1090403074_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403074/1090403074_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403075,
    env_sound = 20003
  },
  [1090403075] = {
    id = 1090403075,
    talk_text = function()
      return T_S(10904030750)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403075/1090403075_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403075/1090403075_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403076,
    speak_name = function()
      return T_S(10904030755)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00380",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403076] = {
    id = 1090403076,
    talk_text = function()
      return T_S(10904030760)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403076/1090403076_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403076/1090403076_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403077,
    speak_name = function()
      return T_S(10904030765)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00381",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403077] = {
    id = 1090403077,
    talk_text = function()
      return T_S(10904030770)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403077/1090403077_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403077/1090403077_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403078,
    speak_name = function()
      return T_S(10904030775)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00077",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403078] = {
    id = 1090403078,
    talk_text = function()
      return T_S(10904030780)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403078/1090403078_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403078/1090403078_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403079,
    speak_name = function()
      return T_S(10904030785)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00382",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403079] = {
    id = 1090403079,
    talk_text = function()
      return T_S(10904030790)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403079/1090403079_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403079/1090403079_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403080,
    speak_name = function()
      return T_S(10904030795)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00383",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403080] = {
    id = 1090403080,
    talk_text = function()
      return T_S(10904030800)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403080/1090403080_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403080/1090403080_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403081,
    speak_name = function()
      return T_S(10904030805)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00078",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403081] = {
    id = 1090403081,
    talk_text = function()
      return T_S(10904030810)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403081/1090403081_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403081/1090403081_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403082,
    speak_name = function()
      return T_S(10904030815)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00384",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403082] = {
    id = 1090403082,
    talk_text = function()
      return T_S(10904030820)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403082/1090403082_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403082/1090403082_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403083,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030825)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403083] = {
    id = 1090403083,
    talk_text = function()
      return T_S(10904030830)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403083/1090403083_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403083/1090403083_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403084,
    speak_name = function()
      return T_S(10904030835)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00385",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403084] = {
    id = 1090403084,
    talk_text = function()
      return T_S(10904030840)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403084/1090403084_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403084/1090403084_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403085,
    env_sound = 20003
  },
  [1090403085] = {
    id = 1090403085,
    talk_text = function()
      return T_S(10904030850)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403085/1090403085_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403085/1090403085_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403086,
    speak_name = function()
      return T_S(10904030855)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00386",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403086] = {
    id = 1090403086,
    talk_text = function()
      return T_S(10904030860)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403086/1090403086_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403086/1090403086_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403087,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030865)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403087] = {
    id = 1090403087,
    talk_text = function()
      return T_S(10904030870)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403087/1090403087_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403087/1090403087_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403088,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030875)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00027",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403088] = {
    id = 1090403088,
    talk_text = function()
      return T_S(10904030880)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403088/1090403088_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403088/1090403088_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403089,
    env_sound = 20003
  },
  [1090403089] = {
    id = 1090403089,
    talk_text = function()
      return T_S(10904030890)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403089/1090403089_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403089/1090403089_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403090,
    speak_name = function()
      return T_S(10904030895)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00387",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403090] = {
    id = 1090403090,
    talk_text = function()
      return T_S(10904030900)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403090/1090403090_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403090/1090403090_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403091,
    speak_name = function()
      return T_S(10904030905)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00388",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403091] = {
    id = 1090403091,
    talk_text = function()
      return T_S(10904030910)
    end,
    next_dialog = 1090403092,
    env_sound = 20003
  },
  [1090403092] = {
    id = 1090403092,
    talk_text = function()
      return T_S(10904030920)
    end,
    scale = {10000, 10000},
    next_dialog = 1090403093,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10904030925)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00028",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403093] = {
    id = 1090403093,
    talk_text = function()
      return T_S(10904030930)
    end,
    next_dialog = 1090403094,
    camera_shake = {
      "3",
      "0",
      "1500"
    },
    env_sound = 20003,
    special_sound = 23025
  },
  [1090403094] = {
    id = 1090403094,
    talk_text = function()
      return T_S(10904030940)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403094/1090403094_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403094/1090403094_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403095,
    speak_name = function()
      return T_S(10904030945)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00389",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403095] = {
    id = 1090403095,
    talk_text = function()
      return T_S(10904030950)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403095/1090403095_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403095/1090403095_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-180:-980", "150:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"3", "3"},
    effect_out_param = {"420", "200"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090403096,
    speak_name = function()
      return T_S(10904030955)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00079",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20003
  },
  [1090403096] = {
    id = 1090403096,
    talk_text = function()
      return T_S(10904030960)
    end,
    next_dialog = 1090403097,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030965)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00017",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403097] = {
    id = 1090403097,
    talk_text = function()
      return T_S(10904030970)
    end,
    next_dialog = 1090403098,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030975)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00029",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403098] = {
    id = 1090403098,
    talk_text = function()
      return T_S(10904030980)
    end,
    next_dialog = 1090403099,
    speak_head = 90120036,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904030985)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403099] = {
    id = 1090403099,
    talk_text = function()
      return T_S(10904030990)
    end,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10904030995)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00030",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20003
  },
  [1090403100] = {
    id = 1090403100,
    talk_text = function()
      return T_S(10904031000)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403100/1090403100_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403100/1090403100_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1090403038,
    speak_head = 90120036,
    speak_head_actions = {
      "talk",
      "angry",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10904031005)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20003
  },
  [1090403101] = {
    id = 1090403101,
    talk_text = function()
      return T_S(10904031010)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403101/1090403101_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403101/1090403101_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-300:-980", "50:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403054,
    speak_name = function()
      return T_S(10904031015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00370",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403102] = {
    id = 1090403102,
    talk_text = function()
      return T_S(10904031020)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403102/1090403102_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403102/1090403102_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403103,
    speak_name = function()
      return T_S(10904031025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00373",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090403103] = {
    id = 1090403103,
    talk_text = function()
      return T_S(10904031030)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403103/1090403103_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090403103/1090403103_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"-300:-980", "250:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090403056,
    speak_name = function()
      return T_S(10904031035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00374",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20003
  },
  [1090404001] = {
    id = 1090404001,
    talk_text = function()
      return T_S(10904040010)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404001/1090404001_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"2"},
    effect_in_param = {"270"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090404002,
    speak_name = function()
      return T_S(10904040015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00390",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404002] = {
    id = 1090404002,
    talk_text = function()
      return T_S(10904040020)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404002/1090404002_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404002/1090404002_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1090404003,
    speak_name = function()
      return T_S(10904040025)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00080",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20006
  },
  [1090404003] = {
    id = 1090404003,
    talk_text = function()
      return T_S(10904040030)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404003/1090404003_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404003/1090404003_90110015.playable"
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
    next_dialog = 1090404004,
    speak_name = function()
      return T_S(10904040035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00391",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404004] = {
    id = 1090404004,
    talk_text = function()
      return T_S(10904040040)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404004/1090404004_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404004/1090404004_90110015.playable"
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
    next_dialog = 1090404005,
    speak_name = function()
      return T_S(10904040045)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00081",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20006
  },
  [1090404005] = {
    id = 1090404005,
    talk_text = function()
      return T_S(10904040050)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404005/1090404005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404005/1090404005_90110015.playable"
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
    next_dialog = 1090404006,
    speak_name = function()
      return T_S(10904040055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00392",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404006] = {
    id = 1090404006,
    talk_text = function()
      return T_S(10904040060)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404006/1090404006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404006/1090404006_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"3", "3"},
    effect_out_param = {"180", "420"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090404007,
    speak_name = function()
      return T_S(10904040065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00393",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404007] = {
    id = 1090404007,
    talk_text = function()
      return T_S(10904040070)
    end,
    next_dialog = 1090404008,
    env_sound = 20006
  },
  [1090404008] = {
    id = 1090404008,
    talk_text = function()
      return T_S(10904040080)
    end,
    role_ids = {90110015},
    scale = {10000, 10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404008/1090404008_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"-150:-1100"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090404009,
    speak_name = function()
      return T_S(10904040085)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00082",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20006
  },
  [1090404009] = {
    id = 1090404009,
    talk_text = function()
      return T_S(10904040090)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404009/1090404009_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404009/1090404009_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"3", "0"},
    effect_in_param = {"180", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090404010,
    speak_name = function()
      return T_S(10904040095)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00394",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404010] = {
    id = 1090404010,
    talk_text = function()
      return T_S(10904040100)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404010/1090404010_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404010/1090404010_90110015.playable"
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
    next_dialog = 1090404011,
    speak_name = function()
      return T_S(10904040105)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00082_01",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20006
  },
  [1090404011] = {
    id = 1090404011,
    talk_text = function()
      return T_S(10904040110)
    end,
    is_os = 1,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404011/1090404011_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404011/1090404011_90110015.playable"
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
    next_dialog = 1090404012,
    speak_name = function()
      return T_S(10904040115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00395",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404012] = {
    id = 1090404012,
    talk_text = function()
      return T_S(10904040120)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404012/1090404012_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404012/1090404012_90110015.playable"
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
    next_dialog = 1090404013,
    speak_head = 90120036,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10904040125)
    end,
    text_sound_path = "event:/voice_cn/story/S0052/S0052_story_00019",
    text_sound_bank = "bank:/voice_cn/sty/S0052",
    env_sound = 20006
  },
  [1090404013] = {
    id = 1090404013,
    talk_text = function()
      return T_S(10904040130)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404013/1090404013_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404013/1090404013_90110015.playable"
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
    next_dialog = 1090404014,
    speak_head = 90120035,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10904040135)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00031",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20006
  },
  [1090404014] = {
    id = 1090404014,
    talk_text = function()
      return T_S(10904040140)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404014/1090404014_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404014/1090404014_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"3", "3"},
    effect_out_param = {"240", "350"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090404015,
    speak_name = function()
      return T_S(10904040145)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00396",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404015] = {
    id = 1090404015,
    talk_text = function()
      return T_S(10904040150)
    end,
    next_dialog = 1090404016,
    camera_shake = {
      "2",
      "600",
      "1200"
    },
    env_sound = 20006
  },
  [1090404016] = {
    id = 1090404016,
    talk_text = function()
      return T_S(10904040160)
    end,
    next_dialog = 1090404017,
    speak_head = 90120035,
    speak_head_actions = {
      "idle",
      "angry",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10904040165)
    end,
    text_sound_path = "event:/voice_cn/story/S0053/S0053_story_00032",
    text_sound_bank = "bank:/voice_cn/sty/S0053",
    env_sound = 20006
  },
  [1090404017] = {
    id = 1090404017,
    talk_text = function()
      return T_S(10904040170)
    end,
    next_dialog = 1090404018,
    env_sound = 20006
  },
  [1090404018] = {
    id = 1090404018,
    talk_text = function()
      return T_S(10904040180)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404018/1090404018_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404018/1090404018_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_0.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1090404019,
    speak_name = function()
      return T_S(10904040185)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00397",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404019] = {
    id = 1090404019,
    talk_text = function()
      return T_S(10904040190)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404019/1090404019_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404019/1090404019_90110015.playable"
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
    next_dialog = 1090404020,
    speak_name = function()
      return T_S(10904040195)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00083",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20006
  },
  [1090404020] = {
    id = 1090404020,
    talk_text = function()
      return T_S(10904040200)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404020/1090404020_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404020/1090404020_90110015.playable"
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
    next_dialog = 1090404021,
    env_sound = 20006,
    special_sound = 23009
  },
  [1090404021] = {
    id = 1090404021,
    talk_text = function()
      return T_S(10904040210)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404021/1090404021_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404021/1090404021_90110015.playable"
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
    next_dialog = 1090404022,
    speak_name = function()
      return T_S(10904040215)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00398",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404022] = {
    id = 1090404022,
    talk_text = function()
      return T_S(10904040220)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404022/1090404022_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404022/1090404022_90110015.playable"
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
    next_dialog = 1090404023,
    speak_name = function()
      return T_S(10904040225)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00084",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20006
  },
  [1090404023] = {
    id = 1090404023,
    talk_text = function()
      return T_S(10904040230)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404023/1090404023_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404023/1090404023_90110015.playable"
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
    next_dialog = 1090404024,
    speak_name = function()
      return T_S(10904040235)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00399",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20006
  },
  [1090404024] = {
    id = 1090404024,
    talk_text = function()
      return T_S(10904040240)
    end,
    role_ids = {90110003, 90110015},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404024/1090404024_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090404024/1090404024_90110015.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110015/90110015_1.playable"
    },
    role_position = {"240:-980", "-300:-1100"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"3", "3"},
    effect_out_param = {"200", "350"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10904040245)
    end,
    text_sound_path = "event:/voice_cn/story/M0006/M0006_story_00085",
    text_sound_bank = "bank:/voice_cn/sty/M0006",
    env_sound = 20006
  }
}
