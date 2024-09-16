BaseStage = {
  [50110101] = {
    id = 50110101,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221001)
    end,
    name_english = function()
      return T(80222001)
    end,
    des = function()
      return T(80231001)
    end,
    next = {50110102},
    chapter_id = 50000101,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10101,
    type_show = {0, 1},
    settlement_no_show = 1,
    no_battle_check = 1
  },
  [50110102] = {
    id = 50110102,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221002)
    end,
    name_english = function()
      return T(80222002)
    end,
    des = function()
      return T(80231002)
    end,
    pre = 50110101,
    next = {50110103},
    chapter_id = 50000101,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210101},
    map_id = 10402,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110103] = {
    id = 50110103,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221003)
    end,
    name_english = function()
      return T(80222003)
    end,
    des = function()
      return T(80231003)
    end,
    pre = 50110102,
    next = {50110104},
    chapter_id = 50000101,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10104,
    type_show = {0, 1},
    settlement_no_show = 1,
    no_battle_check = 1
  },
  [50110104] = {
    id = 50110104,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221004)
    end,
    name_english = function()
      return T(80222004)
    end,
    des = function()
      return T(80231004)
    end,
    pre = 50110103,
    next = {50110105},
    chapter_id = 50000101,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210102},
    map_id = 10403,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110105] = {
    id = 50110105,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221005)
    end,
    name_english = function()
      return T(80222005)
    end,
    des = function()
      return T(80231005)
    end,
    pre = 50110104,
    next = {50110106},
    chapter_id = 50000101,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210103},
    map_id = 10406,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110106] = {
    id = 50110106,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221006)
    end,
    name_english = function()
      return T(80222006)
    end,
    des = function()
      return T(80231006)
    end,
    pre = 50110105,
    next = {50110107},
    chapter_id = 50000101,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000",
      "5:70140021:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210104},
    map_id = 10411,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110107] = {
    id = 50110107,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221007)
    end,
    name_english = function()
      return T(80222007)
    end,
    des = function()
      return T(80231007)
    end,
    pre = 50110106,
    next = {50110108},
    chapter_id = 50000101,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10106,
    type_show = {0, 1},
    no_battle_check = 1
  },
  [50110108] = {
    id = 50110108,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221008)
    end,
    name_english = function()
      return T(80222008)
    end,
    des = function()
      return T(80231008)
    end,
    pre = 50110107,
    next = {50110109},
    chapter_id = 50000101,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210105},
    map_id = 10404,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110109] = {
    id = 50110109,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221009)
    end,
    name_english = function()
      return T(80222009)
    end,
    des = function()
      return T(80231009)
    end,
    pre = 50110108,
    chapter_id = 50000101,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:5",
      "1:21010001:500",
      "1:21000003:1000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10108,
    type_show = {0, 1},
    no_battle_check = 1
  },
  [50110201] = {
    id = 50110201,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221010)
    end,
    name_english = function()
      return T(80222010)
    end,
    des = function()
      return T(80231010)
    end,
    pre = 50110109,
    next = {50110202},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10201,
    type_show = {0, 1},
    no_battle_check = 1
  },
  [50110202] = {
    id = 50110202,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221011)
    end,
    name_english = function()
      return T(80222011)
    end,
    des = function()
      return T(80231011)
    end,
    pre = 50110201,
    next = {50110203},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210201},
    map_id = 10505,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110203] = {
    id = 50110203,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221012)
    end,
    name_english = function()
      return T(80222012)
    end,
    des = function()
      return T(80231012)
    end,
    pre = 50110202,
    next = {50110204},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210202},
    map_id = 10502,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110204] = {
    id = 50110204,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221013)
    end,
    name_english = function()
      return T(80222013)
    end,
    des = function()
      return T(80231013)
    end,
    pre = 50110203,
    next = {50110205},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200",
      "5:70140001:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10202,
    type_show = {0, 1},
    no_battle_check = 1
  },
  [50110205] = {
    id = 50110205,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221014)
    end,
    name_english = function()
      return T(80222014)
    end,
    des = function()
      return T(80231014)
    end,
    pre = 50110204,
    next = {50110206},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10203,
    type_show = {0, 1},
    no_battle_check = 1
  },
  [50110206] = {
    id = 50110206,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221015)
    end,
    name_english = function()
      return T(80222015)
    end,
    des = function()
      return T(80231015)
    end,
    pre = 50110205,
    next = {50110207},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10204,
    type_show = {0, 1},
    no_battle_check = 1
  },
  [50110207] = {
    id = 50110207,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221016)
    end,
    name_english = function()
      return T(80222016)
    end,
    des = function()
      return T(80231016)
    end,
    pre = 50110206,
    next = {50110208},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210203},
    map_id = 10508,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110208] = {
    id = 50110208,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221017)
    end,
    name_english = function()
      return T(80222017)
    end,
    des = function()
      return T(80231017)
    end,
    pre = 50110207,
    next = {50110209},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210204},
    map_id = 10507,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110209] = {
    id = 50110209,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221018)
    end,
    name_english = function()
      return T(80222018)
    end,
    des = function()
      return T(80231018)
    end,
    pre = 50110208,
    next = {50110210},
    chapter_id = 50000102,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210205},
    map_id = 10506,
    type_show = {1, 2},
    no_battle_check = 1
  },
  [50110210] = {
    id = 50110210,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221019)
    end,
    name_english = function()
      return T(80222019)
    end,
    des = function()
      return T(80231019)
    end,
    pre = 50110209,
    chapter_id = 50000102,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:10",
      "1:21010001:600",
      "1:21000003:1200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210206},
    map_id = 10503,
    type_show = {0, 0},
    no_battle_check = 1
  },
  [50110301] = {
    id = 50110301,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221020)
    end,
    name_english = function()
      return T(80222020)
    end,
    des = function()
      return T(80231020)
    end,
    pre = 50110210,
    next = {50110302},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10301,
    type_show = {0, 1}
  },
  [50110302] = {
    id = 50110302,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221021)
    end,
    name_english = function()
      return T(80222021)
    end,
    des = function()
      return T(80231021)
    end,
    pre = 50110301,
    next = {50110303},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210301},
    map_id = 10607,
    type_show = {0, 0}
  },
  [50110303] = {
    id = 50110303,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221022)
    end,
    name_english = function()
      return T(80222022)
    end,
    des = function()
      return T(80231022)
    end,
    pre = 50110302,
    next = {50110304},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400",
      "5:70140002:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10302,
    type_show = {0, 1}
  },
  [50110304] = {
    id = 50110304,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221023)
    end,
    name_english = function()
      return T(80222023)
    end,
    des = function()
      return T(80231023)
    end,
    pre = 50110303,
    next = {50110305},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210302},
    map_id = 10608,
    type_show = {0, 0}
  },
  [50110305] = {
    id = 50110305,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221024)
    end,
    name_english = function()
      return T(80222024)
    end,
    des = function()
      return T(80231024)
    end,
    pre = 50110304,
    next = {50110306},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210303},
    map_id = 10610,
    type_show = {0, 0}
  },
  [50110306] = {
    id = 50110306,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221025)
    end,
    name_english = function()
      return T(80222025)
    end,
    des = function()
      return T(80231025)
    end,
    pre = 50110305,
    next = {50110307},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400",
      "5:70140003:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10303,
    type_show = {0, 1}
  },
  [50110307] = {
    id = 50110307,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221026)
    end,
    name_english = function()
      return T(80222026)
    end,
    des = function()
      return T(80231026)
    end,
    pre = 50110306,
    next = {50110308},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210304},
    map_id = 10602,
    type_show = {0, 0}
  },
  [50110308] = {
    id = 50110308,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221027)
    end,
    name_english = function()
      return T(80222027)
    end,
    des = function()
      return T(80231027)
    end,
    pre = 50110307,
    next = {50110309},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210305},
    map_id = 10603,
    type_show = {0, 0}
  },
  [50110309] = {
    id = 50110309,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221028)
    end,
    name_english = function()
      return T(80222028)
    end,
    des = function()
      return T(80231028)
    end,
    pre = 50110308,
    next = {50110310},
    chapter_id = 50000103,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210306},
    map_id = 10605,
    type_show = {1, 2}
  },
  [50110310] = {
    id = 50110310,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221029)
    end,
    name_english = function()
      return T(80222029)
    end,
    des = function()
      return T(80231029)
    end,
    pre = 50110309,
    chapter_id = 50000103,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:700",
      "1:21000003:1400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10304,
    type_show = {0, 1}
  },
  [50110401] = {
    id = 50110401,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221030)
    end,
    name_english = function()
      return T(80222030)
    end,
    des = function()
      return T(80231030)
    end,
    pre = 50110310,
    next = {50110402},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10401,
    type_show = {0, 1}
  },
  [50110402] = {
    id = 50110402,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221031)
    end,
    name_english = function()
      return T(80222031)
    end,
    des = function()
      return T(80231031)
    end,
    pre = 50110401,
    next = {50110403},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210401},
    map_id = 10603,
    type_show = {0, 0}
  },
  [50110403] = {
    id = 50110403,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221032)
    end,
    name_english = function()
      return T(80222032)
    end,
    des = function()
      return T(80231032)
    end,
    pre = 50110402,
    next = {50110404},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210402},
    map_id = 10606,
    type_show = {0, 0}
  },
  [50110404] = {
    id = 50110404,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221033)
    end,
    name_english = function()
      return T(80222033)
    end,
    des = function()
      return T(80231033)
    end,
    pre = 50110403,
    next = {50110405},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10402,
    type_show = {0, 1}
  },
  [50110405] = {
    id = 50110405,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221034)
    end,
    name_english = function()
      return T(80222034)
    end,
    des = function()
      return T(80231034)
    end,
    pre = 50110404,
    next = {50110406},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210403},
    map_id = 10602,
    type_show = {0, 0}
  },
  [50110406] = {
    id = 50110406,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221035)
    end,
    name_english = function()
      return T(80222035)
    end,
    des = function()
      return T(80231035)
    end,
    pre = 50110405,
    next = {50110407},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10403,
    type_show = {0, 1}
  },
  [50110407] = {
    id = 50110407,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221036)
    end,
    name_english = function()
      return T(80222036)
    end,
    des = function()
      return T(80231036)
    end,
    pre = 50110406,
    next = {50110408},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210404},
    map_id = 10605,
    type_show = {0, 0}
  },
  [50110408] = {
    id = 50110408,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221037)
    end,
    name_english = function()
      return T(80222037)
    end,
    des = function()
      return T(80231037)
    end,
    pre = 50110407,
    next = {50110409},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210405},
    map_id = 10604,
    type_show = {0, 0}
  },
  [50110409] = {
    id = 50110409,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221038)
    end,
    name_english = function()
      return T(80222038)
    end,
    des = function()
      return T(80231038)
    end,
    pre = 50110408,
    next = {50110410},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10404,
    type_show = {1, 2}
  },
  [50110410] = {
    id = 50110410,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221039)
    end,
    name_english = function()
      return T(80222039)
    end,
    des = function()
      return T(80231039)
    end,
    pre = 50110409,
    next = {50110411},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210406},
    map_id = 10618,
    type_show = {0, 0}
  },
  [50110411] = {
    id = 50110411,
    name = function()
      return T(80220001, "11")
    end,
    name_detail = function()
      return T(80221040)
    end,
    name_english = function()
      return T(80222040)
    end,
    des = function()
      return T(80231040)
    end,
    pre = 50110410,
    next = {50110412},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210407},
    map_id = 10608,
    type_show = {0, 0}
  },
  [50110412] = {
    id = 50110412,
    name = function()
      return T(80220001, "12")
    end,
    name_detail = function()
      return T(80221041)
    end,
    name_english = function()
      return T(80222041)
    end,
    des = function()
      return T(80231041)
    end,
    pre = 50110411,
    next = {50110413},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10406,
    type_show = {0, 1}
  },
  [50110413] = {
    id = 50110413,
    name = function()
      return T(80220001, "13")
    end,
    name_detail = function()
      return T(80221042)
    end,
    name_english = function()
      return T(80222042)
    end,
    des = function()
      return T(80231042)
    end,
    pre = 50110412,
    next = {50110414},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210408},
    map_id = 10602,
    type_show = {0, 0}
  },
  [50110414] = {
    id = 50110414,
    name = function()
      return T(80220001, "14")
    end,
    name_detail = function()
      return T(80221043)
    end,
    name_english = function()
      return T(80222043)
    end,
    des = function()
      return T(80231043)
    end,
    pre = 50110413,
    next = {50110415},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210409},
    map_id = 10607,
    type_show = {0, 0}
  },
  [50110415] = {
    id = 50110415,
    name = function()
      return T(80220001, "15")
    end,
    name_detail = function()
      return T(80221044)
    end,
    name_english = function()
      return T(80222044)
    end,
    des = function()
      return T(80231044)
    end,
    pre = 50110414,
    next = {50110416},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600",
      "5:70140004:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10407,
    type_show = {0, 1}
  },
  [50110416] = {
    id = 50110416,
    name = function()
      return T(80220001, "16")
    end,
    name_detail = function()
      return T(80221045)
    end,
    name_english = function()
      return T(80222045)
    end,
    des = function()
      return T(80231045)
    end,
    pre = 50110415,
    next = {50110417},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210410},
    map_id = 10610,
    type_show = {0, 0}
  },
  [50110417] = {
    id = 50110417,
    name = function()
      return T(80220001, "17")
    end,
    name_detail = function()
      return T(80221046)
    end,
    name_english = function()
      return T(80222046)
    end,
    des = function()
      return T(80231046)
    end,
    pre = 50110416,
    next = {50110418},
    chapter_id = 50000104,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210411},
    map_id = 10604,
    type_show = {1, 2}
  },
  [50110418] = {
    id = 50110418,
    name = function()
      return T(80220001, "18")
    end,
    name_detail = function()
      return T(80221047)
    end,
    name_english = function()
      return T(80222047)
    end,
    des = function()
      return T(80231047)
    end,
    pre = 50110417,
    chapter_id = 50000104,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:800",
      "1:21000003:1600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10409,
    type_show = {0, 1}
  },
  [50110501] = {
    id = 50110501,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221048)
    end,
    name_english = function()
      return T(80222048)
    end,
    des = function()
      return T(80231048)
    end,
    pre = 50110418,
    next = {50110502},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10501,
    type_show = {0, 1}
  },
  [50110502] = {
    id = 50110502,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221049)
    end,
    name_english = function()
      return T(80222049)
    end,
    des = function()
      return T(80231049)
    end,
    pre = 50110501,
    next = {50110503},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210501},
    map_id = 10702,
    type_show = {0, 0}
  },
  [50110503] = {
    id = 50110503,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221050)
    end,
    name_english = function()
      return T(80222050)
    end,
    des = function()
      return T(80231050)
    end,
    pre = 50110502,
    next = {50110504},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210502},
    map_id = 10705,
    type_show = {0, 0}
  },
  [50110504] = {
    id = 50110504,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221051)
    end,
    name_english = function()
      return T(80222051)
    end,
    des = function()
      return T(80231051)
    end,
    pre = 50110503,
    next = {50110505},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10503,
    type_show = {0, 1}
  },
  [50110505] = {
    id = 50110505,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221052)
    end,
    name_english = function()
      return T(80222052)
    end,
    des = function()
      return T(80231052)
    end,
    pre = 50110504,
    next = {50110506},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10504,
    type_show = {0, 1}
  },
  [50110506] = {
    id = 50110506,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221053)
    end,
    name_english = function()
      return T(80222053)
    end,
    des = function()
      return T(80231053)
    end,
    pre = 50110505,
    next = {50110507},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210503},
    map_id = 10703,
    type_show = {0, 0}
  },
  [50110507] = {
    id = 50110507,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221054)
    end,
    name_english = function()
      return T(80222054)
    end,
    des = function()
      return T(80231054)
    end,
    pre = 50110506,
    next = {50110508},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210504},
    map_id = 10704,
    type_show = {0, 0}
  },
  [50110508] = {
    id = 50110508,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221055)
    end,
    name_english = function()
      return T(80222055)
    end,
    des = function()
      return T(80231055)
    end,
    pre = 50110507,
    next = {50110509},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210505},
    map_id = 10717,
    type_show = {0, 0}
  },
  [50110509] = {
    id = 50110509,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221056)
    end,
    name_english = function()
      return T(80222056)
    end,
    des = function()
      return T(80231056)
    end,
    pre = 50110508,
    next = {50110510},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10505,
    type_show = {1, 2}
  },
  [50110510] = {
    id = 50110510,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221057)
    end,
    name_english = function()
      return T(80222057)
    end,
    des = function()
      return T(80231057)
    end,
    pre = 50110509,
    next = {50110511},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210506},
    map_id = 10718,
    type_show = {0, 0}
  },
  [50110511] = {
    id = 50110511,
    name = function()
      return T(80220001, "11")
    end,
    name_detail = function()
      return T(80221058)
    end,
    name_english = function()
      return T(80222058)
    end,
    des = function()
      return T(80231058)
    end,
    pre = 50110510,
    next = {50110512},
    chapter_id = 50000105,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210507},
    map_id = 10718,
    type_show = {1, 2}
  },
  [50110512] = {
    id = 50110512,
    name = function()
      return T(80220001, "12")
    end,
    name_detail = function()
      return T(80221059)
    end,
    name_english = function()
      return T(80222059)
    end,
    des = function()
      return T(80231059)
    end,
    pre = 50110511,
    chapter_id = 50000105,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:900",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10506,
    type_show = {0, 1}
  },
  [50110601] = {
    id = 50110601,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221060)
    end,
    name_english = function()
      return T(80222060)
    end,
    des = function()
      return T(80231060)
    end,
    pre = 50110512,
    next = {50110602},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10601,
    type_show = {0, 1}
  },
  [50110602] = {
    id = 50110602,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221061)
    end,
    name_english = function()
      return T(80222061)
    end,
    des = function()
      return T(80231061)
    end,
    pre = 50110601,
    next = {50110603},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210601},
    map_id = 10818,
    type_show = {0, 0}
  },
  [50110603] = {
    id = 50110603,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221062)
    end,
    name_english = function()
      return T(80222062)
    end,
    des = function()
      return T(80231062)
    end,
    pre = 50110602,
    next = {50110604},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210602},
    map_id = 10817,
    type_show = {0, 0}
  },
  [50110604] = {
    id = 50110604,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221063)
    end,
    name_english = function()
      return T(80222063)
    end,
    des = function()
      return T(80231063)
    end,
    pre = 50110603,
    next = {50110605},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10602,
    type_show = {0, 1}
  },
  [50110605] = {
    id = 50110605,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221064)
    end,
    name_english = function()
      return T(80222064)
    end,
    des = function()
      return T(80231064)
    end,
    pre = 50110604,
    next = {50110606},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210603},
    map_id = 10802,
    type_show = {0, 0}
  },
  [50110606] = {
    id = 50110606,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221065)
    end,
    name_english = function()
      return T(80222065)
    end,
    des = function()
      return T(80231065)
    end,
    pre = 50110605,
    next = {50110607},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210604},
    map_id = 10805,
    type_show = {0, 0}
  },
  [50110607] = {
    id = 50110607,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221066)
    end,
    name_english = function()
      return T(80222066)
    end,
    des = function()
      return T(80231066)
    end,
    pre = 50110606,
    next = {50110608},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10603,
    type_show = {0, 1}
  },
  [50110608] = {
    id = 50110608,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221067)
    end,
    name_english = function()
      return T(80222067)
    end,
    des = function()
      return T(80231067)
    end,
    pre = 50110607,
    next = {50110609},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210605},
    map_id = 10817,
    type_show = {0, 0}
  },
  [50110609] = {
    id = 50110609,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221068)
    end,
    name_english = function()
      return T(80222068)
    end,
    des = function()
      return T(80231068)
    end,
    pre = 50110608,
    next = {50110610},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210606},
    map_id = 10806,
    type_show = {1, 2}
  },
  [50110610] = {
    id = 50110610,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221069)
    end,
    name_english = function()
      return T(80222069)
    end,
    des = function()
      return T(80231069)
    end,
    pre = 50110609,
    next = {50110611},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10604,
    type_show = {0, 1}
  },
  [50110611] = {
    id = 50110611,
    name = function()
      return T(80220001, "11")
    end,
    name_detail = function()
      return T(80221070)
    end,
    name_english = function()
      return T(80222070)
    end,
    des = function()
      return T(80231070)
    end,
    pre = 50110610,
    next = {50110612},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210607},
    map_id = 10807,
    type_show = {0, 0}
  },
  [50110612] = {
    id = 50110612,
    name = function()
      return T(80220001, "12")
    end,
    name_detail = function()
      return T(80221071)
    end,
    name_english = function()
      return T(80222071)
    end,
    des = function()
      return T(80231071)
    end,
    pre = 50110611,
    next = {50110613},
    chapter_id = 50000106,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210608},
    map_id = 10808,
    type_show = {1, 2}
  },
  [50110613] = {
    id = 50110613,
    name = function()
      return T(80220001, "13")
    end,
    name_detail = function()
      return T(80221072)
    end,
    name_english = function()
      return T(80222072)
    end,
    des = function()
      return T(80231072)
    end,
    pre = 50110612,
    chapter_id = 50000106,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1000",
      "1:21000003:2000",
      "5:70140005:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10605,
    type_show = {0, 1}
  },
  [50110701] = {
    id = 50110701,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221073)
    end,
    name_english = function()
      return T(80222073)
    end,
    des = function()
      return T(80231073)
    end,
    pre = 50110613,
    next = {50110702},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10701,
    type_show = {0, 1}
  },
  [50110702] = {
    id = 50110702,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221074)
    end,
    name_english = function()
      return T(80222074)
    end,
    des = function()
      return T(80231074)
    end,
    pre = 50110701,
    next = {50110703},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210701},
    map_id = 10806,
    type_show = {0, 0}
  },
  [50110703] = {
    id = 50110703,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221075)
    end,
    name_english = function()
      return T(80222075)
    end,
    des = function()
      return T(80231075)
    end,
    pre = 50110702,
    next = {50110704},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210702},
    map_id = 10809,
    type_show = {0, 0}
  },
  [50110704] = {
    id = 50110704,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221076)
    end,
    name_english = function()
      return T(80222076)
    end,
    des = function()
      return T(80231076)
    end,
    pre = 50110703,
    next = {50110705},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10702,
    type_show = {0, 1}
  },
  [50110705] = {
    id = 50110705,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221077)
    end,
    name_english = function()
      return T(80222077)
    end,
    des = function()
      return T(80231077)
    end,
    pre = 50110704,
    next = {50110706},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210703},
    map_id = 10809,
    type_show = {0, 0}
  },
  [50110706] = {
    id = 50110706,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221078)
    end,
    name_english = function()
      return T(80222078)
    end,
    des = function()
      return T(80231078)
    end,
    pre = 50110705,
    next = {50110707},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210704},
    map_id = 10804,
    type_show = {0, 0}
  },
  [50110707] = {
    id = 50110707,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221079)
    end,
    name_english = function()
      return T(80222079)
    end,
    des = function()
      return T(80231079)
    end,
    pre = 50110706,
    next = {50110708},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200",
      "5:70140007:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10703,
    type_show = {0, 1}
  },
  [50110708] = {
    id = 50110708,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221080)
    end,
    name_english = function()
      return T(80222080)
    end,
    des = function()
      return T(80231080)
    end,
    pre = 50110707,
    next = {50110709},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210705},
    map_id = 10810,
    type_show = {0, 0}
  },
  [50110709] = {
    id = 50110709,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221081)
    end,
    name_english = function()
      return T(80222081)
    end,
    des = function()
      return T(80231081)
    end,
    pre = 50110708,
    next = {50110710},
    chapter_id = 50000107,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210706},
    map_id = 10803,
    type_show = {1, 2}
  },
  [50110710] = {
    id = 50110710,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221082)
    end,
    name_english = function()
      return T(80222082)
    end,
    des = function()
      return T(80231082)
    end,
    pre = 50110709,
    chapter_id = 50000107,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1100",
      "1:21000003:2200",
      "5:70140006:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10704,
    type_show = {0, 1}
  },
  [50110801] = {
    id = 50110801,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221083)
    end,
    name_english = function()
      return T(80222083)
    end,
    des = function()
      return T(80231083)
    end,
    pre = 50110710,
    next = {50110802},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10801,
    type_show = {0, 1}
  },
  [50110802] = {
    id = 50110802,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221084)
    end,
    name_english = function()
      return T(80222084)
    end,
    des = function()
      return T(80231084)
    end,
    pre = 50110801,
    next = {50110803},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210801},
    map_id = 10805,
    type_show = {0, 0}
  },
  [50110803] = {
    id = 50110803,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221085)
    end,
    name_english = function()
      return T(80222085)
    end,
    des = function()
      return T(80231085)
    end,
    pre = 50110802,
    next = {50110804},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210802},
    map_id = 10810,
    type_show = {0, 0}
  },
  [50110804] = {
    id = 50110804,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221086)
    end,
    name_english = function()
      return T(80222086)
    end,
    des = function()
      return T(80231086)
    end,
    pre = 50110803,
    next = {50110805},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10802,
    type_show = {0, 1}
  },
  [50110805] = {
    id = 50110805,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221087)
    end,
    name_english = function()
      return T(80222087)
    end,
    des = function()
      return T(80231087)
    end,
    pre = 50110804,
    next = {50110806},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210803},
    map_id = 10807,
    type_show = {0, 0}
  },
  [50110806] = {
    id = 50110806,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221088)
    end,
    name_english = function()
      return T(80222088)
    end,
    des = function()
      return T(80231088)
    end,
    pre = 50110805,
    next = {50110807},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210804},
    map_id = 10809,
    type_show = {0, 0}
  },
  [50110807] = {
    id = 50110807,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221089)
    end,
    name_english = function()
      return T(80222089)
    end,
    des = function()
      return T(80231089)
    end,
    pre = 50110806,
    next = {50110808},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10803,
    type_show = {0, 1}
  },
  [50110808] = {
    id = 50110808,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221090)
    end,
    name_english = function()
      return T(80222090)
    end,
    des = function()
      return T(80231090)
    end,
    pre = 50110807,
    next = {50110809},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210805},
    map_id = 10811,
    type_show = {0, 0}
  },
  [50110809] = {
    id = 50110809,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221091)
    end,
    name_english = function()
      return T(80222091)
    end,
    des = function()
      return T(80231091)
    end,
    pre = 50110808,
    next = {50110810},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210806},
    map_id = 10811,
    type_show = {1, 2}
  },
  [50110810] = {
    id = 50110810,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221092)
    end,
    name_english = function()
      return T(80222092)
    end,
    des = function()
      return T(80231092)
    end,
    pre = 50110809,
    next = {50110811},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10804,
    type_show = {0, 1}
  },
  [50110811] = {
    id = 50110811,
    name = function()
      return T(80220001, "11")
    end,
    name_detail = function()
      return T(80221093)
    end,
    name_english = function()
      return T(80222093)
    end,
    des = function()
      return T(80231093)
    end,
    pre = 50110810,
    next = {50110812},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210807},
    map_id = 10812,
    type_show = {0, 0}
  },
  [50110812] = {
    id = 50110812,
    name = function()
      return T(80220001, "12")
    end,
    name_detail = function()
      return T(80221094)
    end,
    name_english = function()
      return T(80222094)
    end,
    des = function()
      return T(80231094)
    end,
    pre = 50110811,
    next = {50110813},
    chapter_id = 50000108,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210808},
    map_id = 10812,
    type_show = {1, 2}
  },
  [50110813] = {
    id = 50110813,
    name = function()
      return T(80220001, "13")
    end,
    name_detail = function()
      return T(80221095)
    end,
    name_english = function()
      return T(80222095)
    end,
    des = function()
      return T(80231095)
    end,
    pre = 50110812,
    chapter_id = 50000108,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1200",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10805,
    type_show = {0, 1}
  },
  [50110901] = {
    id = 50110901,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221096)
    end,
    name_english = function()
      return T(80222096)
    end,
    des = function()
      return T(80231096)
    end,
    pre = 50110813,
    next = {50110902},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10901,
    type_show = {0, 1}
  },
  [50110902] = {
    id = 50110902,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221097)
    end,
    name_english = function()
      return T(80222097)
    end,
    des = function()
      return T(80231097)
    end,
    pre = 50110901,
    next = {50110903},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10902,
    type_show = {0, 1}
  },
  [50110903] = {
    id = 50110903,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221098)
    end,
    name_english = function()
      return T(80222098)
    end,
    des = function()
      return T(80231098)
    end,
    pre = 50110902,
    next = {50110904},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210901},
    map_id = 10814,
    type_show = {0, 0}
  },
  [50110904] = {
    id = 50110904,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221099)
    end,
    name_english = function()
      return T(80222099)
    end,
    des = function()
      return T(80231099)
    end,
    pre = 50110903,
    next = {50110905},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210902},
    map_id = 10814,
    type_show = {0, 0}
  },
  [50110905] = {
    id = 50110905,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221100)
    end,
    name_english = function()
      return T(80222100)
    end,
    des = function()
      return T(80231100)
    end,
    pre = 50110904,
    next = {50110906},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210903},
    map_id = 10811,
    type_show = {0, 0}
  },
  [50110906] = {
    id = 50110906,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221101)
    end,
    name_english = function()
      return T(80222101)
    end,
    des = function()
      return T(80231101)
    end,
    pre = 50110905,
    next = {50110907},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10903,
    type_show = {0, 1}
  },
  [50110907] = {
    id = 50110907,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221102)
    end,
    name_english = function()
      return T(80222102)
    end,
    des = function()
      return T(80231102)
    end,
    pre = 50110906,
    next = {50110908},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10904,
    type_show = {0, 1}
  },
  [50110908] = {
    id = 50110908,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221103)
    end,
    name_english = function()
      return T(80222103)
    end,
    des = function()
      return T(80231103)
    end,
    pre = 50110907,
    next = {50110909},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210904},
    map_id = 10813,
    type_show = {0, 0}
  },
  [50110909] = {
    id = 50110909,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221104)
    end,
    name_english = function()
      return T(80222104)
    end,
    des = function()
      return T(80231104)
    end,
    pre = 50110908,
    next = {50110910},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210905},
    map_id = 10813,
    type_show = {1, 2}
  },
  [50110910] = {
    id = 50110910,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221105)
    end,
    name_english = function()
      return T(80222105)
    end,
    des = function()
      return T(80231105)
    end,
    pre = 50110909,
    next = {50110911},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210906},
    map_id = 10812,
    type_show = {0, 0}
  },
  [50110911] = {
    id = 50110911,
    name = function()
      return T(80220001, "11")
    end,
    name_detail = function()
      return T(80221106)
    end,
    name_english = function()
      return T(80222106)
    end,
    des = function()
      return T(80231106)
    end,
    pre = 50110910,
    next = {50110912},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10905,
    type_show = {0, 1}
  },
  [50110912] = {
    id = 50110912,
    name = function()
      return T(80220001, "12")
    end,
    name_detail = function()
      return T(80221107)
    end,
    name_english = function()
      return T(80222107)
    end,
    des = function()
      return T(80231107)
    end,
    pre = 50110911,
    next = {50110913},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10906,
    type_show = {0, 1}
  },
  [50110913] = {
    id = 50110913,
    name = function()
      return T(80220001, "13")
    end,
    name_detail = function()
      return T(80221108)
    end,
    name_english = function()
      return T(80222108)
    end,
    des = function()
      return T(80231108)
    end,
    pre = 50110912,
    next = {50110914},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210907},
    map_id = 10811,
    type_show = {0, 0}
  },
  [50110914] = {
    id = 50110914,
    name = function()
      return T(80220001, "14")
    end,
    name_detail = function()
      return T(80221109)
    end,
    name_english = function()
      return T(80222109)
    end,
    des = function()
      return T(80231109)
    end,
    pre = 50110913,
    next = {50110915},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210908},
    map_id = 10811,
    type_show = {0, 0}
  },
  [50110915] = {
    id = 50110915,
    name = function()
      return T(80220001, "15")
    end,
    name_detail = function()
      return T(80221110)
    end,
    name_english = function()
      return T(80222110)
    end,
    des = function()
      return T(80231110)
    end,
    pre = 50110914,
    next = {50110916},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210909},
    map_id = 10814,
    type_show = {0, 0}
  },
  [50110916] = {
    id = 50110916,
    name = function()
      return T(80220001, "16")
    end,
    name_detail = function()
      return T(80221111)
    end,
    name_english = function()
      return T(80222111)
    end,
    des = function()
      return T(80231111)
    end,
    pre = 50110915,
    next = {50110917},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10907,
    type_show = {0, 1}
  },
  [50110917] = {
    id = 50110917,
    name = function()
      return T(80220001, "17")
    end,
    name_detail = function()
      return T(80221112)
    end,
    name_english = function()
      return T(80222112)
    end,
    des = function()
      return T(80231112)
    end,
    pre = 50110916,
    next = {50110918},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10908,
    type_show = {0, 1}
  },
  [50110918] = {
    id = 50110918,
    name = function()
      return T(80220001, "18")
    end,
    name_detail = function()
      return T(80221113)
    end,
    name_english = function()
      return T(80222113)
    end,
    des = function()
      return T(80231113)
    end,
    pre = 50110917,
    next = {50110919},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210910},
    map_id = 10812,
    type_show = {0, 0}
  },
  [50110919] = {
    id = 50110919,
    name = function()
      return T(80220001, "19")
    end,
    name_detail = function()
      return T(80221114)
    end,
    name_english = function()
      return T(80222114)
    end,
    des = function()
      return T(80231114)
    end,
    pre = 50110918,
    next = {50110920},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210911},
    map_id = 10812,
    type_show = {1, 2}
  },
  [50110920] = {
    id = 50110920,
    name = function()
      return T(80220001, "20")
    end,
    name_detail = function()
      return T(80221115)
    end,
    name_english = function()
      return T(80222115)
    end,
    des = function()
      return T(80231115)
    end,
    pre = 50110919,
    next = {50110921},
    chapter_id = 50000109,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50210912},
    map_id = 10813,
    type_show = {0, 0}
  },
  [50110921] = {
    id = 50110921,
    name = function()
      return T(80220001, "21")
    end,
    name_detail = function()
      return T(80221116)
    end,
    name_english = function()
      return T(80222116)
    end,
    des = function()
      return T(80231116)
    end,
    pre = 50110920,
    chapter_id = 50000109,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1300",
      "1:21000003:2600",
      "5:70140008:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 10909,
    type_show = {0, 1}
  },
  [50111001] = {
    id = 50111001,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221117)
    end,
    name_english = function()
      return T(80222117)
    end,
    des = function()
      return T(80231117)
    end,
    pre = 50110921,
    next = {50111002},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800",
      "5:70140009:1",
      "5:70140014:1",
      "5:70140015:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11001,
    type_show = {0, 1}
  },
  [50111002] = {
    id = 50111002,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221118)
    end,
    name_english = function()
      return T(80222118)
    end,
    des = function()
      return T(80231118)
    end,
    pre = 50111001,
    next = {50111003},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211001},
    map_id = 10803,
    type_show = {0, 0}
  },
  [50111003] = {
    id = 50111003,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221119)
    end,
    name_english = function()
      return T(80222119)
    end,
    des = function()
      return T(80231119)
    end,
    pre = 50111002,
    next = {50111004},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211002},
    map_id = 10805,
    type_show = {0, 0}
  },
  [50111004] = {
    id = 50111004,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221120)
    end,
    name_english = function()
      return T(80222120)
    end,
    des = function()
      return T(80231120)
    end,
    pre = 50111003,
    next = {50111005},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800",
      "5:70140011:1",
      "5:70140016:1",
      "5:70140017:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11002,
    type_show = {0, 1}
  },
  [50111005] = {
    id = 50111005,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221121)
    end,
    name_english = function()
      return T(80222121)
    end,
    des = function()
      return T(80231121)
    end,
    pre = 50111004,
    next = {50111006},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211003},
    map_id = 10809,
    type_show = {0, 0}
  },
  [50111006] = {
    id = 50111006,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221122)
    end,
    name_english = function()
      return T(80222122)
    end,
    des = function()
      return T(80231122)
    end,
    pre = 50111005,
    next = {50111007},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211004},
    map_id = 10818,
    type_show = {0, 0}
  },
  [50111007] = {
    id = 50111007,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221123)
    end,
    name_english = function()
      return T(80222123)
    end,
    des = function()
      return T(80231123)
    end,
    pre = 50111006,
    next = {50111008},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800",
      "5:70140010:1",
      "5:70140018:1",
      "5:70140019:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11003,
    type_show = {0, 1}
  },
  [50111008] = {
    id = 50111008,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221124)
    end,
    name_english = function()
      return T(80222124)
    end,
    des = function()
      return T(80231124)
    end,
    pre = 50111007,
    next = {50111009},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211005},
    map_id = 10807,
    type_show = {0, 0}
  },
  [50111009] = {
    id = 50111009,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221125)
    end,
    name_english = function()
      return T(80222125)
    end,
    des = function()
      return T(80231125)
    end,
    pre = 50111008,
    next = {50111010},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211006},
    map_id = 10802,
    type_show = {1, 2}
  },
  [50111010] = {
    id = 50111010,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221126)
    end,
    name_english = function()
      return T(80222126)
    end,
    des = function()
      return T(80231126)
    end,
    pre = 50111009,
    next = {50111011},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800",
      "5:70140012:1",
      "5:70140020:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11004,
    type_show = {0, 1}
  },
  [50111011] = {
    id = 50111011,
    name = function()
      return T(80220001, "11")
    end,
    name_detail = function()
      return T(80221127)
    end,
    name_english = function()
      return T(80222127)
    end,
    des = function()
      return T(80231127)
    end,
    pre = 50111010,
    next = {50111012},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211007},
    map_id = 10810,
    type_show = {0, 0}
  },
  [50111012] = {
    id = 50111012,
    name = function()
      return T(80220001, "12")
    end,
    name_detail = function()
      return T(80221128)
    end,
    name_english = function()
      return T(80222128)
    end,
    des = function()
      return T(80231128)
    end,
    pre = 50111011,
    next = {50111013},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211008},
    map_id = 10814,
    type_show = {0, 0}
  },
  [50111013] = {
    id = 50111013,
    name = function()
      return T(80220001, "13")
    end,
    name_detail = function()
      return T(80221129)
    end,
    name_english = function()
      return T(80222129)
    end,
    des = function()
      return T(80231129)
    end,
    pre = 50111012,
    next = {50111014},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800",
      "5:70140013:1"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11005,
    type_show = {0, 1}
  },
  [50111014] = {
    id = 50111014,
    name = function()
      return T(80220001, "14")
    end,
    name_detail = function()
      return T(80221130)
    end,
    name_english = function()
      return T(80222130)
    end,
    des = function()
      return T(80231130)
    end,
    pre = 50111013,
    next = {50111015},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211009},
    map_id = 10813,
    type_show = {0, 0}
  },
  [50111015] = {
    id = 50111015,
    name = function()
      return T(80220001, "15")
    end,
    name_detail = function()
      return T(80221131)
    end,
    name_english = function()
      return T(80222131)
    end,
    des = function()
      return T(80231131)
    end,
    pre = 50111014,
    next = {50111016},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211010},
    map_id = 10809,
    type_show = {0, 0}
  },
  [50111016] = {
    id = 50111016,
    name = function()
      return T(80220001, "16")
    end,
    name_detail = function()
      return T(80221132)
    end,
    name_english = function()
      return T(80222132)
    end,
    des = function()
      return T(80231132)
    end,
    pre = 50111015,
    next = {50111017},
    chapter_id = 50000110,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211011},
    map_id = 10806,
    type_show = {0, 0}
  },
  [50111017] = {
    id = 50111017,
    name = function()
      return T(80220001, "17")
    end,
    name_detail = function()
      return T(80221133)
    end,
    name_english = function()
      return T(80222133)
    end,
    des = function()
      return T(80231133)
    end,
    pre = 50111016,
    chapter_id = 50000110,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11006,
    type_show = {0, 1}
  },
  [50111101] = {
    id = 50111101,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80221134)
    end,
    name_english = function()
      return T(80222134)
    end,
    des = function()
      return T(80231134)
    end,
    pre = 50111017,
    next = {50111102},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11101
  },
  [50111102] = {
    id = 50111102,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80221135)
    end,
    name_english = function()
      return T(80222135)
    end,
    des = function()
      return T(80231135)
    end,
    pre = 50111101,
    next = {50111103},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11102
  },
  [50111103] = {
    id = 50111103,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80221136)
    end,
    name_english = function()
      return T(80222136)
    end,
    des = function()
      return T(80231136)
    end,
    pre = 50111102,
    next = {50111104},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211101},
    map_id = 10822
  },
  [50111104] = {
    id = 50111104,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80221137)
    end,
    name_english = function()
      return T(80222137)
    end,
    des = function()
      return T(80231137)
    end,
    pre = 50111103,
    next = {50111105},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211102},
    map_id = 10822
  },
  [50111105] = {
    id = 50111105,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80221138)
    end,
    name_english = function()
      return T(80222138)
    end,
    des = function()
      return T(80231138)
    end,
    pre = 50111104,
    next = {50111106},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11103
  },
  [50111106] = {
    id = 50111106,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80221139)
    end,
    name_english = function()
      return T(80222139)
    end,
    des = function()
      return T(80231139)
    end,
    pre = 50111105,
    next = {50111107},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11104
  },
  [50111107] = {
    id = 50111107,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80221140)
    end,
    name_english = function()
      return T(80222140)
    end,
    des = function()
      return T(80231140)
    end,
    pre = 50111106,
    next = {50111108},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211103},
    map_id = 10824
  },
  [50111108] = {
    id = 50111108,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80221141)
    end,
    name_english = function()
      return T(80222141)
    end,
    des = function()
      return T(80231141)
    end,
    pre = 50111107,
    next = {50111109},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211104},
    map_id = 10824
  },
  [50111109] = {
    id = 50111109,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80221142)
    end,
    name_english = function()
      return T(80222142)
    end,
    des = function()
      return T(80231142)
    end,
    pre = 50111108,
    next = {50111110},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11105
  },
  [50111110] = {
    id = 50111110,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80221143)
    end,
    name_english = function()
      return T(80222143)
    end,
    des = function()
      return T(80231143)
    end,
    pre = 50111109,
    next = {50111111},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11106
  },
  [50111111] = {
    id = 50111111,
    name = function()
      return T(80220001, "11")
    end,
    name_detail = function()
      return T(80221144)
    end,
    name_english = function()
      return T(80222144)
    end,
    des = function()
      return T(80231144)
    end,
    pre = 50111110,
    next = {50111112},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211105},
    map_id = 10823
  },
  [50111112] = {
    id = 50111112,
    name = function()
      return T(80220001, "12")
    end,
    name_detail = function()
      return T(80221145)
    end,
    name_english = function()
      return T(80222145)
    end,
    des = function()
      return T(80231145)
    end,
    pre = 50111111,
    next = {50111113},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50211106},
    map_id = 10823
  },
  [50111113] = {
    id = 50111113,
    name = function()
      return T(80220001, "13")
    end,
    name_detail = function()
      return T(80221146)
    end,
    name_english = function()
      return T(80222146)
    end,
    des = function()
      return T(80231146)
    end,
    pre = 50111112,
    next = {50111114},
    chapter_id = 50000111,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11107
  },
  [50111114] = {
    id = 50111114,
    name = function()
      return T(80220001, "14")
    end,
    name_detail = function()
      return T(80221147)
    end,
    name_english = function()
      return T(80222147)
    end,
    des = function()
      return T(80231147)
    end,
    pre = 50111113,
    chapter_id = 50000111,
    chapter_type = 1,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000001:200",
      "1:21000005:15",
      "1:21010001:1400",
      "1:21000003:2800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    story_id = 11108
  },
  [50120101] = {
    id = 50120101,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254001)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    next = {50120102},
    chapter_id = 50000201,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220101},
    map_id = 10502,
    buff_list = {46101101},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120102] = {
    id = 50120102,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254001)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120101,
    next = {50120103},
    chapter_id = 50000201,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220102},
    map_id = 10502,
    buff_list = {46101101},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120103] = {
    id = 50120103,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254001)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120102,
    next = {50120104},
    chapter_id = 50000201,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220103},
    map_id = 10502,
    buff_list = {46101101},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120104] = {
    id = 50120104,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254001)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120103,
    next = {50120105},
    chapter_id = 50000201,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220104},
    map_id = 10502,
    buff_list = {46101101},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120105] = {
    id = 50120105,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254001)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120104,
    chapter_id = 50000201,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220105},
    map_id = 10502,
    buff_list = {46101101},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120201] = {
    id = 50120201,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254002)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120105,
    next = {50120202},
    chapter_id = 50000202,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220201},
    map_id = 10505,
    buff_list = {46101201},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120202] = {
    id = 50120202,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254002)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120201,
    next = {50120203},
    chapter_id = 50000202,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220202},
    map_id = 10505,
    buff_list = {46101201},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120203] = {
    id = 50120203,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254002)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120202,
    next = {50120204},
    chapter_id = 50000202,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220203},
    map_id = 10505,
    buff_list = {46101201},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120204] = {
    id = 50120204,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254002)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120203,
    next = {50120205},
    chapter_id = 50000202,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220204},
    map_id = 10505,
    buff_list = {46101201},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120205] = {
    id = 50120205,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254002)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120204,
    chapter_id = 50000202,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220205},
    map_id = 10505,
    buff_list = {46101201},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120301] = {
    id = 50120301,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254003)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120205,
    next = {50120302},
    chapter_id = 50000203,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220301},
    map_id = 10504,
    buff_list = {46101301},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120302] = {
    id = 50120302,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254003)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120301,
    next = {50120303},
    chapter_id = 50000203,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220302},
    map_id = 10504,
    buff_list = {46101301},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120303] = {
    id = 50120303,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254003)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120302,
    next = {50120304},
    chapter_id = 50000203,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220303},
    map_id = 10504,
    buff_list = {46101301},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120304] = {
    id = 50120304,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254003)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120303,
    next = {50120305},
    chapter_id = 50000203,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220304},
    map_id = 10504,
    buff_list = {46101301},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120305] = {
    id = 50120305,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254003)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120304,
    chapter_id = 50000203,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220305},
    map_id = 10504,
    buff_list = {46101301},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120401] = {
    id = 50120401,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254004)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120305,
    next = {50120402},
    chapter_id = 50000204,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220401},
    map_id = 10507,
    buff_list = {46101401},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120402] = {
    id = 50120402,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254004)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120401,
    next = {50120403},
    chapter_id = 50000204,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220402},
    map_id = 10507,
    buff_list = {46101401},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120403] = {
    id = 50120403,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254004)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120402,
    next = {50120404},
    chapter_id = 50000204,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220403},
    map_id = 10507,
    buff_list = {46101401},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120404] = {
    id = 50120404,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254004)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120403,
    next = {50120405},
    chapter_id = 50000204,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220404},
    map_id = 10507,
    buff_list = {46101401},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120405] = {
    id = 50120405,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254004)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120404,
    chapter_id = 50000204,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220405},
    map_id = 10507,
    buff_list = {46101401},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120501] = {
    id = 50120501,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254005)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120405,
    next = {50120502},
    chapter_id = 50000205,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220501},
    map_id = 10609,
    buff_list = {46101501},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120502] = {
    id = 50120502,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254005)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120501,
    next = {50120503},
    chapter_id = 50000205,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220502},
    map_id = 10609,
    buff_list = {46101501},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120503] = {
    id = 50120503,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254005)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120502,
    next = {50120504},
    chapter_id = 50000205,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220503},
    map_id = 10609,
    buff_list = {46101501},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120504] = {
    id = 50120504,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254005)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120503,
    next = {50120505},
    chapter_id = 50000205,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220504},
    map_id = 10609,
    buff_list = {46101501},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120505] = {
    id = 50120505,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254005)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_001",
    pre = 50120504,
    chapter_id = 50000205,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1000",
      "1:21000003:1500"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220505},
    map_id = 10609,
    buff_list = {46101501},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251001)
    end
  },
  [50120601] = {
    id = 50120601,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254006)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120505,
    next = {50120602},
    chapter_id = 50000206,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220601},
    map_id = 10611,
    buff_list = {46102101},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120602] = {
    id = 50120602,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254006)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120601,
    next = {50120603},
    chapter_id = 50000206,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220602},
    map_id = 10611,
    buff_list = {46102101},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120603] = {
    id = 50120603,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254006)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120602,
    next = {50120604},
    chapter_id = 50000206,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220603},
    map_id = 10611,
    buff_list = {46102101},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120604] = {
    id = 50120604,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254006)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120603,
    next = {50120605},
    chapter_id = 50000206,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220604},
    map_id = 10611,
    buff_list = {46102101},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120605] = {
    id = 50120605,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254006)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120604,
    chapter_id = 50000206,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220605},
    map_id = 10611,
    buff_list = {46102101},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120701] = {
    id = 50120701,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254007)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120605,
    next = {50120702},
    chapter_id = 50000207,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220701},
    map_id = 10614,
    buff_list = {46102201},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120702] = {
    id = 50120702,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254007)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120701,
    next = {50120703},
    chapter_id = 50000207,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220702},
    map_id = 10614,
    buff_list = {46102201},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120703] = {
    id = 50120703,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254007)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120702,
    next = {50120704},
    chapter_id = 50000207,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220703},
    map_id = 10614,
    buff_list = {46102201},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120704] = {
    id = 50120704,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254007)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120703,
    next = {50120705},
    chapter_id = 50000207,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220704},
    map_id = 10614,
    buff_list = {46102201},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120705] = {
    id = 50120705,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254007)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120704,
    chapter_id = 50000207,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220705},
    map_id = 10614,
    buff_list = {46102201},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120801] = {
    id = 50120801,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254008)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120705,
    next = {50120802},
    chapter_id = 50000208,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220801},
    map_id = 10610,
    buff_list = {46102301},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120802] = {
    id = 50120802,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254008)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120801,
    next = {50120803},
    chapter_id = 50000208,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220802},
    map_id = 10610,
    buff_list = {46102301},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120803] = {
    id = 50120803,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254008)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120802,
    next = {50120804},
    chapter_id = 50000208,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220803},
    map_id = 10610,
    buff_list = {46102301},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120804] = {
    id = 50120804,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254008)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120803,
    next = {50120805},
    chapter_id = 50000208,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220804},
    map_id = 10610,
    buff_list = {46102301},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120805] = {
    id = 50120805,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254008)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120804,
    chapter_id = 50000208,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220805},
    map_id = 10610,
    buff_list = {46102301},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120901] = {
    id = 50120901,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254009)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120805,
    next = {50120902},
    chapter_id = 50000209,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220901},
    map_id = 10608,
    buff_list = {46102401},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120902] = {
    id = 50120902,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254009)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120901,
    next = {50120903},
    chapter_id = 50000209,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220902},
    map_id = 10608,
    buff_list = {46102401},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120903] = {
    id = 50120903,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254009)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120902,
    next = {50120904},
    chapter_id = 50000209,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220903},
    map_id = 10608,
    buff_list = {46102401},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120904] = {
    id = 50120904,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254009)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120903,
    next = {50120905},
    chapter_id = 50000209,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220904},
    map_id = 10608,
    buff_list = {46102401},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50120905] = {
    id = 50120905,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254009)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120904,
    chapter_id = 50000209,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50220905},
    map_id = 10608,
    buff_list = {46102401},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50121001] = {
    id = 50121001,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254010)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50120905,
    next = {50121002},
    chapter_id = 50000210,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221001},
    map_id = 10603,
    buff_list = {46102501},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50121002] = {
    id = 50121002,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254010)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50121001,
    next = {50121003},
    chapter_id = 50000210,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221002},
    map_id = 10603,
    buff_list = {46102501},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50121003] = {
    id = 50121003,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254010)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50121002,
    next = {50121004},
    chapter_id = 50000210,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221003},
    map_id = 10603,
    buff_list = {46102501},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50121004] = {
    id = 50121004,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254010)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50121003,
    next = {50121005},
    chapter_id = 50000210,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221004},
    map_id = 10603,
    buff_list = {46102501},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50121005] = {
    id = 50121005,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254010)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_002",
    pre = 50121004,
    chapter_id = 50000210,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1200",
      "1:21000003:1800"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221005},
    map_id = 10603,
    buff_list = {46102501},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251002)
    end
  },
  [50121101] = {
    id = 50121101,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254011)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121005,
    next = {50121102},
    chapter_id = 50000211,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221101},
    map_id = 10704,
    buff_list = {46103101},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121102] = {
    id = 50121102,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254011)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121101,
    next = {50121103},
    chapter_id = 50000211,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221102},
    map_id = 10704,
    buff_list = {46103101},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121103] = {
    id = 50121103,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254011)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121102,
    next = {50121104},
    chapter_id = 50000211,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221103},
    map_id = 10704,
    buff_list = {46103101},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121104] = {
    id = 50121104,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254011)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121103,
    next = {50121105},
    chapter_id = 50000211,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221104},
    map_id = 10704,
    buff_list = {46103101},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121105] = {
    id = 50121105,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254011)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121104,
    chapter_id = 50000211,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221105},
    map_id = 10704,
    buff_list = {46103101},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121201] = {
    id = 50121201,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254012)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121105,
    next = {50121202},
    chapter_id = 50000212,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221201},
    map_id = 10706,
    buff_list = {46103201},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121202] = {
    id = 50121202,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254012)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121201,
    next = {50121203},
    chapter_id = 50000212,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221202},
    map_id = 10706,
    buff_list = {46103201},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121203] = {
    id = 50121203,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254012)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121202,
    next = {50121204},
    chapter_id = 50000212,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221203},
    map_id = 10706,
    buff_list = {46103201},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121204] = {
    id = 50121204,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254012)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121203,
    next = {50121205},
    chapter_id = 50000212,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221204},
    map_id = 10706,
    buff_list = {46103201},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121205] = {
    id = 50121205,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254012)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121204,
    chapter_id = 50000212,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221205},
    map_id = 10706,
    buff_list = {46103201},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121301] = {
    id = 50121301,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254013)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121205,
    next = {50121302},
    chapter_id = 50000213,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221301},
    map_id = 10709,
    buff_list = {46103301},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121302] = {
    id = 50121302,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254013)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121301,
    next = {50121303},
    chapter_id = 50000213,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221302},
    map_id = 10709,
    buff_list = {46103301},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121303] = {
    id = 50121303,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254013)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121302,
    next = {50121304},
    chapter_id = 50000213,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221303},
    map_id = 10709,
    buff_list = {46103301},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121304] = {
    id = 50121304,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254013)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121303,
    next = {50121305},
    chapter_id = 50000213,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221304},
    map_id = 10709,
    buff_list = {46103301},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121305] = {
    id = 50121305,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254013)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121304,
    chapter_id = 50000213,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221305},
    map_id = 10709,
    buff_list = {46103301},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121401] = {
    id = 50121401,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254014)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121305,
    next = {50121402},
    chapter_id = 50000214,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221401},
    map_id = 10712,
    buff_list = {46103401},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121402] = {
    id = 50121402,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254014)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121401,
    next = {50121403},
    chapter_id = 50000214,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221402},
    map_id = 10712,
    buff_list = {46103401},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121403] = {
    id = 50121403,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254014)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121402,
    next = {50121404},
    chapter_id = 50000214,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221403},
    map_id = 10712,
    buff_list = {46103401},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121404] = {
    id = 50121404,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254014)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121403,
    next = {50121405},
    chapter_id = 50000214,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221404},
    map_id = 10712,
    buff_list = {46103401},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121405] = {
    id = 50121405,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254014)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121404,
    chapter_id = 50000214,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221405},
    map_id = 10712,
    buff_list = {46103401},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121501] = {
    id = 50121501,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254015)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121405,
    next = {50121502},
    chapter_id = 50000215,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221501},
    map_id = 10702,
    buff_list = {46103501},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121502] = {
    id = 50121502,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254015)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121501,
    next = {50121503},
    chapter_id = 50000215,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221502},
    map_id = 10702,
    buff_list = {46103501},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121503] = {
    id = 50121503,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254015)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121502,
    next = {50121504},
    chapter_id = 50000215,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221503},
    map_id = 10702,
    buff_list = {46103501},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121504] = {
    id = 50121504,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254015)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121503,
    next = {50121505},
    chapter_id = 50000215,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221504},
    map_id = 10702,
    buff_list = {46103501},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121505] = {
    id = 50121505,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254015)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_003",
    pre = 50121504,
    chapter_id = 50000215,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1400",
      "1:21000003:2100"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221505},
    map_id = 10702,
    buff_list = {46103501},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251003)
    end
  },
  [50121601] = {
    id = 50121601,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254016)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121505,
    next = {50121602},
    chapter_id = 50000216,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221601},
    map_id = 10803,
    buff_list = {46104101},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121602] = {
    id = 50121602,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254016)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121601,
    next = {50121603},
    chapter_id = 50000216,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221602},
    map_id = 10803,
    buff_list = {46104101},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121603] = {
    id = 50121603,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254016)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121602,
    next = {50121604},
    chapter_id = 50000216,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221603},
    map_id = 10803,
    buff_list = {46104101},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121604] = {
    id = 50121604,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254016)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121603,
    next = {50121605},
    chapter_id = 50000216,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221604},
    map_id = 10803,
    buff_list = {46104101},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121605] = {
    id = 50121605,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254016)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121604,
    chapter_id = 50000216,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221605},
    map_id = 10803,
    buff_list = {46104101},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121701] = {
    id = 50121701,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254017)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121605,
    next = {50121702},
    chapter_id = 50000217,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221701},
    map_id = 10807,
    buff_list = {46104201},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121702] = {
    id = 50121702,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254017)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121701,
    next = {50121703},
    chapter_id = 50000217,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221702},
    map_id = 10807,
    buff_list = {46104201},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121703] = {
    id = 50121703,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254017)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121702,
    next = {50121704},
    chapter_id = 50000217,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221703},
    map_id = 10807,
    buff_list = {46104201},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121704] = {
    id = 50121704,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254017)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121703,
    next = {50121705},
    chapter_id = 50000217,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221704},
    map_id = 10807,
    buff_list = {46104201},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121705] = {
    id = 50121705,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254017)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121704,
    chapter_id = 50000217,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221705},
    map_id = 10807,
    buff_list = {46104201},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121801] = {
    id = 50121801,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254018)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121705,
    next = {50121802},
    chapter_id = 50000218,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221801},
    map_id = 10805,
    buff_list = {46104301},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121802] = {
    id = 50121802,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254018)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121801,
    next = {50121803},
    chapter_id = 50000218,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221802},
    map_id = 10805,
    buff_list = {46104301},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121803] = {
    id = 50121803,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254018)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121802,
    next = {50121804},
    chapter_id = 50000218,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221803},
    map_id = 10805,
    buff_list = {46104301},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121804] = {
    id = 50121804,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254018)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121803,
    next = {50121805},
    chapter_id = 50000218,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221804},
    map_id = 10805,
    buff_list = {46104301},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121805] = {
    id = 50121805,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254018)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121804,
    chapter_id = 50000218,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221805},
    map_id = 10805,
    buff_list = {46104301},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121901] = {
    id = 50121901,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254019)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121805,
    next = {50121902},
    chapter_id = 50000219,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221901},
    map_id = 10810,
    buff_list = {46104401},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121902] = {
    id = 50121902,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254019)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121901,
    next = {50121903},
    chapter_id = 50000219,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221902},
    map_id = 10810,
    buff_list = {46104401},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121903] = {
    id = 50121903,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254019)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121902,
    next = {50121904},
    chapter_id = 50000219,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221903},
    map_id = 10810,
    buff_list = {46104401},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121904] = {
    id = 50121904,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254019)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121903,
    next = {50121905},
    chapter_id = 50000219,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221904},
    map_id = 10810,
    buff_list = {46104401},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50121905] = {
    id = 50121905,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254019)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121904,
    chapter_id = 50000219,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50221905},
    map_id = 10810,
    buff_list = {46104401},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50122001] = {
    id = 50122001,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254020)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50121905,
    next = {50122002},
    chapter_id = 50000220,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222001},
    map_id = 10811,
    buff_list = {46104501},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50122002] = {
    id = 50122002,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254020)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50122001,
    next = {50122003},
    chapter_id = 50000220,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222002},
    map_id = 10811,
    buff_list = {46104501},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50122003] = {
    id = 50122003,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254020)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50122002,
    next = {50122004},
    chapter_id = 50000220,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222003},
    map_id = 10811,
    buff_list = {46104501},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50122004] = {
    id = 50122004,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254020)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50122003,
    next = {50122005},
    chapter_id = 50000220,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222004},
    map_id = 10811,
    buff_list = {46104501},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50122005] = {
    id = 50122005,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254020)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_004",
    pre = 50122004,
    chapter_id = 50000220,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1600",
      "1:21000003:2400"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222005},
    map_id = 10811,
    buff_list = {46104501},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251004)
    end
  },
  [50122101] = {
    id = 50122101,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254021)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    next = {50122102},
    chapter_id = 50000221,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222101},
    map_id = 10809,
    buff_list = {46105101},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122102] = {
    id = 50122102,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254021)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122101,
    next = {50122103},
    chapter_id = 50000221,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222102},
    map_id = 10809,
    buff_list = {46105101},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122103] = {
    id = 50122103,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254021)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122102,
    next = {50122104},
    chapter_id = 50000221,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222103},
    map_id = 10809,
    buff_list = {46105101},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122104] = {
    id = 50122104,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254021)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122103,
    next = {50122105},
    chapter_id = 50000221,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222104},
    map_id = 10809,
    buff_list = {46105101},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122105] = {
    id = 50122105,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254021)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122104,
    chapter_id = 50000221,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222105},
    map_id = 10809,
    buff_list = {46105101},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122201] = {
    id = 50122201,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254022)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122105,
    next = {50122202},
    chapter_id = 50000222,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222201},
    map_id = 10806,
    buff_list = {46105201},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122202] = {
    id = 50122202,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254022)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122201,
    next = {50122203},
    chapter_id = 50000222,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222202},
    map_id = 10806,
    buff_list = {46105201},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122203] = {
    id = 50122203,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254022)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122202,
    next = {50122204},
    chapter_id = 50000222,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222203},
    map_id = 10806,
    buff_list = {46105201},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122204] = {
    id = 50122204,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254022)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122203,
    next = {50122205},
    chapter_id = 50000222,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222204},
    map_id = 10806,
    buff_list = {46105201},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122205] = {
    id = 50122205,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254022)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122204,
    chapter_id = 50000222,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222205},
    map_id = 10806,
    buff_list = {46105201},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122301] = {
    id = 50122301,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254023)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122205,
    next = {50122302},
    chapter_id = 50000223,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222301},
    map_id = 10817,
    buff_list = {46105301},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122302] = {
    id = 50122302,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254023)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122301,
    next = {50122303},
    chapter_id = 50000223,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222302},
    map_id = 10817,
    buff_list = {46105301},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122303] = {
    id = 50122303,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254023)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122302,
    next = {50122304},
    chapter_id = 50000223,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222303},
    map_id = 10817,
    buff_list = {46105301},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122304] = {
    id = 50122304,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254023)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122303,
    next = {50122305},
    chapter_id = 50000223,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222304},
    map_id = 10817,
    buff_list = {46105301},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122305] = {
    id = 50122305,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254023)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122304,
    chapter_id = 50000223,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222305},
    map_id = 10817,
    buff_list = {46105301},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122401] = {
    id = 50122401,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254024)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122305,
    next = {50122402},
    chapter_id = 50000224,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222401},
    map_id = 10818,
    buff_list = {46105401},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122402] = {
    id = 50122402,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254024)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122401,
    next = {50122403},
    chapter_id = 50000224,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222402},
    map_id = 10818,
    buff_list = {46105401},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122403] = {
    id = 50122403,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254024)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122402,
    next = {50122404},
    chapter_id = 50000224,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222403},
    map_id = 10818,
    buff_list = {46105401},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122404] = {
    id = 50122404,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254024)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122403,
    next = {50122405},
    chapter_id = 50000224,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222404},
    map_id = 10818,
    buff_list = {46105401},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122405] = {
    id = 50122405,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254024)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122404,
    chapter_id = 50000224,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222405},
    map_id = 10818,
    buff_list = {46105401},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122501] = {
    id = 50122501,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254025)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122405,
    next = {50122502},
    chapter_id = 50000225,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222501},
    map_id = 10813,
    buff_list = {46105501},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122502] = {
    id = 50122502,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254025)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122501,
    next = {50122503},
    chapter_id = 50000225,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222502},
    map_id = 10813,
    buff_list = {46105501},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122503] = {
    id = 50122503,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254025)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122502,
    next = {50122504},
    chapter_id = 50000225,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222503},
    map_id = 10813,
    buff_list = {46105501},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122504] = {
    id = 50122504,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254025)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122503,
    next = {50122505},
    chapter_id = 50000225,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222504},
    map_id = 10813,
    buff_list = {46105501},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122505] = {
    id = 50122505,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254025)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_005",
    pre = 50122504,
    chapter_id = 50000225,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:1800",
      "1:21000003:2700"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222505},
    map_id = 10813,
    buff_list = {46105501},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251005)
    end
  },
  [50122601] = {
    id = 50122601,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254026)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122505,
    next = {50122602},
    chapter_id = 50000226,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222601},
    map_id = 10808,
    buff_list = {46106101},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122602] = {
    id = 50122602,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254026)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122601,
    next = {50122603},
    chapter_id = 50000226,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222602},
    map_id = 10808,
    buff_list = {46106101},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122603] = {
    id = 50122603,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254026)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122602,
    next = {50122604},
    chapter_id = 50000226,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222603},
    map_id = 10808,
    buff_list = {46106101},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122604] = {
    id = 50122604,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254026)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122603,
    next = {50122605},
    chapter_id = 50000226,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222604},
    map_id = 10808,
    buff_list = {46106101},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122605] = {
    id = 50122605,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254026)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122604,
    chapter_id = 50000226,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222605},
    map_id = 10808,
    buff_list = {46106101},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122701] = {
    id = 50122701,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254027)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122605,
    next = {50122702},
    chapter_id = 50000227,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222701},
    map_id = 10810,
    buff_list = {46106201},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122702] = {
    id = 50122702,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254027)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122701,
    next = {50122703},
    chapter_id = 50000227,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222702},
    map_id = 10810,
    buff_list = {46106201},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122703] = {
    id = 50122703,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254027)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122702,
    next = {50122704},
    chapter_id = 50000227,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222703},
    map_id = 10810,
    buff_list = {46106201},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122704] = {
    id = 50122704,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254027)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122703,
    next = {50122705},
    chapter_id = 50000227,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222704},
    map_id = 10810,
    buff_list = {46106201},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122705] = {
    id = 50122705,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254027)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122704,
    chapter_id = 50000227,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222705},
    map_id = 10810,
    buff_list = {46106201},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122801] = {
    id = 50122801,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254028)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122705,
    next = {50122802},
    chapter_id = 50000228,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222801},
    map_id = 10803,
    buff_list = {46106301},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122802] = {
    id = 50122802,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254028)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122801,
    next = {50122803},
    chapter_id = 50000228,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222802},
    map_id = 10803,
    buff_list = {46106301},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122803] = {
    id = 50122803,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254028)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122802,
    next = {50122804},
    chapter_id = 50000228,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222803},
    map_id = 10803,
    buff_list = {46106301},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122804] = {
    id = 50122804,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254028)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122803,
    next = {50122805},
    chapter_id = 50000228,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222804},
    map_id = 10803,
    buff_list = {46106301},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122805] = {
    id = 50122805,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254028)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122804,
    chapter_id = 50000228,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222805},
    map_id = 10803,
    buff_list = {46106301},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122901] = {
    id = 50122901,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254029)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122805,
    next = {50122902},
    chapter_id = 50000229,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222901},
    map_id = 10802,
    buff_list = {46106401},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122902] = {
    id = 50122902,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254029)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122901,
    next = {50122903},
    chapter_id = 50000229,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222902},
    map_id = 10802,
    buff_list = {46106401},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122903] = {
    id = 50122903,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254029)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122902,
    next = {50122904},
    chapter_id = 50000229,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222903},
    map_id = 10802,
    buff_list = {46106401},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122904] = {
    id = 50122904,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254029)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122903,
    next = {50122905},
    chapter_id = 50000229,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222904},
    map_id = 10802,
    buff_list = {46106401},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50122905] = {
    id = 50122905,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254029)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122904,
    chapter_id = 50000229,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50222905},
    map_id = 10802,
    buff_list = {46106401},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50123001] = {
    id = 50123001,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254030)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50122905,
    next = {50123002},
    chapter_id = 50000230,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223001},
    map_id = 10807,
    buff_list = {46106501},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50123002] = {
    id = 50123002,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254030)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50123001,
    next = {50123003},
    chapter_id = 50000230,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223002},
    map_id = 10807,
    buff_list = {46106501},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50123003] = {
    id = 50123003,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254030)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50123002,
    next = {50123004},
    chapter_id = 50000230,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223003},
    map_id = 10807,
    buff_list = {46106501},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50123004] = {
    id = 50123004,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254030)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50123003,
    next = {50123005},
    chapter_id = 50000230,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223004},
    map_id = 10807,
    buff_list = {46106501},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50123005] = {
    id = 50123005,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254030)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_006",
    pre = 50123004,
    chapter_id = 50000230,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2000",
      "1:21000003:3000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223005},
    map_id = 10807,
    buff_list = {46106501},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251006)
    end
  },
  [50123101] = {
    id = 50123101,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254031)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123005,
    next = {50123102},
    chapter_id = 50000231,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223101},
    map_id = 10812,
    buff_list = {46107101},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123102] = {
    id = 50123102,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254031)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123101,
    next = {50123103},
    chapter_id = 50000231,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223102},
    map_id = 10812,
    buff_list = {46107101},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123103] = {
    id = 50123103,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254031)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123102,
    next = {50123104},
    chapter_id = 50000231,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223103},
    map_id = 10812,
    buff_list = {46107101},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123104] = {
    id = 50123104,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254031)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123103,
    next = {50123105},
    chapter_id = 50000231,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223104},
    map_id = 10812,
    buff_list = {46107101},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123105] = {
    id = 50123105,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254031)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123104,
    chapter_id = 50000231,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223105},
    map_id = 10812,
    buff_list = {46107101},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123201] = {
    id = 50123201,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254032)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123105,
    next = {50123202},
    chapter_id = 50000232,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223201},
    map_id = 10818,
    buff_list = {46107201},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123202] = {
    id = 50123202,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254032)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123201,
    next = {50123203},
    chapter_id = 50000232,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223202},
    map_id = 10818,
    buff_list = {46107201},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123203] = {
    id = 50123203,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254032)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123202,
    next = {50123204},
    chapter_id = 50000232,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223203},
    map_id = 10818,
    buff_list = {46107201},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123204] = {
    id = 50123204,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254032)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123203,
    next = {50123205},
    chapter_id = 50000232,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223204},
    map_id = 10818,
    buff_list = {46107201},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123205] = {
    id = 50123205,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254032)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123204,
    chapter_id = 50000232,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223205},
    map_id = 10818,
    buff_list = {46107201},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123301] = {
    id = 50123301,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254033)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123205,
    next = {50123302},
    chapter_id = 50000233,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223301},
    map_id = 10804,
    buff_list = {46107301},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123302] = {
    id = 50123302,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254033)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123301,
    next = {50123303},
    chapter_id = 50000233,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223302},
    map_id = 10804,
    buff_list = {46107301},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123303] = {
    id = 50123303,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254033)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123302,
    next = {50123304},
    chapter_id = 50000233,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223303},
    map_id = 10804,
    buff_list = {46107301},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123304] = {
    id = 50123304,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254033)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123303,
    next = {50123305},
    chapter_id = 50000233,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223304},
    map_id = 10804,
    buff_list = {46107301},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123305] = {
    id = 50123305,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254033)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123304,
    chapter_id = 50000233,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223305},
    map_id = 10804,
    buff_list = {46107301},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123401] = {
    id = 50123401,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254034)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123305,
    next = {50123402},
    chapter_id = 50000234,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223401},
    map_id = 10809,
    buff_list = {46107401},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123402] = {
    id = 50123402,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254034)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123401,
    next = {50123403},
    chapter_id = 50000234,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223402},
    map_id = 10809,
    buff_list = {46107401},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123403] = {
    id = 50123403,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254034)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123402,
    next = {50123404},
    chapter_id = 50000234,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223403},
    map_id = 10809,
    buff_list = {46107401},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123404] = {
    id = 50123404,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254034)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123403,
    next = {50123405},
    chapter_id = 50000234,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223404},
    map_id = 10809,
    buff_list = {46107401},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123405] = {
    id = 50123405,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254034)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123404,
    chapter_id = 50000234,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223405},
    map_id = 10809,
    buff_list = {46107401},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123501] = {
    id = 50123501,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254035)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123405,
    next = {50123502},
    chapter_id = 50000235,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223501},
    map_id = 10813,
    buff_list = {46107501},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123502] = {
    id = 50123502,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254035)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123501,
    next = {50123503},
    chapter_id = 50000235,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223502},
    map_id = 10813,
    buff_list = {46107501},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123503] = {
    id = 50123503,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254035)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123502,
    next = {50123504},
    chapter_id = 50000235,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223503},
    map_id = 10813,
    buff_list = {46107501},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123504] = {
    id = 50123504,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254035)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123503,
    next = {50123505},
    chapter_id = 50000235,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223504},
    map_id = 10813,
    buff_list = {46107501},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123505] = {
    id = 50123505,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254035)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_007",
    pre = 50123504,
    chapter_id = 50000235,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2200",
      "1:21000003:3300"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223505},
    map_id = 10813,
    buff_list = {46107501},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251007)
    end
  },
  [50123601] = {
    id = 50123601,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254036)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123505,
    next = {50123602},
    chapter_id = 50000236,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223601},
    map_id = 10811,
    buff_list = {46108101},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123602] = {
    id = 50123602,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254036)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123601,
    next = {50123603},
    chapter_id = 50000236,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223602},
    map_id = 10811,
    buff_list = {46108101},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123603] = {
    id = 50123603,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254036)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123602,
    next = {50123604},
    chapter_id = 50000236,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223603},
    map_id = 10811,
    buff_list = {46108101},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123604] = {
    id = 50123604,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254036)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123603,
    next = {50123605},
    chapter_id = 50000236,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223604},
    map_id = 10811,
    buff_list = {46108101},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123605] = {
    id = 50123605,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254036)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123604,
    chapter_id = 50000236,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223605},
    map_id = 10811,
    buff_list = {46108101},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123701] = {
    id = 50123701,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254037)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123605,
    next = {50123702},
    chapter_id = 50000237,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223701},
    map_id = 10814,
    buff_list = {46108201},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123702] = {
    id = 50123702,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254037)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123701,
    next = {50123703},
    chapter_id = 50000237,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223702},
    map_id = 10814,
    buff_list = {46108201},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123703] = {
    id = 50123703,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254037)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123702,
    next = {50123704},
    chapter_id = 50000237,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223703},
    map_id = 10814,
    buff_list = {46108201},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123704] = {
    id = 50123704,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254037)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123703,
    next = {50123705},
    chapter_id = 50000237,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223704},
    map_id = 10814,
    buff_list = {46108201},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123705] = {
    id = 50123705,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254037)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123704,
    chapter_id = 50000237,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223705},
    map_id = 10814,
    buff_list = {46108201},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123801] = {
    id = 50123801,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254038)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123705,
    next = {50123802},
    chapter_id = 50000238,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223801},
    map_id = 10807,
    buff_list = {46108301},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123802] = {
    id = 50123802,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254038)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123801,
    next = {50123803},
    chapter_id = 50000238,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223802},
    map_id = 10807,
    buff_list = {46108301},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123803] = {
    id = 50123803,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254038)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123802,
    next = {50123804},
    chapter_id = 50000238,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223803},
    map_id = 10807,
    buff_list = {46108301},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123804] = {
    id = 50123804,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254038)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123803,
    next = {50123805},
    chapter_id = 50000238,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223804},
    map_id = 10807,
    buff_list = {46108301},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123805] = {
    id = 50123805,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254038)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123804,
    chapter_id = 50000238,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223805},
    map_id = 10807,
    buff_list = {46108301},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123901] = {
    id = 50123901,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254039)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123805,
    next = {50123902},
    chapter_id = 50000239,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223901},
    map_id = 10808,
    buff_list = {46108401},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123902] = {
    id = 50123902,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254039)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123901,
    next = {50123903},
    chapter_id = 50000239,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223902},
    map_id = 10808,
    buff_list = {46108401},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123903] = {
    id = 50123903,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254039)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123902,
    next = {50123904},
    chapter_id = 50000239,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223903},
    map_id = 10808,
    buff_list = {46108401},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123904] = {
    id = 50123904,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254039)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123903,
    next = {50123905},
    chapter_id = 50000239,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223904},
    map_id = 10808,
    buff_list = {46108401},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50123905] = {
    id = 50123905,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254039)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123904,
    chapter_id = 50000239,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50223905},
    map_id = 10808,
    buff_list = {46108401},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50124001] = {
    id = 50124001,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80254040)
    end,
    name_english = function()
      return T(80255001)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50123905,
    next = {50124002},
    chapter_id = 50000240,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50224001},
    map_id = 10804,
    buff_list = {46108501},
    name_subtitle = function()
      return T(80220020, T(80220019), "01")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50124002] = {
    id = 50124002,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80254040)
    end,
    name_english = function()
      return T(80255002)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50124001,
    next = {50124003},
    chapter_id = 50000240,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50224002},
    map_id = 10804,
    buff_list = {46108501},
    name_subtitle = function()
      return T(80220020, T(80220019), "02")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50124003] = {
    id = 50124003,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80254040)
    end,
    name_english = function()
      return T(80255003)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50124002,
    next = {50124004},
    chapter_id = 50000240,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50224003},
    map_id = 10804,
    buff_list = {46108501},
    name_subtitle = function()
      return T(80220020, T(80220019), "03")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50124004] = {
    id = 50124004,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80254040)
    end,
    name_english = function()
      return T(80255004)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50124003,
    next = {50124005},
    chapter_id = 50000240,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50224004},
    map_id = 10804,
    buff_list = {46108501},
    name_subtitle = function()
      return T(80220020, T(80220019), "04")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50124005] = {
    id = 50124005,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80254040)
    end,
    name_english = function()
      return T(80255005)
    end,
    des = function()
      return T(80220001)
    end,
    icon = "Tower:LayersSign_008",
    pre = 50124004,
    chapter_id = 50000240,
    chapter_type = 2,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:120",
      "1:21000005:10",
      "1:21010001:2400",
      "1:21000003:3600"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010001:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50224005},
    map_id = 10804,
    buff_list = {46108501},
    name_subtitle = function()
      return T(80220020, T(80220019), "05")
    end,
    name_Headline = function()
      return T(80251008)
    end
  },
  [50130101] = {
    id = 50130101,
    name = function()
      return T(80202101)
    end,
    name_detail = function()
      return T(80202101)
    end,
    name_english = function()
      return T(80202001)
    end,
    des = function()
      return T(80230101)
    end,
    icon = "ItemIcon:gold1",
    next = {50130102},
    chapter_id = 50000301,
    chapter_type = 11,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030101},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230401},
    map_id = 10507,
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220003), 1)
    end
  },
  [50130102] = {
    id = 50130102,
    name = function()
      return T(80202102)
    end,
    name_detail = function()
      return T(80202102)
    end,
    name_english = function()
      return T(80202001)
    end,
    des = function()
      return T(80230101)
    end,
    icon = "ItemIcon:gold2",
    pre = 50130101,
    next = {50130103},
    chapter_id = 50000301,
    chapter_type = 11,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030102},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230402},
    map_id = 10507,
    stage_level = 2,
    open_condition = "70020100:10",
    name_subtitle = function()
      return T(80220002, T(80220003), 2)
    end
  },
  [50130103] = {
    id = 50130103,
    name = function()
      return T(80202103)
    end,
    name_detail = function()
      return T(80202103)
    end,
    name_english = function()
      return T(80202001)
    end,
    des = function()
      return T(80230101)
    end,
    icon = "ItemIcon:gold3",
    pre = 50130102,
    next = {50130104},
    chapter_id = 50000301,
    chapter_type = 11,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030103},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230403},
    map_id = 10607,
    stage_level = 3,
    open_condition = "70020100:20",
    name_subtitle = function()
      return T(80220002, T(80220003), 3)
    end
  },
  [50130104] = {
    id = 50130104,
    name = function()
      return T(80202104)
    end,
    name_detail = function()
      return T(80202104)
    end,
    name_english = function()
      return T(80202001)
    end,
    des = function()
      return T(80230101)
    end,
    icon = "ItemIcon:gold4",
    pre = 50130103,
    next = {50130105},
    chapter_id = 50000301,
    chapter_type = 11,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030104},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230404},
    map_id = 10707,
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220003), 4)
    end
  },
  [50130105] = {
    id = 50130105,
    name = function()
      return T(80202105)
    end,
    name_detail = function()
      return T(80202105)
    end,
    name_english = function()
      return T(80202001)
    end,
    des = function()
      return T(80230101)
    end,
    icon = "ItemIcon:gold5",
    pre = 50130104,
    chapter_id = 50000301,
    chapter_type = 11,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:25"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030105},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230405},
    map_id = 10807,
    stage_level = 5,
    open_condition = "70020100:30",
    name_subtitle = function()
      return T(80220002, T(80220003), 5)
    end
  },
  [50130201] = {
    id = 50130201,
    name = function()
      return T(80202201)
    end,
    name_detail = function()
      return T(80202201)
    end,
    name_english = function()
      return T(80202002)
    end,
    des = function()
      return T(80230201)
    end,
    icon = "ItemIcon:exp1",
    next = {50130202},
    chapter_id = 50000401,
    chapter_type = 12,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030201},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21010001:1"
    },
    monster_group_list = {50230301},
    map_id = 10504,
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220004), 1)
    end
  },
  [50130202] = {
    id = 50130202,
    name = function()
      return T(80202202)
    end,
    name_detail = function()
      return T(80202202)
    end,
    name_english = function()
      return T(80202002)
    end,
    des = function()
      return T(80230201)
    end,
    icon = "ItemIcon:exp2",
    pre = 50130201,
    next = {50130203},
    chapter_id = 50000401,
    chapter_type = 12,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030202},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21010001:1"
    },
    monster_group_list = {50230302},
    map_id = 10604,
    stage_level = 2,
    open_condition = "70020100:9",
    name_subtitle = function()
      return T(80220002, T(80220004), 2)
    end
  },
  [50130203] = {
    id = 50130203,
    name = function()
      return T(80202203)
    end,
    name_detail = function()
      return T(80202203)
    end,
    name_english = function()
      return T(80202002)
    end,
    des = function()
      return T(80230201)
    end,
    icon = "ItemIcon:exp3",
    pre = 50130202,
    next = {50130204},
    chapter_id = 50000401,
    chapter_type = 12,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030203},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21010001:1"
    },
    monster_group_list = {50230303},
    map_id = 10704,
    stage_level = 3,
    open_condition = "70020100:20",
    name_subtitle = function()
      return T(80220002, T(80220004), 3)
    end
  },
  [50130204] = {
    id = 50130204,
    name = function()
      return T(80202204)
    end,
    name_detail = function()
      return T(80202204)
    end,
    name_english = function()
      return T(80202002)
    end,
    des = function()
      return T(80230201)
    end,
    icon = "ItemIcon:exp4",
    pre = 50130203,
    chapter_id = 50000401,
    chapter_type = 12,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:25"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030204},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21010001:1"
    },
    monster_group_list = {50230304},
    map_id = 10804,
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220004), 4)
    end
  },
  [50130301] = {
    id = 50130301,
    name = function()
      return T(80202301)
    end,
    name_detail = function()
      return T(80202301)
    end,
    name_english = function()
      return T(80202003)
    end,
    des = function()
      return T(80230301)
    end,
    icon = "ItemIcon:21040001",
    next = {50130302},
    chapter_id = 50000501,
    chapter_type = 13,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:5"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030301},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21040001:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230201},
    map_id = 10512,
    buff_list = {46300011},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220005), 1)
    end
  },
  [50130302] = {
    id = 50130302,
    name = function()
      return T(80202302)
    end,
    name_detail = function()
      return T(80202302)
    end,
    name_english = function()
      return T(80202003)
    end,
    des = function()
      return T(80230301)
    end,
    icon = "ItemIcon:21040001",
    pre = 50130301,
    next = {50130303},
    chapter_id = 50000501,
    chapter_type = 13,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030302},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21040001:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230202},
    map_id = 10612,
    buff_list = {46300011},
    stage_level = 2,
    open_condition = "70020100:7",
    name_subtitle = function()
      return T(80220002, T(80220005), 2)
    end
  },
  [50130303] = {
    id = 50130303,
    name = function()
      return T(80202303)
    end,
    name_detail = function()
      return T(80202303)
    end,
    name_english = function()
      return T(80202003)
    end,
    des = function()
      return T(80230301)
    end,
    icon = "ItemIcon:21040002",
    pre = 50130302,
    next = {50130304},
    chapter_id = 50000501,
    chapter_type = 13,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030303},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21040002:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230203},
    map_id = 10712,
    buff_list = {46300011},
    stage_level = 3,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220005), 3)
    end
  },
  [50130304] = {
    id = 50130304,
    name = function()
      return T(80202304)
    end,
    name_detail = function()
      return T(80202304)
    end,
    name_english = function()
      return T(80202003)
    end,
    des = function()
      return T(80230301)
    end,
    icon = "ItemIcon:21040003",
    pre = 50130303,
    chapter_id = 50000501,
    chapter_type = 13,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030304},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21040003:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230204},
    map_id = 10812,
    buff_list = {46300011},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220005), 4)
    end
  },
  [50130401] = {
    id = 50130401,
    name = function()
      return T(80202411)
    end,
    name_detail = function()
      return T(80202411)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230411)
    end,
    icon = "ItemIcon:21030101",
    next = {50130402},
    chapter_id = 50000601,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030401},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030101:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230501},
    map_id = 10517,
    buff_list = {46300001},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220006), 1)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130402] = {
    id = 50130402,
    name = function()
      return T(80202412)
    end,
    name_detail = function()
      return T(80202412)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230411)
    end,
    icon = "ItemIcon:21030101",
    pre = 50130401,
    next = {50130403},
    chapter_id = 50000601,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030402},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030101:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230502},
    map_id = 10617,
    buff_list = {46300001},
    stage_level = 2,
    open_condition = "70020100:12",
    name_subtitle = function()
      return T(80220002, T(80220006), 2)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130403] = {
    id = 50130403,
    name = function()
      return T(80202413)
    end,
    name_detail = function()
      return T(80202413)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230411)
    end,
    icon = "ItemIcon:21030102",
    pre = 50130402,
    next = {50130404},
    chapter_id = 50000601,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030403},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030102:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230503},
    map_id = 10717,
    buff_list = {46300002},
    stage_level = 3,
    open_condition = "70020100:18",
    name_subtitle = function()
      return T(80220002, T(80220006), 3)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130404] = {
    id = 50130404,
    name = function()
      return T(80202414)
    end,
    name_detail = function()
      return T(80202414)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230411)
    end,
    icon = "ItemIcon:21030103",
    pre = 50130403,
    chapter_id = 50000601,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:25"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030404},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030103:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230504},
    map_id = 10817,
    buff_list = {46300003},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220006), 4)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130411] = {
    id = 50130411,
    name = function()
      return T(80202421)
    end,
    name_detail = function()
      return T(80202421)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230421)
    end,
    icon = "ItemIcon:21030201",
    next = {50130412},
    chapter_id = 50000602,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030411},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030201:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230601},
    map_id = 10502,
    buff_list = {46300001},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220007), 1)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130412] = {
    id = 50130412,
    name = function()
      return T(80202422)
    end,
    name_detail = function()
      return T(80202422)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230421)
    end,
    icon = "ItemIcon:21030201",
    pre = 50130411,
    next = {50130413},
    chapter_id = 50000602,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030412},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030201:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230602},
    map_id = 10602,
    buff_list = {46300001},
    stage_level = 2,
    open_condition = "70020100:12",
    name_subtitle = function()
      return T(80220002, T(80220007), 2)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130413] = {
    id = 50130413,
    name = function()
      return T(80202423)
    end,
    name_detail = function()
      return T(80202423)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230421)
    end,
    icon = "ItemIcon:21030202",
    pre = 50130412,
    next = {50130414},
    chapter_id = 50000602,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030413},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030202:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230603},
    map_id = 10702,
    buff_list = {46300002},
    stage_level = 3,
    open_condition = "70020100:18",
    name_subtitle = function()
      return T(80220002, T(80220007), 3)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130414] = {
    id = 50130414,
    name = function()
      return T(80202424)
    end,
    name_detail = function()
      return T(80202424)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230421)
    end,
    icon = "ItemIcon:21030203",
    pre = 50130413,
    chapter_id = 50000602,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:25"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030414},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030203:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230604},
    map_id = 10802,
    buff_list = {46300003},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220007), 4)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130431] = {
    id = 50130431,
    name = function()
      return T(80202441)
    end,
    name_detail = function()
      return T(80202441)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230441)
    end,
    icon = "ItemIcon:21030401",
    next = {50130432},
    chapter_id = 50000604,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030431},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030401:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230801},
    map_id = 10505,
    buff_list = {46300001},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220008), 1)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130432] = {
    id = 50130432,
    name = function()
      return T(80202442)
    end,
    name_detail = function()
      return T(80202442)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230441)
    end,
    icon = "ItemIcon:21030401",
    pre = 50130431,
    next = {50130433},
    chapter_id = 50000604,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030432},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030401:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230802},
    map_id = 10605,
    buff_list = {46300001},
    stage_level = 2,
    open_condition = "70020100:12",
    name_subtitle = function()
      return T(80220002, T(80220008), 2)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130433] = {
    id = 50130433,
    name = function()
      return T(80202443)
    end,
    name_detail = function()
      return T(80202443)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230441)
    end,
    icon = "ItemIcon:21030402",
    pre = 50130432,
    next = {50130434},
    chapter_id = 50000604,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030433},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030402:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230803},
    map_id = 10705,
    buff_list = {46300002},
    stage_level = 3,
    open_condition = "70020100:18",
    name_subtitle = function()
      return T(80220002, T(80220008), 3)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130434] = {
    id = 50130434,
    name = function()
      return T(80202444)
    end,
    name_detail = function()
      return T(80202444)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230441)
    end,
    icon = "ItemIcon:21030403",
    pre = 50130433,
    chapter_id = 50000604,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:25"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030434},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030403:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230804},
    map_id = 10805,
    buff_list = {46300003},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220008), 4)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130441] = {
    id = 50130441,
    name = function()
      return T(80202451)
    end,
    name_detail = function()
      return T(80202451)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230451)
    end,
    icon = "ItemIcon:21030501",
    next = {50130442},
    chapter_id = 50000605,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030441},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030501:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230901},
    map_id = 10503,
    buff_list = {46300001},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220009), 1)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130442] = {
    id = 50130442,
    name = function()
      return T(80202452)
    end,
    name_detail = function()
      return T(80202452)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230451)
    end,
    icon = "ItemIcon:21030501",
    pre = 50130441,
    next = {50130443},
    chapter_id = 50000605,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030442},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030501:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230902},
    map_id = 10603,
    buff_list = {46300001},
    stage_level = 2,
    open_condition = "70020100:12",
    name_subtitle = function()
      return T(80220002, T(80220009), 2)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130443] = {
    id = 50130443,
    name = function()
      return T(80202453)
    end,
    name_detail = function()
      return T(80202453)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230451)
    end,
    icon = "ItemIcon:21030502",
    pre = 50130442,
    next = {50130444},
    chapter_id = 50000605,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030443},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030502:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230903},
    map_id = 10703,
    buff_list = {46300002},
    stage_level = 3,
    open_condition = "70020100:18",
    name_subtitle = function()
      return T(80220002, T(80220009), 3)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130444] = {
    id = 50130444,
    name = function()
      return T(80202454)
    end,
    name_detail = function()
      return T(80202454)
    end,
    name_english = function()
      return T(80202004)
    end,
    des = function()
      return T(80230451)
    end,
    icon = "ItemIcon:21030503",
    pre = 50130443,
    chapter_id = 50000605,
    chapter_type = 14,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:25"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030444},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21030503:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50230904},
    map_id = 10803,
    buff_list = {46300003},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220009), 4)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130501] = {
    id = 50130501,
    name = function()
      return T(80202511)
    end,
    name_detail = function()
      return T(80202511)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230511)
    end,
    icon = "ItemIcon:21020001",
    next = {50130502},
    chapter_id = 50000701,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030501},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020001:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231001},
    map_id = 10509,
    buff_list = {46300001},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220010), 1)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130502] = {
    id = 50130502,
    name = function()
      return T(80202512)
    end,
    name_detail = function()
      return T(80202512)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230511)
    end,
    icon = "ItemIcon:21020006",
    pre = 50130501,
    next = {50130503},
    chapter_id = 50000701,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030502},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020006:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231002},
    map_id = 10609,
    buff_list = {46300002},
    stage_level = 2,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220010), 2)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130503] = {
    id = 50130503,
    name = function()
      return T(80202513)
    end,
    name_detail = function()
      return T(80202513)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230511)
    end,
    icon = "ItemIcon:21020026",
    pre = 50130502,
    next = {
      50130504,
      50130505,
      50130506
    },
    chapter_id = 50000701,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030503},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020026:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231003},
    map_id = 10709,
    buff_list = {46300002},
    stage_level = 3,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220010), 3)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130504] = {
    id = 50130504,
    name = function()
      return T(80202514)
    end,
    name_detail = function()
      return T(80202514)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230511)
    end,
    icon = "ItemIcon:21020011",
    pre = 50130503,
    chapter_id = 50000701,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030504},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020011:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231004},
    map_id = 10809,
    buff_list = {46300003},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220010), 4)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130505] = {
    id = 50130505,
    name = function()
      return T(80202515)
    end,
    name_detail = function()
      return T(80202515)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230511)
    end,
    icon = "ItemIcon:21020012",
    pre = 50130503,
    chapter_id = 50000701,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030505},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020012:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231005},
    map_id = 10809,
    buff_list = {46300003},
    stage_level = 5,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220010), 5)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130506] = {
    id = 50130506,
    name = function()
      return T(80202516)
    end,
    name_detail = function()
      return T(80202516)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230511)
    end,
    icon = "ItemIcon:21020013",
    pre = 50130503,
    chapter_id = 50000701,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030506},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020013:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231006},
    map_id = 10809,
    buff_list = {46300003},
    stage_level = 5,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220010), 6)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130511] = {
    id = 50130511,
    name = function()
      return T(80202521)
    end,
    name_detail = function()
      return T(80202521)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230521)
    end,
    icon = "ItemIcon:21020002",
    next = {50130512},
    chapter_id = 50000702,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030511},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020002:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231101},
    map_id = 10506,
    buff_list = {46300001},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220011), 1)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130512] = {
    id = 50130512,
    name = function()
      return T(80202522)
    end,
    name_detail = function()
      return T(80202522)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230521)
    end,
    icon = "ItemIcon:21020007",
    pre = 50130511,
    next = {50130513},
    chapter_id = 50000702,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030512},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020007:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231102},
    map_id = 10606,
    buff_list = {46300002},
    stage_level = 2,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220011), 2)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130513] = {
    id = 50130513,
    name = function()
      return T(80202523)
    end,
    name_detail = function()
      return T(80202523)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230521)
    end,
    icon = "ItemIcon:21020027",
    pre = 50130512,
    next = {
      50130514,
      50130515,
      50130516
    },
    chapter_id = 50000702,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030513},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020027:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231103},
    map_id = 10706,
    buff_list = {46300002},
    stage_level = 3,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220011), 3)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130514] = {
    id = 50130514,
    name = function()
      return T(80202524)
    end,
    name_detail = function()
      return T(80202524)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230521)
    end,
    icon = "ItemIcon:21020014",
    pre = 50130513,
    chapter_id = 50000702,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030514},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020014:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231104},
    map_id = 10806,
    buff_list = {46300003},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220011), 4)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130515] = {
    id = 50130515,
    name = function()
      return T(80202525)
    end,
    name_detail = function()
      return T(80202525)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230521)
    end,
    icon = "ItemIcon:21020015",
    pre = 50130513,
    chapter_id = 50000702,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030515},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020015:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231105},
    map_id = 10806,
    buff_list = {46300003},
    stage_level = 5,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220011), 5)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130516] = {
    id = 50130516,
    name = function()
      return T(80202526)
    end,
    name_detail = function()
      return T(80202526)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230521)
    end,
    icon = "ItemIcon:21020016",
    pre = 50130513,
    chapter_id = 50000702,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030516},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020016:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231106},
    map_id = 10806,
    buff_list = {46300003},
    stage_level = 5,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220011), 6)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130531] = {
    id = 50130531,
    name = function()
      return T(80202541)
    end,
    name_detail = function()
      return T(80202541)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230541)
    end,
    icon = "ItemIcon:21020004",
    next = {50130532},
    chapter_id = 50000704,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030531},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020004:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231301},
    map_id = 10511,
    buff_list = {46300001},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220013), 1)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130532] = {
    id = 50130532,
    name = function()
      return T(80202542)
    end,
    name_detail = function()
      return T(80202542)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230541)
    end,
    icon = "ItemIcon:21020009",
    pre = 50130531,
    next = {50130533},
    chapter_id = 50000704,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030532},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020009:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231302},
    map_id = 10611,
    buff_list = {46300002},
    stage_level = 2,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220013), 2)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130533] = {
    id = 50130533,
    name = function()
      return T(80202543)
    end,
    name_detail = function()
      return T(80202543)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230541)
    end,
    icon = "ItemIcon:21020029",
    pre = 50130532,
    next = {
      50130534,
      50130535,
      50130536
    },
    chapter_id = 50000704,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030533},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020029:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231303},
    map_id = 10711,
    buff_list = {46300002},
    stage_level = 3,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220013), 3)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130534] = {
    id = 50130534,
    name = function()
      return T(80202544)
    end,
    name_detail = function()
      return T(80202544)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230541)
    end,
    icon = "ItemIcon:21020020",
    pre = 50130533,
    chapter_id = 50000704,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030534},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020020:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231304},
    map_id = 10811,
    buff_list = {46300003},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220013), 4)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130535] = {
    id = 50130535,
    name = function()
      return T(80202545)
    end,
    name_detail = function()
      return T(80202545)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230541)
    end,
    icon = "ItemIcon:21020021",
    pre = 50130533,
    chapter_id = 50000704,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030535},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020021:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231305},
    map_id = 10811,
    buff_list = {46300003},
    stage_level = 5,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220013), 5)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130536] = {
    id = 50130536,
    name = function()
      return T(80202546)
    end,
    name_detail = function()
      return T(80202546)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230541)
    end,
    icon = "ItemIcon:21020022",
    pre = 50130533,
    chapter_id = 50000704,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030536},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020022:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231306},
    map_id = 10811,
    buff_list = {46300003},
    stage_level = 5,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220013), 6)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130541] = {
    id = 50130541,
    name = function()
      return T(80202551)
    end,
    name_detail = function()
      return T(80202551)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230551)
    end,
    icon = "ItemIcon:21020005",
    next = {50130542},
    chapter_id = 50000705,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030541},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020005:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231401},
    map_id = 10510,
    buff_list = {46300001},
    stage_level = 1,
    name_subtitle = function()
      return T(80220002, T(80220014), 1)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130542] = {
    id = 50130542,
    name = function()
      return T(80202552)
    end,
    name_detail = function()
      return T(80202552)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230551)
    end,
    icon = "ItemIcon:21020010",
    pre = 50130541,
    next = {50130543},
    chapter_id = 50000705,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030542},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020010:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231402},
    map_id = 10610,
    buff_list = {46300002},
    stage_level = 2,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220014), 2)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130543] = {
    id = 50130543,
    name = function()
      return T(80202553)
    end,
    name_detail = function()
      return T(80202553)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230551)
    end,
    icon = "ItemIcon:21020030",
    pre = 50130542,
    next = {
      50130544,
      50130545,
      50130546
    },
    chapter_id = 50000705,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030543},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020030:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231403},
    map_id = 10710,
    buff_list = {46300002},
    stage_level = 3,
    open_condition = "70020100:15",
    name_subtitle = function()
      return T(80220002, T(80220014), 3)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130544] = {
    id = 50130544,
    name = function()
      return T(80202554)
    end,
    name_detail = function()
      return T(80202554)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230551)
    end,
    icon = "ItemIcon:21020023",
    pre = 50130543,
    chapter_id = 50000705,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030544},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020023:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231404},
    map_id = 10810,
    buff_list = {46300003},
    stage_level = 4,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220014), 4)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130545] = {
    id = 50130545,
    name = function()
      return T(80202555)
    end,
    name_detail = function()
      return T(80202555)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230551)
    end,
    icon = "ItemIcon:21020024",
    pre = 50130543,
    chapter_id = 50000705,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030545},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020024:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231405},
    map_id = 10810,
    buff_list = {46300003},
    stage_level = 5,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220014), 5)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50130546] = {
    id = 50130546,
    name = function()
      return T(80202556)
    end,
    name_detail = function()
      return T(80202556)
    end,
    name_english = function()
      return T(80202005)
    end,
    des = function()
      return T(80230551)
    end,
    icon = "ItemIcon:21020025",
    pre = 50130543,
    chapter_id = 50000705,
    chapter_type = 15,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:30"
    },
    win_condition = "1",
    first_reward = {
      "1:21000002:1"
    },
    drop_reward = {22030546},
    reward_show = {
      "1:1:21000002:1",
      "2:1:21020025:1",
      "2:1:21000003:1"
    },
    monster_group_list = {50231406},
    map_id = 10810,
    buff_list = {46300003},
    stage_level = 5,
    open_condition = "70020100:25",
    name_subtitle = function()
      return T(80220002, T(80220014), 6)
    end,
    effect_path = "Assets/Art/Effects/Prefab/battle/FX_battle_grounddebuff.prefab"
  },
  [50140011] = {
    id = 50140011,
    name = function()
      return T(80220001, "01")
    end,
    next = {50140012},
    chapter_id = 50000901,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    drop_reward = {
      22040001,
      22040011,
      22040011,
      22040011,
      22040011
    },
    reward_show = {
      "3:3:21080211:1",
      "3:3:21081011:1"
    },
    monster_group_list = {50260011},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:15",
    back_effect = "FX_bosschallenge_water_mid.prefab"
  },
  [50140012] = {
    id = 50140012,
    name = function()
      return T(80220001, "02")
    end,
    pre = 50140011,
    next = {50140013},
    chapter_id = 50000901,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040002,
      22040013,
      22040013,
      22040013,
      22040011,
      22040011
    },
    reward_show = {
      "3:3:21080221:1",
      "3:3:21081021:1",
      "3:3:21080211:1",
      "3:3:21081011:1"
    },
    monster_group_list = {50260012},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:20",
    back_effect = "FX_bosschallenge_water_mid.prefab"
  },
  [50140013] = {
    id = 50140013,
    name = function()
      return T(80220001, "03")
    end,
    pre = 50140012,
    next = {50140014},
    chapter_id = 50000901,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040003,
      22040015,
      22040015,
      22040015,
      22040013,
      22040013
    },
    reward_show = {
      "3:3:21080231:1",
      "3:3:21081031:1",
      "3:3:21080221:1",
      "3:3:21081021:1",
      "3:3:21080211:1",
      "3:3:21081011:1"
    },
    monster_group_list = {50260013},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:26",
    back_effect = "FX_bosschallenge_water_mid.prefab"
  },
  [50140014] = {
    id = 50140014,
    name = function()
      return T(80220001, "04")
    end,
    pre = 50140013,
    next = {50140015},
    chapter_id = 50000901,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040004,
      22040016,
      22040015,
      22040015,
      22040014,
      22040013,
      22040012
    },
    reward_show = {
      "3:3:21080241:1",
      "3:3:21081041:1",
      "3:3:21080231:1",
      "3:3:21081031:1",
      "3:3:21080221:1",
      "3:3:21081021:1",
      "3:3:21080211:1",
      "3:3:21081011:1"
    },
    monster_group_list = {50260014},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:32",
    back_effect = "FX_bosschallenge_water_mid.prefab"
  },
  [50140015] = {
    id = 50140015,
    name = function()
      return T(80220001, "05")
    end,
    pre = 50140014,
    chapter_id = 50000901,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040005,
      22040016,
      22040016,
      22040015,
      22040015,
      22040015
    },
    reward_show = {
      "3:3:21080241:1",
      "3:3:21081041:1",
      "3:3:21080231:1",
      "3:3:21081031:1"
    },
    monster_group_list = {50260015},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:38",
    back_effect = "FX_bosschallenge_water_mid.prefab"
  },
  [50140021] = {
    id = 50140021,
    name = function()
      return T(80220001, "01")
    end,
    next = {50140022},
    chapter_id = 50000902,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    drop_reward = {
      22040001,
      22040021,
      22040021,
      22040021,
      22040021
    },
    reward_show = {
      "3:3:21081111:1",
      "3:3:21080611:1"
    },
    monster_group_list = {50260021},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:15",
    back_effect = "FX_bosschallenge_water_high.prefab"
  },
  [50140022] = {
    id = 50140022,
    name = function()
      return T(80220001, "02")
    end,
    pre = 50140021,
    next = {50140023},
    chapter_id = 50000902,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040002,
      22040023,
      22040023,
      22040023,
      22040021,
      22040021
    },
    reward_show = {
      "3:3:21081121:1",
      "3:3:21080621:1",
      "3:3:21081111:1",
      "3:3:21080611:1"
    },
    monster_group_list = {50260022},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:20",
    back_effect = "FX_bosschallenge_water_high.prefab"
  },
  [50140023] = {
    id = 50140023,
    name = function()
      return T(80220001, "03")
    end,
    pre = 50140022,
    next = {50140024},
    chapter_id = 50000902,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040003,
      22040025,
      22040025,
      22040025,
      22040023,
      22040023
    },
    reward_show = {
      "3:3:21081131:1",
      "3:3:21080631:1",
      "3:3:21081121:1",
      "3:3:21080621:1",
      "3:3:21081111:1",
      "3:3:21080611:1"
    },
    monster_group_list = {50260023},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:26",
    back_effect = "FX_bosschallenge_water_high.prefab"
  },
  [50140024] = {
    id = 50140024,
    name = function()
      return T(80220001, "04")
    end,
    pre = 50140023,
    next = {50140025},
    chapter_id = 50000902,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040004,
      22040026,
      22040025,
      22040025,
      22040024,
      22040023,
      22040022
    },
    reward_show = {
      "3:3:21081141:1",
      "3:3:21080641:1",
      "3:3:21081131:1",
      "3:3:21080631:1",
      "3:3:21081121:1",
      "3:3:21080621:1",
      "3:3:21081111:1",
      "3:3:21080611:1"
    },
    monster_group_list = {50260024},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:32",
    back_effect = "FX_bosschallenge_water_high.prefab"
  },
  [50140025] = {
    id = 50140025,
    name = function()
      return T(80220001, "05")
    end,
    pre = 50140024,
    chapter_id = 50000902,
    chapter_type = 41,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040005,
      22040026,
      22040026,
      22040025,
      22040025,
      22040025
    },
    reward_show = {
      "3:3:21081141:1",
      "3:3:21080641:1",
      "3:3:21081131:1",
      "3:3:21080631:1"
    },
    monster_group_list = {50260025},
    map_id = 10710,
    buff_list = {46400001},
    open_condition = "70020100:38",
    back_effect = "FX_bosschallenge_water_high.prefab"
  },
  [50140111] = {
    id = 50140111,
    name = function()
      return T(80220001, "01")
    end,
    next = {50140112},
    chapter_id = 50000911,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    drop_reward = {
      22040001,
      22040111,
      22040111,
      22040111,
      22040111
    },
    reward_show = {
      "3:3:21080011:1",
      "3:3:21080911:1"
    },
    monster_group_list = {50260111},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:15",
    back_effect = "FX_bosschallenge_fire_mid.prefab"
  },
  [50140112] = {
    id = 50140112,
    name = function()
      return T(80220001, "02")
    end,
    pre = 50140111,
    next = {50140113},
    chapter_id = 50000911,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040002,
      22040113,
      22040113,
      22040113,
      22040111,
      22040111
    },
    reward_show = {
      "3:3:21080021:1",
      "3:3:21080921:1",
      "3:3:21080011:1",
      "3:3:21080911:1"
    },
    monster_group_list = {50260112},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:20",
    back_effect = "FX_bosschallenge_fire_mid.prefab"
  },
  [50140113] = {
    id = 50140113,
    name = function()
      return T(80220001, "03")
    end,
    pre = 50140112,
    next = {50140114},
    chapter_id = 50000911,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040003,
      22040115,
      22040115,
      22040115,
      22040113,
      22040113
    },
    reward_show = {
      "3:3:21080031:1",
      "3:3:21080931:1",
      "3:3:21080021:1",
      "3:3:21080921:1",
      "3:3:21080011:1",
      "3:3:21080911:1"
    },
    monster_group_list = {50260113},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:26",
    back_effect = "FX_bosschallenge_fire_mid.prefab"
  },
  [50140114] = {
    id = 50140114,
    name = function()
      return T(80220001, "04")
    end,
    pre = 50140113,
    next = {50140115},
    chapter_id = 50000911,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040004,
      22040116,
      22040115,
      22040115,
      22040114,
      22040113,
      22040112
    },
    reward_show = {
      "3:3:21080041:1",
      "3:3:21080941:1",
      "3:3:21080031:1",
      "3:3:21080931:1",
      "3:3:21080021:1",
      "3:3:21080921:1",
      "3:3:21080011:1",
      "3:3:21080911:1"
    },
    monster_group_list = {50260114},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:32",
    back_effect = "FX_bosschallenge_fire_mid.prefab"
  },
  [50140115] = {
    id = 50140115,
    name = function()
      return T(80220001, "05")
    end,
    pre = 50140114,
    chapter_id = 50000911,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040005,
      22040116,
      22040116,
      22040115,
      22040115,
      22040115
    },
    reward_show = {
      "3:3:21080041:1",
      "3:3:21080941:1",
      "3:3:21080031:1",
      "3:3:21080931:1"
    },
    monster_group_list = {50260115},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:38",
    back_effect = "FX_bosschallenge_fire_mid.prefab"
  },
  [50140121] = {
    id = 50140121,
    name = function()
      return T(80220001, "01")
    end,
    next = {50140122},
    chapter_id = 50000912,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    drop_reward = {
      22040001,
      22040121,
      22040121,
      22040121,
      22040121
    },
    reward_show = {
      "3:3:21080811:1",
      "3:3:21080711:1"
    },
    monster_group_list = {50260121},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:15",
    back_effect = "FX_bosschallenge_fire_high.prefab"
  },
  [50140122] = {
    id = 50140122,
    name = function()
      return T(80220001, "02")
    end,
    pre = 50140121,
    next = {50140123},
    chapter_id = 50000912,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040002,
      22040123,
      22040123,
      22040123,
      22040121,
      22040121
    },
    reward_show = {
      "3:3:21080821:1",
      "3:3:21080721:1",
      "3:3:21080811:1",
      "3:3:21080711:1"
    },
    monster_group_list = {50260122},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:20",
    back_effect = "FX_bosschallenge_fire_high.prefab"
  },
  [50140123] = {
    id = 50140123,
    name = function()
      return T(80220001, "03")
    end,
    pre = 50140122,
    next = {50140124},
    chapter_id = 50000912,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040003,
      22040125,
      22040125,
      22040125,
      22040123,
      22040123
    },
    reward_show = {
      "3:3:21080831:1",
      "3:3:21080731:1",
      "3:3:21080821:1",
      "3:3:21080721:1",
      "3:3:21080811:1",
      "3:3:21080711:1"
    },
    monster_group_list = {50260123},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:26",
    back_effect = "FX_bosschallenge_fire_high.prefab"
  },
  [50140124] = {
    id = 50140124,
    name = function()
      return T(80220001, "04")
    end,
    pre = 50140123,
    next = {50140125},
    chapter_id = 50000912,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040004,
      22040126,
      22040125,
      22040125,
      22040124,
      22040123,
      22040122
    },
    reward_show = {
      "3:3:21080841:1",
      "3:3:21080741:1",
      "3:3:21080831:1",
      "3:3:21080731:1",
      "3:3:21080821:1",
      "3:3:21080721:1",
      "3:3:21080811:1",
      "3:3:21080711:1"
    },
    monster_group_list = {50260124},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:32",
    back_effect = "FX_bosschallenge_fire_high.prefab"
  },
  [50140125] = {
    id = 50140125,
    name = function()
      return T(80220001, "05")
    end,
    pre = 50140124,
    chapter_id = 50000912,
    chapter_type = 42,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040005,
      22040126,
      22040126,
      22040125,
      22040125,
      22040125
    },
    reward_show = {
      "3:3:21080841:1",
      "3:3:21080741:1",
      "3:3:21080831:1",
      "3:3:21080731:1"
    },
    monster_group_list = {50260125},
    map_id = 10709,
    buff_list = {46400002},
    open_condition = "70020100:38",
    back_effect = "FX_bosschallenge_fire_high.prefab"
  },
  [50140211] = {
    id = 50140211,
    name = function()
      return T(80220001, "01")
    end,
    next = {50140212},
    chapter_id = 50000921,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    drop_reward = {
      22040001,
      22040211,
      22040211,
      22040211,
      22040211
    },
    reward_show = {
      "3:3:21080411:1",
      "3:3:21080111:1"
    },
    monster_group_list = {50260211},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:15",
    back_effect = "FX_bosschallenge_wood_mid.prefab"
  },
  [50140212] = {
    id = 50140212,
    name = function()
      return T(80220001, "02")
    end,
    pre = 50140211,
    next = {50140213},
    chapter_id = 50000921,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040002,
      22040213,
      22040213,
      22040213,
      22040211,
      22040211
    },
    reward_show = {
      "3:3:21080421:1",
      "3:3:21080121:1",
      "3:3:21080411:1",
      "3:3:21080111:1"
    },
    monster_group_list = {50260212},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:20",
    back_effect = "FX_bosschallenge_wood_mid.prefab"
  },
  [50140213] = {
    id = 50140213,
    name = function()
      return T(80220001, "03")
    end,
    pre = 50140212,
    next = {50140214},
    chapter_id = 50000921,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040003,
      22040215,
      22040215,
      22040215,
      22040213,
      22040213
    },
    reward_show = {
      "3:3:21080431:1",
      "3:3:21080131:1",
      "3:3:21080421:1",
      "3:3:21080121:1",
      "3:3:21080411:1",
      "3:3:21080111:1"
    },
    monster_group_list = {50260213},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:26",
    back_effect = "FX_bosschallenge_wood_mid.prefab"
  },
  [50140214] = {
    id = 50140214,
    name = function()
      return T(80220001, "04")
    end,
    pre = 50140213,
    next = {50140215},
    chapter_id = 50000921,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040004,
      22040216,
      22040215,
      22040215,
      22040214,
      22040213,
      22040212
    },
    reward_show = {
      "3:3:21080441:1",
      "3:3:21080141:1",
      "3:3:21080431:1",
      "3:3:21080131:1",
      "3:3:21080421:1",
      "3:3:21080121:1",
      "3:3:21080411:1",
      "3:3:21080111:1"
    },
    monster_group_list = {50260214},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:32",
    back_effect = "FX_bosschallenge_wood_mid.prefab"
  },
  [50140215] = {
    id = 50140215,
    name = function()
      return T(80220001, "05")
    end,
    pre = 50140214,
    chapter_id = 50000921,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040005,
      22040216,
      22040216,
      22040215,
      22040215,
      22040215
    },
    reward_show = {
      "3:3:21080441:1",
      "3:3:21080141:1",
      "3:3:21080431:1",
      "3:3:21080131:1"
    },
    monster_group_list = {50260215},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:38",
    back_effect = "FX_bosschallenge_wood_mid.prefab"
  },
  [50140221] = {
    id = 50140221,
    name = function()
      return T(80220001, "01")
    end,
    next = {50140222},
    chapter_id = 50000922,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:10"
    },
    win_condition = "1",
    drop_reward = {
      22040001,
      22040221,
      22040221,
      22040221,
      22040221
    },
    reward_show = {
      "3:3:21080311:1",
      "3:3:21080511:1"
    },
    monster_group_list = {50260221},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:15",
    back_effect = "FX_bosschallenge_wood_high.prefab"
  },
  [50140222] = {
    id = 50140222,
    name = function()
      return T(80220001, "02")
    end,
    pre = 50140221,
    next = {50140223},
    chapter_id = 50000922,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040002,
      22040223,
      22040223,
      22040223,
      22040221,
      22040221
    },
    reward_show = {
      "3:3:21080321:1",
      "3:3:21080521:1",
      "3:3:21080311:1",
      "3:3:21080511:1"
    },
    monster_group_list = {50260222},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:20",
    back_effect = "FX_bosschallenge_wood_high.prefab"
  },
  [50140223] = {
    id = 50140223,
    name = function()
      return T(80220001, "03")
    end,
    pre = 50140222,
    next = {50140224},
    chapter_id = 50000922,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:15"
    },
    win_condition = "1",
    drop_reward = {
      22040003,
      22040225,
      22040225,
      22040225,
      22040223,
      22040223
    },
    reward_show = {
      "3:3:21080331:1",
      "3:3:21080531:1",
      "3:3:21080321:1",
      "3:3:21080521:1",
      "3:3:21080311:1",
      "3:3:21080511:1"
    },
    monster_group_list = {50260223},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:26",
    back_effect = "FX_bosschallenge_wood_high.prefab"
  },
  [50140224] = {
    id = 50140224,
    name = function()
      return T(80220001, "04")
    end,
    pre = 50140223,
    next = {50140225},
    chapter_id = 50000922,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040004,
      22040226,
      22040225,
      22040225,
      22040224,
      22040223,
      22040222
    },
    reward_show = {
      "3:3:21080341:1",
      "3:3:21080541:1",
      "3:3:21080331:1",
      "3:3:21080531:1",
      "3:3:21080321:1",
      "3:3:21080521:1",
      "3:3:21080311:1",
      "3:3:21080511:1"
    },
    monster_group_list = {50260224},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:32",
    back_effect = "FX_bosschallenge_wood_high.prefab"
  },
  [50140225] = {
    id = 50140225,
    name = function()
      return T(80220001, "05")
    end,
    pre = 50140224,
    chapter_id = 50000922,
    chapter_type = 43,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    cost = {
      "1:21000004:20"
    },
    win_condition = "1",
    drop_reward = {
      22040005,
      22040226,
      22040226,
      22040225,
      22040225,
      22040225
    },
    reward_show = {
      "3:3:21080341:1",
      "3:3:21080541:1",
      "3:3:21080331:1",
      "3:3:21080531:1"
    },
    monster_group_list = {50260225},
    map_id = 10703,
    buff_list = {46400003},
    open_condition = "70020100:38",
    back_effect = "FX_bosschallenge_wood_high.prefab"
  },
  [50160011] = {
    id = 50160011,
    next = {50160012},
    chapter_id = 50000801,
    chapter_type = 51,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50280001},
    map_id = 10611,
    limit_frame = 2700
  },
  [50160012] = {
    id = 50160012,
    pre = 50160011,
    chapter_id = 50000801,
    chapter_type = 51,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50280001},
    map_id = 10611,
    limit_frame = 5400
  },
  [50160021] = {
    id = 50160021,
    next = {50160022},
    chapter_id = 50000802,
    chapter_type = 52,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50280002},
    map_id = 10611,
    limit_frame = 2700
  },
  [50160022] = {
    id = 50160022,
    pre = 50160021,
    chapter_id = 50000802,
    chapter_type = 52,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50280002},
    map_id = 10611,
    limit_frame = 5400
  },
  [50160031] = {
    id = 50160031,
    next = {50160032},
    chapter_id = 50000803,
    chapter_type = 53,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50280003},
    map_id = 10611,
    limit_frame = 2700
  },
  [50160032] = {
    id = 50160032,
    pre = 50160031,
    chapter_id = 50000803,
    chapter_type = 53,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50280003},
    map_id = 10611,
    limit_frame = 5400
  },
  [50160041] = {
    id = 50160041,
    next = {50160042},
    chapter_id = 50000804,
    chapter_type = 54,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50280004},
    map_id = 10611,
    limit_frame = 2700
  },
  [50160042] = {
    id = 50160042,
    pre = 50160041,
    chapter_id = 50000804,
    chapter_type = 54,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50280004},
    map_id = 10611,
    limit_frame = 5400
  },
  [50170011] = {
    id = 50170011,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "01")
    end,
    next = {50170012},
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281001},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 1,
    rounds = 1
  },
  [50170012] = {
    id = 50170012,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "02")
    end,
    pre = 50170011,
    next = {50170013},
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281002},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 2,
    rounds = 1
  },
  [50170013] = {
    id = 50170013,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "03")
    end,
    pre = 50170012,
    next = {50170014},
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281003},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 3,
    rounds = 1
  },
  [50170014] = {
    id = 50170014,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "04")
    end,
    pre = 50170013,
    next = {50170015},
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281004},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 4,
    rounds = 1
  },
  [50170015] = {
    id = 50170015,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "05")
    end,
    pre = 50170014,
    next = {50170016},
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281005},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 5,
    rounds = 1
  },
  [50170016] = {
    id = 50170016,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "06")
    end,
    pre = 50170015,
    next = {50170017},
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281006},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 6,
    rounds = 1
  },
  [50170017] = {
    id = 50170017,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "07")
    end,
    pre = 50170016,
    next = {50170018},
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281007},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 7,
    rounds = 1
  },
  [50170018] = {
    id = 50170018,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "08")
    end,
    pre = 50170017,
    next = {50170019},
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281008},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 8,
    rounds = 1
  },
  [50170019] = {
    id = 50170019,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "09")
    end,
    pre = 50170018,
    chapter_id = 50003002,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50281009},
    map_id = 10710,
    limit_frame = 5400,
    difficulty_level = 9,
    rounds = 1
  },
  [50170021] = {
    id = 50170021,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "01")
    end,
    next = {50170022},
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281011},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 1,
    rounds = 1
  },
  [50170022] = {
    id = 50170022,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "02")
    end,
    pre = 50170021,
    next = {50170023},
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281012},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 2,
    rounds = 1
  },
  [50170023] = {
    id = 50170023,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "03")
    end,
    pre = 50170022,
    next = {50170024},
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281013},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 3,
    rounds = 1
  },
  [50170024] = {
    id = 50170024,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "04")
    end,
    pre = 50170023,
    next = {50170025},
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281014},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 4,
    rounds = 1
  },
  [50170025] = {
    id = 50170025,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "05")
    end,
    pre = 50170024,
    next = {50170026},
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281015},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 5,
    rounds = 1
  },
  [50170026] = {
    id = 50170026,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "06")
    end,
    pre = 50170025,
    next = {50170027},
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281016},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 6,
    rounds = 1
  },
  [50170027] = {
    id = 50170027,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "07")
    end,
    pre = 50170026,
    next = {50170028},
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281017},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 7,
    rounds = 1
  },
  [50170028] = {
    id = 50170028,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "08")
    end,
    pre = 50170027,
    next = {50170029},
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281018},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 8,
    rounds = 1
  },
  [50170029] = {
    id = 50170029,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "09")
    end,
    pre = 50170028,
    chapter_id = 50003001,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50281019},
    map_id = 10710,
    limit_frame = 5400,
    difficulty_level = 9,
    rounds = 1
  },
  [50170031] = {
    id = 50170031,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "01")
    end,
    next = {50170032},
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281011},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 1,
    rounds = 2
  },
  [50170032] = {
    id = 50170032,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "02")
    end,
    pre = 50170031,
    next = {50170033},
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281012},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 2,
    rounds = 2
  },
  [50170033] = {
    id = 50170033,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "03")
    end,
    pre = 50170032,
    next = {50170034},
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281013},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 3,
    rounds = 2
  },
  [50170034] = {
    id = 50170034,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "04")
    end,
    pre = 50170033,
    next = {50170035},
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281014},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 4,
    rounds = 2
  },
  [50170035] = {
    id = 50170035,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "05")
    end,
    pre = 50170034,
    next = {50170036},
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281015},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 5,
    rounds = 2
  },
  [50170036] = {
    id = 50170036,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "06")
    end,
    pre = 50170035,
    next = {50170037},
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281016},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 6,
    rounds = 2
  },
  [50170037] = {
    id = 50170037,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "07")
    end,
    pre = 50170036,
    next = {50170038},
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281017},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 7,
    rounds = 2
  },
  [50170038] = {
    id = 50170038,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "08")
    end,
    pre = 50170037,
    next = {50170039},
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281018},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 8,
    rounds = 2
  },
  [50170039] = {
    id = 50170039,
    name = function()
      return T(80223002)
    end,
    name_detail = function()
      return T(80220001, "09")
    end,
    pre = 50170038,
    chapter_id = 50003003,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50281019},
    map_id = 10710,
    limit_frame = 5400,
    difficulty_level = 9,
    rounds = 2
  },
  [50170041] = {
    id = 50170041,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "01")
    end,
    next = {50170042},
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281001},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 1,
    rounds = 2
  },
  [50170042] = {
    id = 50170042,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "02")
    end,
    pre = 50170041,
    next = {50170043},
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281002},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 2,
    rounds = 2
  },
  [50170043] = {
    id = 50170043,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "03")
    end,
    pre = 50170042,
    next = {50170044},
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281003},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 3,
    rounds = 2
  },
  [50170044] = {
    id = 50170044,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "04")
    end,
    pre = 50170043,
    next = {50170045},
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281004},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 4,
    rounds = 2
  },
  [50170045] = {
    id = 50170045,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "05")
    end,
    pre = 50170044,
    next = {50170046},
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281005},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 5,
    rounds = 2
  },
  [50170046] = {
    id = 50170046,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "06")
    end,
    pre = 50170045,
    next = {50170047},
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281006},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 6,
    rounds = 2
  },
  [50170047] = {
    id = 50170047,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "07")
    end,
    pre = 50170046,
    next = {50170048},
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281007},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 7,
    rounds = 2
  },
  [50170048] = {
    id = 50170048,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "08")
    end,
    pre = 50170047,
    next = {50170049},
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281008},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 8,
    rounds = 2
  },
  [50170049] = {
    id = 50170049,
    name = function()
      return T(80223001)
    end,
    name_detail = function()
      return T(80220001, "09")
    end,
    pre = 50170048,
    chapter_id = 50003004,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50281009},
    map_id = 10710,
    limit_frame = 5400,
    difficulty_level = 9,
    rounds = 2
  },
  [50170051] = {
    id = 50170051,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "01")
    end,
    next = {50170052},
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281021},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 1,
    rounds = 2
  },
  [50170052] = {
    id = 50170052,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "02")
    end,
    pre = 50170051,
    next = {50170053},
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281022},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 2,
    rounds = 2
  },
  [50170053] = {
    id = 50170053,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "03")
    end,
    pre = 50170052,
    next = {50170054},
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281023},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 3,
    rounds = 2
  },
  [50170054] = {
    id = 50170054,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "04")
    end,
    pre = 50170053,
    next = {50170055},
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281024},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 4,
    rounds = 2
  },
  [50170055] = {
    id = 50170055,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "05")
    end,
    pre = 50170054,
    next = {50170056},
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281025},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 5,
    rounds = 2
  },
  [50170056] = {
    id = 50170056,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "06")
    end,
    pre = 50170055,
    next = {50170057},
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:5",
      "1:21000001:50"
    },
    monster_group_list = {50281026},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 6,
    rounds = 2
  },
  [50170057] = {
    id = 50170057,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "07")
    end,
    pre = 50170056,
    next = {50170058},
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281027},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 7,
    rounds = 2
  },
  [50170058] = {
    id = 50170058,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "08")
    end,
    pre = 50170057,
    next = {50170059},
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000402:10",
      "1:21000001:50"
    },
    monster_group_list = {50281028},
    map_id = 10710,
    limit_frame = 3600,
    difficulty_level = 8,
    rounds = 2
  },
  [50170059] = {
    id = 50170059,
    name = function()
      return T(80223003)
    end,
    name_detail = function()
      return T(80220001, "09")
    end,
    pre = 50170058,
    chapter_id = 50003005,
    chapter_type = 7,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50281029},
    map_id = 10710,
    limit_frame = 5400,
    difficulty_level = 9,
    rounds = 2
  },
  [50180001] = {
    id = 50180001,
    name = function()
      return T(80224001)
    end,
    name_detail = function()
      return T(80224011)
    end,
    icon = "TideDungeon:Cover_1000",
    next = {50180002},
    chapter_id = 50001001,
    chapter_type = 61,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::56",
    first_reward = {
      "1:21000001:40",
      "1:21010103:20",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282001},
    map_id = 10610,
    buff_list = {46601001, 46601002},
    limit_frame = 3600,
    stat_type = 1
  },
  [50180002] = {
    id = 50180002,
    name = function()
      return T(80224002)
    end,
    name_detail = function()
      return T(80224012)
    end,
    icon = "TideDungeon:Cover_1001",
    pre = 50180001,
    next = {50180003},
    chapter_id = 50001001,
    chapter_type = 61,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::70",
    first_reward = {
      "1:21000001:40",
      "1:21010103:20",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282002},
    map_id = 10713,
    buff_list = {46601001, 46601002},
    limit_frame = 3600,
    stat_type = 1
  },
  [50180003] = {
    id = 50180003,
    name = function()
      return T(80224003)
    end,
    name_detail = function()
      return T(80224013)
    end,
    icon = "TideDungeon:Cover_1002",
    pre = 50180002,
    chapter_id = 50001001,
    chapter_type = 61,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::84",
    first_reward = {
      "1:21000001:40",
      "1:21010103:30",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282003},
    map_id = 10814,
    buff_list = {46601001, 46601002},
    limit_frame = 3600,
    stat_type = 1
  },
  [50180011] = {
    id = 50180011,
    name = function()
      return T(80224004)
    end,
    name_detail = function()
      return T(80224011)
    end,
    icon = "TideDungeon:Cover_2000",
    next = {50180012},
    chapter_id = 50001002,
    chapter_type = 62,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::56",
    first_reward = {
      "1:21000001:40",
      "1:21010103:20",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282011},
    map_id = 10606,
    buff_list = {46601003, 46601004},
    limit_frame = 3600,
    stat_type = 1
  },
  [50180012] = {
    id = 50180012,
    name = function()
      return T(80224005)
    end,
    name_detail = function()
      return T(80224012)
    end,
    icon = "TideDungeon:Cover_2001",
    pre = 50180011,
    next = {50180013},
    chapter_id = 50001002,
    chapter_type = 62,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::70",
    first_reward = {
      "1:21000001:40",
      "1:21010103:20",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282012},
    map_id = 10709,
    buff_list = {46601003, 46601004},
    limit_frame = 3600,
    stat_type = 1
  },
  [50180013] = {
    id = 50180013,
    name = function()
      return T(80224006)
    end,
    name_detail = function()
      return T(80224013)
    end,
    icon = "TideDungeon:Cover_2002",
    pre = 50180012,
    chapter_id = 50001002,
    chapter_type = 62,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::84",
    first_reward = {
      "1:21000001:40",
      "1:21010103:30",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282013},
    map_id = 10812,
    buff_list = {46601003, 46601004},
    limit_frame = 3600,
    stat_type = 1
  },
  [50180021] = {
    id = 50180021,
    name = function()
      return T(80224007)
    end,
    name_detail = function()
      return T(80224011)
    end,
    icon = "TideDungeon:Cover_3000",
    next = {50180022},
    chapter_id = 50001003,
    chapter_type = 63,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::56",
    first_reward = {
      "1:21000001:40",
      "1:21010103:20",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282021},
    map_id = 10603,
    buff_list = {46601005, 46601006},
    limit_frame = 3600,
    stat_type = 1
  },
  [50180022] = {
    id = 50180022,
    name = function()
      return T(80224008)
    end,
    name_detail = function()
      return T(80224012)
    end,
    icon = "TideDungeon:Cover_3001",
    pre = 50180021,
    next = {50180023},
    chapter_id = 50001003,
    chapter_type = 63,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::70",
    first_reward = {
      "1:21000001:40",
      "1:21010103:20",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282022},
    map_id = 10708,
    buff_list = {46601005, 46601006},
    limit_frame = 3600,
    stat_type = 1
  },
  [50180023] = {
    id = 50180023,
    name = function()
      return T(80224009)
    end,
    name_detail = function()
      return T(80224013)
    end,
    icon = "TideDungeon:Cover_3002",
    pre = 50180022,
    chapter_id = 50001003,
    chapter_type = 63,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::84",
    first_reward = {
      "1:21000001:40",
      "1:21010103:30",
      "1:21000003:25000"
    },
    reward_show = {
      "1:1:21000001:1",
      "1:1:21010103:1",
      "1:1:21000003:1"
    },
    monster_group_list = {50282023},
    map_id = 10807,
    buff_list = {46601005, 46601006},
    limit_frame = 3600,
    stat_type = 1
  },
  [50190001] = {
    id = 50190001,
    name = function()
      return T(80225001)
    end,
    name_detail = function()
      return T(80220001, "01")
    end,
    next = {50190002},
    chapter_id = 50004001,
    chapter_type = 8,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "4",
    monster_group_list = {50283001},
    map_id = 10807,
    buff_list = {46600000},
    buff_add = 46600001,
    buff_add_trigger_name = function()
      return T(80970013)
    end,
    buff_add_trigger_des = function()
      return T(80970014, 1.67, 80)
    end,
    buff_add_name = function()
      return T(80970015)
    end,
    recommend_card = {
      10000149,
      10000147,
      10000148,
      10000143,
      10000130,
      10000135,
      10000101
    },
    name_subtitle = function()
      return T(80225006)
    end,
    challenge_condition = {
      1001,
      1101,
      1102,
      1103
    },
    limit_frame = 5400,
    score_factor = {1001, 1002}
  },
  [50190002] = {
    id = 50190002,
    name = function()
      return T(80225002)
    end,
    name_detail = function()
      return T(80220001, "02")
    end,
    pre = 50190001,
    next = {50190003},
    chapter_id = 50004001,
    chapter_type = 8,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "4",
    monster_group_list = {50283002},
    map_id = 10807,
    buff_list = {46600000},
    buff_add = 46600001,
    buff_add_trigger_name = function()
      return T(80970013)
    end,
    buff_add_trigger_des = function()
      return T(80970014, 1.67, 80)
    end,
    buff_add_name = function()
      return T(80970015)
    end,
    recommend_card = {
      10000149,
      10000147,
      10000148,
      10000143,
      10000130,
      10000135,
      10000101
    },
    challenge_condition = {
      1002,
      1104,
      1105,
      1106
    },
    limit_frame = 5400,
    unlock_time = 86400,
    unlock_buff = {
      "46600001:15"
    },
    inherit_stage_id = 50190001,
    score_factor = {1003, 1004}
  },
  [50190003] = {
    id = 50190003,
    name = function()
      return T(80225003)
    end,
    name_detail = function()
      return T(80220001, "03")
    end,
    pre = 50190002,
    next = {50190004},
    chapter_id = 50004001,
    chapter_type = 8,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "4",
    monster_group_list = {50283003},
    map_id = 10807,
    buff_list = {46600000},
    buff_add = 46600002,
    buff_add_trigger_name = function()
      return T(80970023)
    end,
    buff_add_trigger_des = function()
      return T(80970024, 60, 2)
    end,
    buff_add_name = function()
      return T(80970025)
    end,
    recommend_card = {
      10000115,
      10000147,
      10000109,
      10000114,
      10000126,
      10000141,
      10000138,
      10000121,
      10000102,
      10000134
    },
    name_subtitle = function()
      return T(80225007)
    end,
    challenge_condition = {
      1003,
      1107,
      1108,
      1109
    },
    limit_frame = 5400,
    unlock_time = 172800,
    score_factor = {1005, 1006}
  },
  [50190004] = {
    id = 50190004,
    name = function()
      return T(80225004)
    end,
    name_detail = function()
      return T(80220001, "04")
    end,
    pre = 50190003,
    next = {50190005},
    chapter_id = 50004001,
    chapter_type = 8,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "4",
    monster_group_list = {50283004},
    map_id = 10807,
    buff_list = {46600000},
    buff_add = 46600002,
    buff_add_trigger_name = function()
      return T(80970023)
    end,
    buff_add_trigger_des = function()
      return T(80970024, 60, 2)
    end,
    buff_add_name = function()
      return T(80970025)
    end,
    recommend_card = {
      10000115,
      10000147,
      10000109,
      10000114,
      10000126,
      10000141,
      10000138,
      10000121,
      10000102,
      10000134
    },
    challenge_condition = {
      1004,
      1110,
      1111,
      1112
    },
    limit_frame = 5400,
    unlock_time = 259200,
    unlock_buff = {
      "46600002:10"
    },
    inherit_stage_id = 50190003,
    score_factor = {1007, 1008}
  },
  [50190005] = {
    id = 50190005,
    name = function()
      return T(80225005)
    end,
    name_detail = function()
      return T(80220001, "05")
    end,
    pre = 50190004,
    chapter_id = 50004001,
    chapter_type = 8,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "2::49",
    monster_group_list = {50283005},
    map_id = 10807,
    recommend_buff = {
      "46600001:15",
      "46600002:15"
    },
    name_subtitle = function()
      return T(80225008)
    end,
    challenge_condition = {
      1005,
      1113,
      1114,
      1115
    },
    limit_frame = 5400,
    unlock_time = 345600,
    unlock_buff = {
      "46600001:20",
      "46600002:15"
    },
    score_factor = {1009}
  },
  [50600001] = {
    id = 50600001,
    name = function()
      return T(80220000, 0, 1)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270001},
    map_id = 10505
  },
  [50600002] = {
    id = 50600002,
    name = function()
      return T(80220000, 0, 2)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270002},
    map_id = 10504
  },
  [50600003] = {
    id = 50600003,
    name = function()
      return T(80220000, 0, 3)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270003},
    map_id = 10506
  },
  [50600004] = {
    id = 50600004,
    name = function()
      return T(80220000, 0, 4)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270004},
    map_id = 10509
  },
  [50600005] = {
    id = 50600005,
    name = function()
      return T(80220000, 0, 5)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270005},
    map_id = 10505
  },
  [50600006] = {
    id = 50600006,
    name = function()
      return T(80220000, 0, 6)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270006},
    map_id = 10607
  },
  [50600101] = {
    id = 50600101,
    name = function()
      return T(80220000, 1, 1)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270101},
    map_id = 10810
  },
  [50600102] = {
    id = 50600102,
    name = function()
      return T(80220000, 1, 2)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270102},
    map_id = 10807
  },
  [50600103] = {
    id = 50600103,
    name = function()
      return T(80220000, 1, 3)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270103},
    map_id = 10814
  },
  [50600104] = {
    id = 50600104,
    name = function()
      return T(80220000, 1, 4)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270104},
    map_id = 10804
  },
  [50600105] = {
    id = 50600105,
    name = function()
      return T(80220000, 1, 5)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270105},
    map_id = 10803
  },
  [50600201] = {
    id = 50600201,
    name = function()
      return T(80220000, 2, 1)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270201},
    map_id = 10804
  },
  [50600202] = {
    id = 50600202,
    name = function()
      return T(80220000, 2, 2)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270202},
    map_id = 10802
  },
  [50600203] = {
    id = 50600203,
    name = function()
      return T(80220000, 2, 3)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270203},
    map_id = 10803
  },
  [50600204] = {
    id = 50600204,
    name = function()
      return T(80220000, 2, 4)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270204},
    map_id = 10808
  },
  [50600205] = {
    id = 50600205,
    name = function()
      return T(80220000, 2, 5)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270205},
    map_id = 10812
  },
  [50600301] = {
    id = 50600301,
    name = function()
      return T(80220000, 3, 1)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270301},
    map_id = 10809
  },
  [50600302] = {
    id = 50600302,
    name = function()
      return T(80220000, 3, 2)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270302},
    map_id = 10806
  },
  [50600303] = {
    id = 50600303,
    name = function()
      return T(80220000, 3, 3)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270303},
    map_id = 10807
  },
  [50600304] = {
    id = 50600304,
    name = function()
      return T(80220000, 3, 4)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270304},
    map_id = 10812
  },
  [50600305] = {
    id = 50600305,
    name = function()
      return T(80220000, 3, 5)
    end,
    des = function()
      return T(80220001)
    end,
    chapter_type = 31,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {50270305},
    map_id = 10804
  },
  [51100001] = {
    id = 51100001,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200001},
    map_id = 10708
  },
  [51100002] = {
    id = 51100002,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200002},
    map_id = 10702
  },
  [51100003] = {
    id = 51100003,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200003},
    map_id = 10703
  },
  [51100004] = {
    id = 51100004,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200004},
    map_id = 10710
  },
  [51100005] = {
    id = 51100005,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200005},
    map_id = 10710
  },
  [51100006] = {
    id = 51100006,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200006},
    map_id = 10705
  },
  [51100007] = {
    id = 51100007,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200007},
    map_id = 10709
  },
  [51100008] = {
    id = 51100008,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200008},
    map_id = 10709
  },
  [51100009] = {
    id = 51100009,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200009},
    map_id = 10807
  },
  [51100010] = {
    id = 51100010,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200010},
    map_id = 10806
  },
  [51100011] = {
    id = 51100011,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200011},
    map_id = 10812
  },
  [51100012] = {
    id = 51100012,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200012},
    map_id = 10806
  },
  [51100013] = {
    id = 51100013,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200013},
    map_id = 10806
  },
  [51100014] = {
    id = 51100014,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200014},
    map_id = 10809
  },
  [51100015] = {
    id = 51100015,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200015},
    map_id = 10805
  },
  [51100016] = {
    id = 51100016,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200016},
    map_id = 10802
  },
  [51100017] = {
    id = 51100017,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200017},
    map_id = 10814
  },
  [51100018] = {
    id = 51100018,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200018},
    map_id = 10810
  },
  [51100019] = {
    id = 51100019,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200019},
    map_id = 10811
  },
  [51100020] = {
    id = 51100020,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200020},
    map_id = 10804
  },
  [51100021] = {
    id = 51100021,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200021},
    map_id = 10813
  },
  [51100022] = {
    id = 51100022,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200022},
    map_id = 10817
  },
  [51100023] = {
    id = 51100023,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200023},
    map_id = 10818
  },
  [51100024] = {
    id = 51100024,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200024},
    map_id = 10812
  },
  [51100025] = {
    id = 51100025,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200025},
    map_id = 10803
  },
  [51100026] = {
    id = 51100026,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200026},
    map_id = 10808
  },
  [51100027] = {
    id = 51100027,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200027},
    map_id = 10807
  },
  [51100111] = {
    id = 51100111,
    name = function()
      return T(80227111)
    end,
    des = function()
      return T(80226111)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200111},
    map_id = 10603
  },
  [51100112] = {
    id = 51100112,
    name = function()
      return T(80227112)
    end,
    des = function()
      return T(80226112)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200112},
    map_id = 10602
  },
  [51100113] = {
    id = 51100113,
    name = function()
      return T(80227113)
    end,
    des = function()
      return T(80226113)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200113},
    map_id = 10601
  },
  [51100121] = {
    id = 51100121,
    name = function()
      return T(80227121)
    end,
    des = function()
      return T(80226121)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200121},
    map_id = 10705
  },
  [51100122] = {
    id = 51100122,
    name = function()
      return T(80227122)
    end,
    des = function()
      return T(80226122)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200122},
    map_id = 10717
  },
  [51100123] = {
    id = 51100123,
    name = function()
      return T(80227123)
    end,
    des = function()
      return T(80226123)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200123},
    map_id = 10704
  },
  [51100124] = {
    id = 51100124,
    name = function()
      return T(80227124)
    end,
    des = function()
      return T(80226124)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200124},
    map_id = 10708
  },
  [51100131] = {
    id = 51100131,
    name = function()
      return T(80227131)
    end,
    des = function()
      return T(80226131)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200131},
    map_id = 10809
  },
  [51100132] = {
    id = 51100132,
    name = function()
      return T(80227132)
    end,
    des = function()
      return T(80226132)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200132},
    map_id = 10812
  },
  [51100133] = {
    id = 51100133,
    name = function()
      return T(80227133)
    end,
    des = function()
      return T(80226133)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200133},
    map_id = 10814
  },
  [51100134] = {
    id = 51100134,
    name = function()
      return T(80227134)
    end,
    des = function()
      return T(80226134)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200134},
    map_id = 10811
  },
  [51100135] = {
    id = 51100135,
    name = function()
      return T(80227135)
    end,
    des = function()
      return T(80226135)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200135},
    map_id = 10806
  },
  [51100141] = {
    id = 51100141,
    name = function()
      return T(80227141)
    end,
    des = function()
      return T(80226141)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200141},
    map_id = 10817
  },
  [51100142] = {
    id = 51100142,
    name = function()
      return T(80227142)
    end,
    des = function()
      return T(80226142)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200142},
    map_id = 10813
  },
  [51100143] = {
    id = 51100143,
    name = function()
      return T(80227143)
    end,
    des = function()
      return T(80226143)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200143},
    map_id = 10811
  },
  [51100144] = {
    id = 51100144,
    name = function()
      return T(80227144)
    end,
    des = function()
      return T(80226144)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200144},
    map_id = 10809
  },
  [51100145] = {
    id = 51100145,
    name = function()
      return T(80227145)
    end,
    des = function()
      return T(80226145)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200145},
    map_id = 10812
  },
  [51100146] = {
    id = 51100146,
    name = function()
      return T(80227146)
    end,
    des = function()
      return T(80226146)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200146},
    map_id = 10818
  },
  [51100147] = {
    id = 51100147,
    name = function()
      return T(80227147)
    end,
    des = function()
      return T(80226147)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200147},
    map_id = 10804
  },
  [51100148] = {
    id = 51100148,
    name = function()
      return T(80227148)
    end,
    des = function()
      return T(80226148)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200148},
    map_id = 10807
  },
  [51100151] = {
    id = 51100151,
    name = function()
      return T(80227151)
    end,
    des = function()
      return T(80226151)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200151},
    map_id = 10710
  },
  [51100211] = {
    id = 51100211,
    name = function()
      return T(80227211)
    end,
    des = function()
      return T(80226211)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200211},
    map_id = 10717,
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100221] = {
    id = 51100221,
    name = function()
      return T(80227221)
    end,
    des = function()
      return T(80226221)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200221},
    map_id = 10802,
    buff_list = {46604001},
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100222] = {
    id = 51100222,
    name = function()
      return T(80227222)
    end,
    des = function()
      return T(80226222)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200222},
    map_id = 10817,
    buff_list = {46604002},
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100231] = {
    id = 51100231,
    name = function()
      return T(80227231)
    end,
    des = function()
      return T(80226231)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200231},
    map_id = 10806,
    buff_list = {46604003},
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100232] = {
    id = 51100232,
    name = function()
      return T(80227232)
    end,
    des = function()
      return T(80226232)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200232},
    map_id = 10809,
    buff_list = {46604004},
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100241] = {
    id = 51100241,
    name = function()
      return T(80227241)
    end,
    des = function()
      return T(80226241)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200241},
    map_id = 10714,
    buff_list = {46604005},
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100251] = {
    id = 51100251,
    name = function()
      return T(80227251)
    end,
    des = function()
      return T(80226251)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200251},
    map_id = 10804,
    buff_list = {46604006},
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100252] = {
    id = 51100252,
    name = function()
      return T(80227252)
    end,
    des = function()
      return T(80226252)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200252},
    map_id = 10807,
    buff_list = {46604007},
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100253] = {
    id = 51100253,
    name = function()
      return T(80227253)
    end,
    des = function()
      return T(80226253)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200253},
    map_id = 10818,
    buff_list = {46604008},
    rogue_difficulty_field = "encounter_monster_attribute"
  },
  [51100311] = {
    id = 51100311,
    name = function()
      return T(80227311)
    end,
    des = function()
      return T(80226311)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200311},
    map_id = 10703
  },
  [51100312] = {
    id = 51100312,
    name = function()
      return T(80227312)
    end,
    des = function()
      return T(80226312)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200312},
    map_id = 10707
  },
  [51100321] = {
    id = 51100321,
    name = function()
      return T(80227321)
    end,
    des = function()
      return T(80226321)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200321},
    map_id = 10705
  },
  [51100322] = {
    id = 51100322,
    name = function()
      return T(80227322)
    end,
    des = function()
      return T(80226322)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200322},
    map_id = 10708
  },
  [51100331] = {
    id = 51100331,
    name = function()
      return T(80227331)
    end,
    des = function()
      return T(80226331)
    end,
    chapter_type = 9,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51200331},
    map_id = 10711
  },
  [50501101] = {
    id = 50501101,
    name = function()
      return T(80226001)
    end,
    name_detail = function()
      return T(80226001)
    end,
    des = function()
      return T(80232001)
    end,
    next = {50501102},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20100,
    name_subtitle = function()
      return T(80220001, "N01")
    end
  },
  [50501102] = {
    id = 50501102,
    name = function()
      return T(80226002)
    end,
    name_detail = function()
      return T(80226002)
    end,
    des = function()
      return T(80232002)
    end,
    pre = 50501101,
    next = {50501103},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290001},
    map_id = 10502,
    name_subtitle = function()
      return T(80220001, "N02")
    end
  },
  [50501103] = {
    id = 50501103,
    name = function()
      return T(80226003)
    end,
    name_detail = function()
      return T(80226003)
    end,
    des = function()
      return T(80232003)
    end,
    pre = 50501102,
    next = {50501104},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290002},
    map_id = 10503,
    name_subtitle = function()
      return T(80220001, "N03")
    end
  },
  [50501104] = {
    id = 50501104,
    name = function()
      return T(80226004)
    end,
    name_detail = function()
      return T(80226004)
    end,
    des = function()
      return T(80232004)
    end,
    pre = 50501103,
    next = {50501105},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20101,
    name_subtitle = function()
      return T(80220001, "N04")
    end
  },
  [50501105] = {
    id = 50501105,
    name = function()
      return T(80226005)
    end,
    name_detail = function()
      return T(80226005)
    end,
    des = function()
      return T(80232005)
    end,
    pre = 50501104,
    next = {50501106},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290003},
    map_id = 10503,
    name_subtitle = function()
      return T(80220001, "N05")
    end
  },
  [50501106] = {
    id = 50501106,
    name = function()
      return T(80226006)
    end,
    name_detail = function()
      return T(80226006)
    end,
    des = function()
      return T(80232006)
    end,
    pre = 50501105,
    next = {50501107},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290004},
    map_id = 10508,
    name_subtitle = function()
      return T(80220001, "N06")
    end
  },
  [50501107] = {
    id = 50501107,
    name = function()
      return T(80226007)
    end,
    name_detail = function()
      return T(80226007)
    end,
    des = function()
      return T(80232007)
    end,
    pre = 50501106,
    next = {50501108},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20102,
    name_subtitle = function()
      return T(80220001, "N07")
    end
  },
  [50501108] = {
    id = 50501108,
    name = function()
      return T(80226008)
    end,
    name_detail = function()
      return T(80226008)
    end,
    des = function()
      return T(80232008)
    end,
    pre = 50501107,
    next = {50501109},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290005},
    map_id = 10508,
    name_subtitle = function()
      return T(80220001, "N08")
    end
  },
  [50501109] = {
    id = 50501109,
    name = function()
      return T(80226009)
    end,
    name_detail = function()
      return T(80226009)
    end,
    des = function()
      return T(80232009)
    end,
    pre = 50501108,
    next = {50501110},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290006},
    map_id = 10504,
    name_subtitle = function()
      return T(80220001, "N09")
    end
  },
  [50501110] = {
    id = 50501110,
    name = function()
      return T(80226010)
    end,
    name_detail = function()
      return T(80226010)
    end,
    des = function()
      return T(80232010)
    end,
    pre = 50501109,
    next = {50501111},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20104,
    name_subtitle = function()
      return T(80220001, "N10")
    end
  },
  [50501111] = {
    id = 50501111,
    name = function()
      return T(80226011)
    end,
    name_detail = function()
      return T(80226011)
    end,
    des = function()
      return T(80232011)
    end,
    pre = 50501110,
    next = {50501112},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290007},
    map_id = 10604,
    name_subtitle = function()
      return T(80220001, "N11")
    end
  },
  [50501112] = {
    id = 50501112,
    name = function()
      return T(80226012)
    end,
    name_detail = function()
      return T(80226012)
    end,
    des = function()
      return T(80232012)
    end,
    pre = 50501111,
    next = {50501113},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290008},
    map_id = 10610,
    name_subtitle = function()
      return T(80220001, "N12")
    end
  },
  [50501113] = {
    id = 50501113,
    name = function()
      return T(80226013)
    end,
    name_detail = function()
      return T(80226013)
    end,
    des = function()
      return T(80232013)
    end,
    pre = 50501112,
    next = {50501114},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20106,
    name_subtitle = function()
      return T(80220001, "N13")
    end
  },
  [50501114] = {
    id = 50501114,
    name = function()
      return T(80226014)
    end,
    name_detail = function()
      return T(80226014)
    end,
    des = function()
      return T(80232014)
    end,
    pre = 50501113,
    next = {50501115},
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290009},
    map_id = 10610,
    name_subtitle = function()
      return T(80220001, "N14")
    end
  },
  [50501115] = {
    id = 50501115,
    name = function()
      return T(80226015)
    end,
    name_detail = function()
      return T(80226015)
    end,
    des = function()
      return T(80232015)
    end,
    pre = 50501114,
    chapter_id = 50010101,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290010},
    map_id = 10610,
    name_subtitle = function()
      return T(80220001, "N15")
    end
  },
  [50501201] = {
    id = 50501201,
    name = function()
      return T(80226016)
    end,
    name_detail = function()
      return T(80226016)
    end,
    des = function()
      return T(80232016)
    end,
    next = {50501202},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290011},
    map_id = 10605,
    name_subtitle = function()
      return T(80220001, "H01")
    end
  },
  [50501202] = {
    id = 50501202,
    name = function()
      return T(80226017)
    end,
    name_detail = function()
      return T(80226017)
    end,
    des = function()
      return T(80232017)
    end,
    pre = 50501201,
    next = {50501203},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20108,
    name_subtitle = function()
      return T(80220001, "H02")
    end
  },
  [50501203] = {
    id = 50501203,
    name = function()
      return T(80226018)
    end,
    name_detail = function()
      return T(80226018)
    end,
    des = function()
      return T(80232018)
    end,
    pre = 50501202,
    next = {50501204},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290012},
    map_id = 10705,
    name_subtitle = function()
      return T(80220001, "H03")
    end
  },
  [50501204] = {
    id = 50501204,
    name = function()
      return T(80226019)
    end,
    name_detail = function()
      return T(80226019)
    end,
    des = function()
      return T(80232019)
    end,
    pre = 50501203,
    next = {50501205},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290013},
    map_id = 10707,
    name_subtitle = function()
      return T(80220001, "H04")
    end
  },
  [50501205] = {
    id = 50501205,
    name = function()
      return T(80226020)
    end,
    name_detail = function()
      return T(80226020)
    end,
    des = function()
      return T(80232020)
    end,
    pre = 50501204,
    next = {50501206},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290014},
    map_id = 10707,
    name_subtitle = function()
      return T(80220001, "H05")
    end
  },
  [50501206] = {
    id = 50501206,
    name = function()
      return T(80226021)
    end,
    name_detail = function()
      return T(80226021)
    end,
    des = function()
      return T(80232021)
    end,
    pre = 50501205,
    next = {50501207},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20110,
    name_subtitle = function()
      return T(80220001, "H06")
    end
  },
  [50501207] = {
    id = 50501207,
    name = function()
      return T(80226022)
    end,
    name_detail = function()
      return T(80226022)
    end,
    des = function()
      return T(80232022)
    end,
    pre = 50501206,
    next = {50501208},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290015},
    map_id = 10707,
    name_subtitle = function()
      return T(80220001, "H07")
    end
  },
  [50501208] = {
    id = 50501208,
    name = function()
      return T(80226023)
    end,
    name_detail = function()
      return T(80226023)
    end,
    des = function()
      return T(80232023)
    end,
    pre = 50501207,
    next = {50501209},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290016},
    map_id = 10720,
    name_subtitle = function()
      return T(80220001, "H08")
    end
  },
  [50501209] = {
    id = 50501209,
    name = function()
      return T(80226024)
    end,
    name_detail = function()
      return T(80226024)
    end,
    des = function()
      return T(80232024)
    end,
    pre = 50501208,
    next = {50501210},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290017},
    map_id = 10720,
    name_subtitle = function()
      return T(80220001, "H09")
    end
  },
  [50501210] = {
    id = 50501210,
    name = function()
      return T(80226025)
    end,
    name_detail = function()
      return T(80226025)
    end,
    des = function()
      return T(80232025)
    end,
    pre = 50501209,
    next = {50501211},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20112,
    name_subtitle = function()
      return T(80220001, "H10")
    end
  },
  [50501211] = {
    id = 50501211,
    name = function()
      return T(80226026)
    end,
    name_detail = function()
      return T(80226026)
    end,
    des = function()
      return T(80232026)
    end,
    pre = 50501210,
    next = {50501212},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290018},
    map_id = 10820,
    name_subtitle = function()
      return T(80220001, "H11")
    end
  },
  [50501212] = {
    id = 50501212,
    name = function()
      return T(80226027)
    end,
    name_detail = function()
      return T(80226027)
    end,
    des = function()
      return T(80232027)
    end,
    pre = 50501211,
    next = {50501213},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290019},
    map_id = 10821,
    name_subtitle = function()
      return T(80220001, "H12")
    end
  },
  [50501213] = {
    id = 50501213,
    name = function()
      return T(80226028)
    end,
    name_detail = function()
      return T(80226028)
    end,
    des = function()
      return T(80232028)
    end,
    pre = 50501212,
    next = {50501214},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290020},
    map_id = 10821,
    name_subtitle = function()
      return T(80220001, "H13")
    end
  },
  [50501214] = {
    id = 50501214,
    name = function()
      return T(80226029)
    end,
    name_detail = function()
      return T(80226029)
    end,
    des = function()
      return T(80232029)
    end,
    pre = 50501213,
    next = {50501215},
    chapter_id = 50010102,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20114,
    name_subtitle = function()
      return T(80220001, "H14")
    end
  },
  [50501215] = {
    id = 50501215,
    name = function()
      return T(80226030)
    end,
    name_detail = function()
      return T(80226030)
    end,
    des = function()
      return T(80232030)
    end,
    pre = 50501214,
    chapter_id = 50010102,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001001:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290021},
    map_id = 10821,
    name_subtitle = function()
      return T(80220001, "H15")
    end
  },
  [50501401] = {
    id = 50501401,
    name = function()
      return T(80226031)
    end,
    name_detail = function()
      return T(80226031)
    end,
    des = function()
      return T(80232031)
    end,
    icon = "ItemIcon:gold3",
    chapter_id = 50010104,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060001},
    reward_show = {
      "2:1:21000003:1",
      "2:1:21001001:1"
    },
    monster_group_list = {50290022},
    map_id = 10620,
    name_subtitle = function()
      return T(80220001, "MC01")
    end
  },
  [50501402] = {
    id = 50501402,
    name = function()
      return T(80226032)
    end,
    name_detail = function()
      return T(80226032)
    end,
    des = function()
      return T(80232032)
    end,
    icon = "ItemIcon:exp2",
    chapter_id = 50010104,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060002},
    reward_show = {
      "2:1:21010001:1",
      "2:1:21001001:1"
    },
    monster_group_list = {50290023},
    map_id = 10620,
    name_subtitle = function()
      return T(80220001, "MC02")
    end
  },
  [50501403] = {
    id = 50501403,
    name = function()
      return T(80226033)
    end,
    name_detail = function()
      return T(80226033)
    end,
    des = function()
      return T(80232033)
    end,
    icon = "ItemIcon:21040002",
    chapter_id = 50010104,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060003},
    reward_show = {
      "2:1:21040002:1",
      "2:1:21001001:1"
    },
    monster_group_list = {50290024},
    map_id = 10620,
    buff_list = {46300011},
    name_subtitle = function()
      return T(80220001, "MC03")
    end
  },
  [50501404] = {
    id = 50501404,
    name = function()
      return T(80226034)
    end,
    name_detail = function()
      return T(80226034)
    end,
    des = function()
      return T(80232034)
    end,
    icon = "ItemIcon:21010102",
    chapter_id = 50010104,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060004},
    reward_show = {
      "2:1:21010102:1",
      "2:1:21001001:1"
    },
    monster_group_list = {50290025},
    map_id = 10720,
    buff_list = {46400001},
    name_subtitle = function()
      return T(80220001, "MC04")
    end
  },
  [50501501] = {
    id = 50501501,
    name = function()
      return T(80226036)
    end,
    name_detail = function()
      return T(80226036)
    end,
    des = function()
      return T(80232036)
    end,
    next = {50501502},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:300",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290026},
    map_id = 10821,
    buff_list = {46605001},
    name_subtitle = function()
      return T(80220022, "01")
    end
  },
  [50501502] = {
    id = 50501502,
    name = function()
      return T(80226037)
    end,
    name_detail = function()
      return T(80226037)
    end,
    des = function()
      return T(80232037)
    end,
    pre = 50501501,
    next = {50501503},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:300",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290027},
    map_id = 10821,
    buff_list = {46605001},
    name_subtitle = function()
      return T(80220022, "02")
    end,
    unlock_time = 86400
  },
  [50501503] = {
    id = 50501503,
    name = function()
      return T(80226038)
    end,
    name_detail = function()
      return T(80226038)
    end,
    des = function()
      return T(80232038)
    end,
    pre = 50501502,
    next = {50501504},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:300",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290028},
    map_id = 10821,
    buff_list = {46605001},
    name_subtitle = function()
      return T(80220022, "03")
    end,
    unlock_time = 172800
  },
  [50501504] = {
    id = 50501504,
    name = function()
      return T(80226039)
    end,
    name_detail = function()
      return T(80226039)
    end,
    des = function()
      return T(80232039)
    end,
    pre = 50501503,
    next = {50501505},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:400",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290029},
    map_id = 10821,
    buff_list = {46605001},
    name_subtitle = function()
      return T(80220022, "04")
    end,
    unlock_time = 259200
  },
  [50501505] = {
    id = 50501505,
    name = function()
      return T(80226040)
    end,
    name_detail = function()
      return T(80226040)
    end,
    des = function()
      return T(80232040)
    end,
    pre = 50501504,
    next = {50501506},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:400",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290030},
    map_id = 10821,
    buff_list = {46605001},
    name_subtitle = function()
      return T(80220022, "05")
    end,
    unlock_time = 345600
  },
  [50501506] = {
    id = 50501506,
    name = function()
      return T(80226041)
    end,
    name_detail = function()
      return T(80226041)
    end,
    des = function()
      return T(80232041)
    end,
    pre = 50501505,
    next = {50501507},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:400",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290031},
    map_id = 10821,
    buff_list = {46605002},
    name_subtitle = function()
      return T(80220022, "06")
    end,
    unlock_time = 432000
  },
  [50501507] = {
    id = 50501507,
    name = function()
      return T(80226042)
    end,
    name_detail = function()
      return T(80226042)
    end,
    des = function()
      return T(80232042)
    end,
    pre = 50501506,
    next = {50501508},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:500",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290032},
    map_id = 10821,
    buff_list = {46605002},
    name_subtitle = function()
      return T(80220022, "07")
    end,
    unlock_time = 518400
  },
  [50501508] = {
    id = 50501508,
    name = function()
      return T(80226043)
    end,
    name_detail = function()
      return T(80226043)
    end,
    des = function()
      return T(80232043)
    end,
    pre = 50501507,
    next = {50501509},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:500",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290033},
    map_id = 10821,
    buff_list = {46605002},
    name_subtitle = function()
      return T(80220022, "08")
    end,
    unlock_time = 604800
  },
  [50501509] = {
    id = 50501509,
    name = function()
      return T(80226044)
    end,
    name_detail = function()
      return T(80226044)
    end,
    des = function()
      return T(80232044)
    end,
    pre = 50501508,
    next = {50501510},
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:500",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290034},
    map_id = 10821,
    buff_list = {46605002},
    name_subtitle = function()
      return T(80220022, "09")
    end,
    unlock_time = 691200
  },
  [50501510] = {
    id = 50501510,
    name = function()
      return T(80226045)
    end,
    name_detail = function()
      return T(80226045)
    end,
    des = function()
      return T(80232045)
    end,
    pre = 50501509,
    chapter_id = 50010105,
    chapter_type = 23,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001001:600",
      "1:21090058:2"
    },
    reward_show = {
      "1:1:21001001:1",
      "1:1:21000001:1",
      "1:1:21090058:1"
    },
    monster_group_list = {50290035},
    map_id = 10821,
    buff_list = {46605003},
    name_subtitle = function()
      return T(80220022, "10")
    end,
    unlock_time = 777600
  },
  [50501601] = {
    id = 50501601,
    name = function()
      return T(80280001)
    end,
    name_detail = function()
      return T(80280001)
    end,
    des = function()
      return T(80232046)
    end,
    next = {50501602},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20201,
    name_subtitle = function()
      return T(80220001, "N01")
    end
  },
  [50501602] = {
    id = 50501602,
    name = function()
      return T(80280002)
    end,
    name_detail = function()
      return T(80280002)
    end,
    des = function()
      return T(80232047)
    end,
    pre = 50501601,
    next = {50501603},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290001},
    map_id = 10526,
    name_subtitle = function()
      return T(80220001, "N02")
    end
  },
  [50501603] = {
    id = 50501603,
    name = function()
      return T(80280003)
    end,
    name_detail = function()
      return T(80280003)
    end,
    des = function()
      return T(80232048)
    end,
    pre = 50501602,
    next = {50501604},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290002},
    map_id = 10526,
    name_subtitle = function()
      return T(80220001, "N03")
    end
  },
  [50501604] = {
    id = 50501604,
    name = function()
      return T(80280004)
    end,
    name_detail = function()
      return T(80280004)
    end,
    des = function()
      return T(80232049)
    end,
    pre = 50501603,
    next = {50501605},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20202,
    name_subtitle = function()
      return T(80220001, "N04")
    end
  },
  [50501605] = {
    id = 50501605,
    name = function()
      return T(80280005)
    end,
    name_detail = function()
      return T(80280005)
    end,
    des = function()
      return T(80232050)
    end,
    pre = 50501604,
    next = {50501606},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290003},
    map_id = 10505,
    name_subtitle = function()
      return T(80220001, "N05")
    end
  },
  [50501606] = {
    id = 50501606,
    name = function()
      return T(80280006)
    end,
    name_detail = function()
      return T(80280006)
    end,
    des = function()
      return T(80232051)
    end,
    pre = 50501605,
    next = {50501607},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290004},
    map_id = 10505,
    name_subtitle = function()
      return T(80220001, "N06")
    end
  },
  [50501607] = {
    id = 50501607,
    name = function()
      return T(80280007)
    end,
    name_detail = function()
      return T(80280007)
    end,
    des = function()
      return T(80232052)
    end,
    pre = 50501606,
    next = {50501608},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20203,
    name_subtitle = function()
      return T(80220001, "N07")
    end
  },
  [50501608] = {
    id = 50501608,
    name = function()
      return T(80280008)
    end,
    name_detail = function()
      return T(80280008)
    end,
    des = function()
      return T(80232053)
    end,
    pre = 50501607,
    next = {50501609},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290005},
    map_id = 10504,
    name_subtitle = function()
      return T(80220001, "N08")
    end
  },
  [50501609] = {
    id = 50501609,
    name = function()
      return T(80280009)
    end,
    name_detail = function()
      return T(80280009)
    end,
    des = function()
      return T(80232054)
    end,
    pre = 50501608,
    next = {50501610},
    chapter_id = 50010106,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290006},
    map_id = 10504,
    name_subtitle = function()
      return T(80220001, "N09")
    end
  },
  [50501610] = {
    id = 50501610,
    name = function()
      return T(80280010)
    end,
    name_detail = function()
      return T(80280010)
    end,
    des = function()
      return T(80232055)
    end,
    pre = 50501609,
    chapter_id = 50010106,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20204,
    name_subtitle = function()
      return T(80220001, "N10")
    end
  },
  [50501701] = {
    id = 50501701,
    name = function()
      return T(80280011)
    end,
    name_detail = function()
      return T(80280011)
    end,
    des = function()
      return T(80232056)
    end,
    next = {50501702},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20205,
    name_subtitle = function()
      return T(80220001, "H01")
    end
  },
  [50501702] = {
    id = 50501702,
    name = function()
      return T(80280012)
    end,
    name_detail = function()
      return T(80280012)
    end,
    des = function()
      return T(80232057)
    end,
    pre = 50501701,
    next = {50501703},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290007},
    map_id = 10608,
    name_subtitle = function()
      return T(80220001, "H02")
    end
  },
  [50501703] = {
    id = 50501703,
    name = function()
      return T(80280013)
    end,
    name_detail = function()
      return T(80280013)
    end,
    des = function()
      return T(80232058)
    end,
    pre = 50501702,
    next = {50501704},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290008},
    map_id = 10608,
    name_subtitle = function()
      return T(80220001, "H03")
    end
  },
  [50501704] = {
    id = 50501704,
    name = function()
      return T(80280014)
    end,
    name_detail = function()
      return T(80280014)
    end,
    des = function()
      return T(80232059)
    end,
    pre = 50501703,
    next = {50501705},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20206,
    name_subtitle = function()
      return T(80220001, "H04")
    end
  },
  [50501705] = {
    id = 50501705,
    name = function()
      return T(80280015)
    end,
    name_detail = function()
      return T(80280015)
    end,
    des = function()
      return T(80232060)
    end,
    pre = 50501704,
    next = {50501706},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290009},
    map_id = 10626,
    name_subtitle = function()
      return T(80220001, "H05")
    end
  },
  [50501706] = {
    id = 50501706,
    name = function()
      return T(80280016)
    end,
    name_detail = function()
      return T(80280016)
    end,
    des = function()
      return T(80232061)
    end,
    pre = 50501705,
    next = {50501707},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290010},
    map_id = 10626,
    name_subtitle = function()
      return T(80220001, "H06")
    end
  },
  [50501707] = {
    id = 50501707,
    name = function()
      return T(80280017)
    end,
    name_detail = function()
      return T(80280017)
    end,
    des = function()
      return T(80232062)
    end,
    pre = 50501706,
    next = {50501708},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20207,
    name_subtitle = function()
      return T(80220001, "H07")
    end
  },
  [50501708] = {
    id = 50501708,
    name = function()
      return T(80280018)
    end,
    name_detail = function()
      return T(80280018)
    end,
    des = function()
      return T(80232063)
    end,
    pre = 50501707,
    next = {50501709},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290012},
    map_id = 10721,
    name_subtitle = function()
      return T(80220001, "H08")
    end
  },
  [50501709] = {
    id = 50501709,
    name = function()
      return T(80280019)
    end,
    name_detail = function()
      return T(80280019)
    end,
    des = function()
      return T(80232064)
    end,
    pre = 50501708,
    next = {50501710},
    chapter_id = 50010107,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290013},
    map_id = 10721,
    name_subtitle = function()
      return T(80220001, "H09")
    end
  },
  [50501710] = {
    id = 50501710,
    name = function()
      return T(80280020)
    end,
    name_detail = function()
      return T(80280020)
    end,
    des = function()
      return T(80232065)
    end,
    pre = 50501709,
    chapter_id = 50010107,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20208,
    name_subtitle = function()
      return T(80220001, "H10")
    end
  },
  [50501801] = {
    id = 50501801,
    name = function()
      return T(80280021)
    end,
    name_detail = function()
      return T(80280021)
    end,
    des = function()
      return T(80232066)
    end,
    next = {50501802},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290015},
    map_id = 10709,
    name_subtitle = function()
      return T(80220001, "H01")
    end
  },
  [50501802] = {
    id = 50501802,
    name = function()
      return T(80280022)
    end,
    name_detail = function()
      return T(80280022)
    end,
    des = function()
      return T(80232067)
    end,
    pre = 50501801,
    next = {50501803},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290016},
    map_id = 10709,
    name_subtitle = function()
      return T(80220001, "H02")
    end
  },
  [50501803] = {
    id = 50501803,
    name = function()
      return T(80280023)
    end,
    name_detail = function()
      return T(80280023)
    end,
    des = function()
      return T(80232068)
    end,
    pre = 50501802,
    next = {50501804},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290017},
    map_id = 10709,
    name_subtitle = function()
      return T(80220001, "H03")
    end
  },
  [50501804] = {
    id = 50501804,
    name = function()
      return T(80280024)
    end,
    name_detail = function()
      return T(80280024)
    end,
    des = function()
      return T(80232069)
    end,
    pre = 50501803,
    next = {50501805},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20209,
    name_subtitle = function()
      return T(80220001, "H04")
    end
  },
  [50501805] = {
    id = 50501805,
    name = function()
      return T(80280025)
    end,
    name_detail = function()
      return T(80280025)
    end,
    des = function()
      return T(80232070)
    end,
    pre = 50501804,
    next = {50501806},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290018},
    map_id = 10706,
    name_subtitle = function()
      return T(80220001, "H05")
    end
  },
  [50501806] = {
    id = 50501806,
    name = function()
      return T(80280026)
    end,
    name_detail = function()
      return T(80280026)
    end,
    des = function()
      return T(80232071)
    end,
    pre = 50501805,
    next = {50501807},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290019},
    map_id = 10706,
    name_subtitle = function()
      return T(80220001, "H06")
    end
  },
  [50501807] = {
    id = 50501807,
    name = function()
      return T(80280027)
    end,
    name_detail = function()
      return T(80280027)
    end,
    des = function()
      return T(80232072)
    end,
    pre = 50501806,
    next = {50501808},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20210,
    name_subtitle = function()
      return T(80220001, "H07")
    end
  },
  [50501808] = {
    id = 50501808,
    name = function()
      return T(80280028)
    end,
    name_detail = function()
      return T(80280028)
    end,
    des = function()
      return T(80232073)
    end,
    pre = 50501807,
    next = {50501809},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290020},
    map_id = 10726,
    name_subtitle = function()
      return T(80220001, "H08")
    end
  },
  [50501809] = {
    id = 50501809,
    name = function()
      return T(80280029)
    end,
    name_detail = function()
      return T(80280029)
    end,
    des = function()
      return T(80232074)
    end,
    pre = 50501808,
    next = {50501810},
    chapter_id = 50010108,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290021},
    map_id = 10726,
    name_subtitle = function()
      return T(80220001, "H09")
    end
  },
  [50501810] = {
    id = 50501810,
    name = function()
      return T(80280030)
    end,
    name_detail = function()
      return T(80280030)
    end,
    des = function()
      return T(80232075)
    end,
    pre = 50501809,
    chapter_id = 50010108,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001002:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20211,
    name_subtitle = function()
      return T(80220001, "H10")
    end
  },
  [50501901] = {
    id = 50501901,
    name = function()
      return T(80280031)
    end,
    name_detail = function()
      return T(80280031)
    end,
    des = function()
      return T(80232076)
    end,
    icon = "ItemIcon:gold3",
    chapter_id = 50010109,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060011},
    reward_show = {
      "1:1:21000003:1",
      "1:1:21001002:1"
    },
    monster_group_list = {50290022},
    map_id = 10605,
    name_subtitle = function()
      return T(80220001, "MC01")
    end
  },
  [50501902] = {
    id = 50501902,
    name = function()
      return T(80280032)
    end,
    name_detail = function()
      return T(80280032)
    end,
    des = function()
      return T(80232077)
    end,
    icon = "ItemIcon:exp2",
    chapter_id = 50010109,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060012},
    reward_show = {
      "1:1:21010001:1",
      "1:1:21001002:1"
    },
    monster_group_list = {50290023},
    map_id = 10605,
    name_subtitle = function()
      return T(80220001, "MC02")
    end
  },
  [50501903] = {
    id = 50501903,
    name = function()
      return T(80280033)
    end,
    name_detail = function()
      return T(80280033)
    end,
    des = function()
      return T(80232078)
    end,
    icon = "ItemIcon:21040002",
    chapter_id = 50010109,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060013},
    reward_show = {
      "1:1:21040002:1",
      "1:1:21001002:1"
    },
    monster_group_list = {50290024},
    map_id = 10605,
    buff_list = {46300011},
    name_subtitle = function()
      return T(80220001, "MC03")
    end
  },
  [50501904] = {
    id = 50501904,
    name = function()
      return T(80280034)
    end,
    name_detail = function()
      return T(80280034)
    end,
    des = function()
      return T(80232079)
    end,
    icon = "ItemIcon:21010102",
    chapter_id = 50010109,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060014},
    reward_show = {
      "1:1:21010102:1",
      "1:1:21001002:1"
    },
    monster_group_list = {50290025},
    map_id = 10705,
    buff_list = {46400001},
    name_subtitle = function()
      return T(80220001, "MC04")
    end
  },
  [50502001] = {
    id = 50502001,
    name = function()
      return T(80220001, "01")
    end,
    name_detail = function()
      return T(80280035)
    end,
    des = function()
      return T(80232080)
    end,
    next = {50502002},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:300",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290036},
    map_id = 10826,
    buff_list = {46605004},
    name_subtitle = function()
      return T(80220022, "01")
    end
  },
  [50502002] = {
    id = 50502002,
    name = function()
      return T(80220001, "02")
    end,
    name_detail = function()
      return T(80280036)
    end,
    des = function()
      return T(80232081)
    end,
    pre = 50502001,
    next = {50502003},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:300",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290037},
    map_id = 10826,
    buff_list = {46605004},
    name_subtitle = function()
      return T(80220022, "02")
    end,
    unlock_time = 68400
  },
  [50502003] = {
    id = 50502003,
    name = function()
      return T(80220001, "03")
    end,
    name_detail = function()
      return T(80280037)
    end,
    des = function()
      return T(80232082)
    end,
    pre = 50502002,
    next = {50502004},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:300",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290038},
    map_id = 10826,
    buff_list = {46605004},
    name_subtitle = function()
      return T(80220022, "03")
    end,
    unlock_time = 154800
  },
  [50502004] = {
    id = 50502004,
    name = function()
      return T(80220001, "04")
    end,
    name_detail = function()
      return T(80280038)
    end,
    des = function()
      return T(80232083)
    end,
    pre = 50502003,
    next = {50502005},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:400",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290039},
    map_id = 10826,
    buff_list = {46605004},
    name_subtitle = function()
      return T(80220022, "04")
    end,
    unlock_time = 241200
  },
  [50502005] = {
    id = 50502005,
    name = function()
      return T(80220001, "05")
    end,
    name_detail = function()
      return T(80280039)
    end,
    des = function()
      return T(80232084)
    end,
    pre = 50502004,
    next = {50502006},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:400",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290040},
    map_id = 10826,
    buff_list = {46605004},
    name_subtitle = function()
      return T(80220022, "05")
    end,
    unlock_time = 327600
  },
  [50502006] = {
    id = 50502006,
    name = function()
      return T(80220001, "06")
    end,
    name_detail = function()
      return T(80280040)
    end,
    des = function()
      return T(80232085)
    end,
    pre = 50502005,
    next = {50502007},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:400",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290041},
    map_id = 10826,
    buff_list = {46605005},
    name_subtitle = function()
      return T(80220022, "06")
    end,
    unlock_time = 414000
  },
  [50502007] = {
    id = 50502007,
    name = function()
      return T(80220001, "07")
    end,
    name_detail = function()
      return T(80280041)
    end,
    des = function()
      return T(80232086)
    end,
    pre = 50502006,
    next = {50502008},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:500",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290042},
    map_id = 10826,
    buff_list = {46605005},
    name_subtitle = function()
      return T(80220022, "07")
    end,
    unlock_time = 500400
  },
  [50502008] = {
    id = 50502008,
    name = function()
      return T(80220001, "08")
    end,
    name_detail = function()
      return T(80280042)
    end,
    des = function()
      return T(80232087)
    end,
    pre = 50502007,
    next = {50502009},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:500",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290043},
    map_id = 10826,
    buff_list = {46605005},
    name_subtitle = function()
      return T(80220022, "08")
    end,
    unlock_time = 586800
  },
  [50502009] = {
    id = 50502009,
    name = function()
      return T(80220001, "09")
    end,
    name_detail = function()
      return T(80280043)
    end,
    des = function()
      return T(80232088)
    end,
    pre = 50502008,
    next = {50502010},
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:500",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290044},
    map_id = 10826,
    buff_list = {46605005},
    name_subtitle = function()
      return T(80220022, "09")
    end,
    unlock_time = 673200
  },
  [50502010] = {
    id = 50502010,
    name = function()
      return T(80220001, "10")
    end,
    name_detail = function()
      return T(80280044)
    end,
    des = function()
      return T(80232089)
    end,
    pre = 50502009,
    chapter_id = 50010110,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001002:600",
      "1:21090009:2"
    },
    reward_show = {
      "1:1:21001002:1",
      "1:1:21000001:1",
      "1:1:21090009:1"
    },
    monster_group_list = {50290045},
    map_id = 10826,
    buff_list = {46605006},
    name_subtitle = function()
      return T(80220022, "10")
    end,
    unlock_time = 759600
  },
  [50502101] = {
    id = 50502101,
    name = function()
      return T(80280045)
    end,
    name_detail = function()
      return T(80280045)
    end,
    des = function()
      return T(80232090)
    end,
    next = {50502102},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20301,
    name_subtitle = function()
      return T(80220001, "N01")
    end
  },
  [50502102] = {
    id = 50502102,
    name = function()
      return T(80280046)
    end,
    name_detail = function()
      return T(80280046)
    end,
    des = function()
      return T(80232091)
    end,
    pre = 50502101,
    next = {50502103},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290046},
    map_id = 10502,
    name_subtitle = function()
      return T(80220001, "N02")
    end
  },
  [50502103] = {
    id = 50502103,
    name = function()
      return T(80280047)
    end,
    name_detail = function()
      return T(80280047)
    end,
    des = function()
      return T(80232092)
    end,
    pre = 50502102,
    next = {50502104},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290047},
    map_id = 10503,
    name_subtitle = function()
      return T(80220001, "N03")
    end
  },
  [50502104] = {
    id = 50502104,
    name = function()
      return T(80280048)
    end,
    name_detail = function()
      return T(80280048)
    end,
    des = function()
      return T(80232093)
    end,
    pre = 50502103,
    next = {50502105},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20302,
    name_subtitle = function()
      return T(80220001, "N04")
    end
  },
  [50502105] = {
    id = 50502105,
    name = function()
      return T(80280049)
    end,
    name_detail = function()
      return T(80280049)
    end,
    des = function()
      return T(80232094)
    end,
    pre = 50502104,
    next = {50502106},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290048},
    map_id = 10603,
    name_subtitle = function()
      return T(80220001, "N05")
    end
  },
  [50502106] = {
    id = 50502106,
    name = function()
      return T(80280050)
    end,
    name_detail = function()
      return T(80280050)
    end,
    des = function()
      return T(80232095)
    end,
    pre = 50502105,
    next = {50502107},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290049},
    map_id = 10622,
    name_subtitle = function()
      return T(80220001, "N06")
    end
  },
  [50502107] = {
    id = 50502107,
    name = function()
      return T(80280051)
    end,
    name_detail = function()
      return T(80280051)
    end,
    des = function()
      return T(80232096)
    end,
    pre = 50502106,
    next = {50502108},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20303,
    name_subtitle = function()
      return T(80220001, "N07")
    end
  },
  [50502108] = {
    id = 50502108,
    name = function()
      return T(80280052)
    end,
    name_detail = function()
      return T(80280052)
    end,
    des = function()
      return T(80232097)
    end,
    pre = 50502107,
    next = {50502109},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290050},
    map_id = 10622,
    name_subtitle = function()
      return T(80220001, "N08")
    end
  },
  [50502109] = {
    id = 50502109,
    name = function()
      return T(80280053)
    end,
    name_detail = function()
      return T(80280053)
    end,
    des = function()
      return T(80232098)
    end,
    pre = 50502108,
    next = {50502110},
    chapter_id = 50010111,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290051},
    map_id = 10615,
    name_subtitle = function()
      return T(80220001, "N09")
    end
  },
  [50502110] = {
    id = 50502110,
    name = function()
      return T(80280054)
    end,
    name_detail = function()
      return T(80280054)
    end,
    des = function()
      return T(80232099)
    end,
    pre = 50502109,
    chapter_id = 50010111,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:50",
      "1:21000003:1000",
      "1:21010001:1000"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20304,
    name_subtitle = function()
      return T(80220001, "N10")
    end
  },
  [50502201] = {
    id = 50502201,
    name = function()
      return T(80280055)
    end,
    name_detail = function()
      return T(80280055)
    end,
    des = function()
      return T(80232100)
    end,
    next = {50502202},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20305,
    name_subtitle = function()
      return T(80220001, "H01")
    end
  },
  [50502202] = {
    id = 50502202,
    name = function()
      return T(80280056)
    end,
    name_detail = function()
      return T(80280056)
    end,
    des = function()
      return T(80232101)
    end,
    pre = 50502201,
    next = {50502203},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290052},
    map_id = 10715,
    name_subtitle = function()
      return T(80220001, "H02")
    end
  },
  [50502203] = {
    id = 50502203,
    name = function()
      return T(80280057)
    end,
    name_detail = function()
      return T(80280057)
    end,
    des = function()
      return T(80232102)
    end,
    pre = 50502202,
    next = {50502204},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290053},
    map_id = 10710,
    name_subtitle = function()
      return T(80220001, "H03")
    end
  },
  [50502204] = {
    id = 50502204,
    name = function()
      return T(80280058)
    end,
    name_detail = function()
      return T(80280058)
    end,
    des = function()
      return T(80232103)
    end,
    pre = 50502203,
    next = {50502205},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20306,
    name_subtitle = function()
      return T(80220001, "H04")
    end
  },
  [50502205] = {
    id = 50502205,
    name = function()
      return T(80280059)
    end,
    name_detail = function()
      return T(80280059)
    end,
    des = function()
      return T(80232104)
    end,
    pre = 50502204,
    next = {50502206},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:70",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290054},
    map_id = 10710,
    name_subtitle = function()
      return T(80220001, "H05")
    end
  },
  [50502206] = {
    id = 50502206,
    name = function()
      return T(80280060)
    end,
    name_detail = function()
      return T(80280060)
    end,
    des = function()
      return T(80232105)
    end,
    pre = 50502205,
    next = {50502207},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290055},
    map_id = 10707,
    name_subtitle = function()
      return T(80220001, "H06")
    end
  },
  [50502207] = {
    id = 50502207,
    name = function()
      return T(80280061)
    end,
    name_detail = function()
      return T(80280061)
    end,
    des = function()
      return T(80232106)
    end,
    pre = 50502206,
    next = {50502208},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20307,
    name_subtitle = function()
      return T(80220001, "H07")
    end
  },
  [50502208] = {
    id = 50502208,
    name = function()
      return T(80280062)
    end,
    name_detail = function()
      return T(80280062)
    end,
    des = function()
      return T(80232107)
    end,
    pre = 50502207,
    next = {50502209},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290056},
    map_id = 10807,
    name_subtitle = function()
      return T(80220001, "H08")
    end
  },
  [50502209] = {
    id = 50502209,
    name = function()
      return T(80280063)
    end,
    name_detail = function()
      return T(80280063)
    end,
    des = function()
      return T(80232108)
    end,
    pre = 50502208,
    next = {50502210},
    chapter_id = 50010112,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290057},
    map_id = 10804,
    name_subtitle = function()
      return T(80220001, "H09")
    end
  },
  [50502210] = {
    id = 50502210,
    name = function()
      return T(80280064)
    end,
    name_detail = function()
      return T(80280064)
    end,
    des = function()
      return T(80232109)
    end,
    pre = 50502209,
    chapter_id = 50010112,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:80",
      "1:21000003:1250",
      "1:21010001:1250"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20308,
    name_subtitle = function()
      return T(80220001, "H10")
    end
  },
  [50502301] = {
    id = 50502301,
    name = function()
      return T(80280065)
    end,
    name_detail = function()
      return T(80280065)
    end,
    des = function()
      return T(80232110)
    end,
    next = {50502302},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20309,
    name_subtitle = function()
      return T(80220001, "H01")
    end
  },
  [50502302] = {
    id = 50502302,
    name = function()
      return T(80280066)
    end,
    name_detail = function()
      return T(80280066)
    end,
    des = function()
      return T(80232111)
    end,
    pre = 50502301,
    next = {50502303},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290058},
    map_id = 10804,
    name_subtitle = function()
      return T(80220001, "H02")
    end
  },
  [50502303] = {
    id = 50502303,
    name = function()
      return T(80280067)
    end,
    name_detail = function()
      return T(80280067)
    end,
    des = function()
      return T(80232112)
    end,
    pre = 50502302,
    next = {50502304},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290059},
    map_id = 10814,
    name_subtitle = function()
      return T(80220001, "H03")
    end
  },
  [50502304] = {
    id = 50502304,
    name = function()
      return T(80280068)
    end,
    name_detail = function()
      return T(80280068)
    end,
    des = function()
      return T(80232113)
    end,
    pre = 50502303,
    next = {50502305},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20310,
    name_subtitle = function()
      return T(80220001, "H04")
    end
  },
  [50502305] = {
    id = 50502305,
    name = function()
      return T(80280069)
    end,
    name_detail = function()
      return T(80280069)
    end,
    des = function()
      return T(80232114)
    end,
    pre = 50502304,
    next = {50502306},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290060},
    map_id = 10814,
    name_subtitle = function()
      return T(80220001, "H05")
    end
  },
  [50502306] = {
    id = 50502306,
    name = function()
      return T(80280070)
    end,
    name_detail = function()
      return T(80280070)
    end,
    des = function()
      return T(80232115)
    end,
    pre = 50502305,
    next = {50502307},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290061},
    map_id = 10812,
    name_subtitle = function()
      return T(80220001, "H06")
    end
  },
  [50502307] = {
    id = 50502307,
    name = function()
      return T(80280071)
    end,
    name_detail = function()
      return T(80280071)
    end,
    des = function()
      return T(80232116)
    end,
    pre = 50502306,
    next = {50502308},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20311,
    name_subtitle = function()
      return T(80220001, "H07")
    end
  },
  [50502308] = {
    id = 50502308,
    name = function()
      return T(80280072)
    end,
    name_detail = function()
      return T(80280072)
    end,
    des = function()
      return T(80232117)
    end,
    pre = 50502307,
    next = {50502309},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290062},
    map_id = 10812,
    name_subtitle = function()
      return T(80220001, "H08")
    end
  },
  [50502309] = {
    id = 50502309,
    name = function()
      return T(80280073)
    end,
    name_detail = function()
      return T(80280073)
    end,
    des = function()
      return T(80232118)
    end,
    pre = 50502308,
    next = {50502310},
    chapter_id = 50010113,
    chapter_type = 21,
    type = 1,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    monster_group_list = {50290063},
    map_id = 10812,
    name_subtitle = function()
      return T(80220001, "H09")
    end
  },
  [50502310] = {
    id = 50502310,
    name = function()
      return T(80280074)
    end,
    name_detail = function()
      return T(80280074)
    end,
    des = function()
      return T(80232119)
    end,
    pre = 50502309,
    chapter_id = 50010113,
    chapter_type = 21,
    type = 3,
    sweep_type = 0,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21001003:100",
      "1:21000003:1500",
      "1:21010001:1500"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000003:1",
      "1:1:21010001:1"
    },
    story_id = 20312,
    name_subtitle = function()
      return T(80220001, "H10")
    end
  },
  [50502401] = {
    id = 50502401,
    name = function()
      return T(80280075)
    end,
    name_detail = function()
      return T(80280075)
    end,
    des = function()
      return T(80232120)
    end,
    icon = "ItemIcon:gold3",
    chapter_id = 50010114,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060021},
    reward_show = {
      "1:1:21000003:1",
      "1:1:21001003:1"
    },
    monster_group_list = {50290022},
    map_id = 10610,
    name_subtitle = function()
      return T(80220001, "MC01")
    end
  },
  [50502402] = {
    id = 50502402,
    name = function()
      return T(80280076)
    end,
    name_detail = function()
      return T(80280076)
    end,
    des = function()
      return T(80232121)
    end,
    icon = "ItemIcon:exp2",
    chapter_id = 50010114,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060022},
    reward_show = {
      "1:1:21010001:1",
      "1:1:21001003:1"
    },
    monster_group_list = {50290023},
    map_id = 10610,
    name_subtitle = function()
      return T(80220001, "MC02")
    end
  },
  [50502403] = {
    id = 50502403,
    name = function()
      return T(80280077)
    end,
    name_detail = function()
      return T(80280077)
    end,
    des = function()
      return T(80232122)
    end,
    icon = "ItemIcon:21040002",
    chapter_id = 50010114,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060023},
    reward_show = {
      "1:1:21040002:1",
      "1:1:21001003:1"
    },
    monster_group_list = {50290024},
    map_id = 10610,
    buff_list = {46300011},
    name_subtitle = function()
      return T(80220001, "MC03")
    end
  },
  [50502404] = {
    id = 50502404,
    name = function()
      return T(80280078)
    end,
    name_detail = function()
      return T(80280078)
    end,
    des = function()
      return T(80232123)
    end,
    icon = "ItemIcon:21010102",
    chapter_id = 50010114,
    chapter_type = 22,
    type = 1,
    sweep_type = 1,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    drop_reward = {22060024},
    reward_show = {
      "1:1:21010102:1",
      "1:1:21001003:1"
    },
    monster_group_list = {50290025},
    map_id = 10710,
    buff_list = {46400001},
    name_subtitle = function()
      return T(80220001, "MC04")
    end
  },
  [50502501] = {
    id = 50502501,
    name = function()
      return T(80220001, "Ⅰ")
    end,
    name_detail = function()
      return T(80280079)
    end,
    des = function()
      return T(80232124)
    end,
    next = {50502502},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:300",
      "1:21090012:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090012:1"
    },
    monster_group_list = {50290064},
    map_id = 10812,
    buff_list = {46605007},
    name_subtitle = function()
      return T(80220022, "01")
    end
  },
  [50502502] = {
    id = 50502502,
    name = function()
      return T(80220001, "Ⅱ")
    end,
    name_detail = function()
      return T(80280080)
    end,
    des = function()
      return T(80232125)
    end,
    pre = 50502501,
    next = {50502503},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:300",
      "1:21090015:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090015:1"
    },
    monster_group_list = {50290065},
    map_id = 10812,
    buff_list = {46605007},
    name_subtitle = function()
      return T(80220022, "02")
    end,
    unlock_time = 68400
  },
  [50502503] = {
    id = 50502503,
    name = function()
      return T(80220001, "Ⅲ")
    end,
    name_detail = function()
      return T(80280081)
    end,
    des = function()
      return T(80232126)
    end,
    pre = 50502502,
    next = {50502504},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:300",
      "1:21090012:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090012:1"
    },
    monster_group_list = {50290066},
    map_id = 10812,
    buff_list = {46605007},
    name_subtitle = function()
      return T(80220022, "03")
    end,
    unlock_time = 154800
  },
  [50502504] = {
    id = 50502504,
    name = function()
      return T(80220001, "Ⅳ")
    end,
    name_detail = function()
      return T(80280082)
    end,
    des = function()
      return T(80232127)
    end,
    pre = 50502503,
    next = {50502505},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:400",
      "1:21090015:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090015:1"
    },
    monster_group_list = {50290067},
    map_id = 10812,
    buff_list = {46605007},
    name_subtitle = function()
      return T(80220022, "04")
    end,
    unlock_time = 241200
  },
  [50502505] = {
    id = 50502505,
    name = function()
      return T(80220001, "Ⅴ")
    end,
    name_detail = function()
      return T(80280083)
    end,
    des = function()
      return T(80232128)
    end,
    pre = 50502504,
    next = {50502506},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:400",
      "1:21090012:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090012:1"
    },
    monster_group_list = {50290068},
    map_id = 10812,
    buff_list = {46605007},
    name_subtitle = function()
      return T(80220022, "05")
    end,
    unlock_time = 327600
  },
  [50502506] = {
    id = 50502506,
    name = function()
      return T(80220001, "Ⅵ")
    end,
    name_detail = function()
      return T(80280084)
    end,
    des = function()
      return T(80232129)
    end,
    pre = 50502505,
    next = {50502507},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:400",
      "1:21090015:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090015:1"
    },
    monster_group_list = {50290069},
    map_id = 10812,
    buff_list = {46605008},
    name_subtitle = function()
      return T(80220022, "06")
    end,
    unlock_time = 414000
  },
  [50502507] = {
    id = 50502507,
    name = function()
      return T(80220001, "Ⅶ")
    end,
    name_detail = function()
      return T(80280085)
    end,
    des = function()
      return T(80232130)
    end,
    pre = 50502506,
    next = {50502508},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:500",
      "1:21090012:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090012:1"
    },
    monster_group_list = {50290070},
    map_id = 10812,
    buff_list = {46605008},
    name_subtitle = function()
      return T(80220022, "07")
    end,
    unlock_time = 500400
  },
  [50502508] = {
    id = 50502508,
    name = function()
      return T(80220001, "Ⅷ")
    end,
    name_detail = function()
      return T(80280086)
    end,
    des = function()
      return T(80232131)
    end,
    pre = 50502507,
    next = {50502509},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:500",
      "1:21090015:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090015:1"
    },
    monster_group_list = {50290071},
    map_id = 10812,
    buff_list = {46605008},
    name_subtitle = function()
      return T(80220022, "08")
    end,
    unlock_time = 586800
  },
  [50502509] = {
    id = 50502509,
    name = function()
      return T(80220001, "Ⅸ")
    end,
    name_detail = function()
      return T(80280087)
    end,
    des = function()
      return T(80232132)
    end,
    pre = 50502508,
    next = {50502510},
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:500",
      "1:21090012:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090012:1"
    },
    monster_group_list = {50290072},
    map_id = 10812,
    buff_list = {46605008},
    name_subtitle = function()
      return T(80220022, "09")
    end,
    unlock_time = 673200
  },
  [50502510] = {
    id = 50502510,
    name = function()
      return T(80220001, "Ⅹ")
    end,
    name_detail = function()
      return T(80280088)
    end,
    des = function()
      return T(80232133)
    end,
    pre = 50502509,
    chapter_id = 50010115,
    chapter_type = 23,
    type = 1,
    sweep_type = 1,
    challenge_num = 1,
    challenge_reset = 0,
    win_condition = "1",
    first_reward = {
      "1:21000001:50",
      "1:21001003:600",
      "1:21090015:2"
    },
    reward_show = {
      "1:1:21001003:1",
      "1:1:21000001:1",
      "1:1:21090015:1"
    },
    monster_group_list = {50290073},
    map_id = 10812,
    buff_list = {46605009},
    name_subtitle = function()
      return T(80220022, "10")
    end,
    unlock_time = 759600
  },
  [51501011] = {
    id = 51501011,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    next = {51501012},
    chapter_id = 50020101,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600101},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52010101,
    boss_score_ratio = 10000
  },
  [51501012] = {
    id = 51501012,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51501011,
    next = {51501013},
    chapter_id = 50020101,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600102},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52010201,
    boss_score_ratio = 10000
  },
  [51501013] = {
    id = 51501013,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51501012,
    next = {51501014},
    chapter_id = 50020101,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600103},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52010301,
    boss_score_ratio = 10000,
    share_hp_count = 5
  },
  [51501014] = {
    id = 51501014,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51501013,
    next = {51501015},
    chapter_id = 50020101,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600104},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52010401,
    boss_score_ratio = 10000,
    share_hp_count = 4
  },
  [51501015] = {
    id = 51501015,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51501014,
    chapter_id = 50020101,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600105},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52010501,
    boss_score_ratio = 10000
  },
  [51501021] = {
    id = 51501021,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51501015,
    next = {51501022},
    chapter_id = 50020102,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600106},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52010601,
    boss_score_ratio = 15000
  },
  [51501022] = {
    id = 51501022,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51501021,
    next = {51501023},
    chapter_id = 50020102,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600107},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52010701,
    boss_score_ratio = 15000
  },
  [51501023] = {
    id = 51501023,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51501022,
    next = {51501024},
    chapter_id = 50020102,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600108},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52010801,
    boss_score_ratio = 15000,
    share_hp_count = 5
  },
  [51501024] = {
    id = 51501024,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51501023,
    next = {51501025},
    chapter_id = 50020102,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600109},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52010901,
    boss_score_ratio = 15000,
    share_hp_count = 4
  },
  [51501025] = {
    id = 51501025,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51501024,
    chapter_id = 50020102,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600110},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52011001,
    boss_score_ratio = 15000
  },
  [51501031] = {
    id = 51501031,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51501025,
    next = {51501032},
    chapter_id = 50020103,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600111},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52011101,
    boss_score_ratio = 20000
  },
  [51501032] = {
    id = 51501032,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51501031,
    next = {51501033},
    chapter_id = 50020103,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600112},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52011201,
    boss_score_ratio = 20000
  },
  [51501033] = {
    id = 51501033,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51501032,
    next = {51501034},
    chapter_id = 50020103,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600113},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52011301,
    boss_score_ratio = 20000,
    share_hp_count = 5
  },
  [51501034] = {
    id = 51501034,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51501033,
    next = {51501035},
    chapter_id = 50020103,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600114},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52011401,
    boss_score_ratio = 20000,
    share_hp_count = 4
  },
  [51501035] = {
    id = 51501035,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51501034,
    chapter_id = 50020103,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600115},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52011501,
    boss_score_ratio = 20000
  },
  [51501041] = {
    id = 51501041,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51501035,
    next = {51501042},
    chapter_id = 50020104,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600116},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52010101,
    boss_score_ratio = 25000
  },
  [51501042] = {
    id = 51501042,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51501041,
    next = {51501043},
    chapter_id = 50020104,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600117},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52010201,
    boss_score_ratio = 25000
  },
  [51501043] = {
    id = 51501043,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51501042,
    next = {51501044},
    chapter_id = 50020104,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600118},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52010301,
    boss_score_ratio = 25000,
    share_hp_count = 5
  },
  [51501044] = {
    id = 51501044,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51501043,
    next = {51501045},
    chapter_id = 50020104,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600119},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52010401,
    boss_score_ratio = 25000,
    share_hp_count = 4
  },
  [51501045] = {
    id = 51501045,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51501044,
    chapter_id = 50020104,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600120},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52010501,
    boss_score_ratio = 25000
  },
  [51501051] = {
    id = 51501051,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51501045,
    next = {51501052},
    chapter_id = 50020105,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600121},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52010601,
    boss_score_ratio = 30000
  },
  [51501052] = {
    id = 51501052,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51501051,
    next = {51501053},
    chapter_id = 50020105,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600122},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52010701,
    boss_score_ratio = 30000
  },
  [51501053] = {
    id = 51501053,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51501052,
    next = {51501054},
    chapter_id = 50020105,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600123},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52010801,
    boss_score_ratio = 30000,
    share_hp_count = 5
  },
  [51501054] = {
    id = 51501054,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51501053,
    next = {51501055},
    chapter_id = 50020105,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600124},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52010901,
    boss_score_ratio = 30000,
    share_hp_count = 4
  },
  [51501055] = {
    id = 51501055,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51501054,
    chapter_id = 50020105,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600125},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52011001,
    boss_score_ratio = 30000
  },
  [51501061] = {
    id = 51501061,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51501055,
    next = {51501062},
    chapter_id = 50020106,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600126},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52011101,
    boss_score_ratio = 35000
  },
  [51501062] = {
    id = 51501062,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51501061,
    next = {51501063},
    chapter_id = 50020106,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600127},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52011201,
    boss_score_ratio = 35000
  },
  [51501063] = {
    id = 51501063,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51501062,
    next = {51501064},
    chapter_id = 50020106,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600128},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52011301,
    boss_score_ratio = 35000,
    share_hp_count = 5
  },
  [51501064] = {
    id = 51501064,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51501063,
    next = {51501065},
    chapter_id = 50020106,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600129},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52011401,
    boss_score_ratio = 35000,
    share_hp_count = 4
  },
  [51501065] = {
    id = 51501065,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51501064,
    chapter_id = 50020106,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600130},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52011501,
    boss_score_ratio = 35000
  },
  [51502011] = {
    id = 51502011,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    next = {51502012},
    chapter_id = 50020201,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600101},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52010101,
    boss_score_ratio = 10000
  },
  [51502012] = {
    id = 51502012,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51502011,
    next = {51502013},
    chapter_id = 50020201,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600102},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52010201,
    boss_score_ratio = 10000
  },
  [51502013] = {
    id = 51502013,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51502012,
    next = {51502014},
    chapter_id = 50020201,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600103},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52010301,
    boss_score_ratio = 10000,
    share_hp_count = 5
  },
  [51502014] = {
    id = 51502014,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51502013,
    next = {51502015},
    chapter_id = 50020201,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600104},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52010401,
    boss_score_ratio = 10000,
    share_hp_count = 4
  },
  [51502015] = {
    id = 51502015,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51502014,
    chapter_id = 50020201,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600105},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52010501,
    boss_score_ratio = 10000
  },
  [51502021] = {
    id = 51502021,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51502015,
    next = {51502022},
    chapter_id = 50020202,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600106},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52010601,
    boss_score_ratio = 15000
  },
  [51502022] = {
    id = 51502022,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51502021,
    next = {51502023},
    chapter_id = 50020202,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600107},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52010701,
    boss_score_ratio = 15000
  },
  [51502023] = {
    id = 51502023,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51502022,
    next = {51502024},
    chapter_id = 50020202,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600108},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52010801,
    boss_score_ratio = 15000,
    share_hp_count = 5
  },
  [51502024] = {
    id = 51502024,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51502023,
    next = {51502025},
    chapter_id = 50020202,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600109},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52010901,
    boss_score_ratio = 15000,
    share_hp_count = 4
  },
  [51502025] = {
    id = 51502025,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51502024,
    chapter_id = 50020202,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600110},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52011001,
    boss_score_ratio = 15000
  },
  [51502031] = {
    id = 51502031,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51502025,
    next = {51502032},
    chapter_id = 50020203,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600111},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52011101,
    boss_score_ratio = 20000
  },
  [51502032] = {
    id = 51502032,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51502031,
    next = {51502033},
    chapter_id = 50020203,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600112},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52011201,
    boss_score_ratio = 20000
  },
  [51502033] = {
    id = 51502033,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51502032,
    next = {51502034},
    chapter_id = 50020203,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600113},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52011301,
    boss_score_ratio = 20000,
    share_hp_count = 5
  },
  [51502034] = {
    id = 51502034,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51502033,
    next = {51502035},
    chapter_id = 50020203,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600114},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52011401,
    boss_score_ratio = 20000,
    share_hp_count = 4
  },
  [51502035] = {
    id = 51502035,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51502034,
    chapter_id = 50020203,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600115},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52011501,
    boss_score_ratio = 20000
  },
  [51502041] = {
    id = 51502041,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51502035,
    next = {51502042},
    chapter_id = 50020204,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600116},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52010101,
    boss_score_ratio = 25000
  },
  [51502042] = {
    id = 51502042,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51502041,
    next = {51502043},
    chapter_id = 50020204,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600117},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52010201,
    boss_score_ratio = 25000
  },
  [51502043] = {
    id = 51502043,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51502042,
    next = {51502044},
    chapter_id = 50020204,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600118},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52010301,
    boss_score_ratio = 25000,
    share_hp_count = 5
  },
  [51502044] = {
    id = 51502044,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51502043,
    next = {51502045},
    chapter_id = 50020204,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600119},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52010401,
    boss_score_ratio = 25000,
    share_hp_count = 4
  },
  [51502045] = {
    id = 51502045,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51502044,
    chapter_id = 50020204,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600120},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52010501,
    boss_score_ratio = 25000
  },
  [51502051] = {
    id = 51502051,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51502045,
    next = {51502052},
    chapter_id = 50020205,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600121},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52010601,
    boss_score_ratio = 30000
  },
  [51502052] = {
    id = 51502052,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51502051,
    next = {51502053},
    chapter_id = 50020205,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600122},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52010701,
    boss_score_ratio = 30000
  },
  [51502053] = {
    id = 51502053,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51502052,
    next = {51502054},
    chapter_id = 50020205,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600123},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52010801,
    boss_score_ratio = 30000,
    share_hp_count = 5
  },
  [51502054] = {
    id = 51502054,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51502053,
    next = {51502055},
    chapter_id = 50020205,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600124},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52010901,
    boss_score_ratio = 30000,
    share_hp_count = 4
  },
  [51502055] = {
    id = 51502055,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51502054,
    chapter_id = 50020205,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600125},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52011001,
    boss_score_ratio = 30000
  },
  [51502061] = {
    id = 51502061,
    name = function()
      return T(80228001)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233001)
    end,
    icon = "GuildBoss:BossBattleList_001",
    pre = 51502055,
    next = {51502062},
    chapter_id = 50020206,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600126},
    map_id = 10706,
    limit_frame = 4200,
    boss_id = 52011101,
    boss_score_ratio = 35000
  },
  [51502062] = {
    id = 51502062,
    name = function()
      return T(80228002)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233002)
    end,
    icon = "GuildBoss:BossBattleList_002",
    pre = 51502061,
    next = {51502063},
    chapter_id = 50020206,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600127},
    map_id = 10710,
    limit_frame = 4200,
    boss_id = 52011201,
    boss_score_ratio = 35000
  },
  [51502063] = {
    id = 51502063,
    name = function()
      return T(80228003)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233003)
    end,
    icon = "GuildBoss:BossBattleList_003",
    pre = 51502062,
    next = {51502064},
    chapter_id = 50020206,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600128},
    map_id = 10707,
    limit_frame = 4200,
    boss_id = 52011301,
    boss_score_ratio = 35000,
    share_hp_count = 5
  },
  [51502064] = {
    id = 51502064,
    name = function()
      return T(80228004)
    end,
    name_detail = function()
      return T(80228901)
    end,
    des = function()
      return T(80233004)
    end,
    icon = "GuildBoss:BossBattleList_004",
    pre = 51502063,
    next = {51502065},
    chapter_id = 50020206,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600129},
    map_id = 10709,
    limit_frame = 4200,
    boss_id = 52011401,
    boss_score_ratio = 35000,
    share_hp_count = 4
  },
  [51502065] = {
    id = 51502065,
    name = function()
      return T(80228005)
    end,
    name_detail = function()
      return T(80228902)
    end,
    des = function()
      return T(80233005)
    end,
    icon = "GuildBoss:BossBattleList_005",
    pre = 51502064,
    chapter_id = 50020206,
    chapter_type = 32,
    type = 1,
    sweep_type = 0,
    challenge_num = -1,
    challenge_reset = 0,
    win_condition = "1",
    monster_group_list = {51600130},
    map_id = 80701,
    limit_frame = 4200,
    boss_id = 52011501,
    boss_score_ratio = 35000
  }
}
