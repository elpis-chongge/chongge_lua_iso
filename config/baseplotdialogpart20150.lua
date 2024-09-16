BasePlotDialogPart20150 = {
  [1040401001] = {
    id = 1040401001,
    talk_text = function()
      return T_S(10404010010)
    end,
    next_dialog = 1040401002,
    speak_name = function()
      return T_S(10404010015)
    end,
    text_sound_path = "event:/voice_cn/story/S0015/S0015_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0015",
    env_sound = 20004,
    review_head = "90120001",
    open_title_1 = function()
      return T_S(10404010018)
    end,
    open_title_2 = function()
      return T_S(10404010019)
    end,
    open_bg_id = 90210027
  },
  [1040401002] = {
    id = 1040401002,
    talk_text = function()
      return T_S(10404010020)
    end,
    next_dialog = 1040401003,
    speak_name = function()
      return T_S(10404010025)
    end,
    text_sound_path = "event:/voice_cn/story/S0015/S0015_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0015",
    env_sound = 20004,
    review_head = "90120002"
  },
  [1040401003] = {
    id = 1040401003,
    talk_text = function()
      return T_S(10404010030)
    end,
    next_dialog = 1040401004,
    speak_name = function()
      return T_S(10404010035)
    end,
    text_sound_path = "event:/voice_cn/story/S0016/S0016_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0016",
    env_sound = 20004,
    review_head = "90120003"
  },
  [1040401004] = {
    id = 1040401004,
    talk_text = function()
      return T_S(10404010040)
    end,
    speak_name = function()
      return T_S(10404010045)
    end,
    text_sound_path = "event:/voice_cn/story/S0016/S0016_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0016",
    env_sound = 20004,
    review_head = "90120004"
  },
  [1040402001] = {
    id = 1040402001,
    talk_text = function()
      return T_S(10404020010)
    end,
    next_dialog = 1040402004,
    speak_name = function()
      return T_S(10404020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00088",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20004,
    review_head = "90120003"
  },
  [1040402002] = {
    id = 1040402002,
    talk_text = function()
      return T_S(10404020020)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040402002/1040402002_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-100:-1000"},
    effect_in = {"2"},
    effect_in_param = {"240"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040402003,
    speak_name = function()
      return T_S(10404020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00106",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20004
  },
  [1040402003] = {
    id = 1040402003,
    talk_text = function()
      return T_S(10404020030)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040402003/1040402003_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040402003/1040402003_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1000", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "240"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10404020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00078",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1040402004] = {
    id = 1040402004,
    talk_text = function()
      return T_S(10404020040)
    end,
    next_dialog = 1040402002,
    speak_name = function()
      return T_S(10404020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00089",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20004
  }
}
