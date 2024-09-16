BaseRogueNode = {
  [50911101] = {
    id = 50911101,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831111,
    next = {50911102, 50911103},
    type = 1,
    reward_option = {
      "50841011:10000",
      "50841111:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50911102] = {
    id = 50911102,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831111,
    pre = {50911101},
    next = {50911104},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911103] = {
    id = 50911103,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831111,
    pre = {50911101},
    next = {50911104},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911104] = {
    id = 50911104,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831111,
    pre = {50911102, 50911103},
    next = {
      50911105,
      50911106,
      50911107
    },
    type = 1,
    reward_option = {
      "50841011:10000",
      "50841111:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50911105] = {
    id = 50911105,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831111,
    pre = {50911104},
    next = {50911108},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911106] = {
    id = 50911106,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831111,
    pre = {50911104},
    next = {50911108},
    type = 1,
    reward_option = {
      "50841011:10000",
      "50841111:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50911107] = {
    id = 50911107,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831111,
    pre = {50911104},
    next = {50911108},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911108] = {
    id = 50911108,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831111,
    pre = {
      50911105,
      50911106,
      50911107
    },
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50911201] = {
    id = 50911201,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831112,
    next = {50911202, 50911203},
    type = 1,
    reward_option = {
      "50841011:10000",
      "50841111:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50911202] = {
    id = 50911202,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831112,
    pre = {50911201},
    next = {50911204},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911203] = {
    id = 50911203,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831112,
    pre = {50911201},
    next = {50911204, 50911205},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911204] = {
    id = 50911204,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831112,
    pre = {50911202, 50911203},
    next = {50911206},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911205] = {
    id = 50911205,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831112,
    pre = {50911203},
    next = {50911206},
    type = 1,
    reward_option = {
      "50841011:10000",
      "50841111:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50911206] = {
    id = 50911206,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831112,
    pre = {50911204, 50911205},
    next = {50911207},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911207] = {
    id = 50911207,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831112,
    pre = {50911206},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50911301] = {
    id = 50911301,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831113,
    next = {50911302, 50911303},
    type = 1,
    reward_option = {
      "50841011:10000",
      "50841111:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50911302] = {
    id = 50911302,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831113,
    pre = {50911301},
    next = {50911304},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911303] = {
    id = 50911303,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831113,
    pre = {50911301},
    next = {50911305},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911304] = {
    id = 50911304,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831113,
    pre = {50911302},
    next = {50911306, 50911307},
    type = 1,
    reward_option = {
      "50841011:10000",
      "50841111:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50911305] = {
    id = 50911305,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831113,
    pre = {50911303},
    next = {50911307, 50911308},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911306] = {
    id = 50911306,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831113,
    pre = {50911304},
    next = {50911309},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911307] = {
    id = 50911307,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831113,
    pre = {50911304, 50911305},
    next = {50911309},
    type = 1,
    reward_option = {
      "50841011:10000",
      "50841111:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50911308] = {
    id = 50911308,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831113,
    pre = {50911305},
    next = {50911309},
    type = 12,
    speical_reward_option = 50841205
  },
  [50911309] = {
    id = 50911309,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831113,
    pre = {
      50911306,
      50911307,
      50911308
    },
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50912101] = {
    id = 50912101,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831121,
    next = {
      50912102,
      50912103,
      50912104
    },
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912102] = {
    id = 50912102,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831121,
    pre = {50912101},
    next = {50912105},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912103] = {
    id = 50912103,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831121,
    pre = {50912101},
    next = {50912105},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912104] = {
    id = 50912104,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831121,
    pre = {50912101},
    next = {50912105},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912105] = {
    id = 50912105,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831121,
    pre = {
      50912102,
      50912103,
      50912104
    },
    next = {50912106, 50912107},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912106] = {
    id = 50912106,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831121,
    pre = {50912105},
    next = {50912108},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912107] = {
    id = 50912107,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831121,
    pre = {50912105},
    next = {50912108},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841022:10000",
      "50841122:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50912108] = {
    id = 50912108,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831121,
    pre = {50912106, 50912107},
    next = {50912109, 50912110},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50912109] = {
    id = 50912109,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831121,
    pre = {50912108},
    next = {50912111},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912110] = {
    id = 50912110,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831121,
    pre = {50912108},
    next = {50912111},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912111] = {
    id = 50912111,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831121,
    pre = {50912109, 50912110},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841024:10000",
      "50841124:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50912201] = {
    id = 50912201,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831122,
    next = {50912203},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912202] = {
    id = 50912202,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831122,
    next = {50912203},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912203] = {
    id = 50912203,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831122,
    pre = {50912201, 50912202},
    next = {
      50912204,
      50912205,
      50912206
    },
    type = 12,
    speical_reward_option = 50841205
  },
  [50912204] = {
    id = 50912204,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831122,
    pre = {50912203},
    next = {50912207},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912205] = {
    id = 50912205,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831122,
    pre = {50912203},
    next = {50912207},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841022:10000",
      "50841122:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50912206] = {
    id = 50912206,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831122,
    pre = {50912203},
    next = {50912207},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912207] = {
    id = 50912207,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831122,
    pre = {
      50912204,
      50912205,
      50912206
    },
    next = {50912208},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912208] = {
    id = 50912208,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831122,
    pre = {50912207},
    next = {50912209, 50912210},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50912209] = {
    id = 50912209,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831122,
    pre = {50912208},
    next = {50912211},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912210] = {
    id = 50912210,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831122,
    pre = {50912208},
    next = {50912211},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912211] = {
    id = 50912211,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831122,
    pre = {50912209, 50912210},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841024:10000",
      "50841124:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50912301] = {
    id = 50912301,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831123,
    next = {50912302, 50912303},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912302] = {
    id = 50912302,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831123,
    pre = {50912301},
    next = {50912304, 50912305},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841022:10000",
      "50841122:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50912303] = {
    id = 50912303,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831123,
    pre = {50912301},
    next = {50912305},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912304] = {
    id = 50912304,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831123,
    pre = {50912302},
    next = {50912306, 50912307},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912305] = {
    id = 50912305,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831123,
    pre = {50912302, 50912303},
    next = {50912307, 50912308},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912306] = {
    id = 50912306,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831123,
    pre = {50912304},
    next = {50912309},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912307] = {
    id = 50912307,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831123,
    pre = {50912304, 50912305},
    next = {50912309},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912308] = {
    id = 50912308,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831123,
    pre = {50912305},
    next = {50912309},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912309] = {
    id = 50912309,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831123,
    pre = {
      50912306,
      50912307,
      50912308
    },
    next = {50912310, 50912311},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50912310] = {
    id = 50912310,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831123,
    pre = {50912309},
    next = {50912312},
    type = 1,
    reward_option = {
      "50841021:10000",
      "50841121:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50912311] = {
    id = 50912311,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831123,
    pre = {50912309},
    next = {50912312},
    type = 12,
    speical_reward_option = 50841205
  },
  [50912312] = {
    id = 50912312,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831123,
    pre = {50912310, 50912311},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841024:10000",
      "50841124:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50913101] = {
    id = 50913101,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831131,
    next = {50913103},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913102] = {
    id = 50913102,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831131,
    next = {50913104, 50913105},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913103] = {
    id = 50913103,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831131,
    pre = {50913101},
    next = {50913106},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913104] = {
    id = 50913104,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831131,
    pre = {50913102},
    next = {50913107},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913105] = {
    id = 50913105,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831131,
    pre = {50913102},
    next = {50913108},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913106] = {
    id = 50913106,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831131,
    pre = {50913103},
    next = {50913109},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913107] = {
    id = 50913107,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831131,
    pre = {50913104},
    next = {50913109},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841032:10000",
      "50841132:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50913108] = {
    id = 50913108,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831131,
    pre = {50913105},
    next = {50913109},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913109] = {
    id = 50913109,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831131,
    pre = {
      50913106,
      50913107,
      50913108
    },
    next = {50913110, 50913111},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50913110] = {
    id = 50913110,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831131,
    pre = {50913109},
    next = {50913112},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913111] = {
    id = 50913111,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831131,
    pre = {50913109},
    next = {50913113},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913112] = {
    id = 50913112,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831131,
    pre = {50913110},
    next = {50913114},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913113] = {
    id = 50913113,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831131,
    pre = {50913111},
    next = {50913115, 50913116},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913114] = {
    id = 50913114,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831131,
    pre = {50913112},
    next = {50913117},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913115] = {
    id = 50913115,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831131,
    pre = {50913113},
    next = {50913117},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841032:10000",
      "50841132:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50913116] = {
    id = 50913116,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831131,
    pre = {50913113},
    next = {50913118},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913117] = {
    id = 50913117,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831131,
    pre = {50913114, 50913115},
    next = {50913119},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913118] = {
    id = 50913118,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831131,
    pre = {50913116},
    next = {50913119},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913119] = {
    id = 50913119,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831131,
    pre = {50913117, 50913118},
    next = {50913120},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841034:10000",
      "50841134:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50913120] = {
    id = 50913120,
    name = function()
      return T(80273003)
    end,
    name_detail = function()
      return T(80273003)
    end,
    chapter_id = 50831131,
    pre = {50913119},
    type = 3,
    reward_option = {
      "50841001:10000",
      "50841033:10000",
      "50841133:10000",
      "50841204:10000",
      "50841205:10000"
    },
    speical_reward_option = 50841205
  },
  [50913201] = {
    id = 50913201,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831132,
    next = {50913204},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913202] = {
    id = 50913202,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831132,
    next = {50913204},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841032:10000",
      "50841132:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50913203] = {
    id = 50913203,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831132,
    next = {50913205},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913204] = {
    id = 50913204,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831132,
    pre = {50913201, 50913202},
    next = {50913206},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913205] = {
    id = 50913205,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831132,
    pre = {50913203},
    next = {50913207},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913206] = {
    id = 50913206,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831132,
    pre = {50913204},
    next = {50913208},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913207] = {
    id = 50913207,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831132,
    pre = {50913205},
    next = {50913209, 50913210},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913208] = {
    id = 50913208,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831132,
    pre = {50913206},
    next = {50913211},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913209] = {
    id = 50913209,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831132,
    pre = {50913207},
    next = {50913212},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841032:10000",
      "50841132:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50913210] = {
    id = 50913210,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831132,
    pre = {50913207},
    next = {50913212},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913211] = {
    id = 50913211,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831132,
    pre = {50913208},
    next = {50913213},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913212] = {
    id = 50913212,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831132,
    pre = {50913209, 50913210},
    next = {50913214},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913213] = {
    id = 50913213,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831132,
    pre = {50913211},
    next = {50913215},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913214] = {
    id = 50913214,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831132,
    pre = {50913212},
    next = {50913215},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913215] = {
    id = 50913215,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831132,
    pre = {50913213, 50913214},
    next = {50913216},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841032:10000",
      "50841132:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50913216] = {
    id = 50913216,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831132,
    pre = {50913215},
    next = {50913217},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841034:10000",
      "50841134:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50913217] = {
    id = 50913217,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831132,
    pre = {50913216},
    next = {50913218},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913218] = {
    id = 50913218,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831132,
    pre = {50913217},
    next = {50913219},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50913219] = {
    id = 50913219,
    name = function()
      return T(80273003)
    end,
    name_detail = function()
      return T(80273003)
    end,
    chapter_id = 50831132,
    pre = {50913218},
    type = 3,
    reward_option = {
      "50841001:10000",
      "50841033:10000",
      "50841133:10000",
      "50841204:10000",
      "50841205:10000"
    },
    speical_reward_option = 50841205
  },
  [50913301] = {
    id = 50913301,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    next = {
      50913302,
      50913303,
      50913304
    },
    type = 12,
    speical_reward_option = 50841205
  },
  [50913302] = {
    id = 50913302,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913301},
    next = {50913305},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913303] = {
    id = 50913303,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913301},
    next = {50913306},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913304] = {
    id = 50913304,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913301},
    next = {50913307},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913305] = {
    id = 50913305,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831133,
    pre = {50913302},
    next = {50913308},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913306] = {
    id = 50913306,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913303},
    next = {50913309},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913307] = {
    id = 50913307,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831133,
    pre = {50913304},
    next = {50913310},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913308] = {
    id = 50913308,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913305},
    next = {50913311},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913309] = {
    id = 50913309,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831133,
    pre = {50913306},
    next = {50913312},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913310] = {
    id = 50913310,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831133,
    pre = {50913307},
    next = {50913312},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913311] = {
    id = 50913311,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831133,
    pre = {50913308},
    next = {50913313},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841032:10000",
      "50841132:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50913312] = {
    id = 50913312,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913309, 50913310},
    next = {50913313},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913313] = {
    id = 50913313,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831133,
    pre = {50913311, 50913312},
    next = {50913314, 50913315},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50913314] = {
    id = 50913314,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913313},
    next = {50913316},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913315] = {
    id = 50913315,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913313},
    next = {50913317},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913316] = {
    id = 50913316,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831133,
    pre = {50913314},
    next = {50913318},
    type = 12,
    speical_reward_option = 50841205
  },
  [50913317] = {
    id = 50913317,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831133,
    pre = {50913315},
    next = {50913318},
    type = 1,
    reward_option = {
      "50841031:10000",
      "50841131:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50913318] = {
    id = 50913318,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831133,
    pre = {50913316, 50913317},
    next = {50913319},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841034:10000",
      "50841134:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50913319] = {
    id = 50913319,
    name = function()
      return T(80273003)
    end,
    name_detail = function()
      return T(80273003)
    end,
    chapter_id = 50831133,
    pre = {50913318},
    type = 3,
    reward_option = {
      "50841001:10000",
      "50841033:10000",
      "50841133:10000",
      "50841204:10000",
      "50841205:10000"
    },
    speical_reward_option = 50841205
  },
  [50914101] = {
    id = 50914101,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831141,
    next = {50914102, 50914103},
    type = 12,
    speical_reward_option = 50841205
  },
  [50914102] = {
    id = 50914102,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831141,
    pre = {50914101},
    next = {50914104},
    type = 1,
    reward_option = {
      "50841041:10000",
      "50841141:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50914103] = {
    id = 50914103,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831141,
    pre = {50914101},
    next = {50914104},
    type = 12,
    speical_reward_option = 50841205
  },
  [50914104] = {
    id = 50914104,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831141,
    pre = {50914102, 50914103},
    next = {50914105, 50914106},
    type = 12,
    speical_reward_option = 50841205
  },
  [50914105] = {
    id = 50914105,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831141,
    pre = {50914104},
    next = {50914107},
    type = 12,
    speical_reward_option = 50841205
  },
  [50914106] = {
    id = 50914106,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831141,
    pre = {50914104},
    next = {50914107},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841042:10000",
      "50841142:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50914107] = {
    id = 50914107,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831141,
    pre = {50914105, 50914106},
    next = {50914108},
    type = 1,
    reward_option = {
      "50841041:10000",
      "50841141:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50914108] = {
    id = 50914108,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831141,
    pre = {50914107},
    next = {50914109},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841044:10000",
      "50841144:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50914109] = {
    id = 50914109,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831141,
    pre = {50914108},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50914201] = {
    id = 50914201,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831142,
    next = {
      50914202,
      50914203,
      50914204
    },
    type = 1,
    reward_option = {
      "50841041:10000",
      "50841141:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50914202] = {
    id = 50914202,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831142,
    pre = {50914201},
    next = {50914205},
    type = 1,
    reward_option = {
      "50841041:10000",
      "50841141:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50914203] = {
    id = 50914203,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831142,
    pre = {50914201},
    next = {50914205},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841042:10000",
      "50841142:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50914204] = {
    id = 50914204,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831142,
    pre = {50914201},
    next = {50914205},
    type = 12,
    speical_reward_option = 50841205
  },
  [50914205] = {
    id = 50914205,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831142,
    pre = {
      50914202,
      50914203,
      50914204
    },
    next = {
      50914206,
      50914207,
      50914208
    },
    type = 12,
    speical_reward_option = 50841205
  },
  [50914206] = {
    id = 50914206,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831142,
    pre = {50914205},
    next = {50914209},
    type = 1,
    reward_option = {
      "50841041:10000",
      "50841141:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50914207] = {
    id = 50914207,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831142,
    pre = {50914205},
    next = {50914209},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841042:10000",
      "50841142:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50914208] = {
    id = 50914208,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831142,
    pre = {50914205},
    next = {50914209},
    type = 12,
    speical_reward_option = 50841205
  },
  [50914209] = {
    id = 50914209,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831142,
    pre = {
      50914206,
      50914207,
      50914208
    },
    next = {50914210},
    type = 1,
    reward_option = {
      "50841041:10000",
      "50841141:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50914210] = {
    id = 50914210,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831142,
    pre = {50914209},
    next = {50914211},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841044:10000",
      "50841144:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50914211] = {
    id = 50914211,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831142,
    pre = {50914210},
    type = 11,
    parameter = "6|50806101|3|50"
  },
  [50915101] = {
    id = 50915101,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831151,
    next = {50915102},
    type = 12,
    speical_reward_option = 50841205
  },
  [50915102] = {
    id = 50915102,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831151,
    pre = {50915101},
    next = {
      50915103,
      50915104,
      50915105
    },
    type = 1,
    reward_option = {
      "50841051:10000",
      "50841151:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50915103] = {
    id = 50915103,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831151,
    pre = {50915102},
    next = {50915106},
    type = 1,
    reward_option = {
      "50841051:10000",
      "50841151:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50915104] = {
    id = 50915104,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831151,
    pre = {50915102},
    next = {50915106},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841052:10000",
      "50841152:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50915105] = {
    id = 50915105,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831151,
    pre = {50915102},
    next = {50915106},
    type = 12,
    speical_reward_option = 50841205
  },
  [50915106] = {
    id = 50915106,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831151,
    pre = {
      50915103,
      50915104,
      50915105
    },
    next = {50915107},
    type = 12,
    speical_reward_option = 50841205
  },
  [50915107] = {
    id = 50915107,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831151,
    pre = {50915106},
    next = {50915108},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841054:10000",
      "50841154:10000",
      "50841005:10000",
      "50841006:10000"
    },
    ending_tag = 101
  },
  [50915108] = {
    id = 50915108,
    name = function()
      return T(80273011)
    end,
    name_detail = function()
      return T(80273011)
    end,
    des = function()
      return T(80278011)
    end,
    chapter_id = 50831151,
    pre = {50915107},
    next = {50915109},
    type = 11,
    parameter = "6|50806101|3|50",
    ending_tag = 101
  },
  [50915109] = {
    id = 50915109,
    name = function()
      return T(80273003)
    end,
    name_detail = function()
      return T(80273003)
    end,
    chapter_id = 50831151,
    pre = {50915108},
    type = 3,
    reward_option = {
      "50841001:10000",
      "50841053:10000",
      "50841153:10000",
      "50841204:10000",
      "50841205:10000"
    },
    speical_reward_option = 50841205
  },
  [50916101] = {
    id = 50916101,
    name = function()
      return T(80273001)
    end,
    name_detail = function()
      return T(80273001)
    end,
    chapter_id = 50831161,
    next = {50916102},
    type = 1,
    reward_option = {
      "50841061:10000",
      "50841161:10000",
      "50841202:5000"
    },
    speical_reward_option = 50841205
  },
  [50916102] = {
    id = 50916102,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831161,
    pre = {50916101},
    next = {50916103},
    type = 12,
    speical_reward_option = 50841205
  },
  [50916103] = {
    id = 50916103,
    name = function()
      return T(80273013)
    end,
    name_detail = function()
      return T(80273013)
    end,
    des = function()
      return T(80278013)
    end,
    chapter_id = 50831161,
    pre = {50916102},
    next = {50916104},
    type = 13,
    parameter = "3",
    reward_option = {
      "50841001:10000",
      "50841064:10000",
      "50841164:10000",
      "50841005:10000",
      "50841006:10000"
    }
  },
  [50916104] = {
    id = 50916104,
    name = function()
      return T(80273002)
    end,
    name_detail = function()
      return T(80273002)
    end,
    chapter_id = 50831161,
    pre = {50916103},
    next = {50916105},
    type = 2,
    reward_option = {
      "50841001:10000",
      "50841062:10000",
      "50841162:10000",
      "50841203:10000"
    },
    speical_reward_option = 50841205
  },
  [50916105] = {
    id = 50916105,
    name = function()
      return T(80273012)
    end,
    name_detail = function()
      return T(80273012)
    end,
    des = function()
      return T(80278012)
    end,
    chapter_id = 50831161,
    pre = {50916104},
    next = {50916106},
    type = 12,
    speical_reward_option = 50841205,
    ending_tag = 102
  },
  [50916106] = {
    id = 50916106,
    name = function()
      return T(80273003)
    end,
    name_detail = function()
      return T(80273003)
    end,
    chapter_id = 50831161,
    pre = {50916105},
    type = 3,
    reward_option = {
      "50841001:10000",
      "50841063:10000",
      "50841163:10000",
      "50841204:10000",
      "50841205:10000"
    },
    speical_reward_option = 50841205
  }
}
