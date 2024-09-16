BaseGuideStep = {
  [70710000] = {
    id = 70710000,
    type = 7,
    plot_stage = 50110101,
    listen_complete_func = function()
      return GuideMgr.IsStageComplete(50110101)
    end,
    direct_play = 1,
    manual_play = 1
  },
  [70710010] = {
    id = 70710010,
    window_name = "FormationWindow",
    caption_id = 70730010,
    type = 5,
    stage = 50110102,
    auto_open_window_func = function()
      return GuideMgr.OpenFormationWindow(50110102)
    end,
    manual_play = 1
  },
  [70710011] = {
    id = 70710011,
    window_name = "FormationWindow",
    ctrl_id = "Choice/CardList/Container/Container/10000118",
    type = 5,
    polyhedron_pos = {105, -58},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {131, -75},
    bubble_text = function()
      return T(80010000)
    end,
    polyhedron_effect = 1,
    manual_play = 1,
    drag_card = "10000118:304",
    ratioY = -1
  },
  [70710012] = {
    id = 70710012,
    window_name = "FormationWindow",
    ctrl_id = "FormationGrid/ObjectContainer/302",
    type = 5,
    polyhedron_pos = {-63, -180},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {-35, -198},
    bubble_text = function()
      return T(80010001)
    end,
    polyhedron_effect = 1,
    manual_play = 1,
    drag_card = "10000101:101",
    ratioY = -1
  },
  [70710013] = {
    id = 70710013,
    window_name = "FormationWindow",
    ctrl_id = "BattleBtn",
    type = 1,
    polyhedron_pos = {-16, -52},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {10, -65},
    bubble_text = function()
      return T(80010002)
    end,
    polyhedron_type = 0,
    polyhedron_mask_pos = {98, 115},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7,
    manual_play = 1
  },
  [70710014] = {
    id = 70710014,
    type = 0,
    listen_complete_func = function()
      return GuideMgr.IsStageComplete(50110102)
    end,
    direct_play = 1,
    manual_play = 1
  },
  [70710020] = {
    id = 70710020,
    type = 7,
    plot_stage = 50110103,
    listen_complete_func = function()
      return GuideMgr.IsStageComplete(50110103)
    end,
    direct_play = 1,
    manual_play = 1
  },
  [70710021] = {
    id = 70710021,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0,
    manual_play = 1
  },
  [70710030] = {
    id = 70710030,
    window_name = "PlotDungeonWindow",
    ctrl_id = "DungeonMap/MapList/ChapterMap_01/Q4/PlotInfoBtn",
    waitTime = 1,
    type = 1,
    polyhedron_pos = {-62, -99},
    polyhedron_type = 0,
    polyhedron_mask_pos = {131, 50},
    polyhedron_mask_scale = {
      120,
      120,
      50
    },
    alpha = 0.7,
    auto_open_window_func = function()
      return GuideMgr.OpenPlotDungeonWindow(50110104)
    end,
    manual_play = 1
  },
  [70710031] = {
    id = 70710031,
    window_name = "FormationWindow",
    ctrl_id = "BurstStrip",
    type = 1,
    alpha = 0,
    ctrl_move = 1
  },
  [70710032] = {
    id = 70710032,
    caption_id = 70730020,
    manual_play = 1
  },
  [70710033] = {
    id = 70710033,
    window_name = "FormationWindow",
    ctrl_id = "BattleBtn",
    type = 1,
    polyhedron_pos = {-16, -52},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {10, -65},
    bubble_text = function()
      return T(80010003)
    end,
    polyhedron_type = 0,
    polyhedron_mask_pos = {98, 115},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7,
    manual_play = 1
  },
  [70710034] = {
    id = 70710034,
    window_name = "BattleUIWindow",
    url = "Guide:Burst_001",
    type = 3,
    bubble_text = function()
      return T(80010004)
    end,
    manual_play = 1,
    trigger_in_battle = "before_start"
  },
  [70710035] = {
    id = 70710035,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsBurstEnergyFull()
    end,
    manual_play = 1
  },
  [70710036] = {
    id = 70710036,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstRegion/BurstBtn",
    url = "Guide:Burst_002",
    type = 4,
    bubble_text = function()
      return T(80010005)
    end,
    manual_play = 1,
    trigger_in_battle = "burst_sp_enough_hint",
    not_full_screen_click = 1
  },
  [70710037] = {
    id = 70710037,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsBurstActive()
    end,
    manual_play = 1
  },
  [70710038] = {
    id = 70710038,
    window_name = "BattleUIWindow",
    url = "Guide:Burst_003",
    type = 3,
    bubble_text = function()
      return T(80010006)
    end,
    manual_play = 1,
    trigger_in_battle = "burst_card_show_1",
    keep_battle_pause = 1,
    keep_show = 1
  },
  [70710039] = {
    id = 70710039,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/1_1",
    url = "Guide:Burst_003",
    type = 4,
    bubble_text = function()
      return T(80010007)
    end,
    manual_play = 1,
    not_full_screen_click = 1
  },
  [70710040] = {
    id = 70710040,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsCtrlCreated("BattleUIWindow", "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/2_1")
    end,
    manual_play = 1
  },
  [70710041] = {
    id = 70710041,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/2_1",
    url = "Guide:Burst_005",
    type = 4,
    bubble_text = function()
      return T(80010008)
    end,
    manual_play = 1,
    trigger_in_battle = "burst_card_show_2",
    not_full_screen_click = 1,
    show_immediately = 1
  },
  [70710042] = {
    id = 70710042,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsCtrlCreated("BattleUIWindow", "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/4_1")
    end,
    manual_play = 1
  },
  [70710043] = {
    id = 70710043,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/4_1",
    url = "Guide:Burst_006",
    type = 4,
    bubble_text = function()
      return T(80010009)
    end,
    polyhedron_type = 1,
    manual_play = 1,
    trigger_in_battle = "burst_card_show_3",
    not_full_screen_click = 1,
    show_immediately = 1,
    frame_scale = {
      385,
      135,
      50
    }
  },
  [70710044] = {
    id = 70710044,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsCtrlCreated("BattleUIWindow", "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/5_1")
    end,
    manual_play = 1
  },
  [70710045] = {
    id = 70710045,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/5_1",
    url = "Guide:Burst_007",
    type = 4,
    bubble_text = function()
      return T(80010010)
    end,
    polyhedron_type = 1,
    manual_play = 1,
    trigger_in_battle = "burst_card_show_4",
    not_full_screen_click = 1,
    show_immediately = 1,
    frame_scale = {
      385,
      135,
      50
    }
  },
  [70710046] = {
    id = 70710046,
    window_name = "BattleUIWindow",
    url = "Guide:Burst_008",
    type = 3,
    bubble_text = function()
      return T(80010011)
    end,
    manual_play = 1,
    trigger_in_battle = "burst_card_skill_over",
    keep_battle_pause = 1
  },
  [70710047] = {
    id = 70710047,
    window_name = "BattleUIWindow",
    url = "Guide:Burst_009",
    type = 3,
    bubble_text = function()
      return T(80010012)
    end,
    manual_play = 1,
    trigger_in_battle = "now"
  },
  [70710048] = {
    id = 70710048,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsStageComplete(50110104)
    end,
    manual_play = 1,
    continue_battle = 1
  },
  [70710049] = {
    id = 70710049,
    window_name = "PlotDungeonWindow",
    ctrl_id = "DungeonMap/MapList/ChapterMap_01/Q5/PlotInfoBtn",
    waitTime = 1,
    type = 1,
    polyhedron_pos = {-62, -99},
    polyhedron_type = 0,
    polyhedron_mask_pos = {131, 50},
    polyhedron_mask_scale = {
      120,
      120,
      50
    },
    alpha = 0.7,
    auto_open_window_func = function()
      return GuideMgr.OpenPlotDungeonWindow(50110105)
    end,
    manual_play = 1
  },
  [70710050] = {
    id = 70710050,
    window_name = "FormationWindow",
    ctrl_id = "BattleBtn",
    type = 1,
    polyhedron_pos = {-16, -52},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {10, -65},
    bubble_text = function()
      return T(80010002)
    end,
    polyhedron_type = 0,
    polyhedron_mask_pos = {98, 115},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7,
    manual_play = 1
  },
  [70710051] = {
    id = 70710051,
    type = 0,
    listen_complete_func = function()
      return GuideMgr.IsStageComplete(50110105)
    end,
    direct_play = 1,
    manual_play = 1
  },
  [70710052] = {
    id = 70710052,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/AdventureBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-70, 15},
    polyhedron_type = 1,
    polyhedron_mask_pos = {193, 41},
    polyhedron_mask_scale = {
      319,
      143,
      50
    },
    alpha = 0.7
  },
  [70710053] = {
    id = 70710053,
    window_name = "AdventureWindow",
    ctrl_id = "Content/PlotDungeonMap/PlotStartBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {672, 194},
    polyhedron_type = 0,
    polyhedron_mask_pos = {329, 178},
    polyhedron_mask_scale = {
      380,
      380,
      50
    },
    alpha = 0.7,
    effectsAdaptive = 1
  },
  [70710200] = {
    id = 70710200,
    ctrl_id = "FunctionMainBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 55},
    bubble_text = function()
      return T(80010200)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70710201] = {
    id = 70710201,
    window_name = "HomeWindow",
    ctrl_id = "BottomArea/MemberBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {130, -4},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {158, -14},
    bubble_text = function()
      return T(80010201)
    end,
    polyhedron_type = 0,
    polyhedron_mask_pos = {-78, 57},
    polyhedron_mask_scale = {
      65,
      65,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70710202] = {
    id = 70710202,
    window_name = "CardListWindow",
    ctrl_id = "CardA/CardAList/10000104/CardTips:0:CARD_TYPE|CardB/CardBList//10000104/CardTips:1:CARD_TYPE",
    waitTime = 0.8,
    type = 1,
    polyhedron_pos = {301, 230},
    polyhedron_type = 1,
    polyhedron_mask_pos = {-187, 148},
    polyhedron_mask_scale = {
      300,
      700,
      50
    },
    alpha = 0.7
  },
  [70710203] = {
    id = 70710203,
    window_name = "CardDetailsWindow",
    ctrl_id = "Details/LvUpBtn",
    waitTime = 1.2,
    type = 1,
    polyhedron_pos = {-60, 50},
    polyhedron_type = 0,
    polyhedron_mask_pos = {138, 30},
    polyhedron_mask_scale = {
      110,
      110,
      50
    },
    alpha = 0.7
  },
  [70710204] = {
    id = 70710204,
    window_name = "CardDetailsWindow",
    ctrl_id = "CardLevelUp/LevelUp2/LevelUpBtn",
    waitTime = 0.7,
    type = 1,
    polyhedron_pos = {134, -60},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {174, -71},
    bubble_text = function()
      return T(80010202)
    end,
    polyhedron_type = 0,
    polyhedron_mask_pos = {-49, 127},
    polyhedron_mask_scale = {
      110,
      110,
      50
    },
    alpha = 0.01,
    req_severs = 1,
    listen_complete_func = function()
      return GuideMgr.IsCardLvUp(10000104, 3, 0)
    end,
    update_text = function()
      return T(80010212)
    end,
    update_func = function()
      return GuideMgr.CardLvIsEqual(10000104, 1)
    end,
    update_finish_func = function()
      return GuideMgr.IsCardLvUp(10000104, 2, 0)
    end
  },
  [70710205] = {
    id = 70710205,
    window_name = "CardDetailsWindow",
    ctrl_id = "CurrencyReturn/FunctionMainBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 55},
    bubble_text = function()
      return T(80010203)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70710206] = {
    id = 70710206,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/GaChaBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-70, 15},
    polyhedron_type = 1,
    polyhedron_mask_pos = {264, 48},
    polyhedron_mask_scale = {
      500,
      160,
      50
    },
    alpha = 0.7,
    open_gacha_id = 24000002
  },
  [70710207] = {
    id = 70710207,
    window_name = "LotteryWindow",
    ctrl_id = "CardShowRegion/GaChaRegion/Time1Btn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-45, -10},
    polyhedron_scale = {
      50,
      50,
      75
    },
    polyhedron_type = 1,
    polyhedron_mask_pos = {129, 36},
    polyhedron_mask_scale = {
      210,
      65,
      50
    },
    alpha = 0.01
  },
  [70710208] = {
    id = 70710208,
    window_name = "LotteryWindow",
    url = "Guide:Lottery_001",
    type = 2,
    bubble_text = function()
      return T(80010215)
    end,
    hide_wait_time = 0.2,
    hide_path = "ChoiceCard/SkipBtn"
  },
  [70710209] = {
    id = 70710209,
    window_name = "LotteryPaintingShowWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710210] = {
    id = 70710210,
    window_name = "LotteryWindow",
    ctrl_id = "CurrencyReturn/FunctionMainBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 55},
    bubble_text = function()
      return T(80010216)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70710211] = {
    id = 70710211,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/AdventureBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-70, 15},
    polyhedron_type = 1,
    polyhedron_mask_pos = {193, 41},
    polyhedron_mask_scale = {
      319,
      143,
      50
    },
    alpha = 0.7
  },
  [70710212] = {
    id = 70710212,
    window_name = "AdventureWindow",
    ctrl_id = "Content/PlotDungeonMap/PlotStartBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {672, 194},
    polyhedron_type = 0,
    polyhedron_mask_pos = {329, 178},
    polyhedron_mask_scale = {
      380,
      380,
      50
    },
    alpha = 0.7,
    effectsAdaptive = 1
  },
  [70710213] = {
    id = 70710213,
    window_name = "PlotDungeonWindow",
    ctrl_id = "DungeonMap/MapList/ChapterMap_01/Q6/PlotInfoBtn",
    waitTime = 1,
    type = 1,
    polyhedron_pos = {-62, -99},
    polyhedron_type = 0,
    polyhedron_mask_pos = {131, 50},
    polyhedron_mask_scale = {
      120,
      120,
      50
    },
    alpha = 0.7,
    manual_play = 1
  },
  [70710214] = {
    id = 70710214,
    window_name = "FormationWindow",
    ctrl_id = "Choice/CardList/10000153",
    type = 5,
    polyhedron_pos = {105, -58},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {131, -75},
    bubble_text = function()
      return T(80010217)
    end,
    polyhedron_effect = 1,
    drag_card = "10000153:202",
    ratioX = -1,
    hide_path = "CurrencyReturn"
  },
  [70710215] = {
    id = 70710215,
    window_name = "FormationWindow",
    ctrl_id = "FormationGrid/ObjectContainer/1101",
    url = "Guide:Burst_101",
    type = 4,
    bubble_pos = {0, 0},
    bubble_text = function()
      return T(80010218)
    end,
    skip_condition = "10000101:104"
  },
  [70710216] = {
    id = 70710216,
    window_name = "FormationWindow",
    ctrl_id = "FormationGrid/ObjectContainer/101",
    type = 5,
    polyhedron_pos = {-63, -140},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {-35, -158},
    bubble_text = function()
      return T(80010219)
    end,
    polyhedron_effect = 1,
    drag_card = "10000101:104",
    ratioX = 2
  },
  [70710217] = {
    id = 70710217,
    window_name = "FormationWindow",
    ctrl_id = "BattleBtn",
    type = 1,
    polyhedron_pos = {-116, -52},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {-90, -65},
    bubble_text = function()
      return T(80010220)
    end,
    polyhedron_type = 0,
    polyhedron_mask_pos = {198, 115},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70710218] = {
    id = 70710218,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsBurstEnergyFull()
    end
  },
  [70710219] = {
    id = 70710219,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstRegion/BurstBtn",
    url = "Guide:Burst_102",
    type = 4,
    bubble_text = function()
      return T(80010221)
    end,
    trigger_in_battle = "burst_sp_enough_hint",
    not_full_screen_click = 1
  },
  [70710220] = {
    id = 70710220,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsCtrlCreated("BattleUIWindow", "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/5_1")
    end
  },
  [70710221] = {
    id = 70710221,
    window_name = "BattleUIWindow",
    url = "Guide:Burst_103",
    type = 3,
    bubble_text = function()
      return T(80010222)
    end,
    trigger_in_battle = "burst_card_show_5",
    keep_battle_pause = 1
  },
  [70710222] = {
    id = 70710222,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/5_1/BurstCardHead",
    url = "Guide:Burst_104",
    type = 4,
    bubble_text = function()
      return T(80010223)
    end,
    not_full_screen_click = 1,
    show_immediately = 1
  },
  [70710223] = {
    id = 70710223,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsBurstEnergyFull()
    end
  },
  [70710224] = {
    id = 70710224,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstRegion/BurstBtn",
    url = "Guide:Burst_105",
    type = 4,
    bubble_text = function()
      return T(80010224)
    end,
    trigger_in_battle = "burst_sp_enough_hint",
    not_full_screen_click = 1
  },
  [70710225] = {
    id = 70710225,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsCtrlCreated("BattleUIWindow", "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/5_1")
    end
  },
  [70710226] = {
    id = 70710226,
    window_name = "BattleUIWindow",
    url = "Guide:Burst_106",
    type = 3,
    bubble_text = function()
      return T(80010225)
    end,
    trigger_in_battle = "burst_card_show_5",
    keep_battle_pause = 1
  },
  [70710227] = {
    id = 70710227,
    window_name = "BattleUIWindow",
    ctrl_id = "BurstCardHeadRegion/BurstCardHeadList/BurstCardHeadList/5_2/BurstCardHead",
    url = "Guide:Burst_107",
    type = 4,
    bubble_text = function()
      return T(80010226)
    end,
    not_full_screen_click = 1,
    show_immediately = 1
  },
  [70710228] = {
    id = 70710228,
    window_name = "BattleUIWindow",
    type = 9,
    listen_complete_func = function()
      return GuideMgr.IsStageComplete(50110106)
    end
  },
  [70710229] = {
    id = 70710229,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710230] = {
    id = 70710230,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710300] = {
    id = 70710300,
    window_name = "FormationWindow",
    ctrl_id = "FormationGrid/ObjectContainer/1404",
    url = "Guide:PlotDungeon2-3_001",
    waitTime = 0.5,
    type = 4,
    bubble_pos = {0, 0},
    bubble_text = function()
      return T(80010204)
    end
  },
  [70710400] = {
    id = 70710400,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710401] = {
    id = 70710401,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/AdventureBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-70, 15},
    polyhedron_type = 1,
    polyhedron_mask_pos = {193, 41},
    polyhedron_mask_scale = {
      319,
      143,
      50
    },
    alpha = 0.7
  },
  [70710402] = {
    id = 70710402,
    story_id = 10001,
    type = 8
  },
  [70710403] = {
    id = 70710403,
    ctrl_id = "ReturnBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {241, 76},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {265, 62},
    bubble_text = function()
      return T(80010206)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-142, -44},
    polyhedron_mask_scale = {
      242,
      60,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70710404] = {
    id = 70710404,
    window_name = "AdventureWindow",
    ctrl_id = "TabRegion/Tab2Btn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-12, 11},
    polyhedron_type = 1,
    polyhedron_mask_pos = {142, 44},
    polyhedron_mask_scale = {
      200,
      80,
      50
    },
    alpha = 0.7
  },
  [70710405] = {
    id = 70710405,
    window_name = "AdventureWindow",
    ctrl_id = "Content/DailyDungeonMap/DailyStartBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {672, 194},
    polyhedron_type = 0,
    polyhedron_mask_pos = {329, 178},
    polyhedron_mask_scale = {
      380,
      380,
      50
    },
    alpha = 0.7,
    effectsAdaptive = 1
  },
  [70710406] = {
    id = 70710406,
    window_name = "DailyDungeonWindow",
    ctrl_id = "TipsList/50000400/DailyTipsPic",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-83, 417},
    polyhedron_type = 1,
    polyhedron_mask_pos = {192, 68},
    polyhedron_mask_scale = {
      285,
      625,
      50
    },
    alpha = 0.7
  },
  [70710407] = {
    id = 70710407,
    window_name = "DailyDungeonWindow",
    ctrl_id = "TipsList/50000400/DailyTipsPic",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {44, 435},
    polyhedron_type = 1,
    polyhedron_mask_pos = {65, 63},
    polyhedron_mask_scale = {
      285,
      625,
      50
    },
    alpha = 0.7,
    jump = 1
  },
  [70710408] = {id = 70710408, caption_id = 70730030},
  [70710409] = {
    id = 70710409,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710500] = {
    id = 70710500,
    window_name = "FormationWindow",
    ctrl_id = "FormationGrid/ObjectContainer/1405",
    url = "Guide:PlotDungeon2-8_001",
    waitTime = 0.5,
    type = 4,
    bubble_pos = {0, 0},
    bubble_text = function()
      return T(80010205)
    end
  },
  [70710600] = {
    id = 70710600,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710601] = {
    id = 70710601,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/AdventureBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-70, 15},
    polyhedron_type = 1,
    polyhedron_mask_pos = {193, 41},
    polyhedron_mask_scale = {
      319,
      143,
      50
    },
    alpha = 0.7
  },
  [70710602] = {
    id = 70710602,
    story_id = 10002,
    type = 8
  },
  [70710603] = {
    id = 70710603,
    ctrl_id = "FunctionJumpBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 52},
    bubble_text = function()
      return T(80010207)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    alpha = 0.7
  },
  [70710604] = {
    id = 70710604,
    ctrl_id = "CurrencyReturn/CurrencyIndex2/CurrencyIndex1/CurrencyIndex1/AdventureBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {-109, -34},
    polyhedron_type = 0,
    polyhedron_mask_pos = {109, 40},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    alpha = 0.7
  },
  [70710605] = {
    id = 70710605,
    window_name = "AdventureWindow",
    ctrl_id = "TabRegion/Tab3Btn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-12, 11},
    polyhedron_type = 1,
    polyhedron_mask_pos = {142, 44},
    polyhedron_mask_scale = {
      200,
      80,
      50
    },
    alpha = 0.7
  },
  [70710606] = {
    id = 70710606,
    window_name = "AdventureWindow",
    ctrl_id = "Content/TowerMap/TowerStartBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {782, 206},
    polyhedron_type = 0,
    polyhedron_mask_pos = {296, 166},
    polyhedron_mask_scale = {
      320,
      320,
      50
    },
    alpha = 0.7,
    effectsAdaptive = 1
  },
  [70710607] = {
    id = 70710607,
    window_name = "TowerListWindow",
    ctrl_id = "TipsList/70072001/LayersTips",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {200, -129},
    bubble_pos = {232, -140},
    bubble_text = function()
      return T(80010213)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-215, 145},
    polyhedron_mask_scale = {
      370,
      580,
      50
    },
    alpha = 0.7
  },
  [70710608] = {id = 70710608, caption_id = 70730040},
  [70710609] = {
    id = 70710609,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710700] = {
    id = 70710700,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710701] = {
    id = 70710701,
    story_id = 10003,
    type = 8
  },
  [70710702] = {
    id = 70710702,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/HomeBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-57, 30},
    polyhedron_type = 1,
    polyhedron_mask_pos = {144, 33},
    polyhedron_mask_scale = {
      220,
      165,
      50
    },
    alpha = 0.7,
    hide_path = "MiddleZone/AbyssNewPeopleBtn"
  },
  [70710703] = {
    id = 70710703,
    ctrl_id = "FunctionJumpBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 52},
    bubble_text = function()
      return T(80010208)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    alpha = 0.7
  },
  [70710704] = {
    id = 70710704,
    ctrl_id = "CurrencyReturn/CurrencyIndex2/CurrencyIndex1/CurrencyIndex1/AbyssBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {-123, -29},
    polyhedron_type = 0,
    polyhedron_mask_pos = {122, 35},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    alpha = 0.7
  },
  [70710705] = {id = 70710705, caption_id = 70730060},
  [70710706] = {
    id = 70710706,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710800] = {
    id = 70710800,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710801] = {
    id = 70710801,
    window_name = "HomeWindow",
    ctrl_id = "BottomArea/BadgeBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {130, -4},
    polyhedron_scale = {
      50,
      50,
      75
    },
    polyhedron_type = 0,
    polyhedron_mask_pos = {-78, 57},
    polyhedron_mask_scale = {
      65,
      65,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70710802] = {
    id = 70710802,
    story_id = 10006,
    type = 8
  },
  [70710803] = {
    id = 70710803,
    ctrl_id = "FunctionJumpBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 52},
    bubble_text = function()
      return T(80010211)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    alpha = 0.7
  },
  [70710804] = {id = 70710804, caption_id = 70730070},
  [70710805] = {
    id = 70710805,
    window_name = "BadgeWindow",
    ctrl_id = "GuideBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {335, 120},
    bubble_pos = {383, 120},
    bubble_text = function()
      return T(80010214)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-205, 108},
    polyhedron_mask_scale = {
      340,
      620,
      50
    },
    alpha = 0.7
  },
  [70710806] = {
    id = 70710806,
    caption_id = 70730071,
    manual_play = 1
  },
  [70710807] = {
    id = 70710807,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710808] = {
    id = 70710808,
    ctrl_id = "CurrencyReturn/CurrencyIndex2/CurrencyIndex1/CurrencyIndex1/BadgeBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {-109, -34},
    polyhedron_type = 0,
    polyhedron_mask_pos = {109, 40},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    alpha = 0.7
  },
  [70710900] = {
    id = 70710900,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710901] = {
    id = 70710901,
    story_id = 10005,
    type = 8
  },
  [70710902] = {
    id = 70710902,
    window_name = "HomeWindow",
    ctrl_id = "BottomArea/GuildBtn",
    type = 1,
    polyhedron_pos = {130, -4},
    polyhedron_scale = {
      50,
      50,
      75
    },
    polyhedron_type = 0,
    polyhedron_mask_pos = {-78, 57},
    polyhedron_mask_scale = {
      65,
      65,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70710903] = {
    id = 70710903,
    ctrl_id = "FunctionJumpBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 52},
    bubble_text = function()
      return T(80010210)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    alpha = 0.7
  },
  [70710904] = {id = 70710904, caption_id = 70730090},
  [70710905] = {
    id = 70710905,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70710906] = {
    id = 70710906,
    ctrl_id = "CurrencyReturn/CurrencyIndex2/CurrencyIndex1/CurrencyIndex1/GuildBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {-107, -39},
    polyhedron_type = 0,
    polyhedron_mask_pos = {107, 45},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    alpha = 0.7
  },
  [70711000] = {
    id = 70711000,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711001] = {
    id = 70711001,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/AdventureBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-70, 15},
    polyhedron_type = 1,
    polyhedron_mask_pos = {193, 41},
    polyhedron_mask_scale = {
      319,
      143,
      50
    },
    alpha = 0.7
  },
  [70711002] = {
    id = 70711002,
    story_id = 10004,
    type = 8
  },
  [70711003] = {
    id = 70711003,
    ctrl_id = "FunctionJumpBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 52},
    bubble_text = function()
      return T(80010209)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    alpha = 0.7
  },
  [70711004] = {
    id = 70711004,
    ctrl_id = "CurrencyReturn/CurrencyIndex2/CurrencyIndex1/CurrencyIndex1/AdventureBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {-109, -34},
    polyhedron_type = 0,
    polyhedron_mask_pos = {109, 40},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    alpha = 0.7
  },
  [70711005] = {
    id = 70711005,
    window_name = "AdventureWindow",
    ctrl_id = "TabRegion/Tab4Btn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-12, 11},
    polyhedron_type = 1,
    polyhedron_mask_pos = {142, 44},
    polyhedron_mask_scale = {
      200,
      80,
      50
    },
    alpha = 0.7
  },
  [70711006] = {
    id = 70711006,
    window_name = "AdventureWindow",
    ctrl_id = "Content/ArenaMap/ArenaStartBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {672, 194},
    polyhedron_type = 0,
    polyhedron_mask_pos = {329, 148},
    polyhedron_mask_scale = {
      380,
      380,
      50
    },
    alpha = 0.7,
    effectsAdaptive = 1
  },
  [70711007] = {id = 70711007, caption_id = 70730100},
  [70711008] = {
    id = 70711008,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711100] = {
    id = 70711100,
    window_name = "Boss",
    story_id = 10007,
    type = 8
  },
  [70711101] = {
    id = 70711101,
    window_name = "Boss",
    caption_id = 70730080
  },
  [70711200] = {
    id = 70711200,
    window_name = "RogueWindow",
    waitTime = 3,
    caption_id = 70730150
  },
  [70711201] = {
    id = 70711201,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711202] = {
    id = 70711202,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0,
    listen_complete_func = function()
      return not UIMgr:IsWindowOpen(WinResConfig.FunctionWindow.name)
    end
  },
  [70711300] = {
    id = 70711300,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711301] = {
    id = 70711301,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711302] = {
    id = 70711302,
    ctrl_id = "CurrencyReturn/FunctionMainBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 55},
    bubble_text = function()
      return T(80010227)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    polyhedron_effect = 1,
    alpha = 0.7
  },
  [70711303] = {
    id = 70711303,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/ActivityBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-70, 15},
    polyhedron_type = 1,
    polyhedron_mask_pos = {301, 11},
    polyhedron_mask_scale = {
      562,
      55,
      50
    },
    alpha = 0.7,
    open_gacha_id = 70060602
  },
  [70711304] = {id = 70711304, caption_id = 70730050},
  [70711305] = {
    id = 70711305,
    window_name = "CarnivalWindow",
    ctrl_id = "ActivityContent/DailyTask/DailyRegion/DailyList/70053010/DailyTips/SubmitBtn",
    waitTime = 0.8,
    type = 1,
    polyhedron_pos = {740, -55},
    polyhedron_scale = {
      50,
      50,
      75
    },
    polyhedron_type = 1,
    polyhedron_mask_pos = {-358, 96},
    polyhedron_mask_scale = {
      990,
      108,
      50
    },
    alpha = 0.7
  },
  [70711400] = {
    id = 70711400,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711401] = {
    id = 70711401,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711500] = {
    id = 70711500,
    window_name = "LevelUpWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711501] = {
    id = 70711501,
    window_name = "FunctionWindow",
    ctrl_id = "TouchScreenBtn",
    waitTime = 0.1,
    type = 1,
    alpha = 0
  },
  [70711502] = {
    id = 70711502,
    ctrl_id = "FunctionJumpBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {168, 65},
    polyhedron_scale = {
      50,
      50,
      75
    },
    bubble_pos = {195, 52},
    bubble_text = function()
      return T(80010228)
    end,
    polyhedron_type = 1,
    polyhedron_mask_pos = {-104, -32},
    polyhedron_mask_scale = {
      154,
      60,
      50
    },
    alpha = 0.7
  },
  [70711503] = {
    id = 70711503,
    ctrl_id = "CurrencyReturn/CurrencyIndex2/CurrencyIndex1/CurrencyIndex1/AdventureBtn",
    waitTime = 0.5,
    type = 6,
    polyhedron_pos = {-109, -34},
    polyhedron_type = 0,
    polyhedron_mask_pos = {109, 40},
    polyhedron_mask_scale = {
      80,
      80,
      50
    },
    alpha = 0.7
  },
  [70711504] = {
    id = 70711504,
    window_name = "AdventureWindow",
    ctrl_id = "TabRegion/Tab5Btn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-12, 11},
    polyhedron_type = 1,
    polyhedron_mask_pos = {142, 44},
    polyhedron_mask_scale = {
      200,
      80,
      50
    },
    alpha = 0.7
  },
  [70711505] = {
    id = 70711505,
    window_name = "AdventureWindow",
    ctrl_id = "Content/RaidBossMap/RaidBossStartBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {702, 186},
    polyhedron_type = 0,
    polyhedron_mask_pos = {296, 166},
    polyhedron_mask_scale = {
      360,
      360,
      50
    },
    alpha = 0.7,
    effectsAdaptive = 1
  },
  [70711506] = {
    id = 70711506,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/AdventureBtn",
    waitTime = 0.5,
    type = 1,
    polyhedron_pos = {-70, 15},
    polyhedron_type = 1,
    polyhedron_mask_pos = {193, 41},
    polyhedron_mask_scale = {
      319,
      143,
      50
    },
    alpha = 0.7
  },
  [70711507] = {
    id = 70711507,
    caption_id = 70730130,
    open_func = function()
      return GuideMgr.IsInRaidBoss()
    end,
    fail_caption_id = 70730140
  },
  [70711600] = {
    id = 70711600,
    window_name = "TideWindow",
    caption_id = 70730120
  },
  [70711700] = {
    id = 70711700,
    window_name = "SuperWindow",
    caption_id = 70730110
  },
  [70711800] = {
    id = 70711800,
    window_name = "GuildBossWindow",
    caption_id = 70730160
  }
}
