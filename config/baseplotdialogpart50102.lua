BasePlotDialogPart50102 = {
  [1100305001] = {
    id = 1100305001,
    talk_text = function()
      return T_S(11003050010)
    end,
    next_dialog = 1100305002,
    env_sound = 20005
  },
  [1100305002] = {
    id = 1100305002,
    talk_text = function()
      return T_S(11003050020)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100305002/1100305002_90110004.playable"
    },
    role_position = {"-58:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100305003,
    speak_name = function()
      return T_S(11003050025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00332_01",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20005
  },
  [1100305003] = {
    id = 1100305003,
    talk_text = function()
      return T_S(11003050030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100305003/1100305003_90110004.playable"
    },
    role_position = {"-58:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11003050035)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00332_02",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20005
  }
}
