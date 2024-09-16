BaseSkillBuff = {
  [43100001] = {
    id = 43100001,
    type = 1,
    value = {
      "519:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43100002] = {
    id = 43100002,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506440, 20)
    end,
    type = 1,
    value = {
      "644:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43110101] = {
    id = 43110101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110102:3001:3000",
      "43110103:2001:5000",
      "43110104:2001:10000"
    },
    buff_cd = 0
  },
  [43110102] = {
    id = 43110102,
    type = 1,
    value = {
      "101:1:2:40000103:5000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110103] = {
    id = 43110103,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110104] = {
    id = 43110104,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110105] = {
    id = 43110105,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110106:3001:3000",
      "43110107:2001:5000",
      "43110108:2001:10000"
    },
    buff_cd = 0
  },
  [43110106] = {
    id = 43110106,
    type = 1,
    value = {
      "101:1:2:40000103:6000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110107] = {
    id = 43110107,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110108] = {
    id = 43110108,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110109] = {
    id = 43110109,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110110:3001:3000",
      "43110111:2001:5000",
      "43110112:2001:10000"
    },
    buff_cd = 0
  },
  [43110110] = {
    id = 43110110,
    type = 1,
    value = {
      "101:1:2:40000103:7000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110111] = {
    id = 43110111,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110112] = {
    id = 43110112,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110113] = {
    id = 43110113,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110114:3001:3000",
      "43110115:2001:5000",
      "43110116:2001:10000"
    },
    buff_cd = 0
  },
  [43110114] = {
    id = 43110114,
    type = 1,
    value = {
      "101:1:2:40000103:8000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110115] = {
    id = 43110115,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110116] = {
    id = 43110116,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110117] = {
    id = 43110117,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110118:3001:3000",
      "43110119:2001:5000",
      "43110120:2001:10000"
    },
    buff_cd = 0
  },
  [43110118] = {
    id = 43110118,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110119] = {
    id = 43110119,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110120] = {
    id = 43110120,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110121] = {
    id = 43110121,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110122:3001:3000",
      "43110123:2001:5000",
      "43110124:2001:10000"
    },
    buff_cd = 0
  },
  [43110122] = {
    id = 43110122,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110123] = {
    id = 43110123,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43110124] = {
    id = 43110124,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 7)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310101,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012101
  },
  [43210101] = {
    id = 43210101,
    type = 1,
    value = {
      "101:1:2:40000103:15000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 103,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210102] = {
    id = 43210102,
    type = 1,
    value = {
      "101:1:2:40000103:16000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 103,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210103] = {
    id = 43210103,
    type = 1,
    value = {
      "101:1:2:40000103:17000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 103,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210104] = {
    id = 43210104,
    type = 1,
    value = {
      "101:1:2:40000103:18000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 103,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210105] = {
    id = 43210105,
    type = 1,
    value = {
      "101:1:2:40000103:19000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 103,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210106] = {
    id = 43210106,
    type = 1,
    value = {
      "101:1:2:40000103:20000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 103,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43310101] = {
    id = 43310101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43410101] = {
    id = 43410101,
    name = function()
      return T(80406470)
    end,
    des = function()
      return T(80506470, 10)
    end,
    type = 1,
    value = {
      "647:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43110201] = {
    id = 43110201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110202:3001:3000"
    },
    buff_cd = 0
  },
  [43110202] = {
    id = 43110202,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012102
  },
  [43110203] = {
    id = 43110203,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110204:3001:3000"
    },
    buff_cd = 0
  },
  [43110204] = {
    id = 43110204,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012102
  },
  [43110205] = {
    id = 43110205,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110206:3001:3000"
    },
    buff_cd = 0
  },
  [43110206] = {
    id = 43110206,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012102
  },
  [43110207] = {
    id = 43110207,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110208:3001:3000"
    },
    buff_cd = 0
  },
  [43110208] = {
    id = 43110208,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012102
  },
  [43110209] = {
    id = 43110209,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110210:3001:3000"
    },
    buff_cd = 0
  },
  [43110210] = {
    id = 43110210,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012102
  },
  [43110211] = {
    id = 43110211,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110212:3001:3000"
    },
    buff_cd = 0
  },
  [43110212] = {
    id = 43110212,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012102
  },
  [43210201] = {
    id = 43210201,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310201,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43210202] = {
    id = 43210202,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 5)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310201,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0
  },
  [43310201] = {
    id = 43310201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43410201] = {
    id = 43410201,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 5)
    end,
    type = 1,
    value = {
      "615:2:1:0:-500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43110301] = {
    id = 43110301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110302] = {
    id = 43110302,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012103
  },
  [43110303] = {
    id = 43110303,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43110304:1002:10000"
    },
    buff_cd = 0
  },
  [43110304] = {
    id = 43110304,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43110305] = {
    id = 43110305,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110306] = {
    id = 43110306,
    type = 1,
    value = {
      "101:1:2:40000103:16000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110305,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012103
  },
  [43110307] = {
    id = 43110307,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110305,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43110308:1002:10000"
    },
    buff_cd = 0
  },
  [43110308] = {
    id = 43110308,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 12, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43110309] = {
    id = 43110309,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110310] = {
    id = 43110310,
    type = 1,
    value = {
      "101:1:2:40000103:18000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110309,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012103
  },
  [43110311] = {
    id = 43110311,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110309,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43110312:1002:10000"
    },
    buff_cd = 0
  },
  [43110312] = {
    id = 43110312,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 14, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43110313] = {
    id = 43110313,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110314] = {
    id = 43110314,
    type = 1,
    value = {
      "101:1:2:40000103:20000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110313,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012103
  },
  [43110315] = {
    id = 43110315,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110313,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43110316:1002:10000"
    },
    buff_cd = 0
  },
  [43110316] = {
    id = 43110316,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 16, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43110317] = {
    id = 43110317,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110318] = {
    id = 43110318,
    type = 1,
    value = {
      "101:1:2:40000103:22000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110317,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012103
  },
  [43110319] = {
    id = 43110319,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110317,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43110320:1002:10000"
    },
    buff_cd = 0
  },
  [43110320] = {
    id = 43110320,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 18, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43110321] = {
    id = 43110321,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110322] = {
    id = 43110322,
    type = 1,
    value = {
      "101:1:2:40000103:24000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110321,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012103
  },
  [43110323] = {
    id = 43110323,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110321,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43110324:1002:10000"
    },
    buff_cd = 0
  },
  [43110324] = {
    id = 43110324,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 20, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43210301] = {
    id = 43210301,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 10)
    end,
    type = 60,
    value = {
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 71010311
  },
  [43210302] = {
    id = 43210302,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 12)
    end,
    type = 60,
    value = {
      "615:2:1:0:-1200:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 71010311
  },
  [43210303] = {
    id = 43210303,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 14)
    end,
    type = 60,
    value = {
      "615:2:1:0:-1400:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 71010311
  },
  [43210304] = {
    id = 43210304,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 16)
    end,
    type = 60,
    value = {
      "615:2:1:0:-1600:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 71010311
  },
  [43210305] = {
    id = 43210305,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 18)
    end,
    type = 60,
    value = {
      "615:2:1:0:-1800:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 71010311
  },
  [43210306] = {
    id = 43210306,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 20)
    end,
    type = 60,
    value = {
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 71010311
  },
  [43310301] = {
    id = 43310301,
    name = function()
      return T(80406450)
    end,
    des = function()
      return T(80506450, 10)
    end,
    type = 1,
    value = {
      "645:1:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43410301] = {
    id = 43410301,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 5)
    end,
    type = 1,
    value = {
      "615:2:1:0:-500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43110401] = {
    id = 43110401,
    type = 1,
    value = {
      "102:1:1:0:5000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110402,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012104
  },
  [43110402] = {
    id = 43110402,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110403] = {
    id = 43110403,
    type = 1,
    value = {
      "102:1:1:0:5000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110404,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012104
  },
  [43110404] = {
    id = 43110404,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110405] = {
    id = 43110405,
    type = 1,
    value = {
      "102:1:1:0:5000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110406,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012104
  },
  [43110406] = {
    id = 43110406,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110407] = {
    id = 43110407,
    type = 1,
    value = {
      "102:1:1:0:5000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110408,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012104
  },
  [43110408] = {
    id = 43110408,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110409] = {
    id = 43110409,
    type = 1,
    value = {
      "102:1:1:0:5000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110410,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012104
  },
  [43110410] = {
    id = 43110410,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110411] = {
    id = 43110411,
    type = 1,
    value = {
      "102:1:1:0:5000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43110412,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012104
  },
  [43110412] = {
    id = 43110412,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43310401] = {
    id = 43310401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43310402] = {
    id = 43310402,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43310403:2012:10000:1000402",
      "43310404:2001:10000:1000401"
    },
    buff_cd = 0
  },
  [43310403] = {
    id = 43310403,
    type = 10,
    value = {
      "107:1:2:40000103:60000:1"
    },
    be_affected_with_effects = {650},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43310404] = {
    id = 43310404,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43410401] = {
    id = 43410401,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43410402] = {
    id = 43410402,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43110501] = {
    id = 43110501,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507031, 25, 4)
    end,
    type = 70,
    value = {
      "703:2:1:0:-25:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012105
  },
  [43110502] = {
    id = 43110502,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507031, 30, 4)
    end,
    type = 70,
    value = {
      "703:2:1:0:-30:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012105
  },
  [43110503] = {
    id = 43110503,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507031, 35, 4)
    end,
    type = 70,
    value = {
      "703:2:1:0:-35:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012105
  },
  [43110504] = {
    id = 43110504,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507031, 40, 4)
    end,
    type = 70,
    value = {
      "703:2:1:0:-40:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012105
  },
  [43110505] = {
    id = 43110505,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507031, 45, 4)
    end,
    type = 70,
    value = {
      "703:2:1:0:-45:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012105
  },
  [43110506] = {
    id = 43110506,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507031, 50, 4)
    end,
    type = 70,
    value = {
      "703:2:1:0:-50:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012105
  },
  [43210501] = {
    id = 43210501,
    type = 30,
    value = {
      "304:1:2:40000102:-800:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43210502] = {
    id = 43210502,
    type = 30,
    value = {
      "304:1:2:40000102:-800:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43210503] = {
    id = 43210503,
    type = 30,
    value = {
      "304:1:2:40000102:-900:0",
      "304:1:1:0:-600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43210504] = {
    id = 43210504,
    type = 30,
    value = {
      "304:1:2:40000102:-900:0",
      "304:1:1:0:-600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43210505] = {
    id = 43210505,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0",
      "304:1:1:0:-700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43210506] = {
    id = 43210506,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0",
      "304:1:1:0:-700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43310501] = {
    id = 43310501,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 8)
    end,
    type = 1,
    value = {
      "615:2:1:0:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43410501] = {
    id = 43410501,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43010701] = {
    id = 43010701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43010702:1002:10000"
    },
    buff_cd = 0
  },
  [43010702] = {
    id = 43010702,
    type = 1,
    value = {
      "138:1:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43010703] = {
    id = 43010703,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 5, 3)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43010704] = {
    id = 43010704,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43010705:1002:10000"
    },
    buff_cd = 0
  },
  [43010705] = {
    id = 43010705,
    type = 1,
    value = {
      "138:1:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43010706] = {
    id = 43010706,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 5, 3)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43010707] = {
    id = 43010707,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43010708:1002:10000"
    },
    buff_cd = 0
  },
  [43010708] = {
    id = 43010708,
    type = 1,
    value = {
      "138:1:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43010709] = {
    id = 43010709,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 5, 3)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43010710] = {
    id = 43010710,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43010711:1002:10000"
    },
    buff_cd = 0
  },
  [43010711] = {
    id = 43010711,
    type = 1,
    value = {
      "138:1:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43010712] = {
    id = 43010712,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 5, 3)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43110701] = {
    id = 43110701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110702:1002:10000",
      "43110703:1002:10000"
    },
    buff_cd = 0
  },
  [43110702] = {
    id = 43110702,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012107
  },
  [43110703] = {
    id = 43110703,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 5)
    end,
    type = 1,
    value = {
      "601:2:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110704] = {
    id = 43110704,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110705:1002:10000",
      "43110706:1002:10000"
    },
    buff_cd = 0
  },
  [43110705] = {
    id = 43110705,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 6)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012107
  },
  [43110706] = {
    id = 43110706,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 6)
    end,
    type = 1,
    value = {
      "601:2:1:0:-600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110707] = {
    id = 43110707,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110708:1002:10000",
      "43110709:1002:10000"
    },
    buff_cd = 0
  },
  [43110708] = {
    id = 43110708,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 7)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012107
  },
  [43110709] = {
    id = 43110709,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 7)
    end,
    type = 1,
    value = {
      "601:2:1:0:-700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110710] = {
    id = 43110710,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110711:1002:10000",
      "43110712:1002:10000"
    },
    buff_cd = 0
  },
  [43110711] = {
    id = 43110711,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 8)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012107
  },
  [43110712] = {
    id = 43110712,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 8)
    end,
    type = 1,
    value = {
      "601:2:1:0:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110713] = {
    id = 43110713,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110714:1002:10000",
      "43110715:1002:10000"
    },
    buff_cd = 0
  },
  [43110714] = {
    id = 43110714,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 9)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012107
  },
  [43110715] = {
    id = 43110715,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 9)
    end,
    type = 1,
    value = {
      "601:2:1:0:-900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110716] = {
    id = 43110716,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110717:1002:10000",
      "43110718:1002:10000"
    },
    buff_cd = 0
  },
  [43110717] = {
    id = 43110717,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012107
  },
  [43110718] = {
    id = 43110718,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43210701] = {
    id = 43210701,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210702] = {
    id = 43210702,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 20)
    end,
    type = 1,
    value = {
      "601:2:1:0:-2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210703] = {
    id = 43210703,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 23)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210704] = {
    id = 43210704,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 23)
    end,
    type = 1,
    value = {
      "601:2:1:0:-2300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210705] = {
    id = 43210705,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 26)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210706] = {
    id = 43210706,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 26)
    end,
    type = 1,
    value = {
      "601:2:1:0:-2600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210707] = {
    id = 43210707,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 29)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210708] = {
    id = 43210708,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 29)
    end,
    type = 1,
    value = {
      "601:2:1:0:-2900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210709] = {
    id = 43210709,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 32)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:3200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210710] = {
    id = 43210710,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 32)
    end,
    type = 1,
    value = {
      "601:2:1:0:-3200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210711] = {
    id = 43210711,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 35)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:3500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43210712] = {
    id = 43210712,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 35)
    end,
    type = 1,
    value = {
      "601:2:1:0:-3500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43310701] = {
    id = 43310701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    immune_group = {"3:512", "3:515"}
  },
  [43410701] = {
    id = 43410701,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43410702] = {
    id = 43410702,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 5)
    end,
    type = 1,
    value = {
      "601:2:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43110801] = {
    id = 43110801,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43110804,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110802:2001:5000",
      "43110803:2001:5000"
    },
    buff_cd = 0
  },
  [43110802] = {
    id = 43110802,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507042, "2.5")
    end,
    type = 108,
    value = {
      "704:1:1:0:-250:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110803] = {
    id = 43110803,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507041, 5)
    end,
    type = 108,
    value = {
      "704:1:1:0:-500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310801,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110804] = {
    id = 43110804,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110805] = {
    id = 43110805,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43110808,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110806:2001:6000",
      "43110807:2001:6000"
    },
    buff_cd = 0
  },
  [43110806] = {
    id = 43110806,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507042, "2.5")
    end,
    type = 108,
    value = {
      "704:1:1:0:-250:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110807] = {
    id = 43110807,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507041, 5)
    end,
    type = 108,
    value = {
      "704:1:1:0:-500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110808] = {
    id = 43110808,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110809] = {
    id = 43110809,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43110812,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110810:2001:7000",
      "43110811:2001:7000"
    },
    buff_cd = 0
  },
  [43110810] = {
    id = 43110810,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507042, "2.5")
    end,
    type = 108,
    value = {
      "704:1:1:0:-250:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110811] = {
    id = 43110811,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507041, 5)
    end,
    type = 108,
    value = {
      "704:1:1:0:-500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110812] = {
    id = 43110812,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110813] = {
    id = 43110813,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43110816,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110814:2001:8000",
      "43110815:2001:8000"
    },
    buff_cd = 0
  },
  [43110814] = {
    id = 43110814,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507042, "2.5")
    end,
    type = 108,
    value = {
      "704:1:1:0:-250:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110815] = {
    id = 43110815,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507041, 5)
    end,
    type = 108,
    value = {
      "704:1:1:0:-500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110816] = {
    id = 43110816,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110817] = {
    id = 43110817,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43110820,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110818:2001:9000",
      "43110819:2001:9000"
    },
    buff_cd = 0
  },
  [43110818] = {
    id = 43110818,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507042, "2.5")
    end,
    type = 108,
    value = {
      "704:1:1:0:-250:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110819] = {
    id = 43110819,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507041, 5)
    end,
    type = 108,
    value = {
      "704:1:1:0:-500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110820] = {
    id = 43110820,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43110821] = {
    id = 43110821,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43110824,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110822:2001:10000",
      "43110823:2001:10000"
    },
    buff_cd = 0
  },
  [43110822] = {
    id = 43110822,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507042, "2.5")
    end,
    type = 108,
    value = {
      "704:1:1:0:-250:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110823] = {
    id = 43110823,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507041, 5)
    end,
    type = 108,
    value = {
      "704:1:1:0:-500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43310801,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012108
  },
  [43110824] = {
    id = 43110824,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43310801] = {
    id = 43310801,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43410801] = {
    id = 43410801,
    name = function()
      return T(80406500)
    end,
    des = function()
      return T(80506500, 20)
    end,
    type = 1,
    value = {
      "650:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43110901] = {
    id = 43110901,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110902:2001:5000"
    },
    buff_cd = 0
  },
  [43110902] = {
    id = 43110902,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 5)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012109
  },
  [43110903] = {
    id = 43110903,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110904:2001:6000"
    },
    buff_cd = 0
  },
  [43110904] = {
    id = 43110904,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 5)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012109
  },
  [43110905] = {
    id = 43110905,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110906:2001:7000"
    },
    buff_cd = 0
  },
  [43110906] = {
    id = 43110906,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 5)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012109
  },
  [43110907] = {
    id = 43110907,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110908:2001:8000"
    },
    buff_cd = 0
  },
  [43110908] = {
    id = 43110908,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 5)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012109
  },
  [43110909] = {
    id = 43110909,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110910:2001:9000"
    },
    buff_cd = 0
  },
  [43110910] = {
    id = 43110910,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 5)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012109
  },
  [43110911] = {
    id = 43110911,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43110912:2001:10000"
    },
    buff_cd = 0
  },
  [43110912] = {
    id = 43110912,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 5)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012109
  },
  [43210901] = {
    id = 43210901,
    type = 30,
    value = {
      "304:1:2:40000102:-800:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43210902] = {
    id = 43210902,
    type = 30,
    value = {
      "304:1:2:40000102:-800:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43210903] = {
    id = 43210903,
    type = 30,
    value = {
      "304:1:2:40000102:-900:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43210904] = {
    id = 43210904,
    type = 30,
    value = {
      "304:1:2:40000102:-900:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43210905] = {
    id = 43210905,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0",
      "304:1:1:0:-600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43210906] = {
    id = 43210906,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0",
      "304:1:1:0:-600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43310901] = {
    id = 43310901,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, 15)
    end,
    type = 1,
    value = {
      "604:1:1:0:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43410901] = {
    id = 43410901,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43410902] = {
    id = 43410902,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111001] = {
    id = 43111001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 12,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43111002:3001:10000"
    },
    buff_cd = 0
  },
  [43111002] = {
    id = 43111002,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2011,
    trigger_type = 3,
    trigger_value = 5000,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43111003:3001:10000:120"
    },
    buff_cd = 0
  },
  [43111003] = {
    id = 43111003,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 15, 30)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 30,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012110
  },
  [43111004] = {
    id = 43111004,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 12,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43111005:3001:10000"
    },
    buff_cd = 0
  },
  [43111005] = {
    id = 43111005,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2011,
    trigger_type = 3,
    trigger_value = 5600,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43111006:3001:10000:120"
    },
    buff_cd = 0
  },
  [43111006] = {
    id = 43111006,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 18, 30)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:1800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 30,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012110
  },
  [43111007] = {
    id = 43111007,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 12,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43111008:3001:10000"
    },
    buff_cd = 0
  },
  [43111008] = {
    id = 43111008,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2011,
    trigger_type = 3,
    trigger_value = 6200,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43111009:3001:10000:120"
    },
    buff_cd = 0
  },
  [43111009] = {
    id = 43111009,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 21, 30)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:2100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 30,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012110
  },
  [43111010] = {
    id = 43111010,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 12,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43111011:3001:10000"
    },
    buff_cd = 0
  },
  [43111011] = {
    id = 43111011,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2011,
    trigger_type = 3,
    trigger_value = 6800,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43111012:3001:10000:120"
    },
    buff_cd = 0
  },
  [43111012] = {
    id = 43111012,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 24, 30)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:2400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 30,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012110
  },
  [43111013] = {
    id = 43111013,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 12,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43111014:3001:10000"
    },
    buff_cd = 0
  },
  [43111014] = {
    id = 43111014,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2011,
    trigger_type = 3,
    trigger_value = 7400,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43111015:3001:10000:120"
    },
    buff_cd = 0
  },
  [43111015] = {
    id = 43111015,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 26, 30)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:2600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 30,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012110
  },
  [43111016] = {
    id = 43111016,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 12,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43111017:3001:10000"
    },
    buff_cd = 0
  },
  [43111017] = {
    id = 43111017,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2011,
    trigger_type = 3,
    trigger_value = 8000,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43111018:3001:10000:120"
    },
    buff_cd = 0
  },
  [43111018] = {
    id = 43111018,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 30, 30)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 12,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 30,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012110
  },
  [43211001] = {
    id = 43211001,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 25)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211002] = {
    id = 43211002,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 30)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211003] = {
    id = 43211003,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 35)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:3500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211004] = {
    id = 43211004,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 40)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211005] = {
    id = 43211005,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 45)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:4500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211006] = {
    id = 43211006,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 50)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43311001] = {
    id = 43311001,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 8)
    end,
    type = 1,
    value = {
      "615:2:1:0:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43411001] = {
    id = 43411001,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43411002] = {
    id = 43411002,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111101] = {
    id = 43111101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111102:1000:3000"
    },
    buff_cd = 0
  },
  [43111102] = {
    id = 43111102,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012111
  },
  [43111103] = {
    id = 43111103,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111104:1000:3000"
    },
    buff_cd = 0
  },
  [43111104] = {
    id = 43111104,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012111
  },
  [43111105] = {
    id = 43111105,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111106:1000:3000"
    },
    buff_cd = 0
  },
  [43111106] = {
    id = 43111106,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012111
  },
  [43111107] = {
    id = 43111107,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111108:1000:3000"
    },
    buff_cd = 0
  },
  [43111108] = {
    id = 43111108,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012111
  },
  [43111109] = {
    id = 43111109,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111110:1000:3000"
    },
    buff_cd = 0
  },
  [43111110] = {
    id = 43111110,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012111
  },
  [43111111] = {
    id = 43111111,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111112:1000:3000"
    },
    buff_cd = 0
  },
  [43111112] = {
    id = 43111112,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012111
  },
  [43211101] = {
    id = 43211101,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 10, 5)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43211102] = {
    id = 43211102,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 12, 5)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1200:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43211103] = {
    id = 43211103,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 14, 5)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1400:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43211104] = {
    id = 43211104,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 16, 5)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1600:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43211105] = {
    id = 43211105,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 18, 5)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1800:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43211106] = {
    id = 43211106,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 20, 5)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43311101] = {
    id = 43311101,
    type = 1,
    value = {
      "106:1:2:40000101:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1
  },
  [43311102] = {
    id = 43311102,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43311103] = {
    id = 43311103,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 10)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43411101] = {
    id = 43411101,
    name = function()
      return T(80406500)
    end,
    des = function()
      return T(80506500, 20)
    end,
    type = 1,
    value = {
      "650:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111301] = {
    id = 43111301,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0",
      "304:1:1:0:-250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43111302] = {
    id = 43111302,
    type = 30,
    value = {
      "304:1:2:40000102:-600:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43111303] = {
    id = 43111303,
    type = 30,
    value = {
      "304:1:2:40000102:-700:0",
      "304:1:1:0:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43111304] = {
    id = 43111304,
    type = 30,
    value = {
      "304:1:2:40000102:-800:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43111305] = {
    id = 43111305,
    type = 30,
    value = {
      "304:1:2:40000102:-900:0",
      "304:1:1:0:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43111306] = {
    id = 43111306,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211301] = {
    id = 43211301,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "3.1", 200, 10)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-310:0",
      "303:1:1:0:-200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211302] = {
    id = 43211302,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "3.7", 250, 10)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-370:0",
      "303:1:1:0:-250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211303] = {
    id = 43211303,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "4.3", 300, 10)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-430:0",
      "303:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211304] = {
    id = 43211304,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "4.9", 350, 10)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-490:0",
      "303:1:1:0:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211305] = {
    id = 43211305,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "5.5", 400, 10)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-550:0",
      "303:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211306] = {
    id = 43211306,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "6.2", 450, 10)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-620:0",
      "303:1:1:0:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43311301] = {
    id = 43311301,
    type = 1,
    value = {
      "521:1:1:0:2:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43411301] = {
    id = 43411301,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506042, 20)
    end,
    type = 1,
    value = {
      "604:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111401] = {
    id = 43111401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111402] = {
    id = 43111402,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43111401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111403:2001:10000"
    },
    buff_cd = 0
  },
  [43111403] = {
    id = 43111403,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_as_skill_id = 41012114
  },
  [43111404] = {
    id = 43111404,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111405] = {
    id = 43111405,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43111404,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111406:2001:10000"
    },
    buff_cd = 0
  },
  [43111406] = {
    id = 43111406,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_as_skill_id = 41012114
  },
  [43111407] = {
    id = 43111407,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111408] = {
    id = 43111408,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43111407,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111409:2001:10000"
    },
    buff_cd = 0
  },
  [43111409] = {
    id = 43111409,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_as_skill_id = 41012114
  },
  [43111410] = {
    id = 43111410,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111411] = {
    id = 43111411,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43111410,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111412:2001:10000"
    },
    buff_cd = 0
  },
  [43111412] = {
    id = 43111412,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_as_skill_id = 41012114
  },
  [43111413] = {
    id = 43111413,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111414] = {
    id = 43111414,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43111413,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111415:2001:10000"
    },
    buff_cd = 0
  },
  [43111415] = {
    id = 43111415,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_as_skill_id = 41012114
  },
  [43111416] = {
    id = 43111416,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111417] = {
    id = 43111417,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43111416,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111418:2001:10000"
    },
    buff_cd = 0
  },
  [43111418] = {
    id = 43111418,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_as_skill_id = 41012114
  },
  [43311401] = {
    id = 43311401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43311402] = {
    id = 43311402,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43311401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43311403:1000:10000"
    },
    buff_cd = 0
  },
  [43311403] = {
    id = 43311403,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 20, 10)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43411401] = {
    id = 43411401,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43411402] = {
    id = 43411402,
    name = function()
      return T(80406190)
    end,
    des = function()
      return T(80506192, 30)
    end,
    type = 1,
    value = {
      "619:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111501] = {
    id = 43111501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111502:3001:5000"
    },
    buff_cd = 0
  },
  [43111502] = {
    id = 43111502,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012115
  },
  [43111503] = {
    id = 43111503,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111504:3001:5000"
    },
    buff_cd = 0
  },
  [43111504] = {
    id = 43111504,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012115
  },
  [43111505] = {
    id = 43111505,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111506:3001:5000"
    },
    buff_cd = 0
  },
  [43111506] = {
    id = 43111506,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012115
  },
  [43111507] = {
    id = 43111507,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111508:3001:5000"
    },
    buff_cd = 0
  },
  [43111508] = {
    id = 43111508,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012115
  },
  [43111509] = {
    id = 43111509,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111510:3001:5000"
    },
    buff_cd = 0
  },
  [43111510] = {
    id = 43111510,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012115
  },
  [43111511] = {
    id = 43111511,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111512:3001:5000"
    },
    buff_cd = 0
  },
  [43111512] = {
    id = 43111512,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012115
  },
  [43111513] = {
    id = 43111513,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012115
  },
  [43111514] = {
    id = 43111514,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 120,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012115
  },
  [43111515] = {
    id = 43111515,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012115
  },
  [43111516] = {
    id = 43111516,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012115
  },
  [43111517] = {
    id = 43111517,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012115
  },
  [43111518] = {
    id = 43111518,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012115
  },
  [43111519] = {
    id = 43111519,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 15, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43111520] = {
    id = 43111520,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 15, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 120,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43111521] = {
    id = 43111521,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 15, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43111522] = {
    id = 43111522,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 15, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43111523] = {
    id = 43111523,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 15, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43111524] = {
    id = 43111524,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 15, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43311501,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43211501] = {
    id = 43211501,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0,
    settle_reset = 1
  },
  [43211502] = {
    id = 43211502,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0,
    settle_reset = 1
  },
  [43211503] = {
    id = 43211503,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0,
    settle_reset = 1
  },
  [43211504] = {
    id = 43211504,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0,
    settle_reset = 1
  },
  [43211505] = {
    id = 43211505,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0,
    settle_reset = 1
  },
  [43211506] = {
    id = 43211506,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0,
    settle_reset = 1
  },
  [43311501] = {
    id = 43311501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43311502] = {
    id = 43311502,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 31,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43311503:3001:10000"
    },
    buff_cd = 0
  },
  [43311503] = {
    id = 43311503,
    type = 1,
    value = {
      "101:1:2:40000103:50000:1"
    },
    be_affected_with_effects = {650},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43411501] = {
    id = 43411501,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43011601] = {
    id = 43011601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 1,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011602:3001:10000",
      "43011604:3001:10000",
      "43011605:3001:10000"
    },
    buff_cd = 0
  },
  [43011602] = {
    id = 43011602,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 142,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011603:3151:10000"
    },
    buff_cd = 0
  },
  [43011603] = {
    id = 43011603,
    type = 1,
    value = {
      "132:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43011604] = {
    id = 43011604,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43311601,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011606:2533:10000:0:12",
      "43011607:2533:10000:0:12",
      "43011608:2533:10000:0:12",
      "43011609:2533:10000:0:12",
      "43011610:2533:10000:0:12",
      "43011611:2533:10000:0:12",
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011605] = {
    id = 43011605,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43311601,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011612:2534:10000:0:12",
      "43011613:2534:10000:0:12",
      "43011614:2534:10000:0:12",
      "43011615:2534:10000:0:12",
      "43011616:2534:10000:0:12",
      "43011617:2534:10000:0:12",
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011606] = {
    id = 43011606,
    type = 1,
    value = {
      "507:1:1:0:2007:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011607] = {
    id = 43011607,
    type = 1,
    value = {
      "507:1:1:0:2008:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011608] = {
    id = 43011608,
    type = 1,
    value = {
      "507:1:1:0:2009:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011609] = {
    id = 43011609,
    type = 1,
    value = {
      "507:1:1:0:2010:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011610] = {
    id = 43011610,
    type = 1,
    value = {
      "507:1:1:0:2011:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011611] = {
    id = 43011611,
    type = 1,
    value = {
      "507:1:1:0:2012:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 6,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011612] = {
    id = 43011612,
    type = 1,
    value = {
      "507:1:1:0:2007:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011613] = {
    id = 43011613,
    type = 1,
    value = {
      "507:1:1:0:2008:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011614] = {
    id = 43011614,
    type = 1,
    value = {
      "507:1:1:0:2009:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011615] = {
    id = 43011615,
    type = 1,
    value = {
      "507:1:1:0:2010:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011616] = {
    id = 43011616,
    type = 1,
    value = {
      "507:1:1:0:2011:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43011617] = {
    id = 43011617,
    type = 1,
    value = {
      "507:1:1:0:2012:0"
    },
    trigger_condition = 2181,
    trigger_type = 2,
    trigger_value = 6,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43111601] = {
    id = 43111601,
    type = 1,
    value = {
      "507:1:1:0:2001:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43111602] = {
    id = 43111602,
    type = 1,
    value = {
      "507:1:1:0:2002:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43111603] = {
    id = 43111603,
    type = 1,
    value = {
      "507:1:1:0:2003:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43111604] = {
    id = 43111604,
    type = 1,
    value = {
      "507:1:1:0:2004:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43111605] = {
    id = 43111605,
    type = 1,
    value = {
      "507:1:1:0:2005:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43111606] = {
    id = 43111606,
    type = 1,
    value = {
      "507:1:1:0:2006:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43111607:3151:10000"
    },
    buff_cd = 0
  },
  [43111607] = {
    id = 43111607,
    type = 1,
    value = {
      "614:1:16:0:649:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [43211601] = {
    id = 43211601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211602:1004:10000:1000402"
    },
    buff_cd = 0,
    settle_sound = 71011611
  },
  [43211602] = {
    id = 43211602,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211603:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43211603] = {
    id = 43211603,
    type = 10,
    value = {
      "107:1:2:40000103:5000:1"
    },
    be_affected_with_effects = {650},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211604] = {
    id = 43211604,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211605:1004:10000:1000402"
    },
    buff_cd = 0,
    settle_sound = 71011611
  },
  [43211605] = {
    id = 43211605,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211606:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43211606] = {
    id = 43211606,
    type = 10,
    value = {
      "107:1:2:40000103:6000:1"
    },
    be_affected_with_effects = {650},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211607] = {
    id = 43211607,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211608:1004:10000:1000402"
    },
    buff_cd = 0,
    settle_sound = 71011611
  },
  [43211608] = {
    id = 43211608,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211609:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43211609] = {
    id = 43211609,
    type = 10,
    value = {
      "107:1:2:40000103:7000:1"
    },
    be_affected_with_effects = {650},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211610] = {
    id = 43211610,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211611:1004:10000:1000402"
    },
    buff_cd = 0,
    settle_sound = 71011611
  },
  [43211611] = {
    id = 43211611,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211612:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43211612] = {
    id = 43211612,
    type = 10,
    value = {
      "107:1:2:40000103:8000:1"
    },
    be_affected_with_effects = {650},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211613] = {
    id = 43211613,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211614:1004:10000:1000402"
    },
    buff_cd = 0,
    settle_sound = 71011611
  },
  [43211614] = {
    id = 43211614,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211615:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43211615] = {
    id = 43211615,
    type = 10,
    value = {
      "107:1:2:40000103:9000:1"
    },
    be_affected_with_effects = {650},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43211616] = {
    id = 43211616,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211617:1004:10000:1000402"
    },
    buff_cd = 0,
    settle_sound = 71011611
  },
  [43211617] = {
    id = 43211617,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211618:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43211618] = {
    id = 43211618,
    type = 10,
    value = {
      "107:1:2:40000103:10000:1"
    },
    be_affected_with_effects = {650},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43311601] = {
    id = 43311601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43411601] = {
    id = 43411601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 305,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43411602:3002:10000"
    },
    buff_cd = 0
  },
  [43411602] = {
    id = 43411602,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43411603] = {
    id = 43411603,
    type = 1,
    value = {
      "655:2:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43011701] = {
    id = 43011701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43311701,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011702:2001:10000",
      "43011705:2001:10000"
    },
    buff_cd = 0
  },
  [43011702] = {
    id = 43011702,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2001,
    trigger_type = 2,
    trigger_value = 701,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011703:1002:2000",
      "43011704:1002:5000"
    },
    buff_cd = 0
  },
  [43011703] = {
    id = 43011703,
    name = function()
      return T(80405340)
    end,
    des = function()
      return T(80505340, 0.5)
    end,
    type = 1,
    value = {
      "534:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43211703,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 15,
    buff_cd = 0,
    settle_reset = 1
  },
  [43011704] = {
    id = 43011704,
    name = function()
      return T(80405340)
    end,
    des = function()
      return T(80505340, 0.5)
    end,
    type = 1,
    value = {
      "534:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43211703,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 15,
    buff_cd = 0,
    settle_reset = 1
  },
  [43011705] = {
    id = 43011705,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2001,
    trigger_type = 2,
    trigger_value = 719,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011706:1002:2000",
      "43011707:1002:5000"
    },
    buff_cd = 0
  },
  [43011706] = {
    id = 43011706,
    name = function()
      return T(80405340)
    end,
    des = function()
      return T(80505340, 0.5)
    end,
    type = 1,
    value = {
      "534:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43211703,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 15,
    buff_cd = 0,
    settle_reset = 1
  },
  [43011707] = {
    id = 43011707,
    name = function()
      return T(80405340)
    end,
    des = function()
      return T(80505340, 0.5)
    end,
    type = 1,
    value = {
      "534:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43211703,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 15,
    buff_cd = 0,
    settle_reset = 1
  },
  [43011708] = {
    id = 43011708,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43311701,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011709:2001:10000",
      "43011712:2001:10000"
    },
    buff_cd = 0
  },
  [43011709] = {
    id = 43011709,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2001,
    trigger_type = 2,
    trigger_value = 701,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011710:1002:4000",
      "43011711:1002:7000"
    },
    buff_cd = 0
  },
  [43011710] = {
    id = 43011710,
    name = function()
      return T(80405340)
    end,
    des = function()
      return T(80505340, 0.5)
    end,
    type = 1,
    value = {
      "534:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43211703,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 15,
    buff_cd = 0,
    settle_reset = 1
  },
  [43011711] = {
    id = 43011711,
    name = function()
      return T(80405340)
    end,
    des = function()
      return T(80505340, 0.5)
    end,
    type = 1,
    value = {
      "534:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43211703,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 15,
    buff_cd = 0,
    settle_reset = 1
  },
  [43011712] = {
    id = 43011712,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2001,
    trigger_type = 2,
    trigger_value = 719,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43011713:1002:4000",
      "43011714:1002:7000"
    },
    buff_cd = 0
  },
  [43011713] = {
    id = 43011713,
    name = function()
      return T(80405340)
    end,
    des = function()
      return T(80505340, 0.5)
    end,
    type = 1,
    value = {
      "534:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43211703,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 15,
    buff_cd = 0,
    settle_reset = 1
  },
  [43011714] = {
    id = 43011714,
    name = function()
      return T(80405340)
    end,
    des = function()
      return T(80505340, 0.5)
    end,
    type = 1,
    value = {
      "534:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43211703,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 15,
    buff_cd = 0,
    settle_reset = 1
  },
  [43111701] = {
    id = 43111701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111702:1002:10000"
    },
    buff_cd = 0
  },
  [43111702] = {
    id = 43111702,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "7")
    end,
    type = 1,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012117
  },
  [43111703] = {
    id = 43111703,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111704:1002:10000"
    },
    buff_cd = 0
  },
  [43111704] = {
    id = 43111704,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "8")
    end,
    type = 1,
    value = {
      "602:2:2:40000103:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012117
  },
  [43111705] = {
    id = 43111705,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111706:1002:10000"
    },
    buff_cd = 0
  },
  [43111706] = {
    id = 43111706,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "9")
    end,
    type = 1,
    value = {
      "602:2:2:40000103:900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012117
  },
  [43111707] = {
    id = 43111707,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111708:1002:10000"
    },
    buff_cd = 0
  },
  [43111708] = {
    id = 43111708,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "10")
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012117
  },
  [43111709] = {
    id = 43111709,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111710:1002:10000"
    },
    buff_cd = 0
  },
  [43111710] = {
    id = 43111710,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "11")
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012117
  },
  [43111711] = {
    id = 43111711,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43111712:1002:10000"
    },
    buff_cd = 0
  },
  [43111712] = {
    id = 43111712,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "12")
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012117
  },
  [43211701] = {
    id = 43211701,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 150)
    end,
    type = 1,
    value = {
      "601:2:1:0:-15000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211702] = {
    id = 43211702,
    type = 1,
    value = {
      "523:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211703] = {
    id = 43211703,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211704] = {
    id = 43211704,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43211705:2001:10000"
    },
    buff_cd = 0
  },
  [43211705] = {
    id = 43211705,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 10)
    end,
    type = 70,
    value = {
      "719:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0,
    settle_reset = 1
  },
  [43211706] = {
    id = 43211706,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 160)
    end,
    type = 1,
    value = {
      "601:2:1:0:-16000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211707] = {
    id = 43211707,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 170)
    end,
    type = 1,
    value = {
      "601:2:1:0:-17000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211708] = {
    id = 43211708,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 180)
    end,
    type = 1,
    value = {
      "601:2:1:0:-18000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211709] = {
    id = 43211709,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 190)
    end,
    type = 1,
    value = {
      "601:2:1:0:-19000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211710] = {
    id = 43211710,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 200)
    end,
    type = 1,
    value = {
      "601:2:1:0:-20000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43311701] = {
    id = 43311701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43411701] = {
    id = 43411701,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111801] = {
    id = 43111801,
    type = 1,
    value = {
      "304:1:2:40000102:-350:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012118
  },
  [43111802] = {
    id = 43111802,
    type = 1,
    value = {
      "304:1:2:40000102:-400:0",
      "304:1:1:0:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012118
  },
  [43111803] = {
    id = 43111803,
    type = 1,
    value = {
      "304:1:2:40000102:-450:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012118
  },
  [43111804] = {
    id = 43111804,
    type = 1,
    value = {
      "304:1:2:40000102:-500:0",
      "304:1:1:0:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012118
  },
  [43111805] = {
    id = 43111805,
    type = 1,
    value = {
      "304:1:2:40000102:-550:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012118
  },
  [43111806] = {
    id = 43111806,
    type = 1,
    value = {
      "304:1:2:40000102:-600:0",
      "304:1:1:0:-550:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012118
  },
  [43211801] = {
    id = 43211801,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 5)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 1,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211802] = {
    id = 43211802,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 5)
    end,
    type = 1,
    value = {
      "615:2:1:0:-500:0"
    },
    trigger_condition = 2031,
    trigger_type = 3,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211803] = {
    id = 43211803,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 6)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:600:0"
    },
    trigger_condition = 2031,
    trigger_type = 1,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211804] = {
    id = 43211804,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 6)
    end,
    type = 1,
    value = {
      "615:2:1:0:-600:0"
    },
    trigger_condition = 2031,
    trigger_type = 3,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211805] = {
    id = 43211805,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 7)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 2031,
    trigger_type = 1,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211806] = {
    id = 43211806,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 7)
    end,
    type = 1,
    value = {
      "615:2:1:0:-700:0"
    },
    trigger_condition = 2031,
    trigger_type = 3,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211807] = {
    id = 43211807,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 8)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:800:0"
    },
    trigger_condition = 2031,
    trigger_type = 1,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211808] = {
    id = 43211808,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 8)
    end,
    type = 1,
    value = {
      "615:2:1:0:-800:0"
    },
    trigger_condition = 2031,
    trigger_type = 3,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211809] = {
    id = 43211809,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 9)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:900:0"
    },
    trigger_condition = 2031,
    trigger_type = 1,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211810] = {
    id = 43211810,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 9)
    end,
    type = 1,
    value = {
      "615:2:1:0:-900:0"
    },
    trigger_condition = 2031,
    trigger_type = 3,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211811] = {
    id = 43211811,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 1,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43211812] = {
    id = 43211812,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 10)
    end,
    type = 1,
    value = {
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 3,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43311801] = {
    id = 43311801,
    type = 60,
    value = {
      "606:1:2:40000102:500:0",
      "606:1:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43411801] = {
    id = 43411801,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 10)
    end,
    type = 1,
    value = {
      "611:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43411802] = {
    id = 43411802,
    name = function()
      return T(80406070)
    end,
    des = function()
      return T(80506073, 10)
    end,
    type = 1,
    value = {
      "607:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43111901] = {
    id = 43111901,
    type = 1,
    value = {
      "304:1:2:40000102:-550:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012119
  },
  [43111902] = {
    id = 43111902,
    type = 1,
    value = {
      "304:1:2:40000102:-600:0",
      "304:1:1:0:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012119
  },
  [43111903] = {
    id = 43111903,
    type = 1,
    value = {
      "304:1:2:40000102:-650:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012119
  },
  [43111904] = {
    id = 43111904,
    type = 1,
    value = {
      "304:1:2:40000102:-700:0",
      "304:1:1:0:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012119
  },
  [43111905] = {
    id = 43111905,
    type = 1,
    value = {
      "304:1:2:40000102:-750:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012119
  },
  [43111906] = {
    id = 43111906,
    type = 1,
    value = {
      "304:1:2:40000102:-800:0",
      "304:1:1:0:-550:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012119
  },
  [43311901] = {
    id = 43311901,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, 10)
    end,
    type = 1,
    value = {
      "604:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43411901] = {
    id = 43411901,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 3)
    end,
    type = 1,
    value = {
      "615:2:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43112001] = {
    id = 43112001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112002:1000:3000"
    },
    buff_cd = 0
  },
  [43112002] = {
    id = 43112002,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012120
  },
  [43112003] = {
    id = 43112003,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112004:1000:3000"
    },
    buff_cd = 0
  },
  [43112004] = {
    id = 43112004,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012120
  },
  [43112005] = {
    id = 43112005,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112006:1000:3000"
    },
    buff_cd = 0
  },
  [43112006] = {
    id = 43112006,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012120
  },
  [43112007] = {
    id = 43112007,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112008:1000:3000"
    },
    buff_cd = 0
  },
  [43112008] = {
    id = 43112008,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012120
  },
  [43112009] = {
    id = 43112009,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112010:1000:3000"
    },
    buff_cd = 0
  },
  [43112010] = {
    id = 43112010,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012120
  },
  [43112011] = {
    id = 43112011,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112012:1000:3000"
    },
    buff_cd = 0
  },
  [43112012] = {
    id = 43112012,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012120
  },
  [43312001] = {
    id = 43312001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43312002] = {
    id = 43312002,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 50, 15)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-5000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43312001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43412001] = {
    id = 43412001,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 30)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43112101] = {
    id = 43112101,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 10, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012121
  },
  [43112102] = {
    id = 43112102,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 12, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012121
  },
  [43112103] = {
    id = 43112103,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 14, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012121
  },
  [43112104] = {
    id = 43112104,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 16, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012121
  },
  [43112105] = {
    id = 43112105,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 18, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012121
  },
  [43112106] = {
    id = 43112106,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 20, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012121
  },
  [43212101] = {
    id = 43212101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43212102:1002:3000",
      "43212103:1002:3000"
    },
    buff_cd = 0
  },
  [43212102] = {
    id = 43212102,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43312101,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0
  },
  [43212103] = {
    id = 43212103,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43312101,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43312101] = {
    id = 43312101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43412101] = {
    id = 43412101,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 3)
    end,
    type = 1,
    value = {
      "615:2:1:0:-300:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43412102] = {
    id = 43412102,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506042, 10)
    end,
    type = 1,
    value = {
      "604:2:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43112201] = {
    id = 43112201,
    name = function()
      return T(80404020)
    end,
    des = function()
      return T(80504020, 25)
    end,
    type = 1,
    value = {
      "402:2:1:0:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 999,
    remove_type = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012122
  },
  [43112202] = {
    id = 43112202,
    name = function()
      return T(80404020)
    end,
    des = function()
      return T(80504020, 30)
    end,
    type = 1,
    value = {
      "402:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 999,
    remove_type = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012122
  },
  [43112203] = {
    id = 43112203,
    name = function()
      return T(80404020)
    end,
    des = function()
      return T(80504020, 35)
    end,
    type = 1,
    value = {
      "402:2:1:0:3500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 999,
    remove_type = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012122
  },
  [43112204] = {
    id = 43112204,
    name = function()
      return T(80404020)
    end,
    des = function()
      return T(80504020, 40)
    end,
    type = 1,
    value = {
      "402:2:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 999,
    remove_type = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012122
  },
  [43112205] = {
    id = 43112205,
    name = function()
      return T(80404020)
    end,
    des = function()
      return T(80504020, 45)
    end,
    type = 1,
    value = {
      "402:2:1:0:4500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 999,
    remove_type = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012122
  },
  [43112206] = {
    id = 43112206,
    name = function()
      return T(80404020)
    end,
    des = function()
      return T(80504020, 50)
    end,
    type = 1,
    value = {
      "402:2:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 999,
    remove_type = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012122
  },
  [43412201] = {
    id = 43412201,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 3)
    end,
    type = 1,
    value = {
      "615:2:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43112401] = {
    id = 43112401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43112402] = {
    id = 43112402,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43112401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012124
  },
  [43112403] = {
    id = 43112403,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43112404] = {
    id = 43112404,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43112403,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012124
  },
  [43112405] = {
    id = 43112405,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43112406] = {
    id = 43112406,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43112405,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012124
  },
  [43112407] = {
    id = 43112407,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43112408] = {
    id = 43112408,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43112407,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012124
  },
  [43112409] = {
    id = 43112409,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43112410] = {
    id = 43112410,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43112409,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012124
  },
  [43112411] = {
    id = 43112411,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43112412] = {
    id = 43112412,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43112411,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012124
  },
  [43312401] = {
    id = 43312401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43312402] = {
    id = 43312402,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 20, 10)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43312401,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43412401] = {
    id = 43412401,
    name = function()
      return T(80406500)
    end,
    des = function()
      return T(80506500, 20)
    end,
    type = 1,
    value = {
      "650:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43112501] = {
    id = 43112501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112502:2001:2000"
    },
    buff_cd = 0
  },
  [43112502] = {
    id = 43112502,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012125
  },
  [43112503] = {
    id = 43112503,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112504:2001:2300"
    },
    buff_cd = 0
  },
  [43112504] = {
    id = 43112504,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012125
  },
  [43112505] = {
    id = 43112505,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112506:2001:2600"
    },
    buff_cd = 0
  },
  [43112506] = {
    id = 43112506,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012125
  },
  [43112507] = {
    id = 43112507,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112508:2001:2900"
    },
    buff_cd = 0
  },
  [43112508] = {
    id = 43112508,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012125
  },
  [43112509] = {
    id = 43112509,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112510:2001:3200"
    },
    buff_cd = 0
  },
  [43112510] = {
    id = 43112510,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012125
  },
  [43112511] = {
    id = 43112511,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112512:2001:3500"
    },
    buff_cd = 0
  },
  [43112512] = {
    id = 43112512,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012125
  },
  [43212501] = {
    id = 43212501,
    type = 30,
    value = {
      "304:1:2:40000102:-300:0",
      "304:1:1:0:-100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212502] = {
    id = 43212502,
    type = 30,
    value = {
      "304:1:2:40000102:-300:0",
      "304:1:1:0:-100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212503] = {
    id = 43212503,
    type = 30,
    value = {
      "304:1:2:40000102:-400:0",
      "304:1:1:0:-200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212504] = {
    id = 43212504,
    type = 30,
    value = {
      "304:1:2:40000102:-400:0",
      "304:1:1:0:-200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212505] = {
    id = 43212505,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212506] = {
    id = 43212506,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43312501] = {
    id = 43312501,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 8)
    end,
    type = 1,
    value = {
      "615:2:1:0:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43412501] = {
    id = 43412501,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43112601] = {
    id = 43112601,
    name = function()
      return T(80405100)
    end,
    des = function()
      return T(80505100, 5)
    end,
    type = 50,
    value = {
      "510:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1
  },
  [43112602] = {
    id = 43112602,
    name = function()
      return T(80405100)
    end,
    des = function()
      return T(80505100, 5)
    end,
    type = 50,
    value = {
      "510:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1
  },
  [43112603] = {
    id = 43112603,
    name = function()
      return T(80405100)
    end,
    des = function()
      return T(80505100, 5)
    end,
    type = 50,
    value = {
      "510:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1
  },
  [43112604] = {
    id = 43112604,
    name = function()
      return T(80405100)
    end,
    des = function()
      return T(80505100, 5)
    end,
    type = 50,
    value = {
      "510:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1
  },
  [43112605] = {
    id = 43112605,
    name = function()
      return T(80405100)
    end,
    des = function()
      return T(80505100, 8)
    end,
    type = 50,
    value = {
      "510:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0,
    settle_reset = 1
  },
  [43112606] = {
    id = 43112606,
    name = function()
      return T(80405100)
    end,
    des = function()
      return T(80505100, 8)
    end,
    type = 50,
    value = {
      "510:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0,
    settle_reset = 1
  },
  [43212601] = {
    id = 43212601,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 15, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43212602] = {
    id = 43212602,
    type = 30,
    value = {
      "304:1:2:40000102:-750:0",
      "304:1:1:0:-200:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212603] = {
    id = 43212603,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 18, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1800:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43212604] = {
    id = 43212604,
    type = 30,
    value = {
      "304:1:2:40000102:-800:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212605] = {
    id = 43212605,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 21, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2100:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43212606] = {
    id = 43212606,
    type = 30,
    value = {
      "304:1:2:40000102:-850:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212607] = {
    id = 43212607,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 24, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2400:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43212608] = {
    id = 43212608,
    type = 30,
    value = {
      "304:1:2:40000102:-900:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212609] = {
    id = 43212609,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 27, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2700:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43212610] = {
    id = 43212610,
    type = 30,
    value = {
      "304:1:2:40000102:-950:0",
      "304:1:1:0:-600:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43212611] = {
    id = 43212611,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 30, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43212612] = {
    id = 43212612,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0",
      "304:1:1:0:-700:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43312601] = {
    id = 43312601,
    type = 1,
    value = {
      "521:1:1:0:1:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43412601] = {
    id = 43412601,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 5)
    end,
    type = 1,
    value = {
      "615:2:1:0:-500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43012701] = {
    id = 43012701,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501100, 5, 4)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43012702] = {
    id = 43012702,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501100, 5, 4)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43012703] = {
    id = 43012703,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501100, 5, 4)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43012704] = {
    id = 43012704,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501100, 5, 4)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43112701] = {
    id = 43112701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 10,
    deduce_buff_list = {
      "43112702:3001:10000"
    },
    buff_cd = 0
  },
  [43112702] = {
    id = 43112702,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "9.5")
    end,
    type = 60,
    value = {
      "602:2:2:40000103:950:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 3,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012127
  },
  [43112703] = {
    id = 43112703,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 10,
    deduce_buff_list = {
      "43112704:3001:10000"
    },
    buff_cd = 0
  },
  [43112704] = {
    id = 43112704,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "10")
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 3,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012127
  },
  [43112705] = {
    id = 43112705,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 10,
    deduce_buff_list = {
      "43112706:3001:10000"
    },
    buff_cd = 0
  },
  [43112706] = {
    id = 43112706,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "10.5")
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1050:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 3,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012127
  },
  [43112707] = {
    id = 43112707,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 10,
    deduce_buff_list = {
      "43112708:3001:10000"
    },
    buff_cd = 0
  },
  [43112708] = {
    id = 43112708,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "11")
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 3,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012127
  },
  [43112709] = {
    id = 43112709,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 10,
    deduce_buff_list = {
      "43112710:3001:10000"
    },
    buff_cd = 0
  },
  [43112710] = {
    id = 43112710,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "11.5")
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1150:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 3,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012127
  },
  [43112711] = {
    id = 43112711,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 10,
    deduce_buff_list = {
      "43112712:3001:10000"
    },
    buff_cd = 0
  },
  [43112712] = {
    id = 43112712,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506023, "12")
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 3,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012127
  },
  [43212701] = {
    id = 43212701,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 100)
    end,
    type = 1,
    value = {
      "601:2:1:0:-10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43212702] = {
    id = 43212702,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 110)
    end,
    type = 1,
    value = {
      "601:2:1:0:-11000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43212703] = {
    id = 43212703,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 120)
    end,
    type = 1,
    value = {
      "601:2:1:0:-12000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43212704] = {
    id = 43212704,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 130)
    end,
    type = 1,
    value = {
      "601:2:1:0:-13000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43212705] = {
    id = 43212705,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 140)
    end,
    type = 1,
    value = {
      "601:2:1:0:-14000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43212706] = {
    id = 43212706,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 150)
    end,
    type = 1,
    value = {
      "601:2:1:0:-15000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43212707] = {
    id = 43212707,
    type = 1,
    value = {
      "523:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43312701] = {
    id = 43312701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43312702:1002:10000"
    },
    buff_cd = 0
  },
  [43312702] = {
    id = 43312702,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506113, 20)
    end,
    type = 1,
    value = {
      "611:1:1:0:2000:0"
    },
    trigger_condition = 2131,
    trigger_type = 4,
    trigger_value = 1600,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43412701] = {
    id = 43412701,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43412702] = {
    id = 43412702,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43112901] = {
    id = 43112901,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112902:3001:3000"
    },
    buff_cd = 0
  },
  [43112902] = {
    id = 43112902,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012129
  },
  [43112903] = {
    id = 43112903,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112904:3001:3000"
    },
    buff_cd = 0
  },
  [43112904] = {
    id = 43112904,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012129
  },
  [43112905] = {
    id = 43112905,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112906:3001:3000"
    },
    buff_cd = 0
  },
  [43112906] = {
    id = 43112906,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012129
  },
  [43112907] = {
    id = 43112907,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112908:3001:3000"
    },
    buff_cd = 0
  },
  [43112908] = {
    id = 43112908,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012129
  },
  [43112909] = {
    id = 43112909,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112910:3001:3000"
    },
    buff_cd = 0
  },
  [43112910] = {
    id = 43112910,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012129
  },
  [43112911] = {
    id = 43112911,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43112912:3001:3000"
    },
    buff_cd = 0
  },
  [43112912] = {
    id = 43112912,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012129
  },
  [43312901] = {
    id = 43312901,
    type = 1,
    value = {
      "525:1:1:0:2072:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43412901] = {
    id = 43412901,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113001] = {
    id = 43113001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113002:1002:10000"
    },
    buff_cd = 0
  },
  [43113002] = {
    id = 43113002,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012130
  },
  [43113003] = {
    id = 43113003,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113004:1002:10000"
    },
    buff_cd = 0
  },
  [43113004] = {
    id = 43113004,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 6)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012130
  },
  [43113005] = {
    id = 43113005,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113006:1002:10000"
    },
    buff_cd = 0
  },
  [43113006] = {
    id = 43113006,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 7)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012130
  },
  [43113007] = {
    id = 43113007,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113008:1002:10000"
    },
    buff_cd = 0
  },
  [43113008] = {
    id = 43113008,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 8)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012130
  },
  [43113009] = {
    id = 43113009,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113010:1002:10000"
    },
    buff_cd = 0
  },
  [43113010] = {
    id = 43113010,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 9)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012130
  },
  [43113011] = {
    id = 43113011,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113012:1002:10000"
    },
    buff_cd = 0
  },
  [43113012] = {
    id = 43113012,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012130
  },
  [43213001] = {
    id = 43213001,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 100)
    end,
    type = 60,
    value = {
      "601:2:1:0:-10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213002] = {
    id = 43213002,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 110)
    end,
    type = 60,
    value = {
      "601:2:1:0:-11000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213003] = {
    id = 43213003,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 120)
    end,
    type = 60,
    value = {
      "601:2:1:0:-12000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213004] = {
    id = 43213004,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 130)
    end,
    type = 60,
    value = {
      "601:2:1:0:-13000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213005] = {
    id = 43213005,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 140)
    end,
    type = 60,
    value = {
      "601:2:1:0:-14000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213006] = {
    id = 43213006,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 150)
    end,
    type = 60,
    value = {
      "601:2:1:0:-15000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43313001] = {
    id = 43313001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43313002] = {
    id = 43313002,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43313003:1002:10000"
    },
    buff_cd = 0
  },
  [43313003] = {
    id = 43313003,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501100, 5, 5)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43413001] = {
    id = 43413001,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113101] = {
    id = 43113101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43113102:1002:10000"
    },
    buff_cd = 0
  },
  [43113102] = {
    id = 43113102,
    type = 30,
    value = {
      "304:1:1:0:-100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113103] = {
    id = 43113103,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43113104:1002:10000"
    },
    buff_cd = 0
  },
  [43113104] = {
    id = 43113104,
    type = 30,
    value = {
      "304:1:1:0:-120:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113105] = {
    id = 43113105,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43113106:1002:10000"
    },
    buff_cd = 0
  },
  [43113106] = {
    id = 43113106,
    type = 30,
    value = {
      "304:1:1:0:-140:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113107] = {
    id = 43113107,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43113108:1002:10000"
    },
    buff_cd = 0
  },
  [43113108] = {
    id = 43113108,
    type = 30,
    value = {
      "304:1:1:0:-160:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113109] = {
    id = 43113109,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43113110:1002:10000"
    },
    buff_cd = 0
  },
  [43113110] = {
    id = 43113110,
    type = 30,
    value = {
      "304:1:1:0:-180:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113111] = {
    id = 43113111,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43113112:1002:10000"
    },
    buff_cd = 0
  },
  [43113112] = {
    id = 43113112,
    type = 30,
    value = {
      "304:1:1:0:-200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43213101] = {
    id = 43213101,
    name = function()
      return T(80404050)
    end,
    des = function()
      return T(80504050)
    end,
    type = 1,
    value = {
      "405:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43213102] = {
    id = 43213102,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 100)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213103] = {
    id = 43213103,
    name = function()
      return T(80404050)
    end,
    des = function()
      return T(80504050)
    end,
    type = 1,
    value = {
      "405:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43213104] = {
    id = 43213104,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 110)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:11000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213105] = {
    id = 43213105,
    name = function()
      return T(80404050)
    end,
    des = function()
      return T(80504050)
    end,
    type = 1,
    value = {
      "405:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43213106] = {
    id = 43213106,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 120)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:12000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213107] = {
    id = 43213107,
    name = function()
      return T(80404050)
    end,
    des = function()
      return T(80504050)
    end,
    type = 1,
    value = {
      "405:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43213108] = {
    id = 43213108,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 130)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:13000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213109] = {
    id = 43213109,
    name = function()
      return T(80404050)
    end,
    des = function()
      return T(80504050)
    end,
    type = 1,
    value = {
      "405:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43213110] = {
    id = 43213110,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 140)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:14000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213111] = {
    id = 43213111,
    name = function()
      return T(80404050)
    end,
    des = function()
      return T(80504050)
    end,
    type = 1,
    value = {
      "405:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43213112] = {
    id = 43213112,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 150)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:15000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43313101] = {
    id = 43313101,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, 10)
    end,
    type = 1,
    value = {
      "604:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43313102] = {
    id = 43313102,
    type = 1,
    value = {
      "630:2:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43413101] = {
    id = 43413101,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 7)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43413102] = {
    id = 43413102,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 7)
    end,
    type = 1,
    value = {
      "601:2:1:0:-700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113201] = {
    id = 43113201,
    type = 60,
    value = {
      "305:2:2:40000102:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113202] = {
    id = 43113202,
    type = 60,
    value = {
      "305:2:2:40000102:-5500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113203] = {
    id = 43113203,
    type = 60,
    value = {
      "305:2:2:40000102:-6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113204] = {
    id = 43113204,
    type = 60,
    value = {
      "305:2:2:40000102:-6500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113205] = {
    id = 43113205,
    type = 60,
    value = {
      "305:2:2:40000102:-7000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113206] = {
    id = 43113206,
    type = 60,
    value = {
      "305:2:2:40000102:-7500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113207] = {
    id = 43113207,
    type = 1,
    value = {
      "520:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113208] = {
    id = 43113208,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 10)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113209] = {
    id = 43113209,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 12)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113210] = {
    id = 43113210,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 14)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113211] = {
    id = 43113211,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 16)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113212] = {
    id = 43113212,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 18)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113213] = {
    id = 43113213,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 20)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43213201] = {
    id = 43213201,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 65)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213205:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213207:1002:10000"
    },
    buff_cd = 0
  },
  [43213202] = {
    id = 43213202,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 65)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213205:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213207:1002:10000"
    },
    buff_cd = 0
  },
  [43213203] = {
    id = 43213203,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 65)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213205:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213207:1002:10000"
    },
    buff_cd = 0
  },
  [43213204] = {
    id = 43213204,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213205] = {
    id = 43213205,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43213206:4021:10000:1003203"
    },
    buff_cd = 0
  },
  [43213206] = {
    id = 43213206,
    type = 1,
    value = {
      "113:1:2:40000103:6500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213208:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 170,
    range_y = 170
  },
  [43213207] = {
    id = 43213207,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213209:2021:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43213205"}
  },
  [43213208] = {
    id = 43213208,
    name = function()
      return T(80407200)
    end,
    des = function()
      return T(80507200)
    end,
    type = 1,
    value = {
      "720:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43213209] = {
    id = 43213209,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43213208"}
  },
  [43213210] = {
    id = 43213210,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 70)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213214:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213216:1002:10000"
    },
    buff_cd = 0
  },
  [43213211] = {
    id = 43213211,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 70)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213214:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213216:1002:10000"
    },
    buff_cd = 0
  },
  [43213212] = {
    id = 43213212,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 70)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213214:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213216:1002:10000"
    },
    buff_cd = 0
  },
  [43213213] = {
    id = 43213213,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213214] = {
    id = 43213214,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43213215:4021:10000:1003203"
    },
    buff_cd = 0
  },
  [43213215] = {
    id = 43213215,
    type = 1,
    value = {
      "113:1:2:40000103:7000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213217:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 170,
    range_y = 170
  },
  [43213216] = {
    id = 43213216,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213218:2021:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43213214"}
  },
  [43213217] = {
    id = 43213217,
    name = function()
      return T(80407200)
    end,
    des = function()
      return T(80507200)
    end,
    type = 1,
    value = {
      "720:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43213218] = {
    id = 43213218,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43213217"}
  },
  [43213219] = {
    id = 43213219,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 75)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213223:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213225:1002:10000"
    },
    buff_cd = 0
  },
  [43213220] = {
    id = 43213220,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 75)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213223:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213225:1002:10000"
    },
    buff_cd = 0
  },
  [43213221] = {
    id = 43213221,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 75)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213223:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213225:1002:10000"
    },
    buff_cd = 0
  },
  [43213222] = {
    id = 43213222,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213223] = {
    id = 43213223,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43213224:4021:10000:1003203"
    },
    buff_cd = 0
  },
  [43213224] = {
    id = 43213224,
    type = 1,
    value = {
      "113:1:2:40000103:7500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213226:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 170,
    range_y = 170
  },
  [43213225] = {
    id = 43213225,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213227:2021:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43213223"}
  },
  [43213226] = {
    id = 43213226,
    name = function()
      return T(80407200)
    end,
    des = function()
      return T(80507200)
    end,
    type = 1,
    value = {
      "720:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43213227] = {
    id = 43213227,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43213226"}
  },
  [43213228] = {
    id = 43213228,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 80)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213232:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213234:1002:10000"
    },
    buff_cd = 0
  },
  [43213229] = {
    id = 43213229,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 80)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213232:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213234:1002:10000"
    },
    buff_cd = 0
  },
  [43213230] = {
    id = 43213230,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 80)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213232:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213234:1002:10000"
    },
    buff_cd = 0
  },
  [43213231] = {
    id = 43213231,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213232] = {
    id = 43213232,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43213233:4021:10000:1003203"
    },
    buff_cd = 0
  },
  [43213233] = {
    id = 43213233,
    type = 1,
    value = {
      "113:1:2:40000103:8000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213235:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 170,
    range_y = 170
  },
  [43213234] = {
    id = 43213234,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213236:2021:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43213232"}
  },
  [43213235] = {
    id = 43213235,
    name = function()
      return T(80407200)
    end,
    des = function()
      return T(80507200)
    end,
    type = 1,
    value = {
      "720:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43213236] = {
    id = 43213236,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43213235"}
  },
  [43213237] = {
    id = 43213237,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 85)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213241:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213243:1002:10000"
    },
    buff_cd = 0
  },
  [43213238] = {
    id = 43213238,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 85)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213241:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213243:1002:10000"
    },
    buff_cd = 0
  },
  [43213239] = {
    id = 43213239,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 85)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213241:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213243:1002:10000"
    },
    buff_cd = 0
  },
  [43213240] = {
    id = 43213240,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213241] = {
    id = 43213241,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43213242:4021:10000:1003203"
    },
    buff_cd = 0
  },
  [43213242] = {
    id = 43213242,
    type = 1,
    value = {
      "113:1:2:40000103:8500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213244:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 170,
    range_y = 170
  },
  [43213243] = {
    id = 43213243,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213245:2021:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43213241"}
  },
  [43213244] = {
    id = 43213244,
    name = function()
      return T(80407200)
    end,
    des = function()
      return T(80507200)
    end,
    type = 1,
    value = {
      "720:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43213245] = {
    id = 43213245,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43213244"}
  },
  [43213246] = {
    id = 43213246,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 90)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213250:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213252:1002:10000"
    },
    buff_cd = 0
  },
  [43213247] = {
    id = 43213247,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 90)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213250:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213252:1002:10000"
    },
    buff_cd = 0
  },
  [43213248] = {
    id = 43213248,
    name = function()
      return T(80410060)
    end,
    des = function()
      return T(80510060, 90)
    end,
    type = 1,
    value = {
      "1006:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313201,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213250:1002:10000:1003204"
    },
    deduce_buff_list = {
      "43213252:1002:10000"
    },
    buff_cd = 0
  },
  [43213249] = {
    id = 43213249,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213250] = {
    id = 43213250,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43213251:4021:10000:1003203"
    },
    buff_cd = 0
  },
  [43213251] = {
    id = 43213251,
    type = 1,
    value = {
      "113:1:2:40000103:9000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213253:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 170,
    range_y = 170
  },
  [43213252] = {
    id = 43213252,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43213254:2021:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43213250"}
  },
  [43213253] = {
    id = 43213253,
    name = function()
      return T(80407200)
    end,
    des = function()
      return T(80507200)
    end,
    type = 1,
    value = {
      "720:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43213254] = {
    id = 43213254,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43213253"}
  },
  [43313201] = {
    id = 43313201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43413201] = {
    id = 43413201,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43413202] = {
    id = 43413202,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, 10)
    end,
    type = 1,
    value = {
      "604:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113301] = {
    id = 43113301,
    type = 30,
    value = {
      "304:1:2:40000102:-150:0",
      "304:1:1:0:-250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012133
  },
  [43113302] = {
    id = 43113302,
    type = 30,
    value = {
      "304:1:2:40000102:-200:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012133
  },
  [43113303] = {
    id = 43113303,
    type = 30,
    value = {
      "304:1:2:40000102:-250:0",
      "304:1:1:0:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012133
  },
  [43113304] = {
    id = 43113304,
    type = 30,
    value = {
      "304:1:2:40000102:-300:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012133
  },
  [43113305] = {
    id = 43113305,
    type = 30,
    value = {
      "304:1:2:40000102:-350:0",
      "304:1:1:0:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012133
  },
  [43113306] = {
    id = 43113306,
    type = 30,
    value = {
      "304:1:2:40000102:-400:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012133
  },
  [43213301] = {
    id = 43213301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213302:1000:10000:1003301"
    },
    buff_cd = 0
  },
  [43213302] = {
    id = 43213302,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "1.5", 200, 8)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-150:0",
      "303:1:1:0:-200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43213303] = {
    id = 43213303,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213304:1000:10000:1003301"
    },
    buff_cd = 0
  },
  [43213304] = {
    id = 43213304,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "2", 250, 8)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-200:0",
      "303:1:1:0:-250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43213305] = {
    id = 43213305,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213306:1000:10000:1003301"
    },
    buff_cd = 0
  },
  [43213306] = {
    id = 43213306,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "2.5", 300, 8)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-250:0",
      "303:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43213307] = {
    id = 43213307,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213308:1000:10000:1003301"
    },
    buff_cd = 0
  },
  [43213308] = {
    id = 43213308,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "3", 350, 8)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-300:0",
      "303:1:1:0:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43213309] = {
    id = 43213309,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213310:1000:10000:1003301"
    },
    buff_cd = 0
  },
  [43213310] = {
    id = 43213310,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "3.5", 400, 8)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-350:0",
      "303:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43213311] = {
    id = 43213311,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43213312:1000:10000:1003301"
    },
    buff_cd = 0
  },
  [43213312] = {
    id = 43213312,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "4", 450, 8)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-400:0",
      "303:1:1:0:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43313301] = {
    id = 43313301,
    name = function()
      return T(80404030)
    end,
    des = function()
      return T(80504030, 3)
    end,
    type = 1,
    value = {
      "403:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0
  },
  [43413301] = {
    id = 43413301,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506054, 20)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43413302] = {
    id = 43413302,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506042, 5)
    end,
    type = 1,
    value = {
      "604:2:1:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113401] = {
    id = 43113401,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 5, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113402] = {
    id = 43113402,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 5, 25)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 25,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113403] = {
    id = 43113403,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 6, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:600:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113404] = {
    id = 43113404,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 6, 25)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:600:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 25,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113405] = {
    id = 43113405,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 7, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113406] = {
    id = 43113406,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 7, 25)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 25,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113407] = {
    id = 43113407,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 8, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:800:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113408] = {
    id = 43113408,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 8, 25)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:800:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 25,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113409] = {
    id = 43113409,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 9, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:900:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113410] = {
    id = 43113410,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 9, 25)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:900:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 25,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113411] = {
    id = 43113411,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 10, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113412] = {
    id = 43113412,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 10, 25)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313401,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 25,
    deduce_value = 1,
    buff_cd = 0
  },
  [43113413] = {
    id = 43113413,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012134
  },
  [43113414] = {
    id = 43113414,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213401] = {
    id = 43213401,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43313401] = {
    id = 43313401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43413401] = {
    id = 43413401,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43413402] = {
    id = 43413402,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113501] = {
    id = 43113501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113502:2001:10000"
    },
    buff_cd = 0
  },
  [43113502] = {
    id = 43113502,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 10, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012135
  },
  [43113503] = {
    id = 43113503,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113504:2001:10000"
    },
    buff_cd = 0
  },
  [43113504] = {
    id = 43113504,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 12, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012135
  },
  [43113505] = {
    id = 43113505,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113506:2001:10000"
    },
    buff_cd = 0
  },
  [43113506] = {
    id = 43113506,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 14, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:1400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012135
  },
  [43113507] = {
    id = 43113507,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113508:2001:10000"
    },
    buff_cd = 0
  },
  [43113508] = {
    id = 43113508,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 16, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:1600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012135
  },
  [43113509] = {
    id = 43113509,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113510:2001:10000"
    },
    buff_cd = 0
  },
  [43113510] = {
    id = 43113510,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 18, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:1800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012135
  },
  [43113511] = {
    id = 43113511,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113512:2001:10000"
    },
    buff_cd = 0
  },
  [43113512] = {
    id = 43113512,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 20, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012135
  },
  [43313501] = {
    id = 43313501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43313502] = {
    id = 43313502,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43313501,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43313503:3001:10000"
    },
    buff_cd = 0
  },
  [43313503] = {
    id = 43313503,
    type = 1,
    value = {
      "614:1:1:0:2000:0"
    },
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 104,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43413501] = {
    id = 43413501,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113601] = {
    id = 43113601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113602:3001:10000",
      "43113603:3001:10000"
    },
    buff_cd = 0
  },
  [43113602] = {
    id = 43113602,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "2.5")
    end,
    type = 60,
    value = {
      "611:1:1:0:250:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 5,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113603] = {
    id = 43113603,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "2.5")
    end,
    type = 60,
    value = {
      "611:1:1:0:250:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113604] = {
    id = 43113604,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113605:3001:10000",
      "43113606:3001:10000"
    },
    buff_cd = 0
  },
  [43113605] = {
    id = 43113605,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "3")
    end,
    type = 60,
    value = {
      "611:1:1:0:300:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 5,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113606] = {
    id = 43113606,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "3")
    end,
    type = 60,
    value = {
      "611:1:1:0:300:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113607] = {
    id = 43113607,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113608:3001:10000",
      "43113609:3001:10000"
    },
    buff_cd = 0
  },
  [43113608] = {
    id = 43113608,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "3.5")
    end,
    type = 60,
    value = {
      "611:1:1:0:350:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 5,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113609] = {
    id = 43113609,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "3.5")
    end,
    type = 60,
    value = {
      "611:1:1:0:350:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113610] = {
    id = 43113610,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113611:3001:10000",
      "43113612:3001:10000"
    },
    buff_cd = 0
  },
  [43113611] = {
    id = 43113611,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "4")
    end,
    type = 60,
    value = {
      "611:1:1:0:400:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113612] = {
    id = 43113612,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "4")
    end,
    type = 60,
    value = {
      "611:1:1:0:400:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113613] = {
    id = 43113613,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113614:3001:10000",
      "43113615:3001:10000"
    },
    buff_cd = 0
  },
  [43113614] = {
    id = 43113614,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "4.5")
    end,
    type = 60,
    value = {
      "611:1:1:0:450:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 5,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113615] = {
    id = 43113615,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "4.5")
    end,
    type = 60,
    value = {
      "611:1:1:0:450:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113616] = {
    id = 43113616,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113617:3001:10000",
      "43113618:3001:10000"
    },
    buff_cd = 0
  },
  [43113617] = {
    id = 43113617,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "5")
    end,
    type = 60,
    value = {
      "611:1:1:0:500:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 5,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43113618] = {
    id = 43113618,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506116, "5")
    end,
    type = 60,
    value = {
      "611:1:1:0:500:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313601,
    overlay_num = 10,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012136
  },
  [43313601] = {
    id = 43313601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43413601] = {
    id = 43413601,
    name = function()
      return T(80406500)
    end,
    des = function()
      return T(80506500, 20)
    end,
    type = 1,
    value = {
      "650:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113701] = {
    id = 43113701,
    type = 60,
    value = {
      "305:2:2:40000102:-3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    clean_buff_group = {
      "2:50",
      "2:70",
      "2:10"
    },
    settle_as_skill_id = 41012137
  },
  [43113702] = {
    id = 43113702,
    type = 60,
    value = {
      "305:2:2:40000102:-3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    clean_buff_group = {
      "2:50",
      "2:70",
      "2:10"
    },
    settle_as_skill_id = 41012137
  },
  [43113703] = {
    id = 43113703,
    type = 60,
    value = {
      "305:2:2:40000102:-3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    clean_buff_group = {
      "2:50",
      "2:70",
      "2:10"
    },
    settle_as_skill_id = 41012137
  },
  [43113704] = {
    id = 43113704,
    type = 60,
    value = {
      "305:2:2:40000102:-3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    clean_buff_group = {
      "2:50",
      "2:70",
      "2:10"
    },
    settle_as_skill_id = 41012137
  },
  [43113705] = {
    id = 43113705,
    type = 60,
    value = {
      "305:2:2:40000102:-3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    clean_buff_group = {
      "2:50",
      "2:70",
      "2:10"
    },
    settle_as_skill_id = 41012137
  },
  [43113706] = {
    id = 43113706,
    type = 60,
    value = {
      "305:2:2:40000102:-3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    clean_buff_group = {
      "2:50",
      "2:70",
      "2:10"
    },
    settle_as_skill_id = 41012137
  },
  [43213701] = {
    id = 43213701,
    name = function()
      return T(80406200)
    end,
    des = function()
      return T(80506202, 10)
    end,
    type = 60,
    value = {
      "620:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213702] = {
    id = 43213702,
    name = function()
      return T(80406200)
    end,
    des = function()
      return T(80506202, 11)
    end,
    type = 60,
    value = {
      "620:1:1:0:1100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213703] = {
    id = 43213703,
    name = function()
      return T(80406200)
    end,
    des = function()
      return T(80506202, 12)
    end,
    type = 60,
    value = {
      "620:1:1:0:1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213704] = {
    id = 43213704,
    name = function()
      return T(80406200)
    end,
    des = function()
      return T(80506202, 13)
    end,
    type = 60,
    value = {
      "620:1:1:0:1300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213705] = {
    id = 43213705,
    name = function()
      return T(80406200)
    end,
    des = function()
      return T(80506202, 14)
    end,
    type = 60,
    value = {
      "620:1:1:0:1400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213706] = {
    id = 43213706,
    name = function()
      return T(80406200)
    end,
    des = function()
      return T(80506202, 15)
    end,
    type = 60,
    value = {
      "620:1:1:0:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43413701] = {
    id = 43413701,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43413702] = {
    id = 43413702,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113801] = {
    id = 43113801,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113802:2001:1500"
    },
    buff_cd = 0
  },
  [43113802] = {
    id = 43113802,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 2)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012138
  },
  [43113803] = {
    id = 43113803,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113804:2001:1800"
    },
    buff_cd = 0
  },
  [43113804] = {
    id = 43113804,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 2)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012138
  },
  [43113805] = {
    id = 43113805,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113806:2001:2100"
    },
    buff_cd = 0
  },
  [43113806] = {
    id = 43113806,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 2)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012138
  },
  [43113807] = {
    id = 43113807,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113808:2001:2400"
    },
    buff_cd = 0
  },
  [43113808] = {
    id = 43113808,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 2)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012138
  },
  [43113809] = {
    id = 43113809,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113810:2001:2700"
    },
    buff_cd = 0
  },
  [43113810] = {
    id = 43113810,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 2)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012138
  },
  [43113811] = {
    id = 43113811,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43113812:2001:3000"
    },
    buff_cd = 0
  },
  [43113812] = {
    id = 43113812,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 2)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1,
    settle_as_skill_id = 41012138
  },
  [43213801] = {
    id = 43213801,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 3)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43213802] = {
    id = 43213802,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 3)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43213803] = {
    id = 43213803,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 3)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43213804] = {
    id = 43213804,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 3)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43213805] = {
    id = 43213805,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 3)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43213806] = {
    id = 43213806,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 3)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43413801] = {
    id = 43413801,
    name = function()
      return T(80406500)
    end,
    des = function()
      return T(80506500, 20)
    end,
    type = 1,
    value = {
      "650:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114001] = {
    id = 43114001,
    type = 30,
    value = {
      "304:1:2:40000102:-360:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012140
  },
  [43114002] = {
    id = 43114002,
    type = 30,
    value = {
      "304:1:2:40000102:-390:0",
      "304:1:1:0:-340:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012140
  },
  [43114003] = {
    id = 43114003,
    type = 30,
    value = {
      "304:1:2:40000102:-420:0",
      "304:1:1:0:-380:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012140
  },
  [43114004] = {
    id = 43114004,
    type = 30,
    value = {
      "304:1:2:40000102:-450:0",
      "304:1:1:0:-420:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012140
  },
  [43114005] = {
    id = 43114005,
    type = 30,
    value = {
      "304:1:2:40000102:-480:0",
      "304:1:1:0:-460:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012140
  },
  [43114006] = {
    id = 43114006,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012140
  },
  [43214001] = {
    id = 43214001,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506031, 20)
    end,
    type = 60,
    value = {
      "603:1:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214002] = {
    id = 43214002,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506031, 22)
    end,
    type = 60,
    value = {
      "603:1:1:0:2200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214003] = {
    id = 43214003,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506031, 24)
    end,
    type = 60,
    value = {
      "603:1:1:0:2400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214004] = {
    id = 43214004,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506031, 26)
    end,
    type = 60,
    value = {
      "603:1:1:0:2600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214005] = {
    id = 43214005,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506031, 28)
    end,
    type = 60,
    value = {
      "603:1:1:0:2800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214006] = {
    id = 43214006,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506031, 30)
    end,
    type = 60,
    value = {
      "603:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43314001] = {
    id = 43314001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43314002] = {
    id = 43314002,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 20, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314001,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43414001] = {
    id = 43414001,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506042, 15)
    end,
    type = 1,
    value = {
      "604:2:1:0:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114101] = {
    id = 43114101,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 10, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012141
  },
  [43114102] = {
    id = 43114102,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 12, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114103] = {
    id = 43114103,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 14, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114104] = {
    id = 43114104,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 16, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114105] = {
    id = 43114105,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 18, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:1800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114106] = {
    id = 43114106,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 20, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43214101] = {
    id = 43214101,
    name = function()
      return T(80405060)
    end,
    des = function()
      return T(80505060, 10)
    end,
    type = 50,
    value = {
      "506:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43214102] = {
    id = 43214102,
    name = function()
      return T(80405060)
    end,
    des = function()
      return T(80505060, 10)
    end,
    type = 50,
    value = {
      "506:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43214103] = {
    id = 43214103,
    name = function()
      return T(80405060)
    end,
    des = function()
      return T(80505060, 10)
    end,
    type = 50,
    value = {
      "506:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43214104] = {
    id = 43214104,
    name = function()
      return T(80405060)
    end,
    des = function()
      return T(80505060, 10)
    end,
    type = 50,
    value = {
      "506:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43214105] = {
    id = 43214105,
    name = function()
      return T(80405060)
    end,
    des = function()
      return T(80505060, 10)
    end,
    type = 50,
    value = {
      "506:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43214106] = {
    id = 43214106,
    name = function()
      return T(80405060)
    end,
    des = function()
      return T(80505060, 10)
    end,
    type = 50,
    value = {
      "506:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43314101] = {
    id = 43314101,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 8)
    end,
    type = 1,
    value = {
      "615:2:1:0:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43414101] = {
    id = 43414101,
    name = function()
      return T(80406500)
    end,
    des = function()
      return T(80506500, 20)
    end,
    type = 1,
    value = {
      "650:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114201] = {
    id = 43114201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114202:1000:3000",
      "43114203:2001:2500"
    },
    buff_cd = 0
  },
  [43114202] = {
    id = 43114202,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012142
  },
  [43114203] = {
    id = 43114203,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:9000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114204] = {
    id = 43114204,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114205:1000:3000",
      "43114206:2001:2500"
    },
    buff_cd = 0
  },
  [43114205] = {
    id = 43114205,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012142
  },
  [43114206] = {
    id = 43114206,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114207] = {
    id = 43114207,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114208:1000:3000",
      "43114209:2001:2500"
    },
    buff_cd = 0
  },
  [43114208] = {
    id = 43114208,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012142
  },
  [43114209] = {
    id = 43114209,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:11000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114210] = {
    id = 43114210,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114211:1000:3000",
      "43114212:2001:2500"
    },
    buff_cd = 0
  },
  [43114211] = {
    id = 43114211,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012142
  },
  [43114212] = {
    id = 43114212,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:12000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114213] = {
    id = 43114213,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114214:1000:3000",
      "43114215:2001:2500"
    },
    buff_cd = 0
  },
  [43114214] = {
    id = 43114214,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012142
  },
  [43114215] = {
    id = 43114215,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:13000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114216] = {
    id = 43114216,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114217:1000:3000",
      "43114218:2001:2500"
    },
    buff_cd = 0
  },
  [43114217] = {
    id = 43114217,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012142
  },
  [43114218] = {
    id = 43114218,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:14000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0
  },
  [43214201] = {
    id = 43214201,
    type = 10,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 1004,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214202] = {
    id = 43214202,
    type = 10,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 1004,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214203] = {
    id = 43214203,
    type = 10,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 1004,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214204] = {
    id = 43214204,
    type = 10,
    value = {
      "101:1:2:40000103:16000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 1004,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214205] = {
    id = 43214205,
    type = 10,
    value = {
      "101:1:2:40000103:18000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 1004,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214206] = {
    id = 43214206,
    type = 10,
    value = {
      "101:1:2:40000103:20000:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2010,
    trigger_type = 2,
    trigger_value = 1004,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43314201] = {
    id = 43314201,
    name = function()
      return T(80410040)
    end,
    des = function()
      return T(80510040)
    end,
    type = 1,
    value = {
      "1004:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43314202:1002:5000;43314203:1002:5000"
    },
    buff_cd = 0
  },
  [43314202] = {
    id = 43314202,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 15)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43314204:1002:10000"
    },
    buff_cd = 0
  },
  [43314203] = {
    id = 43314203,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507033, 80)
    end,
    type = 70,
    value = {
      "703:2:1:0:-80:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43314204:1002:10000"
    },
    buff_cd = 0
  },
  [43314204] = {
    id = 43314204,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43314201:3111:10000:1004201"
    },
    buff_cd = 0
  },
  [43414201] = {
    id = 43414201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    settle_buff_list = {
      "43414202:2021:10000"
    },
    deduce_buff_list = {
      "43414203:2021:10000"
    },
    buff_cd = 0
  },
  [43414202] = {
    id = 43414202,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507034, 20)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 1,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43414203] = {
    id = 43414203,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43414202"}
  },
  [43114301] = {
    id = 43114301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114302:1002:10000",
      "43114304:1002:10000",
      "43114306:2001:10000"
    },
    buff_cd = 0
  },
  [43114302] = {
    id = 43114302,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114356:43114303",
    settle_as_skill_id = 41012143
  },
  [43114303] = {
    id = 43114303,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114307:1002:10000"
    },
    buff_cd = 0
  },
  [43114304] = {
    id = 43114304,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114356:43114305",
    settle_as_skill_id = 41012143
  },
  [43114305] = {
    id = 43114305,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 2,
    deduce_buff_list = {
      "43114307:1002:10000"
    },
    buff_cd = 0
  },
  [43114306] = {
    id = 43114306,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114307] = {
    id = 43114307,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114308] = {
    id = 43114308,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114309:1002:10000",
      "43114311:1002:10000",
      "43114313:2001:10000"
    },
    buff_cd = 0
  },
  [43114309] = {
    id = 43114309,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114357:43114310",
    settle_as_skill_id = 41012143
  },
  [43114310] = {
    id = 43114310,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114314:1002:10000"
    },
    buff_cd = 0
  },
  [43114311] = {
    id = 43114311,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114357:43114312",
    settle_as_skill_id = 41012143
  },
  [43114312] = {
    id = 43114312,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 2,
    deduce_buff_list = {
      "43114314:1002:10000"
    },
    buff_cd = 0
  },
  [43114313] = {
    id = 43114313,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114314] = {
    id = 43114314,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114315] = {
    id = 43114315,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114316:1002:10000",
      "43114318:1002:10000",
      "43114320:2001:10000"
    },
    buff_cd = 0
  },
  [43114316] = {
    id = 43114316,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114358:43114317",
    settle_as_skill_id = 41012143
  },
  [43114317] = {
    id = 43114317,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114321:1002:10000"
    },
    buff_cd = 0
  },
  [43114318] = {
    id = 43114318,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114358:43114319",
    settle_as_skill_id = 41012143
  },
  [43114319] = {
    id = 43114319,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 2,
    deduce_buff_list = {
      "43114321:1002:10000"
    },
    buff_cd = 0
  },
  [43114320] = {
    id = 43114320,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114321] = {
    id = 43114321,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114322] = {
    id = 43114322,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114323:1002:10000",
      "43114325:1002:10000",
      "43114327:2001:10000"
    },
    buff_cd = 0
  },
  [43114323] = {
    id = 43114323,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114359:43114324",
    settle_as_skill_id = 41012143
  },
  [43114324] = {
    id = 43114324,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114328:1002:10000"
    },
    buff_cd = 0
  },
  [43114325] = {
    id = 43114325,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114359:43114326",
    settle_as_skill_id = 41012143
  },
  [43114326] = {
    id = 43114326,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 2,
    deduce_buff_list = {
      "43114328:1002:10000"
    },
    buff_cd = 0
  },
  [43114327] = {
    id = 43114327,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114328] = {
    id = 43114328,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114329] = {
    id = 43114329,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114330:1002:10000",
      "43114332:1002:10000",
      "43114334:2001:10000"
    },
    buff_cd = 0
  },
  [43114330] = {
    id = 43114330,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114360:43114331",
    settle_as_skill_id = 41012143
  },
  [43114331] = {
    id = 43114331,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114335:1002:10000"
    },
    buff_cd = 0
  },
  [43114332] = {
    id = 43114332,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114360:43114333",
    settle_as_skill_id = 41012143
  },
  [43114333] = {
    id = 43114333,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 2,
    deduce_buff_list = {
      "43114335:1002:10000"
    },
    buff_cd = 0
  },
  [43114334] = {
    id = 43114334,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114335] = {
    id = 43114335,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114336] = {
    id = 43114336,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114337:1002:10000",
      "43114339:1002:10000",
      "43114341:2001:10000"
    },
    buff_cd = 0
  },
  [43114337] = {
    id = 43114337,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114361:43114338",
    settle_as_skill_id = 41012143
  },
  [43114338] = {
    id = 43114338,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114342:1002:10000"
    },
    buff_cd = 0
  },
  [43114339] = {
    id = 43114339,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42114361:43114340",
    settle_as_skill_id = 41012143
  },
  [43114340] = {
    id = 43114340,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 2,
    deduce_buff_list = {
      "43114342:1002:10000"
    },
    buff_cd = 0
  },
  [43114341] = {
    id = 43114341,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114342] = {
    id = 43114342,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 5)
    end,
    type = 1,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214301] = {
    id = 43214301,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42314356:43214302"
  },
  [43214302] = {
    id = 43214302,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214303] = {
    id = 43214303,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    be_affected_with_effects = {650},
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42314356:43214304"
  },
  [43214304] = {
    id = 43214304,
    type = 1,
    value = {
      "126:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 2,
    buff_cd = 0
  },
  [43314301] = {
    id = 43314301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43414301] = {
    id = 43414301,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114501] = {
    id = 43114501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    buff_cd = 0
  },
  [43114502] = {
    id = 43114502,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114501,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    effective_condition = 2006,
    effective_type = 2,
    effective_value = 1005,
    settle_as_skill_id = 41012145
  },
  [43114503] = {
    id = 43114503,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    buff_cd = 0
  },
  [43114504] = {
    id = 43114504,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114503,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    effective_condition = 2006,
    effective_type = 2,
    effective_value = 1005,
    settle_as_skill_id = 41012145
  },
  [43114505] = {
    id = 43114505,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    buff_cd = 0
  },
  [43114506] = {
    id = 43114506,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114505,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    effective_condition = 2006,
    effective_type = 2,
    effective_value = 1005,
    settle_as_skill_id = 41012145
  },
  [43114507] = {
    id = 43114507,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    buff_cd = 0
  },
  [43114508] = {
    id = 43114508,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114507,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    effective_condition = 2006,
    effective_type = 2,
    effective_value = 1005,
    settle_as_skill_id = 41012145
  },
  [43114509] = {
    id = 43114509,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    buff_cd = 0
  },
  [43114510] = {
    id = 43114510,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114509,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    effective_condition = 2006,
    effective_type = 2,
    effective_value = 1005,
    settle_as_skill_id = 41012145
  },
  [43114511] = {
    id = 43114511,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    buff_cd = 0
  },
  [43114512] = {
    id = 43114512,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114511,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    effective_condition = 2006,
    effective_type = 2,
    effective_value = 1005,
    settle_as_skill_id = 41012145
  },
  [43214501] = {
    id = 43214501,
    name = function()
      return T(80410050)
    end,
    des = function()
      return T(80510050, 20, 7)
    end,
    type = 1,
    value = {
      "1005:2:2:40000104:-2000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314501,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43214502] = {
    id = 43214502,
    name = function()
      return T(80410050)
    end,
    des = function()
      return T(80510050, 20, 14)
    end,
    type = 1,
    value = {
      "1005:2:2:40000104:-2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314501,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 14,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43314501] = {
    id = 43314501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43414501] = {
    id = 43414501,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43414502] = {
    id = 43414502,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43014601] = {
    id = 43014601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43014602:1002:2500"
    },
    buff_cd = 0
  },
  [43014602] = {
    id = 43014602,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 10, 3)
    end,
    type = 70,
    value = {
      "701:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0
  },
  [43114601] = {
    id = 43114601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 116,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114602:3001:10000"
    },
    buff_cd = 0
  },
  [43114602] = {
    id = 43114602,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506012, "17.5")
    end,
    type = 1,
    value = {
      "601:2:1:0:-1750:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012146
  },
  [43114603] = {
    id = 43114603,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 116,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114604:3001:10000"
    },
    buff_cd = 0
  },
  [43114604] = {
    id = 43114604,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506012, "18")
    end,
    type = 1,
    value = {
      "601:2:1:0:-1800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012146
  },
  [43114605] = {
    id = 43114605,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 116,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114606:3001:10000"
    },
    buff_cd = 0
  },
  [43114606] = {
    id = 43114606,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506012, "18.5")
    end,
    type = 1,
    value = {
      "601:2:1:0:-1850:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012146
  },
  [43114607] = {
    id = 43114607,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 116,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114608:3001:10000"
    },
    buff_cd = 0
  },
  [43114608] = {
    id = 43114608,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506012, "19")
    end,
    type = 1,
    value = {
      "601:2:1:0:-1900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012146
  },
  [43114609] = {
    id = 43114609,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 116,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114610:3001:10000"
    },
    buff_cd = 0
  },
  [43114610] = {
    id = 43114610,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506012, "19.5")
    end,
    type = 1,
    value = {
      "601:2:1:0:-1950:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012146
  },
  [43114611] = {
    id = 43114611,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 116,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114612:3001:10000"
    },
    buff_cd = 0
  },
  [43114612] = {
    id = 43114612,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506012, "20")
    end,
    type = 1,
    value = {
      "601:2:1:0:-2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_as_skill_id = 41012146
  },
  [43214601] = {
    id = 43214601,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 100)
    end,
    type = 1,
    value = {
      "601:2:1:0:-10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214602] = {
    id = 43214602,
    type = 1,
    value = {
      "523:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214603] = {
    id = 43214603,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 110)
    end,
    type = 1,
    value = {
      "601:2:1:0:-11000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214604] = {
    id = 43214604,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 120)
    end,
    type = 1,
    value = {
      "601:2:1:0:-12000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214605] = {
    id = 43214605,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 130)
    end,
    type = 1,
    value = {
      "601:2:1:0:-13000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214606] = {
    id = 43214606,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 140)
    end,
    type = 1,
    value = {
      "601:2:1:0:-14000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214607] = {
    id = 43214607,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 150)
    end,
    type = 1,
    value = {
      "601:2:1:0:-15000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43314601] = {
    id = 43314601,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43314602] = {
    id = 43314602,
    type = 1,
    value = {
      "101:1:2:40000103:3000:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43314601,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43414601] = {
    id = 43414601,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43414602] = {
    id = 43414602,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114701] = {
    id = 43114701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114702:3001:10000"
    },
    buff_cd = 0
  },
  [43114702] = {
    id = 43114702,
    type = 10,
    value = {
      "125:1:2:40000101:500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43114703:3001:10000:606"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1,
    settle_as_skill_id = 41012147
  },
  [43114703] = {
    id = 43114703,
    type = 60,
    value = {
      "606:1:2:40000101:550:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114704] = {
    id = 43114704,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 155,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43114705:0:10000"
    },
    buff_cd = 0
  },
  [43114705] = {
    id = 43114705,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 10, 10)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:1000:0"
    },
    trigger_condition = 2143,
    trigger_type = 2,
    trigger_value = 606,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43114706] = {
    id = 43114706,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114707:3001:10000"
    },
    buff_cd = 0
  },
  [43114707] = {
    id = 43114707,
    type = 10,
    value = {
      "125:1:2:40000101:500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43114708:3001:10000:606"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1,
    settle_as_skill_id = 41012147
  },
  [43114708] = {
    id = 43114708,
    type = 60,
    value = {
      "606:1:2:40000101:590:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114709] = {
    id = 43114709,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 155,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43114710:0:10000"
    },
    buff_cd = 0
  },
  [43114710] = {
    id = 43114710,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 10, 10)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:1000:0"
    },
    trigger_condition = 2143,
    trigger_type = 2,
    trigger_value = 606,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43114711] = {
    id = 43114711,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114712:3001:10000"
    },
    buff_cd = 0
  },
  [43114712] = {
    id = 43114712,
    type = 10,
    value = {
      "125:1:2:40000101:500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43114713:3001:10000:606"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1,
    settle_as_skill_id = 41012147
  },
  [43114713] = {
    id = 43114713,
    type = 60,
    value = {
      "606:1:2:40000101:630:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114714] = {
    id = 43114714,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 155,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43114715:0:10000"
    },
    buff_cd = 0
  },
  [43114715] = {
    id = 43114715,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 10, 10)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:1000:0"
    },
    trigger_condition = 2143,
    trigger_type = 2,
    trigger_value = 606,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43114716] = {
    id = 43114716,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114717:3001:10000"
    },
    buff_cd = 0
  },
  [43114717] = {
    id = 43114717,
    type = 10,
    value = {
      "125:1:2:40000101:500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43114718:3001:10000:606"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1,
    settle_as_skill_id = 41012147
  },
  [43114718] = {
    id = 43114718,
    type = 60,
    value = {
      "606:1:2:40000101:670:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114719] = {
    id = 43114719,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 155,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43114720:0:10000"
    },
    buff_cd = 0
  },
  [43114720] = {
    id = 43114720,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 10, 10)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:1000:0"
    },
    trigger_condition = 2143,
    trigger_type = 2,
    trigger_value = 606,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43114721] = {
    id = 43114721,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114722:3001:10000"
    },
    buff_cd = 0
  },
  [43114722] = {
    id = 43114722,
    type = 10,
    value = {
      "125:1:2:40000101:500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43114723:3001:10000:606"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1,
    settle_as_skill_id = 41012147
  },
  [43114723] = {
    id = 43114723,
    type = 60,
    value = {
      "606:1:2:40000101:710:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114724] = {
    id = 43114724,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 155,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43114725:0:10000"
    },
    buff_cd = 0
  },
  [43114725] = {
    id = 43114725,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 10, 10)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:1000:0"
    },
    trigger_condition = 2143,
    trigger_type = 2,
    trigger_value = 606,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43114726] = {
    id = 43114726,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43114727:3001:10000"
    },
    buff_cd = 0
  },
  [43114727] = {
    id = 43114727,
    type = 10,
    value = {
      "125:1:2:40000101:500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43114728:3001:10000:606"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1,
    settle_as_skill_id = 41012147
  },
  [43114728] = {
    id = 43114728,
    type = 60,
    value = {
      "606:1:2:40000101:900:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114729] = {
    id = 43114729,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 155,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43114730:0:10000"
    },
    buff_cd = 0
  },
  [43114730] = {
    id = 43114730,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 10, 10)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:1000:0"
    },
    trigger_condition = 2143,
    trigger_type = 2,
    trigger_value = 606,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43214701] = {
    id = 43214701,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2101,
    trigger_type = 4,
    trigger_value = 3000,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43214702] = {
    id = 43214702,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2101,
    trigger_type = 4,
    trigger_value = 3400,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43214703] = {
    id = 43214703,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2101,
    trigger_type = 4,
    trigger_value = 3800,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43214704] = {
    id = 43214704,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2101,
    trigger_type = 4,
    trigger_value = 4200,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43214705] = {
    id = 43214705,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2101,
    trigger_type = 4,
    trigger_value = 4600,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43214706] = {
    id = 43214706,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2101,
    trigger_type = 4,
    trigger_value = 5000,
    overlay_num = 1,
    settle_type = 34,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43314701] = {
    id = 43314701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 12,
    deduce_cnt = -1,
    settle_buff_list = {
      "43314702:3001:10000",
      "43314703:3001:10000"
    },
    deduce_buff_list = {
      "43314702:3001:10000",
      "43314703:3001:10000"
    },
    buff_cd = 0
  },
  [43314702] = {
    id = 43314702,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506024, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2011,
    trigger_type = 1,
    trigger_value = 5000,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 137,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43314703] = {
    id = 43314703,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506153, 8)
    end,
    type = 60,
    value = {
      "615:2:1:0:-800:0"
    },
    trigger_condition = 2011,
    trigger_type = 4,
    trigger_value = 5000,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 136,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43414701] = {
    id = 43414701,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114801] = {
    id = 43114801,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114802:2012:10000:1004802",
      "43114803:1002:10000",
      "43114819:2001:10000:1004801",
      "43114803:1002:10000",
      "43114803:1002:10000"
    },
    buff_cd = 0
  },
  [43114802] = {
    id = 43114802,
    type = 10,
    value = {
      "107:1:2:40000103:9000:1"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114803:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43114803] = {
    id = 43114803,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 2.5, 5)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 6,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114804] = {
    id = 43114804,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114805:2012:10000:1004802",
      "43114806:1002:10000",
      "43114819:2001:10000:1004801",
      "43114806:1002:10000",
      "43114806:1002:10000"
    },
    buff_cd = 0
  },
  [43114805] = {
    id = 43114805,
    type = 10,
    value = {
      "107:1:2:40000103:10000:1"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114806:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43114806] = {
    id = 43114806,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 3, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 6,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114807] = {
    id = 43114807,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114808:2012:10000:1004802",
      "43114809:1002:10000",
      "43114819:2001:10000:1004801",
      "43114809:1002:10000",
      "43114809:1002:10000"
    },
    buff_cd = 0
  },
  [43114808] = {
    id = 43114808,
    type = 10,
    value = {
      "107:1:2:40000103:11000:1"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114809:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43114809] = {
    id = 43114809,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 3.5, 7)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 6,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 7,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114810] = {
    id = 43114810,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114811:2012:10000:1004802",
      "43114812:1002:10000",
      "43114819:2001:10000:1004801",
      "43114812:1002:10000",
      "43114812:1002:10000"
    },
    buff_cd = 0
  },
  [43114811] = {
    id = 43114811,
    type = 10,
    value = {
      "107:1:2:40000103:12000:1"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114812:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43114812] = {
    id = 43114812,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 4, 8)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 6,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114813] = {
    id = 43114813,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114814:2012:10000:1004802",
      "43114815:1002:10000",
      "43114819:2001:10000:1004801",
      "43114815:1002:10000",
      "43114815:1002:10000"
    },
    buff_cd = 0
  },
  [43114814] = {
    id = 43114814,
    type = 10,
    value = {
      "107:1:2:40000103:13000:1"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114815:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43114815] = {
    id = 43114815,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 4.5, 9)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 6,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 9,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114816] = {
    id = 43114816,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114817:2012:10000:1004802",
      "43114818:1002:10000",
      "43114819:2001:10000:1004801",
      "43114818:1002:10000",
      "43114818:1002:10000"
    },
    buff_cd = 0
  },
  [43114817] = {
    id = 43114817,
    type = 10,
    value = {
      "107:1:2:40000103:14000:1"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114818:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43114818] = {
    id = 43114818,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 10)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 6,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114819] = {
    id = 43114819,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43214801] = {
    id = 43214801,
    type = 1,
    value = {
      "101:1:32:40000103:3500:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214802] = {
    id = 43214802,
    type = 1,
    value = {
      "101:1:32:40000103:5000:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214803] = {
    id = 43214803,
    type = 1,
    value = {
      "101:1:32:40000103:4500:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214804] = {
    id = 43214804,
    type = 1,
    value = {
      "101:1:32:40000103:6000:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214805] = {
    id = 43214805,
    type = 1,
    value = {
      "101:1:32:40000103:5500:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214806] = {
    id = 43214806,
    type = 1,
    value = {
      "101:1:32:40000103:7000:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214807] = {
    id = 43214807,
    type = 1,
    value = {
      "101:1:32:40000103:6500:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214808] = {
    id = 43214808,
    type = 1,
    value = {
      "101:1:32:40000103:8000:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214809] = {
    id = 43214809,
    type = 1,
    value = {
      "101:1:32:40000103:7500:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214810] = {
    id = 43214810,
    type = 1,
    value = {
      "101:1:32:40000103:9000:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214811] = {
    id = 43214811,
    type = 1,
    value = {
      "101:1:32:40000103:8500:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43214812] = {
    id = 43214812,
    type = 1,
    value = {
      "101:1:32:40000103:10000:0"
    },
    be_affected_with_effects = {650},
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314801,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43314801] = {
    id = 43314801,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43414801] = {
    id = 43414801,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 7)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43414802] = {
    id = 43414802,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506014, 7)
    end,
    type = 1,
    value = {
      "601:2:1:0:-700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43114901] = {
    id = 43114901,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43114902] = {
    id = 43114902,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114901,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114903] = {
    id = 43114903,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114901,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114904:1002:5000",
      "43114906:1002:10000"
    },
    buff_cd = 0
  },
  [43114904] = {
    id = 43114904,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114905:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114905] = {
    id = 43114905,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114906] = {
    id = 43114906,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114907:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114907] = {
    id = 43114907,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114908] = {
    id = 43114908,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43114909] = {
    id = 43114909,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114908,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114910] = {
    id = 43114910,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114908,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114911:1002:5000",
      "43114913:1002:10000"
    },
    buff_cd = 0
  },
  [43114911] = {
    id = 43114911,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114912:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114912] = {
    id = 43114912,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114913] = {
    id = 43114913,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114914:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114914] = {
    id = 43114914,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114915] = {
    id = 43114915,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43114916] = {
    id = 43114916,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114915,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114917] = {
    id = 43114917,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114915,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114918:1002:5000",
      "43114920:1002:10000"
    },
    buff_cd = 0
  },
  [43114918] = {
    id = 43114918,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114919:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114919] = {
    id = 43114919,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114920] = {
    id = 43114920,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114921:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114921] = {
    id = 43114921,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114922] = {
    id = 43114922,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43114923] = {
    id = 43114923,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114922,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114924] = {
    id = 43114924,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114922,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114925:1002:5000",
      "43114927:1002:10000"
    },
    buff_cd = 0
  },
  [43114925] = {
    id = 43114925,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114926:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114926] = {
    id = 43114926,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114927] = {
    id = 43114927,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114928:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114928] = {
    id = 43114928,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114929] = {
    id = 43114929,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43114930] = {
    id = 43114930,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114929,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114931] = {
    id = 43114931,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114929,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114932:1002:5000",
      "43114934:1002:10000"
    },
    buff_cd = 0
  },
  [43114932] = {
    id = 43114932,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114933:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114933] = {
    id = 43114933,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114934] = {
    id = 43114934,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114935:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114935] = {
    id = 43114935,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114936] = {
    id = 43114936,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43114937] = {
    id = 43114937,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114936,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114938] = {
    id = 43114938,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43114936,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43114939:1002:5000",
      "43114941:1002:10000"
    },
    buff_cd = 0
  },
  [43114939] = {
    id = 43114939,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114940:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114940] = {
    id = 43114940,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43114941] = {
    id = 43114941,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    settle_buff_list = {
      "43114942:4011:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012149
  },
  [43114942] = {
    id = 43114942,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 5, 6)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43314902,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43314901] = {
    id = 43314901,
    type = 1,
    value = {
      "524:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    range_type = 3,
    range_x = 300
  },
  [43314902] = {
    id = 43314902,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43414901] = {
    id = 43414901,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43115001] = {
    id = 43115001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115002:1000:3000"
    },
    buff_cd = 0
  },
  [43115002] = {
    id = 43115002,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012150
  },
  [43115003] = {
    id = 43115003,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115004:1000:3000"
    },
    buff_cd = 0
  },
  [43115004] = {
    id = 43115004,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012150
  },
  [43115005] = {
    id = 43115005,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115006:1000:3000"
    },
    buff_cd = 0
  },
  [43115006] = {
    id = 43115006,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012150
  },
  [43115007] = {
    id = 43115007,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115008:1000:3000"
    },
    buff_cd = 0
  },
  [43115008] = {
    id = 43115008,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012150
  },
  [43115009] = {
    id = 43115009,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115010:1000:3000"
    },
    buff_cd = 0
  },
  [43115010] = {
    id = 43115010,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012150
  },
  [43115011] = {
    id = 43115011,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115012:1000:3000"
    },
    buff_cd = 0
  },
  [43115012] = {
    id = 43115012,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012150
  },
  [43215001] = {
    id = 43215001,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 10, 5)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215002] = {
    id = 43215002,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 10, 10)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215003] = {
    id = 43215003,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 11, 5)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1100:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215004] = {
    id = 43215004,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 11, 10)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1100:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215005] = {
    id = 43215005,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 12, 5)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1200:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215006] = {
    id = 43215006,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 12, 10)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1200:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215007] = {
    id = 43215007,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 13, 5)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1300:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215008] = {
    id = 43215008,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 13, 10)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1300:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215009] = {
    id = 43215009,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 14, 5)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1400:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215010] = {
    id = 43215010,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 14, 10)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1400:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215011] = {
    id = 43215011,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 15, 5)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1500:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43215012] = {
    id = 43215012,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 15, 10)
    end,
    type = 60,
    value = {
      "703:2:2:40000104:-1500:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43315001] = {
    id = 43315001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43415001] = {
    id = 43415001,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43415002] = {
    id = 43415002,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43115201] = {
    id = 43115201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43115202:3222:10000"
    },
    buff_cd = 0
  },
  [43115202] = {
    id = 43115202,
    type = 30,
    value = {
      "304:1:2:40000102:0:0",
      "304:1:1:0:-250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115203] = {
    id = 43115203,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43115204:3222:10000"
    },
    buff_cd = 0
  },
  [43115204] = {
    id = 43115204,
    type = 30,
    value = {
      "304:1:2:40000102:0:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115205] = {
    id = 43115205,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43115206:3222:10000"
    },
    buff_cd = 0
  },
  [43115206] = {
    id = 43115206,
    type = 30,
    value = {
      "304:1:2:40000102:0:0",
      "304:1:1:0:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115207] = {
    id = 43115207,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43115208:3222:10000"
    },
    buff_cd = 0
  },
  [43115208] = {
    id = 43115208,
    type = 30,
    value = {
      "304:1:2:40000102:0:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115209] = {
    id = 43115209,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43115210:3222:10000"
    },
    buff_cd = 0
  },
  [43115210] = {
    id = 43115210,
    type = 30,
    value = {
      "304:1:2:40000102:0:0",
      "304:1:1:0:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115211] = {
    id = 43115211,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43115212:3222:10000"
    },
    buff_cd = 0
  },
  [43115212] = {
    id = 43115212,
    type = 30,
    value = {
      "304:1:2:40000102:0:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43215201] = {
    id = 43215201,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 10, 10)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215202] = {
    id = 43215202,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 11, 10)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-1100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215203] = {
    id = 43215203,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 12, 10)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-1200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215204] = {
    id = 43215204,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 13, 10)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-1300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215205] = {
    id = 43215205,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 14, 10)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-1400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215206] = {
    id = 43215206,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 15, 10)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43315201] = {
    id = 43315201,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 30)
    end,
    type = 1,
    value = {
      "615:2:1:0:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43315202] = {
    id = 43315202,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {
      "2:50",
      "2:70",
      "2:10"
    }
  },
  [43415201] = {
    id = 43415201,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43115301] = {
    id = 43115301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115302] = {
    id = 43115302,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115301,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012153
  },
  [43115303] = {
    id = 43115303,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115304] = {
    id = 43115304,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115303,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012153
  },
  [43115305] = {
    id = 43115305,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115306] = {
    id = 43115306,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115305,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012153
  },
  [43115307] = {
    id = 43115307,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115308] = {
    id = 43115308,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115307,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012153
  },
  [43115309] = {
    id = 43115309,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115310] = {
    id = 43115310,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115309,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012153
  },
  [43115311] = {
    id = 43115311,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115312] = {
    id = 43115312,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115311,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012153
  },
  [43315301] = {
    id = 43315301,
    name = function()
      return T(80401220)
    end,
    des = function()
      return T(80501224, 15)
    end,
    type = 1,
    value = {
      "651:1:1:0:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43415301] = {
    id = 43415301,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43415302] = {
    id = 43415302,
    name = function()
      return T(80406190)
    end,
    des = function()
      return T(80506192, 30)
    end,
    type = 1,
    value = {
      "619:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43115401] = {
    id = 43115401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115402:3001:5000"
    },
    buff_cd = 0
  },
  [43115402] = {
    id = 43115402,
    type = 1,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012154
  },
  [43115403] = {
    id = 43115403,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115404:3001:5000"
    },
    buff_cd = 0
  },
  [43115404] = {
    id = 43115404,
    type = 1,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012154
  },
  [43115405] = {
    id = 43115405,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115406:3001:5000"
    },
    buff_cd = 0
  },
  [43115406] = {
    id = 43115406,
    type = 1,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012154
  },
  [43115407] = {
    id = 43115407,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115408:3001:5000"
    },
    buff_cd = 0
  },
  [43115408] = {
    id = 43115408,
    type = 1,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012154
  },
  [43115409] = {
    id = 43115409,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115410:3001:5000"
    },
    buff_cd = 0
  },
  [43115410] = {
    id = 43115410,
    type = 1,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012154
  },
  [43115411] = {
    id = 43115411,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115412:3001:5000"
    },
    buff_cd = 0
  },
  [43115412] = {
    id = 43115412,
    type = 1,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 2,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_as_skill_id = 41012154
  },
  [43215401] = {
    id = 43215401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43215402:1002:10000:1005401",
      "43215403:1002:10000:1005401"
    },
    buff_cd = 0
  },
  [43215402] = {
    id = 43215402,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 20, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215403] = {
    id = 43215403,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 20, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215404] = {
    id = 43215404,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43215405:1002:10000:1005401",
      "43215406:1002:10000:1005401"
    },
    buff_cd = 0
  },
  [43215405] = {
    id = 43215405,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 24, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:2400:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215406] = {
    id = 43215406,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 24, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:2400:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215407] = {
    id = 43215407,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43215408:1002:10000:1005401",
      "43215409:1002:10000:1005401"
    },
    buff_cd = 0
  },
  [43215408] = {
    id = 43215408,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 28, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:2800:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215409] = {
    id = 43215409,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 28, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:2800:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215410] = {
    id = 43215410,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43215411:1002:10000:1005401",
      "43215412:1002:10000:1005401"
    },
    buff_cd = 0
  },
  [43215411] = {
    id = 43215411,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 32, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:3200:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215412] = {
    id = 43215412,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 32, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:3200:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215413] = {
    id = 43215413,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43215414:1002:10000:1005401",
      "43215415:1002:10000:1005401"
    },
    buff_cd = 0
  },
  [43215414] = {
    id = 43215414,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 36, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:3600:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215415] = {
    id = 43215415,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 36, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:3600:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215416] = {
    id = 43215416,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43215417:1002:10000:1005401",
      "43215418:1002:10000:1005401"
    },
    buff_cd = 0
  },
  [43215417] = {
    id = 43215417,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 40, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:4000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [43215418] = {
    id = 43215418,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 40, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:4000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43315401,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43315401] = {
    id = 43315401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43415401] = {
    id = 43415401,
    name = function()
      return T(80406500)
    end,
    des = function()
      return T(80506500, 20)
    end,
    type = 1,
    value = {
      "650:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43115501] = {
    id = 43115501,
    type = 10,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115503,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115502:3001:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115502] = {
    id = 43115502,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0",
      "304:1:1:0:-250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115503] = {
    id = 43115503,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115504] = {
    id = 43115504,
    type = 10,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115506,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115505:3001:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115505] = {
    id = 43115505,
    type = 30,
    value = {
      "304:1:2:40000102:-600:0",
      "304:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115506] = {
    id = 43115506,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115507] = {
    id = 43115507,
    type = 10,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115509,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115508:3001:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115508] = {
    id = 43115508,
    type = 30,
    value = {
      "304:1:2:40000102:-700:0",
      "304:1:1:0:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115509] = {
    id = 43115509,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115510] = {
    id = 43115510,
    type = 10,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115512,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115511:3001:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115511] = {
    id = 43115511,
    type = 30,
    value = {
      "304:1:2:40000102:-800:0",
      "304:1:1:0:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115512] = {
    id = 43115512,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115513] = {
    id = 43115513,
    type = 10,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115515,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115514:3001:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115514] = {
    id = 43115514,
    type = 30,
    value = {
      "304:1:2:40000102:-900:0",
      "304:1:1:0:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115515] = {
    id = 43115515,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43115516] = {
    id = 43115516,
    type = 10,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43115518,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115517:3001:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115517] = {
    id = 43115517,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43115518] = {
    id = 43115518,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43315501] = {
    id = 43315501,
    type = 1,
    value = {
      "525:1:1:0:2203:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43415501] = {
    id = 43415501,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43415502] = {
    id = 43415502,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43200001] = {
    id = 43200001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"2:108"},
    clean_add_buff = {
      "43200002:3001:10000"
    }
  },
  [43200002] = {
    id = 43200002,
    type = 1,
    value = {
      "112:1:4:0:300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43200003] = {
    id = 43200003,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"2:108"},
    clean_add_buff = {
      "43200004:3001:10000"
    }
  },
  [43200004] = {
    id = 43200004,
    type = 1,
    value = {
      "112:1:4:0:400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43200005] = {
    id = 43200005,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"2:108"},
    clean_add_buff = {
      "43200006:3001:10000"
    }
  },
  [43200006] = {
    id = 43200006,
    type = 1,
    value = {
      "112:1:4:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43200007] = {
    id = 43200007,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"2:108"},
    clean_add_buff = {
      "43200008:3001:10000"
    }
  },
  [43200008] = {
    id = 43200008,
    type = 1,
    value = {
      "112:1:4:0:600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43200009] = {
    id = 43200009,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"2:108"},
    clean_add_buff = {
      "43200010:3001:10000"
    }
  },
  [43200010] = {
    id = 43200010,
    type = 1,
    value = {
      "112:1:4:0:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43200011] = {
    id = 43200011,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"2:108"},
    clean_add_buff = {
      "43200012:3001:10000"
    }
  },
  [43200012] = {
    id = 43200012,
    type = 1,
    value = {
      "112:1:4:0:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43117001] = {
    id = 43117001,
    type = 10,
    value = {
      "101:1:2:40000103:7000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43117002,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43117003:0:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43117002] = {
    id = 43117002,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43117003] = {
    id = 43117003,
    type = 10,
    value = {
      "101:1:2:40000103:1500:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2005,
    trigger_type = 2,
    trigger_value = 720,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43117004] = {
    id = 43117004,
    type = 10,
    value = {
      "101:1:2:40000103:8000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43117005,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43117006:0:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43117005] = {
    id = 43117005,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43117006] = {
    id = 43117006,
    type = 10,
    value = {
      "101:1:2:40000103:1800:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2005,
    trigger_type = 2,
    trigger_value = 720,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43117007] = {
    id = 43117007,
    type = 10,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43117008,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43117009:0:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43117008] = {
    id = 43117008,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43117009] = {
    id = 43117009,
    type = 10,
    value = {
      "101:1:2:40000103:2100:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2005,
    trigger_type = 2,
    trigger_value = 720,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43117010] = {
    id = 43117010,
    type = 10,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43117011,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43117012:0:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43117011] = {
    id = 43117011,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43117012] = {
    id = 43117012,
    type = 10,
    value = {
      "101:1:2:40000103:2400:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2005,
    trigger_type = 2,
    trigger_value = 720,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43117013] = {
    id = 43117013,
    type = 10,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43117014,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43117015:0:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43117014] = {
    id = 43117014,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43117015] = {
    id = 43117015,
    type = 10,
    value = {
      "101:1:2:40000103:2700:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2005,
    trigger_type = 2,
    trigger_value = 720,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43117016] = {
    id = 43117016,
    type = 10,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43117017,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43117018:0:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43117017] = {
    id = 43117017,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43117018] = {
    id = 43117018,
    type = 10,
    value = {
      "101:1:2:40000103:3000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2005,
    trigger_type = 2,
    trigger_value = 720,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43217001] = {
    id = 43217001,
    type = 10,
    value = {
      "101:1:33:40000103:20000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217002] = {
    id = 43217002,
    type = 10,
    value = {
      "101:1:33:40000103:26000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217003] = {
    id = 43217003,
    type = 10,
    value = {
      "101:1:33:40000103:24000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217004] = {
    id = 43217004,
    type = 10,
    value = {
      "101:1:33:40000103:30000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217005] = {
    id = 43217005,
    type = 10,
    value = {
      "101:1:33:40000103:28000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217006] = {
    id = 43217006,
    type = 10,
    value = {
      "101:1:33:40000103:34000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217007] = {
    id = 43217007,
    type = 10,
    value = {
      "101:1:33:40000103:32000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217008] = {
    id = 43217008,
    type = 10,
    value = {
      "101:1:33:40000103:38000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217009] = {
    id = 43217009,
    type = 10,
    value = {
      "101:1:33:40000103:36000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217010] = {
    id = 43217010,
    type = 10,
    value = {
      "101:1:33:40000103:42000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217011] = {
    id = 43217011,
    type = 10,
    value = {
      "101:1:33:40000103:40000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217012] = {
    id = 43217012,
    type = 10,
    value = {
      "101:1:33:40000103:46000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43317001,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43217013] = {
    id = 43217013,
    type = 1,
    value = {
      "536:1:1:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    extra_param = "0:-4000:-5000:-6000:-7000:-8000"
  },
  [43317001] = {
    id = 43317001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43317002] = {
    id = 43317002,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 31,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43317003:1002:10000"
    },
    buff_cd = 0
  },
  [43317003] = {
    id = 43317003,
    type = 1,
    value = {
      "535:1:1:0:1:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43417001] = {
    id = 43417001,
    type = 1,
    value = {
      "656:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43417002] = {
    id = 43417002,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43115101] = {
    id = 43115101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115102:2001:10000"
    },
    buff_cd = 0
  },
  [43115102] = {
    id = 43115102,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 2.5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115103:1001:10000",
      "43115104:1007:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115103] = {
    id = 43115103,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43115104:1007:10000"
    },
    buff_cd = 0
  },
  [43115104] = {
    id = 43115104,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43115105:1007:10000"
    },
    buff_cd = 0
  },
  [43115105] = {
    id = 43115105,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43115102", "1:43115103"}
  },
  [43115106] = {
    id = 43115106,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115107:2001:10000"
    },
    buff_cd = 0
  },
  [43115107] = {
    id = 43115107,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 3)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115108:1001:10000",
      "43115109:1007:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115108] = {
    id = 43115108,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 7)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43115109:1007:10000"
    },
    buff_cd = 0
  },
  [43115109] = {
    id = 43115109,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43115110:1007:10000"
    },
    buff_cd = 0
  },
  [43115110] = {
    id = 43115110,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43115107", "1:43115108"}
  },
  [43115111] = {
    id = 43115111,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115112:2001:10000"
    },
    buff_cd = 0
  },
  [43115112] = {
    id = 43115112,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 3.5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115113:1001:10000",
      "43115114:1007:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115113] = {
    id = 43115113,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 9)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43115114:1007:10000"
    },
    buff_cd = 0
  },
  [43115114] = {
    id = 43115114,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43115115:1007:10000"
    },
    buff_cd = 0
  },
  [43115115] = {
    id = 43115115,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43115112", "1:43115113"}
  },
  [43115116] = {
    id = 43115116,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115117:2001:10000"
    },
    buff_cd = 0
  },
  [43115117] = {
    id = 43115117,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 4)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115118:1001:10000",
      "43115119:1007:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115118] = {
    id = 43115118,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 11)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43115119:1007:10000"
    },
    buff_cd = 0
  },
  [43115119] = {
    id = 43115119,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43115120:1007:10000"
    },
    buff_cd = 0
  },
  [43115120] = {
    id = 43115120,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43115117", "1:43115118"}
  },
  [43115121] = {
    id = 43115121,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115122:2001:10000"
    },
    buff_cd = 0
  },
  [43115122] = {
    id = 43115122,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 4.5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115123:1001:10000",
      "43115124:1007:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115123] = {
    id = 43115123,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 13)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43115124:1007:10000"
    },
    buff_cd = 0
  },
  [43115124] = {
    id = 43115124,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43115125:1007:10000"
    },
    buff_cd = 0
  },
  [43115125] = {
    id = 43115125,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43115122", "1:43115123"}
  },
  [43115126] = {
    id = 43115126,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43115127:2001:10000"
    },
    buff_cd = 0
  },
  [43115127] = {
    id = 43115127,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    settle_buff_list = {
      "43115128:1001:10000",
      "43115129:1007:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43115128] = {
    id = 43115128,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43115129:1007:10000"
    },
    buff_cd = 0
  },
  [43115129] = {
    id = 43115129,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43115130:1007:10000"
    },
    buff_cd = 0
  },
  [43115130] = {
    id = 43115130,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43115127", "1:43115128"}
  },
  [43315101] = {
    id = 43315101,
    type = 30,
    value = {
      "304:1:2:40000102:-10000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43415101] = {
    id = 43415101,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43415102] = {
    id = 43415102,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 15)
    end,
    type = 1,
    value = {
      "611:2:1:0:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43116101] = {
    id = 43116101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 10,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43116102:2001:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43116104", "1:43116105"}
  },
  [43116102] = {
    id = 43116102,
    type = 1,
    value = {
      "541:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43116103] = {
    id = 43116103,
    name = function()
      return T(80410070)
    end,
    des = function()
      return T(80510070, 2)
    end,
    type = 1,
    value = {
      "1007:2:36:40000103:200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43116104] = {
    id = 43116104,
    name = function()
      return T(80405390)
    end,
    des = function()
      return T(80505390)
    end,
    type = 1,
    value = {
      "539:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {
      "101:2",
      "101:4",
      "101:6"
    },
    immune_group = {
      "101:2",
      "101:4",
      "101:6"
    }
  },
  [43116105] = {
    id = 43116105,
    type = 1,
    value = {
      "518:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    delay_frame_settle = 1
  },
  [43116106] = {
    id = 43116106,
    name = function()
      return T(80410070)
    end,
    des = function()
      return T(80510070, 2.2)
    end,
    type = 1,
    value = {
      "1007:2:36:40000103:220:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43116107] = {
    id = 43116107,
    name = function()
      return T(80410070)
    end,
    des = function()
      return T(80510070, 2.4)
    end,
    type = 1,
    value = {
      "1007:2:36:40000103:240:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43116108] = {
    id = 43116108,
    name = function()
      return T(80410070)
    end,
    des = function()
      return T(80510070, 2.6)
    end,
    type = 1,
    value = {
      "1007:2:36:40000103:260:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43116109] = {
    id = 43116109,
    name = function()
      return T(80410070)
    end,
    des = function()
      return T(80510070, 2.8)
    end,
    type = 1,
    value = {
      "1007:2:36:40000103:280:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43116110] = {
    id = 43116110,
    name = function()
      return T(80410070)
    end,
    des = function()
      return T(80510070, 3)
    end,
    type = 1,
    value = {
      "1007:2:36:40000103:300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43216101] = {
    id = 43216101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 22,
    deduce_buff_list = {
      "43216102:1002:10000"
    },
    buff_cd = 0
  },
  [43216102] = {
    id = 43216102,
    type = 1,
    value = {
      "507:1:1:0:2021:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43216113:3151:10000"
    },
    deduce_buff_list = {
      "43216113:3151:10000"
    },
    buff_cd = 0
  },
  [43216103] = {
    id = 43216103,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 22,
    deduce_buff_list = {
      "43216104:1002:10000"
    },
    buff_cd = 0
  },
  [43216104] = {
    id = 43216104,
    type = 1,
    value = {
      "507:1:1:0:2022:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43216113:3151:10000"
    },
    deduce_buff_list = {
      "43216113:3151:10000"
    },
    buff_cd = 0
  },
  [43216105] = {
    id = 43216105,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 22,
    deduce_buff_list = {
      "43216106:1002:10000"
    },
    buff_cd = 0
  },
  [43216106] = {
    id = 43216106,
    type = 1,
    value = {
      "507:1:1:0:2023:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43216113:3151:10000"
    },
    deduce_buff_list = {
      "43216113:3151:10000"
    },
    buff_cd = 0
  },
  [43216107] = {
    id = 43216107,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 22,
    deduce_buff_list = {
      "43216108:1002:10000"
    },
    buff_cd = 0
  },
  [43216108] = {
    id = 43216108,
    type = 1,
    value = {
      "507:1:1:0:2024:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43216113:3151:10000"
    },
    deduce_buff_list = {
      "43216113:3151:10000"
    },
    buff_cd = 0
  },
  [43216109] = {
    id = 43216109,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 22,
    deduce_buff_list = {
      "43216110:1002:10000"
    },
    buff_cd = 0
  },
  [43216110] = {
    id = 43216110,
    type = 1,
    value = {
      "507:1:1:0:2025:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43216113:3151:10000"
    },
    deduce_buff_list = {
      "43216113:3151:10000"
    },
    buff_cd = 0
  },
  [43216111] = {
    id = 43216111,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 22,
    deduce_buff_list = {
      "43216112:1002:10000"
    },
    buff_cd = 0
  },
  [43216112] = {
    id = 43216112,
    type = 1,
    value = {
      "507:1:1:0:2026:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43216113:3151:10000"
    },
    buff_cd = 0
  },
  [43216113] = {
    id = 43216113,
    type = 1,
    value = {
      "614:1:16:0:650:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [43216114] = {
    id = 43216114,
    name = function()
      return T(80405390)
    end,
    des = function()
      return T(80505390)
    end,
    type = 1,
    value = {
      "539:0:0:0:0:0",
      "518:0:0:0:0:0",
      "542:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43216115:3151:10000"
    },
    buff_cd = 0,
    clean_buff_group = {
      "101:2",
      "101:4",
      "101:6"
    },
    immune_group = {
      "101:2",
      "101:4",
      "101:6"
    }
  },
  [43216115] = {
    id = 43216115,
    name = function()
      return T(80405390)
    end,
    des = function()
      return T(80505390)
    end,
    type = 1,
    value = {
      "539:0:0:0:0:0",
      "518:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {
      "101:2",
      "101:4",
      "101:6"
    },
    immune_group = {
      "101:2",
      "101:4",
      "101:6"
    }
  },
  [43216116] = {
    id = 43216116,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506114, 30)
    end,
    type = 60,
    value = {
      "611:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 10,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43316101] = {
    id = 43316101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 14,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43316102:1002:10000:1006101"
    },
    buff_cd = 0
  },
  [43316102] = {
    id = 43316102,
    name = function()
      return T(80404060)
    end,
    des = function()
      return T(80504060, 10)
    end,
    type = 40,
    value = {
      "406:0:0:0:0:0",
      "540:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43416101] = {
    id = 43416101,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506117, 5)
    end,
    type = 1,
    value = {
      "611:2:1:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43416102] = {
    id = 43416102,
    name = function()
      return T(80406190)
    end,
    des = function()
      return T(80506192, 20)
    end,
    type = 1,
    value = {
      "619:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43416103] = {
    id = 43416103,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43118001] = {
    id = 43118001,
    type = 30,
    value = {
      "304:1:2:40000102:-400:0",
      "304:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43118002] = {
    id = 43118002,
    type = 30,
    value = {
      "304:1:2:40000102:-450:0",
      "304:1:1:0:-600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43118003] = {
    id = 43118003,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0",
      "304:1:1:0:-700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43118004] = {
    id = 43118004,
    type = 30,
    value = {
      "304:1:2:40000102:-550:0",
      "304:1:1:0:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43118005] = {
    id = 43118005,
    type = 30,
    value = {
      "304:1:2:40000102:-600:0",
      "304:1:1:0:-900:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43118006] = {
    id = 43118006,
    type = 30,
    value = {
      "304:1:2:40000102:-650:0",
      "304:1:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43118007] = {
    id = 43118007,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 7,
    deduce_buff_list = {
      "43118008:1002:10000"
    },
    buff_cd = 0
  },
  [43118008] = {
    id = 43118008,
    type = 1,
    value = {
      "543:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43118009] = {
    id = 43118009,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 156,
    deduce_cnt = -1,
    deduce_value = 3,
    deduce_buff_list = {
      "43118008:1002:10000"
    },
    buff_cd = 0
  },
  [43218001] = {
    id = 43218001,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 10)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218002] = {
    id = 43218002,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 20)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218003] = {
    id = 43218003,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "3", 300, 5)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-300:0",
      "303:1:1:0:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43218004] = {
    id = 43218004,
    type = 1,
    value = {
      "415:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43218005] = {
    id = 43218005,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 10)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218006] = {
    id = 43218006,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 20)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218007] = {
    id = 43218007,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "3.4", 340, 5)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-340:0",
      "303:1:1:0:-340:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43218008] = {
    id = 43218008,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 10)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218009] = {
    id = 43218009,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 20)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218010] = {
    id = 43218010,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "3.8", 380, 5)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-380:0",
      "303:1:1:0:-380:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43218011] = {
    id = 43218011,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 10)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218012] = {
    id = 43218012,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 20)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218013] = {
    id = 43218013,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "4.2", 420, 5)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-420:0",
      "303:1:1:0:-420:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43218014] = {
    id = 43218014,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 10)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218015] = {
    id = 43218015,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 20)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218016] = {
    id = 43218016,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "4.6", 460, 5)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-460:0",
      "303:1:1:0:-460:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43218017] = {
    id = 43218017,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 10)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2142,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218018] = {
    id = 43218018,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 20)
    end,
    type = 40,
    value = {
      "413:1:38:0:10000:0",
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43318001,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43218019] = {
    id = 43218019,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503032, "5", 500, 5)
    end,
    type = 30,
    value = {
      "303:1:2:40000102:-500:0",
      "303:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 33,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43218020] = {
    id = 43218020,
    type = 1,
    value = {
      "411:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218021] = {
    id = 43218021,
    type = 1,
    value = {
      "412:1:2:40000102:9500:1",
      "414:1:1:0:2750:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218022] = {
    id = 43218022,
    type = 1,
    value = {
      "411:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218023] = {
    id = 43218023,
    type = 1,
    value = {
      "412:1:2:40000102:10000:1",
      "414:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218024] = {
    id = 43218024,
    type = 1,
    value = {
      "411:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218025] = {
    id = 43218025,
    type = 1,
    value = {
      "412:1:2:40000102:10500:1",
      "414:1:1:0:3250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218026] = {
    id = 43218026,
    type = 1,
    value = {
      "411:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218027] = {
    id = 43218027,
    type = 1,
    value = {
      "412:1:2:40000102:11000:1",
      "414:1:1:0:3500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218028] = {
    id = 43218028,
    type = 1,
    value = {
      "411:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218029] = {
    id = 43218029,
    type = 1,
    value = {
      "412:1:2:40000102:11500:1",
      "414:1:1:0:3750:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218030] = {
    id = 43218030,
    type = 1,
    value = {
      "411:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43218031] = {
    id = 43218031,
    type = 1,
    value = {
      "412:1:2:40000102:12000:1",
      "414:1:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43318001] = {
    id = 43318001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43318002] = {
    id = 43318002,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506156, 20)
    end,
    type = 40,
    value = {
      "413:1:2:40000102:5000:0",
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43418001] = {
    id = 43418001,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506025, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43418002] = {
    id = 43418002,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506042, 15)
    end,
    type = 1,
    value = {
      "604:2:1:0:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113901] = {
    id = 43113901,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113902] = {
    id = 43113902,
    type = 10,
    value = {
      "101:1:2:40000103:9000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43113901,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113903] = {
    id = 43113903,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313901,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43113905:1002:10000",
      "43113906:1002:10000"
    },
    buff_cd = 0
  },
  [43113904] = {
    id = 43113904,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313901,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43113905:1002:10000",
      "43113906:1002:10000"
    },
    buff_cd = 0
  },
  [43113905] = {
    id = 43113905,
    name = function()
      return T(80410080)
    end,
    des = function()
      return T(80510080)
    end,
    type = 1,
    value = {
      "1008:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113906] = {
    id = 43113906,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2204,
    trigger_type = 2,
    trigger_value = 3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43113907:3001:10000"
    },
    buff_cd = 0
  },
  [43113907] = {
    id = 43113907,
    type = 30,
    value = {
      "304:1:2:40000102:-700:0",
      "304:1:1:0:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43113908] = {
    id = 43113908,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113909] = {
    id = 43113909,
    type = 10,
    value = {
      "101:1:2:40000103:10000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43113908,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113910] = {
    id = 43113910,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113911] = {
    id = 43113911,
    type = 10,
    value = {
      "101:1:2:40000103:11000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43113910,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113912] = {
    id = 43113912,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113913] = {
    id = 43113913,
    type = 10,
    value = {
      "101:1:2:40000103:12000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43113912,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113914] = {
    id = 43113914,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113915] = {
    id = 43113915,
    type = 10,
    value = {
      "101:1:2:40000103:13000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43113914,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43113916] = {
    id = 43113916,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43113917] = {
    id = 43113917,
    type = 10,
    value = {
      "101:1:2:40000103:14000:0"
    },
    be_affected_with_effects = {649},
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43113916,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43213901] = {
    id = 43213901,
    type = 10,
    value = {
      "101:1:37:40000103:4500:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213902] = {
    id = 43213902,
    type = 10,
    value = {
      "101:1:37:40000103:7500:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213903] = {
    id = 43213903,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 32,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43113905"}
  },
  [43213904] = {
    id = 43213904,
    type = 10,
    value = {
      "101:1:37:40000103:5000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213905] = {
    id = 43213905,
    type = 10,
    value = {
      "101:1:37:40000103:8000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213906] = {
    id = 43213906,
    type = 10,
    value = {
      "101:1:37:40000103:5500:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213907] = {
    id = 43213907,
    type = 10,
    value = {
      "101:1:37:40000103:8500:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213908] = {
    id = 43213908,
    type = 10,
    value = {
      "101:1:37:40000103:6000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213909] = {
    id = 43213909,
    type = 10,
    value = {
      "101:1:37:40000103:9000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213910] = {
    id = 43213910,
    type = 10,
    value = {
      "101:1:37:40000103:6500:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213911] = {
    id = 43213911,
    type = 10,
    value = {
      "101:1:37:40000103:9500:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213912] = {
    id = 43213912,
    type = 10,
    value = {
      "101:1:37:40000103:7000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43213913] = {
    id = 43213913,
    type = 10,
    value = {
      "101:1:37:40000103:10000:1"
    },
    realtime_update_effect = 1,
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43313902,
    overlay_num = 1,
    settle_type = 31,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43313901] = {
    id = 43313901,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43313902] = {
    id = 43313902,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43413901] = {
    id = 43413901,
    name = function()
      return T(80406500)
    end,
    des = function()
      return T(80506500, 20)
    end,
    type = 1,
    value = {
      "650:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43700601] = {
    id = 43700601,
    name = function()
      return T(80406070)
    end,
    des = function()
      return T(80506070, 30, 3)
    end,
    type = 60,
    value = {
      "607:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43700701] = {
    id = 43700701,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43700801] = {
    id = 43700801,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43700901] = {
    id = 43700901,
    type = 30,
    value = {
      "304:1:2:40000102:-3000:0",
      "304:1:1:0:-200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43701001] = {
    id = 43701001,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43701101] = {
    id = 43701101,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 30, 5)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [43701201] = {
    id = 43701201,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 30, 5)
    end,
    type = 70,
    value = {
      "701:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1
  },
  [43701301] = {
    id = 43701301,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43701401] = {
    id = 43701401,
    type = 30,
    value = {
      "304:1:2:40000102:-300:0",
      "304:1:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43701501] = {
    id = 43701501,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43701601] = {
    id = 43701601,
    name = function()
      return T(80405440)
    end,
    des = function()
      return T(80505440, 5)
    end,
    type = 50,
    value = {
      "544:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0
  },
  [43701602] = {
    id = 43701602,
    type = 60,
    value = {
      "653:1:2:40000103:120000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [43701603] = {
    id = 43701603,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 5,
    deduce_buff_list = {
      "43701604:2021:10000"
    },
    buff_cd = 0
  },
  [43701604] = {
    id = 43701604,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 70, 5)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:7000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43701602,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43701605] = {
    id = 43701605,
    type = 1,
    value = {
      "507:1:1:0:3003:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43701606] = {
    id = 43701606,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 25,
    deduce_buff_list = {
      "43701612:1002:10000",
      "43701618:1002:10000"
    },
    buff_cd = 0
  },
  [43701607] = {
    id = 43701607,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 50,
    deduce_buff_list = {
      "43701613:1002:10000",
      "43701619:1002:10000"
    },
    buff_cd = 0
  },
  [43701608] = {
    id = 43701608,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 75,
    deduce_buff_list = {
      "43701614:1002:10000",
      "43701620:1002:10000"
    },
    buff_cd = 0
  },
  [43701609] = {
    id = 43701609,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 100,
    deduce_buff_list = {
      "43701615:1002:10000",
      "43701621:1002:10000"
    },
    buff_cd = 0
  },
  [43701610] = {
    id = 43701610,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 125,
    deduce_buff_list = {
      "43701616:1002:10000",
      "43701622:1002:10000"
    },
    buff_cd = 0
  },
  [43701611] = {
    id = 43701611,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 150,
    deduce_buff_list = {
      "43701617:1002:10000",
      "43701623:1002:10000"
    },
    buff_cd = 0
  },
  [43701612] = {
    id = 43701612,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 20)
    end,
    type = 60,
    value = {
      "615:2:1:0:-2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    },
    swallow_range = 170
  },
  [43701613] = {
    id = 43701613,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 30)
    end,
    type = 60,
    value = {
      "615:2:1:0:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701612"}
  },
  [43701614] = {
    id = 43701614,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 40)
    end,
    type = 60,
    value = {
      "615:2:1:0:-4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701613"},
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    },
    swallow_range = 170
  },
  [43701615] = {
    id = 43701615,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 60)
    end,
    type = 60,
    value = {
      "615:2:1:0:-6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701614"}
  },
  [43701616] = {
    id = 43701616,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 70)
    end,
    type = 60,
    value = {
      "615:2:1:0:-7000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701615"}
  },
  [43701617] = {
    id = 43701617,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 80)
    end,
    type = 60,
    value = {
      "615:2:1:0:-8000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701616"}
  },
  [43701618] = {
    id = 43701618,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    },
    swallow_range = 170
  },
  [43701619] = {
    id = 43701619,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701618"}
  },
  [43701620] = {
    id = 43701620,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 30)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701619"},
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    },
    swallow_range = 170
  },
  [43701621] = {
    id = 43701621,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 40)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701620"}
  },
  [43701622] = {
    id = 43701622,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 50)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701621"}
  },
  [43701623] = {
    id = 43701623,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 60)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    clean_buff_group = {"1:43701622"}
  },
  [43701701] = {
    id = 43701701,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 30, 3)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43701702] = {
    id = 43701702,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 30, 5)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43701703] = {
    id = 43701703,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 30, 5)
    end,
    type = 70,
    value = {
      "703:1:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43701704] = {
    id = 43701704,
    name = function()
      return T(80405170)
    end,
    des = function()
      return T(80505170)
    end,
    type = 1,
    value = {
      "517:1:1:0:2:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 15,
    deduce_cnt = -1,
    active_forever = 1,
    buff_cd = 0
  },
  [43701705] = {
    id = 43701705,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43701706:2392:10000"
    },
    buff_cd = 0
  },
  [43701706] = {
    id = 43701706,
    type = 10,
    value = {
      "128:2:2:40000102:1000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43701801] = {
    id = 43701801,
    name = function()
      return T(80405440)
    end,
    des = function()
      return T(80505440, 8)
    end,
    type = 50,
    value = {
      "544:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43701802] = {
    id = 43701802,
    type = 60,
    value = {
      "653:1:2:40000103:100000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [43701803] = {
    id = 43701803,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 5,
    deduce_buff_list = {
      "43701804:2021:10000"
    },
    buff_cd = 0
  },
  [43701804] = {
    id = 43701804,
    name = function()
      return T(80401040)
    end,
    des = function()
      return T(80501040, 100, 8)
    end,
    type = 10,
    value = {
      "104:1:2:40000103:10000:0"
    },
    trigger_condition = 2141,
    trigger_type = 2,
    trigger_value = 43701802,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43701805] = {
    id = 43701805,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43701806:2511:10000"
    },
    buff_cd = 0
  },
  [43701806] = {
    id = 43701806,
    type = 10,
    value = {
      "107:1:2:40000103:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 100,
    range_y = 100
  },
  [43710301] = {
    id = 43710301,
    type = 30,
    value = {
      "304:1:2:40000102:-1500:0",
      "304:1:1:0:-200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43710401] = {
    id = 43710401,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1
  },
  [43710501] = {
    id = 43710501,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43710701] = {
    id = 43710701,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43710801] = {
    id = 43710801,
    name = function()
      return T(80405060)
    end,
    des = function()
      return T(80505060, 5)
    end,
    type = 50,
    value = {
      "506:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1
  },
  [43710901] = {
    id = 43710901,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 30, 5)
    end,
    type = 70,
    value = {
      "703:1:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711001] = {
    id = 43711001,
    name = function()
      return T(80405080)
    end,
    des = function()
      return T(80505080, 2)
    end,
    type = 50,
    value = {
      "508:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711101] = {
    id = 43711101,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 15, 3)
    end,
    type = 60,
    value = {
      "602:1:2:40000103:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711102] = {
    id = 43711102,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 15, 3)
    end,
    type = 60,
    value = {
      "605:1:2:40000104:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711201] = {
    id = 43711201,
    name = function()
      return T(80405030)
    end,
    des = function()
      return T(80505030, 4)
    end,
    type = 50,
    value = {
      "503:0:0:0:0:0"
    },
    trigger_condition = 2101,
    trigger_type = 4,
    trigger_value = 3000,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711301] = {
    id = 43711301,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 30, 3)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711302] = {
    id = 43711302,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711303] = {
    id = 43711303,
    name = function()
      return T(80405160)
    end,
    des = function()
      return T(80505160, 10, 3)
    end,
    type = 1,
    value = {
      "516:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    deduce_buff_list = {
      "43711304:1002:10000"
    },
    buff_cd = 0
  },
  [43711304] = {
    id = 43711304,
    type = 10,
    value = {
      "106:2:2:40000102:1000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43711401] = {
    id = 43711401,
    type = 1,
    value = {
      "507:1:1:0:3002:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 5,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43711402] = {
    id = 43711402,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43711404", "1:43711405"}
  },
  [43711403] = {
    id = 43711403,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 5,
    settle_buff_list = {
      "43711404:1002:10000:2011403"
    },
    deduce_buff_list = {
      "43711405:2571:10000:2011404"
    },
    buff_cd = 0
  },
  [43711404] = {
    id = 43711404,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 20)
    end,
    type = 1,
    value = {
      "1116:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43711404:2571:10000:2011403"
    },
    buff_cd = 0
  },
  [43711405] = {
    id = 43711405,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 30)
    end,
    type = 1,
    value = {
      "1117:2:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43711405:2571:10000:2011404"
    },
    buff_cd = 0
  },
  [43711406] = {
    id = 43711406,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43711407:3004:10000:2011407"
    },
    buff_cd = 0
  },
  [43711407] = {
    id = 43711407,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43711501] = {
    id = 43711501,
    name = function()
      return T(80405030)
    end,
    des = function()
      return T(80505030, 5)
    end,
    type = 50,
    value = {
      "503:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43711502] = {
    id = 43711502,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 100, 10)
    end,
    type = 60,
    value = {
      "602:1:2:40000103:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711503] = {
    id = 43711503,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 50, 10)
    end,
    type = 70,
    value = {
      "703:1:2:40000104:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711504] = {
    id = 43711504,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43711505:1002:10000",
      "43711506:1002:10000"
    },
    buff_cd = 0
  },
  [43711505] = {
    id = 43711505,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507023, 10)
    end,
    type = 1,
    value = {
      "702:2:14:40000103:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43711506] = {
    id = 43711506,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507012, 10)
    end,
    type = 1,
    value = {
      "701:2:15:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43711701] = {
    id = 43711701,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 30, 10)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43711702] = {
    id = 43711702,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43711706,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43711703] = {
    id = 43711703,
    type = 10,
    value = {
      "644:1:6:1111:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 5,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43711704] = {
    id = 43711704,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43711705] = {
    id = 43711705,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43711706:2071:10000:2011701"
    },
    buff_cd = 0
  },
  [43711706] = {
    id = 43711706,
    name = function()
      return T(80411110)
    end,
    des = function()
      return T(80511110, 10, 10)
    end,
    type = 1,
    value = {
      "1111:2:1:0:1000:0",
      "1112:2:2:40000103:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    settle_buff_list = {
      "43711707:1002:10000",
      "43711708:3001:10000"
    },
    deduce_buff_list = {
      "43711710:1002:10000"
    },
    buff_cd = 0
  },
  [43711707] = {
    id = 43711707,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 10,
    deduce_buff_list = {
      "43711706:1002:10000:2011701"
    },
    buff_cd = 0
  },
  [43711708] = {
    id = 43711708,
    des = function()
      return 0
    end,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 10,
    deduce_buff_list = {
      "43711709:2451:10000"
    },
    buff_cd = 0
  },
  [43711709] = {
    id = 43711709,
    type = 1,
    value = {
      "515:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    },
    swallow_range = 170
  },
  [43711710] = {
    id = 43711710,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_when_dead = 1,
    clean_buff_group = {"1:43711706"},
    clean_add_buff = {
      "43711705:1001:10000"
    },
    clean_add_buff_unit = 1
  },
  [43711801] = {
    id = 43711801,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43711802:2511:10000",
      "43711803:1008:10000"
    },
    buff_cd = 0
  },
  [43711802] = {
    id = 43711802,
    type = 10,
    value = {
      "107:1:2:40000103:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 100,
    range_y = 100,
    settle_sound = 72011808
  },
  [43711803] = {
    id = 43711803,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 30,
    settle_buff_list = {
      "43711804:2511:10000"
    },
    buff_cd = 0
  },
  [43711804] = {
    id = 43711804,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 100,
    range_y = 100,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43711805] = {
    id = 43711805,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {
      "1:43711807",
      "1:43711808",
      "1:43711404",
      "1:43711405"
    }
  },
  [43711806] = {
    id = 43711806,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 5,
    settle_buff_list = {
      "43711807:1002:10000:2011403"
    },
    deduce_buff_list = {
      "43711808:2571:10000:2011404"
    },
    buff_cd = 0
  },
  [43711807] = {
    id = 43711807,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 30)
    end,
    type = 1,
    value = {
      "1116:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43711807:2571:10000:2011403"
    },
    buff_cd = 0
  },
  [43711808] = {
    id = 43711808,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 45)
    end,
    type = 1,
    value = {
      "1117:2:2:40000104:-4500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43711808:2571:10000:2011404"
    },
    buff_cd = 0
  },
  [43720301] = {
    id = 43720301,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 30, 3)
    end,
    type = 70,
    value = {
      "703:1:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43720401] = {
    id = 43720401,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43720701] = {
    id = 43720701,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 30, 3)
    end,
    type = 10,
    value = {
      "120:2:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43720801] = {
    id = 43720801,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1
  },
  [43720901] = {
    id = 43720901,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 30, 5)
    end,
    type = 70,
    value = {
      "701:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1
  },
  [43721201] = {
    id = 43721201,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 30, 3)
    end,
    type = 70,
    value = {
      "703:1:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43721202] = {
    id = 43721202,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 5,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43721203] = {
    id = 43721203,
    type = 60,
    value = {
      "408:2:1:0:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43721204] = {
    id = 43721204,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43721205] = {
    id = 43721205,
    type = 10,
    value = {
      "106:2:2:40000102:3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43721301] = {
    id = 43721301,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 30, 3)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43721302] = {
    id = 43721302,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 5,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43721303] = {
    id = 43721303,
    type = 10,
    value = {
      "127:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 1,
    deduce_type = 112,
    deduce_cnt = -1,
    active_forever = 1,
    buff_cd = 0
  },
  [43721401] = {
    id = 43721401,
    type = 1,
    value = {
      "134:1:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 2,
    buff_cd = 0
  },
  [43721402] = {
    id = 43721402,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    extra_param = "0:43721401"
  },
  [43721403] = {
    id = 43721403,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42721456:43721404"
  },
  [43721404] = {
    id = 43721404,
    type = 1,
    value = {
      "134:1:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43721405:1002:10000"
    },
    buff_cd = 0
  },
  [43721405] = {
    id = 43721405,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501031, 30)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43721406] = {
    id = 43721406,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43721407:2011:10000",
      "43721408:2001:10000:2021401"
    },
    buff_cd = 0
  },
  [43721407] = {
    id = 43721407,
    type = 10,
    value = {
      "103:1:2:40000103:30000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120
  },
  [43721408] = {
    id = 43721408,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43721409] = {
    id = 43721409,
    name = function()
      return T(80401350)
    end,
    des = function()
      return T(80501350, 10)
    end,
    type = 1,
    value = {
      "135:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43721410] = {
    id = 43721410,
    type = 1,
    value = {
      "130:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    buff_cd = 0,
    extra_param = "42721456:43721411"
  },
  [43721411] = {
    id = 43721411,
    type = 1,
    value = {
      "134:1:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43721412] = {
    id = 43721412,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 5)
    end,
    type = 1,
    value = {
      "1114:1:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43721413] = {
    id = 43721413,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 133,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43721414:1002:10000"
    },
    buff_cd = 0
  },
  [43721414] = {
    id = 43721414,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43721417,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43721415:1002:10000"
    },
    buff_cd = 0
  },
  [43721415] = {
    id = 43721415,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43721416:1002:10000",
      "43721417:1002:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43721412"},
    clean_buff_num = 1
  },
  [43721416] = {
    id = 43721416,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"2:10"}
  },
  [43721417] = {
    id = 43721417,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 8,
    buff_cd = 0
  },
  [43721601] = {
    id = 43721601,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501031, 30)
    end,
    type = 10,
    value = {
      "103:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43721602] = {
    id = 43721602,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43721601:1000:10000"
    },
    buff_cd = 0
  },
  [43721603] = {
    id = 43721603,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43721601"},
    clean_add_buff = {
      "43721604:3001:10000"
    },
    clean_add_buff_unit = 1
  },
  [43721604] = {
    id = 43721604,
    name = function()
      return T(80405280)
    end,
    des = function()
      return T(80505280, 5)
    end,
    type = 1,
    value = {
      "528:1:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43721605] = {
    id = 43721605,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43721606] = {
    id = 43721606,
    type = 1,
    value = {
      "529:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 5,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43721607] = {
    id = 43721607,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 3,
    deduce_buff_list = {
      "43721601:2051:10000"
    },
    buff_cd = 0
  },
  [43721608] = {
    id = 43721608,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 131,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43721609:1002:10000",
      "43721610:1002:10000"
    },
    buff_cd = 0
  },
  [43721609] = {
    id = 43721609,
    type = 1,
    value = {
      "530:1:1:0:1:0:43721607"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43721610,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43721610] = {
    id = 43721610,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43730301] = {
    id = 43730301,
    type = 60,
    value = {
      "606:1:2:40000103:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0
  },
  [43730401] = {
    id = 43730401,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 30, 3)
    end,
    type = 70,
    value = {
      "701:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0
  },
  [43730501] = {
    id = 43730501,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43730601] = {
    id = 43730601,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 30, 3)
    end,
    type = 60,
    value = {
      "605:1:2:40000104:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0
  },
  [43730602] = {
    id = 43730602,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 30, 3)
    end,
    type = 60,
    value = {
      "605:1:2:40000104:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0
  },
  [43730701] = {
    id = 43730701,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 30, 5)
    end,
    type = 60,
    value = {
      "605:1:2:40000104:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43730702] = {
    id = 43730702,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43730801] = {
    id = 43730801,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 30, 5)
    end,
    type = 70,
    value = {
      "702:1:2:40000103:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43730901] = {
    id = 43730901,
    name = function()
      return T(80405020)
    end,
    des = function()
      return T(80505020, 3)
    end,
    type = 50,
    value = {
      "502:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0,
    settle_reset = 1
  },
  [43731001] = {
    id = 43731001,
    type = 60,
    value = {
      "606:1:2:40000103:10000:0"
    },
    trigger_condition = 2031,
    trigger_type = 4,
    trigger_value = 2,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43731002] = {
    id = 43731002,
    name = function()
      return T(80406070)
    end,
    des = function()
      return T(80506070, 30, 5)
    end,
    type = 60,
    value = {
      "607:1:1:0:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 4,
    trigger_value = 2,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43731101] = {
    id = 43731101,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506114, 50)
    end,
    type = 60,
    value = {
      "611:1:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 5,
    deduce_cnt = 6,
    deduce_value = 1,
    buff_cd = 0
  },
  [43731201] = {
    id = 43731201,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 30, 3)
    end,
    type = 10,
    value = {
      "120:2:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43731202] = {
    id = 43731202,
    type = 60,
    value = {
      "606:1:2:40000102:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43731203] = {
    id = 43731203,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43731204:1002:10000:2031201"
    },
    buff_cd = 0
  },
  [43731204] = {
    id = 43731204,
    name = function()
      return T(80411040)
    end,
    des = function()
      return T(80511040, 5, 30)
    end,
    type = 1,
    value = {
      "1104:0:0:0:0:0"
    },
    trigger_condition = 2011,
    trigger_type = 4,
    trigger_value = 3000,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    settle_buff_list = {
      "43731205:1002:10000"
    },
    buff_cd = 0
  },
  [43731205] = {
    id = 43731205,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 5,
    deduce_buff_list = {
      "43731206:1002:10000:2031203"
    },
    buff_cd = 0
  },
  [43731206] = {
    id = 43731206,
    type = 1,
    value = {
      "125:1:2:40000102:10000:1"
    },
    trigger_condition = 2011,
    trigger_type = 4,
    trigger_value = 3000,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 15,
    deduce_buff_list = {
      "43731207:1002:10000",
      "43731208:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43731207] = {
    id = 43731207,
    type = 1,
    value = {
      "507:1:1:0:2001:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43731208] = {
    id = 43731208,
    type = 1,
    value = {
      "507:1:1:0:2002:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43731301] = {
    id = 43731301,
    type = 1,
    value = {
      "507:1:1:0:2001:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43731302] = {
    id = 43731302,
    type = 1,
    value = {
      "507:1:1:0:2002:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43731303] = {
    id = 43731303,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 115,
    deduce_cnt = -1,
    settle_buff_list = {
      "43731304:3081:10000"
    },
    deduce_buff_list = {
      "43731304:3081:10000"
    },
    buff_cd = 0,
    trigger_buff_unique = 1
  },
  [43731304] = {
    id = 43731304,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 60,
    value = {
      "602:1:2:40000103:1500:0",
      "605:1:2:40000104:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43731305] = {
    id = 43731305,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43731306:3001:10000",
      "43731307:3001:10000",
      "43731308:3081:10000"
    },
    buff_cd = 0,
    immune_group = {
      "2:70",
      "2:50",
      "2:10"
    }
  },
  [43731306] = {
    id = 43731306,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 60,
    value = {
      "602:2:10:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [43731307] = {
    id = 43731307,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 5)
    end,
    type = 60,
    value = {
      "615:2:9:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [43731308] = {
    id = 43731308,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731309:1001:10000"
    },
    buff_cd = 0
  },
  [43731309] = {
    id = 43731309,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 102,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731310:2011:10000",
      "43731311:1001:10000",
      "43731312:2011:10000"
    },
    buff_cd = 0
  },
  [43731310] = {
    id = 43731310,
    type = 10,
    value = {
      "107:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43731311] = {
    id = 43731311,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506114, 100)
    end,
    type = 60,
    value = {
      "611:1:1:0:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43731312] = {
    id = 43731312,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43731501] = {
    id = 43731501,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506150, 50, 8)
    end,
    type = 1,
    value = {
      "615:2:1:0:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 8,
    deduce_value = 1,
    buff_cd = 0
  },
  [43731502] = {
    id = 43731502,
    type = 1,
    value = {
      "642:2:1:0:12500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43731503] = {
    id = 43731503,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43731506,
    overlay_num = 1,
    settle_type = 6,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731506:1002:10000"
    },
    buff_cd = 0
  },
  [43731504] = {
    id = 43731504,
    name = function()
      return T(80411100)
    end,
    des = function()
      return T(80511100, 28, 6)
    end,
    type = 1,
    value = {
      "1110:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 28,
    settle_buff_list = {
      "43731507:1002:10000"
    },
    deduce_buff_list = {
      "43731505:1002:10000"
    },
    buff_cd = 0
  },
  [43731505] = {
    id = 43731505,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2191,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731506:1002:10000"
    },
    buff_cd = 0
  },
  [43731506] = {
    id = 43731506,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 28, 6)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 180,
    buff_cd = 0,
    settle_reset = 1
  },
  [43731507] = {
    id = 43731507,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731504:2401:10000"
    },
    buff_cd = 0
  },
  [43731508] = {
    id = 43731508,
    name = function()
      return T(80411100)
    end,
    des = function()
      return T(80511100, 28, 6)
    end,
    type = 1,
    value = {
      "1110:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 28,
    settle_buff_list = {
      "43731509:1002:10000"
    },
    deduce_buff_list = {
      "43731505:1002:10000"
    },
    buff_cd = 0
  },
  [43731509] = {
    id = 43731509,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731508:2411:10000"
    },
    buff_cd = 0
  },
  [43731510] = {
    id = 43731510,
    name = function()
      return T(80411100)
    end,
    des = function()
      return T(80511100, 28, 6)
    end,
    type = 1,
    value = {
      "1110:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 28,
    settle_buff_list = {
      "43731511:1002:10000"
    },
    deduce_buff_list = {
      "43731505:1002:10000"
    },
    buff_cd = 0
  },
  [43731511] = {
    id = 43731511,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731510:2421:10000"
    },
    buff_cd = 0
  },
  [43731512] = {
    id = 43731512,
    name = function()
      return T(80411100)
    end,
    des = function()
      return T(80511100, 28, 6)
    end,
    type = 1,
    value = {
      "1110:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 28,
    settle_buff_list = {
      "43731513:1002:10000"
    },
    deduce_buff_list = {
      "43731505:1002:10000"
    },
    buff_cd = 0
  },
  [43731513] = {
    id = 43731513,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731512:2431:10000"
    },
    buff_cd = 0
  },
  [43731701] = {
    id = 43731701,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501101, 30)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43731702] = {
    id = 43731702,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 30)
    end,
    type = 60,
    value = {
      "602:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43731703] = {
    id = 43731703,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 30)
    end,
    type = 60,
    value = {
      "601:1:1:0:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43731704] = {
    id = 43731704,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 30, 10)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    extra_effect_path = "20317/FX_20317_skill2_3_buff_hit.prefab"
  },
  [43731705] = {
    id = 43731705,
    type = 1,
    value = {
      "527:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 6,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    deduce_buff_list = {
      "43731706:3001:10000"
    },
    buff_cd = 0
  },
  [43731706] = {
    id = 43731706,
    type = 30,
    value = {
      "304:1:2:40000102:-250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43731707] = {
    id = 43731707,
    type = 60,
    value = {
      "653:1:10:40000102:200:0",
      "653:1:2:40000102:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    settle_buff_list = {
      "43731708:3001:10000"
    },
    buff_cd = 0,
    settle_reset = 1
  },
  [43731708] = {
    id = 43731708,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 153,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731709:3001:10000"
    },
    buff_cd = 0
  },
  [43731709] = {
    id = 43731709,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43731705"}
  },
  [43731710] = {
    id = 43731710,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43731711:3001:10000",
      "43731712:3151:10000"
    },
    buff_cd = 0
  },
  [43731711] = {
    id = 43731711,
    type = 1,
    value = {
      "507:1:1:0:3001:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43731712] = {
    id = 43731712,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 130,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43731713:3172:10000",
      "43731714:3172:10000",
      "43731715:1002:10000:2031703"
    },
    buff_cd = 0
  },
  [43731713] = {
    id = 43731713,
    type = 1,
    value = {
      "106:3:2:40000102:3300:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 43731710,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 20,
    deduce_buff_list = {
      "43731716:1002:10000:2031704"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43731714] = {
    id = 43731714,
    type = 1,
    value = {
      "106:3:2:40000102:19800:0"
    },
    trigger_condition = 2003,
    trigger_type = 2,
    trigger_value = 43731710,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 20,
    deduce_buff_list = {
      "43731716:1002:10000:2031704"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43731715] = {
    id = 43731715,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_when_dead = 1,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43731716] = {
    id = 43731716,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_when_dead = 1,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [43740101] = {
    id = 43740101,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 30, 3)
    end,
    type = 60,
    value = {
      "605:1:2:40000104:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43740201] = {
    id = 43740201,
    name = function()
      return T(80401080)
    end,
    des = function()
      return T(80501080, 30, 3)
    end,
    type = 10,
    value = {
      "108:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43740301] = {
    id = 43740301,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43740401] = {
    id = 43740401,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43740501] = {
    id = 43740501,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 30, 3)
    end,
    type = 60,
    value = {
      "601:1:1:0:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43740601] = {
    id = 43740601,
    name = function()
      return T(80404030)
    end,
    des = function()
      return T(80504030, 4)
    end,
    type = 40,
    value = {
      "403:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 4,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43740701] = {
    id = 43740701,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 30, 3)
    end,
    type = 60,
    value = {
      "602:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43740801] = {
    id = 43740801,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 4)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0,
    settle_reset = 1
  },
  [43740901] = {
    id = 43740901,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506114, 50)
    end,
    type = 60,
    value = {
      "611:1:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 5,
    deduce_cnt = 6,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43741101] = {
    id = 43741101,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 3)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 90,
    buff_cd = 0,
    settle_reset = 1
  },
  [43741102] = {
    id = 43741102,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    beat_back_distance = {
      100,
      72,
      0,
      63,
      65
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43741103] = {
    id = 43741103,
    type = 1,
    value = {
      "1113:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 9,
    deduce_value = 1,
    settle_buff_list = {
      "43741104:1002:10000",
      "43741105:1002:10000"
    },
    buff_cd = 0,
    not_show_icon = 1
  },
  [43741104] = {
    id = 43741104,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507022, 10)
    end,
    type = 1,
    value = {
      "702:2:2:40000103:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 9,
    deduce_value = 1,
    buff_cd = 0
  },
  [43741105] = {
    id = 43741105,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507035, 20)
    end,
    type = 1,
    value = {
      "703:1:2:40000104:-2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 9,
    deduce_value = 1,
    buff_cd = 0
  },
  [43741201] = {
    id = 43741201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 122,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43741202:2012:10000"
    },
    buff_cd = 0
  },
  [43741202] = {
    id = 43741202,
    type = 10,
    value = {
      "107:1:2:40000103:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43741204:1002:10000:2041202"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43741203] = {
    id = 43741203,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 102,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43741204] = {
    id = 43741204,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43741205] = {
    id = 43741205,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 5)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0,
    settle_reset = 1
  },
  [43741206] = {
    id = 43741206,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43741207:2511:10000"
    },
    buff_cd = 0
  },
  [43741207] = {
    id = 43741207,
    type = 10,
    value = {
      "107:1:2:40000103:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 100,
    range_y = 100
  },
  [43741208] = {
    id = 43741208,
    type = 1,
    value = {
      "1113:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 9,
    deduce_value = 1,
    settle_buff_list = {
      "43741209:1002:10000",
      "43741210:1002:10000"
    },
    buff_cd = 0
  },
  [43741209] = {
    id = 43741209,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507022, 15)
    end,
    type = 1,
    value = {
      "702:2:2:40000103:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 9,
    deduce_value = 1,
    buff_cd = 0
  },
  [43741210] = {
    id = 43741210,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507035, 30)
    end,
    type = 1,
    value = {
      "703:1:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 9,
    deduce_value = 1,
    buff_cd = 0
  },
  [43750101] = {
    id = 43750101,
    name = function()
      return T(80401090)
    end,
    des = function()
      return T(80501090, 30, 3)
    end,
    type = 10,
    value = {
      "109:1:2:40000103:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43750201] = {
    id = 43750201,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 30, 3)
    end,
    type = 70,
    value = {
      "703:1:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43750301] = {
    id = 43750301,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43750401] = {
    id = 43750401,
    type = 10,
    value = {
      "101:1:2:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43750501] = {
    id = 43750501,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 30, 3)
    end,
    type = 60,
    value = {
      "601:1:1:0:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43750601] = {
    id = 43750601,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0,
    settle_reset = 1
  },
  [43750701] = {
    id = 43750701,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 30, 3)
    end,
    type = 60,
    value = {
      "601:1:1:0:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43750801] = {
    id = 43750801,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 30, 3)
    end,
    type = 70,
    value = {
      "702:1:2:40000103:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43751001] = {
    id = 43751001,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507030, 30, 3)
    end,
    type = 70,
    value = {
      "703:1:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43751101] = {
    id = 43751101,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 10)
    end,
    type = 70,
    value = {
      "702:1:2:40000103:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43751102] = {
    id = 43751102,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 10)
    end,
    type = 70,
    value = {
      "703:1:2:40000104:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43751103] = {
    id = 43751103,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 10)
    end,
    type = 70,
    value = {
      "701:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43751104] = {
    id = 43751104,
    type = 10,
    value = {
      "125:2:2:40000102:10000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43751105] = {
    id = 43751105,
    type = 10,
    value = {
      "125:2:2:40000102:5000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43751106] = {
    id = 43751106,
    type = 10,
    value = {
      "125:2:2:40000102:2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43751107] = {
    id = 43751107,
    type = 10,
    value = {
      "125:2:2:40000102:1000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43751108] = {
    id = 43751108,
    name = function()
      return T(80411010)
    end,
    des = function()
      return T(80511010)
    end,
    type = 1,
    value = {
      "1101:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "43751109:1002:10000"
    },
    buff_cd = 0
  },
  [43751109] = {
    id = 43751109,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43751108:2051:10000"
    },
    buff_cd = 0
  },
  [43760001] = {
    id = 43760001,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43761201] = {
    id = 43761201,
    type = 1,
    value = {
      "518:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [43761301] = {
    id = 43761301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43761302:3001:10000:2031204",
      "43761303:3001:10000"
    },
    buff_cd = 0
  },
  [43761302] = {
    id = 43761302,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43761303] = {
    id = 43761303,
    type = 1,
    value = {
      "1107:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 1,
    buff_cd = 0
  },
  [43761401] = {
    id = 43761401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43761402:3001:3000",
      "43761403:3001:3000",
      "43761404:3001:3000",
      "43761405:3001:3000",
      "43761406:3001:3000",
      "43761407:3001:3000",
      "43761408:3001:3000",
      "43761409:3001:3000",
      "43761410:3001:3000",
      "43761411:3001:3000"
    },
    buff_cd = 0
  },
  [43761402] = {
    id = 43761402,
    type = 1,
    value = {
      "1108:2:2:40000301:-2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761403] = {
    id = 43761403,
    type = 1,
    value = {
      "1108:2:2:40000301:-2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761404] = {
    id = 43761404,
    type = 1,
    value = {
      "1108:2:2:40000301:-2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761405] = {
    id = 43761405,
    type = 1,
    value = {
      "1108:2:2:40000301:-2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761406] = {
    id = 43761406,
    type = 1,
    value = {
      "1108:2:2:40000301:-2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761407] = {
    id = 43761407,
    type = 1,
    value = {
      "1108:2:2:40000301:2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761408] = {
    id = 43761408,
    type = 1,
    value = {
      "1108:2:2:40000301:2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761409] = {
    id = 43761409,
    type = 1,
    value = {
      "1108:2:2:40000301:2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761410] = {
    id = 43761410,
    type = 1,
    value = {
      "1108:2:2:40000301:2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761411] = {
    id = 43761411,
    type = 1,
    value = {
      "1108:2:2:40000301:2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43761501] = {
    id = 43761501,
    type = 1,
    value = {
      "518:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43770301] = {
    id = 43770301,
    type = 1,
    value = {
      "125:2:2:40000102:10000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [43770302] = {
    id = 43770302,
    type = 1,
    value = {
      "125:2:2:40000102:10000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43770303] = {
    id = 43770303,
    type = 1,
    value = {
      "1201:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 2,
    active_forever = 1,
    buff_cd = 0
  },
  [43770401] = {
    id = 43770401,
    type = 1,
    value = {
      "507:1:1:0:10401:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43770501] = {
    id = 43770501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43770502:2041:10000",
      "43770503:3001:10000",
      "43770505:1002:10000:2011405",
      "43770506:2041:10000",
      "43770508:1002:10000"
    },
    buff_cd = 0,
    settle_sound = 72011409
  },
  [43770502] = {
    id = 43770502,
    type = 1,
    value = {
      "515:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 20,
    deduce_buff_list = {
      "43770507:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 280,
    range_y = 280,
    beat_back_distance = {
      40,
      28,
      0,
      25,
      26
    },
    beat_back_frames = {
      4,
      3,
      2,
      2,
      2
    },
    swallow_range = 80
  },
  [43770503] = {
    id = 43770503,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 20,
    deduce_buff_list = {
      "43770504:2041:10000"
    },
    buff_cd = 0
  },
  [43770504] = {
    id = 43770504,
    type = 1,
    value = {
      "515:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 5,
    deduce_value = 8,
    deduce_buff_list = {
      "43770507:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 280,
    range_y = 280,
    beat_back_distance = {
      40,
      28,
      0,
      25,
      26
    },
    beat_back_frames = {
      4,
      3,
      2,
      2,
      2
    },
    swallow_range = 80
  },
  [43770505] = {
    id = 43770505,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43770506] = {
    id = 43770506,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 65,
    deduce_buff_list = {
      "43770507:1002:10000"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 280,
    range_y = 280,
    beat_back_distance = {
      160,
      115,
      0,
      101,
      104
    },
    beat_back_frames = {
      20,
      13,
      11,
      11,
      11
    }
  },
  [43770507] = {
    id = 43770507,
    type = 1,
    value = {
      "109:1:2:40000103:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43770509:1002:10000:2011406"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43770508] = {
    id = 43770508,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 31,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 280,
    range_y = 280,
    settle_warning_path = "1:30:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
  },
  [43770509] = {
    id = 43770509,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 10,
    buff_cd = 0
  },
  [43770801] = {
    id = 43770801,
    type = 60,
    value = {
      "654:1:2:40000103:1000000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [43770901] = {
    id = 43770901,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 5)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 150,
    buff_cd = 0
  },
  [43771101] = {
    id = 43771101,
    type = 60,
    value = {
      "654:1:2:40000103:1000000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [43771201] = {
    id = 43771201,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 8)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 240,
    buff_cd = 0
  },
  [43771301] = {
    id = 43771301,
    type = 1,
    value = {
      "308:2:2:40000101:500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1
  },
  [43771302] = {
    id = 43771302,
    type = 1,
    value = {
      "540:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43780101] = {
    id = 43780101,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780102] = {
    id = 43780102,
    type = 30,
    value = {
      "304:1:2:40000102:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780103] = {
    id = 43780103,
    type = 1,
    value = {
      "101:2:27:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780104] = {
    id = 43780104,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43780105:1002:10000"
    },
    buff_cd = 0
  },
  [43780105] = {
    id = 43780105,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506033, 1)
    end,
    type = 60,
    value = {
      "603:1:30:0:100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43780201] = {
    id = 43780201,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780202] = {
    id = 43780202,
    type = 30,
    value = {
      "304:1:2:40000102:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780203] = {
    id = 43780203,
    type = 1,
    value = {
      "101:2:28:40000103:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780204] = {
    id = 43780204,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 20,
    deduce_buff_list = {
      "43780205:3004:10000:606"
    },
    buff_cd = 0
  },
  [43780205] = {
    id = 43780205,
    type = 60,
    value = {
      "606:1:2:40000102:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [43780301] = {
    id = 43780301,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 20)
    end,
    type = 10,
    value = {
      "1115:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 20,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780302] = {
    id = 43780302,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 10, 15)
    end,
    type = 10,
    value = {
      "1115:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780303] = {
    id = 43780303,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43780304:1002:10000"
    },
    buff_cd = 0
  },
  [43780304] = {
    id = 43780304,
    name = function()
      return T(80406470)
    end,
    des = function()
      return T(80506472, 1)
    end,
    type = 1,
    value = {
      "652:1:30:0:100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [43780401] = {
    id = 43780401,
    type = 1,
    value = {
      "515:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 46,
    buff_cd = 0,
    beat_back_distance = {
      160,
      160,
      160,
      160,
      160
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    },
    swallow_range = 120
  },
  [43780402] = {
    id = 43780402,
    name = function()
      return T(80401100)
    end,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43780403:2011:10000",
      "43780404:2001:10000:2080401",
      "43780405:2011:10000"
    },
    buff_cd = 0
  },
  [43780403] = {
    id = 43780403,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501100, 10, 10)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43780404] = {
    id = 43780404,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43780405] = {
    id = 43780405,
    type = 1,
    value = {
      "107:1:2:40000103:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 6,
    deduce_value = 5,
    deduce_buff_list = {
      "43780406:1002:10000:2080402"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [43780406] = {
    id = 43780406,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43780407] = {
    id = 43780407,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 29,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 200,
    range_y = 200,
    settle_warning_path = "1:29:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
  },
  [43780408] = {
    id = 43780408,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501100, 35, 20)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:3500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 20,
    deduce_value = 1,
    settle_buff_list = {
      "43780409:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43780409] = {
    id = 43780409,
    name = function()
      return T(80405110)
    end,
    des = function()
      return T(80505110, 10)
    end,
    type = 50,
    value = {
      "511:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0
  },
  [43780410] = {
    id = 43780410,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 132,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43780411:1002:10000",
      "43780412:1002:10000"
    },
    buff_cd = 0
  },
  [43780411] = {
    id = 43780411,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506440, 25)
    end,
    type = 1,
    value = {
      "644:2:1:0:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 146,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43780412] = {
    id = 43780412,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507100, 25)
    end,
    type = 1,
    value = {
      "710:2:1:0:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 146,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43780501] = {
    id = 43780501,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    beat_back_distance = {
      200,
      200,
      200,
      200,
      200
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    }
  },
  [43780502] = {
    id = 43780502,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 10,
    deduce_buff_list = {
      "43780503:1002:10000"
    },
    buff_cd = 0
  },
  [43780503] = {
    id = 43780503,
    type = 1,
    value = {
      "531:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43780504] = {
    id = 43780504,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501100, 20, 10)
    end,
    type = 10,
    value = {
      "110:1:2:40000103:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780505] = {
    id = 43780505,
    type = 30,
    value = {
      "304:1:2:40000102:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43780506] = {
    id = 43780506,
    name = function()
      return T(80404030)
    end,
    des = function()
      return T(80504030, 5)
    end,
    type = 1,
    value = {
      "403:0:0:0:0:0",
      "532:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 105,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    immune_group = {"2:50"}
  },
  [43780507] = {
    id = 43780507,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43780508:1002:10000"
    },
    buff_cd = 0
  },
  [43780508] = {
    id = 43780508,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506440, 1)
    end,
    type = 1,
    value = {
      "644:2:1:0:100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43790401] = {
    id = 43790401,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507040, 50, 10)
    end,
    type = 70,
    value = {
      "704:1:1:0:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43790402] = {
    id = 43790402,
    type = 1,
    value = {
      "657:1:2:40000103:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43790403] = {
    id = 43790403,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 15, 10)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43790404] = {
    id = 43790404,
    type = 1,
    value = {
      "101:1:35:40000103:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 5,
    deduce_settled = 0,
    deduce_type = 6,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43790405] = {
    id = 43790405,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43790406:1002:10000"
    },
    buff_cd = 0
  },
  [43790406] = {
    id = 43790406,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 5)
    end,
    type = 60,
    value = {
      "601:2:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 40,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43790601] = {
    id = 43790601,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506150, 50, 15)
    end,
    type = 1,
    value = {
      "615:2:1:0:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [43790602] = {
    id = 43790602,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 1)
    end,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43790603:1002:10000"
    },
    buff_cd = 0
  },
  [43790603] = {
    id = 43790603,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 1)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0",
      "537:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_type_param = "1118",
    buff_cd = 0
  },
  [43790604] = {
    id = 43790604,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43790605:2603:10000"
    },
    buff_cd = 0
  },
  [43790605] = {
    id = 43790605,
    name = function()
      return T(80411180)
    end,
    des = function()
      return T(80511180, 5)
    end,
    type = 70,
    value = {
      "1118:2:2:40000104:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 10,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43790606] = {
    id = 43790606,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43790607:3004:10000:2011407"
    },
    buff_cd = 0
  },
  [43790607] = {
    id = 43790607,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43791001] = {
    id = 43791001,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507040, 50, 10)
    end,
    type = 70,
    value = {
      "704:1:1:0:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43791002] = {
    id = 43791002,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43791003:1002:10000"
    },
    buff_cd = 0
  },
  [43791003] = {
    id = 43791003,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507010, 20, 10)
    end,
    type = 70,
    value = {
      "701:1:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 300,
    buff_cd = 0,
    settle_reset = 1
  },
  [43791004] = {
    id = 43791004,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 25,
    deduce_buff_list = {
      "43791005:1002:10000"
    },
    buff_cd = 0
  },
  [43791005] = {
    id = 43791005,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 15)
    end,
    type = 1,
    value = {
      "615:2:1:0:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [43795001] = {
    id = 43795001,
    name = function()
      return T(80407040)
    end,
    des = function()
      return T(80507040, 50, 10)
    end,
    type = 70,
    value = {
      "704:1:1:0:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 107,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43795002] = {
    id = 43795002,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 121,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43795003:2511:10000"
    },
    buff_cd = 0
  },
  [43795003] = {
    id = 43795003,
    type = 10,
    value = {
      "107:1:2:40000103:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 100,
    range_y = 100
  },
  [43795004] = {
    id = 43795004,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "43795005:2021:10000"
    },
    buff_cd = 0
  },
  [43795005] = {
    id = 43795005,
    type = 10,
    value = {
      "106:2:2:40000102:250:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43800011] = {
    id = 43800011,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43800012:3031:10000"
    },
    buff_cd = 0,
    settle_sound = 73000701
  },
  [43800012] = {
    id = 43800012,
    type = 101,
    value = {
      "304:2:2:40000102:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120
  },
  [43800021] = {
    id = 43800021,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43800022:3031:10000"
    },
    buff_cd = 0,
    settle_sound = 73100901
  },
  [43800022] = {
    id = 43800022,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 101,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 20,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 120,
    range_y = 120
  },
  [43800031] = {
    id = 43800031,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43800032:3032:10000"
    },
    buff_cd = 0,
    settle_sound = 73000801
  },
  [43800032] = {
    id = 43800032,
    name = function()
      return T(80404030)
    end,
    des = function()
      return T(80504031)
    end,
    type = 101,
    value = {
      "403:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 6,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1,
    range_type = 1,
    range_x = 120,
    range_y = 120
  },
  [43801011] = {
    id = 43801011,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 112,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43801012:1002:10000:3100302"
    },
    buff_cd = 0
  },
  [43801012] = {
    id = 43801012,
    type = 10,
    value = {
      "125:2:2:40000102:50:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43801013] = {
    id = 43801013,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 7,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [43800101] = {
    id = 43800101,
    name = function()
      return T(80407060)
    end,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43800102:5003:10000"
    },
    buff_cd = 0
  },
  [43800102] = {
    id = 43800102,
    des = function()
      return T(80507061, 50)
    end,
    type = 1,
    value = {
      "706:2:2:40000301:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1,
    reset_last_deduce_time = 1
  },
  [43800201] = {
    id = 43800201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43800202:5003:10000"
    },
    buff_cd = 0
  },
  [43800202] = {
    id = 43800202,
    type = 10,
    value = {
      "125:2:2:40000102:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [43800301] = {
    id = 43800301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 203,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43800302:5001:10000:3100501"
    },
    buff_cd = 0
  },
  [43800302] = {
    id = 43800302,
    type = 10,
    value = {
      "125:2:2:40000102:2000:0",
      "10101:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_sound = 73100501
  },
  [43800401] = {
    id = 43800401,
    type = 1,
    value = {
      "10102:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 203,
    deduce_cnt = -1,
    deduce_buff_list = {
      "43800402:5001:10000"
    },
    buff_cd = 0
  },
  [43800402] = {
    id = 43800402,
    type = 50,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 73000601,
    beat_back_distance = {
      100,
      100,
      100,
      100,
      100
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    },
    swallow_range = 120
  },
  [43800501] = {
    id = 43800501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 203,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43800502:5001:10000"
    },
    buff_cd = 0
  },
  [43800502] = {
    id = 43800502,
    type = 50,
    value = {
      "513:2:2:40000301:-10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 120,
    buff_cd = 0
  },
  [43810101] = {
    id = 43810101,
    name = function()
      return T(80407060)
    end,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43810102:5003:10000"
    },
    buff_cd = 0
  },
  [43810102] = {
    id = 43810102,
    des = function()
      return T(80507061, 20)
    end,
    type = 1,
    value = {
      "706:2:2:40000301:-2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1,
    reset_last_deduce_time = 1
  },
  [43810201] = {
    id = 43810201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 203,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43810202:5003:10000",
      "43810203:3001:10000:3100101"
    },
    buff_cd = 0
  },
  [43810202] = {
    id = 43810202,
    type = 1,
    value = {
      "125:2:2:40000102:1000:0:0",
      "10101:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [43810203] = {
    id = 43810203,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 73100101
  },
  [43810301] = {
    id = 43810301,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 9999,
    settle_buff_list = {
      "43810302:3001:10000"
    },
    buff_cd = 0
  },
  [43810302] = {
    id = 43810302,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    settle_buff_list = {
      "43810305:3001:10000"
    },
    deduce_buff_list = {
      "43810303:3002:10000"
    },
    buff_cd = 0
  },
  [43810303] = {
    id = 43810303,
    type = 101,
    value = {
      "304:2:2:40000102:-1000:0"
    },
    trigger_condition = 2011,
    trigger_type = 4,
    trigger_value = 5000,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43810304:1001:10000:3100201"
    },
    active_forever = 1,
    buff_cd = 0,
    settle_sound = 73100201
  },
  [43810304] = {
    id = 43810304,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 2,
    deduce_value = 2,
    deduce_buff_list = {
      "43810307:1001:10000"
    },
    buff_cd = 0,
    clean_buff_group = {"1:43810302"}
  },
  [43810305] = {
    id = 43810305,
    type = 101,
    value = {
      "407:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    settle_buff_list = {
      "43810306:3001:10000"
    },
    buff_cd = 0
  },
  [43810306] = {
    id = 43810306,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    buff_cd = 0,
    immune_group = {"5:101", ""}
  },
  [43810307] = {
    id = 43810307,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 2,
    deduce_value = 2,
    buff_cd = 0,
    clean_buff_group = {"1:43810301"}
  },
  [43810401] = {
    id = 43810401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "43810402:5003:10000"
    },
    buff_cd = 0
  },
  [43810402] = {
    id = 43810402,
    type = 1,
    value = {
      "706:2:2:40000301:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1,
    reset_last_deduce_time = 1
  },
  [43810403] = {
    id = 43810403,
    type = 1,
    value = {
      "125:2:2:40000102:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43810404:1001:10000"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [43810404] = {
    id = 43810404,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 10,
    deduce_buff_list = {
      "43810405:1001:10000"
    },
    buff_cd = 0
  },
  [43810405] = {
    id = 43810405,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:43810401"}
  },
  [43810501] = {
    id = 43810501,
    type = 1,
    value = {
      "10102:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 203,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43810502:5001:10000"
    },
    buff_cd = 0
  },
  [43810502] = {
    id = 43810502,
    type = 1,
    value = {
      "512:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 73000601,
    beat_back_distance = {
      100,
      100,
      100,
      100,
      100
    },
    beat_back_frames = {
      20,
      13,
      12,
      11,
      10
    },
    swallow_range = 120
  },
  [43810601] = {
    id = 43810601,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    settle_buff_list = {
      "43810602:3001:10000"
    },
    buff_cd = 0
  },
  [43810602] = {
    id = 43810602,
    type = 101,
    value = {
      "407:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    settle_buff_list = {
      "43810603:3001:10000"
    },
    buff_cd = 0
  },
  [43810603] = {
    id = 43810603,
    type = 101,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    immune_group = {"5:101", ""}
  },
  [43810701] = {
    id = 43810701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 203,
    deduce_cnt = 1,
    deduce_buff_list = {
      "43810702:5001:10000",
      "43810703:1001:10000:3100401"
    },
    buff_cd = 0
  },
  [43810702] = {
    id = 43810702,
    type = 1,
    value = {
      "514:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "43810704:1002:10000:3100401"
    },
    buff_cd = 0
  },
  [43810703] = {
    id = 43810703,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 73100401
  },
  [43810704] = {
    id = 43810704,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 73100402
  },
  [45000001] = {
    id = 45000001,
    type = 1,
    value = {
      "637:2:1:0:1500"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45000002] = {
    id = 45000002,
    type = 1,
    value = {
      "533:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45000003] = {
    id = 45000003,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    immune_group = {"3:512", "3:515"}
  },
  [45101101] = {
    id = 45101101,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 10)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45101201] = {
    id = 45101201,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 20)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45101301] = {
    id = 45101301,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 30)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45101401] = {
    id = 45101401,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 40)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45101501] = {
    id = 45101501,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 50)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102101] = {
    id = 45102101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45102102:1002:10000",
      "45102103:1002:10000"
    },
    buff_cd = 0
  },
  [45102102] = {
    id = 45102102,
    type = 1,
    value = {
      "626:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102103] = {
    id = 45102103,
    type = 1,
    value = {
      "625:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102201] = {
    id = 45102201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45102202:1002:10000",
      "45102203:1002:10000"
    },
    buff_cd = 0
  },
  [45102202] = {
    id = 45102202,
    type = 1,
    value = {
      "626:2:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102203] = {
    id = 45102203,
    type = 1,
    value = {
      "625:2:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102301] = {
    id = 45102301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45102302:1002:10000",
      "45102303:1002:10000"
    },
    buff_cd = 0
  },
  [45102302] = {
    id = 45102302,
    type = 1,
    value = {
      "626:2:1:0:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102303] = {
    id = 45102303,
    type = 1,
    value = {
      "625:2:1:0:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102401] = {
    id = 45102401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45102402:1002:10000",
      "45102403:1002:10000"
    },
    buff_cd = 0
  },
  [45102402] = {
    id = 45102402,
    type = 1,
    value = {
      "626:2:1:0:8000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102403] = {
    id = 45102403,
    type = 1,
    value = {
      "625:2:1:0:8000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102501] = {
    id = 45102501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45102502:1002:10000",
      "45102503:1002:10000"
    },
    buff_cd = 0
  },
  [45102502] = {
    id = 45102502,
    type = 1,
    value = {
      "626:2:1:0:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45102503] = {
    id = 45102503,
    type = 1,
    value = {
      "625:2:1:0:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103101] = {
    id = 45103101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45103102:1002:10000",
      "45103103:1002:10000"
    },
    buff_cd = 0
  },
  [45103102] = {
    id = 45103102,
    type = 1,
    value = {
      "614:2:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103103] = {
    id = 45103103,
    type = 1,
    value = {
      "614:2:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103201] = {
    id = 45103201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45103202:1002:10000",
      "45103203:1002:10000"
    },
    buff_cd = 0
  },
  [45103202] = {
    id = 45103202,
    type = 1,
    value = {
      "614:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103203] = {
    id = 45103203,
    type = 1,
    value = {
      "614:2:1:0:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103301] = {
    id = 45103301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45103302:1002:10000",
      "45103303:1002:10000"
    },
    buff_cd = 0
  },
  [45103302] = {
    id = 45103302,
    type = 1,
    value = {
      "614:2:1:0:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103303] = {
    id = 45103303,
    type = 1,
    value = {
      "614:2:1:0:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103401] = {
    id = 45103401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45103402:1002:10000",
      "45103403:1002:10000"
    },
    buff_cd = 0
  },
  [45103402] = {
    id = 45103402,
    type = 1,
    value = {
      "614:2:1:0:4000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103403] = {
    id = 45103403,
    type = 1,
    value = {
      "614:2:1:0:4000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103501] = {
    id = 45103501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45103502:1002:10000",
      "45103503:1002:10000"
    },
    buff_cd = 0
  },
  [45103502] = {
    id = 45103502,
    type = 1,
    value = {
      "614:2:1:0:5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45103503] = {
    id = 45103503,
    type = 1,
    value = {
      "614:2:1:0:5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45104101] = {
    id = 45104101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45104102:3101:10000"
    },
    buff_cd = 0
  },
  [45104102] = {
    id = 45104102,
    type = 1,
    value = {
      "125:2:2:40000102:500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45104201] = {
    id = 45104201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45104202:3101:10000"
    },
    buff_cd = 0
  },
  [45104202] = {
    id = 45104202,
    type = 1,
    value = {
      "125:2:2:40000102:1000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45104301] = {
    id = 45104301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45104302:3101:10000"
    },
    buff_cd = 0
  },
  [45104302] = {
    id = 45104302,
    type = 1,
    value = {
      "125:2:2:40000102:1500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45104401] = {
    id = 45104401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45104402:3101:10000"
    },
    buff_cd = 0
  },
  [45104402] = {
    id = 45104402,
    type = 1,
    value = {
      "125:2:2:40000102:2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45104501] = {
    id = 45104501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45104502:3101:10000"
    },
    buff_cd = 0
  },
  [45104502] = {
    id = 45104502,
    type = 1,
    value = {
      "125:2:2:40000102:2500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45105101] = {
    id = 45105101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "45105102:2041:10000"
    },
    buff_cd = 0
  },
  [45105102] = {
    id = 45105102,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 20)
    end,
    type = 1,
    value = {
      "701:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 30,
    buff_cd = 0,
    settle_reset = 1,
    reset_last_deduce_time = 1,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [45105201] = {
    id = 45105201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "45105202:2041:10000"
    },
    buff_cd = 0
  },
  [45105202] = {
    id = 45105202,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 40)
    end,
    type = 1,
    value = {
      "701:2:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 30,
    buff_cd = 0,
    settle_reset = 1,
    reset_last_deduce_time = 1,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [45105301] = {
    id = 45105301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "45105302:2041:10000"
    },
    buff_cd = 0
  },
  [45105302] = {
    id = 45105302,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 60)
    end,
    type = 1,
    value = {
      "701:2:1:0:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 30,
    buff_cd = 0,
    settle_reset = 1,
    reset_last_deduce_time = 1,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [45105401] = {
    id = 45105401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "45105402:2041:10000"
    },
    buff_cd = 0
  },
  [45105402] = {
    id = 45105402,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 80)
    end,
    type = 1,
    value = {
      "701:2:1:0:8000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 30,
    buff_cd = 0,
    settle_reset = 1,
    reset_last_deduce_time = 1,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [45105501] = {
    id = 45105501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "45105502:2041:10000"
    },
    buff_cd = 0
  },
  [45105502] = {
    id = 45105502,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 100)
    end,
    type = 1,
    value = {
      "701:2:1:0:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 30,
    buff_cd = 0,
    settle_reset = 1,
    reset_last_deduce_time = 1,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [45106101] = {
    id = 45106101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45106102:1002:10000"
    },
    buff_cd = 0
  },
  [45106102] = {
    id = 45106102,
    name = function()
      return T(80401360)
    end,
    des = function()
      return T(80501360, 300)
    end,
    type = 1,
    value = {
      "136:1:1:0:300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45106201] = {
    id = 45106201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45106202:1002:10000"
    },
    buff_cd = 0
  },
  [45106202] = {
    id = 45106202,
    name = function()
      return T(80401360)
    end,
    des = function()
      return T(80501360, 350)
    end,
    type = 1,
    value = {
      "136:1:1:0:350:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45106301] = {
    id = 45106301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45106302:1002:10000"
    },
    buff_cd = 0
  },
  [45106302] = {
    id = 45106302,
    name = function()
      return T(80401360)
    end,
    des = function()
      return T(80501360, 400)
    end,
    type = 1,
    value = {
      "136:1:1:0:400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45106401] = {
    id = 45106401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45106402:1002:10000"
    },
    buff_cd = 0
  },
  [45106402] = {
    id = 45106402,
    name = function()
      return T(80401360)
    end,
    des = function()
      return T(80501360, 450)
    end,
    type = 1,
    value = {
      "136:1:1:0:450:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45106501] = {
    id = 45106501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45106502:1002:10000"
    },
    buff_cd = 0
  },
  [45106502] = {
    id = 45106502,
    name = function()
      return T(80401360)
    end,
    des = function()
      return T(80501360, 500)
    end,
    type = 1,
    value = {
      "136:1:1:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45107101] = {
    id = 45107101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45107102:1002:10000"
    },
    buff_cd = 0
  },
  [45107102] = {
    id = 45107102,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 5)
    end,
    type = 1,
    value = {
      "601:2:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45107201] = {
    id = 45107201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45107202:1002:10000"
    },
    buff_cd = 0
  },
  [45107202] = {
    id = 45107202,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 6)
    end,
    type = 1,
    value = {
      "601:2:1:0:-600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45107301] = {
    id = 45107301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45107302:1002:10000"
    },
    buff_cd = 0
  },
  [45107302] = {
    id = 45107302,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 7)
    end,
    type = 1,
    value = {
      "601:2:1:0:-700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45107401] = {
    id = 45107401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45107402:1002:10000"
    },
    buff_cd = 0
  },
  [45107402] = {
    id = 45107402,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 8)
    end,
    type = 1,
    value = {
      "601:2:1:0:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45107501] = {
    id = 45107501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45107502:1002:10000"
    },
    buff_cd = 0
  },
  [45107502] = {
    id = 45107502,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45108101] = {
    id = 45108101,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "45108102:2041:10000"
    },
    buff_cd = 0
  },
  [45108102] = {
    id = 45108102,
    type = 1,
    value = {
      "125:2:2:40000102:50:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [45108201] = {
    id = 45108201,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "45108202:2041:10000"
    },
    buff_cd = 0
  },
  [45108202] = {
    id = 45108202,
    type = 1,
    value = {
      "125:2:2:40000102:100:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [45108301] = {
    id = 45108301,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "45108302:2041:10000"
    },
    buff_cd = 0
  },
  [45108302] = {
    id = 45108302,
    type = 1,
    value = {
      "125:2:2:40000102:150:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [45108401] = {
    id = 45108401,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "45108402:2041:10000"
    },
    buff_cd = 0
  },
  [45108402] = {
    id = 45108402,
    type = 1,
    value = {
      "125:2:2:40000102:200:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [45108501] = {
    id = 45108501,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "45108502:2041:10000"
    },
    buff_cd = 0
  },
  [45108502] = {
    id = 45108502,
    type = 1,
    value = {
      "125:2:2:40000102:250:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [45211011] = {
    id = 45211011,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 25)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:2500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45211021] = {
    id = 45211021,
    type = 1,
    value = {
      "608:2:2:40000102:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45211031] = {
    id = 45211031,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 302,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45211032:1002:10000"
    },
    buff_cd = 0
  },
  [45211032] = {
    id = 45211032,
    type = 1,
    value = {
      "609:2:2:40000102:-370:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45212011] = {
    id = 45212011,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 40)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:4000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45212021] = {
    id = 45212021,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 30)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45212031] = {
    id = 45212031,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = -1,
    deduce_value = 3,
    deduce_buff_list = {
      "45212032:1002:10000"
    },
    buff_cd = 0
  },
  [45212032] = {
    id = 45212032,
    type = 1,
    value = {
      "304:2:2:40000102:-130:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45213011] = {
    id = 45213011,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 25)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45213021] = {
    id = 45213021,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 25)
    end,
    type = 1,
    value = {
      "601:1:1:0:-2500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45213031] = {
    id = 45213031,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506111, 25)
    end,
    type = 1,
    value = {
      "611:1:1:0:2500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45214011] = {
    id = 45214011,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 30)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45214021] = {
    id = 45214021,
    type = 1,
    value = {
      "608:2:2:40000102:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45214031] = {
    id = 45214031,
    type = 1,
    value = {
      "603:1:1:0:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45215011] = {
    id = 45215011,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45215021] = {
    id = 45215021,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 25)
    end,
    type = 1,
    value = {
      "601:1:1:0:-2500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45215031] = {
    id = 45215031,
    name = function()
      return T(80406110)
    end,
    des = function()
      return T(80506111, 25)
    end,
    type = 1,
    value = {
      "611:1:1:0:2500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45300101] = {
    id = 45300101,
    type = 1,
    value = {
      "106:2:2:40000102:100:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45300201] = {
    id = 45300201,
    type = 1,
    value = {
      "106:2:2:40000102:150:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45300301] = {
    id = 45300301,
    type = 1,
    value = {
      "106:2:2:40000102:200:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45300401] = {
    id = 45300401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45300402:1002:10000",
      "45300403:1002:10000",
      "45300404:1002:10000",
      "45300405:1002:10000"
    },
    buff_cd = 0
  },
  [45300402] = {
    id = 45300402,
    name = function()
      return T(80407090)
    end,
    des = function()
      return T(80507090, 50)
    end,
    type = 1,
    value = {
      "709:2:1:0:-5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45300403] = {
    id = 45300403,
    name = function()
      return T(80407090)
    end,
    des = function()
      return T(80507090, 50)
    end,
    type = 1,
    value = {
      "709:2:1:0:-5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45300404] = {
    id = 45300404,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 100)
    end,
    type = 1,
    value = {
      "614:2:1:0:10000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45300405] = {
    id = 45300405,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 100)
    end,
    type = 1,
    value = {
      "614:2:1:0:10000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45300501] = {
    id = 45300501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45300502:1002:10000",
      "45300503:1002:10000",
      "45300504:1002:10000",
      "45300505:1002:10000"
    },
    buff_cd = 0
  },
  [45300502] = {
    id = 45300502,
    name = function()
      return T(80407090)
    end,
    des = function()
      return T(80507090, 50)
    end,
    type = 1,
    value = {
      "709:2:1:0:-5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45300503] = {
    id = 45300503,
    name = function()
      return T(80407090)
    end,
    des = function()
      return T(80507090, 50)
    end,
    type = 1,
    value = {
      "709:2:1:0:-5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45300504] = {
    id = 45300504,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 100)
    end,
    type = 1,
    value = {
      "614:2:1:0:10000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45300505] = {
    id = 45300505,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 100)
    end,
    type = 1,
    value = {
      "614:2:1:0:10000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45400201] = {
    id = 45400201,
    type = 1,
    value = {
      "648:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45400401] = {
    id = 45400401,
    type = 1,
    value = {
      "649:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45400601] = {
    id = 45400601,
    type = 1,
    value = {
      "650:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_show_icon = 1
  },
  [45400801] = {
    id = 45400801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45400802:3002:10000"
    },
    buff_cd = 0
  },
  [45400802] = {
    id = 45400802,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 10)
    end,
    type = 1,
    value = {
      "614:2:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45401001] = {
    id = 45401001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45401002:1002:10000:606"
    },
    buff_cd = 0
  },
  [45401002] = {
    id = 45401002,
    type = 60,
    value = {
      "606:2:12:40000104:300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45401201] = {
    id = 45401201,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506154, 500, "0.5")
    end,
    type = 1,
    value = {
      "615:2:13:40000102:-50:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1.3,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45401401] = {
    id = 45401401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45401402:3002:10000"
    },
    buff_cd = 0
  },
  [45401402] = {
    id = 45401402,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 10)
    end,
    type = 1,
    value = {
      "615:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45401501] = {
    id = 45401501,
    name = function()
      return T(80406460)
    end,
    des = function()
      return T(80506460, 30)
    end,
    type = 1,
    value = {
      "646:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45401601] = {
    id = 45401601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 16,
    deduce_cnt = 5,
    deduce_value = 1000,
    deduce_buff_list = {
      "45401602:1002:10000"
    },
    buff_cd = 0
  },
  [45401602] = {
    id = 45401602,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 10)
    end,
    type = 60,
    value = {
      "614:2:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 5,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45401801] = {
    id = 45401801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 401,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45401802:0:10000"
    },
    buff_cd = 0
  },
  [45401802] = {
    id = 45401802,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503034, 7, 3)
    end,
    type = 30,
    value = {
      "307:1:31:0:-700:0"
    },
    trigger_condition = 2011,
    trigger_type = 4,
    trigger_value = 5000,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [45402001] = {
    id = 45402001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45402002:3002:10000"
    },
    buff_cd = 0
  },
  [45402002] = {
    id = 45402002,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 10)
    end,
    type = 1,
    value = {
      "614:2:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45402201] = {
    id = 45402201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45402202:3002:10000"
    },
    buff_cd = 0
  },
  [45402202] = {
    id = 45402202,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 10)
    end,
    type = 1,
    value = {
      "614:2:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45402301] = {
    id = 45402301,
    name = function()
      return T(80406470)
    end,
    des = function()
      return T(80506471, 50)
    end,
    type = 1,
    value = {
      "647:1:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45402401] = {
    id = 45402401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 31,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45402402:1002:10000"
    },
    buff_cd = 0
  },
  [45402402] = {
    id = 45402402,
    type = 60,
    value = {
      "614:2:1:0:3000:0"
    },
    trigger_condition = 2161,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45500101] = {
    id = 45500101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45500102:1002:10000"
    },
    buff_cd = 0
  },
  [45500102] = {
    id = 45500102,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 30)
    end,
    type = 1,
    value = {
      "615:2:1:0:-3000:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45500201] = {
    id = 45500201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45500202:1002:10000"
    },
    buff_cd = 0
  },
  [45500202] = {
    id = 45500202,
    type = 30,
    value = {
      "304:2:2:40000102:-500:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45500301] = {
    id = 45500301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45500302:1002:10000"
    },
    buff_cd = 0
  },
  [45500302] = {
    id = 45500302,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 30)
    end,
    type = 1,
    value = {
      "614:2:1:0:3000:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45600101] = {
    id = 45600101,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 5)
    end,
    type = 1,
    value = {
      "614:2:1:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45600201] = {
    id = 45600201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45600202:1002:10000:120"
    },
    buff_cd = 0
  },
  [45600202] = {
    id = 45600202,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501200, 10, 15)
    end,
    type = 1,
    value = {
      "120:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [45601101] = {
    id = 45601101,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506150, 5)
    end,
    type = 1,
    value = {
      "615:2:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45601201] = {
    id = 45601201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 3,
    deduce_value = 5,
    deduce_buff_list = {
      "45601202:1002:10000"
    },
    buff_cd = 0
  },
  [45601202] = {
    id = 45601202,
    type = 1,
    value = {
      "304:2:2:40000102:-300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45602101] = {
    id = 45602101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45602102:1002:10000",
      "45602103:1002:10000"
    },
    buff_cd = 0
  },
  [45602102] = {
    id = 45602102,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 5)
    end,
    type = 1,
    value = {
      "614:2:1:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45602103] = {
    id = 45602103,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 5)
    end,
    type = 1,
    value = {
      "615:2:1:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45602201] = {
    id = 45602201,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 10, 15)
    end,
    type = 1,
    value = {
      "702:2:2:40000103:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [45700001] = {
    id = 45700001,
    type = 1,
    value = {
      "1102:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45700011] = {
    id = 45700011,
    type = 1,
    value = {
      "1103:2:18:40000103:12500:0",
      "608:2:18:40000101:12500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "45700012:1002:10000"
    },
    buff_cd = 0
  },
  [45700012] = {
    id = 45700012,
    type = 1,
    value = {
      "306:2:18:40000101:-12500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    not_display = 1
  },
  [45700021] = {
    id = 45700021,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "45700022:1002:10000"
    },
    buff_cd = 0
  },
  [45700022] = {
    id = 45700022,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 50)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45700031] = {
    id = 45700031,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 2699,
    deduce_buff_list = {
      "45700032:2021:10000",
      "45700033:7001:10000"
    },
    buff_cd = 0
  },
  [45700032] = {
    id = 45700032,
    type = 1,
    value = {
      "132:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45700033] = {
    id = 45700033,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"1:45701101", "1:45702101"}
  },
  [45701101] = {
    id = 45701101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 204,
    deduce_cnt = -1,
    deduce_type_param = "1201",
    deduce_buff_list = {
      "45701102:3002:10000",
      "45701103:3002:10000"
    },
    buff_cd = 0
  },
  [45701102] = {
    id = 45701102,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45701103] = {
    id = 45701103,
    name = function()
      return T(80406470)
    end,
    des = function()
      return T(80506471, 10)
    end,
    type = 1,
    value = {
      "647:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45701111] = {
    id = 45701111,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 132,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45701112:1002:10000",
      "45701113:1002:10000"
    },
    buff_cd = 0
  },
  [45701112] = {
    id = 45701112,
    type = 1,
    value = {
      "106:1:2:40000101:8000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 50,
    deduce_buff_list = {
      "45701114:1002:10000:2001"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [45701113] = {
    id = 45701113,
    name = function()
      return T(80412010)
    end,
    des = function()
      return T(80512010, 1.67, 80)
    end,
    type = 1,
    value = {
      "1201:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45701114] = {
    id = 45701114,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45702101] = {
    id = 45702101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 204,
    deduce_cnt = -1,
    deduce_type_param = "1202",
    deduce_buff_list = {
      "45702102:3002:10000"
    },
    buff_cd = 0
  },
  [45702102] = {
    id = 45702102,
    name = function()
      return T(80412040)
    end,
    des = function()
      return T(80512040, "0.9", 1, 2)
    end,
    type = 1,
    value = {
      "1204:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    settle_buff_list = {
      "45702103:1002:10000"
    },
    buff_cd = 0
  },
  [45702103] = {
    id = 45702103,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 116,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45702104:1002:10000"
    },
    buff_cd = 0
  },
  [45702104] = {
    id = 45702104,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 2102,
    trigger_type = 4,
    trigger_value = 90,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45702105:4001:10000"
    },
    buff_cd = 0
  },
  [45702105] = {
    id = 45702105,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 2)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 2004,
    trigger_type = 2,
    trigger_value = 45702107,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 30,
    settle_buff_list = {
      "45702106:1002:10000",
      "45702107:1002:10000"
    },
    buff_cd = 0
  },
  [45702106] = {
    id = 45702106,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507100, 20)
    end,
    type = 1,
    value = {
      "710:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45702107] = {
    id = 45702107,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 2,
    deduce_value = 1,
    buff_cd = 0
  },
  [45702111] = {
    id = 45702111,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 134,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45702112:3031:10000",
      "45702115:1002:10000",
      "45702116:1002:10000"
    },
    buff_cd = 0
  },
  [45702112] = {
    id = 45702112,
    type = 1,
    value = {
      "107:1:17:40000103:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 15,
    deduce_buff_list = {
      "45702113:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [45702113] = {
    id = 45702113,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 1)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0
  },
  [45702114] = {
    id = 45702114,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 67,
    buff_cd = 0
  },
  [45702115] = {
    id = 45702115,
    type = 1,
    value = {
      "1203:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 15,
    deduce_buff_list = {
      "45702114:1002:10000:2002"
    },
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [45702116] = {
    id = 45702116,
    type = 1,
    value = {
      "1202:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45800101] = {
    id = 45800101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_buff_list = {
      "45800102:1002:10000"
    },
    buff_cd = 0
  },
  [45800102] = {
    id = 45800102,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506155, 5, 50)
    end,
    type = 1,
    value = {
      "615:2:19:0:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [45800201] = {
    id = 45800201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45800202:3002:10000"
    },
    buff_cd = 0
  },
  [45800202] = {
    id = 45800202,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 151,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45800203:4002:10000:2004"
    },
    buff_cd = 0
  },
  [45800203] = {
    id = 45800203,
    name = function()
      return T(80409010)
    end,
    des = function()
      return T(80509010, 34)
    end,
    type = 1,
    value = {
      "901:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45800204:3171:10000",
      "45800205:1002:10000:2005"
    },
    buff_cd = 0,
    settle_when_dead = 1
  },
  [45800204] = {
    id = 45800204,
    type = 1,
    value = {
      "106:2:2:40000102:3400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [45800205] = {
    id = 45800205,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_when_dead = 1
  },
  [45800301] = {
    id = 45800301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 13,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45800302:1002:10000",
      "45800303:1002:10000"
    },
    buff_cd = 0
  },
  [45800302] = {
    id = 45800302,
    type = 60,
    value = {
      "305:2:2:40000102:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0,
    settle_when_dead = 1,
    clean_buff_group = {
      "1:45800402:1002:10000"
    }
  },
  [45800303] = {
    id = 45800303,
    type = 1,
    value = {
      "514:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45800304:1002:10000:3100401"
    },
    buff_cd = 0,
    settle_when_dead = 1
  },
  [45800304] = {
    id = 45800304,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45800401] = {
    id = 45800401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 141,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45800402:1002:10000"
    },
    buff_cd = 0
  },
  [45800402] = {
    id = 45800402,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501032, "0.2", 1)
    end,
    type = 10,
    value = {
      "103:2:2:40000102:100:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = -1,
    deduce_value = 6,
    active_forever = 1,
    buff_cd = 0
  },
  [45800501] = {
    id = 45800501,
    type = 1,
    value = {
      "409:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45800601] = {
    id = 45800601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45800602:3002:10000",
      "45800604:3002:10000"
    },
    buff_cd = 0
  },
  [45800602] = {
    id = 45800602,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 151,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45800603:1002:10000"
    },
    buff_cd = 0
  },
  [45800603] = {
    id = 45800603,
    type = 1,
    value = {
      "137:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45800604] = {
    id = 45800604,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 152,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45800605:1002:10000:2003"
    },
    buff_cd = 0
  },
  [45800605] = {
    id = 45800605,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 8,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45800606] = {
    id = 45800606,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 32,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45904701] = {
    id = 45904701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45904702:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45904702] = {
    id = 45904702,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 50)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45904801] = {
    id = 45904801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45904802:3002:10000",
      "45904803:3002:10000",
      "45904804:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45904802] = {
    id = 45904802,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 8)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45904803] = {
    id = 45904803,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 8)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45904804] = {
    id = 45904804,
    type = 1,
    value = {
      "608:2:2:40000102:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45904901] = {
    id = 45904901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45904902:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45904902] = {
    id = 45904902,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905001] = {
    id = 45905001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905002:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905002] = {
    id = 45905002,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 10)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905101] = {
    id = 45905101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905102:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905102] = {
    id = 45905102,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 15)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905201] = {
    id = 45905201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905202:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905202] = {
    id = 45905202,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905301] = {
    id = 45905301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905302:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905302] = {
    id = 45905302,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905401] = {
    id = 45905401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905402:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905402] = {
    id = 45905402,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905501] = {
    id = 45905501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905502:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905502] = {
    id = 45905502,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905601] = {
    id = 45905601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905602:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905602] = {
    id = 45905602,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905701] = {
    id = 45905701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905702:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905702] = {
    id = 45905702,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905801] = {
    id = 45905801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905802:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905802] = {
    id = 45905802,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905901] = {
    id = 45905901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45905902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45905902] = {
    id = 45905902,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906001] = {
    id = 45906001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906002] = {
    id = 45906002,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906101] = {
    id = 45906101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906102:3002:10000",
      "45906103:3002:10000",
      "45906104:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906102] = {
    id = 45906102,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 30)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906103] = {
    id = 45906103,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906104] = {
    id = 45906104,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906201] = {
    id = 45906201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906202:3002:10000",
      "45906203:3002:10000",
      "45906204:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906202] = {
    id = 45906202,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 30)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906203] = {
    id = 45906203,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906204] = {
    id = 45906204,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906301] = {
    id = 45906301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906302:3002:10000",
      "45906303:3002:10000",
      "45906304:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906302] = {
    id = 45906302,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 30)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906303] = {
    id = 45906303,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906304] = {
    id = 45906304,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906401] = {
    id = 45906401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906402:3002:10000",
      "45906403:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906402] = {
    id = 45906402,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906403] = {
    id = 45906403,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906501] = {
    id = 45906501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906502:3002:10000",
      "45906503:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906502] = {
    id = 45906502,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906503] = {
    id = 45906503,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906601] = {
    id = 45906601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906602:3002:10000",
      "45906603:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906602] = {
    id = 45906602,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906603] = {
    id = 45906603,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507021, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906701] = {
    id = 45906701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906702:3002:10000",
      "45906703:3002:10000",
      "45906704:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906702] = {
    id = 45906702,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 15)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906703] = {
    id = 45906703,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 15)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906704] = {
    id = 45906704,
    type = 1,
    value = {
      "608:2:2:40000102:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906801] = {
    id = 45906801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906802:3021:10000",
      ""
    },
    buff_cd = 0
  },
  [45906802] = {
    id = 45906802,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 100)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45906901] = {
    id = 45906901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45906902:3002:10000",
      "45906903:3002:10000",
      "45906904:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906902] = {
    id = 45906902,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906903] = {
    id = 45906903,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 5)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45906904] = {
    id = 45906904,
    type = 1,
    value = {
      "608:2:2:40000102:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907001] = {
    id = 45907001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907002] = {
    id = 45907002,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:21:40000103:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907101] = {
    id = 45907101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907102:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907102] = {
    id = 45907102,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:22:40000103:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907201] = {
    id = 45907201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907202:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907202] = {
    id = 45907202,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:23:40000103:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907301] = {
    id = 45907301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907302:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907302] = {
    id = 45907302,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 5)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907401] = {
    id = 45907401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907402:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907402] = {
    id = 45907402,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 8)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907501] = {
    id = 45907501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907502:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907502] = {
    id = 45907502,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 10)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907601] = {
    id = 45907601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907602:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907602] = {
    id = 45907602,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 15)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907701] = {
    id = 45907701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907702:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907702] = {
    id = 45907702,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 5)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907801] = {
    id = 45907801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907802:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907802] = {
    id = 45907802,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 8)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907901] = {
    id = 45907901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45907902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45907902] = {
    id = 45907902,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 10)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908001] = {
    id = 45908001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908002] = {
    id = 45908002,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 15)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908101] = {
    id = 45908101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908102:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908102] = {
    id = 45908102,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 20)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908201] = {
    id = 45908201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908202:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908202] = {
    id = 45908202,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 30)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908301] = {
    id = 45908301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908302:3002:10000",
      "45908303:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908302] = {
    id = 45908302,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 5)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908303] = {
    id = 45908303,
    type = 1,
    value = {
      "608:2:2:40000102:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908401] = {
    id = 45908401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908402:3002:10000",
      "45908403:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908402] = {
    id = 45908402,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 10)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908403] = {
    id = 45908403,
    type = 1,
    value = {
      "608:2:2:40000102:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908501] = {
    id = 45908501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908502:3002:10000:120"
    },
    buff_cd = 0
  },
  [45908502] = {
    id = 45908502,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501202, 50)
    end,
    type = 40,
    value = {
      "120:2:2:40000104:5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45908601] = {
    id = 45908601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908602:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908602] = {
    id = 45908602,
    name = function()
      return T(80401220)
    end,
    des = function()
      return T(80501220, 5)
    end,
    type = 1,
    value = {
      "122:1:1:0:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908701] = {
    id = 45908701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908702:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908702] = {
    id = 45908702,
    type = 1,
    value = {
      "122:1:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908801] = {
    id = 45908801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908802:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908802] = {
    id = 45908802,
    type = 1,
    value = {
      "122:1:1:0:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908901] = {
    id = 45908901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45908902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45908902] = {
    id = 45908902,
    type = 1,
    value = {
      "122:1:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909001] = {
    id = 45909001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909002:3002:10000",
      "45909003:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909002] = {
    id = 45909002,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 5)
    end,
    type = 1,
    value = {
      "605:2:20:40000104:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909003] = {
    id = 45909003,
    type = 1,
    value = {
      "608:2:20:40000102:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909101] = {
    id = 45909101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "45909102:3002:10000"
    },
    buff_cd = 0
  },
  [45909102] = {
    id = 45909102,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 3)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:300:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45909201] = {
    id = 45909201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909202:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909202] = {
    id = 45909202,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 10)
    end,
    type = 1,
    value = {
      "605:2:20:40000104:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909301] = {
    id = 45909301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909302:3002:10000",
      "45909303:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909302] = {
    id = 45909302,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 5)
    end,
    type = 1,
    value = {
      "602:2:21:40000103:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909303] = {
    id = 45909303,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 5)
    end,
    type = 1,
    value = {
      "605:2:21:40000104:500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909401] = {
    id = 45909401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909402:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909402] = {
    id = 45909402,
    type = 1,
    value = {
      "711:2:2:40000102:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909501] = {
    id = 45909501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909502:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909502] = {
    id = 45909502,
    type = 1,
    value = {
      "711:2:2:40000102:-700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909601] = {
    id = 45909601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909602:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909602] = {
    id = 45909602,
    type = 1,
    value = {
      "711:2:2:40000102:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909701] = {
    id = 45909701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909702:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909702] = {
    id = 45909702,
    type = 1,
    value = {
      "711:2:2:40000102:-1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909801] = {
    id = 45909801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909802:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909802] = {
    id = 45909802,
    type = 1,
    value = {
      "608:2:2:40000102:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909901] = {
    id = 45909901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45909902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45909902] = {
    id = 45909902,
    type = 1,
    value = {
      "608:2:2:40000102:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910001] = {
    id = 45910001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910002] = {
    id = 45910002,
    type = 1,
    value = {
      "608:2:2:40000102:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910101] = {
    id = 45910101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910102:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910102] = {
    id = 45910102,
    type = 1,
    value = {
      "608:2:2:40000102:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910201] = {
    id = 45910201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910202:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910202] = {
    id = 45910202,
    type = 1,
    value = {
      "608:2:2:40000102:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910301] = {
    id = 45910301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910302:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910302] = {
    id = 45910302,
    type = 1,
    value = {
      "608:2:2:40000102:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910401] = {
    id = 45910401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910402:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910402] = {
    id = 45910402,
    type = 1,
    value = {
      "608:2:2:40000102:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910501] = {
    id = 45910501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910502:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910502] = {
    id = 45910502,
    type = 1,
    value = {
      "608:2:2:40000102:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910601] = {
    id = 45910601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910602:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910602] = {
    id = 45910602,
    type = 1,
    value = {
      "608:2:2:40000102:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910701] = {
    id = 45910701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910702:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910702] = {
    id = 45910702,
    type = 1,
    value = {
      "608:2:2:40000102:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910801] = {
    id = 45910801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910802:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910802] = {
    id = 45910802,
    type = 1,
    value = {
      "608:2:2:40000102:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910901] = {
    id = 45910901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45910902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45910902] = {
    id = 45910902,
    type = 1,
    value = {
      "608:2:2:40000102:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911001] = {
    id = 45911001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911002] = {
    id = 45911002,
    type = 1,
    value = {
      "608:2:2:40000102:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911101] = {
    id = 45911101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911102:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911102] = {
    id = 45911102,
    type = 1,
    value = {
      "608:2:2:40000102:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911201] = {
    id = 45911201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911202:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911202] = {
    id = 45911202,
    type = 1,
    value = {
      "608:2:2:40000102:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911301] = {
    id = 45911301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911302:3002:10000",
      "45911303:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911302] = {
    id = 45911302,
    type = 1,
    value = {
      "711:2:2:40000102:-2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911303] = {
    id = 45911303,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 20)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911401] = {
    id = 45911401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911402:3002:10000",
      "45911403:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911402] = {
    id = 45911402,
    type = 1,
    value = {
      "711:2:2:40000102:-3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911403] = {
    id = 45911403,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 30)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911501] = {
    id = 45911501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911502:3002:10000",
      "45911503:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911502] = {
    id = 45911502,
    type = 1,
    value = {
      "711:2:2:40000102:-5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911503] = {
    id = 45911503,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 50)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:5000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911601] = {
    id = 45911601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911602:2021:10000",
      "45911603:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911602] = {
    id = 45911602,
    type = 1,
    value = {
      "711:2:2:40000102:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911603] = {
    id = 45911603,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 5)
    end,
    type = 70,
    value = {
      "701:1:1:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911701] = {
    id = 45911701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911702:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911702] = {
    id = 45911702,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911801] = {
    id = 45911801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911802:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911802] = {
    id = 45911802,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911901] = {
    id = 45911901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45911902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45911902] = {
    id = 45911902,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912001] = {
    id = 45912001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912002] = {
    id = 45912002,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 10)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912101] = {
    id = 45912101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912102:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912102] = {
    id = 45912102,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912201] = {
    id = 45912201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912202:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912202] = {
    id = 45912202,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912301] = {
    id = 45912301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912302:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912302] = {
    id = 45912302,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912401] = {
    id = 45912401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912402:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912402] = {
    id = 45912402,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-1500:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912501] = {
    id = 45912501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912502:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912502] = {
    id = 45912502,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 20)
    end,
    type = 1,
    value = {
      "601:2:1:0:-2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912601] = {
    id = 45912601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912602:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912602] = {
    id = 45912602,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 20)
    end,
    type = 1,
    value = {
      "601:2:1:0:-2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912701] = {
    id = 45912701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912702:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912702] = {
    id = 45912702,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 20)
    end,
    type = 1,
    value = {
      "601:2:1:0:-2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912801] = {
    id = 45912801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912802:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912802] = {
    id = 45912802,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 20)
    end,
    type = 1,
    value = {
      "601:2:1:0:-2000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912901] = {
    id = 45912901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45912902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45912902] = {
    id = 45912902,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506015, "0.1")
    end,
    type = 1,
    value = {
      "601:2:24:0:-10:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913001] = {
    id = 45913001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913002] = {
    id = 45913002,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506015, "0.2")
    end,
    type = 1,
    value = {
      "601:2:24:0:-20:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913101] = {
    id = 45913101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913102:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913102] = {
    id = 45913102,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506015, "0.3")
    end,
    type = 1,
    value = {
      "601:2:24:0:-30:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913201] = {
    id = 45913201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913202:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913202] = {
    id = 45913202,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 4)
    end,
    type = 70,
    value = {
      "701:2:1:0:400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913301] = {
    id = 45913301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913302:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913302] = {
    id = 45913302,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 5)
    end,
    type = 70,
    value = {
      "701:2:1:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913401] = {
    id = 45913401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913402:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913402] = {
    id = 45913402,
    name = function()
      return T(80407010)
    end,
    des = function()
      return T(80507011, 6)
    end,
    type = 70,
    value = {
      "701:2:1:0:600:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913501] = {
    id = 45913501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913502:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913502] = {
    id = 45913502,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506032, 10)
    end,
    type = 70,
    value = {
      "603:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913601] = {
    id = 45913601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913602:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913602] = {
    id = 45913602,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506032, 20)
    end,
    type = 70,
    value = {
      "603:1:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913701] = {
    id = 45913701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913702:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913702] = {
    id = 45913702,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506032, 40)
    end,
    type = 70,
    value = {
      "603:1:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913801] = {
    id = 45913801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913802:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913802] = {
    id = 45913802,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, 10)
    end,
    type = 70,
    value = {
      "604:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913901] = {
    id = 45913901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45913902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45913902] = {
    id = 45913902,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, 20)
    end,
    type = 70,
    value = {
      "604:1:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914001] = {
    id = 45914001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45914002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914002] = {
    id = 45914002,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, 40)
    end,
    type = 70,
    value = {
      "604:1:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914101] = {
    id = 45914101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45914102:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914102] = {
    id = 45914102,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, -10)
    end,
    type = 70,
    value = {
      "704:1:1:0:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914201] = {
    id = 45914201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45914202:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914202] = {
    id = 45914202,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, -20)
    end,
    type = 70,
    value = {
      "704:1:1:0:-2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914301] = {
    id = 45914301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45914302:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914302] = {
    id = 45914302,
    name = function()
      return T(80406040)
    end,
    des = function()
      return T(80506041, -40)
    end,
    type = 70,
    value = {
      "704:1:1:0:-4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914401] = {
    id = 45914401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45914402:3002:10000"
    },
    buff_cd = 0
  },
  [45914402] = {
    id = 45914402,
    name = function()
      return T(80403030)
    end,
    des = function()
      return T(80503033, "0.5")
    end,
    type = 30,
    value = {
      "303:2:2:40000102:-50:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45914501] = {
    id = 45914501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 302,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45914502:3002:10000"
    },
    buff_cd = 0
  },
  [45914502] = {
    id = 45914502,
    type = 1,
    value = {
      "304:2:2:40000102:-500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45914601] = {
    id = 45914601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 302,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45914602:3002:10000"
    },
    buff_cd = 0
  },
  [45914602] = {
    id = 45914602,
    type = 1,
    value = {
      "304:2:2:40000102:-1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45914901] = {
    id = 45914901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45914902:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45914902] = {
    id = 45914902,
    name = function()
      return T(80407130)
    end,
    des = function()
      return T(80507130, 10)
    end,
    type = 1,
    value = {
      "713:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915001] = {
    id = 45915001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45915002:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915002] = {
    id = 45915002,
    name = function()
      return T(80407140)
    end,
    des = function()
      return T(80507140, 10)
    end,
    type = 1,
    value = {
      "714:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915101] = {
    id = 45915101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45915102:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915102] = {
    id = 45915102,
    name = function()
      return T(80407150)
    end,
    des = function()
      return T(80507150, 10)
    end,
    type = 1,
    value = {
      "715:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915201] = {
    id = 45915201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45915202:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915202] = {
    id = 45915202,
    name = function()
      return T(80407160)
    end,
    des = function()
      return T(80507160, 10)
    end,
    type = 1,
    value = {
      "716:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915301] = {
    id = 45915301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45915302:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915302] = {
    id = 45915302,
    name = function()
      return T(80407170)
    end,
    des = function()
      return T(80507170, 10)
    end,
    type = 1,
    value = {
      "717:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915401] = {
    id = 45915401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45915402:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915402] = {
    id = 45915402,
    name = function()
      return T(80406200)
    end,
    des = function()
      return T(80506201, 10)
    end,
    type = 1,
    value = {
      "620:1:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915501] = {
    id = 45915501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45915502:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915502] = {
    id = 45915502,
    name = function()
      return T(80406200)
    end,
    des = function()
      return T(80506201, 10)
    end,
    type = 1,
    value = {
      "620:1:1:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45915601] = {
    id = 45915601,
    type = 1,
    value = {
      "804:1:1:0:250:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 304,
    deduce_cnt = 1,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45916001] = {
    id = 45916001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45916002:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45916002] = {
    id = 45916002,
    type = 1,
    value = {
      "718:1:1:0:30:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45916101] = {
    id = 45916101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45916102:2021:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45916102] = {
    id = 45916102,
    type = 1,
    value = {
      "718:1:1:0:30:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45920101] = {
    id = 45920101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45920102:3002:10000:120",
      "45920103:3002:10000"
    },
    buff_cd = 0
  },
  [45920102] = {
    id = 45920102,
    name = function()
      return T(80401200)
    end,
    des = function()
      return T(80501201, 100)
    end,
    type = 40,
    value = {
      "120:2:2:40000103:10000:0"
    },
    trigger_condition = 2051,
    trigger_type = 2,
    trigger_value = 10000131,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45920103] = {
    id = 45920103,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 2051,
    trigger_type = 2,
    trigger_value = 10000131,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 145,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45920104:0:1000"
    },
    buff_cd = 0
  },
  [45920104] = {
    id = 45920104,
    name = function()
      return T(80405010)
    end,
    des = function()
      return T(80505010, 1)
    end,
    type = 50,
    value = {
      "501:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 30,
    buff_cd = 0
  },
  [45920201] = {
    id = 45920201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45920202:3002:10000"
    },
    buff_cd = 0
  },
  [45920202] = {
    id = 45920202,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 2051,
    trigger_type = 2,
    trigger_value = 10000145,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45920203:2021:10000",
      "45920204:1002:10000"
    },
    buff_cd = 0
  },
  [45920203] = {
    id = 45920203,
    name = function()
      return T(80401100)
    end,
    des = function()
      return T(80501101, 30)
    end,
    type = 10,
    value = {
      "110:3:2:40000103:3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45920204] = {
    id = 45920204,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 31,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45920205:2021:10000"
    },
    buff_cd = 0
  },
  [45920205] = {
    id = 45920205,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507034, 30)
    end,
    type = 1,
    value = {
      "703:2:2:40000104:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 303,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [45920301] = {
    id = 45920301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45920302:3002:10000"
    },
    buff_cd = 0
  },
  [45920302] = {
    id = 45920302,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 2051,
    trigger_type = 2,
    trigger_value = 10000154,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45920303:3002:10000",
      "45920304:3002:10000"
    },
    buff_cd = 0
  },
  [45920303] = {
    id = 45920303,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 100, 30)
    end,
    type = 1,
    value = {
      "601:2:1:0:-10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 30,
    deduce_value = 1,
    buff_cd = 0
  },
  [45920304] = {
    id = 45920304,
    name = function()
      return T(80401220)
    end,
    des = function()
      return T(80501220, 10)
    end,
    type = 1,
    value = {
      "122:1:1:0:1000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 5,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45920401] = {
    id = 45920401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 15,
    deduce_buff_list = {
      "45920402:3002:10000"
    },
    buff_cd = 0
  },
  [45920402] = {
    id = 45920402,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506150, 100, 5)
    end,
    type = 60,
    value = {
      "615:2:1:0:-10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    settle_buff_list = {
      "45920403:1002:10000"
    },
    buff_cd = 0
  },
  [45920403] = {
    id = 45920403,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 5,
    deduce_buff_list = {
      "45920404:1002:10000"
    },
    buff_cd = 0
  },
  [45920404] = {
    id = 45920404,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 1,
    deduce_value = 15,
    deduce_buff_list = {
      "45920402:1002:10000"
    },
    buff_cd = 0
  },
  [45920501] = {
    id = 45920501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45920502:2021:10000:3001:3",
      "45920504:7001:10000:3005"
    },
    buff_cd = 0
  },
  [45920502] = {
    id = 45920502,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45920503:1002:10000"
    },
    buff_cd = 0,
    settle_sound = 74000002
  },
  [45920503] = {
    id = 45920503,
    type = 10,
    value = {
      "106:2:2:40000102:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 38,
    active_forever = 1,
    buff_cd = 0
  },
  [45920504] = {
    id = 45920504,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 74000001
  },
  [45920601] = {
    id = 45920601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "45920602:3191:10000",
      "45920606:7001:10000:3006"
    },
    buff_cd = 0
  },
  [45920602] = {
    id = 45920602,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45920603:2021:10000:3002:3"
    },
    buff_cd = 0
  },
  [45920603] = {
    id = 45920603,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45920604:1002:10000"
    },
    buff_cd = 0,
    settle_sound = 74000004
  },
  [45920604] = {
    id = 45920604,
    type = 10,
    value = {
      "104:3:1:40000103:5000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 15,
    deduce_buff_list = {
      "45920605:1002:5000"
    },
    active_forever = 1,
    buff_cd = 0,
    not_show_icon = 1
  },
  [45920605] = {
    id = 45920605,
    name = function()
      return T(80405030)
    end,
    des = function()
      return T(80505031, 2)
    end,
    type = 50,
    value = {
      "503:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 998,
    deduce_cnt = 1,
    deduce_value = 60,
    buff_cd = 0
  },
  [45920606] = {
    id = 45920606,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 74000003
  },
  [45920701] = {
    id = 45920701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 4,
    deduce_buff_list = {
      "45920702:3002:10000"
    },
    buff_cd = 0
  },
  [45920702] = {
    id = 45920702,
    type = 1,
    value = {
      "304:2:2:40000102:-400:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [45920801] = {
    id = 45920801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 10,
    deduce_buff_list = {
      "45920802:3002:10000:3003",
      "45920804:3191:10000",
      "45920807:7001:10000:3007"
    },
    buff_cd = 0
  },
  [45920802] = {
    id = 45920802,
    type = 10,
    value = {
      "125:2:2:40000102:0:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45920803:1002:10000:606"
    },
    active_forever = 1,
    buff_cd = 0
  },
  [45920803] = {
    id = 45920803,
    type = 60,
    value = {
      "606:2:2:40000102:2000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [45920804] = {
    id = 45920804,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45920805:2021:10000:3004:3"
    },
    buff_cd = 0
  },
  [45920805] = {
    id = 45920805,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "45920806:1002:10000"
    },
    buff_cd = 0,
    settle_sound = 74000006
  },
  [45920806] = {
    id = 45920806,
    type = 10,
    value = {
      "103:3:1:40000103:5000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 301,
    deduce_cnt = 1,
    deduce_value = 10,
    active_forever = 1,
    buff_cd = 0
  },
  [45920807] = {
    id = 45920807,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    settle_sound = 74000005
  },
  [45920901] = {
    id = 45920901,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45920902:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45920902] = {
    id = 45920902,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 2,
    deduce_cnt = -1,
    deduce_buff_list = {
      "45920903:1002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45920903] = {
    id = 45920903,
    type = 1,
    value = {
      "122:1:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 3,
    deduce_cnt = 1,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45921001] = {
    id = 45921001,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45921002:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45921002] = {
    id = 45921002,
    type = 1,
    value = {
      "614:2:25:0:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45921101] = {
    id = 45921101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "45921102:3002:10000"
    },
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [45921102] = {
    id = 45921102,
    type = 1,
    value = {
      "619:2:26:0:500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    not_display = 1,
    not_show_icon = 1
  },
  [47000101] = {
    id = 47000101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47000102:3002:10000"
    },
    buff_cd = 0
  },
  [47000102] = {
    id = 47000102,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 131,
    deduce_cnt = -1,
    deduce_buff_list = {
      "47000103:1002:10000"
    },
    buff_cd = 0
  },
  [47000103] = {
    id = 47000103,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507032, 80)
    end,
    type = 70,
    value = {
      "703:2:2:40000104:-8000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 147,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [47000201] = {
    id = 47000201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47000202:2021:10000"
    },
    buff_cd = 0
  },
  [47000202] = {
    id = 47000202,
    type = 1,
    value = {
      "648:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47000301] = {
    id = 47000301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47000302:3002:10000"
    },
    buff_cd = 0
  },
  [47000302] = {
    id = 47000302,
    name = function()
      return T(80407030)
    end,
    des = function()
      return T(80507033, 300)
    end,
    type = 70,
    value = {
      "703:2:1:0:-300:0"
    },
    trigger_condition = 2031,
    trigger_type = 5,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47000401] = {
    id = 47000401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47000402:3002:10000"
    },
    buff_cd = 0
  },
  [47000402] = {
    id = 47000402,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507100, 30)
    end,
    type = 1,
    value = {
      "710:2:1:0:3000:0"
    },
    trigger_condition = 2031,
    trigger_type = 2,
    trigger_value = 2,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47000501] = {
    id = 47000501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47000502:3002:10000"
    },
    buff_cd = 0
  },
  [47000502] = {
    id = 47000502,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 148,
    deduce_cnt = -1,
    deduce_buff_list = {
      "47000503:1002:10000"
    },
    buff_cd = 0
  },
  [47000503] = {
    id = 47000503,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507102, 30)
    end,
    type = 1,
    value = {
      "710:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 149,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [47000601] = {
    id = 47000601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47000602:1007:10000"
    },
    buff_cd = 0
  },
  [47000602] = {
    id = 47000602,
    type = 1,
    value = {
      "644:2:29:0:-200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 1,
    deduce_update_effect = 1,
    buff_cd = 0
  },
  [47000701] = {
    id = 47000701,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47000702:1007:10000"
    },
    buff_cd = 0
  },
  [47000702] = {
    id = 47000702,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 150,
    deduce_cnt = -1,
    deduce_buff_list = {
      "47000703:1002:10000",
      "47000704:1002:10000"
    },
    buff_cd = 0
  },
  [47000703] = {
    id = 47000703,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506020, 50, 10)
    end,
    type = 60,
    value = {
      "602:2:2:40000103:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [47000704] = {
    id = 47000704,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506050, 100, 10)
    end,
    type = 60,
    value = {
      "605:2:2:40000104:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0,
    settle_reset = 1
  },
  [47000801] = {
    id = 47000801,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47000802:1007:10000"
    },
    buff_cd = 0
  },
  [47000802] = {
    id = 47000802,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 131,
    deduce_cnt = -1,
    deduce_buff_list = {
      "47000803:1002:10000"
    },
    buff_cd = 0
  },
  [47000803] = {
    id = 47000803,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507101, 100)
    end,
    type = 1,
    value = {
      "710:2:1:0:10000:0"
    },
    trigger_condition = 2202,
    trigger_type = 2,
    trigger_value = 1,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 147,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [47010101] = {
    id = 47010101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47010102:3002:10000"
    },
    buff_cd = 0
  },
  [47010102] = {
    id = 47010102,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506011, 100)
    end,
    type = 1,
    value = {
      "601:2:1:0:-10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47010201] = {
    id = 47010201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47010202:3002:10000"
    },
    buff_cd = 0
  },
  [47010202] = {
    id = 47010202,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "47010203:1002:10000:606"
    },
    buff_cd = 0
  },
  [47010203] = {
    id = 47010203,
    type = 1,
    value = {
      "606:2:2:40000102:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0,
    settle_reset = 1
  },
  [47017801] = {
    id = 47017801,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47017802:3002:10000",
      "47017803:3002:10000"
    },
    buff_cd = 0
  },
  [47017802] = {
    id = 47017802,
    name = function()
      return T(80406150)
    end,
    des = function()
      return T(80506151, 72)
    end,
    type = 1,
    value = {
      "615:2:1:0:-7200:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47017803] = {
    id = 47017803,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "47017804:1002:10000"
    },
    buff_cd = 0
  },
  [47017804] = {
    id = 47017804,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507100, 8)
    end,
    type = 1,
    value = {
      "710:2:1:0:800:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020101] = {
    id = 47020101,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020102:3002:10000"
    },
    buff_cd = 0
  },
  [47020102] = {
    id = 47020102,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506441, 20)
    end,
    type = 1,
    value = {
      "644:2:1:0:2000:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020201] = {
    id = 47020201,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020202:3002:10000",
      "47020203:2021:10000"
    },
    buff_cd = 0
  },
  [47020202] = {
    id = 47020202,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506441, 20)
    end,
    type = 1,
    value = {
      "644:2:1:0:2000:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020203] = {
    id = 47020203,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506032, 40)
    end,
    type = 1,
    value = {
      "603:2:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020301] = {
    id = 47020301,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020302:3002:10000",
      "47020303:2021:10000",
      "47020304:2021:10000"
    },
    buff_cd = 0
  },
  [47020302] = {
    id = 47020302,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506441, 20)
    end,
    type = 1,
    value = {
      "644:2:1:0:2000:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 3,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020303] = {
    id = 47020303,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506032, 40)
    end,
    type = 1,
    value = {
      "603:2:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020304] = {
    id = 47020304,
    name = function()
      return T(80406580)
    end,
    des = function()
      return T(80506580, 20)
    end,
    type = 1,
    value = {
      "658:2:1:0:2000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020401] = {
    id = 47020401,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020402:3002:10000"
    },
    buff_cd = 0
  },
  [47020402] = {
    id = 47020402,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506441, 20)
    end,
    type = 1,
    value = {
      "644:2:1:0:2000:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020501] = {
    id = 47020501,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020502:3002:10000",
      "47020503:2021:10000"
    },
    buff_cd = 0
  },
  [47020502] = {
    id = 47020502,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506441, 20)
    end,
    type = 1,
    value = {
      "644:2:1:0:2000:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020503] = {
    id = 47020503,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "47020504:1002:10000"
    },
    buff_cd = 0
  },
  [47020504] = {
    id = 47020504,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 15)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020601] = {
    id = 47020601,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020602:3002:10000",
      "47020603:2021:10000"
    },
    buff_cd = 0
  },
  [47020602] = {
    id = 47020602,
    name = function()
      return T(80406440)
    end,
    des = function()
      return T(80506441, 20)
    end,
    type = 1,
    value = {
      "644:2:1:0:2000:0"
    },
    trigger_condition = 2041,
    trigger_type = 2,
    trigger_value = 4,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020603] = {
    id = 47020603,
    type = 1,
    value = {"1:0:0:0:0"},
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 15,
    deduce_buff_list = {
      "47020604:1002:10000",
      "47020605:1002:10000"
    },
    buff_cd = 0
  },
  [47020604] = {
    id = 47020604,
    name = function()
      return T(80406050)
    end,
    des = function()
      return T(80506052, 15)
    end,
    type = 1,
    value = {
      "605:2:2:40000104:1500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020605] = {
    id = 47020605,
    name = function()
      return T(80406020)
    end,
    des = function()
      return T(80506022, 10)
    end,
    type = 1,
    value = {
      "602:2:2:40000103:1000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020701] = {
    id = 47020701,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020702:3002:10000"
    },
    buff_cd = 0
  },
  [47020702] = {
    id = 47020702,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506032, 30)
    end,
    type = 60,
    value = {
      "603:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020801] = {
    id = 47020801,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020802:3002:10000",
      "47020803:3002:10000"
    },
    buff_cd = 0
  },
  [47020802] = {
    id = 47020802,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506031, 30)
    end,
    type = 60,
    value = {
      "603:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020803] = {
    id = 47020803,
    name = function()
      return T(80407090)
    end,
    des = function()
      return T(80507090, 60)
    end,
    type = 70,
    value = {
      "709:1:1:0:-6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "47020804:1002:10000"
    },
    buff_cd = 0
  },
  [47020804] = {
    id = 47020804,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 7)
    end,
    type = 60,
    value = {
      "614:1:1:0:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020901] = {
    id = 47020901,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    deduce_buff_list = {
      "47020902:3002:10000",
      "47020903:3002:10000",
      "47020905:2021:10000",
      "47020906:2021:10000"
    },
    buff_cd = 0
  },
  [47020902] = {
    id = 47020902,
    name = function()
      return T(80406030)
    end,
    des = function()
      return T(80506031, 30)
    end,
    type = 60,
    value = {
      "603:1:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020903] = {
    id = 47020903,
    name = function()
      return T(80407090)
    end,
    des = function()
      return T(80507090, 60)
    end,
    type = 70,
    value = {
      "709:1:1:0:-6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = -1,
    deduce_value = 5,
    deduce_buff_list = {
      "47020904:1002:10000"
    },
    buff_cd = 0
  },
  [47020904] = {
    id = 47020904,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 7)
    end,
    type = 60,
    value = {
      "614:1:1:0:700:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47020905] = {
    id = 47020905,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 7,
    deduce_cnt = -1,
    deduce_buff_list = {
      "47020907:1002:10000"
    },
    buff_cd = 0
  },
  [47020906] = {
    id = 47020906,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 5,
    deduce_cnt = -1,
    deduce_buff_list = {
      "47020907:1002:10000"
    },
    buff_cd = 0
  },
  [47020907] = {
    id = 47020907,
    name = function()
      return T(80406140)
    end,
    des = function()
      return T(80506142, 25)
    end,
    type = 60,
    value = {
      "614:1:1:0:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 1,
    deduce_settled = 0,
    deduce_type = 10,
    deduce_cnt = 1,
    buff_cd = 0
  },
  [47030101] = {
    id = 47030101,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 50, 10)
    end,
    type = 10,
    value = {
      "103:1:34:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [47030102] = {
    id = 47030102,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 60, 10)
    end,
    type = 10,
    value = {
      "103:1:34:0:6000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [47030103] = {
    id = 47030103,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 70, 10)
    end,
    type = 10,
    value = {
      "103:1:34:0:7000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [47030104] = {
    id = 47030104,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 80, 10)
    end,
    type = 10,
    value = {
      "103:1:34:0:8000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [47030105] = {
    id = 47030105,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 90, 10)
    end,
    type = 10,
    value = {
      "103:1:34:0:9000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [47030106] = {
    id = 47030106,
    name = function()
      return T(80401030)
    end,
    des = function()
      return T(80501030, 100, 10)
    end,
    type = 10,
    value = {
      "103:1:34:0:10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    active_forever = 1,
    buff_cd = 0
  },
  [47030107] = {
    id = 47030107,
    type = 1,
    value = {
      "1:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    buff_cd = 0,
    clean_buff_group = {"101:5"}
  },
  [47030201] = {
    id = 47030201,
    type = 60,
    value = {
      "653:1:34:0:7500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47030202] = {
    id = 47030202,
    type = 60,
    value = {
      "653:1:34:0:9000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47030203] = {
    id = 47030203,
    type = 60,
    value = {
      "653:1:34:0:10500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47030204] = {
    id = 47030204,
    type = 60,
    value = {
      "653:1:34:0:12000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47030205] = {
    id = 47030205,
    type = 60,
    value = {
      "653:1:34:0:13500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47030206] = {
    id = 47030206,
    type = 60,
    value = {
      "653:1:34:0:15000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 999,
    buff_cd = 0
  },
  [47030207] = {
    id = 47030207,
    name = function()
      return T(80405380)
    end,
    des = function()
      return T(80505380, 5)
    end,
    type = 1,
    value = {
      "538:0:0:0:0:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0,
    immune_group = {"101:2"}
  },
  [47030401] = {
    id = 47030401,
    type = 1,
    value = {
      "106:2:2:40000101:3000:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "47030402:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1
  },
  [47030402] = {
    id = 47030402,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 100, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-10000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030403] = {
    id = 47030403,
    type = 1,
    value = {
      "106:2:2:40000101:2700:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "47030404:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1
  },
  [47030404] = {
    id = 47030404,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 120, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-12000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030405] = {
    id = 47030405,
    type = 1,
    value = {
      "106:2:2:40000101:2400:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "47030406:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1
  },
  [47030406] = {
    id = 47030406,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 140, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-14000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030407] = {
    id = 47030407,
    type = 1,
    value = {
      "106:2:2:40000101:2100:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "47030408:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1
  },
  [47030408] = {
    id = 47030408,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 160, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-16000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030409] = {
    id = 47030409,
    type = 1,
    value = {
      "106:2:2:40000101:1800:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "47030410:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1
  },
  [47030410] = {
    id = 47030410,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 180, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-18000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030411] = {
    id = 47030411,
    type = 1,
    value = {
      "106:2:2:40000101:1500:1"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 0,
    deduce_cnt = 1,
    settle_buff_list = {
      "47030412:1002:10000"
    },
    active_forever = 1,
    buff_cd = 0,
    not_included_in_statistics = 1
  },
  [47030412] = {
    id = 47030412,
    name = function()
      return T(80406010)
    end,
    des = function()
      return T(80506010, 200, 15)
    end,
    type = 1,
    value = {
      "601:2:1:0:-20000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 15,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030501] = {
    id = 47030501,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 25, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030502] = {
    id = 47030502,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507103, 25, 10)
    end,
    type = 1,
    value = {
      "710:2:1:0:2500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030503] = {
    id = 47030503,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 30, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030504] = {
    id = 47030504,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507103, 30, 10)
    end,
    type = 1,
    value = {
      "710:2:1:0:3000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030505] = {
    id = 47030505,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 35, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-3500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030506] = {
    id = 47030506,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507103, 35, 10)
    end,
    type = 1,
    value = {
      "710:2:1:0:3500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030507] = {
    id = 47030507,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 40, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030508] = {
    id = 47030508,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507103, 40, 10)
    end,
    type = 1,
    value = {
      "710:2:1:0:4000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030509] = {
    id = 47030509,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 45, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-4500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030510] = {
    id = 47030510,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507103, 45, 10)
    end,
    type = 1,
    value = {
      "710:2:1:0:4500:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030511] = {
    id = 47030511,
    name = function()
      return T(80407020)
    end,
    des = function()
      return T(80507020, 50, 5)
    end,
    type = 70,
    value = {
      "702:2:2:40000103:-5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 5,
    deduce_value = 1,
    buff_cd = 0
  },
  [47030512] = {
    id = 47030512,
    name = function()
      return T(80407100)
    end,
    des = function()
      return T(80507103, 50, 10)
    end,
    type = 1,
    value = {
      "710:2:1:0:5000:0"
    },
    trigger_condition = 0,
    trigger_type = 0,
    trigger_value = 0,
    overlay_num = 1,
    settle_type = 0,
    deduce_settled = 0,
    deduce_type = 4,
    deduce_cnt = 10,
    deduce_value = 1,
    buff_cd = 0
  }
}
