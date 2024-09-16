BasePlotDialogPart50151 = {
  [1100403001] = {
    id = 1100403001,
    talk_text = function()
      return T_S(11004030010)
    end,
    next_dialog = 1100403002,
    env_sound = 20008
  },
  [1100403002] = {
    id = 1100403002,
    talk_text = function()
      return T_S(11004030020)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100403002/1100403002_90110001.playable"
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
      return T_S(11004030025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00290",
    text_sound_bank = "bank:/voice_cn/sty/M0001_3",
    env_sound = 20008
  }
}
