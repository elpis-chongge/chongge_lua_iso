BasePlotDialogPart50051 = {
  [1100203001] = {
    id = 1100203001,
    talk_text = function()
      return T_S(11002030010)
    end,
    scale = {10000},
    next_dialog = 1100203002,
    env_sound = 20003
  },
  [1100203002] = {
    id = 1100203002,
    talk_text = function()
      return T_S(11002030020)
    end,
    next_dialog = 1100203003,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11002030025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00254",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20003
  },
  [1100203003] = {
    id = 1100203003,
    talk_text = function()
      return T_S(11002030030)
    end,
    next_dialog = 1100203004,
    env_sound = 20003
  },
  [1100203004] = {
    id = 1100203004,
    talk_text = function()
      return T_S(11002030040)
    end,
    next_dialog = 1100203005,
    env_sound = 20003
  },
  [1100203005] = {
    id = 1100203005,
    talk_text = function()
      return T_S(11002030050)
    end,
    env_sound = 20003
  }
}
