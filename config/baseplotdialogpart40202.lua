BasePlotDialogPart40202 = {
  [1080505001] = {
    id = 1080505001,
    talk_text = function()
      return T_S(10805050010)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505001/1080505001_90110002.playable"
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
    next_dialog = 1080505002,
    speak_name = function()
      return T_S(10805050015)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00189",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20007
  },
  [1080505002] = {
    id = 1080505002,
    talk_text = function()
      return T_S(10805050020)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505002/1080505002_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505002/1080505002_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1066", "-270:-980"},
    role_shake = {
      "",
      "1:2000:1000"
    },
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1080505003,
    speak_name = function()
      return T_S(10805050025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00312",
    text_sound_bank = "bank:/voice_cn/sty/M0003_4",
    env_sound = 20007
  },
  [1080505003] = {
    id = 1080505003,
    talk_text = function()
      return T_S(10805050030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505003/1080505003_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080505004,
    speak_name = function()
      return T_S(10805050035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00280",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080505004] = {
    id = 1080505004,
    talk_text = function()
      return T_S(10805050040)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505004/1080505004_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080505005,
    speak_name = function()
      return T_S(10805050045)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00281",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080505005] = {
    id = 1080505005,
    talk_text = function()
      return T_S(10805050050)
    end,
    is_master = 0,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505005/1080505005_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1080505006,
    speak_name = function()
      return T_S(10805050055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00282",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20007
  },
  [1080505006] = {
    id = 1080505006,
    talk_text = function()
      return T_S(10805050060)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505006/1080505006_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1080505007,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00303",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  },
  [1080505007] = {
    id = 1080505007,
    talk_text = function()
      return T_S(10805050070)
    end,
    next_dialog = 1080505008,
    env_sound = 20007
  },
  [1080505008] = {
    id = 1080505008,
    talk_text = function()
      return T_S(10805050080)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505008/1080505008_90110001.playable"
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
    next_dialog = 1080505009,
    speak_name = function()
      return T_S(10805050085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00257",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20007
  },
  [1080505009] = {
    id = 1080505009,
    talk_text = function()
      return T_S(10805050090)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505009/1080505009_90110001.playable"
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
    next_dialog = 1080505010,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00304",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  },
  [1080505010] = {
    id = 1080505010,
    talk_text = function()
      return T_S(10805050100)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505010/1080505010_90110001.playable"
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
    next_dialog = 1080505011,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00305",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  },
  [1080505011] = {
    id = 1080505011,
    talk_text = function()
      return T_S(10805050110)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1080505011/1080505011_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00306",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  }
}
