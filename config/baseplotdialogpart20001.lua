BasePlotDialogPart20001 = {
  [1040103001] = {
    id = 1040103001,
    talk_text = function()
      return T_S(10401030010)
    end,
    next_dialog = 1040103002,
    speak_head = 90120026,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10401030015)
    end,
    text_sound_path = "event:/voice_cn/story/S0014/S0014_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0014",
    env_sound = 20001
  },
  [1040103002] = {
    id = 1040103002,
    talk_text = function()
      return T_S(10401030020)
    end,
    is_master = 0,
    next_dialog = 1040103003,
    speak_head = 90120026,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10401030025)
    end,
    text_sound_path = "event:/voice_cn/story/S0014/S0014_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0014",
    env_sound = 20001
  },
  [1040103003] = {
    id = 1040103003,
    talk_text = function()
      return T_S(10401030030)
    end,
    is_master = 1,
    next_dialog = 1040103004,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  },
  [1040103004] = {
    id = 1040103004,
    talk_text = function()
      return T_S(10401030040)
    end,
    is_master = 0,
    next_dialog = 1040103005,
    speak_head = 90120026,
    speak_head_actions = {
      "idle",
      "smile",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10401030045)
    end,
    text_sound_path = "event:/voice_cn/story/S0014/S0014_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0014",
    env_sound = 20001
  },
  [1040103005] = {
    id = 1040103005,
    talk_text = function()
      return T_S(10401030050)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  }
}
