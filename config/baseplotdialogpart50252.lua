BasePlotDialogPart50252 = {
  [1100605001] = {
    id = 1100605001,
    middle_text = function()
      return T_S(11006050013)
    end,
    env_sound = 20002
  },
  [1100606001] = {
    id = 1100606001,
    middle_text = function()
      return T_S(11006060013)
    end,
    next_dialog = 1100606002,
    env_sound = 20006
  },
  [1100606002] = {
    id = 1100606002,
    talk_text = function()
      return T_S(11006060020)
    end,
    is_master = 1,
    scale = {10000},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00375",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20006
  }
}
