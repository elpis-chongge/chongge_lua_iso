BasePlotDialogPart20052 = {
  [1040205001] = {
    id = 1040205001,
    talk_text = function()
      return T_S(10402050010)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040205001/1040205001_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_1.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040205002,
    speak_name = function()
      return T_S(10402050015)
    end,
    text_sound_path = "event:/voice_cn/story/M0013/M0013_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/M0013",
    env_sound = 20008
  },
  [1040205002] = {
    id = 1040205002,
    talk_text = function()
      return T_S(10402050020)
    end,
    role_ids = {90110006},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040205002/1040205002_90110006.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110006/90110006_0.playable"
    },
    role_position = {"0:-1020"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040205003,
    speak_name = function()
      return T_S(10402050025)
    end,
    text_sound_path = "event:/voice_cn/story/M0013/M0013_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/M0013",
    env_sound = 20008
  },
  [1040205003] = {
    id = 1040205003,
    talk_text = function()
      return T_S(10402050030)
    end,
    env_sound = 20008
  }
}
