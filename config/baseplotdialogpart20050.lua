BasePlotDialogPart20050 = {
  [1040201001] = {
    id = 1040201001,
    talk_text = function()
      return T_S(10402010010)
    end,
    next_dialog = 1040201002,
    speak_head = 90120026,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10402010015)
    end,
    text_sound_path = "event:/voice_cn/story/S0014/S0014_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0014",
    env_sound = 20002,
    open_title_1 = function()
      return T_S(10402010018)
    end,
    open_title_2 = function()
      return T_S(10402010019)
    end
  },
  [1040201002] = {
    id = 1040201002,
    talk_text = function()
      return T_S(10402010020)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040201002/1040201002_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040201003,
    speak_name = function()
      return T_S(10402010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00078",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20002
  },
  [1040201003] = {
    id = 1040201003,
    talk_text = function()
      return T_S(10402010030)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040201003/1040201003_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    speak_head = 90120026,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10402010035)
    end,
    text_sound_path = "event:/voice_cn/story/S0014/S0014_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0014",
    env_sound = 20002
  },
  [1040202001] = {
    id = 1040202001,
    talk_text = function()
      return T_S(10402020010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202001/1040202001_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040202002,
    speak_name = function()
      return T_S(10402020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00093",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1040202002] = {
    id = 1040202002,
    talk_text = function()
      return T_S(10402020020)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202002/1040202002_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202002/1040202002_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "200"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040202003,
    speak_name = function()
      return T_S(10402020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00069",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20002
  },
  [1040202003] = {
    id = 1040202003,
    talk_text = function()
      return T_S(10402020030)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202003/1040202003_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040202004,
    speak_name = function()
      return T_S(10402020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00067",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20002
  },
  [1040202004] = {
    id = 1040202004,
    talk_text = function()
      return T_S(10402020040)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202004/1040202004_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202004/1040202004_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-270:-1066", "250:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040202005,
    speak_name = function()
      return T_S(10402020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00070",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20002
  },
  [1040202005] = {
    id = 1040202005,
    talk_text = function()
      return T_S(10402020050)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202005/1040202005_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040202006,
    speak_name = function()
      return T_S(10402020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00094",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1040202006] = {
    id = 1040202006,
    talk_text = function()
      return T_S(10402020060)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202006/1040202006_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1040202007,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1040202007] = {
    id = 1040202007,
    talk_text = function()
      return T_S(10402020070)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202007/1040202007_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202007/1040202007_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"150:-1000", "-188:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "138"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040202008,
    speak_name = function()
      return T_S(10402020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00071",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20002
  },
  [1040202008] = {
    id = 1040202008,
    talk_text = function()
      return T_S(10402020080)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040202008/1040202008_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"2"},
    effect_in_param = {"200"},
    effect_out = {"3"},
    effect_out_param = {"350"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10402020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00068",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20002
  }
}
