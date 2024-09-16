BaseRogueDifficulty = {
  [50803100] = {
    id = 50803100,
    group_id = 101,
    name = function()
      return T(80264101)
    end,
    des = function()
      return T(80265101)
    end,
    level = 0,
    next = 50803101,
    unlock = 1,
    buff_list = {
      46603001,
      46603002,
      46603003
    },
    score_ratio = 5000,
    show_type = 0,
    monster_attribute = {
      "2:40000103:10000",
      "2:40000104:10000",
      "2:40000102:10000"
    }
  },
  [50803101] = {
    id = 50803101,
    group_id = 101,
    name = function()
      return T(80264102)
    end,
    des = function()
      return T(80265102)
    end,
    level = 1,
    pre = 50803100,
    next = 50803102,
    unlock = 1,
    score_ratio = 10000,
    show_type = 0
  },
  [50803102] = {
    id = 50803102,
    group_id = 101,
    name = function()
      return T(80264103)
    end,
    des = function()
      return T(80265103)
    end,
    level = 2,
    pre = 50803101,
    next = 50803103,
    buff_list = {46603021, 46603022},
    score_ratio = 12000,
    show_type = 1,
    monster_attribute = {
      "2:40000103:15000",
      "2:40000104:15000",
      "2:40000102:15000"
    }
  },
  [50803103] = {
    id = 50803103,
    group_id = 101,
    name = function()
      return T(80264104)
    end,
    des = function()
      return T(80265104)
    end,
    level = 3,
    pre = 50803102,
    next = 50803104,
    buff_list = {
      46603031,
      46603032,
      46603033
    },
    score_ratio = 14000,
    show_type = 1,
    monster_attribute = {
      "2:40000103:20000",
      "2:40000104:20000",
      "2:40000102:20000"
    }
  },
  [50803104] = {
    id = 50803104,
    group_id = 101,
    name = function()
      return T(80264105)
    end,
    des = function()
      return T(80265105)
    end,
    level = 4,
    pre = 50803103,
    next = 50803105,
    buff_list = {
      46603041,
      46603045,
      46603042,
      46603043,
      46603044
    },
    score_ratio = 16000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:30000",
      "2:40000104:30000",
      "2:40000102:30000"
    },
    boss_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  },
  [50803105] = {
    id = 50803105,
    group_id = 101,
    name = function()
      return T(80264106)
    end,
    des = function()
      return T(80265106)
    end,
    level = 5,
    pre = 50803104,
    next = 50803106,
    buff_list = {
      46603051,
      46603052,
      46603053,
      46603054,
      46603055,
      46603056
    },
    score_ratio = 18000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:50000",
      "2:40000104:50000",
      "2:40000102:50000"
    },
    boss_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  },
  [50803106] = {
    id = 50803106,
    group_id = 101,
    name = function()
      return T(80264107)
    end,
    des = function()
      return T(80265107)
    end,
    level = 6,
    pre = 50803105,
    buff_list = {
      46603061,
      46603062,
      46603063,
      46603064,
      46603065,
      46603066,
      46603067
    },
    score_ratio = 20000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:70000",
      "2:40000104:70000",
      "2:40000102:70000"
    },
    boss_monster_attribute = {
      "2:40000103:30000",
      "2:40000102:30000"
    },
    encounter_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  }
}
