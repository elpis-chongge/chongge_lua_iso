BasePlotDialogPart40150 = {
  [1080401001] = {
    id = 1080401001,
    talk_text = function()
      return T_S(10804010010)
    end,
    next_dialog = 1080401002,
    env_sound = 20004,
    open_title_1 = function()
      return T_S(10804010018)
    end,
    open_title_2 = function()
      return T_S(10804010019)
    end
  },
  [1080401002] = {
    id = 1080401002,
    talk_text = function()
      return T_S(10804010020)
    end,
    next_dialog = 1080401003,
    env_sound = 20004
  },
  [1080401003] = {
    id = 1080401003,
    talk_text = function()
      return T_S(10804010030)
    end,
    next_dialog = 1080401004,
    speak_head = 90120033,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10804010035)
    end,
    text_sound_path = "event:/voice_cn/story/S0038/S0038_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0038",
    env_sound = 20004
  },
  [1080401004] = {
    id = 1080401004,
    talk_text = function()
      return T_S(10804010040)
    end,
    next_dialog = 1080401005,
    env_sound = 20004
  },
  [1080401005] = {
    id = 1080401005,
    talk_text = function()
      return T_S(10804010050)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080401005/1080401005_90110003.playable"
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
    next_dialog = 1080401006,
    speak_name = function()
      return T_S(10804010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00292",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1080401006] = {
    id = 1080401006,
    talk_text = function()
      return T_S(10804010060)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080401006/1080401006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080401006/1080401006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"240:-980", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080401007,
    speak_name = function()
      return T_S(10804010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00180",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20004
  },
  [1080401007] = {
    id = 1080401007,
    talk_text = function()
      return T_S(10804010070)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080401007/1080401007_90110001.playable"
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
    speak_name = function()
      return T_S(10804010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00245",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20004
  },
  [1080402001] = {
    id = 1080402001,
    talk_text = function()
      return T_S(10804020010)
    end,
    next_dialog = 1080402002,
    speak_head = 90120024,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804020015)
    end,
    text_sound_path = "event:/voice_cn/story/S0038/S0038_story_00002_01",
    text_sound_bank = "bank:/voice_cn/sty/S0038",
    env_sound = 20004
  },
  [1080402002] = {
    id = 1080402002,
    talk_text = function()
      return T_S(10804020020)
    end,
    next_dialog = 1080402003,
    speak_head = 90120024,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804020025)
    end,
    text_sound_path = "event:/voice_cn/story/S0038/S0038_story_00002_02",
    text_sound_bank = "bank:/voice_cn/sty/S0038",
    env_sound = 20004
  },
  [1080402003] = {
    id = 1080402003,
    talk_text = function()
      return T_S(10804020030)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402003/1080402003_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080402004,
    speak_name = function()
      return T_S(10804020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1080402004] = {
    id = 1080402004,
    talk_text = function()
      return T_S(10804020040)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402004/1080402004_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1080402005,
    speak_head = 90120024,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804020045)
    end,
    text_sound_path = "event:/voice_cn/story/S0038/S0038_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0038",
    env_sound = 20004
  },
  [1080402005] = {
    id = 1080402005,
    talk_text = function()
      return T_S(10804020050)
    end,
    role_ids = {90110013},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402005/1080402005_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"0:-1220"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080402006,
    speak_name = function()
      return T_S(10804020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0020/M0020_story_00027",
    text_sound_bank = "bank:/voice_cn/sty/M0020",
    env_sound = 20004
  },
  [1080402006] = {
    id = 1080402006,
    talk_text = function()
      return T_S(10804020060)
    end,
    next_dialog = 1080402007,
    speak_head = 90120024,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10804020065)
    end,
    text_sound_path = "event:/voice_cn/story/S0038/S0038_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0038",
    env_sound = 20004
  },
  [1080402007] = {
    id = 1080402007,
    talk_text = function()
      return T_S(10804020070)
    end,
    next_dialog = 1080402008,
    env_sound = 20004
  },
  [1080402008] = {
    id = 1080402008,
    next_dialog = 1080402009,
    camera_shake = {
      "2",
      "0",
      "1800"
    },
    env_sound = 20004,
    special_sound = 23015,
    top_effect = {"", "0"}
  },
  [1080402009] = {
    id = 1080402009,
    talk_text = function()
      return T_S(10804020090)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402009/1080402009_90110003.playable"
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
    next_dialog = 1080402010,
    speak_name = function()
      return T_S(10804020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00293",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1080402010] = {
    id = 1080402010,
    talk_text = function()
      return T_S(10804020100)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402010/1080402010_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402010/1080402010_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"240:-980", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080402011,
    speak_name = function()
      return T_S(10804020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00181",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20004
  },
  [1080402011] = {
    id = 1080402011,
    talk_text = function()
      return T_S(10804020110)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402011/1080402011_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080402012,
    speak_name = function()
      return T_S(10804020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00253",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20004
  },
  [1080402012] = {
    id = 1080402012,
    talk_text = function()
      return T_S(10804020120)
    end,
    next_dialog = 1080402013,
    env_sound = 20004
  },
  [1080402013] = {
    id = 1080402013,
    talk_text = function()
      return T_S(10804020130)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402013/1080402013_90110003.playable"
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
    next_dialog = 1080402014,
    speak_name = function()
      return T_S(10804020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00294",
    text_sound_bank = "bank:/voice_cn/sty/M0003_3",
    env_sound = 20004
  },
  [1080402014] = {
    id = 1080402014,
    talk_text = function()
      return T_S(10804020140)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402014/1080402014_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402014/1080402014_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-300:-980", "240:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080402015,
    speak_name = function()
      return T_S(10804020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00254",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20004
  },
  [1080402015] = {
    id = 1080402015,
    talk_text = function()
      return T_S(10804020150)
    end,
    is_master = 1,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402015/1080402015_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080402015/1080402015_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"-300:-980", "240:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00286",
    text_sound_bank = "bank:/voice_cn/sty/M0000_3",
    env_sound = 20004
  }
}
