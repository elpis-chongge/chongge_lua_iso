BasePlotDialogPart5001 = {
  [1010103001] = {
    id = 1010103001,
    talk_text = function()
      return T_S(10101030010)
    end,
    next_dialog = 1010103002,
    env_sound = 20008
  },
  [1010103002] = {
    id = 1010103002,
    talk_text = function()
      return T_S(10101030020)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 1010103003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20008
  },
  [1010103003] = {
    id = 1010103003,
    talk_text = function()
      return T_S(10101030030)
    end,
    next_dialog = 1010103004,
    env_sound = 20008
  },
  [1010103004] = {
    id = 1010103004,
    talk_text = function()
      return T_S(10101030040)
    end,
    env_sound = 20008
  }
}
