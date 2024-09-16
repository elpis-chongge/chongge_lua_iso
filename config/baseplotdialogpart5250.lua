BasePlotDialogPart5250 = {
  [1010601001] = {
    id = 1010601001,
    talk_text = function()
      return T_S(10106010010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010601001/1010601001_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-999"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010601002,
    speak_name = function()
      return T_S(10106010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20006,
    open_title_1 = function()
      return T_S(10106010018)
    end,
    open_title_2 = function()
      return T_S(10106010019)
    end
  },
  [1010601002] = {
    id = 1010601002,
    talk_text = function()
      return T_S(10106010020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010601002/1010601002_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"3"},
    effect_in_param = {"200"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010601003,
    speak_name = function()
      return T_S(10106010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00033",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20006
  },
  [1010601003] = {
    id = 1010601003,
    talk_text = function()
      return T_S(10106010030)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010601003/1010601003_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010601003/1010601003_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-980", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "300"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1010601004,
    speak_name = function()
      return T_S(10106010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20006
  },
  [1010601004] = {
    id = 1010601004,
    talk_text = function()
      return T_S(10106010040)
    end,
    next_dialog = 1010601005,
    env_sound = 20006
  },
  [1010601005] = {
    id = 1010601005,
    talk_text = function()
      return T_S(10106010050)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20006
  },
  [1010602001] = {
    id = 1010602001,
    talk_text = function()
      return T_S(10106020010)
    end,
    is_master = 1,
    next_dialog = 1010602002,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20006
  },
  [1010602002] = {
    id = 1010602002,
    talk_text = function()
      return T_S(10106020020)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010602002/1010602002_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010602003,
    speak_name = function()
      return T_S(10106020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00035",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20006
  },
  [1010602003] = {
    id = 1010602003,
    talk_text = function()
      return T_S(10106020030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1010602003/1010602003_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1010602004,
    speak_name = function()
      return T_S(10106020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00036",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20006
  },
  [1010602004] = {
    id = 1010602004,
    talk_text = function()
      return T_S(10106020040)
    end,
    env_sound = 20006
  }
}
