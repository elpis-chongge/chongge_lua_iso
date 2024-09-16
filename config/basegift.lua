BaseGift = {
  [27000000] = {
    id = 27000000,
    type = 4,
    gift_reward_ids = {27100001, 27100002},
    condition = {"70020100:1"},
    sell_limit_type = 4,
    sell_limit_max = 1
  },
  [27000100] = {
    id = 27000100,
    type = 1,
    gift_reward_ids = {
      27100101,
      27100102,
      27100103
    },
    condition = {"70020100:1"},
    sell_limit_type = 4,
    sell_limit_max = 1,
    banner_group = 11
  },
  [27000301] = {
    id = 27000301,
    type = 2,
    cost = {
      "1:21000002:0"
    },
    condition = {"70020100:1"},
    rewards = {
      "1:21000001:120",
      "1:21000003:5000",
      "1:21010001:5000",
      "1:21000201:100"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 1)
    end,
    icon = "ShopPic:ShopGift_1001_01",
    sort = 10,
    banner_group = 1,
    next = 27000302,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000302] = {
    id = 27000302,
    type = 2,
    cost = {
      "1:21000002:2"
    },
    pre = 27000301,
    condition = {"70020100:5"},
    rewards = {
      "1:21000001:240",
      "1:21000003:7500",
      "1:21010001:7500",
      "1:21000201:100"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 5)
    end,
    icon = "ShopPic:ShopGift_1001_05",
    sort = 10,
    banner_group = 1,
    next = 27000303,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000303] = {
    id = 27000303,
    type = 2,
    cost = {
      "1:21000002:4"
    },
    pre = 27000302,
    condition = {
      "70020100:10"
    },
    rewards = {
      "1:21000001:480",
      "1:21000003:10000",
      "1:21010001:10000",
      "1:21000201:100"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 10)
    end,
    icon = "ShopPic:ShopGift_1001_10",
    sort = 10,
    banner_group = 1,
    next = 27000304,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000304] = {
    id = 27000304,
    type = 2,
    cost = {
      "1:21000002:6"
    },
    pre = 27000303,
    condition = {
      "70020100:15"
    },
    rewards = {
      "1:21000001:720",
      "1:21000003:15000",
      "1:21010001:15000",
      "1:21000201:150"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 15)
    end,
    icon = "ShopPic:ShopGift_1001_15",
    sort = 10,
    banner_group = 1,
    next = 27000305,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000305] = {
    id = 27000305,
    type = 2,
    cost = {
      "1:21000002:8"
    },
    pre = 27000304,
    condition = {
      "70020100:20"
    },
    rewards = {
      "1:21000001:960",
      "1:21000003:20000",
      "1:21010001:20000",
      "1:21000201:150"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 20)
    end,
    icon = "ShopPic:ShopGift_1001_20",
    sort = 10,
    banner_group = 1,
    next = 27000306,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000306] = {
    id = 27000306,
    type = 2,
    cost = {
      "1:21000002:10"
    },
    pre = 27000305,
    condition = {
      "70020100:25"
    },
    rewards = {
      "1:21000001:1200",
      "1:21000003:25000",
      "1:21010001:25000",
      "1:21000201:150"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 25)
    end,
    icon = "ShopPic:ShopGift_1001_25",
    sort = 10,
    banner_group = 1,
    next = 27000307,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000307] = {
    id = 27000307,
    type = 2,
    cost = {
      "1:21000002:12"
    },
    pre = 27000306,
    condition = {
      "70020100:30"
    },
    rewards = {
      "1:21000001:1440",
      "1:21000003:30000",
      "1:21010001:30000",
      "1:21000201:200"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 30)
    end,
    icon = "ShopPic:ShopGift_1001_30",
    sort = 10,
    banner_group = 1,
    next = 27000308,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000308] = {
    id = 27000308,
    type = 2,
    cost = {
      "1:21000002:14"
    },
    pre = 27000307,
    condition = {
      "70020100:35"
    },
    rewards = {
      "1:21000001:1680",
      "1:21000003:35000",
      "1:21010001:35000",
      "1:21000201:200"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 35)
    end,
    icon = "ShopPic:ShopGift_1001_35",
    sort = 10,
    banner_group = 1,
    next = 27000309,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000309] = {
    id = 27000309,
    type = 2,
    cost = {
      "1:21000002:16"
    },
    pre = 27000308,
    condition = {
      "70020100:40"
    },
    rewards = {
      "1:21000001:1920",
      "1:21000003:40000",
      "1:21010001:40000",
      "1:21000201:250"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 40)
    end,
    icon = "ShopPic:ShopGift_1001_40",
    sort = 10,
    banner_group = 1,
    next = 27000310,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000310] = {
    id = 27000310,
    type = 2,
    cost = {
      "1:21000002:18"
    },
    pre = 27000309,
    condition = {
      "70020100:45"
    },
    rewards = {
      "1:21000001:2160",
      "1:21000003:50000",
      "1:21010001:50000",
      "1:21000201:250"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 45)
    end,
    icon = "ShopPic:ShopGift_1001_45",
    sort = 10,
    banner_group = 1,
    next = 27000311,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000311] = {
    id = 27000311,
    type = 2,
    cost = {
      "1:21000002:20"
    },
    pre = 27000310,
    condition = {
      "70020100:50"
    },
    rewards = {
      "1:21000001:2400",
      "1:21000003:60000",
      "1:21010001:60000",
      "1:21000201:350"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 50)
    end,
    icon = "ShopPic:ShopGift_1001_50",
    sort = 10,
    banner_group = 1,
    next = 27000312,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000312] = {
    id = 27000312,
    type = 2,
    cost = {
      "1:21000002:22"
    },
    pre = 27000311,
    condition = {
      "70020100:50"
    },
    rewards = {
      "1:21000001:2640",
      "1:21000003:70000",
      "1:21010001:70000",
      "1:21000201:350"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 50)
    end,
    icon = "ShopPic:ShopGift_1001_50",
    sort = 10,
    banner_group = 1,
    next = 27000313,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000313] = {
    id = 27000313,
    type = 2,
    cost = {
      "1:21000002:24"
    },
    pre = 27000312,
    condition = {
      "70020100:50"
    },
    rewards = {
      "1:21000001:2880",
      "1:21000003:80000",
      "1:21010001:80000",
      "1:21000201:400"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617003, 50)
    end,
    icon = "ShopPic:ShopGift_1001_50",
    sort = 10,
    banner_group = 1,
    group_id = 201,
    quality = 0,
    not_show_red = 1
  },
  [27000401] = {
    id = 27000401,
    type = 2,
    condition = {"70020100:1"},
    rewards = {
      "1:21000003:2000",
      "1:21010001:2000",
      "1:21010101:20"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 1)
    end,
    icon = "ShopPic:ShopGift_1000_01",
    sort = 9,
    banner_group = 1,
    next = 27000402,
    group_id = 202,
    quality = 0
  },
  [27000402] = {
    id = 27000402,
    type = 2,
    pre = 27000401,
    condition = {"70020100:3"},
    rewards = {
      "1:21000003:3500",
      "1:21010001:3500",
      "1:21010101:30"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 3)
    end,
    icon = "ShopPic:ShopGift_1000_03",
    sort = 9,
    banner_group = 1,
    next = 27000403,
    group_id = 202,
    quality = 0
  },
  [27000403] = {
    id = 27000403,
    type = 2,
    pre = 27000402,
    condition = {"70020100:7"},
    rewards = {
      "1:21000003:5000",
      "1:21010001:5000",
      "1:21010101:40"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 7)
    end,
    icon = "ShopPic:ShopGift_1000_07",
    sort = 9,
    banner_group = 1,
    next = 27000404,
    group_id = 202,
    quality = 0
  },
  [27000404] = {
    id = 27000404,
    type = 2,
    pre = 27000403,
    condition = {
      "70020100:11"
    },
    rewards = {
      "1:21000003:6500",
      "1:21010001:6500",
      "1:21010101:50"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 11)
    end,
    icon = "ShopPic:ShopGift_1000_11",
    sort = 9,
    banner_group = 1,
    next = 27000405,
    group_id = 202,
    quality = 0
  },
  [27000405] = {
    id = 27000405,
    type = 2,
    pre = 27000404,
    condition = {
      "70020100:15"
    },
    rewards = {
      "1:21000003:8000",
      "1:21010001:8000",
      "1:21010101:60"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 15)
    end,
    icon = "ShopPic:ShopGift_1000_15",
    sort = 9,
    banner_group = 1,
    next = 27000406,
    group_id = 202,
    quality = 0
  },
  [27000406] = {
    id = 27000406,
    type = 2,
    pre = 27000405,
    condition = {
      "70020100:19"
    },
    rewards = {
      "1:21000003:10000",
      "1:21010001:10000",
      "1:21010101:70"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 19)
    end,
    icon = "ShopPic:ShopGift_1000_19",
    sort = 9,
    banner_group = 1,
    next = 27000407,
    group_id = 202,
    quality = 0
  },
  [27000407] = {
    id = 27000407,
    type = 2,
    pre = 27000406,
    condition = {
      "70020100:23"
    },
    rewards = {
      "1:21000003:12000",
      "1:21010001:12000",
      "1:21010101:80"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 23)
    end,
    icon = "ShopPic:ShopGift_1000_23",
    sort = 9,
    banner_group = 1,
    next = 27000408,
    group_id = 202,
    quality = 0
  },
  [27000408] = {
    id = 27000408,
    type = 2,
    pre = 27000407,
    condition = {
      "70020100:27"
    },
    rewards = {
      "1:21000003:14000",
      "1:21010001:14000",
      "1:21010101:90"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 27)
    end,
    icon = "ShopPic:ShopGift_1000_27",
    sort = 9,
    banner_group = 1,
    next = 27000409,
    group_id = 202,
    quality = 0
  },
  [27000409] = {
    id = 27000409,
    type = 2,
    pre = 27000408,
    condition = {
      "70020100:31"
    },
    rewards = {
      "1:21000003:16000",
      "1:21010001:16000",
      "1:21010101:100"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 31)
    end,
    icon = "ShopPic:ShopGift_1000_31",
    sort = 9,
    banner_group = 1,
    next = 27000410,
    group_id = 202,
    quality = 0
  },
  [27000410] = {
    id = 27000410,
    type = 2,
    pre = 27000409,
    condition = {
      "70020100:35"
    },
    rewards = {
      "1:21000003:18000",
      "1:21010001:18000",
      "1:21010101:110"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 35)
    end,
    icon = "ShopPic:ShopGift_1000_35",
    sort = 9,
    banner_group = 1,
    next = 27000411,
    group_id = 202,
    quality = 0
  },
  [27000411] = {
    id = 27000411,
    type = 2,
    pre = 27000410,
    condition = {
      "70020100:39"
    },
    rewards = {
      "1:21000003:20000",
      "1:21010001:20000",
      "1:21010101:120"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 39)
    end,
    icon = "ShopPic:ShopGift_1000_39",
    sort = 9,
    banner_group = 1,
    next = 27000412,
    group_id = 202,
    quality = 0
  },
  [27000412] = {
    id = 27000412,
    type = 2,
    pre = 27000411,
    condition = {
      "70020100:43"
    },
    rewards = {
      "1:21000003:22000",
      "1:21010001:22000",
      "1:21010101:130"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 43)
    end,
    icon = "ShopPic:ShopGift_1000_43",
    sort = 9,
    banner_group = 1,
    next = 27000413,
    group_id = 202,
    quality = 0
  },
  [27000413] = {
    id = 27000413,
    type = 2,
    pre = 27000412,
    condition = {
      "70020100:47"
    },
    rewards = {
      "1:21000003:24000",
      "1:21010001:24000",
      "1:21010101:140"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 47)
    end,
    icon = "ShopPic:ShopGift_1000_47",
    sort = 9,
    banner_group = 1,
    next = 27000414,
    group_id = 202,
    quality = 0
  },
  [27000414] = {
    id = 27000414,
    type = 2,
    pre = 27000413,
    condition = {
      "70020100:51"
    },
    rewards = {
      "1:21000003:26000",
      "1:21010001:26000",
      "1:21010101:150"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 51)
    end,
    icon = "ShopPic:ShopGift_1000_51",
    sort = 9,
    banner_group = 1,
    next = 27000415,
    group_id = 202,
    quality = 0
  },
  [27000415] = {
    id = 27000415,
    type = 2,
    pre = 27000414,
    condition = {
      "70020100:55"
    },
    rewards = {
      "1:21000003:28000",
      "1:21010001:28000",
      "1:21010101:160"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 55)
    end,
    icon = "ShopPic:ShopGift_1000_55",
    sort = 9,
    banner_group = 1,
    next = 27000416,
    group_id = 202,
    quality = 0
  },
  [27000416] = {
    id = 27000416,
    type = 2,
    pre = 27000415,
    condition = {
      "70020100:59"
    },
    rewards = {
      "1:21000003:30000",
      "1:21010001:30000",
      "1:21010101:170"
    },
    sell_limit_type = 4,
    sell_limit_max = 1,
    name = function()
      return T(80617004, 59)
    end,
    icon = "ShopPic:ShopGift_1000_59",
    sort = 9,
    banner_group = 1,
    group_id = 202,
    quality = 0
  },
  [27000501] = {
    id = 27000501,
    type = 3,
    gift_reward_ids = {
      27100501,
      27100502,
      27100503,
      27100504,
      27100505,
      27100506,
      27100507,
      27100508,
      27100509,
      27100510,
      27100511,
      27100512,
      27100513,
      27100514,
      27100515,
      27100516,
      27100517,
      27100518,
      27100519,
      27100520,
      27100521,
      27100522,
      27100523,
      27100524,
      27100525,
      27100526,
      27100527,
      27100528,
      27100529,
      27100530,
      27100531,
      27100532,
      27100533,
      27100534,
      27100535,
      27100536,
      27100537,
      27100538,
      27100539,
      27100540,
      27100541,
      27100542,
      27100543,
      27100544,
      27100545,
      27100546,
      27100547,
      27100548,
      27100549,
      27100550,
      27100551,
      27100552,
      27100553,
      27100554,
      27100555,
      27100556,
      27100557,
      27100558,
      27100559,
      27100560
    },
    condition = {"70020100:1"},
    sell_limit_type = 4,
    sell_limit_max = 1
  },
  [27000502] = {
    id = 27000502,
    type = 2,
    condition = {"70020100:1"},
    rewards = {
      "1:21000001:20"
    },
    sell_limit_type = 1,
    sell_limit_max = 1,
    name = function()
      return T(80617005)
    end,
    icon = "ShopPic:ShopGift_1006",
    sort = 10,
    banner_group = 2,
    group_id = 203,
    quality = 0,
    spd = "ShopGift_1006.prefab"
  }
}
