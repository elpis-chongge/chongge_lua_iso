BasePlotDialogPart15001 = {
  [1030103001] = {
    id = 1030103001,
    talk_text = function()
      return T_S(10301030010)
    end,
    next_dialog = 1030103002,
    speak_head = 90120028,
    speak_head_actions = {
      "talk",
      "angry",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10301030015)
    end,
    text_sound_path = "event:/voice_cn/story/M0008/M0008_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/M0008",
    env_sound = 20007
  },
  [1030103002] = {
    id = 1030103002,
    talk_text = function()
      return T_S(10301030020)
    end,
    next_dialog = 1030103003,
    speak_name = function()
      return T_S(10301030025)
    end,
    camera_shake = {
      "1",
      "0",
      "3000"
    },
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00049",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1030103003] = {
    id = 1030103003,
    talk_text = function()
      return T_S(10301030030)
    end,
    next_dialog = 1030103004,
    speak_head = 90120030,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10301030035)
    end,
    text_sound_path = "event:/voice_cn/story/S0013/S0013_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0013",
    env_sound = 20007,
    review_head = "90120001"
  },
  [1030103004] = {
    id = 1030103004,
    talk_text = function()
      return T_S(10301030040)
    end,
    next_dialog = 1030103005,
    speak_head = 90120030,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10301030045)
    end,
    text_sound_path = "event:/voice_cn/story/S0013/S0013_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0013",
    env_sound = 20007
  },
  [1030103005] = {
    id = 1030103005,
    talk_text = function()
      return T_S(10301030050)
    end,
    next_dialog = 1030103006,
    speak_head = 90120030,
    speak_head_actions = {
      "talk",
      "idle",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10301030055)
    end,
    text_sound_path = "event:/voice_cn/story/S0013/S0013_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0013",
    env_sound = 20007
  },
  [1030103006] = {
    id = 1030103006,
    talk_text = function()
      return T_S(10301030060)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030103006/1030103006_90110001.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1030103007,
    speak_name = function()
      return T_S(10301030065)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00050",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20007
  },
  [1030103007] = {
    id = 1030103007,
    talk_text = function()
      return T_S(10301030070)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030103007/1030103007_90110001.playable"
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
    next_dialog = 1030103008,
    speak_head = 90120028,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10301030075)
    end,
    text_sound_path = "event:/voice_cn/story/M0008/M0008_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/M0008",
    env_sound = 20007
  },
  [1030103008] = {
    id = 1030103008,
    talk_text = function()
      return T_S(10301030080)
    end,
    role_ids = {90110001},
    scale = {9000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030103008/1030103008_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"180:-905"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1030103009,
    speak_head = 90120028,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10301030085)
    end,
    text_sound_path = "event:/voice_cn/story/M0008/M0008_story_00017",
    text_sound_bank = "bank:/voice_cn/sty/M0008",
    env_sound = 20007
  },
  [1030103009] = {
    id = 1030103009,
    talk_text = function()
      return T_S(10301030090)
    end,
    role_ids = {90110001},
    scale = {9000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1030103009/1030103009_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"180:-905"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1030103010,
    speak_head = 90120028,
    speak_head_actions = {
      "idle",
      "smile",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10301030095)
    end,
    text_sound_path = "event:/voice_cn/story/M0008/M0008_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/M0008",
    env_sound = 20007
  },
  [1030103010] = {
    id = 1030103010,
    talk_text = function()
      return T_S(10301030100)
    end,
    next_dialog = 1030103011,
    speak_head = 90120030,
    speak_head_actions = {
      "idle",
      "talk",
      "smile",
      "wink"
    },
    speak_name = function()
      return T_S(10301030105)
    end,
    text_sound_path = "event:/voice_cn/story/S0013/S0013_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0013",
    env_sound = 20007
  },
  [1030103011] = {
    id = 1030103011,
    talk_text = function()
      return T_S(10301030110)
    end,
    next_dialog = 1030103012,
    speak_head = 90120028,
    speak_head_actions = {
      "idle",
      "talk",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10301030115)
    end,
    text_sound_path = "event:/voice_cn/story/M0008/M0008_story_00019",
    text_sound_bank = "bank:/voice_cn/sty/M0008",
    env_sound = 20007
  },
  [1030103012] = {
    id = 1030103012,
    talk_text = function()
      return T_S(10301030120)
    end,
    next_dialog = 1030103013,
    speak_head = 90120029,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10301030125)
    end,
    text_sound_path = "event:/voice_cn/story/M0009/M0009_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/M0009",
    env_sound = 20007
  },
  [1030103013] = {
    id = 1030103013,
    talk_text = function()
      return T_S(10301030130)
    end,
    next_dialog = 1030103016,
    speak_head = 90120028,
    speak_head_actions = {
      "idle",
      "angry",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10301030135)
    end,
    text_sound_path = "event:/voice_cn/story/M0008/M0008_story_00020",
    text_sound_bank = "bank:/voice_cn/sty/M0008",
    env_sound = 20007
  },
  [1030103016] = {
    id = 1030103016,
    talk_text = function()
      return T_S(10301030160)
    end,
    next_dialog = 1030103017,
    speak_head = 90120029,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10301030165)
    end,
    text_sound_path = "event:/voice_cn/story/M0009/M0009_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/M0009",
    env_sound = 20007
  },
  [1030103017] = {
    id = 1030103017,
    talk_text = function()
      return T_S(10301030170)
    end,
    next_dialog = 1030103018,
    speak_head = 90120028,
    speak_head_actions = {
      "angry",
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10301030175)
    end,
    text_sound_path = "event:/voice_cn/story/M0008/M0008_story_00021",
    text_sound_bank = "bank:/voice_cn/sty/M0008",
    env_sound = 20007
  },
  [1030103018] = {
    id = 1030103018,
    talk_text = function()
      return T_S(10301030180)
    end,
    next_dialog = 1030103019,
    speak_head = 90120029,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10301030185)
    end,
    text_sound_path = "event:/voice_cn/story/M0009/M0009_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/M0009",
    env_sound = 20007
  },
  [1030103019] = {
    id = 1030103019,
    talk_text = function()
      return T_S(10301030190)
    end,
    env_sound = 20007
  }
}
