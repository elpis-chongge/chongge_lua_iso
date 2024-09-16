BaseSkillLevelUp = {
  [41011000001] = {
    id = 41011000001,
    trigger_limit = {1001},
    trigger_limit_type = {5},
    trigger_limit_value = {100},
    buff_list = {
      "43100001:3002:10000",
      "43100002:3002:10000"
    }
  },
  [41011101001] = {
    id = 41011101001,
    des = function()
      return T(80510001, T(80520017, 35))
    end,
    fashion_show_ids = {
      "12001011:42110100",
      "12001012:42110100"
    },
    damage_rate = 3500
  },
  [41011101002] = {
    id = 41011101002,
    des = function()
      return T(80510001, T(80520017, 40))
    end,
    fashion_show_ids = {
      "12001011:42110100",
      "12001012:42110100"
    },
    damage_rate = 4000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011101003] = {
    id = 41011101003,
    des = function()
      return T(80510001, T(80520017, 45))
    end,
    fashion_show_ids = {
      "12001011:42110100",
      "12001012:42110100"
    },
    damage_rate = 4500,
    cost = {
      "1:21040002:1",
      "1:21020007:1"
    },
    need_quality_level = 1
  },
  [41011101004] = {
    id = 41011101004,
    des = function()
      return T(80510001, T(80520017, 50))
    end,
    fashion_show_ids = {
      "12001011:42110100",
      "12001012:42110100"
    },
    damage_rate = 5000,
    cost = {
      "1:21040003:1",
      "1:21020016:2"
    },
    need_quality_level = 2
  },
  [41012101001] = {
    id = 41012101001,
    des = function()
      return T(80521011, T(80520012, 30), T(80520017, 50), T(80520012, 50), T(80520012, 10), T(80520011, 7))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110101:3001:10000"
    }
  },
  [41012101002] = {
    id = 41012101002,
    des = function()
      return T(80521011, T(80520012, 30), T(80520017, 60), T(80520012, 50), T(80520012, 10), T(80520011, 7))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110105:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012101003] = {
    id = 41012101003,
    des = function()
      return T(80521011, T(80520012, 30), T(80520017, 70), T(80520012, 50), T(80520012, 10), T(80520011, 7))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110109:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020007:1"
    },
    need_quality_level = 2
  },
  [41012101004] = {
    id = 41012101004,
    des = function()
      return T(80521011, T(80520012, 30), T(80520017, 80), T(80520012, 50), T(80520012, 10), T(80520011, 7))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110113:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020016:2"
    },
    need_quality_level = 3
  },
  [41012101005] = {
    id = 41012101005,
    des = function()
      return T(80521011, T(80520012, 30), T(80520017, 90), T(80520012, 50), T(80520012, 10), T(80520011, 7))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110117:3001:10000"
    }
  },
  [41012101006] = {
    id = 41012101006,
    des = function()
      return T(80521011, T(80520012, 30), T(80520017, 100), T(80520012, 50), T(80520012, 10), T(80520011, 7))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110121:3001:10000"
    }
  },
  [41013101001] = {
    id = 41013101001,
    des = function()
      return T(80531011, T(80520017, 400), T(80520017, 150))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001011:42310100",
      "12001012:42310100"
    },
    target_type = 2001,
    damage_rate = 40000,
    buff_list = {
      "43210101:3001:10000"
    },
    tag_id = 105
  },
  [41013101002] = {
    id = 41013101002,
    des = function()
      return T(80531011, T(80520017, 440), T(80520017, 160))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001011:42310100",
      "12001012:42310100"
    },
    target_type = 2001,
    damage_rate = 44000,
    buff_list = {
      "43210102:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013101003] = {
    id = 41013101003,
    des = function()
      return T(80531011, T(80520017, 480), T(80520017, 170))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001011:42310100",
      "12001012:42310100"
    },
    target_type = 2001,
    damage_rate = 48000,
    buff_list = {
      "43210103:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020007:1"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013101004] = {
    id = 41013101004,
    des = function()
      return T(80531011, T(80520017, 520), T(80520017, 180))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001011:42310100",
      "12001012:42310100"
    },
    target_type = 2001,
    damage_rate = 52000,
    buff_list = {
      "43210104:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020016:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013101005] = {
    id = 41013101005,
    des = function()
      return T(80531011, T(80520017, 560), T(80520017, 190))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001011:42310100",
      "12001012:42310100"
    },
    target_type = 2001,
    damage_rate = 56000,
    buff_list = {
      "43210105:3001:10000"
    },
    tag_id = 105
  },
  [41013101006] = {
    id = 41013101006,
    des = function()
      return T(80531011, T(80520017, 600), T(80520017, 200))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001011:42310100",
      "12001012:42310100"
    },
    target_type = 2001,
    damage_rate = 60000,
    buff_list = {
      "43210106:3001:10000"
    },
    tag_id = 105
  },
  [41014101001] = {
    id = 41014101001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015101001] = {
    id = 41015101001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012101:1", "41013101:1"}
  },
  [41016101001] = {
    id = 41016101001,
    des = function()
      return T(80561011, T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43310101:3001:10000"
    },
    association_des = function()
      return T(80561011, T(80520012, 50))
    end
  },
  [41017101001] = {
    id = 41017101001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018101001] = {
    id = 41018101001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012101:2", "41013101:2"}
  },
  [41001101001] = {
    id = 41001101001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001101002] = {
    id = 41001101002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 1
  },
  [41001101003] = {
    id = 41001101003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020027:1"
    },
    need_quality_level = 2
  },
  [41002101001] = {
    id = 41002101001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002101002] = {
    id = 41002101002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 2
  },
  [41002101003] = {
    id = 41002101003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:1",
      "1:21020027:1"
    },
    need_quality_level = 3
  },
  [41003101001] = {
    id = 41003101001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003101002] = {
    id = 41003101002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 3
  },
  [41003101003] = {
    id = 41003101003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:1",
      "1:21020027:1"
    },
    need_quality_level = 3
  },
  [41019101001] = {
    id = 41019101001,
    des = function()
      return T(80591011, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43410101:3002:10000"
    }
  },
  [41011102001] = {
    id = 41011102001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001021:42110200",
      "12001022:42110200"
    },
    damage_rate = 7000
  },
  [41011102002] = {
    id = 41011102002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001021:42110200",
      "12001022:42110200"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011102003] = {
    id = 41011102003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001021:42110200",
      "12001022:42110200"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:1",
      "1:21020006:1"
    },
    need_quality_level = 1
  },
  [41011102004] = {
    id = 41011102004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001021:42110200",
      "12001022:42110200"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:1",
      "1:21020012:2"
    },
    need_quality_level = 2
  },
  [41012102001] = {
    id = 41012102001,
    des = function()
      return T(80521021, T(80520012, 30), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110201:3001:10000"
    }
  },
  [41012102002] = {
    id = 41012102002,
    des = function()
      return T(80521021, T(80520012, 30), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110203:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012102003] = {
    id = 41012102003,
    des = function()
      return T(80521021, T(80520012, 30), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110205:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020006:1"
    },
    need_quality_level = 2
  },
  [41012102004] = {
    id = 41012102004,
    des = function()
      return T(80521021, T(80520012, 30), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110207:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020012:2"
    },
    need_quality_level = 3
  },
  [41012102005] = {
    id = 41012102005,
    des = function()
      return T(80521021, T(80520012, 30), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110209:3001:10000"
    }
  },
  [41012102006] = {
    id = 41012102006,
    des = function()
      return T(80521021, T(80520012, 30), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110211:3001:10000"
    }
  },
  [41013102001] = {
    id = 41013102001,
    des = function()
      return T(80531021, T(80520017, 2000), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001021:42310200",
      "12001022:42310200"
    },
    target_type = 2001,
    damage_rate = 200000,
    buff_list = {
      "43210201:1000:10000",
      "43210202:1000:10000"
    },
    tag_id = 106
  },
  [41013102002] = {
    id = 41013102002,
    des = function()
      return T(80531021, T(80520017, 2100), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001021:42310200",
      "12001022:42310200"
    },
    target_type = 2001,
    damage_rate = 210000,
    buff_list = {
      "43210201:1000:10000",
      "43210202:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 106
  },
  [41013102003] = {
    id = 41013102003,
    des = function()
      return T(80531021, T(80520017, 2200), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001021:42310200",
      "12001022:42310200"
    },
    target_type = 2001,
    damage_rate = 220000,
    buff_list = {
      "43210201:1000:10000",
      "43210202:1000:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020006:1"
    },
    need_quality_level = 3,
    tag_id = 106
  },
  [41013102004] = {
    id = 41013102004,
    des = function()
      return T(80531021, T(80520017, 2300), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001021:42310200",
      "12001022:42310200"
    },
    target_type = 2001,
    damage_rate = 230000,
    buff_list = {
      "43210201:1000:10000",
      "43210202:1000:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020012:2"
    },
    need_quality_level = 3,
    tag_id = 106
  },
  [41013102005] = {
    id = 41013102005,
    des = function()
      return T(80531021, T(80520017, 2400), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001021:42310200",
      "12001022:42310200"
    },
    target_type = 2001,
    damage_rate = 240000,
    buff_list = {
      "43210201:1000:10000",
      "43210202:1000:10000"
    },
    tag_id = 106
  },
  [41013102006] = {
    id = 41013102006,
    des = function()
      return T(80531021, T(80520017, 2500), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001021:42310200",
      "12001022:42310200"
    },
    target_type = 2001,
    damage_rate = 250000,
    buff_list = {
      "43210201:1000:10000",
      "43210202:1000:10000"
    },
    tag_id = 106
  },
  [41014102001] = {
    id = 41014102001,
    des = function()
      return T(80540001, T(80520014, T(80000104)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000104:60"
    }
  },
  [41015102001] = {
    id = 41015102001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012102:1", "41013102:1"}
  },
  [41016102001] = {
    id = 41016102001,
    des = function()
      return T(80561021, T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43310201:3001:10000"
    },
    association_des = function()
      return T(80561021, T(80520011, 2))
    end
  },
  [41017102001] = {
    id = 41017102001,
    des = function()
      return T(80570001, T(80520014, T(80000104)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000104:92"
    }
  },
  [41018102001] = {
    id = 41018102001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012102:2", "41013102:2"}
  },
  [41001102001] = {
    id = 41001102001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001102002] = {
    id = 41001102002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 1
  },
  [41001102003] = {
    id = 41001102003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:1",
      "1:21020026:1"
    },
    need_quality_level = 2
  },
  [41002102001] = {
    id = 41002102001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002102002] = {
    id = 41002102002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 2
  },
  [41002102003] = {
    id = 41002102003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:1",
      "1:21020026:1"
    },
    need_quality_level = 3
  },
  [41003102001] = {
    id = 41003102001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003102002] = {
    id = 41003102002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 3
  },
  [41003102003] = {
    id = 41003102003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:1",
      "1:21020026:1"
    },
    need_quality_level = 3
  },
  [41019102001] = {
    id = 41019102001,
    des = function()
      return T(80591021, T(80520012, 5))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43410201:3002:10000"
    }
  },
  [41011103001] = {
    id = 41011103001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001031:42110300",
      "12001032:42110300"
    },
    damage_rate = 7000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43110302:0:5000",
      "43110306:0:5000",
      "43110310:0:5000",
      "43110314:0:5000",
      "43110318:0:5000",
      "43110322:0:5000",
      "43110303:0:2500",
      "43110307:0:2500",
      "43110311:0:2500",
      "43110315:0:2500",
      "43110319:0:2500",
      "43110323:0:2500"
    }
  },
  [41011103002] = {
    id = 41011103002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001031:42110300",
      "12001032:42110300"
    },
    damage_rate = 8000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43110302:0:5000",
      "43110306:0:5000",
      "43110310:0:5000",
      "43110314:0:5000",
      "43110318:0:5000",
      "43110322:0:5000",
      "43110303:0:2500",
      "43110307:0:2500",
      "43110311:0:2500",
      "43110315:0:2500",
      "43110319:0:2500",
      "43110323:0:2500"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011103003] = {
    id = 41011103003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001031:42110300",
      "12001032:42110300"
    },
    damage_rate = 9000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43110302:0:5000",
      "43110306:0:5000",
      "43110310:0:5000",
      "43110314:0:5000",
      "43110318:0:5000",
      "43110322:0:5000",
      "43110303:0:2500",
      "43110307:0:2500",
      "43110311:0:2500",
      "43110315:0:2500",
      "43110319:0:2500",
      "43110323:0:2500"
    },
    cost = {
      "1:21040002:1",
      "1:21020010:1"
    },
    need_quality_level = 1
  },
  [41011103004] = {
    id = 41011103004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001031:42110300",
      "12001032:42110300"
    },
    damage_rate = 10000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43110302:0:5000",
      "43110306:0:5000",
      "43110310:0:5000",
      "43110314:0:5000",
      "43110318:0:5000",
      "43110322:0:5000",
      "43110303:0:2500",
      "43110307:0:2500",
      "43110311:0:2500",
      "43110315:0:2500",
      "43110319:0:2500",
      "43110323:0:2500"
    },
    cost = {
      "1:21040003:1",
      "1:21020024:2"
    },
    need_quality_level = 2
  },
  [41012103001] = {
    id = 41012103001,
    des = function()
      return T(80521031, T(80520012, 50), T(80520017, 140), T(80520012, 25), T(80520017, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110301:3001:10000"
    }
  },
  [41012103002] = {
    id = 41012103002,
    des = function()
      return T(80521031, T(80520012, 50), T(80520017, 160), T(80520012, 25), T(80520017, 12), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110305:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012103003] = {
    id = 41012103003,
    des = function()
      return T(80521031, T(80520012, 50), T(80520017, 180), T(80520012, 25), T(80520017, 14), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110309:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020010:1"
    },
    need_quality_level = 2
  },
  [41012103004] = {
    id = 41012103004,
    des = function()
      return T(80521031, T(80520012, 50), T(80520017, 200), T(80520012, 25), T(80520017, 16), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110313:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020024:2"
    },
    need_quality_level = 3
  },
  [41012103005] = {
    id = 41012103005,
    des = function()
      return T(80521031, T(80520012, 50), T(80520017, 220), T(80520012, 25), T(80520017, 18), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110317:3001:10000"
    }
  },
  [41012103006] = {
    id = 41012103006,
    des = function()
      return T(80521031, T(80520012, 50), T(80520017, 240), T(80520012, 25), T(80520017, 20), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110321:3001:10000"
    }
  },
  [41013103001] = {
    id = 41013103001,
    des = function()
      return T(80531031, T(80520017, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001031:42310300",
      "12001032:42310300"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43210301:3002:10000:1000301"
    },
    tag_id = 404
  },
  [41013103002] = {
    id = 41013103002,
    des = function()
      return T(80531031, T(80520017, 12))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001031:42310300",
      "12001032:42310300"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43210302:3002:10000:1000301"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 404
  },
  [41013103003] = {
    id = 41013103003,
    des = function()
      return T(80531031, T(80520017, 14))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001031:42310300",
      "12001032:42310300"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43210303:3002:10000:1000301"
    },
    cost = {
      "1:21040002:1",
      "1:21020010:1"
    },
    need_quality_level = 3,
    tag_id = 404
  },
  [41013103004] = {
    id = 41013103004,
    des = function()
      return T(80531031, T(80520017, 16))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001031:42310300",
      "12001032:42310300"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43210304:3002:10000:1000301"
    },
    cost = {
      "1:21040003:1",
      "1:21020024:2"
    },
    need_quality_level = 3,
    tag_id = 404
  },
  [41013103005] = {
    id = 41013103005,
    des = function()
      return T(80531031, T(80520017, 18))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001031:42310300",
      "12001032:42310300"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43210305:3002:10000:1000301"
    },
    tag_id = 404
  },
  [41013103006] = {
    id = 41013103006,
    des = function()
      return T(80531031, T(80520017, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001031:42310300",
      "12001032:42310300"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43210306:3002:10000:1000301"
    },
    tag_id = 404
  },
  [41014103001] = {
    id = 41014103001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015103001] = {
    id = 41015103001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012103:1", "41013103:1"}
  },
  [41016103001] = {
    id = 41016103001,
    des = function()
      return T(80561031, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43310301:3002:10000"
    },
    association_des = function()
      return T(80561031, T(80520012, 10))
    end
  },
  [41017103001] = {
    id = 41017103001,
    des = function()
      return T(80570001, T(80520014, T(80000102)), T(80520011, 961))
    end,
    add_attr = {
      "1:40000102:961"
    }
  },
  [41018103001] = {
    id = 41018103001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012103:2", "41013103:2"}
  },
  [41001103001] = {
    id = 41001103001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001103002] = {
    id = 41001103002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 1
  },
  [41001103003] = {
    id = 41001103003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:1",
      "1:21020030:1"
    },
    need_quality_level = 2
  },
  [41002103001] = {
    id = 41002103001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002103002] = {
    id = 41002103002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 2
  },
  [41002103003] = {
    id = 41002103003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:1",
      "1:21020030:1"
    },
    need_quality_level = 3
  },
  [41003103001] = {
    id = 41003103001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003103002] = {
    id = 41003103002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 3
  },
  [41003103003] = {
    id = 41003103003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:1",
      "1:21020030:1"
    },
    need_quality_level = 3
  },
  [41019103001] = {
    id = 41019103001,
    des = function()
      return T(80591031, T(80520012, 5))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43410301:3002:10000"
    }
  },
  [41011104001] = {
    id = 41011104001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001041:42110400",
      "12001042:42110400"
    },
    damage_rate = 7000,
    buff_list = {
      "43110401:3001:1500",
      "43110403:3001:1800",
      "43110405:3001:2100",
      "43110407:3001:2400",
      "43110409:3001:2700",
      "43110411:3001:3000"
    },
    bullet_speed = 1000
  },
  [41011104002] = {
    id = 41011104002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001041:42110400",
      "12001042:42110400"
    },
    damage_rate = 8000,
    buff_list = {
      "43110401:3001:1500",
      "43110403:3001:1800",
      "43110405:3001:2100",
      "43110407:3001:2400",
      "43110409:3001:2700",
      "43110411:3001:3000"
    },
    bullet_speed = 1000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011104003] = {
    id = 41011104003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001041:42110400",
      "12001042:42110400"
    },
    damage_rate = 9000,
    buff_list = {
      "43110401:3001:1500",
      "43110403:3001:1800",
      "43110405:3001:2100",
      "43110407:3001:2400",
      "43110409:3001:2700",
      "43110411:3001:3000"
    },
    bullet_speed = 1000,
    cost = {
      "1:21040002:1",
      "1:21020029:1"
    },
    need_quality_level = 1
  },
  [41011104004] = {
    id = 41011104004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001041:42110400",
      "12001042:42110400"
    },
    damage_rate = 10000,
    buff_list = {
      "43110401:3001:1500",
      "43110403:3001:1800",
      "43110405:3001:2100",
      "43110407:3001:2400",
      "43110409:3001:2700",
      "43110411:3001:3000"
    },
    bullet_speed = 1000,
    cost = {
      "1:21040003:1",
      "1:21020022:2"
    },
    need_quality_level = 2
  },
  [41012104001] = {
    id = 41012104001,
    des = function()
      return T(80521041, T(80520017, 15), T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43110402:3001:10000"
    }
  },
  [41012104002] = {
    id = 41012104002,
    des = function()
      return T(80521041, T(80520017, 18), T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43110404:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012104003] = {
    id = 41012104003,
    des = function()
      return T(80521041, T(80520017, 21), T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43110406:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020029:1"
    },
    need_quality_level = 2
  },
  [41012104004] = {
    id = 41012104004,
    des = function()
      return T(80521041, T(80520017, 24), T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43110408:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020022:2"
    },
    need_quality_level = 3
  },
  [41012104005] = {
    id = 41012104005,
    des = function()
      return T(80521041, T(80520017, 27), T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43110410:3001:10000"
    },
    add_attr = {" "}
  },
  [41012104006] = {
    id = 41012104006,
    des = function()
      return T(80521041, T(80520017, 30), T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43110412:3001:10000"
    },
    add_attr = {" "}
  },
  [41013104001] = {
    id = 41013104001,
    des = function()
      return T(80531041, T(80520017, 900))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001041:42310400",
      "12001042:42310400"
    },
    target_type = 2001,
    damage_rate = 90000,
    bullet_speed = 1700,
    bullet_buff_list = {
      "43310402:0:10000"
    },
    tag_id = 105
  },
  [41013104002] = {
    id = 41013104002,
    des = function()
      return T(80531041, T(80520017, 1030))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001041:42310400",
      "12001042:42310400"
    },
    target_type = 2001,
    damage_rate = 103000,
    bullet_speed = 1700,
    bullet_buff_list = {
      "43310402:0:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013104003] = {
    id = 41013104003,
    des = function()
      return T(80531041, T(80520017, 1160))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001041:42310400",
      "12001042:42310400"
    },
    target_type = 2001,
    damage_rate = 116000,
    bullet_speed = 1700,
    bullet_buff_list = {
      "43310402:0:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020029:1"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013104004] = {
    id = 41013104004,
    des = function()
      return T(80531041, T(80520017, 1290))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001041:42310400",
      "12001042:42310400"
    },
    target_type = 2001,
    damage_rate = 129000,
    bullet_speed = 1700,
    bullet_buff_list = {
      "43310402:0:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020022:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013104005] = {
    id = 41013104005,
    des = function()
      return T(80531041, T(80520017, 1420))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001041:42310400",
      "12001042:42310400"
    },
    target_type = 2001,
    damage_rate = 142000,
    bullet_speed = 1700,
    bullet_buff_list = {
      "43310402:0:10000"
    },
    tag_id = 105
  },
  [41013104006] = {
    id = 41013104006,
    des = function()
      return T(80531041, T(80520017, 1550))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001041:42310400",
      "12001042:42310400"
    },
    target_type = 2001,
    damage_rate = 155000,
    bullet_speed = 1700,
    bullet_buff_list = {
      "43310402:0:10000"
    },
    tag_id = 105
  },
  [41014104001] = {
    id = 41014104001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015104001] = {
    id = 41015104001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012104:1", "41013104:1"}
  },
  [41016104001] = {
    id = 41016104001,
    des = function()
      return T(80561041, T(80520012, 600))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43310401:3001:10000"
    },
    add_attr = {" "},
    association_des = function()
      return T(80561041, T(80520012, 600))
    end
  },
  [41017104001] = {
    id = 41017104001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018104001] = {
    id = 41018104001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012104:2", "41013104:2"}
  },
  [41001104001] = {
    id = 41001104001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001104002] = {
    id = 41001104002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020004:1"
    },
    need_quality_level = 1
  },
  [41001104003] = {
    id = 41001104003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020009:1"
    },
    need_quality_level = 2
  },
  [41002104001] = {
    id = 41002104001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002104002] = {
    id = 41002104002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:1",
      "1:21020004:1"
    },
    need_quality_level = 2
  },
  [41002104003] = {
    id = 41002104003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:1",
      "1:21020009:1"
    },
    need_quality_level = 3
  },
  [41003104001] = {
    id = 41003104001,
    des = function()
      return T(80520015, T(80000204), 5)
    end,
    add_attr = {
      "1:40000204:500"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003104002] = {
    id = 41003104002,
    des = function()
      return T(80520015, T(80000204), 12)
    end,
    add_attr = {
      "1:40000204:1200"
    },
    cost = {
      "1:21040002:1",
      "1:21020004:1"
    },
    need_quality_level = 3
  },
  [41003104003] = {
    id = 41003104003,
    des = function()
      return T(80520015, T(80000204), 21)
    end,
    add_attr = {
      "1:40000204:2100"
    },
    cost = {
      "1:21040003:1",
      "1:21020009:1"
    },
    need_quality_level = 3
  },
  [41019104001] = {
    id = 41019104001,
    des = function()
      return T(80591041, T(80520012, 10), T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43410401:3002:10000",
      "43410402:3002:10000"
    }
  },
  [41011105001] = {
    id = 41011105001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001051:42110500",
      "12001052:42110500"
    },
    damage_rate = 7000
  },
  [41011105002] = {
    id = 41011105002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001051:42110500",
      "12001052:42110500"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011105003] = {
    id = 41011105003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001051:42110500",
      "12001052:42110500"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 1
  },
  [41011105004] = {
    id = 41011105004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001051:42110500",
      "12001052:42110500"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020011:2"
    },
    need_quality_level = 2
  },
  [41012105001] = {
    id = 41012105001,
    des = function()
      return T(80521051, T(80520018, 5), T(80520018, 25), T(80520011, 4))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43110501:1000:10000"
    }
  },
  [41012105002] = {
    id = 41012105002,
    des = function()
      return T(80521051, T(80520018, 5), T(80520018, 30), T(80520011, 4))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43110502:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012105003] = {
    id = 41012105003,
    des = function()
      return T(80521051, T(80520018, 5), T(80520018, 35), T(80520011, 4))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43110503:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41012105004] = {
    id = 41012105004,
    des = function()
      return T(80521051, T(80520018, 4), T(80520018, 40), T(80520011, 4))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43110504:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020011:2"
    },
    need_quality_level = 3
  },
  [41012105005] = {
    id = 41012105005,
    des = function()
      return T(80521051, T(80520018, 4), T(80520018, 45), T(80520011, 4))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43110505:1000:10000"
    }
  },
  [41012105006] = {
    id = 41012105006,
    des = function()
      return T(80521051, T(80520018, 4), T(80520018, 50), T(80520011, 4))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43110506:1000:10000"
    }
  },
  [41013105001] = {
    id = 41013105001,
    des = function()
      return T(80531051, T(80520017, 700), T(80520017, 8), T(80520018, 500))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001051:42310500",
      "12001052:42310500"
    },
    target_type = 2041,
    damage_rate = 70000,
    buff_list = {
      "43210501:3001:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 415
  },
  [41013105002] = {
    id = 41013105002,
    des = function()
      return T(80531051, T(80520017, 770), T(80520017, 8), T(80520018, 500))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001051:42310500",
      "12001052:42310500"
    },
    target_type = 2041,
    damage_rate = 77000,
    buff_list = {
      "43210502:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 415
  },
  [41013105003] = {
    id = 41013105003,
    des = function()
      return T(80531051, T(80520017, 840), T(80520017, 9), T(80520018, 600))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001051:42310500",
      "12001052:42310500"
    },
    target_type = 2041,
    damage_rate = 84000,
    buff_list = {
      "43210503:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 415
  },
  [41013105004] = {
    id = 41013105004,
    des = function()
      return T(80531051, T(80520017, 910), T(80520017, 9), T(80520018, 600))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001051:42310500",
      "12001052:42310500"
    },
    target_type = 2041,
    damage_rate = 91000,
    buff_list = {
      "43210504:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020011:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 415
  },
  [41013105005] = {
    id = 41013105005,
    des = function()
      return T(80531051, T(80520017, 980), T(80520017, 10), T(80520018, 700))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001051:42310500",
      "12001052:42310500"
    },
    target_type = 2041,
    damage_rate = 98000,
    buff_list = {
      "43210505:3001:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 415
  },
  [41013105006] = {
    id = 41013105006,
    des = function()
      return T(80531051, T(80520017, 1050), T(80520017, 10), T(80520018, 700))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001051:42310500",
      "12001052:42310500"
    },
    target_type = 2041,
    damage_rate = 105000,
    buff_list = {
      "43210506:3001:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 415
  },
  [41014105001] = {
    id = 41014105001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 626))
    end,
    add_attr = {
      "1:40000102:626"
    }
  },
  [41015105001] = {
    id = 41015105001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012105:1", "41013105:1"}
  },
  [41016105001] = {
    id = 41016105001,
    des = function()
      return T(80561051, T(80520012, 8))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43310501:3001:10000"
    },
    association_des = function()
      return T(80561051, T(80520012, 8))
    end
  },
  [41017105001] = {
    id = 41017105001,
    des = function()
      return T(80570001, T(80520014, T(80000102)), T(80520011, 961))
    end,
    add_attr = {
      "1:40000102:961"
    }
  },
  [41018105001] = {
    id = 41018105001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012105:2", "41013105:2"}
  },
  [41001105001] = {
    id = 41001105001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001105002] = {
    id = 41001105002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001105003] = {
    id = 41001105003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41002105001] = {
    id = 41002105001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002105002] = {
    id = 41002105002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002105003] = {
    id = 41002105003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41003105001] = {
    id = 41003105001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003105002] = {
    id = 41003105002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003105003] = {
    id = 41003105003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41019105001] = {
    id = 41019105001,
    des = function()
      return T(80591051, T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43410501:3002:10000"
    }
  },
  [41011107001] = {
    id = 41011107001,
    des = function()
      return T(80511071, T(80520017, 70), T(80520019, 35), T(80520012, 100), T(80520012, 5), T(80520011, 3), T(80520011, 30), T(80520011, 1000))
    end,
    fashion_show_ids = {
      "12001071:42110700",
      "12001072:42110700",
      "12001073:42110702"
    },
    target_type = 2543,
    damage_rate = 7000,
    buff_list = {
      "43010701:3001:10000",
      "43010703:1000:10000"
    },
    range_type = 3,
    range_x = 1000,
    range_y = 30
  },
  [41011107002] = {
    id = 41011107002,
    des = function()
      return T(80511071, T(80520017, 80), T(80520019, 40), T(80520012, 100), T(80520012, 5), T(80520011, 3), T(80520011, 30), T(80520011, 1000))
    end,
    fashion_show_ids = {
      "12001071:42110700",
      "12001072:42110700",
      "12001073:42110702"
    },
    target_type = 2543,
    damage_rate = 8000,
    buff_list = {
      "43010704:3001:10000",
      "43010706:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    range_type = 3,
    range_x = 1000,
    range_y = 30
  },
  [41011107003] = {
    id = 41011107003,
    des = function()
      return T(80511071, T(80520017, 90), T(80520019, 45), T(80520012, 100), T(80520012, 5), T(80520011, 3), T(80520011, 30), T(80520011, 1000))
    end,
    fashion_show_ids = {
      "12001071:42110700",
      "12001072:42110700",
      "12001073:42110702"
    },
    target_type = 2543,
    damage_rate = 9000,
    buff_list = {
      "43010707:3001:10000",
      "43010709:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 1,
    range_type = 3,
    range_x = 1000,
    range_y = 30
  },
  [41011107004] = {
    id = 41011107004,
    des = function()
      return T(80511071, T(80520017, 100), T(80520019, 50), T(80520012, 100), T(80520012, 5), T(80520011, 3), T(80520011, 30), T(80520011, 1000))
    end,
    fashion_show_ids = {
      "12001071:42110700",
      "12001072:42110700",
      "12001073:42110702"
    },
    target_type = 2543,
    damage_rate = 10000,
    buff_list = {
      "43010710:3001:10000",
      "43010712:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020023:2"
    },
    need_quality_level = 2,
    range_type = 3,
    range_x = 1000,
    range_y = 30
  },
  [41012107001] = {
    id = 41012107001,
    des = function()
      return T(80521071, T(80520017, 5), T(80520017, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110701:3001:10000"
    }
  },
  [41012107002] = {
    id = 41012107002,
    des = function()
      return T(80521071, T(80520017, 6), T(80520017, 6), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110704:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012107003] = {
    id = 41012107003,
    des = function()
      return T(80521071, T(80520017, 7), T(80520017, 7), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110707:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 2
  },
  [41012107004] = {
    id = 41012107004,
    des = function()
      return T(80521071, T(80520017, 8), T(80520017, 8), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110710:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020023:2"
    },
    need_quality_level = 3
  },
  [41012107005] = {
    id = 41012107005,
    des = function()
      return T(80521071, T(80520017, 9), T(80520017, 9), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110713:3001:10000"
    }
  },
  [41012107006] = {
    id = 41012107006,
    des = function()
      return T(80521071, T(80520017, 10), T(80520017, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110716:3001:10000"
    }
  },
  [41013107001] = {
    id = 41013107001,
    des = function()
      return T(80531071, T(80520017, 20), T(80520017, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001071:42310700",
      "12001072:42310700",
      "12001073:42310702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43210701:3001:10000",
      "43210702:3001:10000"
    },
    tag_id = 413
  },
  [41013107002] = {
    id = 41013107002,
    des = function()
      return T(80531071, T(80520017, 23), T(80520017, 23))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001071:42310700",
      "12001072:42310700",
      "12001073:42310702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43210703:3001:10000",
      "43210704:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 413
  },
  [41013107003] = {
    id = 41013107003,
    des = function()
      return T(80531071, T(80520017, 26), T(80520017, 26))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001071:42310700",
      "12001072:42310700",
      "12001073:42310702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43210705:3001:10000",
      "43210706:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 3,
    tag_id = 413
  },
  [41013107004] = {
    id = 41013107004,
    des = function()
      return T(80531071, T(80520017, 29), T(80520017, 29))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001071:42310700",
      "12001072:42310700",
      "12001073:42310702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43210707:3001:10000",
      "43210708:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020023:2"
    },
    need_quality_level = 3,
    tag_id = 413
  },
  [41013107005] = {
    id = 41013107005,
    des = function()
      return T(80531071, T(80520017, 32), T(80520017, 32))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001071:42310700",
      "12001072:42310700",
      "12001073:42310702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43210709:3001:10000",
      "43210710:3001:10000"
    },
    tag_id = 413
  },
  [41013107006] = {
    id = 41013107006,
    des = function()
      return T(80531071, T(80520017, 35), T(80520017, 35))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001071:42310700",
      "12001072:42310700",
      "12001073:42310702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43210711:3001:10000",
      "43210712:3001:10000"
    },
    tag_id = 413
  },
  [41014107001] = {
    id = 41014107001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015107001] = {
    id = 41015107001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012107:1", "41013107:1"}
  },
  [41016107001] = {
    id = 41016107001,
    des = function()
      return T(80561071)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43310701:3001:10000"
    }
  },
  [41017107001] = {
    id = 41017107001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018107001] = {
    id = 41018107001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012107:2", "41013107:2"}
  },
  [41001107001] = {
    id = 41001107001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001107002] = {
    id = 41001107002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001107003] = {
    id = 41001107003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41002107001] = {
    id = 41002107001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002107002] = {
    id = 41002107002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002107003] = {
    id = 41002107003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41003107001] = {
    id = 41003107001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003107002] = {
    id = 41003107002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003107003] = {
    id = 41003107003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41019107001] = {
    id = 41019107001,
    des = function()
      return T(80591071, T(80520012, 5), T(80520012, 5))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43410701:3002:10000",
      "43410702:3002:10000"
    }
  },
  [41011108001] = {
    id = 41011108001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001081:42110800",
      "12001082:42110800"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43110801:0:10000",
      "43110805:0:10000",
      "43110809:0:10000",
      "43110813:0:10000",
      "43110817:0:10000",
      "43110821:0:10000"
    }
  },
  [41011108002] = {
    id = 41011108002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001081:42110800",
      "12001082:42110800"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43110801:0:10000",
      "43110805:0:10000",
      "43110809:0:10000",
      "43110813:0:10000",
      "43110817:0:10000",
      "43110821:0:10000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011108003] = {
    id = 41011108003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001081:42110800",
      "12001082:42110800"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43110801:0:10000",
      "43110805:0:10000",
      "43110809:0:10000",
      "43110813:0:10000",
      "43110817:0:10000",
      "43110821:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 1
  },
  [41011108004] = {
    id = 41011108004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001081:42110800",
      "12001082:42110800"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43110801:0:10000",
      "43110805:0:10000",
      "43110809:0:10000",
      "43110813:0:10000",
      "43110817:0:10000",
      "43110821:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020021:2"
    },
    need_quality_level = 2
  },
  [41012108001] = {
    id = 41012108001,
    des = function()
      return T(80521081, T(80520017, 50), T(80520013, "2.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110804:3001:10000"
    }
  },
  [41012108002] = {
    id = 41012108002,
    des = function()
      return T(80521081, T(80520017, 60), T(80520013, "2.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110808:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012108003] = {
    id = 41012108003,
    des = function()
      return T(80521081, T(80520017, 70), T(80520013, "2.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110812:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41012108004] = {
    id = 41012108004,
    des = function()
      return T(80521081, T(80520017, 80), T(80520013, "2.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110816:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020021:2"
    },
    need_quality_level = 3
  },
  [41012108005] = {
    id = 41012108005,
    des = function()
      return T(80521081, T(80520017, 90), T(80520013, "2.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110820:3001:10000"
    }
  },
  [41012108006] = {
    id = 41012108006,
    des = function()
      return T(80521081, T(80520017, 100), T(80520013, "2.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110824:3001:10000"
    }
  },
  [41013108001] = {
    id = 41013108001,
    des = function()
      return T(80531081, T(80520017, 2075))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001081:42310800",
      "12001082:42310800"
    },
    target_type = 2001,
    damage_rate = 207500,
    bullet_speed = 1000,
    tag_id = 105
  },
  [41013108002] = {
    id = 41013108002,
    des = function()
      return T(80531081, T(80520017, 2225))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001081:42310800",
      "12001082:42310800"
    },
    target_type = 2001,
    damage_rate = 222500,
    bullet_speed = 1000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013108003] = {
    id = 41013108003,
    des = function()
      return T(80531081, T(80520017, 2375))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001081:42310800",
      "12001082:42310800"
    },
    target_type = 2001,
    damage_rate = 237500,
    bullet_speed = 1000,
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013108004] = {
    id = 41013108004,
    des = function()
      return T(80531081, T(80520017, 2525))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001081:42310800",
      "12001082:42310800"
    },
    target_type = 2001,
    damage_rate = 252500,
    bullet_speed = 1000,
    cost = {
      "1:21040003:2",
      "1:21020021:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013108005] = {
    id = 41013108005,
    des = function()
      return T(80531081, T(80520017, 2675))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001081:42310800",
      "12001082:42310800"
    },
    target_type = 2001,
    damage_rate = 267500,
    bullet_speed = 1000,
    tag_id = 105
  },
  [41013108006] = {
    id = 41013108006,
    des = function()
      return T(80531081, T(80520017, 2825))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001081:42310800",
      "12001082:42310800"
    },
    target_type = 2001,
    damage_rate = 282500,
    bullet_speed = 1000,
    tag_id = 105
  },
  [41014108001] = {
    id = 41014108001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015108001] = {
    id = 41015108001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012108:1", "41013108:1"}
  },
  [41016108001] = {
    id = 41016108001,
    des = function()
      return T(80561081, T(80520013, "2.5"))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43310801:3001:10000"
    },
    association_des = function()
      return T(80561081, T(80520013, "2.5"))
    end
  },
  [41017108001] = {
    id = 41017108001,
    des = function()
      return T(80570001, T(80520014, T(80000302)), T(80520012, 16))
    end,
    add_attr = {
      "1:40000316:-1600"
    }
  },
  [41018108001] = {
    id = 41018108001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012108:2", "41013108:2"}
  },
  [41001108001] = {
    id = 41001108001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001108002] = {
    id = 41001108002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001108003] = {
    id = 41001108003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41002108001] = {
    id = 41002108001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002108002] = {
    id = 41002108002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002108003] = {
    id = 41002108003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41003108001] = {
    id = 41003108001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003108002] = {
    id = 41003108002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003108003] = {
    id = 41003108003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41019108001] = {
    id = 41019108001,
    des = function()
      return T(80591081, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43410801:3002:10000"
    }
  },
  [41011109001] = {
    id = 41011109001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001091:42110900",
      "12001092:42110900"
    },
    damage_rate = 7000
  },
  [41011109002] = {
    id = 41011109002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001091:42110900",
      "12001092:42110900"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011109003] = {
    id = 41011109003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001091:42110900",
      "12001092:42110900"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 1
  },
  [41011109004] = {
    id = 41011109004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001091:42110900",
      "12001092:42110900"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 2
  },
  [41012109001] = {
    id = 41012109001,
    des = function()
      return T(80521091, T(80520017, 50), T(80520012, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110901:3001:10000"
    }
  },
  [41012109002] = {
    id = 41012109002,
    des = function()
      return T(80521091, T(80520017, 60), T(80520012, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110903:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012109003] = {
    id = 41012109003,
    des = function()
      return T(80521091, T(80520017, 70), T(80520012, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110905:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41012109004] = {
    id = 41012109004,
    des = function()
      return T(80521091, T(80520017, 80), T(80520012, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110907:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 3
  },
  [41012109005] = {
    id = 41012109005,
    des = function()
      return T(80521091, T(80520017, 90), T(80520012, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110909:3001:10000"
    }
  },
  [41012109006] = {
    id = 41012109006,
    des = function()
      return T(80521091, T(80520017, 100), T(80520012, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43110911:3001:10000"
    }
  },
  [41013109001] = {
    id = 41013109001,
    des = function()
      return T(80531091, T(80520017, 2000), T(80520019, "8"), T(80520018, 400))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001091:42310900",
      "12001092:42310900"
    },
    target_type = 2001,
    damage_rate = 200000,
    buff_list = {
      "43210901:3031:10000"
    },
    tag_id = 202
  },
  [41013109002] = {
    id = 41013109002,
    des = function()
      return T(80531091, T(80520017, 2100), T(80520019, "8"), T(80520018, 400))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001091:42310900",
      "12001092:42310900"
    },
    target_type = 2001,
    damage_rate = 210000,
    buff_list = {
      "43210902:3031:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 202
  },
  [41013109003] = {
    id = 41013109003,
    des = function()
      return T(80531091, T(80520017, 2200), T(80520019, "9"), T(80520018, 500))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001091:42310900",
      "12001092:42310900"
    },
    target_type = 2001,
    damage_rate = 220000,
    buff_list = {
      "43210903:3031:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 3,
    tag_id = 202
  },
  [41013109004] = {
    id = 41013109004,
    des = function()
      return T(80531091, T(80520017, 2300), T(80520019, "9"), T(80520018, 500))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001091:42310900",
      "12001092:42310900"
    },
    target_type = 2001,
    damage_rate = 230000,
    buff_list = {
      "43210904:3031:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 3,
    tag_id = 202
  },
  [41013109005] = {
    id = 41013109005,
    des = function()
      return T(80531091, T(80520017, 2400), T(80520019, "10"), T(80520018, 600))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001091:42310900",
      "12001092:42310900"
    },
    target_type = 2001,
    damage_rate = 240000,
    buff_list = {
      "43210905:3031:10000"
    },
    tag_id = 202
  },
  [41013109006] = {
    id = 41013109006,
    des = function()
      return T(80531091, T(80520017, 2500), T(80520019, "10"), T(80520018, 600))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001091:42310900",
      "12001092:42310900"
    },
    target_type = 2001,
    damage_rate = 250000,
    buff_list = {
      "43210906:3031:10000"
    },
    tag_id = 202
  },
  [41014109001] = {
    id = 41014109001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 751))
    end,
    add_attr = {
      "1:40000102:751"
    }
  },
  [41015109001] = {
    id = 41015109001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012109:1", "41013109:1"}
  },
  [41016109001] = {
    id = 41016109001,
    des = function()
      return T(80561091, T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43310901:3002:10000"
    },
    association_des = function()
      return T(80561091, T(80520012, 15))
    end
  },
  [41017109001] = {
    id = 41017109001,
    des = function()
      return T(80570001, T(80520014, T(80000102)), T(80520011, 1153))
    end,
    add_attr = {
      "1:40000102:1153"
    }
  },
  [41018109001] = {
    id = 41018109001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012109:2", "41013109:2"}
  },
  [41001109001] = {
    id = 41001109001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001109002] = {
    id = 41001109002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001109003] = {
    id = 41001109003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41002109001] = {
    id = 41002109001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002109002] = {
    id = 41002109002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002109003] = {
    id = 41002109003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41003109001] = {
    id = 41003109001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003109002] = {
    id = 41003109002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003109003] = {
    id = 41003109003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41019109001] = {
    id = 41019109001,
    des = function()
      return T(80591091, T(80520012, 10), T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43410901:3002:10000",
      "43410902:3002:10000"
    }
  },
  [41011110001] = {
    id = 41011110001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001101:42111000",
      "12001102:42111000"
    },
    damage_rate = 7000
  },
  [41011110002] = {
    id = 41011110002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001101:42111000",
      "12001102:42111000"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011110003] = {
    id = 41011110003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001101:42111000",
      "12001102:42111000"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 1
  },
  [41011110004] = {
    id = 41011110004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001101:42111000",
      "12001102:42111000"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 2
  },
  [41012110001] = {
    id = 41012110001,
    des = function()
      return T(80521101, T(80520017, 50), T(80520017, 15), T(80520011, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111001:3001:10000"
    }
  },
  [41012110002] = {
    id = 41012110002,
    des = function()
      return T(80521101, T(80520017, 56), T(80520017, 18), T(80520011, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111004:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012110003] = {
    id = 41012110003,
    des = function()
      return T(80521101, T(80520017, 62), T(80520017, 21), T(80520011, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111007:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41012110004] = {
    id = 41012110004,
    des = function()
      return T(80521101, T(80520017, 68), T(80520017, 24), T(80520011, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111010:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 3
  },
  [41012110005] = {
    id = 41012110005,
    des = function()
      return T(80521101, T(80520017, 74), T(80520017, 26), T(80520011, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111013:3001:10000"
    }
  },
  [41012110006] = {
    id = 41012110006,
    des = function()
      return T(80521101, T(80520017, 80), T(80520017, 30), T(80520011, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111016:3001:10000"
    }
  },
  [41013110001] = {
    id = 41013110001,
    des = function()
      return T(80531101, T(80520017, 400), T(80520017, 25))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001101:42311000",
      "12001102:42311000"
    },
    target_type = 2041,
    damage_rate = 40000,
    buff_list = {
      "43211001:3001:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 416
  },
  [41013110002] = {
    id = 41013110002,
    des = function()
      return T(80531101, T(80520017, 540), T(80520017, 30))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001101:42311000",
      "12001102:42311000"
    },
    target_type = 2041,
    damage_rate = 54000,
    buff_list = {
      "43211002:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 416
  },
  [41013110003] = {
    id = 41013110003,
    des = function()
      return T(80531101, T(80520017, 680), T(80520017, 35))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001101:42311000",
      "12001102:42311000"
    },
    target_type = 2041,
    damage_rate = 68000,
    buff_list = {
      "43211003:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 416
  },
  [41013110004] = {
    id = 41013110004,
    des = function()
      return T(80531101, T(80520017, 820), T(80520017, 40))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001101:42311000",
      "12001102:42311000"
    },
    target_type = 2041,
    damage_rate = 82000,
    buff_list = {
      "43211004:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 416
  },
  [41013110005] = {
    id = 41013110005,
    des = function()
      return T(80531101, T(80520017, 960), T(80520017, 45))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001101:42311000",
      "12001102:42311000"
    },
    target_type = 2041,
    damage_rate = 96000,
    buff_list = {
      "43211005:3001:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 416
  },
  [41013110006] = {
    id = 41013110006,
    des = function()
      return T(80531101, T(80520017, 1100), T(80520017, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001101:42311000",
      "12001102:42311000"
    },
    target_type = 2041,
    damage_rate = 110000,
    buff_list = {
      "43211006:3001:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 416
  },
  [41014110001] = {
    id = 41014110001,
    des = function()
      return T(80540001, T(80520014, T(80000104)), T(80520011, 72))
    end,
    add_attr = {
      "1:40000104:72"
    }
  },
  [41015110001] = {
    id = 41015110001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012110:1", "41013110:1"}
  },
  [41016110001] = {
    id = 41016110001,
    des = function()
      return T(80561101, T(80520012, 8))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43311001:3001:10000"
    },
    association_des = function()
      return T(80561101, T(80520012, 8))
    end
  },
  [41017110001] = {
    id = 41017110001,
    des = function()
      return T(80570001, T(80520014, T(80000104)), T(80520011, 110))
    end,
    add_attr = {
      "1:40000104:110"
    }
  },
  [41018110001] = {
    id = 41018110001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012110:2", "41013110:2"}
  },
  [41001110001] = {
    id = 41001110001,
    des = function()
      return T(80520016, T(80000104), 44)
    end,
    add_attr = {
      "1:40000104:44"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001110002] = {
    id = 41001110002,
    des = function()
      return T(80520016, T(80000104), 88)
    end,
    add_attr = {
      "1:40000104:88"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001110003] = {
    id = 41001110003,
    des = function()
      return T(80520016, T(80000104), 132)
    end,
    add_attr = {
      "1:40000104:132"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41002110001] = {
    id = 41002110001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002110002] = {
    id = 41002110002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002110003] = {
    id = 41002110003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41003110001] = {
    id = 41003110001,
    des = function()
      return T(80520016, T(80000104), 44)
    end,
    add_attr = {
      "1:40000104:44"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003110002] = {
    id = 41003110002,
    des = function()
      return T(80520016, T(80000104), 88)
    end,
    add_attr = {
      "1:40000104:88"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003110003] = {
    id = 41003110003,
    des = function()
      return T(80520016, T(80000104), 132)
    end,
    add_attr = {
      "1:40000104:132"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41019110001] = {
    id = 41019110001,
    des = function()
      return T(80591101, T(80520012, 10), T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43411001:3002:10000",
      "43411002:3002:10000"
    }
  },
  [41011111001] = {
    id = 41011111001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001111:42111100",
      "12001112:42111100"
    },
    damage_rate = 7000
  },
  [41011111002] = {
    id = 41011111002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001111:42111100",
      "12001112:42111100"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011111003] = {
    id = 41011111003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001111:42111100",
      "12001112:42111100"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 1
  },
  [41011111004] = {
    id = 41011111004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001111:42111100",
      "12001112:42111100"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 2
  },
  [41012111001] = {
    id = 41012111001,
    des = function()
      return T(80521111, T(80520012, 30), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111101:3001:10000"
    }
  },
  [41012111002] = {
    id = 41012111002,
    des = function()
      return T(80521111, T(80520012, 30), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111103:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012111003] = {
    id = 41012111003,
    des = function()
      return T(80521111, T(80520012, 30), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111105:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41012111004] = {
    id = 41012111004,
    des = function()
      return T(80521111, T(80520012, 30), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111107:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 3
  },
  [41012111005] = {
    id = 41012111005,
    des = function()
      return T(80521111, T(80520012, 30), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111109:3001:10000"
    }
  },
  [41012111006] = {
    id = 41012111006,
    des = function()
      return T(80521111, T(80520012, 30), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111111:3001:10000"
    }
  },
  [41013111001] = {
    id = 41013111001,
    des = function()
      return T(80531111, T(80520017, 1680), T(80520017, 10), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001111:42311100",
      "12001112:42311100"
    },
    target_type = 2001,
    damage_rate = 168000,
    buff_list = {
      "43211101:3002:10000"
    },
    tag_id = 417
  },
  [41013111002] = {
    id = 41013111002,
    des = function()
      return T(80531111, T(80520017, 1820), T(80520017, 12), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001111:42311100",
      "12001112:42311100"
    },
    target_type = 2001,
    damage_rate = 182000,
    buff_list = {
      "43211102:3002:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 417
  },
  [41013111003] = {
    id = 41013111003,
    des = function()
      return T(80531111, T(80520017, 1960), T(80520017, 14), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001111:42311100",
      "12001112:42311100"
    },
    target_type = 2001,
    damage_rate = 196000,
    buff_list = {
      "43211103:3002:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 3,
    tag_id = 417
  },
  [41013111004] = {
    id = 41013111004,
    des = function()
      return T(80531111, T(80520017, 2100), T(80520017, 16), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001111:42311100",
      "12001112:42311100"
    },
    target_type = 2001,
    damage_rate = 210000,
    buff_list = {
      "43211104:3002:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 3,
    tag_id = 417
  },
  [41013111005] = {
    id = 41013111005,
    des = function()
      return T(80531111, T(80520017, 2240), T(80520017, 18), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001111:42311100",
      "12001112:42311100"
    },
    target_type = 2001,
    damage_rate = 224000,
    buff_list = {
      "43211105:3002:10000"
    },
    tag_id = 417
  },
  [41013111006] = {
    id = 41013111006,
    des = function()
      return T(80531111, T(80520017, 2380), T(80520017, 20), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001111:42311100",
      "12001112:42311100"
    },
    target_type = 2001,
    damage_rate = 238000,
    buff_list = {
      "43211106:3002:10000"
    },
    tag_id = 417
  },
  [41014111001] = {
    id = 41014111001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015111001] = {
    id = 41015111001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012111:1", "41013111:1"}
  },
  [41016111001] = {
    id = 41016111001,
    des = function()
      return T(80561111, T(80520012, 10), T(80520012, 5), T(80520012, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43311101:3001:10000",
      "43311102:3001:10000",
      "43311103:3001:10000"
    },
    association_des = function()
      return T(80561111, T(80520012, 10), T(80520012, 5), T(80520012, 10))
    end
  },
  [41017111001] = {
    id = 41017111001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018111001] = {
    id = 41018111001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012111:2", "41013111:2"}
  },
  [41001111001] = {
    id = 41001111001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001111002] = {
    id = 41001111002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001111003] = {
    id = 41001111003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41002111001] = {
    id = 41002111001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002111002] = {
    id = 41002111002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002111003] = {
    id = 41002111003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41003111001] = {
    id = 41003111001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003111002] = {
    id = 41003111002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003111003] = {
    id = 41003111003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41019111001] = {
    id = 41019111001,
    des = function()
      return T(80591111, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43411101:3002:10000"
    }
  },
  [41011113001] = {
    id = 41011113001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001131:42111300",
      "12001132:42111300"
    },
    damage_rate = 7000,
    bullet_speed = 800
  },
  [41011113002] = {
    id = 41011113002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001131:42111300",
      "12001132:42111300"
    },
    damage_rate = 8000,
    bullet_speed = 800,
    cost = {
      "1:21040001:1"
    }
  },
  [41011113003] = {
    id = 41011113003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001131:42111300",
      "12001132:42111300"
    },
    damage_rate = 9000,
    bullet_speed = 800,
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 1
  },
  [41011113004] = {
    id = 41011113004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001131:42111300",
      "12001132:42111300"
    },
    damage_rate = 10000,
    bullet_speed = 800,
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 2
  },
  [41012113001] = {
    id = 41012113001,
    des = function()
      return T(80521131, T(80520012, 50), T(80520017, 5), T(80520018, 250), T(80520011, 3), T(80520011, 5))
    end,
    target_type = 3011,
    trigger_condition_1 = {1061},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    trigger_max = 3,
    damage_rate = 0,
    buff_list = {
      "43111301:3011:10000"
    },
    trigger_cd = 150
  },
  [41012113002] = {
    id = 41012113002,
    des = function()
      return T(80521131, T(80520012, 50), T(80520017, 6), T(80520018, 300), T(80520011, 3), T(80520011, 5))
    end,
    target_type = 3011,
    trigger_condition_1 = {1061},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    trigger_max = 3,
    damage_rate = 0,
    buff_list = {
      "43111302:3011:10000"
    },
    trigger_cd = 150,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012113003] = {
    id = 41012113003,
    des = function()
      return T(80521131, T(80520012, 50), T(80520017, 7), T(80520018, 350), T(80520011, 3), T(80520011, 5))
    end,
    target_type = 3011,
    trigger_condition_1 = {1061},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    trigger_max = 3,
    damage_rate = 0,
    buff_list = {
      "43111303:3011:10000"
    },
    trigger_cd = 150,
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41012113004] = {
    id = 41012113004,
    des = function()
      return T(80521131, T(80520012, 50), T(80520017, 8), T(80520018, 400), T(80520011, 3), T(80520011, 5))
    end,
    target_type = 3011,
    trigger_condition_1 = {1061},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    trigger_max = 3,
    damage_rate = 0,
    buff_list = {
      "43111304:3011:10000"
    },
    trigger_cd = 150,
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 3
  },
  [41012113005] = {
    id = 41012113005,
    des = function()
      return T(80521131, T(80520012, 50), T(80520017, 9), T(80520018, 450), T(80520011, 3), T(80520011, 5))
    end,
    target_type = 3011,
    trigger_condition_1 = {1061},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    trigger_max = 3,
    damage_rate = 0,
    buff_list = {
      "43111305:3011:10000"
    },
    trigger_cd = 150
  },
  [41012113006] = {
    id = 41012113006,
    des = function()
      return T(80521131, T(80520012, 50), T(80520017, 10), T(80520018, 500), T(80520011, 3), T(80520011, 5))
    end,
    target_type = 3011,
    trigger_condition_1 = {1061},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    trigger_max = 3,
    damage_rate = 0,
    buff_list = {
      "43111306:3011:10000"
    },
    trigger_cd = 150
  },
  [41013113001] = {
    id = 41013113001,
    des = function()
      return T(80531131, T(80520019, "3.1"), T(80520018, 200), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001131:42311300",
      "12001132:42311300"
    },
    target_type = 3012,
    damage_rate = 0,
    buff_list = {
      "43211301:3012:10000"
    },
    tag_id = 303
  },
  [41013113002] = {
    id = 41013113002,
    des = function()
      return T(80531131, T(80520019, "3.7"), T(80520018, 250), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001131:42311300",
      "12001132:42311300"
    },
    target_type = 3012,
    damage_rate = 0,
    buff_list = {
      "43211302:3012:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 303
  },
  [41013113003] = {
    id = 41013113003,
    des = function()
      return T(80531131, T(80520019, "4.3"), T(80520018, 300), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001131:42311300",
      "12001132:42311300"
    },
    target_type = 3012,
    damage_rate = 0,
    buff_list = {
      "43211303:3012:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 3,
    tag_id = 303
  },
  [41013113004] = {
    id = 41013113004,
    des = function()
      return T(80531131, T(80520019, "4.9"), T(80520018, 350), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001131:42311300",
      "12001132:42311300"
    },
    target_type = 3012,
    damage_rate = 0,
    buff_list = {
      "43211304:3012:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 3,
    tag_id = 303
  },
  [41013113005] = {
    id = 41013113005,
    des = function()
      return T(80531131, T(80520019, "5.5"), T(80520018, 400), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001131:42311300",
      "12001132:42311300"
    },
    target_type = 3012,
    damage_rate = 0,
    buff_list = {
      "43211305:3012:10000"
    },
    tag_id = 303
  },
  [41013113006] = {
    id = 41013113006,
    des = function()
      return T(80531131, T(80520019, "6.2"), T(80520018, 450), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001131:42311300",
      "12001132:42311300"
    },
    target_type = 3012,
    damage_rate = 0,
    buff_list = {
      "43211306:3012:10000"
    },
    tag_id = 303
  },
  [41014113001] = {
    id = 41014113001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 751))
    end,
    add_attr = {
      "1:40000102:751"
    }
  },
  [41015113001] = {
    id = 41015113001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012113:1", "41013113:1"}
  },
  [41016113001] = {
    id = 41016113001,
    des = function()
      return T(80561131, T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43311301:3001:10000"
    },
    association_des = function()
      return T(80561131, T(80520011, 2))
    end
  },
  [41017113001] = {
    id = 41017113001,
    des = function()
      return T(80570001, T(80520014, T(80000104)), T(80520011, 110))
    end,
    add_attr = {
      "1:40000104:110"
    }
  },
  [41018113001] = {
    id = 41018113001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012113:2", "41013113:2"}
  },
  [41001113001] = {
    id = 41001113001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001113002] = {
    id = 41001113002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001113003] = {
    id = 41001113003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 2
  },
  [41002113001] = {
    id = 41002113001,
    des = function()
      return T(80520016, T(80000104), 44)
    end,
    add_attr = {
      "1:40000104:44"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002113002] = {
    id = 41002113002,
    des = function()
      return T(80520016, T(80000104), 88)
    end,
    add_attr = {
      "1:40000104:88"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002113003] = {
    id = 41002113003,
    des = function()
      return T(80520016, T(80000104), 132)
    end,
    add_attr = {
      "1:40000104:132"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 3
  },
  [41003113001] = {
    id = 41003113001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003113002] = {
    id = 41003113002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003113003] = {
    id = 41003113003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 3
  },
  [41019113001] = {
    id = 41019113001,
    des = function()
      return T(80591131, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43411301:3002:10000"
    }
  },
  [41011114001] = {
    id = 41011114001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001141:42111400",
      "12001142:42111400"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43111402:0:1500",
      "43111405:0:2200",
      "43111408:0:2900",
      "43111411:0:3600",
      "43111414:0:4300",
      "43111417:0:5000"
    }
  },
  [41011114002] = {
    id = 41011114002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001141:42111400",
      "12001142:42111400"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43111402:0:1500",
      "43111405:0:2200",
      "43111408:0:2900",
      "43111411:0:3600",
      "43111414:0:4300",
      "43111417:0:5000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011114003] = {
    id = 41011114003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001141:42111400",
      "12001142:42111400"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43111402:0:1500",
      "43111405:0:2200",
      "43111408:0:2900",
      "43111411:0:3600",
      "43111414:0:4300",
      "43111417:0:5000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 1
  },
  [41011114004] = {
    id = 41011114004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001141:42111400",
      "12001142:42111400"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43111402:0:1500",
      "43111405:0:2200",
      "43111408:0:2900",
      "43111411:0:3600",
      "43111414:0:4300",
      "43111417:0:5000"
    },
    cost = {
      "1:21040003:2",
      "1:21020021:3"
    },
    need_quality_level = 2
  },
  [41012114001] = {
    id = 41012114001,
    des = function()
      return T(80521141, T(80520018, 5), T(80520017, 15), T(80520011, 2))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111401:3001:10000"
    }
  },
  [41012114002] = {
    id = 41012114002,
    des = function()
      return T(80521141, T(80520018, 5), T(80520017, 22), T(80520011, 2))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111404:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012114003] = {
    id = 41012114003,
    des = function()
      return T(80521141, T(80520018, 5), T(80520017, 29), T(80520011, 2))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111407:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41012114004] = {
    id = 41012114004,
    des = function()
      return T(80521141, T(80520018, 4), T(80520017, 36), T(80520011, 2))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111410:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020021:3"
    },
    need_quality_level = 3
  },
  [41012114005] = {
    id = 41012114005,
    des = function()
      return T(80521141, T(80520018, 4), T(80520017, 43), T(80520011, 2))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111413:3001:10000"
    }
  },
  [41012114006] = {
    id = 41012114006,
    des = function()
      return T(80521141, T(80520018, 4), T(80520017, 50), T(80520011, 2))
    end,
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111416:3001:10000"
    }
  },
  [41013114001] = {
    id = 41013114001,
    des = function()
      return T(80531141, T(80520017, 1485))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001141:42311400",
      "12001142:42311400"
    },
    target_type = 2082,
    damage_rate = 148500,
    bullet_speed = 1500,
    bullet_buff_list = {
      "43311402:0:10000"
    },
    tag_id = 304
  },
  [41013114002] = {
    id = 41013114002,
    des = function()
      return T(80531141, T(80520017, 1585))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001141:42311400",
      "12001142:42311400"
    },
    target_type = 2082,
    damage_rate = 158500,
    bullet_speed = 1500,
    bullet_buff_list = {
      "43311402:0:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 304
  },
  [41013114003] = {
    id = 41013114003,
    des = function()
      return T(80531141, T(80520017, 1685))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001141:42311400",
      "12001142:42311400"
    },
    target_type = 2082,
    damage_rate = 168500,
    bullet_speed = 1500,
    bullet_buff_list = {
      "43311402:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 3,
    tag_id = 304
  },
  [41013114004] = {
    id = 41013114004,
    des = function()
      return T(80531141, T(80520017, 1785))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001141:42311400",
      "12001142:42311400"
    },
    target_type = 2082,
    damage_rate = 178500,
    bullet_speed = 1500,
    bullet_buff_list = {
      "43311402:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020021:3"
    },
    need_quality_level = 3,
    tag_id = 304
  },
  [41013114005] = {
    id = 41013114005,
    des = function()
      return T(80531141, T(80520017, 1885))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001141:42311400",
      "12001142:42311400"
    },
    target_type = 2082,
    damage_rate = 188500,
    bullet_speed = 1500,
    bullet_buff_list = {
      "43311402:0:10000"
    },
    tag_id = 304
  },
  [41013114006] = {
    id = 41013114006,
    des = function()
      return T(80531141, T(80520017, 1985))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001141:42311400",
      "12001142:42311400"
    },
    target_type = 2082,
    damage_rate = 198500,
    bullet_speed = 1500,
    bullet_buff_list = {
      "43311402:0:10000"
    },
    tag_id = 304
  },
  [41014114001] = {
    id = 41014114001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015114001] = {
    id = 41015114001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012114:1", "41013114:1"}
  },
  [41016114001] = {
    id = 41016114001,
    des = function()
      return T(80561141, T(80520012, 20), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43311401:3001:10000"
    },
    association_des = function()
      return T(80561141, T(80520012, 20), T(80520011, 10))
    end
  },
  [41017114001] = {
    id = 41017114001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018114001] = {
    id = 41018114001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012114:2", "41013114:2"}
  },
  [41001114001] = {
    id = 41001114001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001114002] = {
    id = 41001114002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001114003] = {
    id = 41001114003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41002114001] = {
    id = 41002114001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002114002] = {
    id = 41002114002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002114003] = {
    id = 41002114003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 3
  },
  [41003114001] = {
    id = 41003114001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003114002] = {
    id = 41003114002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003114003] = {
    id = 41003114003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 3
  },
  [41019114001] = {
    id = 41019114001,
    des = function()
      return T(80591141, T(80520012, 15), T(80520012, 30))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43411401:3002:10000",
      "43411402:3002:10000"
    }
  },
  [41011115001] = {
    id = 41011115001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001151:42111500",
      "12001152:42111500"
    },
    damage_rate = 7000
  },
  [41011115002] = {
    id = 41011115002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001151:42111500",
      "12001152:42111500"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011115003] = {
    id = 41011115003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001151:42111500",
      "12001152:42111500"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 1
  },
  [41011115004] = {
    id = 41011115004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001151:42111500",
      "12001152:42111500"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020015:3"
    },
    need_quality_level = 2
  },
  [41012115001] = {
    id = 41012115001,
    des = function()
      return T(80521151, T(80520012, 50), T(80520017, 90), T(80520011, 5), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111501:3001:10000"
    },
    extra_skill = 41010115001
  },
  [41012115002] = {
    id = 41012115002,
    des = function()
      return T(80521151, T(80520012, 50), T(80520017, 100), T(80520011, 5), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111503:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1,
    extra_skill = 41010115002
  },
  [41012115003] = {
    id = 41012115003,
    des = function()
      return T(80521151, T(80520012, 50), T(80520017, 110), T(80520011, 5), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111505:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 2,
    extra_skill = 41010115003
  },
  [41012115004] = {
    id = 41012115004,
    des = function()
      return T(80521151, T(80520012, 50), T(80520017, 120), T(80520011, 5), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111507:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020015:3"
    },
    need_quality_level = 3,
    extra_skill = 41010115004
  },
  [41012115005] = {
    id = 41012115005,
    des = function()
      return T(80521151, T(80520012, 50), T(80520017, 130), T(80520011, 5), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111509:3001:10000"
    },
    extra_skill = 41010115005
  },
  [41012115006] = {
    id = 41012115006,
    des = function()
      return T(80521151, T(80520012, 50), T(80520017, 140), T(80520011, 5), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111511:3001:10000"
    },
    extra_skill = 41010115006
  },
  [41010115001] = {
    id = 41010115001,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111513:2001:10000",
      "43111519:2001:10000"
    }
  },
  [41010115002] = {
    id = 41010115002,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111514:2001:10000",
      "43111520:2001:10000"
    },
    need_quality_level = 1
  },
  [41010115003] = {
    id = 41010115003,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111515:2001:10000",
      "43111521:2001:10000"
    },
    need_quality_level = 2
  },
  [41010115004] = {
    id = 41010115004,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111516:2001:10000",
      "43111522:2001:10000"
    },
    need_quality_level = 3
  },
  [41010115005] = {
    id = 41010115005,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111517:2001:10000",
      "43111523:2001:10000"
    }
  },
  [41010115006] = {
    id = 41010115006,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43111518:2001:10000",
      "43111524:2001:10000"
    }
  },
  [41013115001] = {
    id = 41013115001,
    des = function()
      return T(80531151, T(80520017, 1850), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001151:42311500",
      "12001152:42311500"
    },
    target_type = 2001,
    damage_rate = 185000,
    buff_list = {
      "43211501:1000:10000"
    },
    tag_id = 106
  },
  [41013115002] = {
    id = 41013115002,
    des = function()
      return T(80531151, T(80520017, 1970), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001151:42311500",
      "12001152:42311500"
    },
    target_type = 2001,
    damage_rate = 197000,
    buff_list = {
      "43211502:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 106
  },
  [41013115003] = {
    id = 41013115003,
    des = function()
      return T(80531151, T(80520017, 2090), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001151:42311500",
      "12001152:42311500"
    },
    target_type = 2001,
    damage_rate = 209000,
    buff_list = {
      "43211503:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 3,
    tag_id = 106
  },
  [41013115004] = {
    id = 41013115004,
    des = function()
      return T(80531151, T(80520017, 2210), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001151:42311500",
      "12001152:42311500"
    },
    target_type = 2001,
    damage_rate = 221000,
    buff_list = {
      "43211504:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020015:3"
    },
    need_quality_level = 3,
    tag_id = 106
  },
  [41013115005] = {
    id = 41013115005,
    des = function()
      return T(80531151, T(80520017, 2330), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001151:42311500",
      "12001152:42311500"
    },
    target_type = 2001,
    damage_rate = 233000,
    buff_list = {
      "43211505:1000:10000"
    },
    tag_id = 106
  },
  [41013115006] = {
    id = 41013115006,
    des = function()
      return T(80531151, T(80520017, 2450), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001151:42311500",
      "12001152:42311500"
    },
    target_type = 2001,
    damage_rate = 245000,
    buff_list = {
      "43211506:1000:10000"
    },
    tag_id = 106
  },
  [41014115001] = {
    id = 41014115001,
    des = function()
      return T(80541151, T(80520014, T(80000103)), T(80520011, 40), T(80520012, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43311501:3001:10000"
    },
    add_attr = {
      "1:40000103:40"
    },
    association_des = function()
      return T(80541152, T(80520012, 5))
    end
  },
  [41015115001] = {
    id = 41015115001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012115:1", "41013115:1"}
  },
  [41016115001] = {
    id = 41016115001,
    des = function()
      return T(80561151, T(80520012, 500))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43311502:3001:10000"
    },
    association_des = function()
      return T(80561151, T(80520012, 500))
    end
  },
  [41017115001] = {
    id = 41017115001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018115001] = {
    id = 41018115001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012115:2", "41013115:2"}
  },
  [41001115001] = {
    id = 41001115001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001115002] = {
    id = 41001115002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001115003] = {
    id = 41001115003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41002115001] = {
    id = 41002115001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002115002] = {
    id = 41002115002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002115003] = {
    id = 41002115003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41003115001] = {
    id = 41003115001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003115002] = {
    id = 41003115002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003115003] = {
    id = 41003115003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41019115001] = {
    id = 41019115001,
    des = function()
      return T(80591151, T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43411501:3002:10000"
    }
  },
  [41011116001] = {
    id = 41011116001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001161:42111600",
      "12001162:42111600",
      "12001163:42111602"
    },
    damage_rate = 7000
  },
  [41011116002] = {
    id = 41011116002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001161:42111600",
      "12001162:42111600",
      "12001163:42111602"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011116003] = {
    id = 41011116003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001161:42111600",
      "12001162:42111600",
      "12001163:42111602"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 1
  },
  [41011116004] = {
    id = 41011116004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001161:42111600",
      "12001162:42111600",
      "12001163:42111602"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 2
  },
  [41012116001] = {
    id = 41012116001,
    des = function()
      return T(80521161, T(80520019, "10"))
    end,
    fashion_show_ids = {
      "12001161:42211600",
      "12001162:42211600",
      "12001163:42211602"
    },
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {2},
    trigger_max = 4,
    damage_rate = 0,
    buff_list = {
      "43111601:2051:10000"
    }
  },
  [41012116002] = {
    id = 41012116002,
    des = function()
      return T(80521161, T(80520019, "11.5"))
    end,
    fashion_show_ids = {
      "12001161:42211600",
      "12001162:42211600",
      "12001163:42211602"
    },
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {2},
    trigger_max = 4,
    damage_rate = 0,
    buff_list = {
      "43111602:2051:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012116003] = {
    id = 41012116003,
    des = function()
      return T(80521161, T(80520019, "13"))
    end,
    fashion_show_ids = {
      "12001161:42211600",
      "12001162:42211600",
      "12001163:42211602"
    },
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {2},
    trigger_max = 4,
    damage_rate = 0,
    buff_list = {
      "43111603:2051:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 2
  },
  [41012116004] = {
    id = 41012116004,
    des = function()
      return T(80521161, T(80520019, "14.5"))
    end,
    fashion_show_ids = {
      "12001161:42211600",
      "12001162:42211600",
      "12001163:42211602"
    },
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {2},
    trigger_max = 4,
    damage_rate = 0,
    buff_list = {
      "43111604:2051:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 3
  },
  [41012116005] = {
    id = 41012116005,
    des = function()
      return T(80521161, T(80520019, "16"))
    end,
    fashion_show_ids = {
      "12001161:42211600",
      "12001162:42211600",
      "12001163:42211602"
    },
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {2},
    trigger_max = 4,
    damage_rate = 0,
    buff_list = {
      "43111605:2051:10000"
    }
  },
  [41012116006] = {
    id = 41012116006,
    des = function()
      return T(80521161, T(80520019, "17.5"))
    end,
    fashion_show_ids = {
      "12001161:42211600",
      "12001162:42211600",
      "12001163:42211602"
    },
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {2},
    trigger_max = 4,
    damage_rate = 0,
    buff_list = {
      "43111606:2051:10000"
    }
  },
  [41013116001] = {
    id = 41013116001,
    des = function()
      return T(80531161, T(80520017, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001161:42311600",
      "12001162:42311600",
      "12001163:42311602"
    },
    target_type = 3151,
    damage_rate = 0,
    buff_list = {
      "43211601:1000:10000:1001601:10"
    },
    tag_id = 304
  },
  [41013116002] = {
    id = 41013116002,
    des = function()
      return T(80531161, T(80520017, 60))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001161:42311600",
      "12001162:42311600",
      "12001163:42311602"
    },
    target_type = 3151,
    damage_rate = 0,
    buff_list = {
      "43211604:1000:10000:1001601:10"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 304
  },
  [41013116003] = {
    id = 41013116003,
    des = function()
      return T(80531161, T(80520017, 70))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001161:42311600",
      "12001162:42311600",
      "12001163:42311602"
    },
    target_type = 3151,
    damage_rate = 0,
    buff_list = {
      "43211607:1000:10000:1001601:10"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 3,
    tag_id = 304
  },
  [41013116004] = {
    id = 41013116004,
    des = function()
      return T(80531161, T(80520017, 80))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001161:42311600",
      "12001162:42311600",
      "12001163:42311602"
    },
    target_type = 3151,
    damage_rate = 0,
    buff_list = {
      "43211610:1000:10000:1001601:10"
    },
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 3,
    tag_id = 304
  },
  [41013116005] = {
    id = 41013116005,
    des = function()
      return T(80531161, T(80520017, 90))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001161:42311600",
      "12001162:42311600",
      "12001163:42311602"
    },
    target_type = 3151,
    damage_rate = 0,
    buff_list = {
      "43211613:1000:10000:1001601:10"
    },
    tag_id = 304
  },
  [41013116006] = {
    id = 41013116006,
    des = function()
      return T(80531161, T(80520017, 100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001161:42311600",
      "12001162:42311600",
      "12001163:42311602"
    },
    target_type = 3151,
    damage_rate = 0,
    buff_list = {
      "43211616:1000:10000:1001601:10"
    },
    tag_id = 304
  },
  [41014116001] = {
    id = 41014116001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 80))
    end,
    add_attr = {
      "1:40000103:80"
    }
  },
  [41015116001] = {
    id = 41015116001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012116:1", "41013116:1"}
  },
  [41016116001] = {
    id = 41016116001,
    des = function()
      return T(80561161)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43311601:3001:10000"
    },
    association_des = function()
      return T(80561161)
    end
  },
  [41017116001] = {
    id = 41017116001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018116001] = {
    id = 41018116001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012116:2", "41013116:2"}
  },
  [41001116001] = {
    id = 41001116001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001116002] = {
    id = 41001116002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001116003] = {
    id = 41001116003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41002116001] = {
    id = 41002116001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002116002] = {
    id = 41002116002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002116003] = {
    id = 41002116003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41003116001] = {
    id = 41003116001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003116002] = {
    id = 41003116002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003116003] = {
    id = 41003116003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41019116001] = {
    id = 41019116001,
    des = function()
      return T(80591161, T(80520012, 5), T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43411601:3001:10000",
      "43411603:3002:10000"
    }
  },
  [41011117001] = {
    id = 41011117001,
    des = function()
      return T(80511171, T(80520017, 70), T(80520012, 20), T(80520014, 0.5))
    end,
    fashion_show_ids = {
      "12001171:42111700",
      "12001172:42111700"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43011701:0:10000",
      "43011708:0:10000"
    }
  },
  [41011117002] = {
    id = 41011117002,
    des = function()
      return T(80511171, T(80520017, 80), T(80520012, 20), T(80520014, 0.5))
    end,
    fashion_show_ids = {
      "12001171:42111700",
      "12001172:42111700"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43011701:0:10000",
      "43011708:0:10000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011117003] = {
    id = 41011117003,
    des = function()
      return T(80511171, T(80520017, 90), T(80520012, 20), T(80520014, 0.5))
    end,
    fashion_show_ids = {
      "12001171:42111700",
      "12001172:42111700"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43011701:0:10000",
      "43011708:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 1
  },
  [41011117004] = {
    id = 41011117004,
    des = function()
      return T(80511171, T(80520017, 100), T(80520012, 20), T(80520014, 0.5))
    end,
    fashion_show_ids = {
      "12001171:42111700",
      "12001172:42111700"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43011701:0:10000",
      "43011708:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:3"
    },
    need_quality_level = 2
  },
  [41012117001] = {
    id = 41012117001,
    des = function()
      return T(80521171, T(80520019, "7"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111701:3001:10000"
    }
  },
  [41012117002] = {
    id = 41012117002,
    des = function()
      return T(80521171, T(80520019, "8"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111703:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012117003] = {
    id = 41012117003,
    des = function()
      return T(80521171, T(80520019, "9"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111705:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41012117004] = {
    id = 41012117004,
    des = function()
      return T(80521171, T(80520019, "10"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111707:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:3"
    },
    need_quality_level = 3
  },
  [41012117005] = {
    id = 41012117005,
    des = function()
      return T(80521171, T(80520019, "11"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111709:3001:10000"
    }
  },
  [41012117006] = {
    id = 41012117006,
    des = function()
      return T(80521171, T(80520019, "12"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43111711:3001:10000"
    }
  },
  [41013117001] = {
    id = 41013117001,
    des = function()
      return T(80531171, T(80520017, 150), T(80520012, 30), T(80520012, 10), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001171:42311700",
      "12001172:42311700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43211701:3001:10000:1001701",
      "43211702:3001:10000",
      "43211703:3001:10000",
      "43211704:3001:10000"
    },
    tag_id = 403
  },
  [41013117002] = {
    id = 41013117002,
    des = function()
      return T(80531171, T(80520017, 160), T(80520012, 30), T(80520012, 10), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001171:42311700",
      "12001172:42311700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43211706:3001:10000:1001701",
      "43211702:3001:10000",
      "43211703:3001:10000",
      "43211704:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 403
  },
  [41013117003] = {
    id = 41013117003,
    des = function()
      return T(80531171, T(80520017, 170), T(80520012, 30), T(80520012, 10), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001171:42311700",
      "12001172:42311700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43211707:3001:10000:1001701",
      "43211702:3001:10000",
      "43211703:3001:10000",
      "43211704:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 3,
    tag_id = 403
  },
  [41013117004] = {
    id = 41013117004,
    des = function()
      return T(80531171, T(80520017, 180), T(80520012, 30), T(80520012, 10), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001171:42311700",
      "12001172:42311700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43211708:3001:10000:1001701",
      "43211702:3001:10000",
      "43211703:3001:10000",
      "43211704:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:3"
    },
    need_quality_level = 3,
    tag_id = 403
  },
  [41013117005] = {
    id = 41013117005,
    des = function()
      return T(80531171, T(80520017, 190), T(80520012, 30), T(80520012, 10), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001171:42311700",
      "12001172:42311700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43211709:3001:10000:1001701",
      "43211702:3001:10000",
      "43211703:3001:10000",
      "43211704:3001:10000"
    },
    tag_id = 403
  },
  [41013117006] = {
    id = 41013117006,
    des = function()
      return T(80531171, T(80520017, 200), T(80520012, 30), T(80520012, 10), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001171:42311700",
      "12001172:42311700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43211710:3001:10000:1001701",
      "43211702:3001:10000",
      "43211703:3001:10000",
      "43211704:3001:10000"
    },
    tag_id = 403
  },
  [41014117001] = {
    id = 41014117001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 80))
    end,
    add_attr = {
      "1:40000103:80"
    }
  },
  [41015117001] = {
    id = 41015117001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012117:1", "41013117:1"}
  },
  [41016117001] = {
    id = 41016117001,
    des = function()
      return T(80561171, T(80520012, 20))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43311701:3001:10000"
    },
    association_des = function()
      return T(80561171, T(80520012, 20))
    end
  },
  [41017117001] = {
    id = 41017117001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018117001] = {
    id = 41018117001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012117:2", "41013117:2"}
  },
  [41001117001] = {
    id = 41001117001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001117002] = {
    id = 41001117002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001117003] = {
    id = 41001117003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41002117001] = {
    id = 41002117001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002117002] = {
    id = 41002117002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002117003] = {
    id = 41002117003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 3
  },
  [41003117001] = {
    id = 41003117001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003117002] = {
    id = 41003117002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003117003] = {
    id = 41003117003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 3
  },
  [41019117001] = {
    id = 41019117001,
    des = function()
      return T(80591171, T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43411701:3002:10000"
    }
  },
  [41011118001] = {
    id = 41011118001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001181:42111800",
      "12001182:42111800",
      "12001183:42111802"
    },
    damage_rate = 7000,
    bullet_speed = 800
  },
  [41011118002] = {
    id = 41011118002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001181:42111800",
      "12001182:42111800",
      "12001183:42111802"
    },
    damage_rate = 8000,
    bullet_speed = 800,
    cost = {
      "1:21040001:1"
    }
  },
  [41011118003] = {
    id = 41011118003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001181:42111800",
      "12001182:42111800",
      "12001183:42111802"
    },
    damage_rate = 9000,
    bullet_speed = 800,
    cost = {
      "1:21040002:1",
      "1:21020030:1"
    },
    need_quality_level = 1
  },
  [41011118004] = {
    id = 41011118004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001181:42111800",
      "12001182:42111800",
      "12001183:42111802"
    },
    damage_rate = 10000,
    bullet_speed = 800,
    cost = {
      "1:21040003:1",
      "1:21020023:2"
    },
    need_quality_level = 2
  },
  [41012118001] = {
    id = 41012118001,
    des = function()
      return T(80521181, T(80520011, 3), T(80520019, "3.5"), T(80520018, 300))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43111801:3011:10000"
    }
  },
  [41012118002] = {
    id = 41012118002,
    des = function()
      return T(80521181, T(80520011, 3), T(80520019, "4"), T(80520018, 350))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43111802:3011:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012118003] = {
    id = 41012118003,
    des = function()
      return T(80521181, T(80520011, 3), T(80520019, "4.5"), T(80520018, 400))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43111803:3011:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020030:1"
    },
    need_quality_level = 2
  },
  [41012118004] = {
    id = 41012118004,
    des = function()
      return T(80521181, T(80520011, 3), T(80520019, "5"), T(80520018, 450))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43111804:3011:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020023:2"
    },
    need_quality_level = 3
  },
  [41012118005] = {
    id = 41012118005,
    des = function()
      return T(80521181, T(80520011, 3), T(80520019, "5.5"), T(80520018, 500))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43111805:3011:10000"
    }
  },
  [41012118006] = {
    id = 41012118006,
    des = function()
      return T(80521181, T(80520011, 3), T(80520019, "6"), T(80520018, 550))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43111806:3011:10000"
    }
  },
  [41013118001] = {
    id = 41013118001,
    des = function()
      return T(80531181, T(80520017, 5), T(80520017, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001181:42311800",
      "12001182:42311800",
      "12001183:42311802"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43211801:3002:10000:1001801",
      "43211802:3002:10000:1001801"
    },
    tag_id = 401
  },
  [41013118002] = {
    id = 41013118002,
    des = function()
      return T(80531181, T(80520017, 6), T(80520017, 6))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001181:42311800",
      "12001182:42311800",
      "12001183:42311802"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43211803:3002:10000:1001801",
      "43211804:3002:10000:1001801"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 401
  },
  [41013118003] = {
    id = 41013118003,
    des = function()
      return T(80531181, T(80520017, 7), T(80520017, 7))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001181:42311800",
      "12001182:42311800",
      "12001183:42311802"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43211805:3002:10000:1001801",
      "43211806:3002:10000:1001801"
    },
    cost = {
      "1:21040002:1",
      "1:21020030:1"
    },
    need_quality_level = 3,
    tag_id = 401
  },
  [41013118004] = {
    id = 41013118004,
    des = function()
      return T(80531181, T(80520017, 8), T(80520017, 8))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001181:42311800",
      "12001182:42311800",
      "12001183:42311802"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43211807:3002:10000:1001801",
      "43211808:3002:10000:1001801"
    },
    cost = {
      "1:21040003:1",
      "1:21020023:2"
    },
    need_quality_level = 3,
    tag_id = 401
  },
  [41013118005] = {
    id = 41013118005,
    des = function()
      return T(80531181, T(80520017, 9), T(80520017, 9))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001181:42311800",
      "12001182:42311800",
      "12001183:42311802"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43211809:3002:10000:1001801",
      "43211810:3002:10000:1001801"
    },
    tag_id = 401
  },
  [41013118006] = {
    id = 41013118006,
    des = function()
      return T(80531181, T(80520017, 10), T(80520017, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001181:42311800",
      "12001182:42311800",
      "12001183:42311802"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43211811:3002:10000:1001801",
      "43211812:3002:10000:1001801"
    },
    tag_id = 401
  },
  [41014118001] = {
    id = 41014118001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 626))
    end,
    add_attr = {
      "1:40000102:626"
    }
  },
  [41015118001] = {
    id = 41015118001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012118:1", "41013118:1"}
  },
  [41016118001] = {
    id = 41016118001,
    des = function()
      return T(80561181, T(80520013, "5"), T(80520011, 1000))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43311801:3002:10000:606"
    },
    association_des = function()
      return T(80561181, T(80520013, "5"), T(80520011, 1000))
    end
  },
  [41017118001] = {
    id = 41017118001,
    des = function()
      return T(80570001, T(80520014, T(80000302)), T(80520012, 16))
    end,
    add_attr = {
      "1:40000316:-1600"
    }
  },
  [41018118001] = {
    id = 41018118001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012118:2", "41013118:2"}
  },
  [41001118001] = {
    id = 41001118001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001118002] = {
    id = 41001118002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 1
  },
  [41001118003] = {
    id = 41001118003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:1",
      "1:21020010:1"
    },
    need_quality_level = 2
  },
  [41002118001] = {
    id = 41002118001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002118002] = {
    id = 41002118002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 2
  },
  [41002118003] = {
    id = 41002118003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:1",
      "1:21020010:1"
    },
    need_quality_level = 3
  },
  [41003118001] = {
    id = 41003118001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003118002] = {
    id = 41003118002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 3
  },
  [41003118003] = {
    id = 41003118003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:1",
      "1:21020010:1"
    },
    need_quality_level = 3
  },
  [41019118001] = {
    id = 41019118001,
    des = function()
      return T(80591181, T(80520012, 10), T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43411801:3002:10000",
      "43411802:3002:10000"
    }
  },
  [41011119001] = {
    id = 41011119001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001191:42111900",
      "12001192:42111900"
    },
    damage_rate = 7000
  },
  [41011119002] = {
    id = 41011119002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001191:42111900",
      "12001192:42111900"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011119003] = {
    id = 41011119003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001191:42111900",
      "12001192:42111900"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:1",
      "1:21020026:1"
    },
    need_quality_level = 1
  },
  [41011119004] = {
    id = 41011119004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001191:42111900",
      "12001192:42111900"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:1",
      "1:21020013:2"
    },
    need_quality_level = 2
  },
  [41012119001] = {
    id = 41012119001,
    des = function()
      return T(80521191, T(80520011, 4), T(80520019, "5.5"), T(80520018, 300))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111901:3001:10000"
    }
  },
  [41012119002] = {
    id = 41012119002,
    des = function()
      return T(80521191, T(80520011, 4), T(80520019, "6"), T(80520018, 350))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111902:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012119003] = {
    id = 41012119003,
    des = function()
      return T(80521191, T(80520011, 4), T(80520019, "6.5"), T(80520018, 400))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111903:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020026:1"
    },
    need_quality_level = 2
  },
  [41012119004] = {
    id = 41012119004,
    des = function()
      return T(80521191, T(80520011, 4), T(80520019, "7"), T(80520018, 450))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111904:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020013:2"
    },
    need_quality_level = 3
  },
  [41012119005] = {
    id = 41012119005,
    des = function()
      return T(80521191, T(80520011, 4), T(80520019, "7.5"), T(80520018, 500))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111905:3001:10000"
    }
  },
  [41012119006] = {
    id = 41012119006,
    des = function()
      return T(80521191, T(80520011, 4), T(80520019, "8"), T(80520018, 550))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    damage_rate = 0,
    buff_list = {
      "43111906:3001:10000"
    }
  },
  [41013119001] = {
    id = 41013119001,
    des = function()
      return T(80531191, T(80520017, 1000))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001191:42311900",
      "12001192:42311900"
    },
    target_type = 2001,
    damage_rate = 100000,
    tag_id = 105
  },
  [41013119002] = {
    id = 41013119002,
    des = function()
      return T(80531191, T(80520017, 1050))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001191:42311900",
      "12001192:42311900"
    },
    target_type = 2001,
    damage_rate = 105000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013119003] = {
    id = 41013119003,
    des = function()
      return T(80531191, T(80520017, 1100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001191:42311900",
      "12001192:42311900"
    },
    target_type = 2001,
    damage_rate = 110000,
    cost = {
      "1:21040002:1",
      "1:21020026:1"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013119004] = {
    id = 41013119004,
    des = function()
      return T(80531191, T(80520017, 1150))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001191:42311900",
      "12001192:42311900"
    },
    target_type = 2001,
    damage_rate = 115000,
    cost = {
      "1:21040003:1",
      "1:21020013:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013119005] = {
    id = 41013119005,
    des = function()
      return T(80531191, T(80520017, 1200))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001191:42311900",
      "12001192:42311900"
    },
    target_type = 2001,
    damage_rate = 120000,
    tag_id = 105
  },
  [41013119006] = {
    id = 41013119006,
    des = function()
      return T(80531191, T(80520017, 1250))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001191:42311900",
      "12001192:42311900"
    },
    target_type = 2001,
    damage_rate = 125000,
    tag_id = 105
  },
  [41014119001] = {
    id = 41014119001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 626))
    end,
    add_attr = {
      "1:40000102:626"
    }
  },
  [41015119001] = {
    id = 41015119001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012119:1", "41013119:1"}
  },
  [41016119001] = {
    id = 41016119001,
    des = function()
      return T(80561191, T(80520012, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43311901:3001:10000"
    },
    association_des = function()
      return T(80561191, T(80520012, 10))
    end
  },
  [41017119001] = {
    id = 41017119001,
    des = function()
      return T(80570001, T(80520014, T(80000302)), T(80520012, 16))
    end,
    add_attr = {
      "1:40000316:-1600"
    }
  },
  [41018119001] = {
    id = 41018119001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012119:2", "41013119:2"}
  },
  [41001119001] = {
    id = 41001119001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001119002] = {
    id = 41001119002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 1
  },
  [41001119003] = {
    id = 41001119003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:1",
      "1:21020006:1"
    },
    need_quality_level = 2
  },
  [41002119001] = {
    id = 41002119001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002119002] = {
    id = 41002119002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 2
  },
  [41002119003] = {
    id = 41002119003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020006:1"
    },
    need_quality_level = 3
  },
  [41003119001] = {
    id = 41003119001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003119002] = {
    id = 41003119002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 3
  },
  [41003119003] = {
    id = 41003119003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:1",
      "1:21020006:1"
    },
    need_quality_level = 3
  },
  [41019119001] = {
    id = 41019119001,
    des = function()
      return T(80591191, T(80520012, 3))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43411901:3002:10000"
    }
  },
  [41011120001] = {
    id = 41011120001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001201:42112000",
      "12001202:42112000",
      "12001203:42112002"
    },
    damage_rate = 7000
  },
  [41011120002] = {
    id = 41011120002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001201:42112000",
      "12001202:42112000",
      "12001203:42112002"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011120003] = {
    id = 41011120003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001201:42112000",
      "12001202:42112000",
      "12001203:42112002"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:1",
      "1:21020027:1"
    },
    need_quality_level = 1
  },
  [41011120004] = {
    id = 41011120004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001201:42112000",
      "12001202:42112000",
      "12001203:42112002"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:1",
      "1:21020014:2"
    },
    need_quality_level = 2
  },
  [41012120001] = {
    id = 41012120001,
    des = function()
      return T(80521201, T(80520012, 30), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112001:3001:10000"
    }
  },
  [41012120002] = {
    id = 41012120002,
    des = function()
      return T(80521201, T(80520012, 30), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112003:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012120003] = {
    id = 41012120003,
    des = function()
      return T(80521201, T(80520012, 30), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112005:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020027:1"
    },
    need_quality_level = 2
  },
  [41012120004] = {
    id = 41012120004,
    des = function()
      return T(80521201, T(80520012, 30), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112007:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020014:2"
    },
    need_quality_level = 3
  },
  [41012120005] = {
    id = 41012120005,
    des = function()
      return T(80521201, T(80520012, 30), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112009:3001:10000"
    }
  },
  [41012120006] = {
    id = 41012120006,
    des = function()
      return T(80521201, T(80520012, 30), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112011:3001:10000"
    }
  },
  [41013120001] = {
    id = 41013120001,
    des = function()
      return T(80531201, T(80520017, 1100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001201:42312000",
      "12001202:42312000",
      "12001203:42312002"
    },
    target_type = 2011,
    damage_rate = 110000,
    buff_list = {
      "43312002:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013120002] = {
    id = 41013120002,
    des = function()
      return T(80531201, T(80520017, 1190))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001201:42312000",
      "12001202:42312000",
      "12001203:42312002"
    },
    target_type = 2011,
    damage_rate = 119000,
    buff_list = {
      "43312002:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013120003] = {
    id = 41013120003,
    des = function()
      return T(80531201, T(80520017, 1280))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001201:42312000",
      "12001202:42312000",
      "12001203:42312002"
    },
    target_type = 2011,
    damage_rate = 128000,
    buff_list = {
      "43312002:1000:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020027:1"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013120004] = {
    id = 41013120004,
    des = function()
      return T(80531201, T(80520017, 1370))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001201:42312000",
      "12001202:42312000",
      "12001203:42312002"
    },
    target_type = 2011,
    damage_rate = 137000,
    buff_list = {
      "43312002:1000:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020014:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013120005] = {
    id = 41013120005,
    des = function()
      return T(80531201, T(80520017, 1460))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001201:42312000",
      "12001202:42312000",
      "12001203:42312002"
    },
    target_type = 2011,
    damage_rate = 146000,
    buff_list = {
      "43312002:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013120006] = {
    id = 41013120006,
    des = function()
      return T(80531201, T(80520017, 1550))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001201:42312000",
      "12001202:42312000",
      "12001203:42312002"
    },
    target_type = 2011,
    damage_rate = 155000,
    buff_list = {
      "43312002:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41014120001] = {
    id = 41014120001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015120001] = {
    id = 41015120001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012120:1", "41013120:1"}
  },
  [41016120001] = {
    id = 41016120001,
    des = function()
      return T(80561201, T(80520012, 50), T(80520011, 15))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43312001:3001:10000"
    },
    association_des = function()
      return T(80561201, T(80520012, 50), T(80520011, 15))
    end
  },
  [41017120001] = {
    id = 41017120001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018120001] = {
    id = 41018120001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012120:2", "41013120:2"}
  },
  [41001120001] = {
    id = 41001120001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001120002] = {
    id = 41001120002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 1
  },
  [41001120003] = {
    id = 41001120003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020007:1"
    },
    need_quality_level = 2
  },
  [41002120001] = {
    id = 41002120001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002120002] = {
    id = 41002120002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 2
  },
  [41002120003] = {
    id = 41002120003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:1",
      "1:21020007:1"
    },
    need_quality_level = 3
  },
  [41003120001] = {
    id = 41003120001,
    des = function()
      return T(80520015, T(80000204), 5)
    end,
    add_attr = {
      "1:40000204:500"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003120002] = {
    id = 41003120002,
    des = function()
      return T(80520015, T(80000204), 12)
    end,
    add_attr = {
      "1:40000204:1200"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 3
  },
  [41003120003] = {
    id = 41003120003,
    des = function()
      return T(80520015, T(80000204), 21)
    end,
    add_attr = {
      "1:40000204:2100"
    },
    cost = {
      "1:21040003:1",
      "1:21020007:1"
    },
    need_quality_level = 3
  },
  [41019120001] = {
    id = 41019120001,
    des = function()
      return T(80591201, T(80520012, 30))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43412001:3232:10000"
    }
  },
  [41011121001] = {
    id = 41011121001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001211:42112100",
      "12001212:42112100"
    },
    damage_rate = 7000
  },
  [41011121002] = {
    id = 41011121002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001211:42112100",
      "12001212:42112100"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011121003] = {
    id = 41011121003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001211:42112100",
      "12001212:42112100"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 1
  },
  [41011121004] = {
    id = 41011121004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001211:42112100",
      "12001212:42112100"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020012:2"
    },
    need_quality_level = 2
  },
  [41012121001] = {
    id = 41012121001,
    des = function()
      return T(80521211, T(80520011, 3), T(80520017, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43112101:3001:10000"
    }
  },
  [41012121002] = {
    id = 41012121002,
    des = function()
      return T(80521211, T(80520011, 3), T(80520017, 12), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43112102:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012121003] = {
    id = 41012121003,
    des = function()
      return T(80521211, T(80520011, 3), T(80520017, 14), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43112103:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41012121004] = {
    id = 41012121004,
    des = function()
      return T(80521211, T(80520011, 3), T(80520017, 16), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43112104:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020012:2"
    },
    need_quality_level = 3
  },
  [41012121005] = {
    id = 41012121005,
    des = function()
      return T(80521211, T(80520011, 3), T(80520017, 18), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43112105:3001:10000"
    }
  },
  [41012121006] = {
    id = 41012121006,
    des = function()
      return T(80521211, T(80520011, 3), T(80520017, 20), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43112106:3001:10000"
    }
  },
  [41013121001] = {
    id = 41013121001,
    des = function()
      return T(80531211, T(80520017, 1000), T(80520012, 30), T(80520011, 2))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001211:42312100",
      "12001212:42312100"
    },
    target_type = 2041,
    damage_rate = 100000,
    buff_list = {
      "43212101:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 205
  },
  [41013121002] = {
    id = 41013121002,
    des = function()
      return T(80531211, T(80520017, 1100), T(80520012, 30), T(80520011, 2))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001211:42312100",
      "12001212:42312100"
    },
    target_type = 2041,
    damage_rate = 110000,
    buff_list = {
      "43212101:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 205
  },
  [41013121003] = {
    id = 41013121003,
    des = function()
      return T(80531211, T(80520017, 1200), T(80520012, 30), T(80520011, 2))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001211:42312100",
      "12001212:42312100"
    },
    target_type = 2041,
    damage_rate = 120000,
    buff_list = {
      "43212101:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 205
  },
  [41013121004] = {
    id = 41013121004,
    des = function()
      return T(80531211, T(80520017, 1300), T(80520012, 30), T(80520011, 2))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001211:42312100",
      "12001212:42312100"
    },
    target_type = 2041,
    damage_rate = 130000,
    buff_list = {
      "43212101:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020012:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 205
  },
  [41013121005] = {
    id = 41013121005,
    des = function()
      return T(80531211, T(80520017, 1400), T(80520012, 30), T(80520011, 2))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001211:42312100",
      "12001212:42312100"
    },
    target_type = 2041,
    damage_rate = 140000,
    buff_list = {
      "43212101:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 205
  },
  [41013121006] = {
    id = 41013121006,
    des = function()
      return T(80531211, T(80520017, 1500), T(80520012, 30), T(80520011, 2))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001211:42312100",
      "12001212:42312100"
    },
    target_type = 2041,
    damage_rate = 150000,
    buff_list = {
      "43212101:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 205
  },
  [41014121001] = {
    id = 41014121001,
    des = function()
      return T(80540001, T(80520014, T(80000104)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000104:60"
    }
  },
  [41015121001] = {
    id = 41015121001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012121:1", "41013121:1"}
  },
  [41016121001] = {
    id = 41016121001,
    des = function()
      return T(80561211, T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43312101:3001:10000"
    },
    association_des = function()
      return T(80561211, T(80520011, 2))
    end
  },
  [41017121001] = {
    id = 41017121001,
    des = function()
      return T(80570001, T(80520014, T(80000104)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000104:92"
    }
  },
  [41018121001] = {
    id = 41018121001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012121:2", "41013121:2"}
  },
  [41001121001] = {
    id = 41001121001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001121002] = {
    id = 41001121002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001121003] = {
    id = 41001121003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41002121001] = {
    id = 41002121001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002121002] = {
    id = 41002121002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002121003] = {
    id = 41002121003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41003121001] = {
    id = 41003121001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003121002] = {
    id = 41003121002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003121003] = {
    id = 41003121003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41019121001] = {
    id = 41019121001,
    des = function()
      return T(80591211, T(80520012, 3), T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43412101:3002:10000",
      "43412102:3002:10000"
    }
  },
  [41011122001] = {
    id = 41011122001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001221:42112200",
      "12001222:42112200"
    },
    damage_rate = 7000
  },
  [41011122002] = {
    id = 41011122002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001221:42112200",
      "12001222:42112200"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011122003] = {
    id = 41011122003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001221:42112200",
      "12001222:42112200"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 1
  },
  [41011122004] = {
    id = 41011122004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001221:42112200",
      "12001222:42112200"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020014:2"
    },
    need_quality_level = 2
  },
  [41012122001] = {
    id = 41012122001,
    des = function()
      return T(80521221, T(80520017, 25))
    end,
    fashion_show_ids = {
      "12001221:42212200",
      "12001222:42212200"
    },
    target_type = 3041,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112201:3041:10000:1002201"
    }
  },
  [41012122002] = {
    id = 41012122002,
    des = function()
      return T(80521221, T(80520017, 30))
    end,
    fashion_show_ids = {
      "12001221:42212200",
      "12001222:42212200"
    },
    target_type = 3041,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112202:3041:10000:1002201"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012122003] = {
    id = 41012122003,
    des = function()
      return T(80521221, T(80520017, 35))
    end,
    fashion_show_ids = {
      "12001221:42212200",
      "12001222:42212200"
    },
    target_type = 3041,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112203:3041:10000:1002201"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41012122004] = {
    id = 41012122004,
    des = function()
      return T(80521221, T(80520017, 40))
    end,
    fashion_show_ids = {
      "12001221:42212200",
      "12001222:42212200"
    },
    target_type = 3041,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112204:3041:10000:1002201"
    },
    cost = {
      "1:21040003:2",
      "1:21020014:2"
    },
    need_quality_level = 3
  },
  [41012122005] = {
    id = 41012122005,
    des = function()
      return T(80521221, T(80520017, 45))
    end,
    fashion_show_ids = {
      "12001221:42212200",
      "12001222:42212200"
    },
    target_type = 3041,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112205:3041:10000:1002201"
    }
  },
  [41012122006] = {
    id = 41012122006,
    des = function()
      return T(80521221, T(80520017, 50))
    end,
    fashion_show_ids = {
      "12001221:42212200",
      "12001222:42212200"
    },
    target_type = 3041,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112206:3041:10000:1002201"
    }
  },
  [41013122001] = {
    id = 41013122001,
    des = function()
      return T(80531221, T(80520017, 900))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001221:42312200",
      "12001222:42312200"
    },
    target_type = 2001,
    damage_rate = 90000,
    tag_id = 105
  },
  [41013122002] = {
    id = 41013122002,
    des = function()
      return T(80531221, T(80520017, 1010))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001221:42312200",
      "12001222:42312200"
    },
    target_type = 2001,
    damage_rate = 101000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013122003] = {
    id = 41013122003,
    des = function()
      return T(80531221, T(80520017, 1120))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001221:42312200",
      "12001222:42312200"
    },
    target_type = 2001,
    damage_rate = 112000,
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013122004] = {
    id = 41013122004,
    des = function()
      return T(80531221, T(80520017, 1230))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001221:42312200",
      "12001222:42312200"
    },
    target_type = 2001,
    damage_rate = 123000,
    cost = {
      "1:21040003:2",
      "1:21020014:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013122005] = {
    id = 41013122005,
    des = function()
      return T(80531221, T(80520017, 1340))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001221:42312200",
      "12001222:42312200"
    },
    target_type = 2001,
    damage_rate = 134000,
    tag_id = 105
  },
  [41013122006] = {
    id = 41013122006,
    des = function()
      return T(80531221, T(80520017, 1450))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001221:42312200",
      "12001222:42312200"
    },
    target_type = 2001,
    damage_rate = 145000,
    tag_id = 105
  },
  [41014122001] = {
    id = 41014122001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015122001] = {
    id = 41015122001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012122:1", "41013122:1"}
  },
  [41016122001] = {
    id = 41016122001,
    des = function()
      return T(80561221, T(80520014, T(80000203)), T(80520012, 10))
    end,
    add_attr = {
      "1:40000203:1000"
    },
    association_des = function()
      return T(80561221, T(80520014, T(80000203)), T(80520012, 10))
    end
  },
  [41017122001] = {
    id = 41017122001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018122001] = {
    id = 41018122001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012122:2", "41013122:2"}
  },
  [41001122001] = {
    id = 41001122001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001122002] = {
    id = 41001122002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001122003] = {
    id = 41001122003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41002122001] = {
    id = 41002122001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002122002] = {
    id = 41002122002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002122003] = {
    id = 41002122003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41003122001] = {
    id = 41003122001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003122002] = {
    id = 41003122002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003122003] = {
    id = 41003122003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41019122001] = {
    id = 41019122001,
    des = function()
      return T(80591221, T(80520012, 3))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43412201:3002:10000"
    }
  },
  [41011124001] = {
    id = 41011124001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001241:42112400",
      "12001242:42112400"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43112402:0:3000",
      "43112404:0:3000",
      "43112406:0:3000",
      "43112408:0:3000",
      "43112410:0:3000",
      "43112412:0:3000"
    }
  },
  [41011124002] = {
    id = 41011124002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001241:42112400",
      "12001242:42112400"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43112402:0:3000",
      "43112404:0:3000",
      "43112406:0:3000",
      "43112408:0:3000",
      "43112410:0:3000",
      "43112412:0:3000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011124003] = {
    id = 41011124003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001241:42112400",
      "12001242:42112400"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43112402:0:3000",
      "43112404:0:3000",
      "43112406:0:3000",
      "43112408:0:3000",
      "43112410:0:3000",
      "43112412:0:3000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 1
  },
  [41011124004] = {
    id = 41011124004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001241:42112400",
      "12001242:42112400"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43112402:0:3000",
      "43112404:0:3000",
      "43112406:0:3000",
      "43112408:0:3000",
      "43112410:0:3000",
      "43112412:0:3000"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:2"
    },
    need_quality_level = 2
  },
  [41012124001] = {
    id = 41012124001,
    des = function()
      return T(80521241, T(80520012, 30), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112401:3001:10000"
    }
  },
  [41012124002] = {
    id = 41012124002,
    des = function()
      return T(80521241, T(80520012, 30), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112403:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012124003] = {
    id = 41012124003,
    des = function()
      return T(80521241, T(80520012, 30), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112405:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41012124004] = {
    id = 41012124004,
    des = function()
      return T(80521241, T(80520012, 30), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112407:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:2"
    },
    need_quality_level = 3
  },
  [41012124005] = {
    id = 41012124005,
    des = function()
      return T(80521241, T(80520012, 30), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112409:3001:10000"
    }
  },
  [41012124006] = {
    id = 41012124006,
    des = function()
      return T(80521241, T(80520012, 30), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112411:3001:10000"
    }
  },
  [41013124001] = {
    id = 41013124001,
    des = function()
      return T(80531241, T(80520011, 80), T(80520017, 1100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001241:42312400",
      "12001242:42312400"
    },
    target_type = 2011,
    damage_rate = 110000,
    buff_list = {
      "43312402:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013124002] = {
    id = 41013124002,
    des = function()
      return T(80531241, T(80520011, 80), T(80520017, 1160))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001241:42312400",
      "12001242:42312400"
    },
    target_type = 2011,
    damage_rate = 116000,
    buff_list = {
      "43312402:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013124003] = {
    id = 41013124003,
    des = function()
      return T(80531241, T(80520011, 80), T(80520017, 1220))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001241:42312400",
      "12001242:42312400"
    },
    target_type = 2011,
    damage_rate = 122000,
    buff_list = {
      "43312402:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013124004] = {
    id = 41013124004,
    des = function()
      return T(80531241, T(80520011, 80), T(80520017, 1280))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001241:42312400",
      "12001242:42312400"
    },
    target_type = 2011,
    damage_rate = 128000,
    buff_list = {
      "43312402:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013124005] = {
    id = 41013124005,
    des = function()
      return T(80531241, T(80520011, 80), T(80520017, 1340))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001241:42312400",
      "12001242:42312400"
    },
    target_type = 2011,
    damage_rate = 134000,
    buff_list = {
      "43312402:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013124006] = {
    id = 41013124006,
    des = function()
      return T(80531241, T(80520011, 80), T(80520017, 1400))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001241:42312400",
      "12001242:42312400"
    },
    target_type = 2011,
    damage_rate = 140000,
    buff_list = {
      "43312402:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41014124001] = {
    id = 41014124001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015124001] = {
    id = 41015124001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012124:1", "41013124:1"}
  },
  [41016124001] = {
    id = 41016124001,
    des = function()
      return T(80561241, T(80520012, 20), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43312401:3001:10000"
    },
    association_des = function()
      return T(80561241, T(80520012, 20), T(80520011, 10))
    end
  },
  [41017124001] = {
    id = 41017124001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018124001] = {
    id = 41018124001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012124:2", "41013124:2"}
  },
  [41001124001] = {
    id = 41001124001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001124002] = {
    id = 41001124002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001124003] = {
    id = 41001124003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41002124001] = {
    id = 41002124001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002124002] = {
    id = 41002124002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002124003] = {
    id = 41002124003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 3
  },
  [41003124001] = {
    id = 41003124001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003124002] = {
    id = 41003124002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003124003] = {
    id = 41003124003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 3
  },
  [41019124001] = {
    id = 41019124001,
    des = function()
      return T(80591241, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43412401:3002:10000"
    }
  },
  [41011125001] = {
    id = 41011125001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001251:42112500",
      "12001252:42112500"
    },
    damage_rate = 7000
  },
  [41011125002] = {
    id = 41011125002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001251:42112500",
      "12001252:42112500"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011125003] = {
    id = 41011125003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001251:42112500",
      "12001252:42112500"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 1
  },
  [41011125004] = {
    id = 41011125004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001251:42112500",
      "12001252:42112500"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 2
  },
  [41012125001] = {
    id = 41012125001,
    des = function()
      return T(80521251, T(80520017, 20), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112501:3001:10000"
    }
  },
  [41012125002] = {
    id = 41012125002,
    des = function()
      return T(80521251, T(80520017, 23), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112503:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012125003] = {
    id = 41012125003,
    des = function()
      return T(80521251, T(80520017, 26), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112505:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41012125004] = {
    id = 41012125004,
    des = function()
      return T(80521251, T(80520017, 29), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112507:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 3
  },
  [41012125005] = {
    id = 41012125005,
    des = function()
      return T(80521251, T(80520017, 32), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112509:3001:10000"
    }
  },
  [41012125006] = {
    id = 41012125006,
    des = function()
      return T(80521251, T(80520017, 35), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112511:3001:10000"
    }
  },
  [41013125001] = {
    id = 41013125001,
    des = function()
      return T(80531251, T(80520017, 1000), T(80520017, 3), T(80520018, 100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001251:42312500",
      "12001252:42312500"
    },
    target_type = 2001,
    damage_rate = 100000,
    buff_list = {
      "43212501:3012:10000"
    },
    tag_id = 418
  },
  [41013125002] = {
    id = 41013125002,
    des = function()
      return T(80531251, T(80520017, 1100), T(80520017, 3), T(80520018, 100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001251:42312500",
      "12001252:42312500"
    },
    target_type = 2001,
    damage_rate = 110000,
    buff_list = {
      "43212502:3012:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 418
  },
  [41013125003] = {
    id = 41013125003,
    des = function()
      return T(80531251, T(80520017, 1200), T(80520017, 4), T(80520018, 200))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001251:42312500",
      "12001252:42312500"
    },
    target_type = 2001,
    damage_rate = 120000,
    buff_list = {
      "43212503:3012:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 3,
    tag_id = 418
  },
  [41013125004] = {
    id = 41013125004,
    des = function()
      return T(80531251, T(80520017, 1300), T(80520017, 4), T(80520018, 200))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001251:42312500",
      "12001252:42312500"
    },
    target_type = 2001,
    damage_rate = 130000,
    buff_list = {
      "43212504:3012:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 3,
    tag_id = 418
  },
  [41013125005] = {
    id = 41013125005,
    des = function()
      return T(80531251, T(80520017, 1400), T(80520017, 5), T(80520018, 300))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001251:42312500",
      "12001252:42312500"
    },
    target_type = 2001,
    damage_rate = 140000,
    buff_list = {
      "43212505:3012:10000"
    },
    tag_id = 418
  },
  [41013125006] = {
    id = 41013125006,
    des = function()
      return T(80531251, T(80520017, 1500), T(80520017, 5), T(80520018, 300))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001251:42312500",
      "12001252:42312500"
    },
    target_type = 2001,
    damage_rate = 150000,
    buff_list = {
      "43212506:3012:10000"
    },
    tag_id = 418
  },
  [41014125001] = {
    id = 41014125001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 751))
    end,
    add_attr = {
      "1:40000102:751"
    }
  },
  [41015125001] = {
    id = 41015125001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012125:1", "41013125:1"}
  },
  [41016125001] = {
    id = 41016125001,
    des = function()
      return T(80561251, T(80520012, 8))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43312501:3001:10000"
    },
    association_des = function()
      return T(80561251, T(80520012, 8))
    end
  },
  [41017125001] = {
    id = 41017125001,
    des = function()
      return T(80570001, T(80520014, T(80000102)), T(80520011, 1153))
    end,
    add_attr = {
      "1:40000102:1153"
    }
  },
  [41018125001] = {
    id = 41018125001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012125:2", "41013125:2"}
  },
  [41001125001] = {
    id = 41001125001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001125002] = {
    id = 41001125002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001125003] = {
    id = 41001125003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41002125001] = {
    id = 41002125001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002125002] = {
    id = 41002125002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002125003] = {
    id = 41002125003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41003125001] = {
    id = 41003125001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003125002] = {
    id = 41003125002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003125003] = {
    id = 41003125003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41019125001] = {
    id = 41019125001,
    des = function()
      return T(80591251, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43412501:3002:10000"
    }
  },
  [41011126001] = {
    id = 41011126001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001261:42112600",
      "12001262:42112600"
    },
    damage_rate = 7000
  },
  [41011126002] = {
    id = 41011126002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001261:42112600",
      "12001262:42112600"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011126003] = {
    id = 41011126003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001261:42112600",
      "12001262:42112600"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 1
  },
  [41011126004] = {
    id = 41011126004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001261:42112600",
      "12001262:42112600"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 2
  },
  [41012126001] = {
    id = 41012126001,
    des = function()
      return T(80521261, T(80520017, 40), T(80520018, 2), T(80520018, 5))
    end,
    fashion_show_ids = {
      "12001261:42212600",
      "12001262:42212600"
    },
    target_type = 2052,
    trigger_condition_1 = {1082},
    trigger_type_1 = {5},
    trigger_value_1 = {4000},
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "43112601:1000:10000"
    },
    trigger_cd = 150
  },
  [41012126002] = {
    id = 41012126002,
    des = function()
      return T(80521261, T(80520017, 35), T(80520018, 2), T(80520018, 5))
    end,
    fashion_show_ids = {
      "12001261:42212600",
      "12001262:42212600"
    },
    target_type = 2052,
    trigger_condition_1 = {1082},
    trigger_type_1 = {5},
    trigger_value_1 = {3500},
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "43112602:1000:10000"
    },
    trigger_cd = 150,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012126003] = {
    id = 41012126003,
    des = function()
      return T(80521261, T(80520017, 30), T(80520018, 3), T(80520018, 5))
    end,
    fashion_show_ids = {
      "12001261:42212600",
      "12001262:42212600"
    },
    target_type = 2053,
    trigger_condition_1 = {1082},
    trigger_type_1 = {5},
    trigger_value_1 = {3000},
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "43112603:1000:10000"
    },
    trigger_cd = 150,
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41012126004] = {
    id = 41012126004,
    des = function()
      return T(80521261, T(80520017, 25), T(80520018, 3), T(80520018, 5))
    end,
    fashion_show_ids = {
      "12001261:42212600",
      "12001262:42212600"
    },
    target_type = 2053,
    trigger_condition_1 = {1082},
    trigger_type_1 = {5},
    trigger_value_1 = {2500},
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "43112604:1000:10000"
    },
    trigger_cd = 150,
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 3
  },
  [41012126005] = {
    id = 41012126005,
    des = function()
      return T(80521261, T(80520017, 20), T(80520018, 3), T(80520018, 8))
    end,
    fashion_show_ids = {
      "12001261:42212600",
      "12001262:42212600"
    },
    target_type = 2053,
    trigger_condition_1 = {1082},
    trigger_type_1 = {5},
    trigger_value_1 = {2000},
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "43112605:1000:10000"
    },
    trigger_cd = 150
  },
  [41012126006] = {
    id = 41012126006,
    des = function()
      return T(80521261, T(80520017, 15), T(80520018, 3), T(80520018, 8))
    end,
    fashion_show_ids = {
      "12001261:42212600",
      "12001262:42212600"
    },
    target_type = 2053,
    trigger_condition_1 = {1082},
    trigger_type_1 = {5},
    trigger_value_1 = {1500},
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "43112606:1000:10000"
    },
    trigger_cd = 150
  },
  [41013126001] = {
    id = 41013126001,
    des = function()
      return T(80531261, T(80520017, 15), T(80520011, 5), T(80520019, 7.5), T(80520018, 200))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001261:42312600",
      "12001262:42312600"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212601:3002:10000:1002601",
      "43212602:3002:10000"
    },
    tag_id = 408
  },
  [41013126002] = {
    id = 41013126002,
    des = function()
      return T(80531261, T(80520017, 18), T(80520011, 5), T(80520019, 8), T(80520018, 300))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001261:42312600",
      "12001262:42312600"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212603:3002:10000:1002601",
      "43212604:3002:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 408
  },
  [41013126003] = {
    id = 41013126003,
    des = function()
      return T(80531261, T(80520017, 21), T(80520011, 5), T(80520019, 8.5), T(80520018, 400))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001261:42312600",
      "12001262:42312600"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212605:3002:10000:1002601",
      "43212606:3002:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 3,
    tag_id = 408
  },
  [41013126004] = {
    id = 41013126004,
    des = function()
      return T(80531261, T(80520017, 24), T(80520011, 5), T(80520019, 9), T(80520018, 500))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001261:42312600",
      "12001262:42312600"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212607:3002:10000:1002601",
      "43212608:3002:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 3,
    tag_id = 408
  },
  [41013126005] = {
    id = 41013126005,
    des = function()
      return T(80531261, T(80520017, 27), T(80520011, 5), T(80520019, 9.5), T(80520018, 600))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001261:42312600",
      "12001262:42312600"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212609:3002:10000:1002601",
      "43212610:3002:10000"
    },
    tag_id = 408
  },
  [41013126006] = {
    id = 41013126006,
    des = function()
      return T(80531261, T(80520017, 30), T(80520011, 5), T(80520019, 10), T(80520018, 700))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001261:42312600",
      "12001262:42312600"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212611:3002:10000:1002601",
      "43212612:3002:10000"
    },
    tag_id = 408
  },
  [41014126001] = {
    id = 41014126001,
    des = function()
      return T(80540001, T(80520014, T(80000104)), T(80520011, 72))
    end,
    add_attr = {
      "1:40000104:72"
    }
  },
  [41015126001] = {
    id = 41015126001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012126:1", "41013126:1"}
  },
  [41016126001] = {
    id = 41016126001,
    des = function()
      return T(80561261, T(80520011, 1))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43312601:3001:10000"
    },
    association_des = function()
      return T(80561261, T(80520011, 1))
    end
  },
  [41017126001] = {
    id = 41017126001,
    des = function()
      return T(80570001, T(80520014, T(80000104)), T(80520011, 110))
    end,
    add_attr = {
      "1:40000104:110"
    }
  },
  [41018126001] = {
    id = 41018126001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012126:2", "41013126:2"}
  },
  [41001126001] = {
    id = 41001126001,
    des = function()
      return T(80520016, T(80000104), 44)
    end,
    add_attr = {
      "1:40000104:44"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001126002] = {
    id = 41001126002,
    des = function()
      return T(80520016, T(80000104), 88)
    end,
    add_attr = {
      "1:40000104:88"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001126003] = {
    id = 41001126003,
    des = function()
      return T(80520016, T(80000104), 132)
    end,
    add_attr = {
      "1:40000104:132"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41002126001] = {
    id = 41002126001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002126002] = {
    id = 41002126002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002126003] = {
    id = 41002126003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41003126001] = {
    id = 41003126001,
    des = function()
      return T(80520016, T(80000104), 44)
    end,
    add_attr = {
      "1:40000104:44"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003126002] = {
    id = 41003126002,
    des = function()
      return T(80520016, T(80000104), 88)
    end,
    add_attr = {
      "1:40000104:88"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003126003] = {
    id = 41003126003,
    des = function()
      return T(80520016, T(80000104), 132)
    end,
    add_attr = {
      "1:40000104:132"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41019126001] = {
    id = 41019126001,
    des = function()
      return T(80591261, T(80520012, 5))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43412601:3002:10000"
    }
  },
  [41011127001] = {
    id = 41011127001,
    des = function()
      return T(80511271, T(80520017, 70), T(80520012, 100), T(80520012, 5), T(80520011, 4))
    end,
    fashion_show_ids = {
      "12001271:42112700",
      "12001272:42112700",
      "12001273:42112702"
    },
    damage_rate = 7000,
    buff_list = {
      "43012701:2001:10000"
    }
  },
  [41011127002] = {
    id = 41011127002,
    des = function()
      return T(80511271, T(80520017, 80), T(80520012, 100), T(80520012, 5), T(80520011, 4))
    end,
    fashion_show_ids = {
      "12001271:42112700",
      "12001272:42112700",
      "12001273:42112702"
    },
    damage_rate = 8000,
    buff_list = {
      "43012702:2001:10000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011127003] = {
    id = 41011127003,
    des = function()
      return T(80511271, T(80520017, 90), T(80520012, 100), T(80520012, 5), T(80520011, 4))
    end,
    fashion_show_ids = {
      "12001271:42112700",
      "12001272:42112700",
      "12001273:42112702"
    },
    damage_rate = 9000,
    buff_list = {
      "43012703:2001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 1
  },
  [41011127004] = {
    id = 41011127004,
    des = function()
      return T(80511271, T(80520017, 100), T(80520012, 100), T(80520012, 5), T(80520011, 4))
    end,
    fashion_show_ids = {
      "12001271:42112700",
      "12001272:42112700",
      "12001273:42112702"
    },
    damage_rate = 10000,
    buff_list = {
      "43012704:2001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020015:3"
    },
    need_quality_level = 2
  },
  [41012127001] = {
    id = 41012127001,
    des = function()
      return T(80521271, T(80520019, "9.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112701:3001:10000"
    }
  },
  [41012127002] = {
    id = 41012127002,
    des = function()
      return T(80521271, T(80520019, "10"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112703:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012127003] = {
    id = 41012127003,
    des = function()
      return T(80521271, T(80520019, "10.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112705:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41012127004] = {
    id = 41012127004,
    des = function()
      return T(80521271, T(80520019, "11"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112707:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020015:3"
    },
    need_quality_level = 3
  },
  [41012127005] = {
    id = 41012127005,
    des = function()
      return T(80521271, T(80520019, "11.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112709:3001:10000"
    }
  },
  [41012127006] = {
    id = 41012127006,
    des = function()
      return T(80521271, T(80520019, "12"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112711:3001:10000"
    }
  },
  [41013127001] = {
    id = 41013127001,
    des = function()
      return T(80531271, T(80520017, 100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001271:42312700",
      "12001272:42312700",
      "12001273:42312702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212701:3001:10000",
      "43212707:3001:10000"
    },
    tag_id = 403
  },
  [41013127002] = {
    id = 41013127002,
    des = function()
      return T(80531271, T(80520017, 110))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001271:42312700",
      "12001272:42312700",
      "12001273:42312702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212702:3001:10000",
      "43212707:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 403
  },
  [41013127003] = {
    id = 41013127003,
    des = function()
      return T(80531271, T(80520017, 120))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001271:42312700",
      "12001272:42312700",
      "12001273:42312702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212703:3001:10000",
      "43212707:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 3,
    tag_id = 403
  },
  [41013127004] = {
    id = 41013127004,
    des = function()
      return T(80531271, T(80520017, 130))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001271:42312700",
      "12001272:42312700",
      "12001273:42312702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212704:3001:10000",
      "43212707:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020015:3"
    },
    need_quality_level = 3,
    tag_id = 403
  },
  [41013127005] = {
    id = 41013127005,
    des = function()
      return T(80531271, T(80520017, 140))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001271:42312700",
      "12001272:42312700",
      "12001273:42312702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212705:3001:10000",
      "43212707:3001:10000"
    },
    tag_id = 403
  },
  [41013127006] = {
    id = 41013127006,
    des = function()
      return T(80531271, T(80520017, 150))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001271:42312700",
      "12001272:42312700",
      "12001273:42312702"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43212706:3001:10000",
      "43212707:3001:10000"
    },
    tag_id = 403
  },
  [41014127001] = {
    id = 41014127001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015127001] = {
    id = 41015127001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012127:1", "41013127:1"}
  },
  [41016127001] = {
    id = 41016127001,
    des = function()
      return T(80561271, T(80520014, "1.6"), T(80520012, 20))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43312701:3001:10000"
    },
    association_des = function()
      return T(80561271, T(80520014, "1.6"), T(80520012, 20))
    end
  },
  [41017127001] = {
    id = 41017127001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018127001] = {
    id = 41018127001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012127:2", "41013127:2"}
  },
  [41001127001] = {
    id = 41001127001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001127002] = {
    id = 41001127002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001127003] = {
    id = 41001127003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41002127001] = {
    id = 41002127001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002127002] = {
    id = 41002127002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002127003] = {
    id = 41002127003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41003127001] = {
    id = 41003127001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003127002] = {
    id = 41003127002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003127003] = {
    id = 41003127003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41019127001] = {
    id = 41019127001,
    des = function()
      return T(80591271, T(80520012, 10), T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43412701:3002:10000",
      "43412702:3002:10000"
    }
  },
  [41011129001] = {
    id = 41011129001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001291:42112900",
      "12001292:42112900"
    },
    damage_rate = 7000
  },
  [41011129002] = {
    id = 41011129002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001291:42112900",
      "12001292:42112900"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011129003] = {
    id = 41011129003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001291:42112900",
      "12001292:42112900"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 1
  },
  [41011129004] = {
    id = 41011129004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001291:42112900",
      "12001292:42112900"
    },
    damage_rate = 10000,
    add_attr = {" "},
    cost = {
      "1:21040003:2",
      "1:21020024:3"
    },
    need_quality_level = 2
  },
  [41012129001] = {
    id = 41012129001,
    des = function()
      return T(80521291, T(80520012, 30), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112901:3001:10000"
    }
  },
  [41012129002] = {
    id = 41012129002,
    des = function()
      return T(80521291, T(80520012, 30), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112903:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012129003] = {
    id = 41012129003,
    des = function()
      return T(80521291, T(80520012, 30), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112905:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 2
  },
  [41012129004] = {
    id = 41012129004,
    des = function()
      return T(80521291, T(80520012, 30), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112907:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020024:3"
    },
    need_quality_level = 3
  },
  [41012129005] = {
    id = 41012129005,
    des = function()
      return T(80521291, T(80520012, 30), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112909:3001:10000"
    }
  },
  [41012129006] = {
    id = 41012129006,
    des = function()
      return T(80521291, T(80520012, 30), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43112911:3001:10000"
    }
  },
  [41013129001] = {
    id = 41013129001,
    des = function()
      return T(80531291, T(80520017, 1630))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001291:42312900",
      "12001292:42312900"
    },
    target_type = 2071,
    damage_rate = 163000,
    effect_change_target_type = 525,
    tag_id = 410
  },
  [41013129002] = {
    id = 41013129002,
    des = function()
      return T(80531291, T(80520017, 1730))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001291:42312900",
      "12001292:42312900"
    },
    target_type = 2071,
    damage_rate = 173000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    effect_change_target_type = 525,
    tag_id = 410
  },
  [41013129003] = {
    id = 41013129003,
    des = function()
      return T(80531291, T(80520017, 1830))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001291:42312900",
      "12001292:42312900"
    },
    target_type = 2071,
    damage_rate = 183000,
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 3,
    effect_change_target_type = 525,
    tag_id = 410
  },
  [41013129004] = {
    id = 41013129004,
    des = function()
      return T(80531291, T(80520017, 1930))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001291:42312900",
      "12001292:42312900"
    },
    target_type = 2071,
    damage_rate = 193000,
    cost = {
      "1:21040003:2",
      "1:21020024:3"
    },
    need_quality_level = 3,
    effect_change_target_type = 525,
    tag_id = 410
  },
  [41013129005] = {
    id = 41013129005,
    des = function()
      return T(80531291, T(80520017, 2030))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001291:42312900",
      "12001292:42312900"
    },
    target_type = 2071,
    damage_rate = 203000,
    effect_change_target_type = 525,
    tag_id = 410
  },
  [41013129006] = {
    id = 41013129006,
    des = function()
      return T(80531291, T(80520017, 2130))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001291:42312900",
      "12001292:42312900"
    },
    target_type = 2071,
    damage_rate = 213000,
    effect_change_target_type = 525,
    tag_id = 410
  },
  [41014129001] = {
    id = 41014129001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015129001] = {
    id = 41015129001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012129:1", "41013129:1"}
  },
  [41016129001] = {
    id = 41016129001,
    des = function()
      return T(80561291, T(80520011, 1))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43312901:3001:10000"
    },
    association_des = function()
      return T(80561291, T(80520011, 1))
    end
  },
  [41017129001] = {
    id = 41017129001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018129001] = {
    id = 41018129001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012129:2", "41013129:2"}
  },
  [41001129001] = {
    id = 41001129001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001129002] = {
    id = 41001129002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001129003] = {
    id = 41001129003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41002129001] = {
    id = 41002129001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002129002] = {
    id = 41002129002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002129003] = {
    id = 41002129003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41003129001] = {
    id = 41003129001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003129002] = {
    id = 41003129002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003129003] = {
    id = 41003129003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41019129001] = {
    id = 41019129001,
    des = function()
      return T(80591291, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43412901:3002:10000"
    }
  },
  [41011130001] = {
    id = 41011130001,
    des = function()
      return T(80511301, T(80520017, 45))
    end,
    fashion_show_ids = {
      "12001301:42113000",
      "12001302:42113000"
    },
    target_type = 2363,
    damage_rate = 4500,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43313002:0:10000"
    }
  },
  [41011130002] = {
    id = 41011130002,
    des = function()
      return T(80511301, T(80520017, 50))
    end,
    fashion_show_ids = {
      "12001301:42113000",
      "12001302:42113000"
    },
    target_type = 2363,
    damage_rate = 5000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43313002:0:10000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011130003] = {
    id = 41011130003,
    des = function()
      return T(80511301, T(80520017, 55))
    end,
    fashion_show_ids = {
      "12001301:42113000",
      "12001302:42113000"
    },
    target_type = 2363,
    damage_rate = 5500,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43313002:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 1
  },
  [41011130004] = {
    id = 41011130004,
    des = function()
      return T(80511301, T(80520017, 60))
    end,
    fashion_show_ids = {
      "12001301:42113000",
      "12001302:42113000"
    },
    target_type = 2363,
    damage_rate = 6000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43313002:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:3"
    },
    need_quality_level = 2
  },
  [41012130001] = {
    id = 41012130001,
    des = function()
      return T(80521301, T(80520017, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113001:3001:10000:1003001"
    }
  },
  [41012130002] = {
    id = 41012130002,
    des = function()
      return T(80521301, T(80520017, 6), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113003:3001:10000:1003001"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012130003] = {
    id = 41012130003,
    des = function()
      return T(80521301, T(80520017, 7), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113005:3001:10000:1003001"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41012130004] = {
    id = 41012130004,
    des = function()
      return T(80521301, T(80520017, 8), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113007:3001:10000:1003001"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:3"
    },
    need_quality_level = 3
  },
  [41012130005] = {
    id = 41012130005,
    des = function()
      return T(80521301, T(80520017, 9), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113009:3001:10000:1003001"
    }
  },
  [41012130006] = {
    id = 41012130006,
    des = function()
      return T(80521301, T(80520017, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113011:3001:10000:1003001"
    }
  },
  [41013130001] = {
    id = 41013130001,
    des = function()
      return T(80531301, T(80520017, 100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001301:42313000",
      "12001302:42313000"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213001:3001:10000"
    },
    tag_id = 402
  },
  [41013130002] = {
    id = 41013130002,
    des = function()
      return T(80531301, T(80520017, 110))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001301:42313000",
      "12001302:42313000"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213002:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 402
  },
  [41013130003] = {
    id = 41013130003,
    des = function()
      return T(80531301, T(80520017, 120))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001301:42313000",
      "12001302:42313000"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213003:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 3,
    tag_id = 402
  },
  [41013130004] = {
    id = 41013130004,
    des = function()
      return T(80531301, T(80520017, 130))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001301:42313000",
      "12001302:42313000"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213004:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:3"
    },
    need_quality_level = 3,
    tag_id = 402
  },
  [41013130005] = {
    id = 41013130005,
    des = function()
      return T(80531301, T(80520017, 140))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001301:42313000",
      "12001302:42313000"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213005:3001:10000"
    },
    tag_id = 402
  },
  [41013130006] = {
    id = 41013130006,
    des = function()
      return T(80531301, T(80520017, 150))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001301:42313000",
      "12001302:42313000"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213006:3001:10000"
    },
    tag_id = 402
  },
  [41014130001] = {
    id = 41014130001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015130001] = {
    id = 41015130001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012130:1", "41013130:1"}
  },
  [41016130001] = {
    id = 41016130001,
    des = function()
      return T(80561301, T(80520012, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313001:3001:10000"
    },
    association_des = function()
      return T(80561301, T(80520012, 5), T(80520011, 5))
    end
  },
  [41017130001] = {
    id = 41017130001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018130001] = {
    id = 41018130001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012130:2", "41013130:2"}
  },
  [41001130001] = {
    id = 41001130001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001130002] = {
    id = 41001130002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001130003] = {
    id = 41001130003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41002130001] = {
    id = 41002130001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002130002] = {
    id = 41002130002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002130003] = {
    id = 41002130003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41003130001] = {
    id = 41003130001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003130002] = {
    id = 41003130002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003130003] = {
    id = 41003130003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41019130001] = {
    id = 41019130001,
    des = function()
      return T(80591301, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413001:3002:10000"
    }
  },
  [41011131001] = {
    id = 41011131001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001311:42113100",
      "12001312:42113100"
    },
    damage_rate = 7000
  },
  [41011131002] = {
    id = 41011131002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001311:42113100",
      "12001312:42113100"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011131003] = {
    id = 41011131003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001311:42113100",
      "12001312:42113100"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 1
  },
  [41011131004] = {
    id = 41011131004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001311:42113100",
      "12001312:42113100"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 2
  },
  [41012131001] = {
    id = 41012131001,
    des = function()
      return T(80521311, T(80520018, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113101:3001:10000"
    }
  },
  [41012131002] = {
    id = 41012131002,
    des = function()
      return T(80521311, T(80520018, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113103:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012131003] = {
    id = 41012131003,
    des = function()
      return T(80521311, T(80520018, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113105:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41012131004] = {
    id = 41012131004,
    des = function()
      return T(80521311, T(80520018, 160))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113107:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 3
  },
  [41012131005] = {
    id = 41012131005,
    des = function()
      return T(80521311, T(80520018, 180))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113109:3001:10000"
    }
  },
  [41012131006] = {
    id = 41012131006,
    des = function()
      return T(80521311, T(80520018, 200))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113111:3001:10000"
    }
  },
  [41013131001] = {
    id = 41013131001,
    des = function()
      return T(80531311, T(80520017, 100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001311:42313100",
      "12001312:42313100"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213101:3001:10000:1003101",
      "43213102:3001:10000"
    },
    tag_id = 411
  },
  [41013131002] = {
    id = 41013131002,
    des = function()
      return T(80531311, T(80520017, 110))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001311:42313100",
      "12001312:42313100"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213103:3001:10000:1003101",
      "43213104:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 411
  },
  [41013131003] = {
    id = 41013131003,
    des = function()
      return T(80531311, T(80520017, 120))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001311:42313100",
      "12001312:42313100"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213105:3001:10000:1003101",
      "43213106:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 3,
    tag_id = 411
  },
  [41013131004] = {
    id = 41013131004,
    des = function()
      return T(80531311, T(80520017, 130))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001311:42313100",
      "12001312:42313100"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213107:3001:10000:1003101",
      "43213108:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020012:3"
    },
    need_quality_level = 3,
    tag_id = 411
  },
  [41013131005] = {
    id = 41013131005,
    des = function()
      return T(80531311, T(80520017, 140))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001311:42313100",
      "12001312:42313100"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213109:3001:10000:1003101",
      "43213110:3001:10000"
    },
    tag_id = 411
  },
  [41013131006] = {
    id = 41013131006,
    des = function()
      return T(80531311, T(80520017, 150))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001311:42313100",
      "12001312:42313100"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213111:3001:10000:1003101",
      "43213112:3001:10000"
    },
    tag_id = 411
  },
  [41014131001] = {
    id = 41014131001,
    des = function()
      return T(80541311, T(80520014, T(80000102)), T(80520011, 501), T(80520012, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313101:3001:10000"
    },
    add_attr = {
      "1:40000102:501"
    }
  },
  [41015131001] = {
    id = 41015131001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012131:1", "41013131:1"}
  },
  [41016131001] = {
    id = 41016131001,
    des = function()
      return T(80561311, T(80520012, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313102:3001:10000"
    },
    association_des = function()
      return T(80561311, T(80520012, 10))
    end
  },
  [41017131001] = {
    id = 41017131001,
    des = function()
      return T(80570001, T(80520014, T(80000102)), T(80520011, 1441))
    end,
    add_attr = {
      "1:40000102:1441"
    }
  },
  [41018131001] = {
    id = 41018131001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012131:2", "41013131:2"}
  },
  [41001131001] = {
    id = 41001131001,
    des = function()
      return T(80520016, T(80000102), 576)
    end,
    add_attr = {
      "1:40000102:576"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001131002] = {
    id = 41001131002,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001131003] = {
    id = 41001131003,
    des = function()
      return T(80520016, T(80000102), 1728)
    end,
    add_attr = {
      "1:40000102:1728"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41002131001] = {
    id = 41002131001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002131002] = {
    id = 41002131002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002131003] = {
    id = 41002131003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41003131001] = {
    id = 41003131001,
    des = function()
      return T(80520016, T(80000102), 576)
    end,
    add_attr = {
      "1:40000102:576"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003131002] = {
    id = 41003131002,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003131003] = {
    id = 41003131003,
    des = function()
      return T(80520016, T(80000102), 1728)
    end,
    add_attr = {
      "1:40000102:1728"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41019131001] = {
    id = 41019131001,
    des = function()
      return T(80591311, T(80520012, 7), T(80520012, 7))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413101:3002:10000",
      "43413102:3002:10000"
    }
  },
  [41011132001] = {
    id = 41011132001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001321:42113200",
      "12001322:42113200"
    },
    damage_rate = 7000
  },
  [41011132002] = {
    id = 41011132002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001321:42113200",
      "12001322:42113200"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011132003] = {
    id = 41011132003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001321:42113200",
      "12001322:42113200"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 1
  },
  [41011132004] = {
    id = 41011132004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001321:42113200",
      "12001322:42113200"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 2
  },
  [41012132001] = {
    id = 41012132001,
    des = function()
      return T(80521321, T(80520017, 10), T(80520017, 50))
    end,
    fashion_show_ids = {
      "12001321:42213200",
      "12001322:42213200"
    },
    target_type = 3061,
    trigger_condition_1 = {1062},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113201:1000:10000",
      "43113207:1000:10000:1003201"
    },
    extra_skill = 41010132001
  },
  [41012132002] = {
    id = 41012132002,
    des = function()
      return T(80521321, T(80520017, 12), T(80520017, 55))
    end,
    fashion_show_ids = {
      "12001321:42213200",
      "12001322:42213200"
    },
    target_type = 3061,
    trigger_condition_1 = {1062},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113202:1000:10000",
      "43113207:1000:10000:1003201"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1,
    extra_skill = 41010132002
  },
  [41012132003] = {
    id = 41012132003,
    des = function()
      return T(80521321, T(80520017, 14), T(80520017, 60))
    end,
    fashion_show_ids = {
      "12001321:42213200",
      "12001322:42213200"
    },
    target_type = 3061,
    trigger_condition_1 = {1062},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113203:1000:10000",
      "43113207:1000:10000:1003201"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 2,
    extra_skill = 41010132003
  },
  [41012132004] = {
    id = 41012132004,
    des = function()
      return T(80521321, T(80520017, 16), T(80520017, 65))
    end,
    fashion_show_ids = {
      "12001321:42213200",
      "12001322:42213200"
    },
    target_type = 3061,
    trigger_condition_1 = {1062},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113204:1000:10000",
      "43113207:1000:10000:1003201"
    },
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 3,
    extra_skill = 41010132004
  },
  [41012132005] = {
    id = 41012132005,
    des = function()
      return T(80521321, T(80520017, 18), T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001321:42213200",
      "12001322:42213200"
    },
    target_type = 3061,
    trigger_condition_1 = {1062},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113205:1000:10000",
      "43113207:1000:10000:1003201"
    },
    extra_skill = 41010132005
  },
  [41012132006] = {
    id = 41012132006,
    des = function()
      return T(80521321, T(80520017, 20), T(80520017, 75))
    end,
    fashion_show_ids = {
      "12001321:42213200",
      "12001322:42213200"
    },
    target_type = 3061,
    trigger_condition_1 = {1062},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113206:1000:10000",
      "43113207:1000:10000:1003201"
    },
    extra_skill = 41010132006
  },
  [41010132001] = {
    id = 41010132001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113208:3201:10000"
    }
  },
  [41010132002] = {
    id = 41010132002,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113209:3201:10000"
    },
    need_quality_level = 1
  },
  [41010132003] = {
    id = 41010132003,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113210:3201:10000"
    },
    need_quality_level = 2
  },
  [41010132004] = {
    id = 41010132004,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113211:3201:10000"
    },
    need_quality_level = 3
  },
  [41010132005] = {
    id = 41010132005,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113212:3201:10000"
    }
  },
  [41010132006] = {
    id = 41010132006,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113213:3201:10000"
    }
  },
  [41013132001] = {
    id = 41013132001,
    des = function()
      return T(80531321, T(80520017, 1000), T(80520017, 65))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001321:42313200",
      "12001322:42313200"
    },
    target_type = 2001,
    damage_rate = 100000,
    buff_list = {
      "43213201:3001:10000",
      "43213202:3211:10000",
      "43213203:3212:10000"
    },
    tag_id = 419
  },
  [41013132002] = {
    id = 41013132002,
    des = function()
      return T(80531321, T(80520017, 1100), T(80520017, 70))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001321:42313200",
      "12001322:42313200"
    },
    target_type = 2001,
    damage_rate = 110000,
    buff_list = {
      "43213210:3001:10000",
      "43213211:3211:10000",
      "43213212:3212:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 419
  },
  [41013132003] = {
    id = 41013132003,
    des = function()
      return T(80531321, T(80520017, 1200), T(80520017, 75))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001321:42313200",
      "12001322:42313200"
    },
    target_type = 2001,
    damage_rate = 120000,
    buff_list = {
      "43213219:3001:10000",
      "43213220:3211:10000",
      "43213221:3212:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 3,
    tag_id = 419
  },
  [41013132004] = {
    id = 41013132004,
    des = function()
      return T(80531321, T(80520017, 1300), T(80520017, 80))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001321:42313200",
      "12001322:42313200"
    },
    target_type = 2001,
    damage_rate = 130000,
    buff_list = {
      "43213228:3001:10000",
      "43213229:3211:10000",
      "43213230:3212:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 3,
    tag_id = 419
  },
  [41013132005] = {
    id = 41013132005,
    des = function()
      return T(80531321, T(80520017, 1400), T(80520017, 85))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001321:42313200",
      "12001322:42313200"
    },
    target_type = 2001,
    damage_rate = 140000,
    buff_list = {
      "43213237:3001:10000",
      "43213238:3211:10000",
      "43213239:3212:10000"
    },
    tag_id = 419
  },
  [41013132006] = {
    id = 41013132006,
    des = function()
      return T(80531321, T(80520017, 1500), T(80520017, 90))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001321:42313200",
      "12001322:42313200"
    },
    target_type = 2001,
    damage_rate = 150000,
    buff_list = {
      "43213246:3001:10000",
      "43213247:3211:10000",
      "43213248:3212:10000"
    },
    tag_id = 419
  },
  [41014132001] = {
    id = 41014132001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 80))
    end,
    add_attr = {
      "1:40000103:80"
    }
  },
  [41015132001] = {
    id = 41015132001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012132:1", "41013132:1"}
  },
  [41016132001] = {
    id = 41016132001,
    des = function()
      return T(80561321)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313201:3001:10000"
    },
    association_des = function()
      return T(80561321)
    end
  },
  [41017132001] = {
    id = 41017132001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018132001] = {
    id = 41018132001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012132:2", "41013132:2"}
  },
  [41001132001] = {
    id = 41001132001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001132002] = {
    id = 41001132002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001132003] = {
    id = 41001132003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41002132001] = {
    id = 41002132001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002132002] = {
    id = 41002132002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002132003] = {
    id = 41002132003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41003132001] = {
    id = 41003132001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003132002] = {
    id = 41003132002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003132003] = {
    id = 41003132003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41019132001] = {
    id = 41019132001,
    des = function()
      return T(80591321, T(80520012, 5), T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413201:3002:10000",
      "43413202:3002:10000"
    }
  },
  [41011133001] = {
    id = 41011133001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001331:42113300",
      "12001332:42113300"
    },
    damage_rate = 7000,
    bullet_speed = 800
  },
  [41011133002] = {
    id = 41011133002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001331:42113300",
      "12001332:42113300"
    },
    damage_rate = 8000,
    bullet_speed = 800,
    cost = {
      "1:21040001:1"
    }
  },
  [41011133003] = {
    id = 41011133003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001331:42113300",
      "12001332:42113300"
    },
    damage_rate = 9000,
    bullet_speed = 800,
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 1
  },
  [41011133004] = {
    id = 41011133004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001331:42113300",
      "12001332:42113300"
    },
    damage_rate = 10000,
    bullet_speed = 800,
    cost = {
      "1:21040003:2",
      "1:21020024:3"
    },
    need_quality_level = 2
  },
  [41012133001] = {
    id = 41012133001,
    des = function()
      return T(80521331, T(80520011, 3), T(80520019, "1.5"), T(80520018, 250))
    end,
    target_type = 3012,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43113301:1000:10000"
    }
  },
  [41012133002] = {
    id = 41012133002,
    des = function()
      return T(80521331, T(80520011, 3), T(80520019, "2"), T(80520018, 300))
    end,
    target_type = 3012,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43113302:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012133003] = {
    id = 41012133003,
    des = function()
      return T(80521331, T(80520011, 3), T(80520019, "2.5"), T(80520018, 350))
    end,
    target_type = 3012,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43113303:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41012133004] = {
    id = 41012133004,
    des = function()
      return T(80521331, T(80520011, 3), T(80520019, "3"), T(80520018, 400))
    end,
    target_type = 3012,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43113304:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020024:3"
    },
    need_quality_level = 3
  },
  [41012133005] = {
    id = 41012133005,
    des = function()
      return T(80521331, T(80520011, 3), T(80520019, "3.5"), T(80520018, 450))
    end,
    target_type = 3012,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43113305:1000:10000"
    }
  },
  [41012133006] = {
    id = 41012133006,
    des = function()
      return T(80521331, T(80520011, 3), T(80520019, "4"), T(80520018, 500))
    end,
    target_type = 3012,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43113306:1000:10000"
    }
  },
  [41013133001] = {
    id = 41013133001,
    des = function()
      return T(80531331, T(80520019, "1.5"), T(80520018, 200), T(80520011, 8))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001331:42313300",
      "12001332:42313300"
    },
    target_type = 3012,
    damage_rate = 0,
    bullet_speed = 600,
    bullet_buff_list = {
      "43213301:0:10000"
    },
    tag_id = 303
  },
  [41013133002] = {
    id = 41013133002,
    des = function()
      return T(80531331, T(80520019, "2"), T(80520018, 250), T(80520011, 8))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001331:42313300",
      "12001332:42313300"
    },
    target_type = 3012,
    damage_rate = 0,
    bullet_speed = 600,
    bullet_buff_list = {
      "43213303:0:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 303
  },
  [41013133003] = {
    id = 41013133003,
    des = function()
      return T(80531331, T(80520019, "2.5"), T(80520018, 300), T(80520011, 8))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001331:42313300",
      "12001332:42313300"
    },
    target_type = 3012,
    damage_rate = 0,
    bullet_speed = 600,
    bullet_buff_list = {
      "43213305:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 3,
    tag_id = 303
  },
  [41013133004] = {
    id = 41013133004,
    des = function()
      return T(80531331, T(80520019, "3"), T(80520018, 350), T(80520011, 8))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001331:42313300",
      "12001332:42313300"
    },
    target_type = 3012,
    damage_rate = 0,
    bullet_speed = 600,
    bullet_buff_list = {
      "43213307:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020024:3"
    },
    need_quality_level = 3,
    tag_id = 303
  },
  [41013133005] = {
    id = 41013133005,
    des = function()
      return T(80531331, T(80520019, "3.5"), T(80520018, 400), T(80520011, 8))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001331:42313300",
      "12001332:42313300"
    },
    target_type = 3012,
    damage_rate = 0,
    bullet_speed = 600,
    bullet_buff_list = {
      "43213309:0:10000"
    },
    tag_id = 303
  },
  [41013133006] = {
    id = 41013133006,
    des = function()
      return T(80531331, T(80520019, "4"), T(80520018, 450), T(80520011, 8))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001331:42313300",
      "12001332:42313300"
    },
    target_type = 3012,
    damage_rate = 0,
    bullet_speed = 600,
    bullet_buff_list = {
      "43213311:0:10000"
    },
    tag_id = 303
  },
  [41014133001] = {
    id = 41014133001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 1002))
    end,
    add_attr = {
      "1:40000102:1002"
    }
  },
  [41015133001] = {
    id = 41015133001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012133:1", "41013133:1"}
  },
  [41016133001] = {
    id = 41016133001,
    des = function()
      return T(80561331, T(80520012, 10), T(80520011, 3))
    end,
    target_type = 3011,
    trigger_condition_1 = {1061},
    trigger_type_1 = {4},
    trigger_value_1 = {1000},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313301:3011:10000:403"
    },
    association_des = function()
      return T(80561331, T(80520012, 10), T(80520011, 3))
    end
  },
  [41017133001] = {
    id = 41017133001,
    des = function()
      return T(80570001, T(80520014, T(80000104)), T(80520011, 138))
    end,
    add_attr = {
      "1:40000104:138"
    }
  },
  [41018133001] = {
    id = 41018133001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012133:2", "41013133:2"}
  },
  [41001133001] = {
    id = 41001133001,
    des = function()
      return T(80520016, T(80000102), 576)
    end,
    add_attr = {
      "1:40000102:576"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001133002] = {
    id = 41001133002,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001133003] = {
    id = 41001133003,
    des = function()
      return T(80520016, T(80000102), 1728)
    end,
    add_attr = {
      "1:40000102:1728"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 2
  },
  [41002133001] = {
    id = 41002133001,
    des = function()
      return T(80520016, T(80000104), 55)
    end,
    add_attr = {
      "1:40000104:55"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002133002] = {
    id = 41002133002,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002133003] = {
    id = 41002133003,
    des = function()
      return T(80520016, T(80000104), 165)
    end,
    add_attr = {
      "1:40000104:165"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 3
  },
  [41003133001] = {
    id = 41003133001,
    des = function()
      return T(80520016, T(80000102), 576)
    end,
    add_attr = {
      "1:40000102:576"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003133002] = {
    id = 41003133002,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003133003] = {
    id = 41003133003,
    des = function()
      return T(80520016, T(80000102), 1728)
    end,
    add_attr = {
      "1:40000102:1728"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 3
  },
  [41019133001] = {
    id = 41019133001,
    des = function()
      return T(80591331, T(80520012, 20), T(80520012, 5))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413301:3222:10000",
      "43413302:3222:10000"
    }
  },
  [41011134001] = {
    id = 41011134001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001341:42113400",
      "12001342:42113400"
    },
    damage_rate = 7000
  },
  [41011134002] = {
    id = 41011134002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001341:42113400",
      "12001342:42113400"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011134003] = {
    id = 41011134003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001341:42113400",
      "12001342:42113400"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:1",
      "1:21020026:1"
    },
    need_quality_level = 1
  },
  [41011134004] = {
    id = 41011134004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001341:42113400",
      "12001342:42113400"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:1",
      "1:21020011:2"
    },
    need_quality_level = 2
  },
  [41012134001] = {
    id = 41012134001,
    des = function()
      return T(80521341, T(80520017, 5), T(80520011, 15))
    end,
    fashion_show_ids = {
      "12001341:42213400",
      "12001342:42213400"
    },
    target_type = 3001,
    trigger_condition_1 = {1002},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113401:3002:10000",
      "43113402:3002:10000",
      "43113413:3001:10000",
      "43113414:3002:10000:1003401"
    }
  },
  [41012134002] = {
    id = 41012134002,
    des = function()
      return T(80521341, T(80520017, 6), T(80520011, 15))
    end,
    fashion_show_ids = {
      "12001341:42213400",
      "12001342:42213400"
    },
    target_type = 3001,
    trigger_condition_1 = {1002},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113403:3002:10000",
      "43113404:3002:10000",
      "43113413:3001:10000",
      "43113414:3002:10000:1003401"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012134003] = {
    id = 41012134003,
    des = function()
      return T(80521341, T(80520017, 7), T(80520011, 15))
    end,
    fashion_show_ids = {
      "12001341:42213400",
      "12001342:42213400"
    },
    target_type = 3001,
    trigger_condition_1 = {1002},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113405:3002:10000",
      "43113406:3002:10000",
      "43113413:3001:10000",
      "43113414:3002:10000:1003401"
    },
    cost = {
      "1:21040002:1",
      "1:21020026:1"
    },
    need_quality_level = 2
  },
  [41012134004] = {
    id = 41012134004,
    des = function()
      return T(80521341, T(80520017, 8), T(80520011, 15))
    end,
    fashion_show_ids = {
      "12001341:42213400",
      "12001342:42213400"
    },
    target_type = 3001,
    trigger_condition_1 = {1002},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113407:3002:10000",
      "43113408:3002:10000",
      "43113413:3001:10000",
      "43113414:3002:10000:1003401"
    },
    cost = {
      "1:21040003:1",
      "1:21020011:2"
    },
    need_quality_level = 3
  },
  [41012134005] = {
    id = 41012134005,
    des = function()
      return T(80521341, T(80520017, 9), T(80520011, 15))
    end,
    fashion_show_ids = {
      "12001341:42213400",
      "12001342:42213400"
    },
    target_type = 3001,
    trigger_condition_1 = {1002},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113409:3002:10000",
      "43113410:3002:10000",
      "43113413:3001:10000",
      "43113414:3002:10000:1003401"
    }
  },
  [41012134006] = {
    id = 41012134006,
    des = function()
      return T(80521341, T(80520017, 10), T(80520011, 15))
    end,
    fashion_show_ids = {
      "12001341:42213400",
      "12001342:42213400"
    },
    target_type = 3001,
    trigger_condition_1 = {1002},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113411:3002:10000",
      "43113412:3002:10000",
      "43113413:3001:10000",
      "43113414:3002:10000:1003401"
    }
  },
  [41013134001] = {
    id = 41013134001,
    des = function()
      return T(80531341, T(80520017, 1000), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001341:42313400",
      "12001342:42313400"
    },
    target_type = 2001,
    damage_rate = 100000,
    buff_list = {
      "43213401:2001:10000"
    },
    tag_id = 106
  },
  [41013134002] = {
    id = 41013134002,
    des = function()
      return T(80531341, T(80520017, 1100), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001341:42313400",
      "12001342:42313400"
    },
    target_type = 2001,
    damage_rate = 110000,
    buff_list = {
      "43213401:2001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 106
  },
  [41013134003] = {
    id = 41013134003,
    des = function()
      return T(80531341, T(80520017, 1200), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001341:42313400",
      "12001342:42313400"
    },
    target_type = 2001,
    damage_rate = 120000,
    buff_list = {
      "43213401:2001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020026:1"
    },
    need_quality_level = 3,
    tag_id = 106
  },
  [41013134004] = {
    id = 41013134004,
    des = function()
      return T(80531341, T(80520017, 1300), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001341:42313400",
      "12001342:42313400"
    },
    target_type = 2001,
    damage_rate = 130000,
    buff_list = {
      "43213401:2001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020011:2"
    },
    need_quality_level = 3,
    tag_id = 106
  },
  [41013134005] = {
    id = 41013134005,
    des = function()
      return T(80531341, T(80520017, 1400), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001341:42313400",
      "12001342:42313400"
    },
    target_type = 2001,
    damage_rate = 140000,
    buff_list = {
      "43213401:2001:10000"
    },
    tag_id = 106
  },
  [41013134006] = {
    id = 41013134006,
    des = function()
      return T(80531341, T(80520017, 1500), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001341:42313400",
      "12001342:42313400"
    },
    target_type = 2001,
    damage_rate = 150000,
    buff_list = {
      "43213401:2001:10000"
    },
    tag_id = 106
  },
  [41014134001] = {
    id = 41014134001,
    des = function()
      return T(80540001, T(80520014, T(80000104)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000104:60"
    }
  },
  [41015134001] = {
    id = 41015134001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012134:1", "41013134:1"}
  },
  [41016134001] = {
    id = 41016134001,
    des = function()
      return T(80561341, T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313401:3001:10000"
    },
    association_des = function()
      return T(80561341, T(80520011, 10))
    end
  },
  [41017134001] = {
    id = 41017134001,
    des = function()
      return T(80570001, T(80520014, T(80000104)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000104:92"
    }
  },
  [41018134001] = {
    id = 41018134001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012134:2", "41013134:2"}
  },
  [41001134001] = {
    id = 41001134001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001134002] = {
    id = 41001134002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 1
  },
  [41001134003] = {
    id = 41001134003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:1",
      "1:21020006:1"
    },
    need_quality_level = 2
  },
  [41002134001] = {
    id = 41002134001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002134002] = {
    id = 41002134002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 2
  },
  [41002134003] = {
    id = 41002134003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:1",
      "1:21020006:1"
    },
    need_quality_level = 3
  },
  [41003134001] = {
    id = 41003134001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003134002] = {
    id = 41003134002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:1",
      "1:21020001:1"
    },
    need_quality_level = 3
  },
  [41003134003] = {
    id = 41003134003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:1",
      "1:21020006:1"
    },
    need_quality_level = 3
  },
  [41019134001] = {
    id = 41019134001,
    des = function()
      return T(80591341, T(80520012, 10), T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413401:3002:10000",
      "43413402:3002:10000"
    }
  },
  [41011135001] = {
    id = 41011135001,
    des = function()
      return T(80510001, T(80520017, 35))
    end,
    fashion_show_ids = {
      "12001351:42113500",
      "12001352:42113500"
    },
    damage_rate = 3500
  },
  [41011135002] = {
    id = 41011135002,
    des = function()
      return T(80510001, T(80520017, 40))
    end,
    fashion_show_ids = {
      "12001351:42113500",
      "12001352:42113500"
    },
    damage_rate = 4000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011135003] = {
    id = 41011135003,
    des = function()
      return T(80510001, T(80520017, 45))
    end,
    fashion_show_ids = {
      "12001351:42113500",
      "12001352:42113500"
    },
    damage_rate = 4500,
    cost = {
      "1:21040002:1",
      "1:21020027:1"
    },
    need_quality_level = 1
  },
  [41011135004] = {
    id = 41011135004,
    des = function()
      return T(80510001, T(80520017, 50))
    end,
    fashion_show_ids = {
      "12001351:42113500",
      "12001352:42113500"
    },
    damage_rate = 5000,
    cost = {
      "1:21040003:1",
      "1:21020016:2"
    },
    need_quality_level = 2
  },
  [41012135001] = {
    id = 41012135001,
    des = function()
      return T(80521351, T(80520012, 100), T(80520017, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113501:3001:10000"
    }
  },
  [41012135002] = {
    id = 41012135002,
    des = function()
      return T(80521351, T(80520012, 100), T(80520017, 12), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113503:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012135003] = {
    id = 41012135003,
    des = function()
      return T(80521351, T(80520012, 100), T(80520017, 14), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113505:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020027:1"
    },
    need_quality_level = 2
  },
  [41012135004] = {
    id = 41012135004,
    des = function()
      return T(80521351, T(80520012, 100), T(80520017, 16), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113507:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020016:2"
    },
    need_quality_level = 3
  },
  [41012135005] = {
    id = 41012135005,
    des = function()
      return T(80521351, T(80520012, 100), T(80520017, 18), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113509:3001:10000"
    }
  },
  [41012135006] = {
    id = 41012135006,
    des = function()
      return T(80521351, T(80520012, 100), T(80520017, 20), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113511:3001:10000"
    }
  },
  [41013135001] = {
    id = 41013135001,
    des = function()
      return T(80531351, T(80520017, 400))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001351:42313500",
      "12001352:42313500"
    },
    target_type = 2001,
    damage_rate = 40000,
    buff_list = {
      "43313502:3001:10000"
    },
    tag_id = 105
  },
  [41013135002] = {
    id = 41013135002,
    des = function()
      return T(80531351, T(80520017, 450))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001351:42313500",
      "12001352:42313500"
    },
    target_type = 2001,
    damage_rate = 45000,
    buff_list = {
      "43313502:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013135003] = {
    id = 41013135003,
    des = function()
      return T(80531351, T(80520017, 500))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001351:42313500",
      "12001352:42313500"
    },
    target_type = 2001,
    damage_rate = 50000,
    buff_list = {
      "43313502:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020027:1"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013135004] = {
    id = 41013135004,
    des = function()
      return T(80531351, T(80520017, 550))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001351:42313500",
      "12001352:42313500"
    },
    target_type = 2001,
    damage_rate = 55000,
    buff_list = {
      "43313502:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020016:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013135005] = {
    id = 41013135005,
    des = function()
      return T(80531351, T(80520017, 600))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001351:42313500",
      "12001352:42313500"
    },
    target_type = 2001,
    damage_rate = 60000,
    buff_list = {
      "43313502:3001:10000"
    },
    tag_id = 105
  },
  [41013135006] = {
    id = 41013135006,
    des = function()
      return T(80531351, T(80520017, 650))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001351:42313500",
      "12001352:42313500"
    },
    target_type = 2001,
    damage_rate = 65000,
    buff_list = {
      "43313502:3001:10000"
    },
    tag_id = 105
  },
  [41014135001] = {
    id = 41014135001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015135001] = {
    id = 41015135001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012135:1", "41013135:1"}
  },
  [41016135001] = {
    id = 41016135001,
    des = function()
      return T(80561351, T(80520012, 20))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313501:3001:10000"
    },
    association_des = function()
      return T(80561351, T(80520012, 20))
    end
  },
  [41017135001] = {
    id = 41017135001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018135001] = {
    id = 41018135001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012135:2", "41013135:2"}
  },
  [41001135001] = {
    id = 41001135001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001135002] = {
    id = 41001135002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 1
  },
  [41001135003] = {
    id = 41001135003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020007:1"
    },
    need_quality_level = 2
  },
  [41002135001] = {
    id = 41002135001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002135002] = {
    id = 41002135002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 2
  },
  [41002135003] = {
    id = 41002135003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:1",
      "1:21020007:1"
    },
    need_quality_level = 3
  },
  [41003135001] = {
    id = 41003135001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003135002] = {
    id = 41003135002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 3
  },
  [41003135003] = {
    id = 41003135003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020007:1"
    },
    need_quality_level = 3
  },
  [41019135001] = {
    id = 41019135001,
    des = function()
      return T(80591351, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413501:3002:10000"
    }
  },
  [41011136001] = {
    id = 41011136001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001361:42113600",
      "12001362:42113600"
    },
    damage_rate = 7000,
    bullet_speed = 800
  },
  [41011136002] = {
    id = 41011136002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001361:42113600",
      "12001362:42113600"
    },
    damage_rate = 8000,
    bullet_speed = 800,
    cost = {
      "1:21040001:1"
    }
  },
  [41011136003] = {
    id = 41011136003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001361:42113600",
      "12001362:42113600"
    },
    damage_rate = 9000,
    bullet_speed = 800,
    cost = {
      "1:21040002:1",
      "1:21020030:1"
    },
    need_quality_level = 1
  },
  [41011136004] = {
    id = 41011136004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001361:42113600",
      "12001362:42113600"
    },
    damage_rate = 10000,
    bullet_speed = 800,
    cost = {
      "1:21040003:1",
      "1:21020025:2"
    },
    need_quality_level = 2
  },
  [41012136001] = {
    id = 41012136001,
    des = function()
      return T(80521361, T(80520012, 100), T(80520019, "2.5"), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113601:3001:10000"
    }
  },
  [41012136002] = {
    id = 41012136002,
    des = function()
      return T(80521361, T(80520012, 100), T(80520019, "3"), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113604:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012136003] = {
    id = 41012136003,
    des = function()
      return T(80521361, T(80520012, 100), T(80520019, "3.5"), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113607:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020030:1"
    },
    need_quality_level = 2
  },
  [41012136004] = {
    id = 41012136004,
    des = function()
      return T(80521361, T(80520012, 100), T(80520019, "4"), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113610:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020025:2"
    },
    need_quality_level = 3
  },
  [41012136005] = {
    id = 41012136005,
    des = function()
      return T(80521361, T(80520012, 100), T(80520019, "4.5"), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113613:3001:10000"
    }
  },
  [41012136006] = {
    id = 41012136006,
    des = function()
      return T(80521361, T(80520012, 100), T(80520019, "5"), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113616:3001:10000"
    }
  },
  [41013136001] = {
    id = 41013136001,
    des = function()
      return T(80531361, T(80520017, 850))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001361:42313600",
      "12001362:42313600"
    },
    target_type = 2001,
    damage_rate = 85000,
    tag_id = 105
  },
  [41013136002] = {
    id = 41013136002,
    des = function()
      return T(80531361, T(80520017, 870))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001361:42313600",
      "12001362:42313600"
    },
    target_type = 2001,
    damage_rate = 87000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013136003] = {
    id = 41013136003,
    des = function()
      return T(80531361, T(80520017, 890))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001361:42313600",
      "12001362:42313600"
    },
    target_type = 2001,
    damage_rate = 89000,
    cost = {
      "1:21040002:1",
      "1:21020030:1"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013136004] = {
    id = 41013136004,
    des = function()
      return T(80531361, T(80520017, 910))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001361:42313600",
      "12001362:42313600"
    },
    target_type = 2001,
    damage_rate = 91000,
    cost = {
      "1:21040003:1",
      "1:21020025:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013136005] = {
    id = 41013136005,
    des = function()
      return T(80531361, T(80520017, 930))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001361:42313600",
      "12001362:42313600"
    },
    target_type = 2001,
    damage_rate = 93000,
    tag_id = 105
  },
  [41013136006] = {
    id = 41013136006,
    des = function()
      return T(80531361, T(80520017, 950))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001361:42313600",
      "12001362:42313600"
    },
    target_type = 2001,
    damage_rate = 95000,
    tag_id = 105
  },
  [41014136001] = {
    id = 41014136001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015136001] = {
    id = 41015136001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012136:1", "41013136:1"}
  },
  [41016136001] = {
    id = 41016136001,
    des = function()
      return T(80561361, T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313601:3001:10000"
    },
    association_des = function()
      return T(80561361, T(80520011, 5))
    end
  },
  [41017136001] = {
    id = 41017136001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018136001] = {
    id = 41018136001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012136:2", "41013136:2"}
  },
  [41001136001] = {
    id = 41001136001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001136002] = {
    id = 41001136002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 1
  },
  [41001136003] = {
    id = 41001136003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020010:1"
    },
    need_quality_level = 2
  },
  [41002136001] = {
    id = 41002136001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002136002] = {
    id = 41002136002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 2
  },
  [41002136003] = {
    id = 41002136003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:1",
      "1:21020010:1"
    },
    need_quality_level = 3
  },
  [41003136001] = {
    id = 41003136001,
    des = function()
      return T(80520015, T(80000204), 5)
    end,
    add_attr = {
      "1:40000204:500"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003136002] = {
    id = 41003136002,
    des = function()
      return T(80520015, T(80000204), 12)
    end,
    add_attr = {
      "1:40000204:1200"
    },
    cost = {
      "1:21040002:1",
      "1:21020005:1"
    },
    need_quality_level = 3
  },
  [41003136003] = {
    id = 41003136003,
    des = function()
      return T(80520015, T(80000204), 21)
    end,
    add_attr = {
      "1:40000204:2100"
    },
    cost = {
      "1:21040003:1",
      "1:21020010:1"
    },
    need_quality_level = 3
  },
  [41019136001] = {
    id = 41019136001,
    des = function()
      return T(80591361, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413601:3002:10000"
    }
  },
  [41011137001] = {
    id = 41011137001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001371:42113700",
      "12001372:42113700"
    },
    damage_rate = 7000
  },
  [41011137002] = {
    id = 41011137002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001371:42113700",
      "12001372:42113700"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011137003] = {
    id = 41011137003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001371:42113700",
      "12001372:42113700"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 1
  },
  [41011137004] = {
    id = 41011137004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001371:42113700",
      "12001372:42113700"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020013:2"
    },
    need_quality_level = 2
  },
  [41012137001] = {
    id = 41012137001,
    des = function()
      return T(80521371, T(80520017, 15), T(80520012, 30))
    end,
    fashion_show_ids = {
      "12001371:42213700",
      "12001372:42213700"
    },
    target_type = 3001,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 0,
    buff_list = {
      "43113701:3001:10000"
    },
    trigger_random_1 = {1500}
  },
  [41012137002] = {
    id = 41012137002,
    des = function()
      return T(80521371, T(80520017, 18), T(80520012, 30))
    end,
    fashion_show_ids = {
      "12001371:42213700",
      "12001372:42213700"
    },
    target_type = 3001,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 0,
    buff_list = {
      "43113702:3001:10000"
    },
    trigger_random_1 = {1800},
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012137003] = {
    id = 41012137003,
    des = function()
      return T(80521371, T(80520017, 21), T(80520012, 30))
    end,
    fashion_show_ids = {
      "12001371:42213700",
      "12001372:42213700"
    },
    target_type = 3001,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 0,
    buff_list = {
      "43113703:3001:10000"
    },
    trigger_random_1 = {2100},
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41012137004] = {
    id = 41012137004,
    des = function()
      return T(80521371, T(80520017, 24), T(80520012, 30))
    end,
    fashion_show_ids = {
      "12001371:42213700",
      "12001372:42213700"
    },
    target_type = 3001,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 0,
    buff_list = {
      "43113704:3001:10000"
    },
    trigger_random_1 = {2400},
    cost = {
      "1:21040003:2",
      "1:21020013:2"
    },
    need_quality_level = 3
  },
  [41012137005] = {
    id = 41012137005,
    des = function()
      return T(80521371, T(80520017, 26), T(80520012, 30))
    end,
    fashion_show_ids = {
      "12001371:42213700",
      "12001372:42213700"
    },
    target_type = 3001,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 0,
    buff_list = {
      "43113705:3001:10000"
    },
    trigger_random_1 = {2600}
  },
  [41012137006] = {
    id = 41012137006,
    des = function()
      return T(80521371, T(80520017, 30), T(80520012, 30))
    end,
    fashion_show_ids = {
      "12001371:42213700",
      "12001372:42213700"
    },
    target_type = 3001,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 0,
    buff_list = {
      "43113706:3001:10000"
    },
    trigger_random_1 = {3000}
  },
  [41013137001] = {
    id = 41013137001,
    des = function()
      return T(80531371, T(80520017, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001371:42313700",
      "12001372:42313700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213701:3001:10000:1003701"
    },
    tag_id = 406
  },
  [41013137002] = {
    id = 41013137002,
    des = function()
      return T(80531371, T(80520017, 11))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001371:42313700",
      "12001372:42313700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213702:3001:10000:1003701"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 406
  },
  [41013137003] = {
    id = 41013137003,
    des = function()
      return T(80531371, T(80520017, 12))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001371:42313700",
      "12001372:42313700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213703:3001:10000:1003701"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 3,
    tag_id = 406
  },
  [41013137004] = {
    id = 41013137004,
    des = function()
      return T(80531371, T(80520017, 13))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001371:42313700",
      "12001372:42313700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213704:3001:10000:1003701"
    },
    cost = {
      "1:21040003:2",
      "1:21020013:2"
    },
    need_quality_level = 3,
    tag_id = 406
  },
  [41013137005] = {
    id = 41013137005,
    des = function()
      return T(80531371, T(80520017, 14))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001371:42313700",
      "12001372:42313700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213705:3001:10000:1003701"
    },
    tag_id = 406
  },
  [41013137006] = {
    id = 41013137006,
    des = function()
      return T(80531371, T(80520017, 15))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001371:42313700",
      "12001372:42313700"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43213706:3001:10000:1003701"
    },
    tag_id = 406
  },
  [41014137001] = {
    id = 41014137001,
    des = function()
      return T(80540001, T(80520014, T(80000104)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000104:60"
    }
  },
  [41015137001] = {
    id = 41015137001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012137:1", "41013137:1"}
  },
  [41016137001] = {
    id = 41016137001,
    des = function()
      return T(80561371, T(80520014, T(80000203)), T(80520012, 5))
    end,
    add_attr = {
      "1:40000203:500"
    },
    association_des = function()
      return T(80561371, T(80520014, T(80000203)), T(80520012, 5))
    end
  },
  [41017137001] = {
    id = 41017137001,
    des = function()
      return T(80570001, T(80520014, T(80000104)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000104:92"
    }
  },
  [41018137001] = {
    id = 41018137001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012137:2", "41013137:2"}
  },
  [41001137001] = {
    id = 41001137001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001137002] = {
    id = 41001137002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001137003] = {
    id = 41001137003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41002137001] = {
    id = 41002137001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002137002] = {
    id = 41002137002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002137003] = {
    id = 41002137003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41003137001] = {
    id = 41003137001,
    des = function()
      return T(80520016, T(80000104), 37)
    end,
    add_attr = {
      "1:40000104:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003137002] = {
    id = 41003137002,
    des = function()
      return T(80520016, T(80000104), 73)
    end,
    add_attr = {
      "1:40000104:73"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003137003] = {
    id = 41003137003,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41019137001] = {
    id = 41019137001,
    des = function()
      return T(80591371, T(80520012, 10), T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413701:3002:10000",
      "43413702:3002:10000"
    }
  },
  [41011138001] = {
    id = 41011138001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001381:42113800",
      "12001382:42113800"
    },
    damage_rate = 7000
  },
  [41011138002] = {
    id = 41011138002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001381:42113800",
      "12001382:42113800"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011138003] = {
    id = 41011138003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001381:42113800",
      "12001382:42113800"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 1
  },
  [41011138004] = {
    id = 41011138004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001381:42113800",
      "12001382:42113800"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020015:2"
    },
    need_quality_level = 2
  },
  [41012138001] = {
    id = 41012138001,
    des = function()
      return T(80521381, T(80520017, 15), T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43113801:3001:10000"
    }
  },
  [41012138002] = {
    id = 41012138002,
    des = function()
      return T(80521381, T(80520017, 18), T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43113803:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012138003] = {
    id = 41012138003,
    des = function()
      return T(80521381, T(80520017, 21), T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43113805:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41012138004] = {
    id = 41012138004,
    des = function()
      return T(80521381, T(80520017, 24), T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43113807:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020015:2"
    },
    need_quality_level = 3
  },
  [41012138005] = {
    id = 41012138005,
    des = function()
      return T(80521381, T(80520017, 27), T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43113809:3001:10000"
    }
  },
  [41012138006] = {
    id = 41012138006,
    des = function()
      return T(80521381, T(80520017, 30), T(80520011, 2))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43113811:3001:10000"
    }
  },
  [41013138001] = {
    id = 41013138001,
    des = function()
      return T(80531381, T(80520017, 2100), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001381:42313800",
      "12001382:42313800"
    },
    target_type = 2001,
    damage_rate = 210000,
    buff_list = {
      "43213801:1000:10000"
    },
    tag_id = 101
  },
  [41013138002] = {
    id = 41013138002,
    des = function()
      return T(80531381, T(80520017, 2200), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001381:42313800",
      "12001382:42313800"
    },
    target_type = 2001,
    damage_rate = 220000,
    buff_list = {
      "43213802:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 101
  },
  [41013138003] = {
    id = 41013138003,
    des = function()
      return T(80531381, T(80520017, 2300), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001381:42313800",
      "12001382:42313800"
    },
    target_type = 2001,
    damage_rate = 230000,
    buff_list = {
      "43213803:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 3,
    tag_id = 101
  },
  [41013138004] = {
    id = 41013138004,
    des = function()
      return T(80531381, T(80520017, 2400), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001381:42313800",
      "12001382:42313800"
    },
    target_type = 2001,
    damage_rate = 240000,
    buff_list = {
      "43213804:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020015:2"
    },
    need_quality_level = 3,
    tag_id = 101
  },
  [41013138005] = {
    id = 41013138005,
    des = function()
      return T(80531381, T(80520017, 2500), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001381:42313800",
      "12001382:42313800"
    },
    target_type = 2001,
    damage_rate = 250000,
    buff_list = {
      "43213805:1000:10000"
    },
    tag_id = 101
  },
  [41013138006] = {
    id = 41013138006,
    des = function()
      return T(80531381, T(80520017, 2600), T(80520011, 3))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001381:42313800",
      "12001382:42313800"
    },
    target_type = 2001,
    damage_rate = 260000,
    buff_list = {
      "43213806:1000:10000"
    },
    tag_id = 101
  },
  [41014138001] = {
    id = 41014138001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015138001] = {
    id = 41015138001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012138:1", "41013138:1"}
  },
  [41016138001] = {
    id = 41016138001,
    des = function()
      return T(80561381, T(80520012, 600))
    end,
    fashion_show_ids = {
      "12001381:42413800",
      "12001382:42413800"
    },
    target_type = 1003,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 60000,
    bullet_speed = 1050,
    association_des = function()
      return T(80561381, T(80520012, 600))
    end
  },
  [41017138001] = {
    id = 41017138001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018138001] = {
    id = 41018138001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012138:2", "41013138:2"}
  },
  [41001138001] = {
    id = 41001138001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001138002] = {
    id = 41001138002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001138003] = {
    id = 41001138003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41002138001] = {
    id = 41002138001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002138002] = {
    id = 41002138002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002138003] = {
    id = 41002138003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41003138001] = {
    id = 41003138001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003138002] = {
    id = 41003138002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003138003] = {
    id = 41003138003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41019138001] = {
    id = 41019138001,
    des = function()
      return T(80591381, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413801:3002:10000"
    }
  },
  [41011140001] = {
    id = 41011140001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001401:42114000",
      "12001402:42114000",
      "12001403:42114002"
    },
    damage_rate = 7000,
    bullet_speed = 800
  },
  [41011140002] = {
    id = 41011140002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001401:42114000",
      "12001402:42114000",
      "12001403:42114002"
    },
    damage_rate = 8000,
    bullet_speed = 800,
    cost = {
      "1:21040001:1"
    }
  },
  [41011140003] = {
    id = 41011140003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001401:42114000",
      "12001402:42114000",
      "12001403:42114002"
    },
    damage_rate = 9000,
    bullet_speed = 800,
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 1
  },
  [41011140004] = {
    id = 41011140004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001401:42114000",
      "12001402:42114000",
      "12001403:42114002"
    },
    damage_rate = 10000,
    bullet_speed = 800,
    cost = {
      "1:21040003:2",
      "1:21020024:2"
    },
    need_quality_level = 2
  },
  [41012140001] = {
    id = 41012140001,
    des = function()
      return T(80521401, T(80520011, 3), T(80520019, "3.6"), T(80520018, 300))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114001:3013:10000",
      "43314002:3222:10000"
    }
  },
  [41012140002] = {
    id = 41012140002,
    des = function()
      return T(80521401, T(80520011, 3), T(80520019, "3.9"), T(80520018, 340))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114002:3013:10000",
      "43314002:3222:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012140003] = {
    id = 41012140003,
    des = function()
      return T(80521401, T(80520011, 3), T(80520019, "4.2"), T(80520018, 380))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114003:3013:10000",
      "43314002:3222:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41012140004] = {
    id = 41012140004,
    des = function()
      return T(80521401, T(80520011, 3), T(80520019, "4.5"), T(80520018, 420))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114004:3013:10000",
      "43314002:3222:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020024:2"
    },
    need_quality_level = 3
  },
  [41012140005] = {
    id = 41012140005,
    des = function()
      return T(80521401, T(80520011, 3), T(80520019, "4.8"), T(80520018, 460))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114005:3013:10000",
      "43314002:3222:10000"
    }
  },
  [41012140006] = {
    id = 41012140006,
    des = function()
      return T(80521401, T(80520011, 3), T(80520019, "5"), T(80520018, 500))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114006:3013:10000",
      "43314002:3222:10000"
    }
  },
  [41013140001] = {
    id = 41013140001,
    des = function()
      return T(80531401, T(80520017, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001401:42314000",
      "12001402:42314000",
      "12001403:42314002"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214001:3001:10000"
    },
    tag_id = 414
  },
  [41013140002] = {
    id = 41013140002,
    des = function()
      return T(80531401, T(80520017, 22))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001401:42314000",
      "12001402:42314000",
      "12001403:42314002"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214002:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 414
  },
  [41013140003] = {
    id = 41013140003,
    des = function()
      return T(80531401, T(80520017, 24))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001401:42314000",
      "12001402:42314000",
      "12001403:42314002"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214003:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 3,
    tag_id = 414
  },
  [41013140004] = {
    id = 41013140004,
    des = function()
      return T(80531401, T(80520017, 26))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001401:42314000",
      "12001402:42314000",
      "12001403:42314002"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214004:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020024:2"
    },
    need_quality_level = 3,
    tag_id = 414
  },
  [41013140005] = {
    id = 41013140005,
    des = function()
      return T(80531401, T(80520017, 28))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001401:42314000",
      "12001402:42314000",
      "12001403:42314002"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214005:3001:10000"
    },
    tag_id = 414
  },
  [41013140006] = {
    id = 41013140006,
    des = function()
      return T(80531401, T(80520017, 30))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001401:42314000",
      "12001402:42314000",
      "12001403:42314002"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214006:3001:10000"
    },
    tag_id = 414
  },
  [41014140001] = {
    id = 41014140001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 626))
    end,
    add_attr = {
      "1:40000102:626"
    }
  },
  [41015140001] = {
    id = 41015140001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012140:1", "41013140:1"}
  },
  [41016140001] = {
    id = 41016140001,
    des = function()
      return T(80561401, T(80520012, 20), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43314001:3001:10000"
    },
    association_des = function()
      return T(80561401, T(80520012, 20), T(80520011, 5))
    end
  },
  [41017140001] = {
    id = 41017140001,
    des = function()
      return T(80570001, T(80520014, T(80000302)), T(80520012, 16))
    end,
    add_attr = {
      "1:40000316:-1600"
    }
  },
  [41018140001] = {
    id = 41018140001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012140:2", "41013140:2"}
  },
  [41001140001] = {
    id = 41001140001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001140002] = {
    id = 41001140002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001140003] = {
    id = 41001140003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 2
  },
  [41002140001] = {
    id = 41002140001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002140002] = {
    id = 41002140002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002140003] = {
    id = 41002140003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 3
  },
  [41003140001] = {
    id = 41003140001,
    des = function()
      return T(80520016, T(80000102), 384)
    end,
    add_attr = {
      "1:40000102:384"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003140002] = {
    id = 41003140002,
    des = function()
      return T(80520016, T(80000102), 768)
    end,
    add_attr = {
      "1:40000102:768"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003140003] = {
    id = 41003140003,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 3
  },
  [41019140001] = {
    id = 41019140001,
    des = function()
      return T(80591401, T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414001:3002:10000"
    }
  },
  [41011141001] = {
    id = 41011141001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001411:42114100",
      "12001412:42114100"
    },
    damage_rate = 7000
  },
  [41011141002] = {
    id = 41011141002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001411:42114100",
      "12001412:42114100"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011141003] = {
    id = 41011141003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001411:42114100",
      "12001412:42114100"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 1
  },
  [41011141004] = {
    id = 41011141004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001411:42114100",
      "12001412:42114100"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 2
  },
  [41012141001] = {
    id = 41012141001,
    des = function()
      return T(80521411, T(80520011, 3), T(80520017, 10), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114101:3001:10000"
    }
  },
  [41012141002] = {
    id = 41012141002,
    des = function()
      return T(80521411, T(80520011, 3), T(80520017, 12), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114102:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012141003] = {
    id = 41012141003,
    des = function()
      return T(80521411, T(80520011, 3), T(80520017, 14), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114103:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41012141004] = {
    id = 41012141004,
    des = function()
      return T(80521411, T(80520011, 3), T(80520017, 16), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114104:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 3
  },
  [41012141005] = {
    id = 41012141005,
    des = function()
      return T(80521411, T(80520011, 3), T(80520017, 18), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114105:3001:10000"
    }
  },
  [41012141006] = {
    id = 41012141006,
    des = function()
      return T(80521411, T(80520011, 3), T(80520017, 20), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 0,
    buff_list = {
      "43114106:3001:10000"
    }
  },
  [41013141001] = {
    id = 41013141001,
    des = function()
      return T(80531411, T(80520017, 2000), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001411:42314100",
      "12001412:42314100"
    },
    target_type = 2001,
    damage_rate = 200000,
    buff_list = {
      "43214101:2054:10000:1004101"
    },
    tag_id = 301
  },
  [41013141002] = {
    id = 41013141002,
    des = function()
      return T(80531411, T(80520017, 2100), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001411:42314100",
      "12001412:42314100"
    },
    target_type = 2001,
    damage_rate = 210000,
    buff_list = {
      "43214102:2054:10000:1004101"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 301
  },
  [41013141003] = {
    id = 41013141003,
    des = function()
      return T(80531411, T(80520017, 2200), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001411:42314100",
      "12001412:42314100"
    },
    target_type = 2001,
    damage_rate = 220000,
    buff_list = {
      "43214103:2054:10000:1004101"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 3,
    tag_id = 301
  },
  [41013141004] = {
    id = 41013141004,
    des = function()
      return T(80531411, T(80520017, 2300), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001411:42314100",
      "12001412:42314100"
    },
    target_type = 2001,
    damage_rate = 230000,
    buff_list = {
      "43214104:2054:10000:1004101"
    },
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 3,
    tag_id = 301
  },
  [41013141005] = {
    id = 41013141005,
    des = function()
      return T(80531411, T(80520017, 2400), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001411:42314100",
      "12001412:42314100"
    },
    target_type = 2001,
    damage_rate = 240000,
    buff_list = {
      "43214105:2054:10000:1004101"
    },
    tag_id = 301
  },
  [41013141006] = {
    id = 41013141006,
    des = function()
      return T(80531411, T(80520017, 2500), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001411:42314100",
      "12001412:42314100"
    },
    target_type = 2001,
    damage_rate = 250000,
    buff_list = {
      "43214106:2054:10000:1004101"
    },
    tag_id = 301
  },
  [41014141001] = {
    id = 41014141001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 751))
    end,
    add_attr = {
      "1:40000102:751"
    }
  },
  [41015141001] = {
    id = 41015141001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012141:1", "41013141:1"}
  },
  [41016141001] = {
    id = 41016141001,
    des = function()
      return T(80561411, T(80520012, 8))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43314101:3001:10000"
    },
    association_des = function()
      return T(80561411, T(80520012, 8))
    end
  },
  [41017141001] = {
    id = 41017141001,
    des = function()
      return T(80570001, T(80520014, T(80000102)), T(80520011, 1153))
    end,
    add_attr = {
      "1:40000102:1153"
    }
  },
  [41018141001] = {
    id = 41018141001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012141:2", "41013141:2"}
  },
  [41001141001] = {
    id = 41001141001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001141002] = {
    id = 41001141002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001141003] = {
    id = 41001141003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41002141001] = {
    id = 41002141001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002141002] = {
    id = 41002141002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002141003] = {
    id = 41002141003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41003141001] = {
    id = 41003141001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003141002] = {
    id = 41003141002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003141003] = {
    id = 41003141003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41019141001] = {
    id = 41019141001,
    des = function()
      return T(80591411, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414101:3002:10000"
    }
  },
  [41011142001] = {
    id = 41011142001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001421:42114200",
      "12001422:42114200"
    },
    damage_rate = 7000
  },
  [41011142002] = {
    id = 41011142002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001421:42114200",
      "12001422:42114200"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011142003] = {
    id = 41011142003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001421:42114200",
      "12001422:42114200"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 1
  },
  [41011142004] = {
    id = 41011142004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001421:42114200",
      "12001422:42114200"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 2
  },
  [41012142001] = {
    id = 41012142001,
    des = function()
      return T(80521421, T(80520012, 30), T(80520017, 90), T(80520012, 25), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114201:3001:10000"
    }
  },
  [41012142002] = {
    id = 41012142002,
    des = function()
      return T(80521421, T(80520012, 30), T(80520017, 100), T(80520012, 25), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114204:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012142003] = {
    id = 41012142003,
    des = function()
      return T(80521421, T(80520012, 30), T(80520017, 110), T(80520012, 25), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114207:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41012142004] = {
    id = 41012142004,
    des = function()
      return T(80521421, T(80520012, 30), T(80520017, 120), T(80520012, 25), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114210:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 3
  },
  [41012142005] = {
    id = 41012142005,
    des = function()
      return T(80521421, T(80520012, 30), T(80520017, 130), T(80520012, 25), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114213:3001:10000"
    }
  },
  [41012142006] = {
    id = 41012142006,
    des = function()
      return T(80521421, T(80520012, 30), T(80520017, 140), T(80520012, 25), T(80520012, 10), T(80520011, 4))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114216:3001:10000"
    }
  },
  [41013142001] = {
    id = 41013142001,
    des = function()
      return T(80531421, T(80520017, 750), T(80520017, 100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001421:42314200",
      "12001422:42314200"
    },
    target_type = 2001,
    damage_rate = 75000,
    buff_list = {
      "43214201:3001:10000"
    },
    tag_id = 105
  },
  [41013142002] = {
    id = 41013142002,
    des = function()
      return T(80531421, T(80520017, 800), T(80520017, 120))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001421:42314200",
      "12001422:42314200"
    },
    target_type = 2001,
    damage_rate = 80000,
    buff_list = {
      "43214202:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013142003] = {
    id = 41013142003,
    des = function()
      return T(80531421, T(80520017, 850), T(80520017, 140))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001421:42314200",
      "12001422:42314200"
    },
    target_type = 2001,
    damage_rate = 85000,
    buff_list = {
      "43214203:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013142004] = {
    id = 41013142004,
    des = function()
      return T(80531421, T(80520017, 900), T(80520017, 160))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001421:42314200",
      "12001422:42314200"
    },
    target_type = 2001,
    damage_rate = 90000,
    buff_list = {
      "43214204:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013142005] = {
    id = 41013142005,
    des = function()
      return T(80531421, T(80520017, 950), T(80520017, 180))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001421:42314200",
      "12001422:42314200"
    },
    target_type = 2001,
    damage_rate = 95000,
    buff_list = {
      "43214205:3001:10000"
    },
    tag_id = 105
  },
  [41013142006] = {
    id = 41013142006,
    des = function()
      return T(80531421, T(80520017, 1000), T(80520017, 200))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001421:42314200",
      "12001422:42314200"
    },
    target_type = 2001,
    damage_rate = 100000,
    buff_list = {
      "43214206:3001:10000"
    },
    tag_id = 105
  },
  [41014142001] = {
    id = 41014142001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015142001] = {
    id = 41015142001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012142:1", "41013142:1"}
  },
  [41016142001] = {
    id = 41016142001,
    des = function()
      return T(80561421, T(80520012, 15), T(80520011, 80))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43314201:2051:10000:1004201"
    },
    association_des = function()
      return T(80561421, T(80520012, 15), T(80520011, 80))
    end
  },
  [41017142001] = {
    id = 41017142001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018142001] = {
    id = 41018142001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012142:2", "41013142:2"}
  },
  [41001142001] = {
    id = 41001142001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001142002] = {
    id = 41001142002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001142003] = {
    id = 41001142003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41002142001] = {
    id = 41002142001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002142002] = {
    id = 41002142002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002142003] = {
    id = 41002142003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41003142001] = {
    id = 41003142001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003142002] = {
    id = 41003142002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003142003] = {
    id = 41003142003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41019142001] = {
    id = 41019142001,
    des = function()
      return T(80591421, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414201:3002:10000"
    }
  },
  [41011143001] = {
    id = 41011143001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001431:42114300",
      "12001432:42114300"
    },
    damage_rate = 7000
  },
  [41011143002] = {
    id = 41011143002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001431:42114300",
      "12001432:42114300"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011143003] = {
    id = 41011143003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001431:42114300",
      "12001432:42114300"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 1
  },
  [41011143004] = {
    id = 41011143004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001431:42114300",
      "12001432:42114300"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 2
  },
  [41012143001] = {
    id = 41012143001,
    des = function()
      return T(80521431, T(80520017, 55), T(80520012, 100), T(80520012, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114301:3001:10000"
    },
    association_des = function()
      return T(80561432)
    end
  },
  [41012143002] = {
    id = 41012143002,
    des = function()
      return T(80521431, T(80520017, 60), T(80520012, 100), T(80520012, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114308:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012143003] = {
    id = 41012143003,
    des = function()
      return T(80521431, T(80520017, 65), T(80520012, 100), T(80520012, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114315:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41012143004] = {
    id = 41012143004,
    des = function()
      return T(80521431, T(80520017, 70), T(80520012, 100), T(80520012, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114322:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 3
  },
  [41012143005] = {
    id = 41012143005,
    des = function()
      return T(80521431, T(80520017, 75), T(80520012, 100), T(80520012, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114329:3001:10000"
    }
  },
  [41012143006] = {
    id = 41012143006,
    des = function()
      return T(80521431, T(80520017, 80), T(80520012, 100), T(80520012, 5), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114336:3001:10000"
    }
  },
  [41013143001] = {
    id = 41013143001,
    des = function()
      return T(80531431, T(80520017, 550), T(80520012, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001431:42314300",
      "12001432:42314300"
    },
    target_type = 2001,
    damage_rate = 55000,
    buff_list = {
      "43214301:3001:10000",
      "43214303:3001:10000"
    },
    association_des = function()
      return T(80561433)
    end,
    tag_id = 102
  },
  [41013143002] = {
    id = 41013143002,
    des = function()
      return T(80531431, T(80520017, 600), T(80520012, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001431:42314300",
      "12001432:42314300"
    },
    target_type = 2001,
    damage_rate = 60000,
    buff_list = {
      "43214301:3001:10000",
      "43214303:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 102
  },
  [41013143003] = {
    id = 41013143003,
    des = function()
      return T(80531431, T(80520017, 650), T(80520012, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001431:42314300",
      "12001432:42314300"
    },
    target_type = 2001,
    damage_rate = 65000,
    buff_list = {
      "43214301:3001:10000",
      "43214303:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 3,
    tag_id = 102
  },
  [41013143004] = {
    id = 41013143004,
    des = function()
      return T(80531431, T(80520017, 700), T(80520012, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001431:42314300",
      "12001432:42314300"
    },
    target_type = 2001,
    damage_rate = 70000,
    buff_list = {
      "43214301:3001:10000",
      "43214303:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 3,
    tag_id = 102
  },
  [41013143005] = {
    id = 41013143005,
    des = function()
      return T(80531431, T(80520017, 750), T(80520012, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001431:42314300",
      "12001432:42314300"
    },
    target_type = 2001,
    damage_rate = 75000,
    buff_list = {
      "43214301:3001:10000",
      "43214303:3001:10000"
    },
    tag_id = 102
  },
  [41013143006] = {
    id = 41013143006,
    des = function()
      return T(80531431, T(80520017, 800), T(80520012, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001431:42314300",
      "12001432:42314300"
    },
    target_type = 2001,
    damage_rate = 80000,
    buff_list = {
      "43214301:3001:10000",
      "43214303:3001:10000"
    },
    tag_id = 102
  },
  [41014143001] = {
    id = 41014143001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015143001] = {
    id = 41015143001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012143:1", "41013143:1"}
  },
  [41016143001] = {
    id = 41016143001,
    des = function()
      return T(80561431)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43314301:3001:10000"
    }
  },
  [41017143001] = {
    id = 41017143001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018143001] = {
    id = 41018143001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012143:2", "41013143:2"}
  },
  [41001143001] = {
    id = 41001143001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001143002] = {
    id = 41001143002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001143003] = {
    id = 41001143003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41002143001] = {
    id = 41002143001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002143002] = {
    id = 41002143002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002143003] = {
    id = 41002143003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41003143001] = {
    id = 41003143001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003143002] = {
    id = 41003143002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003143003] = {
    id = 41003143003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41019143001] = {
    id = 41019143001,
    des = function()
      return T(80591431, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414301:3002:10000"
    }
  },
  [41011145001] = {
    id = 41011145001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001451:42114500",
      "12001452:42114500",
      "12001453:42114502"
    },
    damage_rate = 7000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114502:0:3000",
      "43114504:0:3000",
      "43114506:0:3000",
      "43114508:0:3000",
      "43114510:0:3000",
      "43114512:0:3000"
    }
  },
  [41011145002] = {
    id = 41011145002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001451:42114500",
      "12001452:42114500",
      "12001453:42114502"
    },
    damage_rate = 8000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114502:0:3000",
      "43114504:0:3000",
      "43114506:0:3000",
      "43114508:0:3000",
      "43114510:0:3000",
      "43114512:0:3000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011145003] = {
    id = 41011145003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001451:42114500",
      "12001452:42114500",
      "12001453:42114502"
    },
    damage_rate = 9000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114502:0:3000",
      "43114504:0:3000",
      "43114506:0:3000",
      "43114508:0:3000",
      "43114510:0:3000",
      "43114512:0:3000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 1
  },
  [41011145004] = {
    id = 41011145004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001451:42114500",
      "12001452:42114500",
      "12001453:42114502"
    },
    damage_rate = 10000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114502:0:3000",
      "43114504:0:3000",
      "43114506:0:3000",
      "43114508:0:3000",
      "43114510:0:3000",
      "43114512:0:3000"
    },
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 2
  },
  [41012145001] = {
    id = 41012145001,
    des = function()
      return T(80521451, T(80520012, 30), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114501:3001:10000"
    }
  },
  [41012145002] = {
    id = 41012145002,
    des = function()
      return T(80521451, T(80520012, 30), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114503:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012145003] = {
    id = 41012145003,
    des = function()
      return T(80521451, T(80520012, 30), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114505:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 2
  },
  [41012145004] = {
    id = 41012145004,
    des = function()
      return T(80521451, T(80520012, 30), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114507:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 3
  },
  [41012145005] = {
    id = 41012145005,
    des = function()
      return T(80521451, T(80520012, 30), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114509:3001:10000"
    }
  },
  [41012145006] = {
    id = 41012145006,
    des = function()
      return T(80521451, T(80520012, 30), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114511:3001:10000"
    }
  },
  [41013145001] = {
    id = 41013145001,
    des = function()
      return T(80531451, T(80520017, 2050), T(80520011, 7), T(80520012, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001451:42314500",
      "12001452:42314500",
      "12001453:42314502"
    },
    target_type = 2001,
    damage_rate = 205000,
    buff_list = {
      "43214501:1000:10000:1004501",
      "43214502:1000:10000:1004501"
    },
    tag_id = 103
  },
  [41013145002] = {
    id = 41013145002,
    des = function()
      return T(80531451, T(80520017, 2200), T(80520011, 7), T(80520012, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001451:42314500",
      "12001452:42314500",
      "12001453:42314502"
    },
    target_type = 2001,
    damage_rate = 220000,
    buff_list = {
      "43214501:1000:10000:1004501",
      "43214502:1000:10000:1004501"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 103
  },
  [41013145003] = {
    id = 41013145003,
    des = function()
      return T(80531451, T(80520017, 2350), T(80520011, 7), T(80520012, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001451:42314500",
      "12001452:42314500",
      "12001453:42314502"
    },
    target_type = 2001,
    damage_rate = 235000,
    buff_list = {
      "43214501:1000:10000:1004501",
      "43214502:1000:10000:1004501"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 3,
    tag_id = 103
  },
  [41013145004] = {
    id = 41013145004,
    des = function()
      return T(80531451, T(80520017, 2500), T(80520011, 7), T(80520012, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001451:42314500",
      "12001452:42314500",
      "12001453:42314502"
    },
    target_type = 2001,
    damage_rate = 250000,
    buff_list = {
      "43214501:1000:10000:1004501",
      "43214502:1000:10000:1004501"
    },
    cost = {
      "1:21040003:2",
      "1:21020025:3"
    },
    need_quality_level = 3,
    tag_id = 103
  },
  [41013145005] = {
    id = 41013145005,
    des = function()
      return T(80531451, T(80520017, 2650), T(80520011, 7), T(80520012, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001451:42314500",
      "12001452:42314500",
      "12001453:42314502"
    },
    target_type = 2001,
    damage_rate = 265000,
    buff_list = {
      "43214501:1000:10000:1004501",
      "43214502:1000:10000:1004501"
    },
    tag_id = 103
  },
  [41013145006] = {
    id = 41013145006,
    des = function()
      return T(80531451, T(80520017, 2800), T(80520011, 7), T(80520012, 20))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001451:42314500",
      "12001452:42314500",
      "12001453:42314502"
    },
    target_type = 2001,
    damage_rate = 280000,
    buff_list = {
      "43214501:1000:10000:1004501",
      "43214502:1000:10000:1004501"
    },
    tag_id = 103
  },
  [41014145001] = {
    id = 41014145001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015145001] = {
    id = 41015145001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012145:1", "41013145:1"}
  },
  [41016145001] = {
    id = 41016145001,
    des = function()
      return T(80561451, T(80520011, 7))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43314501:3001:10000"
    },
    association_des = function()
      return T(80561451, T(80520011, 7))
    end
  },
  [41017145001] = {
    id = 41017145001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018145001] = {
    id = 41018145001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012145:2", "41013145:2"}
  },
  [41001145001] = {
    id = 41001145001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001145002] = {
    id = 41001145002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001145003] = {
    id = 41001145003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41002145001] = {
    id = 41002145001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002145002] = {
    id = 41002145002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002145003] = {
    id = 41002145003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41003145001] = {
    id = 41003145001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003145002] = {
    id = 41003145002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003145003] = {
    id = 41003145003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41019145001] = {
    id = 41019145001,
    des = function()
      return T(80591451, T(80520012, 10), T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414501:3002:10000",
      "43414502:3002:10000"
    }
  },
  [41011146001] = {
    id = 41011146001,
    des = function()
      return T(80511461, T(80520017, 70), T(80520012, 25), T(80520012, 10), T(80520011, 3))
    end,
    fashion_show_ids = {
      "12001461:42114600",
      "12001462:42114600",
      "12001463:42114602"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43314602:0:3000",
      "43014601:0:10000"
    }
  },
  [41011146002] = {
    id = 41011146002,
    des = function()
      return T(80511461, T(80520017, 80), T(80520012, 25), T(80520012, 10), T(80520011, 3))
    end,
    fashion_show_ids = {
      "12001461:42114600",
      "12001462:42114600",
      "12001463:42114602"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43314602:0:3000",
      "43014601:0:10000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011146003] = {
    id = 41011146003,
    des = function()
      return T(80511461, T(80520017, 90), T(80520012, 25), T(80520012, 10), T(80520011, 3))
    end,
    fashion_show_ids = {
      "12001461:42114600",
      "12001462:42114600",
      "12001463:42114602"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43314602:0:3000",
      "43014601:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 1
  },
  [41011146004] = {
    id = 41011146004,
    des = function()
      return T(80511461, T(80520017, 100), T(80520012, 25), T(80520012, 10), T(80520011, 3))
    end,
    fashion_show_ids = {
      "12001461:42114600",
      "12001462:42114600",
      "12001463:42114602"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43314602:0:3000",
      "43014601:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:3"
    },
    need_quality_level = 2
  },
  [41012146001] = {
    id = 41012146001,
    des = function()
      return T(80521461, T(80520019, "17.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114601:3001:10000"
    }
  },
  [41012146002] = {
    id = 41012146002,
    des = function()
      return T(80521461, T(80520019, "18"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114603:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012146003] = {
    id = 41012146003,
    des = function()
      return T(80521461, T(80520019, "18.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114605:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41012146004] = {
    id = 41012146004,
    des = function()
      return T(80521461, T(80520019, "19"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114607:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:3"
    },
    need_quality_level = 3
  },
  [41012146005] = {
    id = 41012146005,
    des = function()
      return T(80521461, T(80520019, "19.5"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114609:3001:10000"
    }
  },
  [41012146006] = {
    id = 41012146006,
    des = function()
      return T(80521461, T(80520019, "20"), T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114611:3001:10000"
    }
  },
  [41013146001] = {
    id = 41013146001,
    des = function()
      return T(80531461, T(80520017, 100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001461:42314600",
      "12001462:42314600",
      "12001463:42314602"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214601:3001:10000",
      "43214602:3001:10000"
    },
    tag_id = 403
  },
  [41013146002] = {
    id = 41013146002,
    des = function()
      return T(80531461, T(80520017, 110))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001461:42314600",
      "12001462:42314600",
      "12001463:42314602"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214603:3001:10000",
      "43214602:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 403
  },
  [41013146003] = {
    id = 41013146003,
    des = function()
      return T(80531461, T(80520017, 120))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001461:42314600",
      "12001462:42314600",
      "12001463:42314602"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214604:3001:10000",
      "43214602:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 3,
    tag_id = 403
  },
  [41013146004] = {
    id = 41013146004,
    des = function()
      return T(80531461, T(80520017, 130))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001461:42314600",
      "12001462:42314600",
      "12001463:42314602"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214605:3001:10000",
      "43214602:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:3"
    },
    need_quality_level = 3,
    tag_id = 403
  },
  [41013146005] = {
    id = 41013146005,
    des = function()
      return T(80531461, T(80520017, 140))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001461:42314600",
      "12001462:42314600",
      "12001463:42314602"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214606:3001:10000",
      "43214602:3001:10000"
    },
    tag_id = 403
  },
  [41013146006] = {
    id = 41013146006,
    des = function()
      return T(80531461, T(80520017, 150))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001461:42314600",
      "12001462:42314600",
      "12001463:42314602"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43214607:3001:10000",
      "43214602:3001:10000"
    },
    tag_id = 403
  },
  [41014146001] = {
    id = 41014146001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015146001] = {
    id = 41015146001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012146:1", "41013146:1"}
  },
  [41016146001] = {
    id = 41016146001,
    des = function()
      return T(80561461, T(80520012, 30), T(80520012, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43314601:3001:10000"
    },
    association_des = function()
      return T(80561461, T(80520012, 30), T(80520012, 30))
    end
  },
  [41017146001] = {
    id = 41017146001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018146001] = {
    id = 41018146001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012146:2", "41013146:2"}
  },
  [41001146001] = {
    id = 41001146001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001146002] = {
    id = 41001146002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001146003] = {
    id = 41001146003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41002146001] = {
    id = 41002146001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002146002] = {
    id = 41002146002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002146003] = {
    id = 41002146003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41003146001] = {
    id = 41003146001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003146002] = {
    id = 41003146002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003146003] = {
    id = 41003146003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41019146001] = {
    id = 41019146001,
    des = function()
      return T(80591461, T(80520012, 10), T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414601:3002:10000",
      "43414602:3002:10000"
    }
  },
  [41011147001] = {
    id = 41011147001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001471:42114700",
      "12001472:42114700"
    },
    damage_rate = 7000
  },
  [41011147002] = {
    id = 41011147002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001471:42114700",
      "12001472:42114700"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011147003] = {
    id = 41011147003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001471:42114700",
      "12001472:42114700"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 1
  },
  [41011147004] = {
    id = 41011147004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001471:42114700",
      "12001472:42114700"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 2
  },
  [41012147001] = {
    id = 41012147001,
    des = function()
      return T(80521471, T(80520012, 5), T(80520017, 110), T(80520012, 10), T(80520011, 10), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114701:3001:10000",
      "43114704:3001:10000"
    }
  },
  [41012147002] = {
    id = 41012147002,
    des = function()
      return T(80521471, T(80520012, 5), T(80520017, 118), T(80520012, 10), T(80520011, 10), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114706:3001:10000",
      "43114709:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012147003] = {
    id = 41012147003,
    des = function()
      return T(80521471, T(80520012, 5), T(80520017, 126), T(80520012, 10), T(80520011, 10), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114711:3001:10000",
      "43114714:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41012147004] = {
    id = 41012147004,
    des = function()
      return T(80521471, T(80520012, 5), T(80520017, 134), T(80520012, 10), T(80520011, 10), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114716:3001:10000",
      "43114719:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 3
  },
  [41012147005] = {
    id = 41012147005,
    des = function()
      return T(80521471, T(80520012, 5), T(80520017, 142), T(80520012, 10), T(80520011, 10), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114721:3001:10000",
      "43114724:3001:10000"
    }
  },
  [41012147006] = {
    id = 41012147006,
    des = function()
      return T(80521471, T(80520012, 5), T(80520017, 180), T(80520012, 10), T(80520011, 10), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114726:3001:10000",
      "43114729:3001:10000"
    }
  },
  [41013147001] = {
    id = 41013147001,
    des = function()
      return T(80531471, T(80520017, 550), T(80520017, 30), T(80520011, 4))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001471:42314700",
      "12001472:42314700"
    },
    target_type = 2041,
    damage_rate = 55000,
    buff_list = {
      "43214701:1000:10000"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 205
  },
  [41013147002] = {
    id = 41013147002,
    des = function()
      return T(80531471, T(80520017, 600), T(80520017, 34), T(80520011, 4))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001471:42314700",
      "12001472:42314700"
    },
    target_type = 2041,
    damage_rate = 60000,
    buff_list = {
      "43214702:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 205
  },
  [41013147003] = {
    id = 41013147003,
    des = function()
      return T(80531471, T(80520017, 650), T(80520017, 38), T(80520011, 4))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001471:42314700",
      "12001472:42314700"
    },
    target_type = 2041,
    damage_rate = 65000,
    buff_list = {
      "43214703:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 205
  },
  [41013147004] = {
    id = 41013147004,
    des = function()
      return T(80531471, T(80520017, 700), T(80520017, 42), T(80520011, 4))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001471:42314700",
      "12001472:42314700"
    },
    target_type = 2041,
    damage_rate = 70000,
    buff_list = {
      "43214704:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 205
  },
  [41013147005] = {
    id = 41013147005,
    des = function()
      return T(80531471, T(80520017, 750), T(80520017, 46), T(80520011, 4))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001471:42314700",
      "12001472:42314700"
    },
    target_type = 2041,
    damage_rate = 75000,
    buff_list = {
      "43214705:1000:10000"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 205
  },
  [41013147006] = {
    id = 41013147006,
    des = function()
      return T(80531471, T(80520017, 800), T(80520017, 50), T(80520011, 4))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001471:42314700",
      "12001472:42314700"
    },
    target_type = 2041,
    damage_rate = 80000,
    buff_list = {
      "43214706:1000:10000"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 205
  },
  [41014147001] = {
    id = 41014147001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 80))
    end,
    add_attr = {
      "1:40000103:80"
    }
  },
  [41015147001] = {
    id = 41015147001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012147:1", "41013147:1"}
  },
  [41016147001] = {
    id = 41016147001,
    des = function()
      return T(80561471, T(80520012, 50), T(80520012, 15), T(80520012, 50), T(80520012, 8))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43314701:3001:10000"
    },
    association_des = function()
      return T(80561471, T(80520012, 50), T(80520012, 15), T(80520012, 50), T(80520012, 8))
    end
  },
  [41017147001] = {
    id = 41017147001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018147001] = {
    id = 41018147001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012147:2", "41013147:2"}
  },
  [41001147001] = {
    id = 41001147001,
    des = function()
      return T(80520016, T(80000104), 55)
    end,
    add_attr = {
      "1:40000104:55"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001147002] = {
    id = 41001147002,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001147003] = {
    id = 41001147003,
    des = function()
      return T(80520016, T(80000104), 165)
    end,
    add_attr = {
      "1:40000104:165"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41002147001] = {
    id = 41002147001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002147002] = {
    id = 41002147002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002147003] = {
    id = 41002147003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41003147001] = {
    id = 41003147001,
    des = function()
      return T(80520016, T(80000104), 55)
    end,
    add_attr = {
      "1:40000104:55"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003147002] = {
    id = 41003147002,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003147003] = {
    id = 41003147003,
    des = function()
      return T(80520016, T(80000104), 165)
    end,
    add_attr = {
      "1:40000104:165"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41019147001] = {
    id = 41019147001,
    des = function()
      return T(80591471, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414701:3002:10000"
    }
  },
  [41011148001] = {
    id = 41011148001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001481:42114800",
      "12001482:42114800"
    },
    damage_rate = 7000
  },
  [41011148002] = {
    id = 41011148002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001481:42114800",
      "12001482:42114800"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011148003] = {
    id = 41011148003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001481:42114800",
      "12001482:42114800"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 1
  },
  [41011148004] = {
    id = 41011148004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001481:42114800",
      "12001482:42114800"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020023:3"
    },
    need_quality_level = 2
  },
  [41012148001] = {
    id = 41012148001,
    des = function()
      return T(80521481, T(80520011, 2), T(80520017, 90), T(80520019, 2.5), T(80520018, 5), T(80520011, 6))
    end,
    fashion_show_ids = {
      "12001481:42214800",
      "12001482:42214800"
    },
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 9000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114801:0:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [41012148002] = {
    id = 41012148002,
    des = function()
      return T(80521481, T(80520011, 2), T(80520017, 100), T(80520019, 3), T(80520018, 6), T(80520011, 6))
    end,
    fashion_show_ids = {
      "12001481:42214800",
      "12001482:42214800"
    },
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 10000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114804:0:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [41012148003] = {
    id = 41012148003,
    des = function()
      return T(80521481, T(80520011, 2), T(80520017, 110), T(80520019, 3.5), T(80520018, 7), T(80520011, 6))
    end,
    fashion_show_ids = {
      "12001481:42214800",
      "12001482:42214800"
    },
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 11000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114807:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [41012148004] = {
    id = 41012148004,
    des = function()
      return T(80521481, T(80520011, 2), T(80520017, 120), T(80520019, 4), T(80520018, 8), T(80520011, 6))
    end,
    fashion_show_ids = {
      "12001481:42214800",
      "12001482:42214800"
    },
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 12000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114810:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020023:3"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [41012148005] = {
    id = 41012148005,
    des = function()
      return T(80521481, T(80520011, 2), T(80520017, 130), T(80520019, 4.5), T(80520018, 9), T(80520011, 6))
    end,
    fashion_show_ids = {
      "12001481:42214800",
      "12001482:42214800"
    },
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 13000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114813:0:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [41012148006] = {
    id = 41012148006,
    des = function()
      return T(80521481, T(80520011, 2), T(80520017, 140), T(80520019, 5), T(80520018, 10), T(80520011, 6))
    end,
    fashion_show_ids = {
      "12001481:42214800",
      "12001482:42214800"
    },
    target_type = 2001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {3},
    damage_rate = 14000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43114816:0:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [41013148001] = {
    id = 41013148001,
    des = function()
      return T(80531481, T(80520011, 3), T(80520017, 500), T(80520017, 35))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001481:42314800",
      "12001482:42314800"
    },
    target_type = 2583,
    damage_rate = 50000,
    buff_list = {
      "43214801:3001:10000",
      "43214802:3001:10000"
    },
    tag_id = 304,
    bomb_delay_frame = 32,
    bomb_interval_frame = 10
  },
  [41013148002] = {
    id = 41013148002,
    des = function()
      return T(80531481, T(80520011, 3), T(80520017, 550), T(80520017, 45))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001481:42314800",
      "12001482:42314800"
    },
    target_type = 2583,
    damage_rate = 55000,
    buff_list = {
      "43214803:3001:10000",
      "43214804:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 304,
    bomb_delay_frame = 32,
    bomb_interval_frame = 10
  },
  [41013148003] = {
    id = 41013148003,
    des = function()
      return T(80531481, T(80520011, 3), T(80520017, 600), T(80520017, 55))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001481:42314800",
      "12001482:42314800"
    },
    target_type = 2583,
    damage_rate = 60000,
    buff_list = {
      "43214805:3001:10000",
      "43214806:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020010:2"
    },
    need_quality_level = 3,
    tag_id = 304,
    bomb_delay_frame = 32,
    bomb_interval_frame = 10
  },
  [41013148004] = {
    id = 41013148004,
    des = function()
      return T(80531481, T(80520011, 3), T(80520017, 650), T(80520017, 65))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001481:42314800",
      "12001482:42314800"
    },
    target_type = 2583,
    damage_rate = 65000,
    buff_list = {
      "43214807:3001:10000",
      "43214808:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020023:3"
    },
    need_quality_level = 3,
    tag_id = 304,
    bomb_delay_frame = 32,
    bomb_interval_frame = 10
  },
  [41013148005] = {
    id = 41013148005,
    des = function()
      return T(80531481, T(80520011, 3), T(80520017, 700), T(80520017, 75))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001481:42314800",
      "12001482:42314800"
    },
    target_type = 2583,
    damage_rate = 70000,
    buff_list = {
      "43214809:3001:10000",
      "43214810:3001:10000"
    },
    tag_id = 304,
    bomb_delay_frame = 32,
    bomb_interval_frame = 10
  },
  [41013148006] = {
    id = 41013148006,
    des = function()
      return T(80531481, T(80520011, 3), T(80520017, 750), T(80520017, 85))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001481:42314800",
      "12001482:42314800"
    },
    target_type = 2583,
    damage_rate = 75000,
    buff_list = {
      "43214811:3001:10000",
      "43214812:3001:10000"
    },
    tag_id = 304,
    bomb_delay_frame = 32,
    bomb_interval_frame = 10
  },
  [41014148001] = {
    id = 41014148001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 80))
    end,
    add_attr = {
      "1:40000103:80"
    }
  },
  [41015148001] = {
    id = 41015148001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012148:1", "41013148:1"}
  },
  [41016148001] = {
    id = 41016148001,
    des = function()
      return T(80561481, T(80520012, 15))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43314801:3001:10000"
    },
    association_des = function()
      return T(80561481, T(80520012, 15))
    end
  },
  [41017148001] = {
    id = 41017148001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018148001] = {
    id = 41018148001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012148:2", "41013148:2"}
  },
  [41001148001] = {
    id = 41001148001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001148002] = {
    id = 41001148002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001148003] = {
    id = 41001148003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41002148001] = {
    id = 41002148001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002148002] = {
    id = 41002148002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002148003] = {
    id = 41002148003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41003148001] = {
    id = 41003148001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003148002] = {
    id = 41003148002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003148003] = {
    id = 41003148003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020030:2"
    },
    need_quality_level = 3
  },
  [41019148001] = {
    id = 41019148001,
    des = function()
      return T(80591481, T(80520012, 7), T(80520012, 7))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414801:3002:10000",
      "43414802:3002:10000"
    }
  },
  [41011149001] = {
    id = 41011149001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001491:42114900",
      "12001492:42114900"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43114902:0:3000",
      "43114909:0:3000",
      "43114916:0:3000",
      "43114923:0:3000",
      "43114930:0:3000",
      "43114937:0:3000",
      "43114903:0:10000",
      "43114910:0:10000",
      "43114917:0:10000",
      "43114924:0:10000",
      "43114931:0:10000",
      "43114938:0:10000"
    }
  },
  [41011149002] = {
    id = 41011149002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001491:42114900",
      "12001492:42114900"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43114902:0:3000",
      "43114909:0:3000",
      "43114916:0:3000",
      "43114923:0:3000",
      "43114930:0:3000",
      "43114937:0:3000",
      "43114903:0:10000",
      "43114910:0:10000",
      "43114917:0:10000",
      "43114924:0:10000",
      "43114931:0:10000",
      "43114938:0:10000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011149003] = {
    id = 41011149003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001491:42114900",
      "12001492:42114900"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43114902:0:3000",
      "43114909:0:3000",
      "43114916:0:3000",
      "43114923:0:3000",
      "43114930:0:3000",
      "43114937:0:3000",
      "43114903:0:10000",
      "43114910:0:10000",
      "43114917:0:10000",
      "43114924:0:10000",
      "43114931:0:10000",
      "43114938:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 1
  },
  [41011149004] = {
    id = 41011149004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001491:42114900",
      "12001492:42114900"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43114902:0:3000",
      "43114909:0:3000",
      "43114916:0:3000",
      "43114923:0:3000",
      "43114930:0:3000",
      "43114937:0:3000",
      "43114903:0:10000",
      "43114910:0:10000",
      "43114917:0:10000",
      "43114924:0:10000",
      "43114931:0:10000",
      "43114938:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020021:3"
    },
    need_quality_level = 2
  },
  [41012149001] = {
    id = 41012149001,
    des = function()
      return T(80521491, T(80520012, 30), T(80520017, 90), T(80520012, 50), T(80520012, 5), T(80520011, 6))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114901:3001:10000"
    }
  },
  [41012149002] = {
    id = 41012149002,
    des = function()
      return T(80521491, T(80520012, 30), T(80520017, 100), T(80520012, 50), T(80520012, 5), T(80520011, 6))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114908:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012149003] = {
    id = 41012149003,
    des = function()
      return T(80521491, T(80520012, 30), T(80520017, 110), T(80520012, 50), T(80520012, 5), T(80520011, 6))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114915:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41012149004] = {
    id = 41012149004,
    des = function()
      return T(80521491, T(80520012, 30), T(80520017, 120), T(80520012, 50), T(80520012, 5), T(80520011, 6))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114922:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020021:3"
    },
    need_quality_level = 3
  },
  [41012149005] = {
    id = 41012149005,
    des = function()
      return T(80521491, T(80520012, 30), T(80520017, 130), T(80520012, 50), T(80520012, 5), T(80520011, 6))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114929:3001:10000"
    }
  },
  [41012149006] = {
    id = 41012149006,
    des = function()
      return T(80521491, T(80520012, 30), T(80520017, 140), T(80520012, 50), T(80520012, 5), T(80520011, 6))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43114936:3001:10000"
    }
  },
  [41013149001] = {
    id = 41013149001,
    des = function()
      return T(80531491, T(80520017, 750), T(80520011, 80), T(80520011, 800))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001491:42314900",
      "12001492:42314900"
    },
    target_type = 2331,
    damage_rate = 75000,
    range_type = 3,
    range_x = 800,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013149002] = {
    id = 41013149002,
    des = function()
      return T(80531491, T(80520017, 830), T(80520011, 80), T(80520011, 800))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001491:42314900",
      "12001492:42314900"
    },
    target_type = 2331,
    damage_rate = 83000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 3,
    range_x = 800,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013149003] = {
    id = 41013149003,
    des = function()
      return T(80531491, T(80520017, 910), T(80520011, 80), T(80520011, 800))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001491:42314900",
      "12001492:42314900"
    },
    target_type = 2331,
    damage_rate = 91000,
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 3,
    range_type = 3,
    range_x = 800,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013149004] = {
    id = 41013149004,
    des = function()
      return T(80531491, T(80520017, 990), T(80520011, 80), T(80520011, 800))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001491:42314900",
      "12001492:42314900"
    },
    target_type = 2331,
    damage_rate = 99000,
    cost = {
      "1:21040003:2",
      "1:21020021:3"
    },
    need_quality_level = 3,
    range_type = 3,
    range_x = 800,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013149005] = {
    id = 41013149005,
    des = function()
      return T(80531491, T(80520017, 1070), T(80520011, 80), T(80520011, 800))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001491:42314900",
      "12001492:42314900"
    },
    target_type = 2331,
    damage_rate = 107000,
    range_type = 3,
    range_x = 800,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41013149006] = {
    id = 41013149006,
    des = function()
      return T(80531491, T(80520017, 1150), T(80520011, 80), T(80520011, 800))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001491:42314900",
      "12001492:42314900"
    },
    target_type = 2331,
    damage_rate = 115000,
    range_type = 3,
    range_x = 800,
    range_y = 80,
    effect_change_range = 524,
    tag_id = 203
  },
  [41014149001] = {
    id = 41014149001,
    des = function()
      return T(80541491, T(80520014, T(80000103)), T(80520011, 40), T(80520011, 300))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43314901:3001:10000"
    },
    add_attr = {
      "1:40000103:40"
    },
    association_des = function()
      return T(80541492, T(80520011, 300))
    end
  },
  [41015149001] = {
    id = 41015149001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012149:1", "41013149:1"}
  },
  [41016149001] = {
    id = 41016149001,
    des = function()
      return T(80561491, T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43314902:3001:10000"
    },
    association_des = function()
      return T(80561491, T(80520012, 50))
    end
  },
  [41017149001] = {
    id = 41017149001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018149001] = {
    id = 41018149001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012149:2", "41013149:2"}
  },
  [41001149001] = {
    id = 41001149001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001149002] = {
    id = 41001149002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001149003] = {
    id = 41001149003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41002149001] = {
    id = 41002149001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002149002] = {
    id = 41002149002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002149003] = {
    id = 41002149003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41003149001] = {
    id = 41003149001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003149002] = {
    id = 41003149002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003149003] = {
    id = 41003149003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41019149001] = {
    id = 41019149001,
    des = function()
      return T(80591491, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43414901:3002:10000"
    }
  },
  [41011150001] = {
    id = 41011150001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001501:42115000",
      "12001502:42115000"
    },
    damage_rate = 7000
  },
  [41011150002] = {
    id = 41011150002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001501:42115000",
      "12001502:42115000"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011150003] = {
    id = 41011150003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001501:42115000",
      "12001502:42115000"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:1",
      "1:21020007:1"
    },
    need_quality_level = 1
  },
  [41011150004] = {
    id = 41011150004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001501:42115000",
      "12001502:42115000"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:1",
      "1:21020015:2"
    },
    need_quality_level = 2
  },
  [41012150001] = {
    id = 41012150001,
    des = function()
      return T(80521501, T(80520012, 30), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115001:3001:10000"
    }
  },
  [41012150002] = {
    id = 41012150002,
    des = function()
      return T(80521501, T(80520012, 30), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115003:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012150003] = {
    id = 41012150003,
    des = function()
      return T(80521501, T(80520012, 30), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115005:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020007:1"
    },
    need_quality_level = 2
  },
  [41012150004] = {
    id = 41012150004,
    des = function()
      return T(80521501, T(80520012, 30), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115007:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020015:2"
    },
    need_quality_level = 3
  },
  [41012150005] = {
    id = 41012150005,
    des = function()
      return T(80521501, T(80520012, 30), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115009:3001:10000"
    }
  },
  [41012150006] = {
    id = 41012150006,
    des = function()
      return T(80521501, T(80520012, 30), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115011:3001:10000"
    }
  },
  [41013150001] = {
    id = 41013150001,
    des = function()
      return T(80531501, T(80520017, 600), T(80520017, 10), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001501:42315000",
      "12001502:42315000"
    },
    target_type = 2001,
    damage_rate = 60000,
    buff_list = {
      "43215001:2041:10000:1005001",
      "43215002:2041:10000:1005001"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 201
  },
  [41013150002] = {
    id = 41013150002,
    des = function()
      return T(80531501, T(80520017, 640), T(80520017, 11), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001501:42315000",
      "12001502:42315000"
    },
    target_type = 2001,
    damage_rate = 64000,
    buff_list = {
      "43215003:2041:10000:1005001",
      "43215004:2041:10000:1005001"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 201
  },
  [41013150003] = {
    id = 41013150003,
    des = function()
      return T(80531501, T(80520017, 680), T(80520017, 12), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001501:42315000",
      "12001502:42315000"
    },
    target_type = 2001,
    damage_rate = 68000,
    buff_list = {
      "43215005:2041:10000:1005001",
      "43215006:2041:10000:1005001"
    },
    cost = {
      "1:21040002:1",
      "1:21020007:1"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 201
  },
  [41013150004] = {
    id = 41013150004,
    des = function()
      return T(80531501, T(80520017, 720), T(80520017, 13), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001501:42315000",
      "12001502:42315000"
    },
    target_type = 2001,
    damage_rate = 72000,
    buff_list = {
      "43215007:2041:10000:1005001",
      "43215008:2041:10000:1005001"
    },
    cost = {
      "1:21040003:1",
      "1:21020015:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 201
  },
  [41013150005] = {
    id = 41013150005,
    des = function()
      return T(80531501, T(80520017, 760), T(80520017, 14), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001501:42315000",
      "12001502:42315000"
    },
    target_type = 2001,
    damage_rate = 76000,
    buff_list = {
      "43215009:2041:10000:1005001",
      "43215010:2041:10000:1005001"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 201
  },
  [41013150006] = {
    id = 41013150006,
    des = function()
      return T(80531501, T(80520017, 800), T(80520017, 15), T(80520011, 5))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001501:42315000",
      "12001502:42315000"
    },
    target_type = 2001,
    damage_rate = 80000,
    buff_list = {
      "43215011:2041:10000:1005001",
      "43215012:2041:10000:1005001"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200,
    tag_id = 201
  },
  [41014150001] = {
    id = 41014150001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015150001] = {
    id = 41015150001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012150:1", "41013150:1"}
  },
  [41016150001] = {
    id = 41016150001,
    des = function()
      return T(80561501, T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43315001:3001:10000"
    },
    association_des = function()
      return T(80561501, T(80520011, 5))
    end
  },
  [41017150001] = {
    id = 41017150001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018150001] = {
    id = 41018150001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012150:2", "41013150:2"}
  },
  [41001150001] = {
    id = 41001150001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001150002] = {
    id = 41001150002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 1
  },
  [41001150003] = {
    id = 41001150003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020027:1"
    },
    need_quality_level = 2
  },
  [41002150001] = {
    id = 41002150001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002150002] = {
    id = 41002150002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 2
  },
  [41002150003] = {
    id = 41002150003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:1",
      "1:21020027:1"
    },
    need_quality_level = 3
  },
  [41003150001] = {
    id = 41003150001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003150002] = {
    id = 41003150002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020002:1"
    },
    need_quality_level = 3
  },
  [41003150003] = {
    id = 41003150003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020027:1"
    },
    need_quality_level = 3
  },
  [41019150001] = {
    id = 41019150001,
    des = function()
      return T(80591501, T(80520012, 10), T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43415001:3002:10000",
      "43415002:3002:10000"
    }
  },
  [41011152001] = {
    id = 41011152001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001521:42115200",
      "12001522:42115200"
    },
    damage_rate = 7000
  },
  [41011152002] = {
    id = 41011152002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001521:42115200",
      "12001522:42115200"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011152003] = {
    id = 41011152003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001521:42115200",
      "12001522:42115200"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 1
  },
  [41011152004] = {
    id = 41011152004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001521:42115200",
      "12001522:42115200"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 2
  },
  [41012152001] = {
    id = 41012152001,
    des = function()
      return T(80521521, T(80520011, 5), T(80520018, 250))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115201:3001:10000"
    }
  },
  [41012152002] = {
    id = 41012152002,
    des = function()
      return T(80521521, T(80520011, 5), T(80520018, 300))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115203:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012152003] = {
    id = 41012152003,
    des = function()
      return T(80521521, T(80520011, 5), T(80520018, 350))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115205:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41012152004] = {
    id = 41012152004,
    des = function()
      return T(80521521, T(80520011, 5), T(80520018, 400))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115207:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 3
  },
  [41012152005] = {
    id = 41012152005,
    des = function()
      return T(80521521, T(80520011, 5), T(80520018, 450))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115209:3001:10000"
    }
  },
  [41012152006] = {
    id = 41012152006,
    des = function()
      return T(80521521, T(80520011, 5), T(80520018, 500))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115211:3001:10000"
    }
  },
  [41013152001] = {
    id = 41013152001,
    des = function()
      return T(80531521, T(80520017, 2000), T(80520017, 10), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001521:42315200",
      "12001522:42315200"
    },
    target_type = 2001,
    damage_rate = 200000,
    buff_list = {
      "43215201:1000:10000"
    },
    tag_id = 420
  },
  [41013152002] = {
    id = 41013152002,
    des = function()
      return T(80531521, T(80520017, 2100), T(80520017, 11), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001521:42315200",
      "12001522:42315200"
    },
    target_type = 2001,
    damage_rate = 210000,
    buff_list = {
      "43215202:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 420
  },
  [41013152003] = {
    id = 41013152003,
    des = function()
      return T(80531521, T(80520017, 2200), T(80520017, 12), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001521:42315200",
      "12001522:42315200"
    },
    target_type = 2001,
    damage_rate = 220000,
    buff_list = {
      "43215203:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020006:2"
    },
    need_quality_level = 3,
    tag_id = 420
  },
  [41013152004] = {
    id = 41013152004,
    des = function()
      return T(80531521, T(80520017, 2300), T(80520017, 13), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001521:42315200",
      "12001522:42315200"
    },
    target_type = 2001,
    damage_rate = 230000,
    buff_list = {
      "43215204:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020011:3"
    },
    need_quality_level = 3,
    tag_id = 420
  },
  [41013152005] = {
    id = 41013152005,
    des = function()
      return T(80531521, T(80520017, 2400), T(80520017, 14), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001521:42315200",
      "12001522:42315200"
    },
    target_type = 2001,
    damage_rate = 240000,
    buff_list = {
      "43215205:1000:10000"
    },
    tag_id = 420
  },
  [41013152006] = {
    id = 41013152006,
    des = function()
      return T(80531521, T(80520017, 2500), T(80520017, 15), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001521:42315200",
      "12001522:42315200"
    },
    target_type = 2001,
    damage_rate = 250000,
    buff_list = {
      "43215206:1000:10000"
    },
    tag_id = 420
  },
  [41014152001] = {
    id = 41014152001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 751))
    end,
    add_attr = {
      "1:40000102:751"
    }
  },
  [41015152001] = {
    id = 41015152001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012152:1", "41013152:1"}
  },
  [41016152001] = {
    id = 41016152001,
    des = function()
      return T(80561521, T(80520012, 50), T(80520012, 30), T(80520011, 15))
    end,
    target_type = 3001,
    trigger_condition_1 = {1081},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43315201:3001:10000",
      "43315202:3001:10000"
    },
    association_des = function()
      return T(80561521, T(80520012, 50), T(80520012, 30), T(80520011, 15))
    end
  },
  [41017152001] = {
    id = 41017152001,
    des = function()
      return T(80570001, T(80520014, T(80000102)), T(80520011, 1153))
    end,
    add_attr = {
      "1:40000102:1153"
    }
  },
  [41018152001] = {
    id = 41018152001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012152:2", "41013152:2"}
  },
  [41001152001] = {
    id = 41001152001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001152002] = {
    id = 41001152002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001152003] = {
    id = 41001152003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 2
  },
  [41002152001] = {
    id = 41002152001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002152002] = {
    id = 41002152002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002152003] = {
    id = 41002152003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41003152001] = {
    id = 41003152001,
    des = function()
      return T(80520016, T(80000102), 461)
    end,
    add_attr = {
      "1:40000102:461"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003152002] = {
    id = 41003152002,
    des = function()
      return T(80520016, T(80000102), 922)
    end,
    add_attr = {
      "1:40000102:922"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003152003] = {
    id = 41003152003,
    des = function()
      return T(80520016, T(80000102), 1382)
    end,
    add_attr = {
      "1:40000102:1382"
    },
    cost = {
      "1:21040003:2",
      "1:21020026:2"
    },
    need_quality_level = 3
  },
  [41019152001] = {
    id = 41019152001,
    des = function()
      return T(80591521, T(80520012, 10))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43415201:3002:10000"
    }
  },
  [41011153001] = {
    id = 41011153001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001531:42115300",
      "12001532:42115300"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43115302:0:3000",
      "43115304:0:3000",
      "43115306:0:3000",
      "43115308:0:3000",
      "43115310:0:3000",
      "43115312:0:3000"
    }
  },
  [41011153002] = {
    id = 41011153002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001531:42115300",
      "12001532:42115300"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43115302:0:3000",
      "43115304:0:3000",
      "43115306:0:3000",
      "43115308:0:3000",
      "43115310:0:3000",
      "43115312:0:3000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011153003] = {
    id = 41011153003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001531:42115300",
      "12001532:42115300"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43115302:0:3000",
      "43115304:0:3000",
      "43115306:0:3000",
      "43115308:0:3000",
      "43115310:0:3000",
      "43115312:0:3000"
    },
    cost = {
      "1:21040002:1",
      "1:21020009:1"
    },
    need_quality_level = 1
  },
  [41011153004] = {
    id = 41011153004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001531:42115300",
      "12001532:42115300"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43115302:0:3000",
      "43115304:0:3000",
      "43115306:0:3000",
      "43115308:0:3000",
      "43115310:0:3000",
      "43115312:0:3000"
    },
    cost = {
      "1:21040003:1",
      "1:21020020:2"
    },
    need_quality_level = 2
  },
  [41012153001] = {
    id = 41012153001,
    des = function()
      return T(80521531, T(80520012, 30), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115301:3001:10000"
    }
  },
  [41012153002] = {
    id = 41012153002,
    des = function()
      return T(80521531, T(80520012, 30), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115303:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012153003] = {
    id = 41012153003,
    des = function()
      return T(80521531, T(80520012, 30), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115305:3001:10000"
    },
    cost = {
      "1:21040002:1",
      "1:21020009:1"
    },
    need_quality_level = 2
  },
  [41012153004] = {
    id = 41012153004,
    des = function()
      return T(80521531, T(80520012, 30), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115307:3001:10000"
    },
    cost = {
      "1:21040003:1",
      "1:21020020:2"
    },
    need_quality_level = 3
  },
  [41012153005] = {
    id = 41012153005,
    des = function()
      return T(80521531, T(80520012, 30), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115309:3001:10000"
    }
  },
  [41012153006] = {
    id = 41012153006,
    des = function()
      return T(80521531, T(80520012, 30), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115311:3001:10000"
    }
  },
  [41013153001] = {
    id = 41013153001,
    des = function()
      return T(80531531, T(80520017, 1075))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001531:42315300",
      "12001532:42315300"
    },
    target_type = 2011,
    damage_rate = 107500,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013153002] = {
    id = 41013153002,
    des = function()
      return T(80531531, T(80520017, 1125))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001531:42315300",
      "12001532:42315300"
    },
    target_type = 2011,
    damage_rate = 112500,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013153003] = {
    id = 41013153003,
    des = function()
      return T(80531531, T(80520017, 1175))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001531:42315300",
      "12001532:42315300"
    },
    target_type = 2011,
    damage_rate = 117500,
    cost = {
      "1:21040002:1",
      "1:21020009:1"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013153004] = {
    id = 41013153004,
    des = function()
      return T(80531531, T(80520017, 1225))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001531:42315300",
      "12001532:42315300"
    },
    target_type = 2011,
    damage_rate = 122500,
    cost = {
      "1:21040003:1",
      "1:21020020:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013153005] = {
    id = 41013153005,
    des = function()
      return T(80531531, T(80520017, 1275))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001531:42315300",
      "12001532:42315300"
    },
    target_type = 2011,
    damage_rate = 127500,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41013153006] = {
    id = 41013153006,
    des = function()
      return T(80531531, T(80520017, 1325))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001531:42315300",
      "12001532:42315300"
    },
    target_type = 2011,
    damage_rate = 132500,
    range_type = 1,
    range_x = 80,
    range_y = 80,
    tag_id = 203
  },
  [41014153001] = {
    id = 41014153001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015153001] = {
    id = 41015153001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012153:1", "41013153:1"}
  },
  [41016153001] = {
    id = 41016153001,
    des = function()
      return T(80561531, T(80520012, 15))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43315301:3001:10000"
    },
    association_des = function()
      return T(80561531, T(80520012, 15))
    end
  },
  [41017153001] = {
    id = 41017153001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018153001] = {
    id = 41018153001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012153:2", "41013153:2"}
  },
  [41001153001] = {
    id = 41001153001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001153002] = {
    id = 41001153002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020004:1"
    },
    need_quality_level = 1
  },
  [41001153003] = {
    id = 41001153003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020029:1"
    },
    need_quality_level = 2
  },
  [41002153001] = {
    id = 41002153001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002153002] = {
    id = 41002153002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:1",
      "1:21020004:1"
    },
    need_quality_level = 2
  },
  [41002153003] = {
    id = 41002153003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:1",
      "1:21020029:1"
    },
    need_quality_level = 3
  },
  [41003153001] = {
    id = 41003153001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003153002] = {
    id = 41003153002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:1",
      "1:21020004:1"
    },
    need_quality_level = 3
  },
  [41003153003] = {
    id = 41003153003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:1",
      "1:21020029:1"
    },
    need_quality_level = 3
  },
  [41019153001] = {
    id = 41019153001,
    des = function()
      return T(80591531, T(80520012, 15), T(80520012, 30))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43415301:3002:10000",
      "43415302:3002:10000"
    }
  },
  [41011154001] = {
    id = 41011154001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001541:42115400",
      "12001542:42115400"
    },
    damage_rate = 7000
  },
  [41011154002] = {
    id = 41011154002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001541:42115400",
      "12001542:42115400"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011154003] = {
    id = 41011154003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001541:42115400",
      "12001542:42115400"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 1
  },
  [41011154004] = {
    id = 41011154004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001541:42115400",
      "12001542:42115400"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020016:2"
    },
    need_quality_level = 2
  },
  [41012154001] = {
    id = 41012154001,
    des = function()
      return T(80521541, T(80520012, 50), T(80520017, 90))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115401:3001:10000"
    }
  },
  [41012154002] = {
    id = 41012154002,
    des = function()
      return T(80521541, T(80520012, 50), T(80520017, 100))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115403:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012154003] = {
    id = 41012154003,
    des = function()
      return T(80521541, T(80520012, 50), T(80520017, 110))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115405:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41012154004] = {
    id = 41012154004,
    des = function()
      return T(80521541, T(80520012, 50), T(80520017, 120))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115407:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020016:2"
    },
    need_quality_level = 3
  },
  [41012154005] = {
    id = 41012154005,
    des = function()
      return T(80521541, T(80520012, 50), T(80520017, 130))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115409:3001:10000"
    }
  },
  [41012154006] = {
    id = 41012154006,
    des = function()
      return T(80521541, T(80520012, 50), T(80520017, 140))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115411:3001:10000"
    }
  },
  [41013154001] = {
    id = 41013154001,
    des = function()
      return T(80531541, T(80520017, 20), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001541:42315400",
      "12001542:42315400"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43215401:3002:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 405
  },
  [41013154002] = {
    id = 41013154002,
    des = function()
      return T(80531541, T(80520017, 24), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001541:42315400",
      "12001542:42315400"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43215404:3002:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 405
  },
  [41013154003] = {
    id = 41013154003,
    des = function()
      return T(80531541, T(80520017, 28), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001541:42315400",
      "12001542:42315400"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43215407:3002:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 405
  },
  [41013154004] = {
    id = 41013154004,
    des = function()
      return T(80531541, T(80520017, 32), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001541:42315400",
      "12001542:42315400"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43215410:3002:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020016:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 405
  },
  [41013154005] = {
    id = 41013154005,
    des = function()
      return T(80531541, T(80520017, 36), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001541:42315400",
      "12001542:42315400"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43215413:3002:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 405
  },
  [41013154006] = {
    id = 41013154006,
    des = function()
      return T(80531541, T(80520017, 40), T(80520011, 10))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001541:42315400",
      "12001542:42315400"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43215416:3002:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 405
  },
  [41014154001] = {
    id = 41014154001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 50))
    end,
    add_attr = {
      "1:40000103:50"
    }
  },
  [41015154001] = {
    id = 41015154001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012154:1", "41013154:1"}
  },
  [41016154001] = {
    id = 41016154001,
    des = function()
      return T(80561541, T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43315401:3001:10000"
    },
    association_des = function()
      return T(80561541, T(80520011, 5))
    end
  },
  [41017154001] = {
    id = 41017154001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 77))
    end,
    add_attr = {
      "1:40000103:77"
    }
  },
  [41018154001] = {
    id = 41018154001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012154:2", "41013154:2"}
  },
  [41001154001] = {
    id = 41001154001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001154002] = {
    id = 41001154002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001154003] = {
    id = 41001154003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41002154001] = {
    id = 41002154001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002154002] = {
    id = 41002154002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002154003] = {
    id = 41002154003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41003154001] = {
    id = 41003154001,
    des = function()
      return T(80520016, T(80000103), 31)
    end,
    add_attr = {
      "1:40000103:31"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003154002] = {
    id = 41003154002,
    des = function()
      return T(80520016, T(80000103), 61)
    end,
    add_attr = {
      "1:40000103:61"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003154003] = {
    id = 41003154003,
    des = function()
      return T(80520016, T(80000103), 92)
    end,
    add_attr = {
      "1:40000103:92"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41019154001] = {
    id = 41019154001,
    des = function()
      return T(80591541, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43415401:3002:10000"
    }
  },
  [41011155001] = {
    id = 41011155001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001551:42115500",
      "12001552:42115500"
    },
    damage_rate = 7000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43115501:0:3000",
      "43115504:0:3000",
      "43115507:0:3000",
      "43115510:0:3000",
      "43115513:0:3000",
      "43115516:0:3000"
    }
  },
  [41011155002] = {
    id = 41011155002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001551:42115500",
      "12001552:42115500"
    },
    damage_rate = 8000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43115501:0:3000",
      "43115504:0:3000",
      "43115507:0:3000",
      "43115510:0:3000",
      "43115513:0:3000",
      "43115516:0:3000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011155003] = {
    id = 41011155003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001551:42115500",
      "12001552:42115500"
    },
    damage_rate = 9000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43115501:0:3000",
      "43115504:0:3000",
      "43115507:0:3000",
      "43115510:0:3000",
      "43115513:0:3000",
      "43115516:0:3000"
    },
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 1
  },
  [41011155004] = {
    id = 41011155004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001551:42115500",
      "12001552:42115500"
    },
    damage_rate = 10000,
    bullet_speed = 800,
    bullet_buff_list = {
      "43115501:0:3000",
      "43115504:0:3000",
      "43115507:0:3000",
      "43115510:0:3000",
      "43115513:0:3000",
      "43115516:0:3000"
    },
    cost = {
      "1:21040003:2",
      "1:21020023:3"
    },
    need_quality_level = 2
  },
  [41012155001] = {
    id = 41012155001,
    des = function()
      return T(80521551, T(80520012, 30), T(80520017, 90), T(80520019, "5"), T(80520018, 250))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115503:3001:10000"
    }
  },
  [41012155002] = {
    id = 41012155002,
    des = function()
      return T(80521551, T(80520012, 30), T(80520017, 100), T(80520019, "6"), T(80520018, 300))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115506:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012155003] = {
    id = 41012155003,
    des = function()
      return T(80521551, T(80520012, 30), T(80520017, 110), T(80520019, "7"), T(80520018, 350))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115509:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 2
  },
  [41012155004] = {
    id = 41012155004,
    des = function()
      return T(80521551, T(80520012, 30), T(80520017, 120), T(80520019, "8"), T(80520018, 400))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115512:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020023:3"
    },
    need_quality_level = 3
  },
  [41012155005] = {
    id = 41012155005,
    des = function()
      return T(80521551, T(80520012, 30), T(80520017, 130), T(80520019, "9"), T(80520018, 450))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115515:3001:10000"
    }
  },
  [41012155006] = {
    id = 41012155006,
    des = function()
      return T(80521551, T(80520012, 30), T(80520017, 140), T(80520019, "10"), T(80520018, 500))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115518:3001:10000"
    }
  },
  [41013155001] = {
    id = 41013155001,
    des = function()
      return T(80531551, T(80520011, 2), T(80520017, 1630))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001551:42315500",
      "12001552:42315500"
    },
    target_type = 2202,
    damage_rate = 163000,
    effect_change_target_type = 525,
    tag_id = 304
  },
  [41013155002] = {
    id = 41013155002,
    des = function()
      return T(80531551, T(80520011, 2), T(80520017, 1700))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001551:42315500",
      "12001552:42315500"
    },
    target_type = 2202,
    damage_rate = 170000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    effect_change_target_type = 525,
    tag_id = 304
  },
  [41013155003] = {
    id = 41013155003,
    des = function()
      return T(80531551, T(80520011, 2), T(80520017, 1770))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001551:42315500",
      "12001552:42315500"
    },
    target_type = 2202,
    damage_rate = 177000,
    cost = {
      "1:21040002:2",
      "1:21020030:2"
    },
    need_quality_level = 3,
    effect_change_target_type = 525,
    tag_id = 304
  },
  [41013155004] = {
    id = 41013155004,
    des = function()
      return T(80531551, T(80520011, 2), T(80520017, 1840))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001551:42315500",
      "12001552:42315500"
    },
    target_type = 2202,
    damage_rate = 184000,
    cost = {
      "1:21040003:2",
      "1:21020023:3"
    },
    need_quality_level = 3,
    effect_change_target_type = 525,
    tag_id = 304
  },
  [41013155005] = {
    id = 41013155005,
    des = function()
      return T(80531551, T(80520011, 2), T(80520017, 1910))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001551:42315500",
      "12001552:42315500"
    },
    target_type = 2202,
    damage_rate = 191000,
    effect_change_target_type = 525,
    tag_id = 304
  },
  [41013155006] = {
    id = 41013155006,
    des = function()
      return T(80531551, T(80520011, 2), T(80520017, 1980))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001551:42315500",
      "12001552:42315500"
    },
    target_type = 2202,
    damage_rate = 198000,
    effect_change_target_type = 525,
    tag_id = 304
  },
  [41014155001] = {
    id = 41014155001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015155001] = {
    id = 41015155001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012155:1", "41013155:1"}
  },
  [41016155001] = {
    id = 41016155001,
    des = function()
      return T(80561551)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43315501:3001:10000"
    },
    association_des = function()
      return T(80561551)
    end
  },
  [41017155001] = {
    id = 41017155001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018155001] = {
    id = 41018155001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012155:2", "41013155:2"}
  },
  [41001155001] = {
    id = 41001155001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001155002] = {
    id = 41001155002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 1
  },
  [41001155003] = {
    id = 41001155003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 2
  },
  [41002155001] = {
    id = 41002155001,
    des = function()
      return T(80520015, T(80000302), 6)
    end,
    add_attr = {
      "1:40000316:-600"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002155002] = {
    id = 41002155002,
    des = function()
      return T(80520015, T(80000302), 14)
    end,
    add_attr = {
      "1:40000316:-1400"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 2
  },
  [41002155003] = {
    id = 41002155003,
    des = function()
      return T(80520015, T(80000302), 24)
    end,
    add_attr = {
      "1:40000316:-2400"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 3
  },
  [41003155001] = {
    id = 41003155001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003155002] = {
    id = 41003155002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020005:2"
    },
    need_quality_level = 3
  },
  [41003155003] = {
    id = 41003155003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020010:2"
    },
    need_quality_level = 3
  },
  [41019155001] = {
    id = 41019155001,
    des = function()
      return T(80591551, T(80520012, 10), T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43415501:3002:10000",
      "43415502:3002:10000"
    }
  },
  [41011170001] = {
    id = 41011170001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001701:42117000",
      "12001702:42117000",
      "12001703:42117002"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43117001:0:3000",
      "43117004:0:3000",
      "43117007:0:3000",
      "43117010:0:3000",
      "43117013:0:3000",
      "43117016:0:3000"
    }
  },
  [41011170002] = {
    id = 41011170002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001701:42117000",
      "12001702:42117000",
      "12001703:42117002"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43117001:0:3000",
      "43117004:0:3000",
      "43117007:0:3000",
      "43117010:0:3000",
      "43117013:0:3000",
      "43117016:0:3000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011170003] = {
    id = 41011170003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001701:42117000",
      "12001702:42117000",
      "12001703:42117002"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43117001:0:3000",
      "43117004:0:3000",
      "43117007:0:3000",
      "43117010:0:3000",
      "43117013:0:3000",
      "43117016:0:3000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 1
  },
  [41011170004] = {
    id = 41011170004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001701:42117000",
      "12001702:42117000",
      "12001703:42117002"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43117001:0:3000",
      "43117004:0:3000",
      "43117007:0:3000",
      "43117010:0:3000",
      "43117013:0:3000",
      "43117016:0:3000"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:3"
    },
    need_quality_level = 2
  },
  [41012170001] = {
    id = 41012170001,
    des = function()
      return T(80521701, T(80520012, 30), T(80520017, 70), T(80520017, 15))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43117002:3001:10000"
    }
  },
  [41012170002] = {
    id = 41012170002,
    des = function()
      return T(80521701, T(80520012, 30), T(80520017, 80), T(80520017, 18))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43117005:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012170003] = {
    id = 41012170003,
    des = function()
      return T(80521701, T(80520012, 30), T(80520017, 90), T(80520017, 21))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43117008:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41012170004] = {
    id = 41012170004,
    des = function()
      return T(80521701, T(80520012, 30), T(80520017, 100), T(80520017, 24))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43117011:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:3"
    },
    need_quality_level = 3
  },
  [41012170005] = {
    id = 41012170005,
    des = function()
      return T(80521701, T(80520012, 30), T(80520017, 110), T(80520017, 27))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43117014:3001:10000"
    }
  },
  [41012170006] = {
    id = 41012170006,
    des = function()
      return T(80521701, T(80520012, 30), T(80520017, 120), T(80520017, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43117017:3001:10000"
    }
  },
  [41013170001] = {
    id = 41013170001,
    des = function()
      return T(80531701, T(80520017, 450), T(80520017, 200))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001701:42317000",
      "12001702:42317000",
      "12001703:42317002"
    },
    target_type = 2591,
    damage_rate = 45000,
    buff_list = {
      "43217013:3001:10000"
    },
    tag_id = 105,
    bomb_delay_frame = 1,
    bomb_buff_list = {
      "43217001:0:10000",
      "43217002:0:10000"
    },
    not_fixed_target = 1
  },
  [41013170002] = {
    id = 41013170002,
    des = function()
      return T(80531701, T(80520017, 540), T(80520017, 240))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001701:42317000",
      "12001702:42317000",
      "12001703:42317002"
    },
    target_type = 2591,
    damage_rate = 54000,
    buff_list = {
      "43217013:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105,
    bomb_delay_frame = 1,
    bomb_buff_list = {
      "43217003:0:10000",
      "43217004:0:10000"
    },
    not_fixed_target = 1
  },
  [41013170003] = {
    id = 41013170003,
    des = function()
      return T(80531701, T(80520017, 630), T(80520017, 280))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001701:42317000",
      "12001702:42317000",
      "12001703:42317002"
    },
    target_type = 2591,
    damage_rate = 63000,
    buff_list = {
      "43217013:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020009:2"
    },
    need_quality_level = 3,
    tag_id = 105,
    bomb_delay_frame = 1,
    bomb_buff_list = {
      "43217005:0:10000",
      "43217006:0:10000"
    },
    not_fixed_target = 1
  },
  [41013170004] = {
    id = 41013170004,
    des = function()
      return T(80531701, T(80520017, 720), T(80520017, 320))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001701:42317000",
      "12001702:42317000",
      "12001703:42317002"
    },
    target_type = 2591,
    damage_rate = 72000,
    buff_list = {
      "43217013:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020022:3"
    },
    need_quality_level = 3,
    tag_id = 105,
    bomb_delay_frame = 1,
    bomb_buff_list = {
      "43217007:0:10000",
      "43217008:0:10000"
    },
    not_fixed_target = 1
  },
  [41013170005] = {
    id = 41013170005,
    des = function()
      return T(80531701, T(80520017, 810), T(80520017, 360))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001701:42317000",
      "12001702:42317000",
      "12001703:42317002"
    },
    target_type = 2591,
    damage_rate = 81000,
    buff_list = {
      "43217013:3001:10000"
    },
    tag_id = 105,
    bomb_delay_frame = 1,
    bomb_buff_list = {
      "43217009:0:10000",
      "43217010:0:10000"
    },
    not_fixed_target = 1
  },
  [41013170006] = {
    id = 41013170006,
    des = function()
      return T(80531701, T(80520017, 900), T(80520017, 400))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001701:42317000",
      "12001702:42317000",
      "12001703:42317002"
    },
    target_type = 2591,
    damage_rate = 90000,
    buff_list = {
      "43217013:3001:10000"
    },
    tag_id = 105,
    bomb_delay_frame = 1,
    bomb_buff_list = {
      "43217011:0:10000",
      "43217012:0:10000"
    },
    not_fixed_target = 1
  },
  [41014170001] = {
    id = 41014170001,
    des = function()
      return T(80541701, T(80520014, T(80000103)), T(80520011, 40), T(80520012, 60))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43317001:3001:10000"
    },
    add_attr = {
      "1:40000103:40"
    },
    association_des = function()
      return T(80541702, T(80520012, 60))
    end
  },
  [41015170001] = {
    id = 41015170001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012170:1", "41013170:1"}
  },
  [41016170001] = {
    id = 41016170001,
    des = function()
      return T(80561701)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43317002:3001:10000"
    },
    association_des = function()
      return T(80561701)
    end
  },
  [41017170001] = {
    id = 41017170001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018170001] = {
    id = 41018170001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012170:2", "41013170:2"}
  },
  [41001170001] = {
    id = 41001170001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001170002] = {
    id = 41001170002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001170003] = {
    id = 41001170003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41002170001] = {
    id = 41002170001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002170002] = {
    id = 41002170002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002170003] = {
    id = 41002170003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 3
  },
  [41003170001] = {
    id = 41003170001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003170002] = {
    id = 41003170002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003170003] = {
    id = 41003170003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020029:2"
    },
    need_quality_level = 3
  },
  [41019170001] = {
    id = 41019170001,
    des = function()
      return T(80591701, T(80520012, 5), T(80520012, 30))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43417001:3002:10000",
      "43417002:3002:10000"
    }
  },
  [41011151001] = {
    id = 41011151001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001511:42115100",
      "12001512:42115100",
      "12001513:42115102"
    },
    damage_rate = 7000
  },
  [41011151002] = {
    id = 41011151002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001511:42115100",
      "12001512:42115100",
      "12001513:42115102"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011151003] = {
    id = 41011151003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001511:42115100",
      "12001512:42115100",
      "12001513:42115102"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 1
  },
  [41011151004] = {
    id = 41011151004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001511:42115100",
      "12001512:42115100",
      "12001513:42115102"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 2
  },
  [41012151001] = {
    id = 41012151001,
    des = function()
      return T(80521511, T(80520019, 2.5), T(80520019, 5), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115101:3001:10000"
    }
  },
  [41012151002] = {
    id = 41012151002,
    des = function()
      return T(80521511, T(80520019, 3), T(80520019, 7), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115106:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012151003] = {
    id = 41012151003,
    des = function()
      return T(80521511, T(80520019, 3.5), T(80520019, 9), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115111:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41012151004] = {
    id = 41012151004,
    des = function()
      return T(80521511, T(80520019, 4), T(80520019, 11), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115116:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 3
  },
  [41012151005] = {
    id = 41012151005,
    des = function()
      return T(80521511, T(80520019, 4.5), T(80520019, 13), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115121:3001:10000"
    }
  },
  [41012151006] = {
    id = 41012151006,
    des = function()
      return T(80521511, T(80520019, 5), T(80520019, 15), T(80520011, 3))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43115126:3001:10000"
    }
  },
  [41013151001] = {
    id = 41013151001,
    des = function()
      return T(80531511, T(80520017, 1100))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001511:42315100",
      "12001512:42315100",
      "12001513:42315102"
    },
    target_type = 2001,
    damage_rate = 110000,
    tag_id = 105
  },
  [41013151002] = {
    id = 41013151002,
    des = function()
      return T(80531511, T(80520017, 1160))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001511:42315100",
      "12001512:42315100",
      "12001513:42315102"
    },
    target_type = 2001,
    damage_rate = 116000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013151003] = {
    id = 41013151003,
    des = function()
      return T(80531511, T(80520017, 1220))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001511:42315100",
      "12001512:42315100",
      "12001513:42315102"
    },
    target_type = 2001,
    damage_rate = 122000,
    cost = {
      "1:21040002:2",
      "1:21020007:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013151004] = {
    id = 41013151004,
    des = function()
      return T(80531511, T(80520017, 1280))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001511:42315100",
      "12001512:42315100",
      "12001513:42315102"
    },
    target_type = 2001,
    damage_rate = 128000,
    cost = {
      "1:21040003:2",
      "1:21020016:3"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013151005] = {
    id = 41013151005,
    des = function()
      return T(80531511, T(80520017, 1340))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001511:42315100",
      "12001512:42315100",
      "12001513:42315102"
    },
    target_type = 2001,
    damage_rate = 134000,
    tag_id = 105
  },
  [41013151006] = {
    id = 41013151006,
    des = function()
      return T(80531511, T(80520017, 1400))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001511:42315100",
      "12001512:42315100",
      "12001513:42315102"
    },
    target_type = 2001,
    damage_rate = 140000,
    tag_id = 105
  },
  [41014151001] = {
    id = 41014151001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 60))
    end,
    add_attr = {
      "1:40000103:60"
    }
  },
  [41015151001] = {
    id = 41015151001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012151:1", "41013151:1"}
  },
  [41016151001] = {
    id = 41016151001,
    des = function()
      return T(80561511, T(80520012, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1081},
    trigger_type_1 = {4},
    trigger_value_1 = {3000},
    trigger_max = 1,
    buff_list = {
      "43315101:3001:10000"
    }
  },
  [41017151001] = {
    id = 41017151001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018151001] = {
    id = 41018151001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012151:2", "41013151:2"}
  },
  [41001151001] = {
    id = 41001151001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001151002] = {
    id = 41001151002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001151003] = {
    id = 41001151003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 2
  },
  [41002151001] = {
    id = 41002151001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002151002] = {
    id = 41002151002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002151003] = {
    id = 41002151003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41003151001] = {
    id = 41003151001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003151002] = {
    id = 41003151002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003151003] = {
    id = 41003151003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020027:2"
    },
    need_quality_level = 3
  },
  [41019151001] = {
    id = 41019151001,
    des = function()
      return T(80591511, T(80520012, 10), T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43415101:3002:10000",
      "43415102:3002:10000"
    }
  },
  [41011161001] = {
    id = 41011161001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001611:42116100",
      "12001612:42116100",
      "12001613:42116103"
    },
    damage_rate = 7000
  },
  [41011161002] = {
    id = 41011161002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001611:42116100",
      "12001612:42116100",
      "12001613:42116103"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011161003] = {
    id = 41011161003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001611:42116100",
      "12001612:42116100",
      "12001613:42116103"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 1
  },
  [41011161004] = {
    id = 41011161004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001611:42116100",
      "12001612:42116100",
      "12001613:42116103"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 2
  },
  [41012161001] = {
    id = 41012161001,
    des = function()
      return T(80521611, T(80520017, 1000), T(80520017, 350), T(80520019, 2))
    end,
    fashion_show_ids = {
      "12001611:42216100",
      "12001612:42216100",
      "12001613:42216103"
    },
    target_type = 2001,
    trigger_condition_1 = {1006},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 100000,
    damage_rate_pvp = 35000,
    buff_list = {
      "43116101:3001:10000"
    },
    extra_skill = 41006161001
  },
  [41012161002] = {
    id = 41012161002,
    des = function()
      return T(80521611, T(80520017, 1100), T(80520017, 380), T(80520019, 2.2))
    end,
    fashion_show_ids = {
      "12001611:42216100",
      "12001612:42216100",
      "12001613:42216103"
    },
    target_type = 2001,
    trigger_condition_1 = {1006},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 110000,
    damage_rate_pvp = 38000,
    buff_list = {
      "43116101:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1,
    extra_skill = 41006161002
  },
  [41012161003] = {
    id = 41012161003,
    des = function()
      return T(80521611, T(80520017, 1200), T(80520017, 410), T(80520019, 2.4))
    end,
    fashion_show_ids = {
      "12001611:42216100",
      "12001612:42216100",
      "12001613:42216103"
    },
    target_type = 2001,
    trigger_condition_1 = {1006},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 120000,
    damage_rate_pvp = 41000,
    buff_list = {
      "43116101:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 2,
    extra_skill = 41006161003
  },
  [41012161004] = {
    id = 41012161004,
    des = function()
      return T(80521611, T(80520017, 1300), T(80520017, 440), T(80520019, 2.6))
    end,
    fashion_show_ids = {
      "12001611:42216100",
      "12001612:42216100",
      "12001613:42216103"
    },
    target_type = 2001,
    trigger_condition_1 = {1006},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 130000,
    damage_rate_pvp = 44000,
    buff_list = {
      "43116101:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 3,
    extra_skill = 41006161004
  },
  [41012161005] = {
    id = 41012161005,
    des = function()
      return T(80521611, T(80520017, 1400), T(80520017, 470), T(80520019, 2.8))
    end,
    fashion_show_ids = {
      "12001611:42216100",
      "12001612:42216100",
      "12001613:42216103"
    },
    target_type = 2001,
    trigger_condition_1 = {1006},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 140000,
    damage_rate_pvp = 47000,
    buff_list = {
      "43116101:3001:10000"
    },
    extra_skill = 41006161005
  },
  [41012161006] = {
    id = 41012161006,
    des = function()
      return T(80521611, T(80520017, 1500), T(80520017, 500), T(80520019, 3))
    end,
    fashion_show_ids = {
      "12001611:42216100",
      "12001612:42216100",
      "12001613:42216103"
    },
    target_type = 2001,
    trigger_condition_1 = {1006},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 150000,
    damage_rate_pvp = 50000,
    buff_list = {
      "43116101:3001:10000"
    },
    extra_skill = 41006161006
  },
  [41006161001] = {
    id = 41006161001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43116103:3001:10000",
      "43116104:3001:10000",
      "43116105:3001:10000"
    }
  },
  [41006161002] = {
    id = 41006161002,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43116106:3001:10000",
      "43116104:3001:10000",
      "43116105:3001:10000"
    },
    need_quality_level = 1
  },
  [41006161003] = {
    id = 41006161003,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43116107:3001:10000",
      "43116104:3001:10000",
      "43116105:3001:10000"
    },
    need_quality_level = 2
  },
  [41006161004] = {
    id = 41006161004,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43116108:3001:10000",
      "43116104:3001:10000",
      "43116105:3001:10000"
    },
    need_quality_level = 3
  },
  [41006161005] = {
    id = 41006161005,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43116109:3001:10000",
      "43116104:3001:10000",
      "43116105:3001:10000"
    }
  },
  [41006161006] = {
    id = 41006161006,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43116110:3001:10000",
      "43116104:3001:10000",
      "43116105:3001:10000"
    }
  },
  [41013161001] = {
    id = 41013161001,
    des = function()
      return T(80531611, T(80520017, 1350), T(80520017, 850), T(80520017, 50), T(80520017, 50), T(80520017, 50), T(80520017, 4500), T(80520017, 450), T(80520017, 3000), T(80520017, 350))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001611:42316100",
      "12001612:42316100",
      "12001613:42316103"
    },
    target_type = 2001,
    damage_rate = 135000,
    damage_rate_pvp = 85000,
    tag_id = 105,
    extra_skill = 41004161001,
    extra_skill_2 = 41005161001,
    extra_skill_3 = 41007161001
  },
  [41013161002] = {
    id = 41013161002,
    des = function()
      return T(80531611, T(80520017, 1480), T(80520017, 950), T(80520017, 60), T(80520017, 60), T(80520017, 60), T(80520017, 5000), T(80520017, 500), T(80520017, 3400), T(80520017, 380))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001611:42316100",
      "12001612:42316100",
      "12001613:42316103"
    },
    target_type = 2001,
    damage_rate = 148000,
    damage_rate_pvp = 95000,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105,
    extra_skill = 41004161002,
    extra_skill_2 = 41005161001,
    extra_skill_3 = 41007161002
  },
  [41013161003] = {
    id = 41013161003,
    des = function()
      return T(80531611, T(80520017, 1610), T(80520017, 1050), T(80520017, 70), T(80520017, 70), T(80520017, 70), T(80520017, 5500), T(80520017, 550), T(80520017, 3800), T(80520017, 410))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001611:42316100",
      "12001612:42316100",
      "12001613:42316103"
    },
    target_type = 2001,
    damage_rate = 161000,
    damage_rate_pvp = 105000,
    cost = {
      "1:21040002:2",
      "1:21020027:2"
    },
    need_quality_level = 3,
    tag_id = 105,
    extra_skill = 41004161003,
    extra_skill_2 = 41005161001,
    extra_skill_3 = 41007161003
  },
  [41013161004] = {
    id = 41013161004,
    des = function()
      return T(80531611, T(80520017, 1740), T(80520017, 1150), T(80520017, 80), T(80520017, 80), T(80520017, 80), T(80520017, 6000), T(80520017, 600), T(80520017, 4200), T(80520017, 440))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001611:42316100",
      "12001612:42316100",
      "12001613:42316103"
    },
    target_type = 2001,
    damage_rate = 174000,
    damage_rate_pvp = 115000,
    cost = {
      "1:21040003:2",
      "1:21020014:3"
    },
    need_quality_level = 3,
    tag_id = 105,
    extra_skill = 41004161004,
    extra_skill_2 = 41005161001,
    extra_skill_3 = 41007161004
  },
  [41013161005] = {
    id = 41013161005,
    des = function()
      return T(80531611, T(80520017, 1870), T(80520017, 1250), T(80520017, 90), T(80520017, 90), T(80520017, 90), T(80520017, 6500), T(80520017, 650), T(80520017, 4600), T(80520017, 470))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001611:42316100",
      "12001612:42316100",
      "12001613:42316103"
    },
    target_type = 2001,
    damage_rate = 187000,
    damage_rate_pvp = 125000,
    tag_id = 105,
    extra_skill = 41004161005,
    extra_skill_2 = 41005161001,
    extra_skill_3 = 41007161005
  },
  [41013161006] = {
    id = 41013161006,
    des = function()
      return T(80531611, T(80520017, 2000), T(80520017, 1350), T(80520017, 100), T(80520017, 100), T(80520017, 100), T(80520017, 7000), T(80520017, 700), T(80520017, 5000), T(80520017, 500))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001611:42316100",
      "12001612:42316100",
      "12001613:42316103"
    },
    target_type = 2001,
    damage_rate = 200000,
    damage_rate_pvp = 135000,
    tag_id = 105,
    extra_skill = 41004161006,
    extra_skill_2 = 41005161001,
    extra_skill_3 = 41007161006
  },
  [41004161001] = {
    id = 41004161001,
    fashion_show_ids = {
      "12001611:42316101",
      "12001612:42316101",
      "12001613:42316104"
    },
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43216101:3001:10000"
    }
  },
  [41004161002] = {
    id = 41004161002,
    fashion_show_ids = {
      "12001611:42316101",
      "12001612:42316101",
      "12001613:42316104"
    },
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43216103:3001:10000"
    },
    need_quality_level = 2
  },
  [41004161003] = {
    id = 41004161003,
    fashion_show_ids = {
      "12001611:42316101",
      "12001612:42316101",
      "12001613:42316104"
    },
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43216105:3001:10000"
    },
    need_quality_level = 3
  },
  [41004161004] = {
    id = 41004161004,
    fashion_show_ids = {
      "12001611:42316101",
      "12001612:42316101",
      "12001613:42316104"
    },
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43216107:3001:10000"
    },
    need_quality_level = 3
  },
  [41004161005] = {
    id = 41004161005,
    fashion_show_ids = {
      "12001611:42316101",
      "12001612:42316101",
      "12001613:42316104"
    },
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43216109:3001:10000"
    }
  },
  [41004161006] = {
    id = 41004161006,
    fashion_show_ids = {
      "12001611:42316101",
      "12001612:42316101",
      "12001613:42316104"
    },
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43216111:3001:10000"
    }
  },
  [41005161001] = {
    id = 41005161001,
    target_type = 3001,
    trigger_condition_1 = {1131},
    trigger_type_1 = {3},
    trigger_value_1 = {2000},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43216114:3001:10000"
    }
  },
  [41007161001] = {
    id = 41007161001,
    fashion_show_ids = {
      "12001611:42316102",
      "12001612:42316102",
      "12001613:42316105"
    },
    target_type = 2621,
    trigger_condition_1 = {1141},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 300000,
    damage_rate_pvp = 35000,
    buff_list = {
      "43216116:3001:10000"
    }
  },
  [41007161002] = {
    id = 41007161002,
    fashion_show_ids = {
      "12001611:42316102",
      "12001612:42316102",
      "12001613:42316105"
    },
    target_type = 2621,
    trigger_condition_1 = {1141},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 340000,
    damage_rate_pvp = 38000,
    buff_list = {
      "43216116:3001:10000"
    },
    need_quality_level = 2
  },
  [41007161003] = {
    id = 41007161003,
    fashion_show_ids = {
      "12001611:42316102",
      "12001612:42316102",
      "12001613:42316105"
    },
    target_type = 2621,
    trigger_condition_1 = {1141},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 380000,
    damage_rate_pvp = 41000,
    buff_list = {
      "43216116:3001:10000"
    },
    need_quality_level = 3
  },
  [41007161004] = {
    id = 41007161004,
    fashion_show_ids = {
      "12001611:42316102",
      "12001612:42316102",
      "12001613:42316105"
    },
    target_type = 2621,
    trigger_condition_1 = {1141},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 420000,
    damage_rate_pvp = 44000,
    buff_list = {
      "43216116:3001:10000"
    },
    need_quality_level = 3
  },
  [41007161005] = {
    id = 41007161005,
    fashion_show_ids = {
      "12001611:42316102",
      "12001612:42316102",
      "12001613:42316105"
    },
    target_type = 2621,
    trigger_condition_1 = {1141},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 460000,
    damage_rate_pvp = 47000,
    buff_list = {
      "43216116:3001:10000"
    }
  },
  [41007161006] = {
    id = 41007161006,
    fashion_show_ids = {
      "12001611:42316102",
      "12001612:42316102",
      "12001613:42316105"
    },
    target_type = 2621,
    trigger_condition_1 = {1141},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    trigger_max = 1,
    damage_rate = 500000,
    damage_rate_pvp = 50000,
    buff_list = {
      "43216116:3001:10000"
    }
  },
  [41014161001] = {
    id = 41014161001,
    des = function()
      return T(80540001, T(80520014, T(80000103)), T(80520011, 80))
    end,
    add_attr = {
      "1:40000103:80"
    }
  },
  [41015161001] = {
    id = 41015161001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012161:1", "41013161:1"}
  },
  [41016161001] = {
    id = 41016161001,
    des = function()
      return T(80561611, T(80520011, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    damage = 1,
    buff_list = {
      "43316101:3001:10000"
    }
  },
  [41017161001] = {
    id = 41017161001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 130))
    end,
    add_attr = {
      "1:40000103:130"
    }
  },
  [41018161001] = {
    id = 41018161001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012161:2", "41013161:2"}
  },
  [41001161001] = {
    id = 41001161001,
    des = function()
      return T(80520016, T(80000103), 52)
    end,
    add_attr = {
      "1:40000103:52"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001161002] = {
    id = 41001161002,
    des = function()
      return T(80520016, T(80000103), 104)
    end,
    add_attr = {
      "1:40000103:104"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 1
  },
  [41001161003] = {
    id = 41001161003,
    des = function()
      return T(80520016, T(80000103), 156)
    end,
    add_attr = {
      "1:40000103:156"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 2
  },
  [41002161001] = {
    id = 41002161001,
    des = function()
      return T(80520016, T(80000104), 55)
    end,
    add_attr = {
      "1:40000104:55"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002161002] = {
    id = 41002161002,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 2
  },
  [41002161003] = {
    id = 41002161003,
    des = function()
      return T(80520016, T(80000104), 165)
    end,
    add_attr = {
      "1:40000104:165"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41003161001] = {
    id = 41003161001,
    des = function()
      return T(80520016, T(80000102), 576)
    end,
    add_attr = {
      "1:40000102:576"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003161002] = {
    id = 41003161002,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040002:2",
      "1:21020002:2"
    },
    need_quality_level = 3
  },
  [41003161003] = {
    id = 41003161003,
    des = function()
      return T(80520016, T(80000102), 1728)
    end,
    add_attr = {
      "1:40000102:1728"
    },
    cost = {
      "1:21040003:2",
      "1:21020007:2"
    },
    need_quality_level = 3
  },
  [41019161001] = {
    id = 41019161001,
    des = function()
      return T(80591611, T(80520012, 5), T(80520012, 5), T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43416101:3002:10000",
      "43416102:3002:10000",
      "43416103:3002:10000"
    }
  },
  [41011180001] = {
    id = 41011180001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001801:42118000",
      "12001802:42118000",
      "12001803:42118002"
    },
    damage_rate = 7000
  },
  [41011180002] = {
    id = 41011180002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001801:42118000",
      "12001802:42118000",
      "12001803:42118002"
    },
    damage_rate = 8000,
    cost = {
      "1:21040001:1"
    }
  },
  [41011180003] = {
    id = 41011180003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001801:42118000",
      "12001802:42118000",
      "12001803:42118002"
    },
    damage_rate = 9000,
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 1
  },
  [41011180004] = {
    id = 41011180004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001801:42118000",
      "12001802:42118000",
      "12001803:42118002"
    },
    damage_rate = 10000,
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 2
  },
  [41012180001] = {
    id = 41012180001,
    des = function()
      return T(80521801, T(80520019, 4), T(80520018, 500))
    end,
    target_type = 3011,
    trigger_condition_1 = {1064},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    damage_rate = 0,
    buff_list = {
      "43118001:3011:10000"
    },
    trigger_cd = 30,
    extra_skill = 41004180001
  },
  [41012180002] = {
    id = 41012180002,
    des = function()
      return T(80521801, T(80520019, 4.5), T(80520018, 600))
    end,
    target_type = 3011,
    trigger_condition_1 = {1064},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    damage_rate = 0,
    buff_list = {
      "43118002:3011:10000"
    },
    trigger_cd = 30,
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1,
    extra_skill = 41004180002
  },
  [41012180003] = {
    id = 41012180003,
    des = function()
      return T(80521801, T(80520019, 5), T(80520018, 700))
    end,
    target_type = 3011,
    trigger_condition_1 = {1064},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    damage_rate = 0,
    buff_list = {
      "43118003:3011:10000"
    },
    trigger_cd = 30,
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 2,
    extra_skill = 41004180003
  },
  [41012180004] = {
    id = 41012180004,
    des = function()
      return T(80521801, T(80520019, 5.5), T(80520018, 800))
    end,
    target_type = 3011,
    trigger_condition_1 = {1064},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    damage_rate = 0,
    buff_list = {
      "43118004:3011:10000"
    },
    trigger_cd = 30,
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 3,
    extra_skill = 41004180004
  },
  [41012180005] = {
    id = 41012180005,
    des = function()
      return T(80521801, T(80520019, 6), T(80520018, 900))
    end,
    target_type = 3011,
    trigger_condition_1 = {1064},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    damage_rate = 0,
    buff_list = {
      "43118005:3011:10000"
    },
    trigger_cd = 30,
    extra_skill = 41004180005
  },
  [41012180006] = {
    id = 41012180006,
    des = function()
      return T(80521801, T(80520019, 6.5), T(80520018, 1000))
    end,
    target_type = 3011,
    trigger_condition_1 = {1064},
    trigger_type_1 = {3},
    trigger_value_1 = {5000},
    damage_rate = 0,
    buff_list = {
      "43118006:3011:10000"
    },
    trigger_cd = 30,
    extra_skill = 41004180006
  },
  [41004180001] = {
    id = 41004180001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43118007:3001:10000",
      "43118009:3001:10000"
    }
  },
  [41004180002] = {
    id = 41004180002,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43118007:3001:10000",
      "43118009:3001:10000"
    },
    need_quality_level = 1
  },
  [41004180003] = {
    id = 41004180003,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43118007:3001:10000",
      "43118009:3001:10000"
    },
    need_quality_level = 2
  },
  [41004180004] = {
    id = 41004180004,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43118007:3001:10000",
      "43118009:3001:10000"
    },
    need_quality_level = 3
  },
  [41004180005] = {
    id = 41004180005,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43118007:3001:10000",
      "43118009:3001:10000"
    }
  },
  [41004180006] = {
    id = 41004180006,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43118007:3001:10000",
      "43118009:3001:10000"
    }
  },
  [41013180001] = {
    id = 41013180001,
    des = function()
      return T(80531801, T(80520012, 30), T(80520019, 95), T(80520018, 2750), T(80520017, 650), T(80520019, 3), T(80520018, 300))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001801:42318000",
      "12001802:42318000",
      "12001803:42318002"
    },
    target_type = 2041,
    damage_rate = 65000,
    buff_list = {
      "43218001:3006:10000:1008001",
      "43218002:3006:10000:1008001",
      "43218003:3014:10000",
      "43218004:3001:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 421,
    extra_skill = 41005180001
  },
  [41013180002] = {
    id = 41013180002,
    des = function()
      return T(80531801, T(80520012, 30), T(80520019, 100), T(80520018, 3000), T(80520017, 700), T(80520019, 3.4), T(80520018, 340))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001801:42318000",
      "12001802:42318000",
      "12001803:42318002"
    },
    target_type = 2041,
    damage_rate = 70000,
    buff_list = {
      "43218005:3006:10000:1008001",
      "43218006:3006:10000:1008001",
      "43218007:3014:10000",
      "43218004:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 421,
    extra_skill = 41005180002
  },
  [41013180003] = {
    id = 41013180003,
    des = function()
      return T(80531801, T(80520012, 30), T(80520019, 105), T(80520018, 3250), T(80520017, 750), T(80520019, 3.8), T(80520018, 380))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001801:42318000",
      "12001802:42318000",
      "12001803:42318002"
    },
    target_type = 2041,
    damage_rate = 75000,
    buff_list = {
      "43218008:3006:10000:1008001",
      "43218009:3006:10000:1008001",
      "43218010:3014:10000",
      "43218004:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020026:2"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 421,
    extra_skill = 41005180003
  },
  [41013180004] = {
    id = 41013180004,
    des = function()
      return T(80531801, T(80520012, 30), T(80520019, 110), T(80520018, 3500), T(80520017, 800), T(80520019, 4.2), T(80520018, 420))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001801:42318000",
      "12001802:42318000",
      "12001803:42318002"
    },
    target_type = 2041,
    damage_rate = 80000,
    buff_list = {
      "43218011:3006:10000:1008001",
      "43218012:3006:10000:1008001",
      "43218013:3014:10000",
      "43218004:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020013:3"
    },
    need_quality_level = 3,
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 421,
    extra_skill = 41005180004
  },
  [41013180005] = {
    id = 41013180005,
    des = function()
      return T(80531801, T(80520012, 30), T(80520019, 115), T(80520018, 3750), T(80520017, 850), T(80520019, 4.6), T(80520018, 460))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001801:42318000",
      "12001802:42318000",
      "12001803:42318002"
    },
    target_type = 2041,
    damage_rate = 85000,
    buff_list = {
      "43218014:3006:10000:1008001",
      "43218015:3006:10000:1008001",
      "43218016:3014:10000",
      "43218004:3001:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 421,
    extra_skill = 41005180005
  },
  [41013180006] = {
    id = 41013180006,
    des = function()
      return T(80531801, T(80520012, 30), T(80520019, 120), T(80520018, 4000), T(80520017, 900), T(80520019, 5), T(80520018, 500))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001801:42318000",
      "12001802:42318000",
      "12001803:42318002"
    },
    target_type = 2041,
    damage_rate = 90000,
    buff_list = {
      "43218017:3006:10000:1008001",
      "43218018:3006:10000:1008001",
      "43218019:3014:10000",
      "43218004:3001:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160,
    tag_id = 421,
    extra_skill = 41005180006
  },
  [41005180001] = {
    id = 41005180001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43218020:3001:10000",
      "43218021:3001:10000"
    }
  },
  [41005180002] = {
    id = 41005180002,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43218022:3001:10000",
      "43218023:3001:10000"
    },
    need_quality_level = 2
  },
  [41005180003] = {
    id = 41005180003,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43218024:3001:10000",
      "43218025:3001:10000"
    },
    need_quality_level = 3
  },
  [41005180004] = {
    id = 41005180004,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43218026:3001:10000",
      "43218027:3001:10000"
    },
    need_quality_level = 3
  },
  [41005180005] = {
    id = 41005180005,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43218028:3001:10000",
      "43218029:3001:10000"
    }
  },
  [41005180006] = {
    id = 41005180006,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43218030:3001:10000",
      "43218031:3001:10000"
    }
  },
  [41014180001] = {
    id = 41014180001,
    des = function()
      return T(80540001, T(80520014, T(80000102)), T(80520011, 1002))
    end,
    add_attr = {
      "1:40000102:1002"
    }
  },
  [41015180001] = {
    id = 41015180001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012180:1", "41013180:1"}
  },
  [41016180001] = {
    id = 41016180001,
    des = function()
      return T(80561801, T(80520012, 50), T(80520011, 10), T(80520012, 10))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43318001:3001:10000",
      "43318002:3001:10000:1008001"
    },
    association_des = function()
      return T(80561801, T(80520012, 50), T(80520011, 10), T(80520012, 10))
    end
  },
  [41017180001] = {
    id = 41017180001,
    des = function()
      return T(80570001, T(80520014, T(80000102)), T(80520011, 1441))
    end,
    add_attr = {
      "1:40000102:1441"
    }
  },
  [41018180001] = {
    id = 41018180001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012180:2", "41013180:2"}
  },
  [41001180001] = {
    id = 41001180001,
    des = function()
      return T(80520016, T(80000104), 55)
    end,
    add_attr = {
      "1:40000104:55"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001180002] = {
    id = 41001180002,
    des = function()
      return T(80520016, T(80000104), 110)
    end,
    add_attr = {
      "1:40000104:110"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 1
  },
  [41001180003] = {
    id = 41001180003,
    des = function()
      return T(80520016, T(80000104), 165)
    end,
    add_attr = {
      "1:40000104:165"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 2
  },
  [41002180001] = {
    id = 41002180001,
    des = function()
      return T(80520015, T(80000202), 3)
    end,
    add_attr = {
      "1:40000202:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002180002] = {
    id = 41002180002,
    des = function()
      return T(80520015, T(80000202), 8)
    end,
    add_attr = {
      "1:40000202:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 2
  },
  [41002180003] = {
    id = 41002180003,
    des = function()
      return T(80520015, T(80000202), 15)
    end,
    add_attr = {
      "1:40000202:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41003180001] = {
    id = 41003180001,
    des = function()
      return T(80520016, T(80000102), 576)
    end,
    add_attr = {
      "1:40000102:576"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003180002] = {
    id = 41003180002,
    des = function()
      return T(80520016, T(80000102), 1152)
    end,
    add_attr = {
      "1:40000102:1152"
    },
    cost = {
      "1:21040002:2",
      "1:21020001:2"
    },
    need_quality_level = 3
  },
  [41003180003] = {
    id = 41003180003,
    des = function()
      return T(80520016, T(80000102), 1728)
    end,
    add_attr = {
      "1:40000102:1728"
    },
    cost = {
      "1:21040003:2",
      "1:21020006:2"
    },
    need_quality_level = 3
  },
  [41019180001] = {
    id = 41019180001,
    des = function()
      return T(80591801, T(80520012, 5), T(80520012, 15))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43418001:3002:10000",
      "43418002:3002:10000"
    }
  },
  [41011139001] = {
    id = 41011139001,
    des = function()
      return T(80510001, T(80520017, 70))
    end,
    fashion_show_ids = {
      "12001391:42113900",
      "12001392:42113900",
      "12001393:42113902"
    },
    damage_rate = 7000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43113902:0:3000",
      "43113909:0:3000",
      "43113911:0:3000",
      "43113913:0:3000",
      "43113915:0:3000",
      "43113917:0:3000",
      "43113903:0:5000",
      "43113904:0:10000"
    }
  },
  [41011139002] = {
    id = 41011139002,
    des = function()
      return T(80510001, T(80520017, 80))
    end,
    fashion_show_ids = {
      "12001391:42113900",
      "12001392:42113900",
      "12001393:42113902"
    },
    damage_rate = 8000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43113902:0:3000",
      "43113909:0:3000",
      "43113911:0:3000",
      "43113913:0:3000",
      "43113915:0:3000",
      "43113917:0:3000",
      "43113903:0:5000",
      "43113904:0:10000"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41011139003] = {
    id = 41011139003,
    des = function()
      return T(80510001, T(80520017, 90))
    end,
    fashion_show_ids = {
      "12001391:42113900",
      "12001392:42113900",
      "12001393:42113902"
    },
    damage_rate = 9000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43113902:0:3000",
      "43113909:0:3000",
      "43113911:0:3000",
      "43113913:0:3000",
      "43113915:0:3000",
      "43113917:0:3000",
      "43113903:0:5000",
      "43113904:0:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 1
  },
  [41011139004] = {
    id = 41011139004,
    des = function()
      return T(80510001, T(80520017, 100))
    end,
    fashion_show_ids = {
      "12001391:42113900",
      "12001392:42113900",
      "12001393:42113902"
    },
    damage_rate = 10000,
    bullet_speed = 1000,
    bullet_buff_list = {
      "43113902:0:3000",
      "43113909:0:3000",
      "43113911:0:3000",
      "43113913:0:3000",
      "43113915:0:3000",
      "43113917:0:3000",
      "43113903:0:5000",
      "43113904:0:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:2"
    },
    need_quality_level = 2
  },
  [41012139001] = {
    id = 41012139001,
    des = function()
      return T(80521391, T(80520012, 30), T(80520017, 90), T(80520012, 50), T(80520012, 7), T(80520011, 800))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113901:3001:10000"
    }
  },
  [41012139002] = {
    id = 41012139002,
    des = function()
      return T(80521391, T(80520012, 30), T(80520017, 100), T(80520012, 50), T(80520012, 7), T(80520011, 800))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113908:3001:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41012139003] = {
    id = 41012139003,
    des = function()
      return T(80521391, T(80520012, 30), T(80520017, 110), T(80520012, 50), T(80520012, 7), T(80520011, 800))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113910:3001:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 2
  },
  [41012139004] = {
    id = 41012139004,
    des = function()
      return T(80521391, T(80520012, 30), T(80520017, 120), T(80520012, 50), T(80520012, 7), T(80520011, 800))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113912:3001:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:2"
    },
    need_quality_level = 3
  },
  [41012139005] = {
    id = 41012139005,
    des = function()
      return T(80521391, T(80520012, 30), T(80520017, 130), T(80520012, 50), T(80520012, 7), T(80520011, 800))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113914:3001:10000"
    }
  },
  [41012139006] = {
    id = 41012139006,
    des = function()
      return T(80521391, T(80520012, 30), T(80520017, 140), T(80520012, 50), T(80520012, 7), T(80520011, 800))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43113916:3001:10000"
    }
  },
  [41013139001] = {
    id = 41013139001,
    des = function()
      return T(80531391, T(80520017, 1500), T(80520017, 45))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001391:42313900",
      "12001392:42313900",
      "12001393:42313902"
    },
    target_type = 2001,
    damage_rate = 150000,
    buff_list = {
      "43213901:3001:10000",
      "43213902:3001:10000",
      "43213903:1000:10000"
    },
    tag_id = 105
  },
  [41013139002] = {
    id = 41013139002,
    des = function()
      return T(80531391, T(80520017, 1600), T(80520017, 50))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001391:42313900",
      "12001392:42313900",
      "12001393:42313902"
    },
    target_type = 2001,
    damage_rate = 160000,
    buff_list = {
      "43213904:3001:10000",
      "43213905:3001:10000",
      "43213903:1000:10000"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2,
    tag_id = 105
  },
  [41013139003] = {
    id = 41013139003,
    des = function()
      return T(80531391, T(80520017, 1700), T(80520017, 55))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001391:42313900",
      "12001392:42313900",
      "12001393:42313902"
    },
    target_type = 2001,
    damage_rate = 170000,
    buff_list = {
      "43213906:3001:10000",
      "43213907:3001:10000",
      "43213903:1000:10000"
    },
    cost = {
      "1:21040002:2",
      "1:21020029:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013139004] = {
    id = 41013139004,
    des = function()
      return T(80531391, T(80520017, 1800), T(80520017, 60))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001391:42313900",
      "12001392:42313900",
      "12001393:42313902"
    },
    target_type = 2001,
    damage_rate = 180000,
    buff_list = {
      "43213908:3001:10000",
      "43213909:3001:10000",
      "43213903:1000:10000"
    },
    cost = {
      "1:21040003:2",
      "1:21020020:2"
    },
    need_quality_level = 3,
    tag_id = 105
  },
  [41013139005] = {
    id = 41013139005,
    des = function()
      return T(80531391, T(80520017, 1900), T(80520017, 65))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001391:42313900",
      "12001392:42313900",
      "12001393:42313902"
    },
    target_type = 2001,
    damage_rate = 190000,
    buff_list = {
      "43213910:3001:10000",
      "43213911:3001:10000",
      "43213903:1000:10000"
    },
    tag_id = 105
  },
  [41013139006] = {
    id = 41013139006,
    des = function()
      return T(80531391, T(80520017, 2000), T(80520017, 70))
    end,
    remark = function()
      return T(80418002)
    end,
    fashion_show_ids = {
      "12001391:42313900",
      "12001392:42313900",
      "12001393:42313902"
    },
    target_type = 2001,
    damage_rate = 200000,
    buff_list = {
      "43213912:3001:10000",
      "43213913:3001:10000",
      "43213903:1000:10000"
    },
    tag_id = 105
  },
  [41014139001] = {
    id = 41014139001,
    des = function()
      return T(80541391, T(80520014, T(80000103)), T(80520011, 30), T(80520012, 50))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313901:3001:10000"
    },
    add_attr = {
      "1:40000103:30"
    },
    association_des = function()
      return T(80541392, T(80520012, 50))
    end
  },
  [41015139001] = {
    id = 41015139001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012139:1", "41013139:1"}
  },
  [41016139001] = {
    id = 41016139001,
    des = function()
      return T(80561391, T(80520012, 30))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43313902:3001:10000"
    },
    association_des = function()
      return T(80561391, T(80520012, 30))
    end
  },
  [41017139001] = {
    id = 41017139001,
    des = function()
      return T(80570001, T(80520014, T(80000103)), T(80520011, 92))
    end,
    add_attr = {
      "1:40000103:92"
    }
  },
  [41018139001] = {
    id = 41018139001,
    des = function()
      return T(80550001, T(80520011, 1), T(80520011, 1))
    end,
    set_skill_level = {"41012139:2", "41013139:2"}
  },
  [41001139001] = {
    id = 41001139001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    }
  },
  [41001139002] = {
    id = 41001139002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 1
  },
  [41001139003] = {
    id = 41001139003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 2
  },
  [41002139001] = {
    id = 41002139001,
    des = function()
      return T(80520015, T(80000201), 3)
    end,
    add_attr = {
      "1:40000201:300"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 1
  },
  [41002139002] = {
    id = 41002139002,
    des = function()
      return T(80520015, T(80000201), 8)
    end,
    add_attr = {
      "1:40000201:800"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 2
  },
  [41002139003] = {
    id = 41002139003,
    des = function()
      return T(80520015, T(80000201), 15)
    end,
    add_attr = {
      "1:40000201:1500"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41003139001] = {
    id = 41003139001,
    des = function()
      return T(80520016, T(80000103), 37)
    end,
    add_attr = {
      "1:40000103:37"
    },
    cost = {
      "1:21040001:1"
    },
    need_quality_level = 2
  },
  [41003139002] = {
    id = 41003139002,
    des = function()
      return T(80520016, T(80000103), 74)
    end,
    add_attr = {
      "1:40000103:74"
    },
    cost = {
      "1:21040002:2",
      "1:21020004:2"
    },
    need_quality_level = 3
  },
  [41003139003] = {
    id = 41003139003,
    des = function()
      return T(80520016, T(80000103), 110)
    end,
    add_attr = {
      "1:40000103:110"
    },
    cost = {
      "1:21040003:2",
      "1:21020009:2"
    },
    need_quality_level = 3
  },
  [41019139001] = {
    id = 41019139001,
    des = function()
      return T(80591391, T(80520012, 20))
    end,
    target_type = 3002,
    trigger_condition_1 = {1111},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43413901:3002:10000"
    }
  },
  [41031001001] = {
    id = 41031001001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010011:42500100"
    },
    damage_rate = 10000
  },
  [41031002001] = {
    id = 41031002001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010021:42500200"
    },
    damage_rate = 10000
  },
  [41031003001] = {
    id = 41031003001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010031:42500300"
    },
    damage_rate = 10000
  },
  [41031004001] = {
    id = 41031004001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010041:42500400"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41031005001] = {
    id = 41031005001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010051:42500500"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41031006001] = {
    id = 41031006001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010061:42500600"
    },
    damage_rate = 10000
  },
  [41032006001] = {
    id = 41032006001,
    des = function()
      return T(80730061)
    end,
    fashion_show_ids = {
      "12010061:42600600"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43700601:3001:10000"
    }
  },
  [41031007001] = {
    id = 41031007001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010071:42500700"
    },
    damage_rate = 10000
  },
  [41032007001] = {
    id = 41032007001,
    des = function()
      return T(80730071)
    end,
    fashion_show_ids = {
      "12010071:42600700"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43700701:3001:3000"
    }
  },
  [41031008001] = {
    id = 41031008001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010081:42500800"
    },
    damage_rate = 10000
  },
  [41032008001] = {
    id = 41032008001,
    des = function()
      return T(80730081)
    end,
    fashion_show_ids = {
      "12010081:42600800"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43700801:3001:3000"
    }
  },
  [41031009001] = {
    id = 41031009001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010091:42500900"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41032009001] = {
    id = 41032009001,
    des = function()
      return T(80730091)
    end,
    fashion_show_ids = {
      "12010091:42600900"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43700901:3011:10000"
    },
    bullet_speed = 550
  },
  [41031010001] = {
    id = 41031010001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010101:42501000"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41032010001] = {
    id = 41032010001,
    des = function()
      return T(80730101)
    end,
    fashion_show_ids = {
      "12010101:42601000"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43701001:3001:3000"
    },
    bullet_speed = 650
  },
  [41031011001] = {
    id = 41031011001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010111:42501100"
    },
    damage_rate = 10000
  },
  [41033011001] = {
    id = 41033011001,
    des = function()
      return T(80730111)
    end,
    fashion_show_ids = {
      "12010111:42701100"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43701101:3031:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031012001] = {
    id = 41031012001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010121:42501200"
    },
    damage_rate = 10000
  },
  [41033012001] = {
    id = 41033012001,
    des = function()
      return T(80730121)
    end,
    fashion_show_ids = {
      "12010121:42701200"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43701201:1000:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031013001] = {
    id = 41031013001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010131:42501300"
    },
    damage_rate = 10000
  },
  [41033013001] = {
    id = 41033013001,
    des = function()
      return T(80730131)
    end,
    fashion_show_ids = {
      "12010131:42701300"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43701301:3001:10000"
    }
  },
  [41031014001] = {
    id = 41031014001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010141:42501400"
    },
    damage_rate = 10000,
    bullet_speed = 750
  },
  [41033014001] = {
    id = 41033014001,
    des = function()
      return T(80730141)
    end,
    fashion_show_ids = {
      "12010141:42701400"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43701401:3002:10000"
    }
  },
  [41031015001] = {
    id = 41031015001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010151:42501500"
    },
    damage_rate = 10000
  },
  [41033015001] = {
    id = 41033015001,
    des = function()
      return T(80730151)
    end,
    fashion_show_ids = {
      "12010151:42701500"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43701501:1000:10000"
    }
  },
  [41031016001] = {
    id = 41031016001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010161:42501600"
    },
    damage_rate = 10000
  },
  [41032016001] = {
    id = 41032016001,
    des = function()
      return T(80730161)
    end,
    fashion_show_ids = {
      "12010161:42601600"
    },
    target_type = 2041,
    damage_rate = 15000,
    range_type = 1,
    range_x = 300,
    range_y = 300
  },
  [41035016001] = {
    id = 41035016001,
    des = function()
      return T(80730162)
    end,
    fashion_show_ids = {
      "12010161:42601610"
    },
    target_type = 2053,
    damage_rate = 0,
    buff_list = {
      "43701601:1000:10000"
    }
  },
  [41036016001] = {
    id = 41036016001,
    des = function()
      return T(80730163)
    end,
    fashion_show_ids = {
      "12010161:42601620"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43701602:3001:10000:2001601",
      "43701603:3001:10000"
    }
  },
  [41033016001] = {
    id = 41033016001,
    des = function()
      return T(80730164)
    end,
    fashion_show_ids = {
      "12010161:42701600"
    },
    target_type = 3001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    buff_list = {
      "43701605:2631:10000:0:10"
    }
  },
  [41034016001] = {
    id = 41034016001,
    des = function()
      return T(80730165)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43701606:3001:10000",
      "43701607:3001:10000",
      "43701608:3001:10000",
      "43701609:3001:10000",
      "43701610:3001:10000",
      "43701611:3001:10000"
    }
  },
  [41031017001] = {
    id = 41031017001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010171:42501700"
    },
    damage_rate = 10000
  },
  [41032017001] = {
    id = 41032017001,
    des = function()
      return T(80730171)
    end,
    fashion_show_ids = {
      "12010171:42601700"
    },
    target_type = 2011,
    damage_rate = 15000,
    buff_list = {
      "43701701:1000:10000"
    },
    range_type = 1,
    range_x = 80,
    range_y = 80
  },
  [41033017001] = {
    id = 41033017001,
    des = function()
      return T(80730172)
    end,
    fashion_show_ids = {
      "12010171:42701700"
    },
    target_type = 2021,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 30000,
    buff_list = {
      "43701702:1000:10000",
      "43701703:1000:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41034017001] = {
    id = 41034017001,
    des = function()
      return T(80730173)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43701704:2021:10000",
      "43701705:3001:10000"
    }
  },
  [41031018001] = {
    id = 41031018001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010181:42501800"
    },
    damage_rate = 15000
  },
  [41032018001] = {
    id = 41032018001,
    des = function()
      return T(80730181)
    end,
    fashion_show_ids = {
      "12010181:42601800"
    },
    target_type = 2041,
    damage_rate = 15000,
    range_type = 1,
    range_x = 500,
    range_y = 500
  },
  [41035018001] = {
    id = 41035018001,
    des = function()
      return T(80730182)
    end,
    fashion_show_ids = {
      "12010181:42601810"
    },
    target_type = 2056,
    damage_rate = 0,
    buff_list = {
      "43701801:1000:10000"
    }
  },
  [41036018001] = {
    id = 41036018001,
    des = function()
      return T(80730183)
    end,
    fashion_show_ids = {
      "12010181:42601820"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43701802:3001:10000:2001601",
      "43701803:3001:10000"
    }
  },
  [41033018001] = {
    id = 41033018001,
    des = function()
      return T(80730184)
    end,
    fashion_show_ids = {
      "12010181:42701800"
    },
    target_type = 2491,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    bomb_delay_frame = 55,
    bomb_interval_frame = 2,
    bomb_buff_list = {
      "43701805:0:10000"
    }
  },
  [41034018001] = {
    id = 41034018001,
    des = function()
      return T(80730185)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0
  },
  [41031101001] = {
    id = 41031101001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011011:42510100"
    },
    damage_rate = 10000
  },
  [41031102001] = {
    id = 41031102001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011021:42510200"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41031103001] = {
    id = 41031103001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011031:42510300"
    },
    damage_rate = 10000
  },
  [41032103001] = {
    id = 41032103001,
    des = function()
      return T(80731031)
    end,
    fashion_show_ids = {
      "12011031:42610300"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43710301:3001:10000"
    }
  },
  [41031104001] = {
    id = 41031104001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011041:42510400"
    },
    damage_rate = 10000
  },
  [41032104001] = {
    id = 41032104001,
    des = function()
      return T(80731041)
    end,
    fashion_show_ids = {
      "12011041:42610400"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43710401:1000:10000"
    }
  },
  [41031105001] = {
    id = 41031105001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011051:42510500"
    },
    damage_rate = 10000
  },
  [41032105001] = {
    id = 41032105001,
    des = function()
      return T(80731051)
    end,
    fashion_show_ids = {
      "12011051:42610500"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43710501:3001:3000"
    }
  },
  [41031106001] = {
    id = 41031106001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011061:42510600"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41032106001] = {
    id = 41032106001,
    des = function()
      return T(80731061)
    end,
    fashion_show_ids = {
      "12011061:42610600"
    },
    target_type = 2011,
    damage_rate = 15000,
    bullet_speed = 550,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031107001] = {
    id = 41031107001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011071:42510700"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41032107001] = {
    id = 41032107001,
    des = function()
      return T(80731071)
    end,
    fashion_show_ids = {
      "12011071:42610700"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43710701:3001:3000"
    },
    bullet_speed = 650
  },
  [41031108001] = {
    id = 41031108001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011081:42510800"
    },
    damage_rate = 10000
  },
  [41033108001] = {
    id = 41033108001,
    des = function()
      return T(80731081)
    end,
    fashion_show_ids = {
      "12011081:42710800"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43710801:2103:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031109001] = {
    id = 41031109001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011091:42510900"
    },
    damage_rate = 10000
  },
  [41033109001] = {
    id = 41033109001,
    des = function()
      return T(80731091)
    end,
    fashion_show_ids = {
      "12011091:42710900"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43710901:1000:10000"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41031110001] = {
    id = 41031110001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011101:42511000"
    },
    damage_rate = 10000
  },
  [41032110001] = {
    id = 41032110001,
    des = function()
      return T(80731101)
    end,
    fashion_show_ids = {
      "12011101:42611000"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43711001:1000:10000"
    }
  },
  [41031111001] = {
    id = 41031111001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011111:42511100"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41032111001] = {
    id = 41032111001,
    des = function()
      return T(80731111)
    end,
    fashion_show_ids = {
      "12011111:42611100"
    },
    target_type = 3002,
    damage_rate = 0,
    buff_list = {
      "43711101:1000:10000",
      "43711102:1000:10000"
    }
  },
  [41031112001] = {
    id = 41031112001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011121:42511200"
    },
    damage_rate = 10000,
    bullet_speed = 850
  },
  [41033112001] = {
    id = 41033112001,
    des = function()
      return T(80731121)
    end,
    fashion_show_ids = {
      "12011121:42711200"
    },
    target_type = 2021,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 30000,
    buff_list = {
      "43711201:1000:10000"
    },
    bullet_speed = 850
  },
  [41031113001] = {
    id = 41031113001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011131:42511300"
    },
    damage_rate = 10000,
    bullet_speed = 900
  },
  [41032113001] = {
    id = 41032113001,
    des = function()
      return T(80731131)
    end,
    fashion_show_ids = {
      "12011131:42611300"
    },
    target_type = 2011,
    damage_rate = 15000,
    buff_list = {
      "43711301:1000:10000"
    },
    bullet_speed = 900,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41033113001] = {
    id = 41033113001,
    des = function()
      return T(80731132)
    end,
    fashion_show_ids = {
      "12011131:42711300"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43711302:1000:10000"
    },
    bullet_speed = 900,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41034113001] = {
    id = 41034113001,
    des = function()
      return T(80731133)
    end,
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    buff_list = {
      "43711303:2071:10000"
    }
  },
  [41031114001] = {
    id = 41031114001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011141:42511400"
    },
    damage_rate = 10000
  },
  [41032114001] = {
    id = 41032114001,
    des = function()
      return T(80731141)
    end,
    fashion_show_ids = {
      "12011141:42611400"
    },
    target_type = 2052,
    damage_rate = 15000,
    bullet_speed = 900
  },
  [41033114001] = {
    id = 41033114001,
    des = function()
      return T(80731142)
    end,
    fashion_show_ids = {
      "12011141:42711400"
    },
    target_type = 3001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    buff_list = {
      "43711401:3001:10000"
    }
  },
  [41034114001] = {
    id = 41034114001,
    des = function()
      return T(80731143)
    end,
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {20},
    buff_list = {
      "43711402:2021:10000",
      "43711403:2051:10000"
    }
  },
  [41031115001] = {
    id = 41031115001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011151:42511500"
    },
    damage_rate = 10000
  },
  [41032115001] = {
    id = 41032115001,
    des = function()
      return T(80731151)
    end,
    fashion_show_ids = {
      "12011151:42611500"
    },
    target_type = 2001,
    damage_rate = 15000,
    buff_list = {
      "43711501:2041:10000"
    }
  },
  [41035115001] = {
    id = 41035115001,
    des = function()
      return T(80731152)
    end,
    fashion_show_ids = {
      "12011151:42611510"
    },
    target_type = 2041,
    damage_rate = 15000,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41036115001] = {
    id = 41036115001,
    des = function()
      return T(80731153)
    end,
    fashion_show_ids = {
      "12011151:42611520"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43711502:3001:10000",
      "43711503:3001:10000"
    }
  },
  [41033115001] = {
    id = 41033115001,
    des = function()
      return T(80731154)
    end,
    fashion_show_ids = {
      "12011151:42711500"
    },
    target_type = 2021,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 30000,
    bullet_speed = 900,
    bullet_interval = 5
  },
  [41034115001] = {
    id = 41034115001,
    des = function()
      return T(80731155)
    end,
    target_type = 2021,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43711504:2021:10000"
    }
  },
  [41031117001] = {
    id = 41031117001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011171:42511700"
    },
    damage_rate = 10000
  },
  [41032117001] = {
    id = 41032117001,
    des = function()
      return T(80731171)
    end,
    fashion_show_ids = {
      "12011171:42611700"
    },
    target_type = 2001,
    damage_rate = 15000,
    buff_list = {
      "43711701:1000:10000"
    }
  },
  [41035117001] = {
    id = 41035117001,
    des = function()
      return T(80731172)
    end,
    fashion_show_ids = {
      "12011171:42611710"
    },
    target_type = 2041,
    damage_rate = 15000,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41036117001] = {
    id = 41036117001,
    des = function()
      return T(80731173)
    end,
    fashion_show_ids = {
      "12011171:42611720"
    },
    target_type = 2471,
    damage_rate = 15000,
    buff_list = {
      "43711702:2021:10000:2011702"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41033117001] = {
    id = 41033117001,
    des = function()
      return T(80731174)
    end,
    fashion_show_ids = {
      "12011171:42711700"
    },
    target_type = 2461,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 30000,
    buff_list = {
      "43711703:3001:10000",
      "43711704:2451:10000:2011703"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200,
    not_fixed_target = 1
  },
  [41034117001] = {
    id = 41034117001,
    des = function()
      return T(80731175)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43711705:3001:10000"
    }
  },
  [41031118001] = {
    id = 41031118001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011181:42511800"
    },
    damage_rate = 10000
  },
  [41032118001] = {
    id = 41032118001,
    des = function()
      return T(80731181)
    end,
    fashion_show_ids = {
      "12011181:42611800"
    },
    target_type = 2053,
    damage_rate = 15000,
    bullet_speed = 900
  },
  [41033118001] = {
    id = 41033118001,
    des = function()
      return T(80731182)
    end,
    fashion_show_ids = {
      "12011181:42711800"
    },
    target_type = 2491,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    bomb_delay_frame = 90,
    bomb_interval_frame = 1,
    bomb_buff_list = {
      "43711801:0:10000"
    }
  },
  [41034118001] = {
    id = 41034118001,
    des = function()
      return T(80731183)
    end,
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {20},
    buff_list = {
      "43711805:2021:10000",
      "43711806:2051:10000"
    }
  },
  [41031201001] = {
    id = 41031201001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012011:42520100"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41031202001] = {
    id = 41031202001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012021:42520200"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41031203001] = {
    id = 41031203001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012031:42520300"
    },
    damage_rate = 10000
  },
  [41032203001] = {
    id = 41032203001,
    des = function()
      return T(80732031)
    end,
    fashion_show_ids = {
      "12012031:42620300"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43720301:1000:10000"
    }
  },
  [41031204001] = {
    id = 41031204001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012041:42520400"
    },
    damage_rate = 10000
  },
  [41032204001] = {
    id = 41032204001,
    des = function()
      return T(80732041)
    end,
    fashion_show_ids = {
      "12012041:42620400"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43720401:3001:3000"
    }
  },
  [41031205001] = {
    id = 41031205001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012051:42520500"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41032205001] = {
    id = 41032205001,
    des = function()
      return T(80732051)
    end,
    fashion_show_ids = {
      "12012051:42620500"
    },
    target_type = 2071,
    damage_rate = 30000,
    bullet_speed = 550
  },
  [41031206001] = {
    id = 41031206001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012061:42520600"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41032206001] = {
    id = 41032206001,
    des = function()
      return T(80732061)
    end,
    fashion_show_ids = {
      "12012061:42620600"
    },
    target_type = 2052,
    damage_rate = 23000,
    bullet_speed = 650
  },
  [41031207001] = {
    id = 41031207001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012071:42520700"
    },
    damage_rate = 10000
  },
  [41032207001] = {
    id = 41032207001,
    des = function()
      return T(80732071)
    end,
    fashion_show_ids = {
      "12012071:42620700"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43720701:3001:10000:120"
    }
  },
  [41031208001] = {
    id = 41031208001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012081:42520800"
    },
    damage_rate = 10000
  },
  [41032208001] = {
    id = 41032208001,
    des = function()
      return T(80732081)
    end,
    fashion_show_ids = {
      "12012081:42620800"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43720801:1000:10000"
    }
  },
  [41031209001] = {
    id = 41031209001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012091:42520900"
    },
    damage_rate = 10000
  },
  [41033209001] = {
    id = 41033209001,
    des = function()
      return T(80732091)
    end,
    fashion_show_ids = {
      "12012091:42720900"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43720901:1000:10000"
    }
  },
  [41031210001] = {
    id = 41031210001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012101:42521000"
    },
    damage_rate = 10000
  },
  [41033210001] = {
    id = 41033210001,
    des = function()
      return T(80732101)
    end,
    fashion_show_ids = {
      "12012101:42721000"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031211001] = {
    id = 41031211001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012111:42521100"
    },
    damage_rate = 10000,
    bullet_speed = 850
  },
  [41033211001] = {
    id = 41033211001,
    des = function()
      return T(80732111)
    end,
    fashion_show_ids = {
      "12012111:42721100"
    },
    target_type = 2071,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    bullet_speed = 850
  },
  [41031212001] = {
    id = 41031212001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012121:42521200"
    },
    damage_rate = 10000
  },
  [41032212001] = {
    id = 41032212001,
    des = function()
      return T(80732121)
    end,
    fashion_show_ids = {
      "12012121:42621200"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43721201:1000:10000"
    }
  },
  [41033212001] = {
    id = 41033212001,
    des = function()
      return T(80732122)
    end,
    fashion_show_ids = {
      "12012121:42721200"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43721202:3001:3000"
    }
  },
  [41034212001] = {
    id = 41034212001,
    des = function()
      return T(80732123)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43721203:3001:10000",
      "43721204:3001:10000"
    }
  },
  [41035212001] = {
    id = 41035212001,
    des = function()
      return T(80732124)
    end,
    fashion_show_ids = {
      "12012121:42921200"
    },
    target_type = 2021,
    trigger_condition_1 = {1081},
    trigger_type_1 = {4},
    trigger_value_1 = {9000},
    trigger_max = 1,
    buff_list = {
      "43721205:1000:10000"
    }
  },
  [41031213001] = {
    id = 41031213001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011141:42511400"
    },
    damage_rate = 10000,
    bullet_speed = 900
  },
  [41032213001] = {
    id = 41032213001,
    des = function()
      return T(80732131)
    end,
    fashion_show_ids = {
      "12011141:42611400"
    },
    target_type = 2071,
    damage_rate = 30000,
    buff_list = {
      "43721301:1000:10000"
    },
    bullet_speed = 900
  },
  [41033213001] = {
    id = 41033213001,
    des = function()
      return T(80732132)
    end,
    fashion_show_ids = {
      "12011141:42711400"
    },
    target_type = 2071,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43721302:3001:3000"
    },
    bullet_speed = 900
  },
  [41034213001] = {
    id = 41034213001,
    des = function()
      return T(80732133)
    end,
    target_type = 3001,
    trigger_condition_1 = {1012},
    trigger_type_1 = {5},
    trigger_value_1 = {4},
    buff_list = {
      "43721303:2001:10000"
    }
  },
  [41031214001] = {
    id = 41031214001,
    des = function()
      return T(80732140)
    end,
    fashion_show_ids = {
      "12012141:42521400"
    },
    damage_rate = 10000,
    bullet_speed = 900,
    bullet_buff_list = {
      "43721402:0:10000"
    }
  },
  [41032214001] = {
    id = 41032214001,
    des = function()
      return T(80732141, T(80520011, 5))
    end,
    fashion_show_ids = {
      "12012141:42621400"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43721403:3001:10000",
      "43721405:1002:10000"
    }
  },
  [41035214001] = {
    id = 41035214001,
    des = function()
      return T(80732142)
    end,
    fashion_show_ids = {
      "12012141:42621410"
    },
    target_type = 2001,
    damage_rate = 0,
    bullet_speed = 900,
    bullet_buff_list = {
      "43721406:0:10000"
    }
  },
  [41036214001] = {
    id = 41036214001,
    des = function()
      return T(80732143, T(80520011, 10))
    end,
    fashion_show_ids = {
      "12012141:42621420"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43721409:3001:10000"
    }
  },
  [41033214001] = {
    id = 41033214001,
    des = function()
      return T(80732144)
    end,
    fashion_show_ids = {
      "12012141:42721400"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43721410:3001:10000"
    }
  },
  [41034214001] = {
    id = 41034214001,
    des = function()
      return T(80732145, T(80520011, 12), T(80520011, 8), T(80520012, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721412:3001:10000",
      "43721413:3001:10000"
    }
  },
  [41031216001] = {
    id = 41031216001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12012161:42521600"
    },
    damage_rate = 10000,
    bullet_speed = 900
  },
  [41032216001] = {
    id = 41032216001,
    des = function()
      return T(80732161)
    end,
    fashion_show_ids = {
      "12012161:42621600"
    },
    target_type = 2001,
    damage_rate = 30000,
    bullet_speed = 900,
    bullet_buff_list = {
      "43721602:0:10000"
    }
  },
  [41035216001] = {
    id = 41035216001,
    des = function()
      return T(80732162)
    end,
    fashion_show_ids = {
      "12012161:42621610"
    },
    target_type = 2053,
    damage_rate = 30000,
    buff_list = {
      "43721601:1000:10000"
    }
  },
  [41036216001] = {
    id = 41036216001,
    des = function()
      return T(80732163)
    end,
    fashion_show_ids = {
      "12012161:42621620"
    },
    target_type = 2021,
    damage_rate = 0,
    buff_list = {
      "43721603:2021:10000",
      "43721605:2021:10000:2021601"
    }
  },
  [41033216001] = {
    id = 41033216001,
    des = function()
      return T(80732164)
    end,
    fashion_show_ids = {
      "12012161:42721600"
    },
    target_type = 2051,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43721606:3001:10000"
    },
    range_type = 1,
    range_x = 1,
    range_y = 1
  },
  [41034216001] = {
    id = 41034216001,
    des = function()
      return T(80732165, T(80520011, 3), T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43721607:3001:10000",
      "43721608:3001:10000"
    }
  },
  [41031301001] = {
    id = 41031301001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013011:42530100"
    },
    damage_rate = 10000
  },
  [41031302001] = {
    id = 41031302001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013021:42530200"
    },
    damage_rate = 10000
  },
  [41031303001] = {
    id = 41031303001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013031:42530300"
    },
    damage_rate = 10000
  },
  [41032303001] = {
    id = 41032303001,
    des = function()
      return T(80733031)
    end,
    fashion_show_ids = {
      "12013031:42630300"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43730301:3001:10000:606"
    }
  },
  [41031304001] = {
    id = 41031304001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013041:42530400"
    },
    damage_rate = 10000
  },
  [41032304001] = {
    id = 41032304001,
    des = function()
      return T(80733041)
    end,
    fashion_show_ids = {
      "12013041:42630400"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43730401:1000:10000"
    }
  },
  [41031305001] = {
    id = 41031305001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013051:42530500"
    },
    damage_rate = 10000
  },
  [41032305001] = {
    id = 41032305001,
    des = function()
      return T(80733051)
    end,
    fashion_show_ids = {
      "12013051:42630500"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43730501:3001:3000"
    }
  },
  [41031306001] = {
    id = 41031306001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013061:42530600"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41032306001] = {
    id = 41032306001,
    des = function()
      return T(80733061)
    end,
    fashion_show_ids = {
      "12013061:42630600"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43730601:3002:10000",
      "43730602:3002:10000"
    }
  },
  [41031307001] = {
    id = 41031307001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013071:42530700"
    },
    damage_rate = 10000
  },
  [41033307001] = {
    id = 41033307001,
    des = function()
      return T(80733071)
    end,
    fashion_show_ids = {
      "12013071:42730700"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43730701:3001:10000",
      "43730702:3001:10000"
    }
  },
  [41031308001] = {
    id = 41031308001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013081:42530800"
    },
    damage_rate = 10000
  },
  [41033308001] = {
    id = 41033308001,
    des = function()
      return T(80733081)
    end,
    fashion_show_ids = {
      "12013081:42730800"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43730801:2083:10000"
    }
  },
  [41031309001] = {
    id = 41031309001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013091:42530900"
    },
    damage_rate = 10000
  },
  [41032309001] = {
    id = 41032309001,
    des = function()
      return T(80733091)
    end,
    fashion_show_ids = {
      "12013091:42630900"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43730901:1000:10000"
    }
  },
  [41031310001] = {
    id = 41031310001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013101:42531000"
    },
    damage_rate = 10000
  },
  [41033310001] = {
    id = 41033310001,
    des = function()
      return T(80733101)
    end,
    fashion_show_ids = {
      "12013101:42731000"
    },
    target_type = 3001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    buff_list = {
      "43731001:3002:10000:606",
      "43731002:3002:10000"
    }
  },
  [41031311001] = {
    id = 41031311001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013111:42531100"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41032311001] = {
    id = 41032311001,
    des = function()
      return T(80733111)
    end,
    fashion_show_ids = {
      "12013111:42631100"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43731101:3001:10000"
    },
    bullet_speed = 650
  },
  [41031312001] = {
    id = 41031312001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013121:42531200"
    },
    damage_rate = 10000
  },
  [41032312001] = {
    id = 41032312001,
    des = function()
      return T(80733121)
    end,
    fashion_show_ids = {
      "12013121:42631200"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43731201:3001:10000"
    }
  },
  [41033312001] = {
    id = 41033312001,
    des = function()
      return T(80733122)
    end,
    fashion_show_ids = {
      "12013121:42731200"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43731202:3001:10000:2031202"
    },
    bullet_speed = 500,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41034312001] = {
    id = 41034312001,
    des = function()
      return T(80733123)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43731203:2021:10000"
    }
  },
  [41031313001] = {
    id = 41031313001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12011141:42511400"
    },
    damage_rate = 10000
  },
  [41032313001] = {
    id = 41032313001,
    des = function()
      return T(80733131)
    end,
    fashion_show_ids = {
      "12011141:42611400"
    },
    target_type = 2001,
    damage_rate = 15000,
    buff_list = {
      "43731301:3001:10000",
      "43731302:3001:10000"
    }
  },
  [41033313001] = {
    id = 41033313001,
    des = function()
      return T(80733132)
    end,
    fashion_show_ids = {
      "12011141:42711400"
    },
    target_type = 3001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    buff_list = {
      "43731303:3001:10000"
    }
  },
  [41034313001] = {
    id = 41034313001,
    des = function()
      return T(80733133)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43731305:3001:10000"
    }
  },
  [41031314001] = {
    id = 41031314001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013021:42530200"
    },
    damage_rate = 10000
  },
  [41031315001] = {
    id = 41031315001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013151:42531500"
    },
    damage_rate = 10000
  },
  [41032315001] = {
    id = 41032315001,
    des = function()
      return T(80733151)
    end,
    fashion_show_ids = {
      "12013151:42631500"
    },
    target_type = 2441,
    damage_rate = 30000
  },
  [41035315001] = {
    id = 41035315001,
    des = function()
      return T(80733152)
    end,
    fashion_show_ids = {
      "12013151:42631510"
    },
    target_type = 2449,
    damage_rate = 30000
  },
  [41036315001] = {
    id = 41036315001,
    des = function()
      return T(80733153, T(80520011, 8))
    end,
    fashion_show_ids = {
      "12013151:42631520"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43731501:3001:10000:2031501"
    }
  },
  [41033315001] = {
    id = 41033315001,
    des = function()
      return T(80733154)
    end,
    fashion_show_ids = {
      "12013151:42731500"
    },
    target_type = 2021,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43731502:3001:10000",
      "43731503:1000:10000"
    }
  },
  [41034315001] = {
    id = 41034315001,
    des = function()
      return T(80733155, T(80520011, 28), T(80520011, 6))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43731504:2401:10000",
      "43731508:2411:10000",
      "43731510:2421:10000",
      "43731512:2431:10000"
    }
  },
  [41031317001] = {
    id = 41031317001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12013171:42531700"
    },
    damage_rate = 10000
  },
  [41032317001] = {
    id = 41032317001,
    des = function()
      return T(80733171)
    end,
    fashion_show_ids = {
      "12013171:42631700"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43731701:1000:10000"
    }
  },
  [41035317001] = {
    id = 41035317001,
    des = function()
      return T(80733172)
    end,
    fashion_show_ids = {
      "12013171:42631710"
    },
    target_type = 3081,
    damage_rate = 0,
    buff_list = {
      "43731702:3081:10000:2031705",
      "43731703:3081:10000"
    }
  },
  [41036317001] = {
    id = 41036317001,
    des = function()
      return T(80733173, T(80520011, 10))
    end,
    fashion_show_ids = {
      "12013171:42631720"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43731704:3001:10000:2031706"
    }
  },
  [41033317001] = {
    id = 41033317001,
    des = function()
      return T(80733174, T(80520011, 15))
    end,
    fashion_show_ids = {
      "12013171:42731700"
    },
    target_type = 3001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    buff_list = {
      "43731705:3001:10000:2031702",
      "43731707:3001:10000"
    }
  },
  [41034317001] = {
    id = 41034317001,
    des = function()
      return T(80733175, T(80520011, 5))
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43731710:3001:10000"
    }
  },
  [41031401001] = {
    id = 41031401001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014011:42540100"
    },
    damage_rate = 10000
  },
  [41032401001] = {
    id = 41032401001,
    des = function()
      return T(80734011)
    end,
    fashion_show_ids = {
      "12014011:42640100"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43740101:3001:10000"
    }
  },
  [41031402001] = {
    id = 41031402001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014021:42540200"
    },
    damage_rate = 10000
  },
  [41032402001] = {
    id = 41032402001,
    des = function()
      return T(80734021)
    end,
    fashion_show_ids = {
      "12014021:42640200"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43740201:1000:10000"
    }
  },
  [41031403001] = {
    id = 41031403001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014031:42540300"
    },
    damage_rate = 10000
  },
  [41032403001] = {
    id = 41032403001,
    des = function()
      return T(80734031)
    end,
    fashion_show_ids = {
      "12014031:42640300"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43740301:3001:3000"
    }
  },
  [41031404001] = {
    id = 41031404001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014041:42540400"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41032404001] = {
    id = 41032404001,
    des = function()
      return T(80734041)
    end,
    fashion_show_ids = {
      "12014041:42640400"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43740401:3001:3000"
    },
    bullet_speed = 550
  },
  [41031405001] = {
    id = 41031405001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014051:42540500"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41032405001] = {
    id = 41032405001,
    des = function()
      return T(80734051)
    end,
    fashion_show_ids = {
      "12014051:42640500"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43740501:3001:10000"
    },
    bullet_speed = 650
  },
  [41031406001] = {
    id = 41031406001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014061:42540600"
    },
    damage_rate = 10000
  },
  [41033406001] = {
    id = 41033406001,
    des = function()
      return T(80734061)
    end,
    fashion_show_ids = {
      "12014061:42740600"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43740601:3001:10000:2040601"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031407001] = {
    id = 41031407001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014071:42540700"
    },
    damage_rate = 10000
  },
  [41032407001] = {
    id = 41032407001,
    des = function()
      return T(80734071)
    end,
    fashion_show_ids = {
      "12014071:42640700"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43740701:3001:10000"
    }
  },
  [41031408001] = {
    id = 41031408001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014081:42540800"
    },
    damage_rate = 10000
  },
  [41033408001] = {
    id = 41033408001,
    des = function()
      return T(80734081)
    end,
    fashion_show_ids = {
      "12014081:42740800"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43740801:1000:10000"
    }
  },
  [41031409001] = {
    id = 41031409001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014091:42540900"
    },
    damage_rate = 10000,
    bullet_speed = 750
  },
  [41033409001] = {
    id = 41033409001,
    des = function()
      return T(80734091)
    end,
    fashion_show_ids = {
      "12014091:42740900"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43740901:3001:10000"
    }
  },
  [41031410001] = {
    id = 41031410001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12014101:42541000"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41032410001] = {
    id = 41032410001,
    des = function()
      return T(80734101)
    end,
    fashion_show_ids = {
      "12014101:42641000"
    },
    target_type = 2112,
    damage_rate = 23000
  },
  [41031411001] = {
    id = 41031411001,
    des = function()
      return T(80734111)
    end,
    fashion_show_ids = {
      "12014111:42541100"
    },
    damage_rate = 10000
  },
  [41032411001] = {
    id = 41032411001,
    des = function()
      return T(80734112)
    end,
    fashion_show_ids = {
      "12014111:42641100"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43741101:1000:10000"
    }
  },
  [41035411001] = {
    id = 41035411001,
    des = function()
      return T(80734113)
    end,
    fashion_show_ids = {
      "12014111:42641110"
    },
    target_type = 2041,
    damage_rate = 30000,
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41036411001] = {
    id = 41036411001,
    des = function()
      return T(80734114)
    end,
    fashion_show_ids = {
      "12014111:42641120"
    },
    target_type = 2481,
    damage_rate = 30000
  },
  [41033411001] = {
    id = 41033411001,
    des = function()
      return T(80734115)
    end,
    fashion_show_ids = {
      "12014111:42741100"
    },
    target_type = 2061,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 30000,
    range_type = 4,
    range_x = 1500,
    range_y = 310
  },
  [41034411001] = {
    id = 41034411001,
    des = function()
      return T(80734116)
    end,
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {10},
    buff_list = {
      "43741103:2522:10000:2041101"
    }
  },
  [41031412001] = {
    id = 41031412001,
    des = function()
      return T(80734121)
    end,
    fashion_show_ids = {
      "12014121:42541200"
    },
    target_type = 2001,
    damage_rate = 10000,
    buff_list = {
      "43741201:3001:10000",
      "43741203:2001:10000:2041201"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41032412001] = {
    id = 41032412001,
    des = function()
      return T(80734122)
    end,
    fashion_show_ids = {
      "12014121:42641200"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43741205:1000:10000"
    }
  },
  [41035412001] = {
    id = 41035412001,
    des = function()
      return T(80734123)
    end,
    fashion_show_ids = {
      "12014121:42641210"
    },
    target_type = 2041,
    damage_rate = 30000,
    range_type = 1,
    range_x = 400,
    range_y = 400
  },
  [41036412001] = {
    id = 41036412001,
    des = function()
      return T(80734124)
    end,
    fashion_show_ids = {
      "12014121:42641220"
    },
    target_type = 2481,
    damage_rate = 30000
  },
  [41033412001] = {
    id = 41033412001,
    des = function()
      return T(80734125)
    end,
    fashion_show_ids = {
      "12014121:42741200"
    },
    target_type = 2491,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    bomb_delay_frame = 69,
    bomb_interval_frame = 1,
    bomb_buff_list = {
      "43741206:0:10000"
    }
  },
  [41034412001] = {
    id = 41034412001,
    des = function()
      return T(80734126)
    end,
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {10},
    buff_list = {
      "43741208:2523:10000:2041101"
    }
  },
  [41031501001] = {
    id = 41031501001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015011:42550100"
    },
    damage_rate = 10000
  },
  [41032501001] = {
    id = 41032501001,
    des = function()
      return T(80735011)
    end,
    fashion_show_ids = {
      "12015011:42650100"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43750101:1000:10000"
    }
  },
  [41031502001] = {
    id = 41031502001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015021:42550200"
    },
    damage_rate = 10000
  },
  [41032502001] = {
    id = 41032502001,
    des = function()
      return T(80735021)
    end,
    fashion_show_ids = {
      "12015021:42650200"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43750201:1000:10000"
    }
  },
  [41031503001] = {
    id = 41031503001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015031:42550300"
    },
    damage_rate = 10000
  },
  [41032503001] = {
    id = 41032503001,
    des = function()
      return T(80735031)
    end,
    fashion_show_ids = {
      "12015031:42650300"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43750301:3001:3000"
    }
  },
  [41031504001] = {
    id = 41031504001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015041:42550400"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41032504001] = {
    id = 41032504001,
    des = function()
      return T(80735041)
    end,
    fashion_show_ids = {
      "12015041:42650400"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43750401:3001:3000"
    }
  },
  [41031505001] = {
    id = 41031505001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015051:42550500"
    },
    damage_rate = 10000,
    bullet_speed = 650
  },
  [41032505001] = {
    id = 41032505001,
    des = function()
      return T(80735051)
    end,
    fashion_show_ids = {
      "12015051:42650500"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43750501:3001:10000"
    },
    bullet_speed = 650
  },
  [41031506001] = {
    id = 41031506001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015061:42550600"
    },
    damage_rate = 10000
  },
  [41032506001] = {
    id = 41032506001,
    des = function()
      return T(80735061)
    end,
    fashion_show_ids = {
      "12015061:42650600"
    },
    target_type = 2011,
    damage_rate = 15000,
    buff_list = {
      "43750601:1000:3000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031507001] = {
    id = 41031507001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015071:42550700"
    },
    damage_rate = 10000
  },
  [41033507001] = {
    id = 41033507001,
    des = function()
      return T(80735071)
    end,
    fashion_show_ids = {
      "12015071:42750700"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43750701:3001:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031508001] = {
    id = 41031508001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015081:42550800"
    },
    damage_rate = 10000
  },
  [41032508001] = {
    id = 41032508001,
    des = function()
      return T(80735081)
    end,
    fashion_show_ids = {
      "12015081:42650800"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43750801:1000:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031509001] = {
    id = 41031509001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015091:42550900"
    },
    damage_rate = 10000,
    bullet_speed = 750
  },
  [41033509001] = {
    id = 41033509001,
    des = function()
      return T(80735091)
    end,
    fashion_show_ids = {
      "12015091:42750900"
    },
    target_type = 2072,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 60000,
    bullet_speed = 750
  },
  [41031510001] = {
    id = 41031510001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015101:42551000"
    },
    damage_rate = 10000
  },
  [41033510001] = {
    id = 41033510001,
    des = function()
      return T(80735101)
    end,
    fashion_show_ids = {
      "12015101:42751000"
    },
    target_type = 2011,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 40000,
    buff_list = {
      "43751001:1000:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031511001] = {
    id = 41031511001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12015111:42551100"
    },
    damage_rate = 10000
  },
  [41032511001] = {
    id = 41032511001,
    des = function()
      return T(80735111)
    end,
    fashion_show_ids = {
      "12015111:42651100"
    },
    target_type = 2011,
    damage_rate = 15000,
    buff_list = {
      "43751101:1000:10000",
      "43751102:1000:10000",
      "43751103:1000:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41033511001] = {
    id = 41033511001,
    des = function()
      return T(80735112)
    end,
    fashion_show_ids = {
      "12015111:42751100"
    },
    target_type = 2321,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 80000,
    buff_list = {
      "43751104:1000:100;43751105:1000:900;43751106:1000:3000;43751107:1000:6000"
    }
  },
  [41034511001] = {
    id = 41034511001,
    des = function()
      return T(80735113)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43751108:2051:10000"
    }
  },
  [41034600001] = {
    id = 41034600001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    damage_rate = 0,
    buff_list = {
      "43760001:3001:10000"
    }
  },
  [41034612001] = {
    id = 41034612001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43761201:3001:10000"
    }
  },
  [41034613001] = {
    id = 41034613001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0
  },
  [41034614001] = {
    id = 41034614001,
    target_type = 3001,
    trigger_condition_1 = {1101},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43761401:3001:10000"
    }
  },
  [41034615001] = {
    id = 41034615001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 0,
    buff_list = {
      "43761501:3001:10000"
    }
  },
  [41031701001] = {
    id = 41031701001,
    fashion_show_ids = {
      "12017011:42570100"
    },
    damage_rate = 10000
  },
  [41031702001] = {
    id = 41031702001,
    fashion_show_ids = {
      "12017021:42570200"
    },
    damage_rate = 10000
  },
  [41031703001] = {
    id = 41031703001,
    fashion_show_ids = {
      "12017031:42570300"
    },
    damage_rate = 10000
  },
  [41032703001] = {
    id = 41032703001,
    fashion_show_ids = {
      "12017031:42670300"
    },
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {10},
    damage_rate = 0,
    buff_list = {
      "43770301:2041:10000",
      "43770302:3001:10000",
      "43770303:3001:10000"
    }
  },
  [41031704001] = {
    id = 41031704001,
    fashion_show_ids = {
      "12017041:42570400"
    },
    damage_rate = 10000,
    bullet_speed = 550
  },
  [41032704001] = {
    id = 41032704001,
    fashion_show_ids = {
      "12017041:42670400"
    },
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43770401:3001:10000"
    }
  },
  [41031705001] = {
    id = 41031705001,
    fashion_show_ids = {
      "12017051:42570500"
    },
    damage_rate = 10000
  },
  [41034705001] = {
    id = 41034705001,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43770501:3001:10000"
    }
  },
  [41031707001] = {
    id = 41031707001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017071:42570700"
    },
    damage_rate = 10000
  },
  [41032707001] = {
    id = 41032707001,
    des = function()
      return T(80737071)
    end,
    fashion_show_ids = {
      "12017071:42670700"
    },
    target_type = 2011,
    damage_rate = 15000,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031708001] = {
    id = 41031708001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017081:42570800"
    },
    damage_rate = 10000
  },
  [41032708001] = {
    id = 41032708001,
    des = function()
      return T(80737081)
    end,
    fashion_show_ids = {
      "12017081:42670800"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43770801:3002:10000:2011408"
    }
  },
  [41031709001] = {
    id = 41031709001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017091:42570900"
    },
    damage_rate = 10000
  },
  [41032709001] = {
    id = 41032709001,
    des = function()
      return T(80737091)
    end,
    fashion_show_ids = {
      "12017091:42670900"
    },
    target_type = 2021,
    damage_rate = 15000,
    buff_list = {
      "43770901:2021:10000"
    }
  },
  [41031710001] = {
    id = 41031710001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017101:42571000"
    },
    damage_rate = 10000
  },
  [41032710001] = {
    id = 41032710001,
    des = function()
      return T(80737101)
    end,
    fashion_show_ids = {
      "12017101:42671000"
    },
    target_type = 2011,
    damage_rate = 15000,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41031711001] = {
    id = 41031711001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017111:42571100"
    },
    damage_rate = 10000
  },
  [41032711001] = {
    id = 41032711001,
    des = function()
      return T(80737111)
    end,
    fashion_show_ids = {
      "12017111:42671100"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43771101:3002:10000:2011408"
    }
  },
  [41031712001] = {
    id = 41031712001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017121:42571200"
    },
    damage_rate = 10000
  },
  [41032712001] = {
    id = 41032712001,
    des = function()
      return T(80737121)
    end,
    fashion_show_ids = {
      "12017121:42671200"
    },
    target_type = 2021,
    damage_rate = 15000,
    buff_list = {
      "43771201:2021:10000"
    }
  },
  [41031713001] = {
    id = 41031713001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017131:42571300",
      "12017141:42571400"
    },
    damage_rate = 0
  },
  [41032713001] = {
    id = 41032713001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017131:42571300",
      "12017141:42571400"
    },
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    damage_rate = 0,
    buff_list = {
      "43771301:3001:10000"
    }
  },
  [41033713001] = {
    id = 41033713001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017131:42671300",
      "12017141:42671400"
    },
    target_type = 1003,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 450000,
    damage_rate_pvp = 45000,
    bullet_speed = 1000
  },
  [41033713002] = {
    id = 41033713002,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017131:42671300",
      "12017141:42671400"
    },
    target_type = 1003,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 500000,
    damage_rate_pvp = 50000,
    bullet_speed = 1000
  },
  [41033713003] = {
    id = 41033713003,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017131:42671300",
      "12017141:42671400"
    },
    target_type = 1003,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 550000,
    damage_rate_pvp = 55000,
    bullet_speed = 1000
  },
  [41033713004] = {
    id = 41033713004,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017131:42671300",
      "12017141:42671400"
    },
    target_type = 1003,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 600000,
    damage_rate_pvp = 60000,
    bullet_speed = 1000
  },
  [41033713005] = {
    id = 41033713005,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017131:42671300",
      "12017141:42671400"
    },
    target_type = 1003,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 650000,
    damage_rate_pvp = 65000,
    bullet_speed = 1000
  },
  [41033713006] = {
    id = 41033713006,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12017131:42671300",
      "12017141:42671400"
    },
    target_type = 1003,
    trigger_condition_1 = {1031},
    trigger_type_1 = {5},
    trigger_value_1 = {1},
    damage_rate = 700000,
    damage_rate_pvp = 70000,
    bullet_speed = 1000
  },
  [41034713001] = {
    id = 41034713001,
    des = function()
      return T(80730001)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43771302:3001:10000:1006102"
    }
  },
  [41031715001] = {
    id = 41031715001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010000:42571500"
    },
    damage_rate = 10000
  },
  [41032715001] = {
    id = 41032715001,
    des = function()
      return T(80730001)
    end,
    fashion_show_ids = {
      "12010000:42571500"
    },
    target_type = 2061,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    damage_rate = 5000,
    range_type = 4,
    range_x = 2000,
    range_y = 60,
    not_fixed_target = 1
  },
  [41031801001] = {
    id = 41031801001,
    des = function()
      return T(80738011)
    end,
    fashion_show_ids = {
      "12018011:42580100"
    },
    target_type = 2001,
    damage_rate = 10000
  },
  [41032801001] = {
    id = 41032801001,
    des = function()
      return T(80738012)
    end,
    fashion_show_ids = {
      "12018011:42680100"
    },
    target_type = 2001,
    damage_rate = 20000,
    buff_list = {
      "43780101:3001:10000"
    }
  },
  [41033801001] = {
    id = 41033801001,
    des = function()
      return T(80738013)
    end,
    fashion_show_ids = {
      "12018011:42680110"
    },
    target_type = 2011,
    damage_rate = 10000,
    buff_list = {
      "43780102:3001:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41034801001] = {
    id = 41034801001,
    des = function()
      return T(80738014)
    end,
    fashion_show_ids = {
      "12018011:42780100"
    },
    target_type = 2001,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 60000,
    buff_list = {
      "43780103:3001:10000"
    }
  },
  [41035801001] = {
    id = 41035801001,
    des = function()
      return T(80738015)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43780104:3001:10000"
    }
  },
  [41031802001] = {
    id = 41031802001,
    des = function()
      return T(80738021)
    end,
    fashion_show_ids = {
      "12018021:42580200"
    },
    target_type = 2001,
    damage_rate = 10000,
    bullet_speed = 900
  },
  [41032802001] = {
    id = 41032802001,
    des = function()
      return T(80738022)
    end,
    fashion_show_ids = {
      "12018021:42680200"
    },
    target_type = 2001,
    damage_rate = 20000,
    buff_list = {
      "43780201:3181:10000"
    }
  },
  [41033802001] = {
    id = 41033802001,
    des = function()
      return T(80738023)
    end,
    fashion_show_ids = {
      "12018021:42680210"
    },
    target_type = 2054,
    damage_rate = 10000,
    buff_list = {
      "43780202:3004:10000"
    },
    bullet_speed = 900
  },
  [41034802001] = {
    id = 41034802001,
    des = function()
      return T(80738024)
    end,
    fashion_show_ids = {
      "12018021:42780200"
    },
    target_type = 2021,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 30000,
    buff_list = {
      "43780203:3001:10000"
    },
    bomb_delay_frame = 1,
    bomb_interval_frame = 5
  },
  [41035802001] = {
    id = 41035802001,
    des = function()
      return T(80738025)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43780204:3001:10000"
    }
  },
  [41031803001] = {
    id = 41031803001,
    des = function()
      return T(80738031)
    end,
    fashion_show_ids = {
      "12018031:42580300"
    },
    target_type = 2001,
    damage_rate = 10000
  },
  [41032803001] = {
    id = 41032803001,
    des = function()
      return T(80738032)
    end,
    fashion_show_ids = {
      "12018031:42680300"
    },
    target_type = 2001,
    damage_rate = 20000,
    buff_list = {
      "43780301:1000:10000"
    }
  },
  [41033803001] = {
    id = 41033803001,
    des = function()
      return T(80738033)
    end,
    fashion_show_ids = {
      "12018031:42680310"
    },
    target_type = 2011,
    damage_rate = 15000,
    buff_list = {
      "43780302:1000:10000"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41034803001] = {
    id = 41034803001,
    des = function()
      return T(80738034)
    end,
    fashion_show_ids = {
      "12018031:42780300"
    },
    target_type = 2551,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 60000
  },
  [41035803001] = {
    id = 41035803001,
    des = function()
      return T(80738035)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43780303:3001:10000"
    }
  },
  [41031804001] = {
    id = 41031804001,
    des = function()
      return T(80738041)
    end,
    fashion_show_ids = {
      "12018041:42580400"
    },
    target_type = 2001,
    damage_rate = 10000
  },
  [41032804001] = {
    id = 41032804001,
    des = function()
      return T(80738042)
    end,
    fashion_show_ids = {
      "12018041:42680400"
    },
    target_type = 2072,
    damage_rate = 15000,
    buff_list = {
      "43780401:1000:10000"
    }
  },
  [41033804001] = {
    id = 41033804001,
    des = function()
      return T(80738043)
    end,
    fashion_show_ids = {
      "12018041:42680410"
    },
    target_type = 2001,
    damage_rate = 0,
    buff_list = {
      "43780407:2001:10000"
    },
    bullet_speed = 900,
    bullet_buff_list = {
      "43780402:0:10000"
    }
  },
  [41034804001] = {
    id = 41034804001,
    des = function()
      return T(80738044)
    end,
    fashion_show_ids = {
      "12018041:42780400"
    },
    target_type = 2041,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    buff_list = {
      "43780408:1000:10000"
    },
    range_type = 1,
    range_x = 300,
    range_y = 300
  },
  [41035804001] = {
    id = 41035804001,
    des = function()
      return T(80738045)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43780410:1007:10000"
    }
  },
  [41031805001] = {
    id = 41031805001,
    des = function()
      return T(80738051)
    end,
    fashion_show_ids = {
      "12018051:42580500"
    },
    target_type = 2001,
    damage_rate = 10000
  },
  [41032805001] = {
    id = 41032805001,
    des = function()
      return T(80738052)
    end,
    fashion_show_ids = {
      "12018051:42680500"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43780501:1000:10000",
      "43780502:3001:10000"
    }
  },
  [41033805001] = {
    id = 41033805001,
    des = function()
      return T(80738053)
    end,
    fashion_show_ids = {
      "12018051:42680510"
    },
    target_type = 2364,
    damage_rate = 30000,
    buff_list = {
      "43780504:1000:10000"
    },
    bomb_delay_frame = 1,
    bomb_interval_frame = 5
  },
  [41034805001] = {
    id = 41034805001,
    des = function()
      return T(80738054)
    end,
    fashion_show_ids = {
      "12018051:42680520"
    },
    target_type = 2364,
    damage_rate = 20000,
    buff_list = {
      "43780505:3001:10000"
    },
    bomb_delay_frame = 1,
    bomb_interval_frame = 5
  },
  [41035805001] = {
    id = 41035805001,
    des = function()
      return T(80738055)
    end,
    fashion_show_ids = {
      "12018051:42780500"
    },
    target_type = 2021,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 50000,
    buff_list = {
      "43780506:3001:10000"
    },
    bomb_delay_frame = 1,
    bomb_interval_frame = 5
  },
  [41036805001] = {
    id = 41036805001,
    des = function()
      return T(80738056)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43780507:3001:10000"
    }
  },
  [41031904001] = {
    id = 41031904001,
    des = function()
      return T(80739041)
    end,
    fashion_show_ids = {
      "12019041:42590400"
    },
    target_type = 2001,
    damage_rate = 10000
  },
  [41032904001] = {
    id = 41032904001,
    des = function()
      return T(80739042)
    end,
    fashion_show_ids = {
      "12019041:42690400"
    },
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "43790401:1000:10000"
    }
  },
  [41033904001] = {
    id = 41033904001,
    des = function()
      return T(80739043)
    end,
    fashion_show_ids = {
      "12019041:42690410"
    },
    target_type = 2061,
    damage_rate = 30000,
    buff_list = {
      "43790402:3001:10000"
    },
    range_type = 4,
    range_x = 1500,
    range_y = 310
  },
  [41034904001] = {
    id = 41034904001,
    des = function()
      return T(80739044)
    end,
    fashion_show_ids = {
      "12019041:42690420"
    },
    target_type = 3001,
    damage_rate = 0,
    buff_list = {
      "43790403:3001:10000:120"
    }
  },
  [41035904001] = {
    id = 41035904001,
    des = function()
      return T(80739045)
    end,
    fashion_show_ids = {
      "12019041:42790400"
    },
    target_type = 2364,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 50000,
    buff_list = {
      "43790404:3001:10000"
    },
    bomb_delay_frame = 1,
    bomb_interval_frame = 5
  },
  [41036904001] = {
    id = 41036904001,
    des = function()
      return T(80739046)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43790405:3001:10000"
    }
  },
  [41031906001] = {
    id = 41031906001,
    des = function()
      return T(80739061)
    end,
    fashion_show_ids = {
      "12019061:42590600"
    },
    target_type = 2362,
    damage_rate = 10000,
    bullet_speed = 1600
  },
  [41032906001] = {
    id = 41032906001,
    des = function()
      return T(80739062)
    end,
    fashion_show_ids = {
      "12019061:42690600"
    },
    target_type = 2041,
    damage_rate = 30000,
    range_type = 1,
    range_x = 350,
    range_y = 350
  },
  [41033906001] = {
    id = 41033906001,
    des = function()
      return T(80739063)
    end,
    fashion_show_ids = {
      "12019061:42690610"
    },
    target_type = 2613,
    damage_rate = 30000,
    bullet_speed = 1600
  },
  [41034906001] = {
    id = 41034906001,
    des = function()
      return T(80739064)
    end,
    fashion_show_ids = {
      "12019061:42690620"
    },
    target_type = 3001,
    damage_rate = 30000,
    buff_list = {
      "43790601:3001:10000"
    }
  },
  [41035906001] = {
    id = 41035906001,
    des = function()
      return T(80739065)
    end,
    fashion_show_ids = {
      "12019061:42790600"
    },
    target_type = 2021,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 50000,
    bullet_speed = 900,
    bullet_buff_list = {
      "43790602:0:10000"
    }
  },
  [41036906001] = {
    id = 41036906001,
    des = function()
      return T(80739066)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43790604:3001:10000"
    }
  },
  [41031910001] = {
    id = 41031910001,
    des = function()
      return T(80739101)
    end,
    fashion_show_ids = {
      "12019101:42591000"
    },
    target_type = 2001,
    damage_rate = 10000
  },
  [41032910001] = {
    id = 41032910001,
    des = function()
      return T(80739102)
    end,
    fashion_show_ids = {
      "12019101:42691000"
    },
    target_type = 2361,
    damage_rate = 30000,
    buff_list = {
      "43791001:1000:10000"
    }
  },
  [41033910001] = {
    id = 41033910001,
    des = function()
      return T(80739103)
    end,
    fashion_show_ids = {
      "12019101:42691010"
    },
    target_type = 2061,
    damage_rate = 30000,
    range_type = 4,
    range_x = 560,
    range_y = 560
  },
  [41034910001] = {
    id = 41034910001,
    des = function()
      return T(80739104)
    end,
    fashion_show_ids = {
      "12019101:42691020"
    },
    target_type = 2071,
    damage_rate = 30000,
    bullet_speed = 1800
  },
  [41035910001] = {
    id = 41035910001,
    des = function()
      return T(80739105)
    end,
    fashion_show_ids = {
      "12019101:42791000"
    },
    target_type = 2054,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 50000,
    bomb_delay_frame = 48,
    bomb_interval_frame = 10,
    bomb_buff_list = {
      "43791002:0:10000"
    }
  },
  [41036910001] = {
    id = 41036910001,
    des = function()
      return T(80739106)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43791004:3001:10000"
    }
  },
  [41031950001] = {
    id = 41031950001,
    des = function()
      return T(80739501)
    end,
    fashion_show_ids = {
      "12019501:42595000"
    },
    target_type = 2001,
    damage_rate = 10000
  },
  [41032950001] = {
    id = 41032950001,
    des = function()
      return T(80739502)
    end,
    fashion_show_ids = {
      "12019501:42695000"
    },
    target_type = 2362,
    damage_rate = 30000,
    buff_list = {
      "43795001:1000:10000"
    }
  },
  [41033950001] = {
    id = 41033950001,
    des = function()
      return T(80739503)
    end,
    fashion_show_ids = {
      "12019501:42695010"
    },
    target_type = 2061,
    damage_rate = 30000,
    range_type = 4,
    range_x = 680,
    range_y = 560
  },
  [41034950001] = {
    id = 41034950001,
    des = function()
      return T(80739504)
    end,
    fashion_show_ids = {
      "12019501:42695020"
    },
    target_type = 2072,
    damage_rate = 30000,
    bullet_speed = 1800
  },
  [41035950001] = {
    id = 41035950001,
    des = function()
      return T(80739505)
    end,
    fashion_show_ids = {
      "12019501:42795000"
    },
    target_type = 2491,
    trigger_condition_1 = {1021},
    trigger_type_1 = {5},
    trigger_value_1 = {10000},
    damage_rate = 0,
    bomb_delay_frame = 48,
    bomb_interval_frame = 1,
    bomb_buff_list = {
      "43795002:0:10000"
    }
  },
  [41036950001] = {
    id = 41036950001,
    des = function()
      return T(80739506)
    end,
    target_type = 3001,
    trigger_condition_1 = {1003},
    trigger_type_1 = {5},
    trigger_value_1 = {0},
    trigger_max = 1,
    buff_list = {
      "43795004:3001:10000"
    }
  },
  [41040001001] = {
    id = 41040001001,
    target_type = 3001,
    trigger_condition_1 = {
      1004,
      1004,
      1004,
      1004,
      1004,
      1001
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      2,
      4,
      6,
      8,
      10,
      12
    },
    trigger_condition_2 = {1091},
    trigger_type_2 = {2},
    trigger_value_2 = {0},
    trigger_max = 6,
    summon_id = {
      "10001",
      "10002",
      "10003",
      "10004",
      "10005",
      "10006"
    },
    summon_site = {
      "1301",
      "1303",
      "1304",
      "1301",
      "1303",
      "1304"
    }
  },
  [41040101001] = {
    id = 41040101001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      300,
      309,
      318,
      327,
      336,
      345,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      900,
      909,
      918,
      927,
      936,
      945,
      954,
      963,
      1200,
      1209,
      1218,
      1227,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {30},
    trigger_max = 56,
    summon_id = {
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112",
      "10111",
      "10112"
    },
    summon_site = {
      "1601",
      "1702",
      "1603",
      "1606",
      "1705",
      "1603",
      "1702",
      "1604",
      "1705",
      "1601",
      "1606",
      "1602",
      "1601",
      "1605",
      "1706",
      "1604",
      "1703",
      "1704",
      "1503",
      "1602",
      "1501",
      "1605",
      "1504",
      "1506",
      "1703",
      "1704",
      "1502",
      "1603",
      "1504",
      "1605",
      "1506",
      "1601",
      "1702",
      "1704",
      "1706",
      "1503",
      "1602",
      "1504",
      "1605",
      "1501",
      "1506",
      "1701",
      "1606",
      "1704",
      "1706",
      "1601",
      "1502",
      "1603",
      "1504",
      "1605",
      "1506",
      "1701",
      "1604",
      "1705",
      "1706",
      "1702"
    }
  },
  [41040102001] = {
    id = 41040102001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      45,
      54,
      300,
      309,
      318,
      327,
      336,
      345,
      354,
      363,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      663,
      672,
      900,
      909,
      918,
      927,
      936,
      945,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {30},
    trigger_max = 70,
    summon_id = {
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121",
      "10122",
      "10123",
      "10121"
    },
    summon_site = {
      "1802",
      "1903",
      "1905",
      "1804",
      "1907",
      "1901",
      "1806",
      "1801",
      "1802",
      "1906",
      "1805",
      "1904",
      "1907",
      "1803",
      "1902",
      "1802",
      "1801",
      "1901",
      "1803",
      "1904",
      "1807",
      "1806",
      "1805",
      "1907",
      "1702",
      "1803",
      "1907",
      "1705",
      "1806",
      "1902",
      "1804",
      "1707",
      "1905",
      "1801",
      "1701",
      "1802",
      "1901",
      "1703",
      "1804",
      "1903",
      "1705",
      "1806",
      "1905",
      "1707",
      "1907",
      "1707",
      "1805",
      "1902",
      "1706",
      "1704",
      "1906",
      "1702",
      "1803",
      "1907",
      "1701",
      "1801",
      "1901",
      "1706",
      "1705",
      "1902",
      "1807",
      "1806",
      "1906",
      "1701",
      "1703",
      "1907",
      "1802",
      "1804",
      "1901",
      "1902"
    }
  },
  [41040103001] = {
    id = 41040103001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      45,
      54,
      63,
      72,
      300,
      309,
      318,
      327,
      336,
      345,
      354,
      363,
      372,
      381,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      663,
      672,
      681,
      690,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {30},
    trigger_max = 84,
    summon_id = {
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10131",
      "10132",
      "10133",
      "10134",
      "10132",
      "10133",
      "10134"
    },
    summon_site = {
      "2002",
      "2004",
      "2103",
      "2101",
      "2007",
      "2005",
      "2008",
      "2108",
      "2106",
      "2001",
      "2005",
      "2102",
      "2101",
      "2003",
      "2008",
      "2104",
      "2105",
      "2106",
      "2108",
      "2001",
      "2002",
      "2103",
      "2101",
      "2008",
      "2006",
      "2007",
      "2107",
      "2004",
      "2108",
      "2105",
      "1902",
      "2001",
      "2004",
      "2102",
      "1905",
      "2006",
      "2007",
      "2108",
      "1908",
      "2003",
      "2105",
      "2104",
      "1901",
      "1903",
      "2006",
      "2106",
      "1907",
      "1905",
      "2002",
      "2101",
      "2004",
      "2008",
      "2103",
      "2105",
      "2108",
      "1902",
      "1901",
      "2001",
      "2101",
      "1904",
      "1907",
      "2008",
      "2107",
      "2006",
      "2003",
      "2004",
      "2105",
      "2005",
      "2102",
      "1901",
      "1904",
      "2006",
      "2108",
      "1903",
      "1906",
      "2004",
      "2105",
      "2005",
      "1908",
      "2002",
      "2101",
      "2007",
      "2106",
      "2103"
    }
  },
  [41040111001] = {
    id = 41040111001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      300,
      309,
      318,
      327,
      336,
      345,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      900,
      909,
      918,
      927,
      936,
      945,
      954,
      963,
      1200,
      1209,
      1218,
      1227,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {30},
    trigger_max = 56,
    summon_id = {
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10211",
      "10212",
      "10212"
    },
    summon_site = {
      "1605",
      "1704",
      "1602",
      "1703",
      "1701",
      "1602",
      "1701",
      "1606",
      "1705",
      "1603",
      "1704",
      "1602",
      "1701",
      "1604",
      "1703",
      "1606",
      "1705",
      "1706",
      "1502",
      "1601",
      "1504",
      "1603",
      "1605",
      "1702",
      "1706",
      "1705",
      "1503",
      "1703",
      "1601",
      "1602",
      "1504",
      "1705",
      "1606",
      "1704",
      "1605",
      "1502",
      "1605",
      "1606",
      "1701",
      "1601",
      "1702",
      "1504",
      "1603",
      "1706",
      "1704",
      "1502",
      "1702",
      "1601",
      "1703",
      "1603",
      "1604",
      "1505",
      "1605",
      "1606",
      "1706",
      "1704"
    }
  },
  [41040112001] = {
    id = 41040112001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      45,
      54,
      300,
      309,
      318,
      327,
      336,
      345,
      354,
      363,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      663,
      672,
      900,
      909,
      918,
      927,
      936,
      945,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {30},
    trigger_max = 70,
    summon_id = {
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221",
      "10222",
      "10223",
      "10221"
    },
    summon_site = {
      "1802",
      "1901",
      "1903",
      "1804",
      "1803",
      "1906",
      "1807",
      "1801",
      "1803",
      "1905",
      "1806",
      "1807",
      "1902",
      "1802",
      "1804",
      "1805",
      "1904",
      "1903",
      "1802",
      "1803",
      "1902",
      "1901",
      "1907",
      "1906",
      "1702",
      "1803",
      "1801",
      "1704",
      "1805",
      "1904",
      "1706",
      "1806",
      "1907",
      "1707",
      "1702",
      "1801",
      "1903",
      "1803",
      "1902",
      "1905",
      "1704",
      "1706",
      "1906",
      "1805",
      "1807",
      "1701",
      "1801",
      "1903",
      "1704",
      "1802",
      "1906",
      "1706",
      "1807",
      "1904",
      "1707",
      "1805",
      "1901",
      "1702",
      "1803",
      "1905",
      "1703",
      "1806",
      "1902",
      "1805",
      "1704",
      "1904",
      "1801",
      "1707",
      "1907",
      "1706"
    }
  },
  [41040113001] = {
    id = 41040113001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      45,
      54,
      63,
      72,
      300,
      309,
      318,
      327,
      336,
      345,
      354,
      363,
      372,
      381,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      663,
      672,
      681,
      690,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {30},
    trigger_max = 84,
    summon_id = {
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10231",
      "10232",
      "10233",
      "10234",
      "10232",
      "10233",
      "10234"
    },
    summon_site = {
      "2007",
      "2005",
      "2106",
      "2108",
      "2002",
      "2004",
      "2103",
      "2101",
      "2105",
      "2001",
      "2002",
      "2104",
      "2103",
      "2005",
      "2007",
      "2108",
      "2106",
      "2006",
      "2101",
      "2002",
      "2004",
      "2001",
      "2101",
      "2007",
      "2006",
      "2008",
      "2108",
      "2005",
      "2103",
      "2106",
      "1908",
      "2007",
      "2008",
      "2108",
      "1905",
      "2004",
      "2005",
      "2106",
      "1902",
      "2001",
      "2002",
      "2103",
      "1902",
      "2003",
      "2001",
      "2102",
      "1907",
      "2006",
      "2007",
      "2108",
      "1904",
      "1906",
      "2004",
      "2104",
      "2106",
      "1902",
      "2003",
      "2001",
      "2102",
      "1907",
      "2006",
      "2008",
      "2107",
      "2004",
      "1905",
      "2005",
      "2105",
      "2007",
      "2104",
      "1907",
      "2008",
      "2108",
      "2107",
      "1906",
      "1904",
      "2006",
      "2105",
      "1902",
      "2005",
      "2003",
      "2104",
      "2001",
      "2102",
      "2101"
    }
  },
  [41040121001] = {
    id = 41040121001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      300,
      309,
      318,
      327,
      336,
      345,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      900,
      909,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {20},
    trigger_max = 56,
    summon_id = {
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311",
      "10312",
      "10311"
    },
    summon_site = {
      "1602",
      "1701",
      "1604",
      "1703",
      "1706",
      "1601",
      "1702",
      "1603",
      "1704",
      "1605",
      "1706",
      "1601",
      "1701",
      "1604",
      "1703",
      "1606",
      "1706",
      "1602",
      "1502",
      "1603",
      "1601",
      "1702",
      "1505",
      "1706",
      "1504",
      "1704",
      "1505",
      "1705",
      "1606",
      "1603",
      "1503",
      "1702",
      "1502",
      "1601",
      "1604",
      "1502",
      "1602",
      "1605",
      "1705",
      "1504",
      "1606",
      "1601",
      "1701",
      "1503",
      "1604",
      "1502",
      "1601",
      "1603",
      "1701",
      "1504",
      "1702",
      "1605",
      "1704",
      "1506",
      "1706",
      "1705"
    }
  },
  [41040122001] = {
    id = 41040122001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      45,
      54,
      300,
      309,
      318,
      327,
      336,
      345,
      354,
      363,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      663,
      672,
      900,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {25},
    trigger_max = 70,
    summon_id = {
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321",
      "10322",
      "10323",
      "10321"
    },
    summon_site = {
      "1806",
      "1805",
      "1907",
      "1801",
      "1902",
      "1904",
      "1803",
      "1804",
      "1806",
      "1907",
      "1802",
      "1902",
      "1903",
      "1801",
      "1807",
      "1802",
      "1801",
      "1903",
      "1804",
      "1902",
      "1904",
      "1907",
      "1806",
      "1905",
      "1702",
      "1803",
      "1904",
      "1704",
      "1805",
      "1906",
      "1706",
      "1807",
      "1902",
      "1801",
      "1701",
      "1802",
      "1905",
      "1706",
      "1804",
      "1901",
      "1707",
      "1703",
      "1903",
      "1704",
      "1806",
      "1806",
      "1707",
      "1907",
      "1704",
      "1805",
      "1904",
      "1702",
      "1802",
      "1906",
      "1803",
      "1901",
      "1902",
      "1705",
      "1806",
      "1907",
      "1702",
      "1802",
      "1901",
      "1707",
      "1805",
      "1905",
      "1704",
      "1803",
      "1903",
      "1701"
    }
  },
  [41040123001] = {
    id = 41040123001,
    target_type = 3001,
    trigger_condition_1 = {
      1003,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005,
      1005
    },
    trigger_type_1 = {
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5,
      5
    },
    trigger_value_1 = {
      0,
      9,
      18,
      27,
      36,
      45,
      54,
      63,
      72,
      300,
      309,
      318,
      327,
      336,
      345,
      354,
      363,
      372,
      381,
      600,
      609,
      618,
      627,
      636,
      645,
      654,
      663,
      672,
      681,
      690,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999,
      9999999
    },
    trigger_condition_2 = {1092},
    trigger_type_2 = {4},
    trigger_value_2 = {30},
    trigger_max = 84,
    summon_id = {
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10331",
      "10332",
      "10333",
      "10334",
      "10332",
      "10333",
      "10334"
    },
    summon_site = {
      "2003",
      "2005",
      "2006",
      "2108",
      "2001",
      "2007",
      "2102",
      "2104",
      "2106",
      "2001",
      "2002",
      "2101",
      "2102",
      "2007",
      "2008",
      "2107",
      "2108",
      "2004",
      "2104",
      "2005",
      "2007",
      "2006",
      "2107",
      "2001",
      "2003",
      "2002",
      "2102",
      "2008",
      "2104",
      "2105",
      "1907",
      "1906",
      "2107",
      "2108",
      "1904",
      "2003",
      "2005",
      "2105",
      "1902",
      "2001",
      "2102",
      "2104",
      "2004",
      "2003",
      "2005",
      "2105",
      "1902",
      "2001",
      "2002",
      "2102",
      "1906",
      "2007",
      "2108",
      "2106",
      "2104",
      "1904",
      "2005",
      "2004",
      "2103",
      "1901",
      "1903",
      "2002",
      "2101",
      "1907",
      "1906",
      "2006",
      "2106",
      "2008",
      "2108",
      "1902",
      "2001",
      "2006",
      "2107",
      "1908",
      "1907",
      "2008",
      "2105",
      "1904",
      "2003",
      "2002",
      "2102",
      "1905",
      "2004",
      "2103"
    }
  },
  [41040201001] = {
    id = 41040201001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001,
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      4,
      4,
      4,
      4,
      4,
      4
    },
    trigger_limit_value = {
      2700,
      2700,
      2700,
      2700,
      2700,
      2700
    },
    summon_group = {
      "101",
      "102",
      "103",
      "104",
      "105",
      "106"
    },
    loop = 1,
    trigger_cd = 28
  },
  [41040202001] = {
    id = 41040202001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001,
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      1,
      1,
      1,
      1,
      1,
      1
    },
    trigger_limit_value = {
      2700,
      2700,
      2700,
      2700,
      2700,
      2700
    },
    trigger_buff_list = {
      "",
      "",
      "45700001:3001:10000"
    },
    trigger_buff_list_loop = 1,
    summon_group = {
      "201",
      "202",
      "203",
      "204",
      "205",
      "206"
    },
    loop = 1,
    trigger_cd = 28
  },
  [41040203001] = {
    id = 41040203001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001,
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      4,
      4,
      4,
      4,
      4,
      4
    },
    trigger_limit_value = {
      2700,
      2700,
      2700,
      2700,
      2700,
      2700
    },
    summon_group = {
      "301",
      "302",
      "303",
      "304",
      "305",
      "306"
    },
    loop = 1,
    trigger_cd = 28
  },
  [41040204001] = {
    id = 41040204001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001,
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      1,
      1,
      1,
      1,
      1,
      1
    },
    trigger_limit_value = {
      2700,
      2700,
      2700,
      2700,
      2700,
      2700
    },
    trigger_buff_list = {
      "",
      "",
      "45700001:3001:10000"
    },
    trigger_buff_list_loop = 1,
    summon_group = {
      "401",
      "402",
      "403",
      "404",
      "405",
      "406"
    },
    loop = 1,
    trigger_cd = 37
  },
  [41040205001] = {
    id = 41040205001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001,
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      4,
      4,
      4,
      4,
      4,
      4
    },
    trigger_limit_value = {
      2700,
      2700,
      2700,
      2700,
      2700,
      2700
    },
    summon_group = {
      "501",
      "502",
      "503",
      "504",
      "505",
      "506"
    },
    loop = 1,
    trigger_cd = 64
  },
  [41040206001] = {
    id = 41040206001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001,
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      1,
      1,
      1,
      1,
      1,
      1
    },
    trigger_limit_value = {
      2700,
      2700,
      2700,
      2700,
      2700,
      2700
    },
    trigger_buff_list = {
      "",
      "",
      "45700001:3001:10000"
    },
    trigger_buff_list_loop = 1,
    summon_group = {
      "601",
      "602",
      "603",
      "604",
      "605",
      "606"
    },
    loop = 1,
    trigger_cd = 73
  },
  [41040207001] = {
    id = 41040207001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001,
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      4,
      4,
      4,
      4,
      4,
      4
    },
    trigger_limit_value = {
      2700,
      2700,
      2700,
      2700,
      2700,
      2700
    },
    summon_group = {
      "701",
      "702",
      "703",
      "704",
      "705",
      "706"
    },
    loop = 1,
    trigger_cd = 73
  },
  [41040208001] = {
    id = 41040208001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001,
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      1,
      1,
      1,
      1,
      1,
      1
    },
    trigger_limit_value = {
      2700,
      2700,
      2700,
      2700,
      2700,
      2700
    },
    trigger_buff_list = {
      "",
      "",
      "45700001:3001:10000"
    },
    trigger_buff_list_loop = 1,
    summon_group = {
      "801",
      "802",
      "803",
      "804",
      "805",
      "806"
    },
    loop = 1,
    trigger_cd = 145
  },
  [41040209001] = {
    id = 41040209001,
    target_type = 3001,
    trigger_condition_1 = {1092},
    trigger_type_1 = {4},
    trigger_value_1 = {0},
    trigger_limit = {
      3001,
      3001,
      3001
    },
    trigger_limit_type = {
      5,
      5,
      5
    },
    trigger_limit_value = {
      0,
      0,
      0
    },
    trigger_max = 3,
    summon_group = {
      "901",
      "902",
      "903"
    },
    loop = 0,
    trigger_cd = 208
  },
  [41050001001] = {
    id = 41050001001,
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    buff_list = {
      "43800011:3001:10000:3000701"
    }
  },
  [41050002001] = {
    id = 41050002001,
    target_type = 3001,
    trigger_condition_1 = {1001},
    trigger_type_1 = {5},
    trigger_value_1 = {5},
    buff_list = {
      "43800021:3001:10000:3100901"
    }
  },
  [41050003001] = {
    id = 41050003001,
    target_type = 3001,
    trigger_condition_1 = {1003, 1001},
    trigger_type_1 = {5, 5},
    trigger_value_1 = {0, 5},
    buff_list = {
      "43800031:3001:10000:3000801"
    }
  },
  [41050101001] = {
    id = 41050101001,
    show_id = 42801010,
    target_type = 2041,
    damage_rate = 0,
    buff_list = {
      "43801013:3001:10000:3100301"
    },
    bullet_speed = 400,
    bullet_buff_list = {
      "43801011:0:10000"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41050201001] = {
    id = 41050201001,
    fashion_show_ids = {
      "12030001:42802010",
      "12030002:42802011"
    },
    target_type = 2361,
    damage_rate = 10000
  },
  [41060001001] = {
    id = 41060001001,
    des = function()
      return T(80430011, T(80520011, 3), T(80520017, 50), T(80520011, 10))
    end,
    show_id = 42400100,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030101:8002:10000",
      "47030101:8002:10000",
      "47030101:8002:10000",
      "47030107:8002:10000"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41060001002] = {
    id = 41060001002,
    des = function()
      return T(80430011, T(80520011, 3), T(80520017, 60), T(80520011, 10))
    end,
    show_id = 42400100,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030102:8002:10000",
      "47030102:8002:10000",
      "47030102:8002:10000",
      "47030107:8002:10000"
    },
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41060001003] = {
    id = 41060001003,
    des = function()
      return T(80430011, T(80520011, 3), T(80520017, 70), T(80520011, 10))
    end,
    show_id = 42400100,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030103:8002:10000",
      "47030103:8002:10000",
      "47030103:8002:10000",
      "47030107:8002:10000"
    },
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41060001004] = {
    id = 41060001004,
    des = function()
      return T(80430011, T(80520011, 3), T(80520017, 80), T(80520011, 10))
    end,
    show_id = 42400100,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030104:8002:10000",
      "47030104:8002:10000",
      "47030104:8002:10000",
      "47030107:8002:10000"
    },
    cost = {
      "1:21000021:15"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41060001005] = {
    id = 41060001005,
    des = function()
      return T(80430011, T(80520011, 3), T(80520017, 90), T(80520011, 10))
    end,
    show_id = 42400100,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030105:8002:10000",
      "47030105:8002:10000",
      "47030105:8002:10000",
      "47030107:8002:10000"
    },
    cost = {
      "1:21000021:20"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41060001006] = {
    id = 41060001006,
    des = function()
      return T(80430011, T(80520011, 3), T(80520017, 100), T(80520011, 10))
    end,
    show_id = 42400100,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030106:8002:10000",
      "47030106:8002:10000",
      "47030106:8002:10000",
      "47030107:8002:10000"
    },
    cost = {
      "1:21000021:25"
    },
    range_type = 1,
    range_x = 200,
    range_y = 200
  },
  [41060002001] = {
    id = 41060002001,
    des = function()
      return T(80430021, T(80520017, 75), T(80520011, 5))
    end,
    show_id = 42400200,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030201:8001:10000:1001",
      "47030207:8001:10000"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060002002] = {
    id = 41060002002,
    des = function()
      return T(80430021, T(80520017, 90), T(80520011, 5))
    end,
    show_id = 42400200,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030202:8001:10000:1001",
      "47030207:8001:10000"
    },
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060002003] = {
    id = 41060002003,
    des = function()
      return T(80430021, T(80520017, 105), T(80520011, 5))
    end,
    show_id = 42400200,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030203:8001:10000:1001",
      "47030207:8001:10000"
    },
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060002004] = {
    id = 41060002004,
    des = function()
      return T(80430021, T(80520017, 120), T(80520011, 5))
    end,
    show_id = 42400200,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030204:8001:10000:1001",
      "47030207:8001:10000"
    },
    cost = {
      "1:21000021:15"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060002005] = {
    id = 41060002005,
    des = function()
      return T(80430021, T(80520017, 135), T(80520011, 5))
    end,
    show_id = 42400200,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030205:8001:10000:1001",
      "47030207:8001:10000"
    },
    cost = {
      "1:21000021:20"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060002006] = {
    id = 41060002006,
    des = function()
      return T(80430021, T(80520017, 150), T(80520011, 5))
    end,
    show_id = 42400200,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030206:8001:10000:1001",
      "47030207:8001:10000"
    },
    cost = {
      "1:21000021:25"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060003001] = {
    id = 41060003001,
    des = function()
      return T(80430031, T(80520017, 2500))
    end,
    show_id = 42400300,
    target_type = 8002,
    trigger_max = 3,
    damage_rate = 250000,
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060003002] = {
    id = 41060003002,
    des = function()
      return T(80430031, T(80520017, 3000))
    end,
    show_id = 42400300,
    target_type = 8002,
    trigger_max = 3,
    damage_rate = 300000,
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060003003] = {
    id = 41060003003,
    des = function()
      return T(80430031, T(80520017, 3500))
    end,
    show_id = 42400300,
    target_type = 8002,
    trigger_max = 3,
    damage_rate = 350000,
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060003004] = {
    id = 41060003004,
    des = function()
      return T(80430031, T(80520017, 4000))
    end,
    show_id = 42400300,
    target_type = 8002,
    trigger_max = 3,
    damage_rate = 400000,
    cost = {
      "1:21000021:15"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060003005] = {
    id = 41060003005,
    des = function()
      return T(80430031, T(80520017, 4500))
    end,
    show_id = 42400300,
    target_type = 8002,
    trigger_max = 3,
    damage_rate = 450000,
    cost = {
      "1:21000021:20"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060003006] = {
    id = 41060003006,
    des = function()
      return T(80430031, T(80520017, 5000))
    end,
    show_id = 42400300,
    target_type = 8002,
    trigger_max = 3,
    damage_rate = 500000,
    cost = {
      "1:21000021:25"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060004001] = {
    id = 41060004001,
    des = function()
      return T(80430041, T(80520017, 30), T(80520017, 100), T(80520011, 15))
    end,
    show_id = 42400400,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030401:8001:10000",
      "47030402:1002:10000"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060004002] = {
    id = 41060004002,
    des = function()
      return T(80430041, T(80520017, 27), T(80520017, 120), T(80520011, 15))
    end,
    show_id = 42400400,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030403:8001:10000",
      "47030404:1002:10000"
    },
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060004003] = {
    id = 41060004003,
    des = function()
      return T(80430041, T(80520017, 24), T(80520017, 140), T(80520011, 15))
    end,
    show_id = 42400400,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030405:8001:10000",
      "47030406:1002:10000"
    },
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060004004] = {
    id = 41060004004,
    des = function()
      return T(80430041, T(80520017, 21), T(80520017, 160), T(80520011, 15))
    end,
    show_id = 42400400,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030407:8001:10000",
      "47030408:1002:10000"
    },
    cost = {
      "1:21000021:15"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060004005] = {
    id = 41060004005,
    des = function()
      return T(80430041, T(80520017, 18), T(80520017, 180), T(80520011, 15))
    end,
    show_id = 42400400,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030409:8001:10000",
      "47030410:1002:10000"
    },
    cost = {
      "1:21000021:20"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060004006] = {
    id = 41060004006,
    des = function()
      return T(80430041, T(80520017, 15), T(80520017, 200), T(80520011, 15))
    end,
    show_id = 42400400,
    target_type = 8001,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030411:8001:10000",
      "47030412:1002:10000"
    },
    cost = {
      "1:21000021:25"
    },
    range_type = 1,
    range_x = 240,
    range_y = 240
  },
  [41060005001] = {
    id = 41060005001,
    des = function()
      return T(80430051, T(80520017, 25), T(80520011, 5), T(80520017, 25), T(80520011, 10))
    end,
    show_id = 42400500,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030501:8002:10000",
      "47030502:8002:10000"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060005002] = {
    id = 41060005002,
    des = function()
      return T(80430051, T(80520017, 30), T(80520011, 5), T(80520017, 30), T(80520011, 10))
    end,
    show_id = 42400500,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030503:8002:10000",
      "47030504:8002:10000"
    },
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060005003] = {
    id = 41060005003,
    des = function()
      return T(80430051, T(80520017, 35), T(80520011, 5), T(80520017, 35), T(80520011, 10))
    end,
    show_id = 42400500,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030505:8002:10000",
      "47030506:8002:10000"
    },
    cost = {
      "1:21000021:10"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060005004] = {
    id = 41060005004,
    des = function()
      return T(80430051, T(80520017, 40), T(80520011, 5), T(80520017, 40), T(80520011, 10))
    end,
    show_id = 42400500,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030507:8002:10000",
      "47030508:8002:10000"
    },
    cost = {
      "1:21000021:15"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060005005] = {
    id = 41060005005,
    des = function()
      return T(80430051, T(80520017, 45), T(80520011, 5), T(80520017, 45), T(80520011, 10))
    end,
    show_id = 42400500,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030509:8002:10000",
      "47030510:8002:10000"
    },
    cost = {
      "1:21000021:20"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  },
  [41060005006] = {
    id = 41060005006,
    des = function()
      return T(80430051, T(80520017, 50), T(80520011, 5), T(80520017, 50), T(80520011, 10))
    end,
    show_id = 42400500,
    target_type = 8002,
    trigger_max = 2,
    damage_rate = 0,
    buff_list = {
      "47030511:8002:10000",
      "47030512:8002:10000"
    },
    cost = {
      "1:21000021:25"
    },
    range_type = 1,
    range_x = 160,
    range_y = 160
  }
}
