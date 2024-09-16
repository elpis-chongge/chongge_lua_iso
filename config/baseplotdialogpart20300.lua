BasePlotDialogPart20300 = {
  [1040701001] = {
    id = 1040701001,
    talk_text = function()
      return T_S(10407010010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701001/1040701001_90110001.playable"
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
    next_dialog = 1040701002,
    speak_name = function()
      return T_S(10407010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00114",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20001,
    open_title_1 = function()
      return T_S(10407010018)
    end,
    open_title_2 = function()
      return T_S(10407010019)
    end
  },
  [1040701002] = {
    id = 1040701002,
    talk_text = function()
      return T_S(10407010020)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701002/1040701002_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701002/1040701002_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1000", "250:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "240"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040701003,
    speak_name = function()
      return T_S(10407010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00095",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040701003] = {
    id = 1040701003,
    talk_text = function()
      return T_S(10407010030)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701003/1040701003_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701003/1040701003_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1000", "250:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040701004,
    speak_name = function()
      return T_S(10407010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00115",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20001
  },
  [1040701004] = {
    id = 1040701004,
    talk_text = function()
      return T_S(10407010040)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701004/1040701004_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040701005,
    speak_name = function()
      return T_S(10407010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00097",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20001
  },
  [1040701005] = {
    id = 1040701005,
    talk_text = function()
      return T_S(10407010050)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701005/1040701005_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_1.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"2"},
    effect_in_param = {"150"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040701006,
    speak_name = function()
      return T_S(10407010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00096",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20001
  },
  [1040701006] = {
    id = 1040701006,
    talk_text = function()
      return T_S(10407010060)
    end,
    next_dialog = 1040701007,
    env_sound = 20001
  },
  [1040701007] = {
    id = 1040701007,
    talk_text = function()
      return T_S(10407010070)
    end,
    is_master = 1,
    next_dialog = 1040701008,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00092",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20001
  },
  [1040701008] = {
    id = 1040701008,
    talk_text = function()
      return T_S(10407010080)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701008/1040701008_90110004.playable"
    },
    role_position = {"-50:-1160"},
    effect_in = {"1"},
    effect_in_param = {"150"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040701009,
    speak_name = function()
      return T_S(10407010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00125",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20001
  },
  [1040701009] = {
    id = 1040701009,
    scale = {10000},
    next_dialog = 1040701010,
    camera_shake = {
      "4",
      "0",
      "2500"
    },
    env_sound = 20001,
    force_auto = 1,
    special_sound = 23030
  },
  [1040701010] = {
    id = 1040701010,
    talk_text = function()
      return T_S(10407010100)
    end,
    is_master = 1,
    next_dialog = 1040701026,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00092_01",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20004
  },
  [1040701011] = {
    id = 1040701011,
    talk_text = function()
      return T_S(10407010110)
    end,
    next_dialog = 1040701012,
    env_sound = 20004
  },
  [1040701012] = {
    id = 1040701012,
    talk_text = function()
      return T_S(10407010120)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701012/1040701012_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-30:-1160"},
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040701013,
    speak_name = function()
      return T_S(10407010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00126",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20004
  },
  [1040701013] = {
    id = 1040701013,
    talk_text = function()
      return T_S(10407010130)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701013/1040701013_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701013/1040701013_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"255:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "270"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040701014,
    speak_name = function()
      return T_S(10407010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00098",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004
  },
  [1040701014] = {
    id = 1040701014,
    talk_text = function()
      return T_S(10407010140)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701014/1040701014_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701014/1040701014_90110002.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"255:-1160", "-270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1040701015,
    speak_name = function()
      return T_S(10407010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00127",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20004
  },
  [1040701015] = {
    id = 1040701015,
    talk_text = function()
      return T_S(10407010150)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701015/1040701015_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"1:500:660"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1040701016,
    speak_name = function()
      return T_S(10407010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00097",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20004
  },
  [1040701016] = {
    id = 1040701016,
    talk_text = function()
      return T_S(10407010160)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701016/1040701016_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701016/1040701016_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-200:-980", "180:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1040701017,
    speak_name = function()
      return T_S(10407010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00116",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20004
  },
  [1040701017] = {
    id = 1040701017,
    talk_text = function()
      return T_S(10407010170)
    end,
    is_master = 1,
    next_dialog = 1040701018,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00094",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20004
  },
  [1040701018] = {
    id = 1040701018,
    talk_text = function()
      return T_S(10407010180)
    end,
    is_master = 1,
    next_dialog = 1040701019,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00095",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20004
  },
  [1040701019] = {
    id = 1040701019,
    talk_text = function()
      return T_S(10407010190)
    end,
    is_master = 1,
    next_dialog = 1040701020,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00096",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20004
  },
  [1040701020] = {
    id = 1040701020,
    talk_text = function()
      return T_S(10407010200)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1040701020/1040701020_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(10407010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00117",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20004
  },
  [1040701026] = {
    id = 1040701026,
    talk_text = function()
      return T_S(10407010260)
    end,
    is_master = 1,
    next_dialog = 1040701011,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00093",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20004
  },
  [1040702001] = {
    id = 1040702001,
    talk_text = function()
      return T_S(10407020010)
    end,
    next_dialog = 1040702002,
    env_sound = 20004
  },
  [1040702002] = {
    id = 1040702002,
    talk_text = function()
      return T_S(10407020020)
    end,
    next_dialog = 1040702003,
    speak_head = 90120044,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(10407020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00128",
    text_sound_bank = "bank:/voice_cn/sty/M0004_2",
    env_sound = 20004,
    review_head = "90120004"
  },
  [1040702003] = {
    id = 1040702003,
    talk_text = function()
      return T_S(10407020030)
    end,
    next_dialog = 1040702004,
    speak_head = 90120042,
    speak_head_actions = {
      "talk",
      "idle",
      "angry"
    },
    speak_name = function()
      return T_S(10407020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00099",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004,
    review_head = "90120002"
  },
  [1040702004] = {
    id = 1040702004,
    talk_text = function()
      return T_S(10407020040)
    end,
    next_dialog = 1040702005,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(10407020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00098",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20004,
    review_head = "90120003"
  },
  [1040702005] = {
    id = 1040702005,
    talk_text = function()
      return T_S(10407020050)
    end,
    next_dialog = 1040702006,
    speak_head = 90120041,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(10407020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00118",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20004,
    review_head = "90120001"
  },
  [1040702006] = {
    id = 1040702006,
    talk_text = function()
      return T_S(10407020060)
    end,
    is_master = 1,
    next_dialog = 1040702007,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00097",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20004
  },
  [1040702007] = {
    id = 1040702007,
    talk_text = function()
      return T_S(10407020070)
    end,
    next_dialog = 1040702008,
    env_sound = 20004
  },
  [1040702008] = {
    id = 1040702008,
    talk_text = function()
      return T_S(10407020080)
    end,
    next_dialog = 1040702009,
    camera_shake = {
      "4",
      "0",
      "600"
    },
    env_sound = 20004
  },
  [1040702009] = {
    id = 1040702009,
    talk_text = function()
      return T_S(10407020090)
    end,
    next_dialog = 1040702010,
    speak_head = 90120043,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(10407020095)
    end,
    camera_shake = {
      "1",
      "0",
      "5200"
    },
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00099",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20004,
    review_head = "90120003"
  },
  [1040702010] = {
    id = 1040702010,
    talk_text = function()
      return T_S(10407020100)
    end,
    next_dialog = 1040702011,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(10407020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00100",
    text_sound_bank = "bank:/voice_cn/sty/M0003_1",
    env_sound = 20004,
    review_head = "90120003"
  },
  [1040702011] = {
    id = 1040702011,
    talk_text = function()
      return T_S(10407020110)
    end,
    next_dialog = 1040702012,
    speak_head = 90120042,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(10407020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00100",
    text_sound_bank = "bank:/voice_cn/sty/M0002_1",
    env_sound = 20004,
    review_head = "90120002"
  },
  [1040702012] = {
    id = 1040702012,
    talk_text = function()
      return T_S(10407020120)
    end,
    next_dialog = 1040702013,
    speak_head = 90120010,
    speak_head_actions = {"idle", "smile"},
    speak_name = function()
      return T_S(10407020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0012/M0012_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/M0012",
    env_sound = 20004,
    review_head = "90120005"
  },
  [1040702013] = {
    id = 1040702013,
    talk_text = function()
      return T_S(10407020130)
    end,
    next_dialog = 1040702014,
    speak_head = 90120041,
    speak_head_actions = {
      "idle",
      "talk",
      "angry"
    },
    speak_name = function()
      return T_S(10407020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00119",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20004,
    review_head = "90120001"
  },
  [1040702014] = {
    id = 1040702014,
    talk_text = function()
      return T_S(10407020140)
    end,
    next_dialog = 1040702015,
    speak_head = 90120010,
    speak_head_actions = {
      "idle",
      "talk",
      "angry"
    },
    speak_name = function()
      return T_S(10407020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0012/M0012_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/M0012",
    env_sound = 20004,
    review_head = "90120005"
  },
  [1040702015] = {
    id = 1040702015,
    talk_text = function()
      return T_S(10407020150)
    end,
    next_dialog = 1040702016,
    speak_head = 90120041,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(10407020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00120",
    text_sound_bank = "bank:/voice_cn/sty/M0001_2",
    env_sound = 20004,
    review_head = "90120001"
  },
  [1040702016] = {
    id = 1040702016,
    talk_text = function()
      return T_S(10407020160)
    end,
    is_master = 1,
    next_dialog = 1040702017,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00098",
    text_sound_bank = "bank:/voice_cn/sty/M0000_1",
    env_sound = 20004
  },
  [1040702017] = {
    id = 1040702017,
    talk_text = function()
      return T_S(10407020170)
    end,
    next_dialog = 1040702018,
    env_sound = 20004
  },
  [1040702018] = {
    id = 1040702018,
    talk_text = function()
      return T_S(10407020180)
    end,
    next_dialog = 1040702019,
    env_sound = 20004
  },
  [1040702019] = {
    id = 1040702019,
    talk_text = function()
      return T_S(10407020190)
    end,
    next_dialog = 1040702020,
    env_sound = 20004
  },
  [1040702020] = {
    id = 1040702020,
    talk_text = function()
      return T_S(10407020200)
    end,
    env_sound = 20004
  }
}
