BaseChapter = {
  [50000101] = {
    id = 50000101,
    name = function()
      return T(80200000, 1)
    end,
    chapter_english = function()
      return T(80200001)
    end,
    name_detail = function()
      return T(80200101)
    end,
    name_english = function()
      return T(80200201)
    end,
    des = function()
      return T(80200301)
    end,
    icon = "HomePlot:PlotMain_1000",
    type = 1,
    stages = {
      50110101,
      50110102,
      50110103,
      50110104,
      50110105,
      50110106,
      50110107,
      50110108,
      50110109
    },
    pre = 0,
    next = 50000102,
    open_condition = "70020100:1",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:20000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110109,
    map_path = "PlotDungeon:ChapterMap_01",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1000",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000102] = {
    id = 50000102,
    name = function()
      return T(80200000, 2)
    end,
    chapter_english = function()
      return T(80200002)
    end,
    name_detail = function()
      return T(80200102)
    end,
    name_english = function()
      return T(80200202)
    end,
    des = function()
      return T(80200302)
    end,
    icon = "HomePlot:PlotMain_1001",
    type = 1,
    stages = {
      50110201,
      50110202,
      50110203,
      50110204,
      50110205,
      50110206,
      50110207,
      50110208,
      50110209,
      50110210
    },
    pre = 50000101,
    next = 50000103,
    open_condition = "70020100:1|70020200:50110109",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:20000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110210,
    map_path = "PlotDungeon:ChapterMap_02",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1001",
    next_show = 2,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000103] = {
    id = 50000103,
    name = function()
      return T(80200000, 3)
    end,
    chapter_english = function()
      return T(80200003)
    end,
    name_detail = function()
      return T(80200103)
    end,
    name_english = function()
      return T(80200203)
    end,
    des = function()
      return T(80200303)
    end,
    icon = "HomePlot:PlotMain_1002",
    type = 1,
    stages = {
      50110301,
      50110302,
      50110303,
      50110304,
      50110305,
      50110306,
      50110307,
      50110308,
      50110309,
      50110310
    },
    pre = 50000102,
    next = 50000104,
    open_condition = "70020100:7|70020200:50110210",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:20000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110310,
    map_path = "PlotDungeon:ChapterMap_03",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1002",
    next_show = 3,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000104] = {
    id = 50000104,
    name = function()
      return T(80200000, 4)
    end,
    chapter_english = function()
      return T(80200004)
    end,
    name_detail = function()
      return T(80200104)
    end,
    name_english = function()
      return T(80200204)
    end,
    des = function()
      return T(80200304)
    end,
    icon = "HomePlot:PlotMain_1003",
    type = 1,
    stages = {
      50110401,
      50110402,
      50110403,
      50110404,
      50110405,
      50110406,
      50110407,
      50110408,
      50110409,
      50110410,
      50110411,
      50110412,
      50110413,
      50110414,
      50110415,
      50110416,
      50110417,
      50110418
    },
    pre = 50000103,
    next = 50000105,
    open_condition = "70020100:12|70020200:50110310",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110418,
    map_path = "PlotDungeon:ChapterMap_04",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1003",
    next_show = 4,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000105] = {
    id = 50000105,
    name = function()
      return T(80200000, 5)
    end,
    chapter_english = function()
      return T(80200005)
    end,
    name_detail = function()
      return T(80200105)
    end,
    name_english = function()
      return T(80200205)
    end,
    des = function()
      return T(80200305)
    end,
    icon = "HomePlot:PlotMain_1004",
    type = 1,
    stages = {
      50110501,
      50110502,
      50110503,
      50110504,
      50110505,
      50110506,
      50110507,
      50110508,
      50110509,
      50110510,
      50110511,
      50110512
    },
    pre = 50000104,
    next = 50000106,
    open_condition = "70020100:17|70020200:50110418",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110512,
    map_path = "PlotDungeon:ChapterMap_05",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1004",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000106] = {
    id = 50000106,
    name = function()
      return T(80200000, 6)
    end,
    chapter_english = function()
      return T(80200006)
    end,
    name_detail = function()
      return T(80200106)
    end,
    name_english = function()
      return T(80200206)
    end,
    des = function()
      return T(80200306)
    end,
    icon = "HomePlot:PlotMain_1005",
    type = 1,
    stages = {
      50110601,
      50110602,
      50110603,
      50110604,
      50110605,
      50110606,
      50110607,
      50110608,
      50110609,
      50110610,
      50110611,
      50110612,
      50110613
    },
    pre = 50000105,
    next = 50000107,
    open_condition = "70020100:22|70020200:50110512",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110613,
    map_path = "PlotDungeon:ChapterMap_06",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1005",
    next_show = 2,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000107] = {
    id = 50000107,
    name = function()
      return T(80200000, 7)
    end,
    chapter_english = function()
      return T(80200007)
    end,
    name_detail = function()
      return T(80200107)
    end,
    name_english = function()
      return T(80200207)
    end,
    des = function()
      return T(80200307)
    end,
    icon = "HomePlot:PlotMain_1006",
    type = 1,
    stages = {
      50110701,
      50110702,
      50110703,
      50110704,
      50110705,
      50110706,
      50110707,
      50110708,
      50110709,
      50110710
    },
    pre = 50000106,
    next = 50000108,
    open_condition = "70020100:27|70020200:50110613",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110710,
    map_path = "PlotDungeon:ChapterMap_07",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1006",
    next_show = 3,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000108] = {
    id = 50000108,
    name = function()
      return T(80200000, 8)
    end,
    chapter_english = function()
      return T(80200008)
    end,
    name_detail = function()
      return T(80200108)
    end,
    name_english = function()
      return T(80200208)
    end,
    des = function()
      return T(80200308)
    end,
    icon = "HomePlot:PlotMain_1007",
    type = 1,
    stages = {
      50110801,
      50110802,
      50110803,
      50110804,
      50110805,
      50110806,
      50110807,
      50110808,
      50110809,
      50110810,
      50110811,
      50110812,
      50110813
    },
    pre = 50000107,
    next = 50000109,
    open_condition = "70020100:31|70020200:50110710",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110813,
    map_path = "PlotDungeon:ChapterMap_08",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1007",
    next_show = 4,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000109] = {
    id = 50000109,
    name = function()
      return T(80200000, 9)
    end,
    chapter_english = function()
      return T(80200009)
    end,
    name_detail = function()
      return T(80200109)
    end,
    name_english = function()
      return T(80200209)
    end,
    des = function()
      return T(80200309)
    end,
    icon = "HomePlot:PlotMain_1008",
    type = 1,
    stages = {
      50110901,
      50110902,
      50110903,
      50110904,
      50110905,
      50110906,
      50110907,
      50110908,
      50110909,
      50110910,
      50110911,
      50110912,
      50110913,
      50110914,
      50110915,
      50110916,
      50110917,
      50110918,
      50110919,
      50110920,
      50110921
    },
    pre = 50000108,
    next = 50000110,
    open_condition = "70020100:35|70020200:50110813",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110921,
    map_path = "PlotDungeon:ChapterMap_09",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1008",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000110] = {
    id = 50000110,
    name = function()
      return T(80200000, 10)
    end,
    chapter_english = function()
      return T(80200010)
    end,
    name_detail = function()
      return T(80200110)
    end,
    name_english = function()
      return T(80200210)
    end,
    des = function()
      return T(80200310)
    end,
    icon = "HomePlot:PlotMain_1009",
    type = 1,
    stages = {
      50111001,
      50111002,
      50111003,
      50111004,
      50111005,
      50111006,
      50111007,
      50111008,
      50111009,
      50111010,
      50111011,
      50111012,
      50111013,
      50111014,
      50111015,
      50111016,
      50111017
    },
    pre = 50000109,
    next = 50000111,
    open_condition = "70020100:39|70020200:50110921",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111017,
    map_path = "PlotDungeon:ChapterMap_10",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1009",
    next_show = 2,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000111] = {
    id = 50000111,
    name = function()
      return T(80200000, 11)
    end,
    chapter_english = function()
      return T(80200011)
    end,
    name_detail = function()
      return T(80200111)
    end,
    name_english = function()
      return T(80200211)
    end,
    des = function()
      return T(80200311)
    end,
    icon = "HomePlot:PlotMain_1010",
    type = 1,
    stages = {
      50111101,
      50111102,
      50111103,
      50111104,
      50111105,
      50111106,
      50111107,
      50111108,
      50111109,
      50111110,
      50111111,
      50111112,
      50111113,
      50111114
    },
    pre = 50000110,
    next = 0,
    open_condition = "70020100:42|70020200:50111017",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111114,
    map_path = "PlotDungeon:ChapterMap_11",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1010",
    next_show = 3,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000201] = {
    id = 50000201,
    name = function()
      return T(80251001)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120101,
      50120102,
      50120103,
      50120104,
      50120105
    },
    pre = 0,
    next = 50000202,
    open_condition = "70020100:7",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120105,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250001)
    end
  },
  [50000202] = {
    id = 50000202,
    name = function()
      return T(80251002)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120201,
      50120202,
      50120203,
      50120204,
      50120205
    },
    pre = 50000201,
    next = 50000203,
    open_condition = "70020100:8|70020200:50120105",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120205,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250002)
    end
  },
  [50000203] = {
    id = 50000203,
    name = function()
      return T(80251003)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120301,
      50120302,
      50120303,
      50120304,
      50120305
    },
    pre = 50000202,
    next = 50000204,
    open_condition = "70020100:10|70020200:50120205",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120305,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250003)
    end
  },
  [50000204] = {
    id = 50000204,
    name = function()
      return T(80251004)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120401,
      50120402,
      50120403,
      50120404,
      50120405
    },
    pre = 50000203,
    next = 50000205,
    open_condition = "70020100:12|70020200:50120305",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120405,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250004)
    end
  },
  [50000205] = {
    id = 50000205,
    name = function()
      return T(80251005)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120501,
      50120502,
      50120503,
      50120504,
      50120505
    },
    pre = 50000204,
    next = 50000206,
    open_condition = "70020100:14|70020200:50120405",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120505,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250005)
    end
  },
  [50000206] = {
    id = 50000206,
    name = function()
      return T(80251006)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50120601,
      50120602,
      50120603,
      50120604,
      50120605
    },
    pre = 50000205,
    next = 50000207,
    open_condition = "70020100:16|70020200:50120505",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120605,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250006)
    end
  },
  [50000207] = {
    id = 50000207,
    name = function()
      return T(80251007)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50120701,
      50120702,
      50120703,
      50120704,
      50120705
    },
    pre = 50000206,
    next = 50000208,
    open_condition = "70020100:18|70020200:50120605",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120705,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250007)
    end
  },
  [50000208] = {
    id = 50000208,
    name = function()
      return T(80251008)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50120801,
      50120802,
      50120803,
      50120804,
      50120805
    },
    pre = 50000207,
    next = 50000209,
    open_condition = "70020100:20|70020200:50120705",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120805,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250008)
    end
  },
  [50000209] = {
    id = 50000209,
    name = function()
      return T(80251009)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50120901,
      50120902,
      50120903,
      50120904,
      50120905
    },
    pre = 50000208,
    next = 50000210,
    open_condition = "70020100:22|70020200:50120805",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120905,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250009)
    end
  },
  [50000210] = {
    id = 50000210,
    name = function()
      return T(80251010)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50121001,
      50121002,
      50121003,
      50121004,
      50121005
    },
    pre = 50000209,
    next = 50000211,
    open_condition = "70020100:24|70020200:50120905",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121005,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250010)
    end
  },
  [50000211] = {
    id = 50000211,
    name = function()
      return T(80251011)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121101,
      50121102,
      50121103,
      50121104,
      50121105
    },
    pre = 50000210,
    next = 50000212,
    open_condition = "70020100:26|70020200:50121005",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121105,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250011)
    end
  },
  [50000212] = {
    id = 50000212,
    name = function()
      return T(80251012)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121201,
      50121202,
      50121203,
      50121204,
      50121205
    },
    pre = 50000211,
    next = 50000213,
    open_condition = "70020100:28|70020200:50121105",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121205,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250012)
    end
  },
  [50000213] = {
    id = 50000213,
    name = function()
      return T(80251013)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121301,
      50121302,
      50121303,
      50121304,
      50121305
    },
    pre = 50000212,
    next = 50000214,
    open_condition = "70020100:30|70020200:50121205",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121305,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250013)
    end
  },
  [50000214] = {
    id = 50000214,
    name = function()
      return T(80251014)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121401,
      50121402,
      50121403,
      50121404,
      50121405
    },
    pre = 50000213,
    next = 50000215,
    open_condition = "70020100:32|70020200:50121305",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121405,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250014)
    end
  },
  [50000215] = {
    id = 50000215,
    name = function()
      return T(80251015)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121501,
      50121502,
      50121503,
      50121504,
      50121505
    },
    pre = 50000214,
    next = 50000216,
    open_condition = "70020100:34|70020200:50121405",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121505,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250015)
    end
  },
  [50000216] = {
    id = 50000216,
    name = function()
      return T(80251016)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50121601,
      50121602,
      50121603,
      50121604,
      50121605
    },
    pre = 50000215,
    next = 50000217,
    open_condition = "70020100:36|70020200:50121505",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121605,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250016)
    end
  },
  [50000217] = {
    id = 50000217,
    name = function()
      return T(80251017)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50121701,
      50121702,
      50121703,
      50121704,
      50121705
    },
    pre = 50000216,
    next = 50000218,
    open_condition = "70020100:37|70020200:50121605",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121705,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250017)
    end
  },
  [50000218] = {
    id = 50000218,
    name = function()
      return T(80251018)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50121801,
      50121802,
      50121803,
      50121804,
      50121805
    },
    pre = 50000217,
    next = 50000219,
    open_condition = "70020100:38|70020200:50121705",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121805,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250018)
    end
  },
  [50000219] = {
    id = 50000219,
    name = function()
      return T(80251019)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50121901,
      50121902,
      50121903,
      50121904,
      50121905
    },
    pre = 50000218,
    next = 50000220,
    open_condition = "70020100:39|70020200:50121805",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121905,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250019)
    end
  },
  [50000220] = {
    id = 50000220,
    name = function()
      return T(80251020)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50122001,
      50122002,
      50122003,
      50122004,
      50122005
    },
    pre = 50000219,
    next = 50000221,
    open_condition = "70020100:40|70020200:50121905",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122005,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250020)
    end
  },
  [50000221] = {
    id = 50000221,
    name = function()
      return T(80251021)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122101,
      50122102,
      50122103,
      50122104,
      50122105
    },
    pre = 50000220,
    next = 50000222,
    open_condition = "70020100:41|70020200:50122005",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122105,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250021)
    end
  },
  [50000222] = {
    id = 50000222,
    name = function()
      return T(80251022)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122201,
      50122202,
      50122203,
      50122204,
      50122205
    },
    pre = 50000221,
    next = 50000223,
    open_condition = "70020100:42|70020200:50122105",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122205,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250022)
    end
  },
  [50000223] = {
    id = 50000223,
    name = function()
      return T(80251023)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122301,
      50122302,
      50122303,
      50122304,
      50122305
    },
    pre = 50000222,
    next = 50000224,
    open_condition = "70020100:43|70020200:50122205",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122305,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250023)
    end
  },
  [50000224] = {
    id = 50000224,
    name = function()
      return T(80251024)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122401,
      50122402,
      50122403,
      50122404,
      50122405
    },
    pre = 50000223,
    next = 50000225,
    open_condition = "70020100:44|70020200:50122305",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122405,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250024)
    end
  },
  [50000225] = {
    id = 50000225,
    name = function()
      return T(80251025)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122501,
      50122502,
      50122503,
      50122504,
      50122505
    },
    pre = 50000224,
    next = 50000226,
    open_condition = "70020100:45|70020200:50122405",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122505,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250025)
    end
  },
  [50000226] = {
    id = 50000226,
    name = function()
      return T(80251026)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50122601,
      50122602,
      50122603,
      50122604,
      50122605
    },
    pre = 50000225,
    next = 50000227,
    open_condition = "70020100:46|70020200:50122505",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122605,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250026)
    end
  },
  [50000227] = {
    id = 50000227,
    name = function()
      return T(80251027)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50122701,
      50122702,
      50122703,
      50122704,
      50122705
    },
    pre = 50000226,
    next = 50000228,
    open_condition = "70020100:47|70020200:50122605",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122705,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250027)
    end
  },
  [50000228] = {
    id = 50000228,
    name = function()
      return T(80251028)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50122801,
      50122802,
      50122803,
      50122804,
      50122805
    },
    pre = 50000227,
    next = 50000229,
    open_condition = "70020100:48|70020200:50122705",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122805,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250028)
    end
  },
  [50000229] = {
    id = 50000229,
    name = function()
      return T(80251029)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50122901,
      50122902,
      50122903,
      50122904,
      50122905
    },
    pre = 50000228,
    next = 50000230,
    open_condition = "70020100:49|70020200:50122805",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122905,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250029)
    end
  },
  [50000230] = {
    id = 50000230,
    name = function()
      return T(80251030)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50123001,
      50123002,
      50123003,
      50123004,
      50123005
    },
    pre = 50000229,
    next = 50000231,
    open_condition = "70020100:50|70020200:50122905",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123005,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250030)
    end
  },
  [50000231] = {
    id = 50000231,
    name = function()
      return T(80251031)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123101,
      50123102,
      50123103,
      50123104,
      50123105
    },
    pre = 50000230,
    next = 50000232,
    open_condition = "70020100:51|70020200:50123005",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123105,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250031)
    end
  },
  [50000232] = {
    id = 50000232,
    name = function()
      return T(80251032)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123201,
      50123202,
      50123203,
      50123204,
      50123205
    },
    pre = 50000231,
    next = 50000233,
    open_condition = "70020100:52|70020200:50123105",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123205,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250032)
    end
  },
  [50000233] = {
    id = 50000233,
    name = function()
      return T(80251033)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123301,
      50123302,
      50123303,
      50123304,
      50123305
    },
    pre = 50000232,
    next = 50000234,
    open_condition = "70020100:53|70020200:50123205",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123305,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250033)
    end
  },
  [50000234] = {
    id = 50000234,
    name = function()
      return T(80251034)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123401,
      50123402,
      50123403,
      50123404,
      50123405
    },
    pre = 50000233,
    next = 50000235,
    open_condition = "70020100:54|70020200:50123305",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123405,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250034)
    end
  },
  [50000235] = {
    id = 50000235,
    name = function()
      return T(80251035)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123501,
      50123502,
      50123503,
      50123504,
      50123505
    },
    pre = 50000234,
    next = 50000236,
    open_condition = "70020100:55|70020200:50123405",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123505,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250035)
    end
  },
  [50000236] = {
    id = 50000236,
    name = function()
      return T(80251036)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50123601,
      50123602,
      50123603,
      50123604,
      50123605
    },
    pre = 50000235,
    next = 50000237,
    open_condition = "70020100:56|70020200:50123505",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123605,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250036)
    end
  },
  [50000237] = {
    id = 50000237,
    name = function()
      return T(80251037)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50123701,
      50123702,
      50123703,
      50123704,
      50123705
    },
    pre = 50000236,
    next = 50000238,
    open_condition = "70020100:57|70020200:50123605",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123705,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250037)
    end
  },
  [50000238] = {
    id = 50000238,
    name = function()
      return T(80251038)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50123801,
      50123802,
      50123803,
      50123804,
      50123805
    },
    pre = 50000237,
    next = 50000239,
    open_condition = "70020100:58|70020200:50123705",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123805,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250038)
    end
  },
  [50000239] = {
    id = 50000239,
    name = function()
      return T(80251039)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50123901,
      50123902,
      50123903,
      50123904,
      50123905
    },
    pre = 50000238,
    next = 50000240,
    open_condition = "70020100:59|70020200:50123805",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123905,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250039)
    end
  },
  [50000240] = {
    id = 50000240,
    name = function()
      return T(80251040)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50124001,
      50124002,
      50124003,
      50124004,
      50124005
    },
    pre = 50000239,
    next = 0,
    open_condition = "70020100:60|70020200:50123905",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50124005,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250040)
    end
  },
  [50000301] = {
    id = 50000301,
    name = function()
      return T(80202100)
    end,
    type = 11,
    stages = {
      50130101,
      50130102,
      50130103,
      50130104,
      50130105
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map1",
    back_ground = "UIBackGround:Daily_1003",
    back_effect = "FX_ui_dailyadventure_jinbi.prefab"
  },
  [50000401] = {
    id = 50000401,
    name = function()
      return T(80202200)
    end,
    type = 12,
    stages = {
      50130201,
      50130202,
      50130203,
      50130204
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map2",
    back_ground = "UIBackGround:Daily_1002",
    back_effect = "FX_ui_dailyadventure_jinyan.prefab"
  },
  [50000501] = {
    id = 50000501,
    name = function()
      return T(80202300)
    end,
    type = 13,
    stages = {
      50130301,
      50130302,
      50130303,
      50130304
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:9",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map3",
    back_ground = "UIBackGround:Daily_1001",
    back_effect = "FX_ui_dailyadventure_jineng.prefab"
  },
  [50000601] = {
    id = 50000601,
    name = function()
      return T(80202400)
    end,
    type = 14,
    show_type = 0,
    stages = {
      50130401,
      50130402,
      50130403,
      50130404
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map4_1",
    back_ground = "UIBackGround:Daily_1005",
    back_effect = "FX_ui_dailyadventure_fangyu2.prefab"
  },
  [50000602] = {
    id = 50000602,
    name = function()
      return T(80202400)
    end,
    type = 14,
    show_type = 1,
    stages = {
      50130411,
      50130412,
      50130413,
      50130414
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map4_2",
    back_ground = "UIBackGround:Daily_1005",
    back_effect = "FX_ui_dailyadventure_jinzhan2.prefab"
  },
  [50000604] = {
    id = 50000604,
    name = function()
      return T(80202400)
    end,
    type = 14,
    show_type = 2,
    stages = {
      50130431,
      50130432,
      50130433,
      50130434
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map4_4",
    back_ground = "UIBackGround:Daily_1005",
    back_effect = "FX_ui_dailyadventure_gongjian2.prefab"
  },
  [50000605] = {
    id = 50000605,
    name = function()
      return T(80202400)
    end,
    type = 14,
    show_type = 3,
    stages = {
      50130441,
      50130442,
      50130443,
      50130444
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map4_5",
    back_ground = "UIBackGround:Daily_1005",
    back_effect = "FX_ui_dailyadventure_fashi2.prefab"
  },
  [50000701] = {
    id = 50000701,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 0,
    stages = {
      50130501,
      50130502,
      50130503,
      50130504,
      50130505,
      50130506
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_1",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_fangyu.prefab"
  },
  [50000702] = {
    id = 50000702,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 1,
    stages = {
      50130511,
      50130512,
      50130513,
      50130514,
      50130515,
      50130516
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_2",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_jinzhan.prefab"
  },
  [50000704] = {
    id = 50000704,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 2,
    stages = {
      50130531,
      50130532,
      50130533,
      50130534,
      50130535,
      50130536
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_4",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_gongjian.prefab"
  },
  [50000705] = {
    id = 50000705,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 3,
    stages = {
      50130541,
      50130542,
      50130543,
      50130544,
      50130545,
      50130546
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_5",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_fashi.prefab"
  },
  [50000801] = {
    id = 50000801,
    type = 51,
    show_type = 0,
    stages = {50160011, 50160012},
    pre = 0,
    next = 0,
    open_condition = "70020100:1"
  },
  [50000802] = {
    id = 50000802,
    type = 52,
    show_type = 1,
    stages = {50160021, 50160022},
    pre = 0,
    next = 0,
    open_condition = "70020100:1"
  },
  [50000803] = {
    id = 50000803,
    type = 53,
    show_type = 2,
    stages = {50160031, 50160032},
    pre = 0,
    next = 0,
    open_condition = "70020100:1"
  },
  [50000804] = {
    id = 50000804,
    type = 54,
    show_type = 3,
    stages = {50160041, 50160042},
    pre = 0,
    next = 0,
    open_condition = "70020100:1"
  },
  [50000901] = {
    id = 50000901,
    name = function()
      return T(80204001)
    end,
    icon = "AbyssActivityPic:ActivityBossWater_1",
    type = 41,
    stages = {
      50140011,
      50140012,
      50140013,
      50140014,
      50140015
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonWater_1000"
  },
  [50000902] = {
    id = 50000902,
    name = function()
      return T(80204004)
    end,
    icon = "AbyssActivityPic:ActivityBossWater_2",
    type = 41,
    stages = {
      50140021,
      50140022,
      50140023,
      50140024,
      50140025
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonWater_1001"
  },
  [50000911] = {
    id = 50000911,
    name = function()
      return T(80204002)
    end,
    icon = "AbyssActivityPic:ActivityBossFire_1",
    type = 42,
    stages = {
      50140111,
      50140112,
      50140113,
      50140114,
      50140115
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonFire_1000"
  },
  [50000912] = {
    id = 50000912,
    name = function()
      return T(80204005)
    end,
    icon = "AbyssActivityPic:ActivityBossFire_2",
    type = 42,
    stages = {
      50140121,
      50140122,
      50140123,
      50140124,
      50140125
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonFire_1001"
  },
  [50000921] = {
    id = 50000921,
    name = function()
      return T(80204003)
    end,
    icon = "AbyssActivityPic:ActivityBossWood_1",
    type = 43,
    stages = {
      50140211,
      50140212,
      50140213,
      50140214,
      50140215
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonWood_1000"
  },
  [50000922] = {
    id = 50000922,
    name = function()
      return T(80204006)
    end,
    icon = "AbyssActivityPic:ActivityBossWood_2",
    type = 43,
    stages = {
      50140221,
      50140222,
      50140223,
      50140224,
      50140225
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonWood_1001"
  },
  [50001001] = {
    id = 50001001,
    name = function()
      return T(80205001)
    end,
    icon = "AbyssActivityPic:ActivityTide_1",
    type = 61,
    stages = {
      50180001,
      50180002,
      50180003
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    open_time = "2:1|2|3|4|5|6|0",
    back_ground = "UIBackGround:Tide_1000",
    reward_back_ground = "UIBackGround:Tide_2000"
  },
  [50001002] = {
    id = 50001002,
    name = function()
      return T(80205002)
    end,
    icon = "AbyssActivityPic:ActivityTide_2",
    type = 62,
    stages = {
      50180011,
      50180012,
      50180013
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    open_time = "2:3|4|5|6|0",
    back_ground = "UIBackGround:Tide_1001",
    reward_back_ground = "UIBackGround:Tide_2001"
  },
  [50001003] = {
    id = 50001003,
    name = function()
      return T(80205003)
    end,
    icon = "AbyssActivityPic:ActivityTide_3",
    type = 63,
    stages = {
      50180021,
      50180022,
      50180023
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    open_time = "2:5|6|0",
    back_ground = "UIBackGround:Tide_1002",
    reward_back_ground = "UIBackGround:Tide_2002"
  },
  [50003001] = {
    id = 50003001,
    type = 7,
    show_type = 2,
    stages = {
      50170021,
      50170022,
      50170023,
      50170024,
      50170025,
      50170026,
      50170027,
      50170028,
      50170029
    },
    pre = 0,
    next = 50003002,
    open_condition = "70020100:1"
  },
  [50003002] = {
    id = 50003002,
    type = 7,
    show_type = 1,
    stages = {
      50170011,
      50170012,
      50170013,
      50170014,
      50170015,
      50170016,
      50170017,
      50170018,
      50170019
    },
    pre = 50003001,
    next = 50003003,
    open_condition = "70020100:1"
  },
  [50003003] = {
    id = 50003003,
    type = 7,
    show_type = 2,
    stages = {
      50170031,
      50170032,
      50170033,
      50170034,
      50170035,
      50170036,
      50170037,
      50170038,
      50170039
    },
    pre = 50003002,
    next = 50003004,
    open_condition = "70020100:1"
  },
  [50003004] = {
    id = 50003004,
    type = 7,
    show_type = 1,
    stages = {
      50170041,
      50170042,
      50170043,
      50170044,
      50170045,
      50170046,
      50170047,
      50170048,
      50170049
    },
    pre = 50003003,
    next = 50003005,
    open_condition = "70020100:1"
  },
  [50003005] = {
    id = 50003005,
    type = 7,
    show_type = 3,
    stages = {
      50170051,
      50170052,
      50170053,
      50170054,
      50170055,
      50170056,
      50170057,
      50170058,
      50170059
    },
    pre = 50003004,
    next = 0,
    open_condition = "70020100:1"
  },
  [50004001] = {
    id = 50004001,
    name = function()
      return T(80204001)
    end,
    type = 8,
    stages = {
      50190001,
      50190002,
      50190003,
      50190004,
      50190005
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:SuperDungeon_1000",
    reward_back_ground = "UIBackGround:SuperDungeon_1000",
    challenge_condition = 1201
  },
  [50010101] = {
    id = 50010101,
    name = function()
      return T(80206001)
    end,
    type = 21,
    stages = {
      50501101,
      50501102,
      50501103,
      50501104,
      50501105,
      50501106,
      50501107,
      50501108,
      50501109,
      50501110,
      50501111,
      50501112,
      50501113,
      50501114,
      50501115
    },
    pre = 0,
    next = 50010102,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1:Map_1",
    back_ground = "ActivityDungeon1:MapBottom_1"
  },
  [50010102] = {
    id = 50010102,
    name = function()
      return T(80206002)
    end,
    type = 21,
    stages = {
      50501201,
      50501202,
      50501203,
      50501204,
      50501205,
      50501206,
      50501207,
      50501208,
      50501209,
      50501210,
      50501211,
      50501212,
      50501213,
      50501214,
      50501215
    },
    pre = 50010101,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1:Map_2",
    back_ground = "ActivityDungeon1:MapBottom_2"
  },
  [50010104] = {
    id = 50010104,
    name = function()
      return T(80206004)
    end,
    type = 22,
    stages = {
      50501401,
      50501402,
      50501403,
      50501404
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1:Material_1000"
  },
  [50010105] = {
    id = 50010105,
    name = function()
      return T(80206005)
    end,
    type = 23,
    stages = {
      50501501,
      50501502,
      50501503,
      50501504,
      50501505,
      50501506,
      50501507,
      50501508,
      50501509,
      50501510
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1:Boss_1000"
  },
  [50010106] = {
    id = 50010106,
    name = function()
      return T(80206006)
    end,
    type = 21,
    stages = {
      50501601,
      50501602,
      50501603,
      50501604,
      50501605,
      50501606,
      50501607,
      50501608,
      50501609,
      50501610
    },
    pre = 0,
    next = 50010107,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1001:Map_1",
    back_ground = "ActivityDungeon1001:MapBottom_1"
  },
  [50010107] = {
    id = 50010107,
    name = function()
      return T(80206007)
    end,
    type = 21,
    stages = {
      50501701,
      50501702,
      50501703,
      50501704,
      50501705,
      50501706,
      50501707,
      50501708,
      50501709,
      50501710
    },
    pre = 50010106,
    next = 50010108,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1001:Map_2",
    back_ground = "ActivityDungeon1001:MapBottom_2"
  },
  [50010108] = {
    id = 50010108,
    name = function()
      return T(80206008)
    end,
    type = 21,
    stages = {
      50501801,
      50501802,
      50501803,
      50501804,
      50501805,
      50501806,
      50501807,
      50501808,
      50501809,
      50501810
    },
    pre = 50010107,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1001:Map_2",
    back_ground = "ActivityDungeon1001:MapBottom_3"
  },
  [50010109] = {
    id = 50010109,
    name = function()
      return T(80206009)
    end,
    type = 22,
    stages = {
      50501901,
      50501902,
      50501903,
      50501904
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1001:Material_1000"
  },
  [50010110] = {
    id = 50010110,
    name = function()
      return T(80206010)
    end,
    type = 23,
    stages = {
      50502001,
      50502002,
      50502003,
      50502004,
      50502005,
      50502006,
      50502007,
      50502008,
      50502009,
      50502010
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1001:Boss_1000"
  },
  [50010111] = {
    id = 50010111,
    name = function()
      return T(80206011)
    end,
    type = 21,
    stages = {
      50502101,
      50502102,
      50502103,
      50502104,
      50502105,
      50502106,
      50502107,
      50502108,
      50502109,
      50502110
    },
    pre = 0,
    next = 50010112,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1002:Map_1",
    back_ground = "ActivityDungeon1002:MapBottom_1"
  },
  [50010112] = {
    id = 50010112,
    name = function()
      return T(80206012)
    end,
    type = 21,
    stages = {
      50502201,
      50502202,
      50502203,
      50502204,
      50502205,
      50502206,
      50502207,
      50502208,
      50502209,
      50502210
    },
    pre = 50010111,
    next = 50010113,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1002:Map_2",
    back_ground = "ActivityDungeon1002:MapBottom_2"
  },
  [50010113] = {
    id = 50010113,
    name = function()
      return T(80206013)
    end,
    type = 21,
    stages = {
      50502301,
      50502302,
      50502303,
      50502304,
      50502305,
      50502306,
      50502307,
      50502308,
      50502309,
      50502310
    },
    pre = 50010112,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1002:Map_2",
    back_ground = "ActivityDungeon1002:MapBottom_3"
  },
  [50010114] = {
    id = 50010114,
    name = function()
      return T(80206014)
    end,
    type = 22,
    stages = {
      50502401,
      50502402,
      50502403,
      50502404
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1002:Material_1000"
  },
  [50010115] = {
    id = 50010115,
    name = function()
      return T(80206015)
    end,
    type = 23,
    stages = {
      50502501,
      50502502,
      50502503,
      50502504,
      50502505,
      50502506,
      50502507,
      50502508,
      50502509,
      50502510
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1002:Boss_1000"
  },
  [50020101] = {
    id = 50020101,
    type = 32,
    stages = {
      51501011,
      51501012,
      51501013,
      51501014,
      51501015
    },
    pre = 0,
    next = 50020102,
    open_condition = "70020100:1"
  },
  [50020102] = {
    id = 50020102,
    type = 32,
    stages = {
      51501021,
      51501022,
      51501023,
      51501024,
      51501025
    },
    pre = 50020101,
    next = 50020103,
    open_condition = "70020100:1"
  },
  [50020103] = {
    id = 50020103,
    type = 32,
    stages = {
      51501031,
      51501032,
      51501033,
      51501034,
      51501035
    },
    pre = 50020102,
    next = 50020104,
    open_condition = "70020100:1"
  },
  [50020104] = {
    id = 50020104,
    type = 32,
    stages = {
      51501041,
      51501042,
      51501043,
      51501044,
      51501045
    },
    pre = 50020103,
    next = 50020105,
    open_condition = "70020100:1"
  },
  [50020105] = {
    id = 50020105,
    type = 32,
    stages = {
      51501051,
      51501052,
      51501053,
      51501054,
      51501055
    },
    pre = 50020104,
    next = 50020106,
    open_condition = "70020100:1"
  },
  [50020106] = {
    id = 50020106,
    type = 32,
    stages = {
      51501061,
      51501062,
      51501063,
      51501064,
      51501065
    },
    pre = 50020105,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020201] = {
    id = 50020201,
    type = 32,
    stages = {
      51502011,
      51502012,
      51502013,
      51502014,
      51502015
    },
    pre = 0,
    next = 50020202,
    open_condition = "70020100:1"
  },
  [50020202] = {
    id = 50020202,
    type = 32,
    stages = {
      51502021,
      51502022,
      51502023,
      51502024,
      51502025
    },
    pre = 50020201,
    next = 50020203,
    open_condition = "70020100:1"
  },
  [50020203] = {
    id = 50020203,
    type = 32,
    stages = {
      51502031,
      51502032,
      51502033,
      51502034,
      51502035
    },
    pre = 50020202,
    next = 50020204,
    open_condition = "70020100:1"
  },
  [50020204] = {
    id = 50020204,
    type = 32,
    stages = {
      51502041,
      51502042,
      51502043,
      51502044,
      51502045
    },
    pre = 50020203,
    next = 50020205,
    open_condition = "70020100:1"
  },
  [50020205] = {
    id = 50020205,
    type = 32,
    stages = {
      51502051,
      51502052,
      51502053,
      51502054,
      51502055
    },
    pre = 50020204,
    next = 50020206,
    open_condition = "70020100:1"
  },
  [50020206] = {
    id = 50020206,
    type = 32,
    stages = {
      51502061,
      51502062,
      51502063,
      51502064,
      51502065
    },
    pre = 50020205,
    next = 0,
    open_condition = "70020100:1"
  }
}
