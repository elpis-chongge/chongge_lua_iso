BasePlotDialogPart50201 = {
  [1100503001] = {
    id = 1100503001,
    talk_text = function()
      return T_S(11005030010)
    end,
    next_dialog = 1100503002,
    camera_shake = {
      "3",
      "0",
      "2700"
    },
    env_sound = 20004,
    special_sound = 23022
  },
  [1100503002] = {
    id = 1100503002,
    talk_text = function()
      return T_S(11005030020)
    end,
    next_dialog = 1100503003,
    env_sound = 20004
  },
  [1100503003] = {
    id = 1100503003,
    talk_text = function()
      return T_S(11005030030)
    end,
    cg_position_scale = "-50:-270:10000",
    next_dialog = 1100503004,
    env_sound = 20004
  },
  [1100503004] = {
    id = 1100503004,
    talk_text = function()
      return T_S(11005030040)
    end,
    next_dialog = 1100503005,
    env_sound = 20004
  },
  [1100503005] = {
    id = 1100503005,
    cg_text = function()
      return T_S(11005030057)
    end,
    cg_position_scale = "-50:-240:10000",
    next_dialog = 1100503006,
    speak_name = function()
      return T_S(11005030055)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00021",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20004,
    review_head = "90120001"
  },
  [1100503006] = {
    id = 1100503006,
    talk_text = function()
      return T_S(11005030060)
    end,
    next_dialog = 1100503007,
    env_sound = 20004
  },
  [1100503007] = {
    id = 1100503007,
    talk_text = function()
      return T_S(11005030070)
    end,
    next_dialog = 1100503008,
    speak_name = function()
      return T_S(11005030075)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00081",
    text_sound_bank = "bank:/voice_cn/sty/M0018",
    env_sound = 20004,
    review_head = "90120002"
  },
  [1100503008] = {
    id = 1100503008,
    talk_text = function()
      return T_S(11005030080)
    end,
    next_dialog = 1100503009,
    env_sound = 20004
  },
  [1100503009] = {
    id = 1100503009,
    talk_text = function()
      return T_S(11005030090)
    end,
    is_master = 1,
    next_dialog = 1100503010,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00350",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20004
  },
  [1100503010] = {
    id = 1100503010,
    talk_text = function()
      return T_S(11005030100)
    end,
    next_dialog = 1100503011,
    env_sound = 20004
  },
  [1100503011] = {
    id = 1100503011,
    talk_text = function()
      return T_S(11005030110)
    end,
    next_dialog = 1100503012,
    speak_head = 90120043,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(11005030115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00462",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20004
  },
  [1100503012] = {
    id = 1100503012,
    talk_text = function()
      return T_S(11005030120)
    end,
    next_dialog = 1100503013,
    speak_head = 90120042,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(11005030125)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00269",
    text_sound_bank = "bank:/voice_cn/sty/M0002_3",
    env_sound = 20004
  },
  [1100503013] = {
    id = 1100503013,
    talk_text = function()
      return T_S(11005030130)
    end,
    speak_head = 90120044,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11005030135)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00344",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20004
  },
  [1100504008] = {
    id = 1100504008,
    talk_text = function()
      return T_S(11005040080)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504008/1100504008_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504008/1100504008_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-321:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100504009,
    speak_name = function()
      return T_S(11005040085)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00463",
    text_sound_bank = "bank:/voice_cn/sty/M0003_5",
    env_sound = 20007
  },
  [1100504009] = {
    id = 1100504009,
    talk_text = function()
      return T_S(11005040090)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504009/1100504009_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504009/1100504009_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-321:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100504010,
    speak_name = function()
      return T_S(11005040095)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00345",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20007
  },
  [1100504010] = {
    id = 1100504010,
    talk_text = function()
      return T_S(11005040100)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504010/1100504010_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504010/1100504010_90110003.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-321:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1100504011,
    env_sound = 20007
  },
  [1100504011] = {
    id = 1100504011,
    talk_text = function()
      return T_S(11005040110)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504011/1100504011_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100504012,
    speak_name = function()
      return T_S(11005040115)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00163",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20007
  },
  [1100504012] = {
    id = 1100504012,
    talk_text = function()
      return T_S(11005040120)
    end,
    next_dialog = 1100504013,
    env_sound = 20007
  },
  [1100504013] = {
    id = 1100504013,
    talk_text = function()
      return T_S(11005040130)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504013/1100504013_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100504014,
    speak_name = function()
      return T_S(11005040135)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20007
  },
  [1100504014] = {
    id = 1100504014,
    talk_text = function()
      return T_S(11005040140)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504014/1100504014_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504014/1100504014_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100504015,
    speak_name = function()
      return T_S(11005040145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00346",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20007
  },
  [1100504015] = {
    id = 1100504015,
    talk_text = function()
      return T_S(11005040150)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504015/1100504015_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504015/1100504015_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1100504016,
    speak_name = function()
      return T_S(11005040155)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20007
  },
  [1100504016] = {
    id = 1100504016,
    talk_text = function()
      return T_S(11005040160)
    end,
    role_ids = {90110005, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504016/1100504016_90110005.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504016/1100504016_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      ""
    },
    role_position = {"233:-985", "-321:-1160"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1100504017,
    speak_name = function()
      return T_S(11005040165)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00347",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20007
  },
  [1100504017] = {
    id = 1100504017,
    talk_text = function()
      return T_S(11005040170)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504017/1100504017_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100504018,
    speak_name = function()
      return T_S(11005040175)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00164",
    text_sound_bank = "bank:/voice_cn/sty/M0015_2",
    env_sound = 20007
  },
  [1100504018] = {
    id = 1100504018,
    talk_text = function()
      return T_S(11005040180)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504018/1100504018_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    role_shake = {
      "1:1100:1500"
    },
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100504019,
    speak_name = function()
      return T_S(11005040185)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00024",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20007
  },
  [1100504019] = {
    id = 1100504019,
    talk_text = function()
      return T_S(11005040190)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504019/1100504019_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1100504020,
    env_sound = 20007
  },
  [1100504020] = {
    id = 1100504020,
    talk_text = function()
      return T_S(11005040200)
    end,
    is_master = 1,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504020/1100504020_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1100504021,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00351",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  },
  [1100504021] = {
    id = 1100504021,
    talk_text = function()
      return T_S(11005040210)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504021/1100504021_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1100504022,
    speak_name = function()
      return T_S(11005040215)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00025",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20007
  },
  [1100504022] = {
    id = 1100504022,
    talk_text = function()
      return T_S(11005040220)
    end,
    is_master = 1,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504022/1100504022_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1100504023,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00352",
    text_sound_bank = "bank:/voice_cn/sty/M0000_4",
    env_sound = 20007
  },
  [1100504023] = {
    id = 1100504023,
    talk_text = function()
      return T_S(11005040230)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1100504023/1100504023_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11005040235)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/M0019",
    env_sound = 20007
  }
}
