BasePlotDialogPart15053 = {
  [1030207001] = {
    id = 1030207001,
    talk_text = function()
      return T_S(10302070010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030207001/1030207001_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"0:-999"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030207002,
    speak_name = function()
      return T_S(10302070015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00054",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20005,
    review_head = "90120001"
  },
  [1030207002] = {
    id = 1030207002,
    talk_text = function()
      return T_S(10302070020)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030207002/1030207002_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"0:-999"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1030207003,
    speak_head = 90120029,
    speak_head_actions = {
      "angry",
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10302070025)
    end,
    text_sound_path = "event:/voice_cn/story/M0009/M0009_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/M0009",
    env_sound = 20005
  },
  [1030207003] = {
    id = 1030207003,
    talk_text = function()
      return T_S(10302070030)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030207003/1030207003_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"0:-999"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    speak_head = 90120029,
    speak_head_actions = {
      "idle",
      "blink",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10302070035)
    end,
    text_sound_path = "event:/voice_cn/story/M0009/M0009_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/M0009",
    env_sound = 20005
  },
  [1030208001] = {
    id = 1030208001,
    talk_text = function()
      return T_S(10302080010)
    end,
    is_master = 1,
    next_dialog = 1030208002,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00050",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1030208002] = {
    id = 1030208002,
    talk_text = function()
      return T_S(10302080020)
    end,
    next_dialog = 1030208003,
    env_sound = 20007
  },
  [1030208003] = {
    id = 1030208003,
    cg_text = function()
      return T_S(10302080037)
    end,
    cg_position_scale = "-460:-160:8100",
    next_dialog = 1030208004,
    speak_name = function()
      return T_S(10302080035)
    end,
    camera_shake = {
      "3",
      "0",
      "1000"
    },
    env_sound = 20007,
    review_head = "90120002"
  },
  [1030208004] = {
    id = 1030208004,
    cg_text = function()
      return T_S(10302080047)
    end,
    cg_position_scale = "-150:50:8200",
    next_dialog = 1030208005,
    speak_name = function()
      return T_S(10302080045)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00056",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1030208005] = {
    id = 1030208005,
    cg_text = function()
      return T_S(10302080057)
    end,
    cg_position_scale = "-150:200:8200",
    next_dialog = 1030208006,
    speak_name = function()
      return T_S(10302080055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1030208006] = {
    id = 1030208006,
    talk_text = function()
      return T_S(10302080060)
    end,
    is_master = 1,
    next_dialog = 1030208007,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00051",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1030208007] = {
    id = 1030208007,
    cg_text = function()
      return T_S(10302080077)
    end,
    cg_position_scale = "-150:75:8200",
    next_dialog = 1030208008,
    speak_name = function()
      return T_S(10302080075)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00058",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1030208008] = {
    id = 1030208008,
    cg_text = function()
      return T_S(10302080087)
    end,
    cg_position_scale = "-369:100:8200",
    next_dialog = 1030208009,
    speak_name = function()
      return T_S(10302080085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1030208009] = {
    id = 1030208009,
    talk_text = function()
      return T_S(10302080090)
    end,
    is_master = 1,
    next_dialog = 1030208010,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00052",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1030208010] = {
    id = 1030208010,
    talk_text = function()
      return T_S(10302080100)
    end,
    next_dialog = 1030208011,
    env_sound = 20007
  },
  [1030208011] = {
    id = 1030208011,
    next_dialog = 1030208012,
    camera_shake = {
      "1",
      "0",
      "600"
    },
    env_sound = 20007
  },
  [1030208012] = {
    id = 1030208012,
    talk_text = function()
      return T_S(10302080120)
    end,
    role_ids = {90110001},
    cg_position_scale = "-92:55:6300",
    scale = {18000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030208012/1030208012_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"-280:-2000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {0},
    next_dialog = 1030208013,
    speak_name = function()
      return T_S(10302080125)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1030208013] = {
    id = 1030208013,
    talk_text = function()
      return T_S(10302080130)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {18000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030208013/1030208013_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"-280:-2000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1030208014,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00053",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1030208014] = {
    id = 1030208014,
    talk_text = function()
      return T_S(10302080140)
    end,
    role_ids = {90110001},
    scale = {18000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030208014/1030208014_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"-280:-2000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1030208015,
    env_sound = 20007
  },
  [1030208015] = {
    id = 1030208015,
    talk_text = function()
      return T_S(10302080150)
    end,
    role_ids = {90110001},
    cg_position_scale = "-134:72:6300",
    scale = {18000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030208015/1030208015_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable"
    },
    role_position = {"-280:-2000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {0},
    next_dialog = 1030208016,
    speak_name = function()
      return T_S(10302080155)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1030208016] = {
    id = 1030208016,
    talk_text = function()
      return T_S(10302080160)
    end,
    next_dialog = 1030208017,
    env_sound = 20007
  },
  [1030208017] = {
    id = 1030208017,
    talk_text = function()
      return T_S(10302080170)
    end,
    next_dialog = 1030208018,
    env_sound = 20007
  },
  [1030208018] = {
    id = 1030208018,
    talk_text = function()
      return T_S(10302080180)
    end,
    is_master = 1,
    next_dialog = 1030208019,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00054",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20007
  },
  [1030208019] = {
    id = 1030208019,
    talk_text = function()
      return T_S(10302080190)
    end,
    env_sound = 20007
  }
}
