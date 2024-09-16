BaseRogueTalent = {
  [50804101] = {
    id = 50804101,
    group_id = 101,
    name = function()
      return T(80266101)
    end,
    des = function()
      return T(80267101, 10)
    end,
    next = {50804104},
    add_attr = {
      "1:40000103:10"
    },
    cost = {
      "1:21160002:1"
    },
    pos = "A01",
    next_line = {"AL01"},
    type = 0
  },
  [50804102] = {
    id = 50804102,
    group_id = 101,
    name = function()
      return T(80266102)
    end,
    des = function()
      return T(80267102, 10)
    end,
    next = {50804105},
    add_attr = {
      "1:40000104:10"
    },
    cost = {
      "1:21160002:1"
    },
    pos = "A02",
    next_line = {"AL02"},
    type = 1
  },
  [50804103] = {
    id = 50804103,
    group_id = 101,
    name = function()
      return T(80266103)
    end,
    des = function()
      return T(80267103, 100)
    end,
    next = {50804106},
    add_attr = {
      "1:40000102:100"
    },
    cost = {
      "1:21160002:1"
    },
    pos = "A03",
    next_line = {"AL03"},
    type = 2
  },
  [50804104] = {
    id = 50804104,
    group_id = 101,
    name = function()
      return T(80266104)
    end,
    des = function()
      return T(80267104, 10)
    end,
    pre = {50804101},
    next = {50804107},
    add_attr = {
      "2:40000103:1000"
    },
    cost = {
      "1:21160002:1"
    },
    pos = "B01",
    next_line = {"BL01"},
    type = 0
  },
  [50804105] = {
    id = 50804105,
    group_id = 101,
    name = function()
      return T(80266105)
    end,
    des = function()
      return T(80267105, 10)
    end,
    pre = {50804102},
    next = {50804107},
    add_attr = {
      "2:40000104:1000"
    },
    cost = {
      "1:21160002:1"
    },
    pos = "B02",
    next_line = {"BL02"},
    type = 1
  },
  [50804106] = {
    id = 50804106,
    group_id = 101,
    name = function()
      return T(80266106)
    end,
    des = function()
      return T(80267106, 10)
    end,
    pre = {50804103},
    next = {50804107},
    add_attr = {
      "2:40000102:1000"
    },
    cost = {
      "1:21160002:1"
    },
    pos = "B03",
    next_line = {"BL03"},
    type = 2
  },
  [50804107] = {
    id = 50804107,
    group_id = 101,
    name = function()
      return T(80266107)
    end,
    des = function()
      return T(80267107, 100)
    end,
    pre = {
      50804104,
      50804105,
      50804106
    },
    next = {
      50804108,
      50804109,
      50804110
    },
    cost = {
      "1:21160002:2"
    },
    pos = "C01",
    next_line = {
      "CL01",
      "CL02",
      "CL03"
    },
    type = 3,
    function_type = 1,
    function_parameter = "1:21160003:100"
  },
  [50804108] = {
    id = 50804108,
    group_id = 101,
    name = function()
      return T(80266108)
    end,
    des = function()
      return T(80267101, 10)
    end,
    pre = {50804107},
    next = {50804111},
    add_attr = {
      "1:40000103:10"
    },
    cost = {
      "1:21160002:2"
    },
    pos = "D01",
    next_line = {"DL01"},
    type = 0
  },
  [50804109] = {
    id = 50804109,
    group_id = 101,
    name = function()
      return T(80266109)
    end,
    des = function()
      return T(80267102, 10)
    end,
    pre = {50804107},
    next = {50804112},
    add_attr = {
      "1:40000104:10"
    },
    cost = {
      "1:21160002:2"
    },
    pos = "D02",
    next_line = {"DL02"},
    type = 1
  },
  [50804110] = {
    id = 50804110,
    group_id = 101,
    name = function()
      return T(80266110)
    end,
    des = function()
      return T(80267103, 100)
    end,
    pre = {50804107},
    next = {50804113},
    add_attr = {
      "1:40000102:100"
    },
    cost = {
      "1:21160002:2"
    },
    pos = "D03",
    next_line = {"DL03"},
    type = 2
  },
  [50804111] = {
    id = 50804111,
    group_id = 101,
    name = function()
      return T(80266111)
    end,
    des = function()
      return T(80267104, 10)
    end,
    pre = {50804108},
    next = {50804114},
    add_attr = {
      "2:40000103:1000"
    },
    cost = {
      "1:21160002:2"
    },
    pos = "E01",
    next_line = {"EL01"},
    type = 0
  },
  [50804112] = {
    id = 50804112,
    group_id = 101,
    name = function()
      return T(80266112)
    end,
    des = function()
      return T(80267105, 10)
    end,
    pre = {50804109},
    next = {50804114},
    add_attr = {
      "2:40000104:1000"
    },
    cost = {
      "1:21160002:2"
    },
    pos = "E02",
    next_line = {"EL02"},
    type = 1
  },
  [50804113] = {
    id = 50804113,
    group_id = 101,
    name = function()
      return T(80266113)
    end,
    des = function()
      return T(80267106, 10)
    end,
    pre = {50804110},
    next = {50804114},
    add_attr = {
      "2:40000102:1000"
    },
    cost = {
      "1:21160002:2"
    },
    pos = "E03",
    next_line = {"EL03"},
    type = 2
  },
  [50804114] = {
    id = 50804114,
    group_id = 101,
    name = function()
      return T(80266114)
    end,
    des = function()
      return T(80267108)
    end,
    pre = {
      50804111,
      50804112,
      50804113
    },
    next = {
      50804115,
      50804116,
      50804117
    },
    cost = {
      "1:21160002:3"
    },
    pos = "F01",
    next_line = {
      "FL01",
      "FL02",
      "FL03"
    },
    type = 4,
    function_type = 2
  },
  [50804115] = {
    id = 50804115,
    group_id = 101,
    name = function()
      return T(80266115)
    end,
    des = function()
      return T(80267101, 10)
    end,
    pre = {50804114},
    next = {50804118},
    add_attr = {
      "1:40000103:10"
    },
    cost = {
      "1:21160002:3"
    },
    pos = "G01",
    next_line = {"GL01"},
    type = 0
  },
  [50804116] = {
    id = 50804116,
    group_id = 101,
    name = function()
      return T(80266116)
    end,
    des = function()
      return T(80267102, 10)
    end,
    pre = {50804114},
    next = {50804119},
    add_attr = {
      "1:40000104:10"
    },
    cost = {
      "1:21160002:3"
    },
    pos = "G02",
    next_line = {"GL02"},
    type = 1
  },
  [50804117] = {
    id = 50804117,
    group_id = 101,
    name = function()
      return T(80266117)
    end,
    des = function()
      return T(80267103, 100)
    end,
    pre = {50804114},
    next = {50804120},
    add_attr = {
      "1:40000102:100"
    },
    cost = {
      "1:21160002:3"
    },
    pos = "G03",
    next_line = {"GL03"},
    type = 2
  },
  [50804118] = {
    id = 50804118,
    group_id = 101,
    name = function()
      return T(80266118)
    end,
    des = function()
      return T(80267104, 10)
    end,
    pre = {50804115},
    next = {50804121},
    add_attr = {
      "2:40000103:1000"
    },
    cost = {
      "1:21160002:3"
    },
    pos = "H01",
    next_line = {"HL01"},
    type = 0
  },
  [50804119] = {
    id = 50804119,
    group_id = 101,
    name = function()
      return T(80266119)
    end,
    des = function()
      return T(80267105, 10)
    end,
    pre = {50804116},
    next = {50804121},
    add_attr = {
      "2:40000104:1000"
    },
    cost = {
      "1:21160002:3"
    },
    pos = "H02",
    next_line = {"HL02"},
    type = 1
  },
  [50804120] = {
    id = 50804120,
    group_id = 101,
    name = function()
      return T(80266120)
    end,
    des = function()
      return T(80267106, 10)
    end,
    pre = {50804117},
    next = {50804121},
    add_attr = {
      "2:40000102:1000"
    },
    cost = {
      "1:21160002:3"
    },
    pos = "H03",
    next_line = {"HL03"},
    type = 2
  },
  [50804121] = {
    id = 50804121,
    group_id = 101,
    name = function()
      return T(80266121)
    end,
    des = function()
      return T(80267110, 20)
    end,
    pre = {
      50804118,
      50804119,
      50804120
    },
    next = {
      50804122,
      50804123,
      50804124
    },
    cost = {
      "1:21160002:4"
    },
    pos = "I01",
    next_line = {
      "IL01",
      "IL02",
      "IL03"
    },
    type = 5,
    function_type = 1,
    function_parameter = "1:21160004:20"
  },
  [50804122] = {
    id = 50804122,
    group_id = 101,
    name = function()
      return T(80266122)
    end,
    des = function()
      return T(80267101, 10)
    end,
    pre = {50804121},
    next = {50804125},
    add_attr = {
      "1:40000103:10"
    },
    cost = {
      "1:21160002:4"
    },
    pos = "J01",
    next_line = {"JL01"},
    type = 0
  },
  [50804123] = {
    id = 50804123,
    group_id = 101,
    name = function()
      return T(80266123)
    end,
    des = function()
      return T(80267102, 10)
    end,
    pre = {50804121},
    next = {50804126},
    add_attr = {
      "1:40000104:10"
    },
    cost = {
      "1:21160002:4"
    },
    pos = "J02",
    next_line = {"JL02"},
    type = 1
  },
  [50804124] = {
    id = 50804124,
    group_id = 101,
    name = function()
      return T(80266124)
    end,
    des = function()
      return T(80267103, 100)
    end,
    pre = {50804121},
    next = {50804127},
    add_attr = {
      "1:40000102:100"
    },
    cost = {
      "1:21160002:4"
    },
    pos = "J03",
    next_line = {"JL03"},
    type = 2
  },
  [50804125] = {
    id = 50804125,
    group_id = 101,
    name = function()
      return T(80266125)
    end,
    des = function()
      return T(80267104, 10)
    end,
    pre = {50804122},
    next = {50804128},
    add_attr = {
      "2:40000103:1000"
    },
    cost = {
      "1:21160002:4"
    },
    pos = "K01",
    next_line = {"KL01"},
    type = 0
  },
  [50804126] = {
    id = 50804126,
    group_id = 101,
    name = function()
      return T(80266126)
    end,
    des = function()
      return T(80267105, 10)
    end,
    pre = {50804123},
    next = {50804128},
    add_attr = {
      "2:40000104:1000"
    },
    cost = {
      "1:21160002:4"
    },
    pos = "K02",
    next_line = {"KL02"},
    type = 1
  },
  [50804127] = {
    id = 50804127,
    group_id = 101,
    name = function()
      return T(80266127)
    end,
    des = function()
      return T(80267106, 10)
    end,
    pre = {50804124},
    next = {50804128},
    add_attr = {
      "2:40000102:1000"
    },
    cost = {
      "1:21160002:4"
    },
    pos = "K03",
    next_line = {"KL03"},
    type = 2
  },
  [50804128] = {
    id = 50804128,
    group_id = 101,
    name = function()
      return T(80266128)
    end,
    des = function()
      return T(80267109)
    end,
    pre = {
      50804125,
      50804126,
      50804127
    },
    cost = {
      "1:21160002:5"
    },
    pos = "L01",
    type = 6,
    function_type = 3
  }
}
