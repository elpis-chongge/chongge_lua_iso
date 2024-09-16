BasePlotDialogPart50202 = {
  [1100505001] = {
    id = 1100505001,
    talk_text = function()
      return T_S(11005050010)
    end,
    is_master = 1,
    next_dialog = 1100505002,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00353",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20002
  },
  [1100505002] = {
    id = 1100505002,
    talk_text = function()
      return T_S(11005050020)
    end,
    role_ids = {90110017},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100505002/1100505002_90110017.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable"
    },
    role_position = {"-13:-980"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100505003,
    speak_name = function()
      return T_S(11005050025)
    end,
    text_sound_path = "event:/voice_cn/story/S0043/S0043_story_00036",
    text_sound_bank = "bank:/voice_cn/sty/S0043",
    env_sound = 20002
  },
  [1100505003] = {
    id = 1100505003,
    talk_text = function()
      return T_S(11005050030)
    end,
    role_ids = {90110017, 90110018},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100505003/1100505003_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100505003/1100505003_90110018.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110018/90110018_0.playable"
    },
    role_position = {"262:-980", "-270:-1155"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100505004,
    speak_name = function()
      return T_S(11005050035)
    end,
    text_sound_path = "event:/voice_cn/story/S0041/S0041_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/S0041",
    env_sound = 20002
  },
  [1100505004] = {
    id = 1100505004,
    talk_text = function()
      return T_S(11005050040)
    end,
    role_ids = {90110017, 90110018},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100505004/1100505004_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100505004/1100505004_90110018.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110018/90110018_0.playable"
    },
    role_position = {"262:-980", "-270:-1155"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100505005,
    speak_name = function()
      return T_S(11005050045)
    end,
    text_sound_path = "event:/voice_cn/story/S0043/S0043_story_00037",
    text_sound_bank = "bank:/voice_cn/sty/S0043",
    env_sound = 20002
  },
  [1100505005] = {
    id = 1100505005,
    talk_text = function()
      return T_S(11005050050)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100505005/1100505005_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100505006,
    speak_name = function()
      return T_S(11005050055)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00082",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20002
  },
  [1100505006] = {
    id = 1100505006,
    talk_text = function()
      return T_S(11005050060)
    end,
    next_dialog = 1100505007,
    env_sound = 20002
  },
  [1100505007] = {
    id = 1100505007,
    talk_text = function()
      return T_S(11005050070)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00354",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20002
  },
  [1100506001] = {
    id = 1100506001,
    talk_text = function()
      return T_S(11005060010)
    end,
    role_ids = {90110017, 90110011},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506001/1100506001_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506001/1100506001_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"262:-980", "-318:-1033"},
    role_shake = {"", ""},
    effect_in = {"3", "1"},
    effect_in_param = {"180", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100506002,
    speak_name = function()
      return T_S(11005060015)
    end,
    text_sound_path = "event:/voice_cn/story/S0043/S0043_story_00038",
    text_sound_bank = "bank:/voice_cn/sty/S0043",
    env_sound = 20002
  },
  [1100506002] = {
    id = 1100506002,
    talk_text = function()
      return T_S(11005060020)
    end,
    role_ids = {90110017, 90110011},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506002/1100506002_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506002/1100506002_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"262:-980", "-318:-1033"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100506003,
    speak_name = function()
      return T_S(11005060025)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00083",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20002
  },
  [1100506003] = {
    id = 1100506003,
    talk_text = function()
      return T_S(11005060030)
    end,
    role_ids = {90110017, 90110011},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506003/1100506003_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506003/1100506003_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"262:-980", "-318:-1033"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100506004,
    speak_name = function()
      return T_S(11005060035)
    end,
    text_sound_path = "event:/voice_cn/story/S0043/S0043_story_00039",
    text_sound_bank = "bank:/voice_cn/sty/S0043",
    env_sound = 20002
  },
  [1100506004] = {
    id = 1100506004,
    talk_text = function()
      return T_S(11005060040)
    end,
    role_ids = {90110017, 90110011},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506004/1100506004_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506004/1100506004_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"262:-980", "-318:-1033"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100506005,
    speak_name = function()
      return T_S(11005060045)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00084",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20002
  },
  [1100506005] = {
    id = 1100506005,
    talk_text = function()
      return T_S(11005060050)
    end,
    role_ids = {90110018},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506005/1100506005_90110018.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110018/90110018_0.playable"
    },
    role_position = {"0:-1155"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100506006,
    speak_name = function()
      return T_S(11005060055)
    end,
    text_sound_path = "event:/voice_cn/story/S0041/S0041_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/S0041",
    env_sound = 20002
  },
  [1100506006] = {
    id = 1100506006,
    talk_text = function()
      return T_S(11005060060)
    end,
    role_ids = {90110017, 90110018},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506006/1100506006_90110017.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100506006/1100506006_90110018.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110017/90110017_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110018/90110018_0.playable"
    },
    role_position = {"262:-980", "-270:-1155"},
    role_shake = {"", ""},
    effect_in = {"3", "0"},
    effect_in_param = {"270", "0"},
    effect_out = {"2", "2"},
    effect_out_param = {"350", "210"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(11005060065)
    end,
    text_sound_path = "event:/voice_cn/story/S0043/S0043_story_00040",
    text_sound_bank = "bank:/voice_cn/sty/S0043",
    env_sound = 20002
  }
}
