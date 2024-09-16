BasePlotDialogPart25002 = {
  [1050105001] = {
    id = 1050105001,
    next_dialog = 1050105002,
    camera_shake = {
      "2",
      "0",
      "1200"
    },
    env_sound = 20004,
    force_auto = 1,
    special_sound = 23014,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_SingleSword.prefab",
      "0"
    }
  },
  [1050105002] = {
    id = 1050105002,
    talk_text = function()
      return T_S(10501050020)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050105002/1050105002_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1050105003,
    speak_name = function()
      return T_S(10501050025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00136",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20004
  },
  [1050105003] = {
    id = 1050105003,
    talk_text = function()
      return T_S(10501050030)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050105003/1050105003_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050105003/1050105003_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"270:-1000", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "200"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1050105004,
    speak_name = function()
      return T_S(10501050035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00110",
    text_sound_bank = "bank:/voice_cn/sty/M0002_2",
    env_sound = 20004
  },
  [1050105004] = {
    id = 1050105004,
    talk_text = function()
      return T_S(10501050040)
    end,
    next_dialog = 1050105005,
    camera_shake = {
      "2",
      "0",
      "1500"
    },
    env_sound = 20004
  },
  [1050105005] = {
    id = 1050105005,
    talk_text = function()
      return T_S(10501050050)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1050105005/1050105005_90110004.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10501050055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00144",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20004
  }
}
