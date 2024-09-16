BasePlotDialogPart45050 = {
  [1090201001] = {
    id = 1090201001,
    talk_text = function()
      return T_S(10902010010)
    end,
    next_dialog = 1090201002,
    speak_head = 90120023,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010015)
    end,
    text_sound_path = "event:/voice_cn/story/S0045/S0045_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0045",
    env_sound = 20003,
    open_title_1 = function()
      return T_S(10902010018)
    end,
    open_title_2 = function()
      return T_S(10902010019)
    end
  },
  [1090201002] = {
    id = 1090201002,
    talk_text = function()
      return T_S(10902010020)
    end,
    next_dialog = 1090201003,
    speak_head = 90120023,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010025)
    end,
    text_sound_path = "event:/voice_cn/story/S0045/S0045_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0045",
    env_sound = 20003
  },
  [1090201003] = {
    id = 1090201003,
    talk_text = function()
      return T_S(10902010030)
    end,
    next_dialog = 1090201004,
    speak_head = 90120023,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010035)
    end,
    text_sound_path = "event:/voice_cn/story/S0045/S0045_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0045",
    env_sound = 20003
  },
  [1090201004] = {
    id = 1090201004,
    talk_text = function()
      return T_S(10902010040)
    end,
    next_dialog = 1090201005,
    env_sound = 20003
  },
  [1090201005] = {
    id = 1090201005,
    talk_text = function()
      return T_S(10902010050)
    end,
    next_dialog = 1090201006,
    speak_head = 90120034,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010055)
    end,
    text_sound_path = "event:/voice_cn/story/S0047/S0047_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0047",
    env_sound = 20003
  },
  [1090201006] = {
    id = 1090201006,
    talk_text = function()
      return T_S(10902010060)
    end,
    next_dialog = 1090201007,
    speak_head = 90120023,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010065)
    end,
    text_sound_path = "event:/voice_cn/story/S0045/S0045_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0045",
    env_sound = 20003
  },
  [1090201007] = {
    id = 1090201007,
    talk_text = function()
      return T_S(10902010070)
    end,
    next_dialog = 1090201008,
    env_sound = 20003
  },
  [1090201008] = {
    id = 1090201008,
    talk_text = function()
      return T_S(10902010080)
    end,
    next_dialog = 1090201009,
    env_sound = 20003,
    force_auto = 1,
    special_sound = 23003
  },
  [1090201009] = {
    id = 1090201009,
    talk_text = function()
      return T_S(10902010090)
    end,
    next_dialog = 1090201010,
    env_sound = 20003
  },
  [1090201010] = {
    id = 1090201010,
    talk_text = function()
      return T_S(10902010100)
    end,
    next_dialog = 1090201011,
    env_sound = 20003
  },
  [1090201011] = {
    id = 1090201011,
    talk_text = function()
      return T_S(10902010110)
    end,
    next_dialog = 1090201012,
    env_sound = 20003
  },
  [1090201012] = {
    id = 1090201012,
    talk_text = function()
      return T_S(10902010120)
    end,
    next_dialog = 1090201013,
    env_sound = 20003
  },
  [1090201013] = {
    id = 1090201013,
    talk_text = function()
      return T_S(10902010130)
    end,
    next_dialog = 1090201014,
    env_sound = 20003
  },
  [1090201014] = {
    id = 1090201014,
    talk_text = function()
      return T_S(10902010140)
    end,
    is_os = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201014/1090201014_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090201015,
    speak_name = function()
      return T_S(10902010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00296",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1090201015] = {
    id = 1090201015,
    talk_text = function()
      return T_S(10902010150)
    end,
    next_dialog = 1090201016,
    camera_shake = {
      "2",
      "0",
      "2000"
    },
    env_sound = 20003,
    force_auto = 1,
    special_sound = 23015,
    top_effect = {
      "Assets/Art/Effects/Prefab/UI_prefab/PlotEffects/FX_ui_PlotEffects_DoubleSwords.prefab",
      "0"
    }
  },
  [1090201016] = {
    id = 1090201016,
    talk_text = function()
      return T_S(10902010160)
    end,
    next_dialog = 1090201017,
    speak_head = 90120023,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010165)
    end,
    text_sound_path = "event:/voice_cn/story/S0045/S0045_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0045",
    env_sound = 20003
  },
  [1090201017] = {
    id = 1090201017,
    talk_text = function()
      return T_S(10902010170)
    end,
    next_dialog = 1090201018,
    speak_head = 90120036,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010175)
    end,
    text_sound_path = "event:/voice_cn/story/S0048/S0048_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0048",
    env_sound = 20003
  },
  [1090201018] = {
    id = 1090201018,
    talk_text = function()
      return T_S(10902010180)
    end,
    next_dialog = 1090201019,
    env_sound = 20003
  },
  [1090201019] = {
    id = 1090201019,
    talk_text = function()
      return T_S(10902010190)
    end,
    next_dialog = 1090201020,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010195)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201020] = {
    id = 1090201020,
    talk_text = function()
      return T_S(10902010200)
    end,
    next_dialog = 1090201021,
    env_sound = 20003
  },
  [1090201021] = {
    id = 1090201021,
    talk_text = function()
      return T_S(10902010210)
    end,
    next_dialog = 1090201022,
    speak_head = 90120040,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010215)
    end,
    text_sound_path = "event:/voice_cn/story/S0049/S0049_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0049",
    env_sound = 20003
  },
  [1090201022] = {
    id = 1090201022,
    talk_text = function()
      return T_S(10902010220)
    end,
    next_dialog = 1090201023,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010225)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201023] = {
    id = 1090201023,
    talk_text = function()
      return T_S(10902010230)
    end,
    next_dialog = 1090201024,
    speak_head = 90120040,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010235)
    end,
    text_sound_path = "event:/voice_cn/story/S0049/S0049_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0049",
    env_sound = 20003
  },
  [1090201024] = {
    id = 1090201024,
    talk_text = function()
      return T_S(10902010240)
    end,
    next_dialog = 1090201025,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010245)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201025] = {
    id = 1090201025,
    talk_text = function()
      return T_S(10902010250)
    end,
    next_dialog = 1090201026,
    camera_shake = {
      "1",
      "0",
      "1000"
    },
    env_sound = 20003,
    special_sound = 23014
  },
  [1090201026] = {
    id = 1090201026,
    talk_text = function()
      return T_S(10902010260)
    end,
    next_dialog = 1090201027,
    speak_head = 90120040,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010265)
    end,
    text_sound_path = "event:/voice_cn/story/S0049/S0049_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0049",
    env_sound = 20003
  },
  [1090201027] = {
    id = 1090201027,
    talk_text = function()
      return T_S(10902010270)
    end,
    next_dialog = 1090201029,
    env_sound = 20003
  },
  [1090201029] = {
    id = 1090201029,
    talk_text = function()
      return T_S(10902010290)
    end,
    next_dialog = 1090201030,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "blink"
    },
    speak_name = function()
      return T_S(10902010295)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201030] = {
    id = 1090201030,
    talk_text = function()
      return T_S(10902010300)
    end,
    next_dialog = 1090201031,
    speak_head = 90120021,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010305)
    end,
    text_sound_path = "event:/voice_cn/story/S0051/S0051_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0051",
    env_sound = 20003
  },
  [1090201031] = {
    id = 1090201031,
    talk_text = function()
      return T_S(10902010310)
    end,
    next_dialog = 1090201032,
    env_sound = 20003
  },
  [1090201032] = {
    id = 1090201032,
    talk_text = function()
      return T_S(10902010320)
    end,
    next_dialog = 1090201033,
    env_sound = 20003
  },
  [1090201033] = {
    id = 1090201033,
    talk_text = function()
      return T_S(10902010330)
    end,
    next_dialog = 1090201034,
    speak_head = 90120021,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010335)
    end,
    text_sound_path = "event:/voice_cn/story/S0051/S0051_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0051",
    env_sound = 20003
  },
  [1090201034] = {
    id = 1090201034,
    talk_text = function()
      return T_S(10902010340)
    end,
    next_dialog = 1090201035,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010345)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201035] = {
    id = 1090201035,
    talk_text = function()
      return T_S(10902010350)
    end,
    next_dialog = 1090201036,
    env_sound = 20003
  },
  [1090201036] = {
    id = 1090201036,
    talk_text = function()
      return T_S(10902010360)
    end,
    next_dialog = 1090201037,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010365)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201037] = {
    id = 1090201037,
    talk_text = function()
      return T_S(10902010370)
    end,
    next_dialog = 1090201038,
    env_sound = 20003
  },
  [1090201038] = {
    id = 1090201038,
    talk_text = function()
      return T_S(10902010380)
    end,
    next_dialog = 1090201039,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010385)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201039] = {
    id = 1090201039,
    talk_text = function()
      return T_S(10902010390)
    end,
    next_dialog = 1090201040,
    env_sound = 20003
  },
  [1090201040] = {
    id = 1090201040,
    talk_text = function()
      return T_S(10902010400)
    end,
    next_dialog = 1090201041,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10902010405)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201041] = {
    id = 1090201041,
    talk_text = function()
      return T_S(10902010410)
    end,
    next_dialog = 1090201042,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10902010415)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201042] = {
    id = 1090201042,
    talk_text = function()
      return T_S(10902010420)
    end,
    next_dialog = 1090201043,
    speak_head = 90120021,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010425)
    end,
    text_sound_path = "event:/voice_cn/story/S0051/S0051_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0051",
    env_sound = 20003
  },
  [1090201043] = {
    id = 1090201043,
    talk_text = function()
      return T_S(10902010430)
    end,
    next_dialog = 1090201044,
    speak_head = 90120039,
    speak_head_actions = {
      "idle",
      "talk",
      "wink"
    },
    speak_name = function()
      return T_S(10902010435)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201044] = {
    id = 1090201044,
    talk_text = function()
      return T_S(10902010440)
    end,
    next_dialog = 1090201045,
    speak_head = 90120021,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010445)
    end,
    text_sound_path = "event:/voice_cn/story/S0051/S0051_story_00003_02",
    text_sound_bank = "bank:/voice_cn/sty/S0051",
    env_sound = 20003
  },
  [1090201045] = {
    id = 1090201045,
    talk_text = function()
      return T_S(10902010450)
    end,
    next_dialog = 1090201046,
    speak_head = 90120039,
    speak_head_actions = {
      "talk",
      "idle",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10902010455)
    end,
    text_sound_path = "event:/voice_cn/story/S0050/S0050_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0050",
    env_sound = 20003
  },
  [1090201046] = {
    id = 1090201046,
    talk_text = function()
      return T_S(10902010460)
    end,
    next_dialog = 1090201047,
    env_sound = 20003
  },
  [1090201047] = {
    id = 1090201047,
    talk_text = function()
      return T_S(10902010470)
    end,
    next_dialog = 1090201048,
    speak_head = 90120021,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010475)
    end,
    text_sound_path = "event:/voice_cn/story/S0051/S0051_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0051",
    env_sound = 20003
  },
  [1090201048] = {
    id = 1090201048,
    talk_text = function()
      return T_S(10902010480)
    end,
    next_dialog = 1090201049,
    env_sound = 20003,
    special_sound = 23003
  },
  [1090201049] = {
    id = 1090201049,
    talk_text = function()
      return T_S(10902010490)
    end,
    is_os = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201049/1090201049_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"3"},
    effect_in_param = {"270"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090201050,
    speak_name = function()
      return T_S(10902010495)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00297",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1090201050] = {
    id = 1090201050,
    talk_text = function()
      return T_S(10902010500)
    end,
    is_os = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201050/1090201050_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090201063,
    speak_name = function()
      return T_S(10902010505)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00298",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1090201051] = {
    id = 1090201051,
    talk_text = function()
      return T_S(10902010510)
    end,
    next_dialog = 1090201052,
    env_sound = 20003
  },
  [1090201052] = {
    id = 1090201052,
    talk_text = function()
      return T_S(10902010520)
    end,
    next_dialog = 1090201053,
    speak_head = 90120021,
    speak_head_actions = {
      "talk",
      "idle",
      "wink"
    },
    speak_name = function()
      return T_S(10902010525)
    end,
    text_sound_path = "event:/voice_cn/story/S0051/S0051_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0051",
    env_sound = 20003
  },
  [1090201053] = {
    id = 1090201053,
    talk_text = function()
      return T_S(10902010530)
    end,
    next_dialog = 1090201054,
    env_sound = 20003
  },
  [1090201054] = {
    id = 1090201054,
    talk_text = function()
      return T_S(10902010540)
    end,
    next_dialog = 1090201055,
    speak_head = 90120021,
    speak_head_actions = {
      "talk",
      "idle",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10902010545)
    end,
    text_sound_path = "event:/voice_cn/story/S0051/S0051_story_00006_01",
    text_sound_bank = "bank:/voice_cn/sty/S0051",
    env_sound = 20003
  },
  [1090201055] = {
    id = 1090201055,
    talk_text = function()
      return T_S(10902010550)
    end,
    next_dialog = 1090201056,
    speak_head = 90120021,
    speak_head_actions = {
      "talk",
      "idle",
      "angry",
      "wink"
    },
    speak_name = function()
      return T_S(10902010555)
    end,
    text_sound_path = "event:/voice_cn/story/S0051/S0051_story_00006_02",
    text_sound_bank = "bank:/voice_cn/sty/S0051",
    env_sound = 20003
  },
  [1090201056] = {
    id = 1090201056,
    talk_text = function()
      return T_S(10902010560)
    end,
    next_dialog = 1090201057,
    env_sound = 20003
  },
  [1090201057] = {
    id = 1090201057,
    talk_text = function()
      return T_S(10902010570)
    end,
    is_os = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201057/1090201057_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090201058,
    speak_name = function()
      return T_S(10902010575)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00300",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  },
  [1090201058] = {
    id = 1090201058,
    talk_text = function()
      return T_S(10902010580)
    end,
    next_dialog = 1090201059,
    env_sound = 20003
  },
  [1090201059] = {
    id = 1090201059,
    talk_text = function()
      return T_S(10902010590)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201059/1090201059_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1090201060,
    env_sound = 20003
  },
  [1090201060] = {
    id = 1090201060,
    talk_text = function()
      return T_S(10902010600)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201060/1090201060_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090201061,
    speak_name = function()
      return T_S(10902010605)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00301",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20003
  },
  [1090201061] = {
    id = 1090201061,
    talk_text = function()
      return T_S(10902010610)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201061/1090201061_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1090201062,
    env_sound = 20003
  },
  [1090201062] = {
    id = 1090201062,
    talk_text = function()
      return T_S(10902010620)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201062/1090201062_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10902010625)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00302",
    text_sound_bank = "bank:/voice_cn/sty/M0004_4",
    env_sound = 20003
  },
  [1090201063] = {
    id = 1090201063,
    talk_text = function()
      return T_S(10902010630)
    end,
    is_os = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1090201063/1090201063_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"3"},
    effect_out_param = {"270"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1090201051,
    speak_name = function()
      return T_S(10902010635)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00299",
    text_sound_bank = "bank:/voice_cn/sty/M0004_3",
    env_sound = 20003
  }
}
