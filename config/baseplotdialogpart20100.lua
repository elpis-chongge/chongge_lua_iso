BasePlotDialogPart20100 = {
  [1040301001] = {
    id = 1040301001,
    talk_text = function()
      return T_S(10403010010)
    end,
    next_dialog = 1040301002,
    speak_name = function()
      return T_S(10403010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00097",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001,
    review_head = "90120003",
    open_title_1 = function()
      return T_S(10403010018)
    end,
    open_title_2 = function()
      return T_S(10403010019)
    end
  },
  [1040301002] = {
    id = 1040301002,
    talk_text = function()
      return T_S(10403010020)
    end,
    role_ids = {90110003},
    scale = {15000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301002/1040301002_90110003.playable"
    },
    role_position = {"-30:-1580"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040301003,
    speak_name = function()
      return T_S(10403010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00078",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040301003] = {
    id = 1040301003,
    talk_text = function()
      return T_S(10403010030)
    end,
    next_dialog = 1040301004,
    env_sound = 20001,
    special_sound = 23013
  },
  [1040301004] = {
    id = 1040301004,
    talk_text = function()
      return T_S(10403010040)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301004/1040301004_90110003.playable"
    },
    role_position = {"-50:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040301005,
    speak_name = function()
      return T_S(10403010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00079",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040301005] = {
    id = 1040301005,
    talk_text = function()
      return T_S(10403010050)
    end,
    role_ids = {90110003, 90110002},
    scale = {7000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301005/1040301005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301005/1040301005_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"245:-700", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"3", "0"},
    effect_out_param = {"500", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040301006,
    speak_name = function()
      return T_S(10403010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00071",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1040301006] = {
    id = 1040301006,
    talk_text = function()
      return T_S(10403010060)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301006/1040301006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040301007,
    speak_name = function()
      return T_S(10403010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00072",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1040301007] = {
    id = 1040301007,
    talk_text = function()
      return T_S(10403010070)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301007/1040301007_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1040301008,
    speak_name = function()
      return T_S(10403010075)
    end,
    camera_shake = {
      "3",
      "0",
      "2100"
    },
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00080",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001,
    review_head = "90120003"
  },
  [1040301008] = {
    id = 1040301008,
    talk_text = function()
      return T_S(10403010080)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301008/1040301008_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301008/1040301008_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"168:-1066", "-168:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040301009,
    speak_name = function()
      return T_S(10403010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00098",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1040301009] = {
    id = 1040301009,
    talk_text = function()
      return T_S(10403010090)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301009/1040301009_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040301009/1040301009_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"168:-1066", "-168:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(10403010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00099",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20001
  },
  [1040302001] = {
    id = 1040302001,
    talk_text = function()
      return T_S(10403020010)
    end,
    next_dialog = 1040302002,
    env_sound = 20002
  },
  [1040302002] = {
    id = 1040302002,
    talk_text = function()
      return T_S(10403020020)
    end,
    is_master = 1,
    next_dialog = 1040302003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00070",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1040302003] = {
    id = 1040302003,
    talk_text = function()
      return T_S(10403020030)
    end,
    is_master = 1,
    next_dialog = 1040302004,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00071",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  },
  [1040302004] = {
    id = 1040302004,
    talk_text = function()
      return T_S(10403020040)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040302004/1040302004_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"20:-980"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040302005,
    speak_name = function()
      return T_S(10403020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00081",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20002
  },
  [1040302005] = {
    id = 1040302005,
    talk_text = function()
      return T_S(10403020050)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040302005/1040302005_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040302005/1040302005_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      ""
    },
    role_position = {"250:-980", "-320:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "200"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040302006,
    speak_name = function()
      return T_S(10403020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00082",
    text_sound_bank = "bank:/voice_cn/sty/M0004_1",
    env_sound = 20002
  },
  [1040302006] = {
    id = 1040302006,
    talk_text = function()
      return T_S(10403020060)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040302006/1040302006_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040302007,
    speak_name = function()
      return T_S(10403020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00073",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20002
  },
  [1040302007] = {
    id = 1040302007,
    talk_text = function()
      return T_S(10403020070)
    end,
    next_dialog = 1040302008,
    env_sound = 20002
  },
  [1040302008] = {
    id = 1040302008,
    talk_text = function()
      return T_S(10403020080)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040302008/1040302008_90110001.playable"
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
    next_dialog = 1040302009,
    speak_name = function()
      return T_S(10403020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00100",
    text_sound_bank = "bank:/voice_cn/sty/M0001_1",
    env_sound = 20002
  },
  [1040302009] = {
    id = 1040302009,
    talk_text = function()
      return T_S(10403020090)
    end,
    is_master = 1,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040302009/1040302009_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00072",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20002
  }
}
